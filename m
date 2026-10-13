Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF151DE15;
	Tue, 13 Oct 2026 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910237; cv=none; b=ZBRERfLS1gdfIGsVnG09v9jUQhW3N1cCF3OIRRub09eoTa1E8W4v4T74x1xNMpO8iVPyTGpBmN+a89yIA9+TG31uSyAt7x1pyFVTIG0t9ZmHh4fMY4ucR+KH8wXALwuZJEY3yUFk83uX6gSCfuEfOwZxJonmmNFSyU2WwTSavKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910237; c=relaxed/simple;
	bh=Bse3v3aUReRKkjZOVkof+Rdh5eQLC+3BQAjNGbp2Qa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nuaKxYpSBx7FvWiGeHwFq7o8BLzw1ZRMxCBphoYOfQCr7f6jLxKshrkAf3EFHI6IDle2r6WP1TVLGyBYJWGDSRj+Sv+8dn/DfsgEqVgx1NV3HNanztcGOa2kQc+dpDdKBTZjFiTe+uDWDdhVdOnlxN27xYRJrIEyg8hl/hHXDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=N+CP4Rpn; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="N+CP4Rpn"
X-Virus-Scanned: by amavisd-new using ClamAV (15)
X-Spam-Flag: NO
X-Spam-Score: 3.474
X-Spam-Level: ***
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1791909783;
	bh=6DGDy3S1nheW0M1w5J8nM3L5079YPGJJ2rrmIz0yFo4=;
	h=From:To:Cc:Subject:Date;
	b=N+CP4RpntsGsuMyZlx96/6F2RsK2dL5ne6Z6EXgd7Ne1vugfDnkkbztzVoqWZiDrg
	 UESOpgkJiIPQ/ctBOqQiySEEU7BZUDdAtDSU2ckuyodlNfSAMBTJsIvWxnpBpkVOIo
	 BPMnZ5iveCebFJoc8KRGHViG5onyutx5aQdWncz8/NqHHfMOJDwm35IgYpJ+66mzXk
	 5Re9HYcvpshjPXTjrnRBt5h9YA+OhyeqVNuH42Quwfo9hj9+IupTHRnPfqz8AfhBXN
	 mpivPgl1LgGGVCdMjpx69FyIMCzRjwFonFmHF15f6lku+L6KRzmi4LFP09WL0NMx2T
	 4Cl4wsfOE+pBg==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id CBCF41BDDE7;
	Tue, 13 Oct 2026 18:43:03 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH] ALSA: pcm: Fix driver_tstamp value reporting
Date: Tue, 13 Oct 2026 18:42:56 +0200
Message-ID: <20261013164256.4949-1-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In some cases (system32 and compat64) due to incorrect assignment wrong
value is being reported. Fix it.

Fixes: 3ddee7f88aaf ("ALSA: Avoid using timespec for struct snd_pcm_status")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/core/pcm_compat.c | 4 ++--
 sound/core/pcm_native.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 55ecf87586c4..359197aa6076 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -219,8 +219,8 @@ static int snd_pcm_status_user_compat64(struct snd_pcm_substream *substream,
 		.audio_tstamp_data = status.audio_tstamp_data,
 		.audio_tstamp_sec = status.audio_tstamp_sec,
 		.audio_tstamp_nsec = status.audio_tstamp_nsec,
-		.driver_tstamp_sec = status.audio_tstamp_sec,
-		.driver_tstamp_nsec = status.audio_tstamp_nsec,
+		.driver_tstamp_sec = status.driver_tstamp_sec,
+		.driver_tstamp_nsec = status.driver_tstamp_nsec,
 		.audio_tstamp_accuracy = status.audio_tstamp_accuracy,
 	};
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f774358629bb..fcd3594e4bdf 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1206,8 +1206,8 @@ static int snd_pcm_status_user32(struct snd_pcm_substream *substream,
 		.audio_tstamp_data = status64.audio_tstamp_data,
 		.audio_tstamp_sec = status64.audio_tstamp_sec,
 		.audio_tstamp_nsec = status64.audio_tstamp_nsec,
-		.driver_tstamp_sec = status64.audio_tstamp_sec,
-		.driver_tstamp_nsec = status64.audio_tstamp_nsec,
+		.driver_tstamp_sec = status64.driver_tstamp_sec,
+		.driver_tstamp_nsec = status64.driver_tstamp_nsec,
 		.audio_tstamp_accuracy = status64.audio_tstamp_accuracy,
 	};
 
-- 
2.56.0

