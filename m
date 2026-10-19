Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430817;
	b=MLLqNhP5w3sW8WD+w3co1Vca+pn25i2fmQHbG8DcjVwMe/32TUww6v87FM/CcxqdLjk/
	 iRaaIGlJnOIFWJSLpT1kE2lRggcvA1FoXSvofg2fi4fZFdf3w95Hniv4Q7X/5A8CTcLqC
	 NN41kQv3uIVd9yav2z12W857qlZc58UNczUPuwJWRQySRYxoBVNPOLreM8Mytsl2fgMy8
	 MY+sj/NTTofBNaQszgu9NzQXhpbZVwwiJkexow+GN4vjUa6SDCHtr8wE96+myc9DPtxgg
	 bwxiCHbo1P6TNoUWgHoBqDti8jtKfyLTKjnFAEGHoqRKC+61qynsdfUQBTpuCcyIAUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430817;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eG6C1F14XhCkCFW888/UcbNcHGIr0734ei12Lk3Nsso=;
	b=O91OIL1WzOPhjEulw2w2SWYVQnnN08WpY/VgBhJctIHFIXjyBC2Ix15g/d4vRaVYe+bF
	 p9sCBhfh1dYvyWX4Skg6kdpv9Qh+m4Dv8FcE/gt3rMtSV+P6wDIohLg0V4r1qZmxRP2JQ
	 De//e6GVQifwEt85P0voOHbb6v3KiFiYhY9ki77NDd4EJjY2OojR8sBO11GRzkc+WEE5U
	 Yz35ojTay+nJ807P3lxbADkXguR7nIWURRxqzJ8+38frQwxwHBv9fDlGishjKJsrVTR0R
	 8OOHJC3eNMu2hvwA06sC9nbf/2BA2eaiF9Y6Nf8kc+VwsA3q5YLPr0Qqo86FAgcHV8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419D4606A319;
	Mon, 19 Oct 2026 17:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 419D4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
X-Virus-Scanned: by amavisd-new using ClamAV (8)
X-Spam-Flag: NO
X-Spam-Score: 4.474
X-Spam-Level: ****
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792430807;
	bh=eG6C1F14XhCkCFW888/UcbNcHGIr0734ei12Lk3Nsso=;
	h=From:To:Cc:Subject:Date;
	b=H5J3r3ophx60Y9G6ik6ZlSqBZXkh6tPeXSD/f6A5WRkgpx6FBBg/tmZgUCytcLPWr
	 LMtjNcp79/LcpJN97lnHi2xafw5QtDx4cmRL7jUtk+whZ/ur+8RV8XnBM+PfrwUsbv
	 wwL3z3pogaRGcBxcltX6acVR5zddacftMEbA3W2HMAz+EG7mx3QBy+lKenEtavXupS
	 n9OQ5EyRA9oIARSHaDTcN/kMwrPwFllIUScr0838tAqamINlME4+T1sVZC59VS1Oei
	 Dnia81I/vEIQgTzR9SqwIvOgtJnG1+1bPNHSvnIw7v1YpGufu8eAV4hjw0/Mxr63uh
	 iLzZ+BiNIPKXA==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 0FBFF1BC08D;
	Mon, 19 Oct 2026 19:26:47 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] ASoC: soc-dapm: Remove overzealous check
Date: Mon, 19 Oct 2026 19:26:40 +0200
Message-ID: <20261019172640.64989-1-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Widget is always constructed with dapm context, so this check is
superfluous and it also leads to warning from kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202610180339.A6POXeNa-lkp@intel.com/
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-dapm.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7455160b11fe..eff6103cb21b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2890,20 +2890,18 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 
 	dapm_debugfs_free_widget(w);
 
-	if (w->dapm) {
-		if (w->dapm->card) {
-			for_each_card_dapms(w->dapm->card, d) {
-				if (d->wcache_sink == w)
-					d->wcache_sink = NULL;
-				if (d->wcache_source == w)
-					d->wcache_source = NULL;
-			}
-		} else {
-			if (w->dapm->wcache_sink == w)
-				w->dapm->wcache_sink = NULL;
-			if (w->dapm->wcache_source == w)
-				w->dapm->wcache_source = NULL;
+	if (w->dapm->card) {
+		for_each_card_dapms(w->dapm->card, d) {
+			if (d->wcache_sink == w)
+				d->wcache_sink = NULL;
+			if (d->wcache_source == w)
+				d->wcache_source = NULL;
 		}
+	} else {
+		if (w->dapm->wcache_sink == w)
+			w->dapm->wcache_sink = NULL;
+		if (w->dapm->wcache_source == w)
+			w->dapm->wcache_source = NULL;
 	}
 
 	kfree(w->kcontrols);
-- 
2.56.0

