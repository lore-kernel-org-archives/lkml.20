Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA984BD34C;
	Mon, 12 Oct 2026 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822544; cv=none; b=pUyrnSVkK0v7sImEgkfMy58+XMLhH9X61I0NtDQs+3kcOgiflGAukRoXLHPeZDQyqJOWKoPPRPEIufSnqsCCFd8bhH5YEl3pE79D1rKMqH+BBjKatv4/+DK4BiuaQpRq0FfoHqo4xh65/QI92OHmUIORmjROAfe0KbMxBMzhDFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822544; c=relaxed/simple;
	bh=esTMqmbwhj2CtMLJUNJ/sqpdo4Mo4FBo8a/ok0ohxhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sfhbDBdlylT7dpJG97QfPPcVY+ftiE+UL8cUleMQzo8ujBRjOoU4mV12c8tXrFNCxObi3rQhMpsQJHO6dGoiX3uem5Numw4PwOl6fzARrHQ8X65m+RBvZC0rPuoXlBENPUFG2yOfSM8onn7FdI2CeOsepyD4on5XujbGsS0dzJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OybNXFyA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OybNXFyA"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DB96780C9E;
	Mon, 12 Oct 2026 18:28:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfuX0GByuct6; Mon, 12 Oct 2026 18:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791822533; bh=esTMqmbwhj2CtMLJUNJ/sqpdo4Mo4FBo8a/ok0ohxhg=;
	h=From:To:Cc:Subject:Date;
	b=OybNXFyALSORns7m9QHuh6gu0VsSJIWJAhNweaimRZg0IG51iH+vZF/5xJudGPXRi
	 zNdoFo/H0AZ3knU5IrY/nVCU4rq0fdxSgi/dK8RtsD+86BfT6QUylyevtjVoqwasl7
	 sZS+sGM8z388dckK2rwz/lGvT0p5DpSz3+USK88SfXEvhdcpMfMvn3XDVyffDf3zss
	 1PoXjpWqjOlaEEiRVg5HT9nBqxUzK3VBXByvm+4N+NbLjsXPe+GiQigf8pItql2NAr
	 9/Zkc9XTChOFzZ9zN3j4vNhCovZoV8LgEv96/ItzsaxGT0f9Dt4+afNbXcSnuNkQyz
	 ckwdcwjl0MxSw==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: [PATCH v2] ALSA: hda: intel: Don't free card in the probe work
Date: Mon, 12 Oct 2026 19:28:16 +0300
Message-ID: <20261012162841.1879278-1-aliamemis@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the delayed probe fails, azx_probe_work() frees the card and clears
the drvdata. azx_remove() reads the card before it waits for the probe
work with cancel_delayed_work_sync() so when the device is removed while
the probe work is running, it frees the card again after the work has
already freed it.

Only disconnect the card in the work so that its slot is released right
away and leave freeing it to azx_remove().

Fixes: 39173303c838 ("ALSA: hda: Free card instance properly at probe errors")
Reported-by: syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=40b06a86af225236fdb4
Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
---
v2: disconnect the card in the work so that the slot is released (Takashi)
v1: https://lore.kernel.org/all/20261011200648.1662935-1-aliamemis@disroot.org/

 sound/hda/controllers/intel.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 2b5b5d555f2c..6b80b59b8743 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1737,7 +1737,12 @@ static void azx_check_snoop_available(struct azx *chip)
 static void azx_probe_work(struct work_struct *work)
 {
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
-	azx_probe_continue(&hda->chip, true);
+
+	if (azx_probe_continue(&hda->chip, false) < 0) {
+		hda->init_failed = 1;
+		complete_all(&hda->probe_wait);
+		snd_card_disconnect(hda->chip.card);
+	}
 }
 
 static int default_bdl_pos_adj(struct azx *chip)
-- 
2.55.0

