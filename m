Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8890315D49;
	Sun, 11 Oct 2026 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749225; cv=none; b=ggUVVXMqZd0h0wQIdyBVDRCP6VPir+CWGu+b5uSF70x5GueY68VmFWSKyobZQu9DbqSrMNY0gB3wv94rwJ2R4gxNiF4VOMhuD+tm++N4YGnBb+F7d2M4w8F+SQrHjQguHC2R1zHipA58u8yvYQSoyqfs2iCiX1paJhybQjp/rVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749225; c=relaxed/simple;
	bh=IMZper1yEhI1H5tcHfrLf2vTr+csqD4dMEJJg2h7S14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HOrrrkcsuduUKJ8FsnRGULM0C09UNp1yYekPx7C1oHXgUpGyqf6+K2JlxqJ5nCyNDTsIjHOZllpdUXT7WydzKw6/XwRK/4CJwMZct6i2ntVT8suuRsjw8oHdowzS8Sk7hcdod/Tm5JTWuPYBSbN+WSobiCvmVsLW528cQgsw6G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Zio5EWLK; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Zio5EWLK"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D38B5806C5;
	Sun, 11 Oct 2026 22:06:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UF4C72F5--Gn; Sun, 11 Oct 2026 22:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791749218; bh=IMZper1yEhI1H5tcHfrLf2vTr+csqD4dMEJJg2h7S14=;
	h=From:To:Cc:Subject:Date;
	b=Zio5EWLK9wj+HuOhE+X/hyljnY+aEnRz1JeKc7IP2KcV2JYkQTo9fnKxsaDzsX2nV
	 Kxi2hn9j9Qrb7VIwYFB2geShh2fJQD/V9/tWQNZH4dHdeOUTf/FuIL8h0MEkBUcJ5o
	 eW6d56lEaumvUlEVmvhZ1VIVCz2bfT8zuhhjQ+FjHgDeXUZKmjW/OFyBh9+cgDefi+
	 iYYXz+aExHMXbj6bRlfmpzkw9lUn58gBaH5vP70VhvaCKwyxMxsKabGyBXM5iNCk3g
	 Y9xfJudBQc1LtGy4nE7go+B6pFXmQzRaUoJSFzbKm7abXQpmbbgdU+mlyqlsZuAwO1
	 YRyPkCh0Um6Ow==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: hda: intel: Don't free card in the probe work
Date: Sun, 11 Oct 2026 23:06:27 +0300
Message-ID: <20261011200648.1662935-1-aliamemis@disroot.org>
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

Leave the card to azx_remove() and only mark the probe as failed in the
work as is done in the vga_switcheroo path.

Fixes: 39173303c838 ("ALSA: hda: Free card instance properly at probe errors")
Reported-by: syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=40b06a86af225236fdb4
Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
---
With this, azx_probe_continue() is always called with free_on_error
false.  So the parameter is no longer needed.  I can drop it in v2 in
the same commit if that would be OK.

 sound/hda/controllers/intel.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 2b5b5d555f2c..5db3d37f93fe 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1737,7 +1737,11 @@ static void azx_check_snoop_available(struct azx *chip)
 static void azx_probe_work(struct work_struct *work)
 {
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
-	azx_probe_continue(&hda->chip, true);
+
+	if (azx_probe_continue(&hda->chip, false) < 0) {
+		hda->init_failed = 1;
+		complete_all(&hda->probe_wait);
+	}
 }
 
 static int default_bdl_pos_adj(struct azx *chip)
-- 
2.55.0

