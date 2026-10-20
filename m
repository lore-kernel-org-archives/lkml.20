Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491528;
	b=vL5xdTR9IGYfVpzWKidR8DO/ZgEuCFVhy4OKs4sKS43FbiVDNI8ikqRmj2wHHh4ynqOe
	 tbHqyTXvyIZfK5JGVFTsr/T1YMQj2ourgZKnU9XGOATNeBf8bb9BWY2hOYYIQxoe40JEG
	 ynd5es+Pu9yRX6fKCZVJupuZrdFD7woiVlSRIheYX+VH4VMpfl7dz9VTxdcDHbmPEoy9y
	 KpoKJVDVyUlKYvNwsSSXZLFWA8pz42/o8+lwr215/fB4+4mcAB/1oT8Gk5u0yInPS2krg
	 5PgUr17uJFFYAZ/2GhWkoxK/e6uTujTPfmlr9TA/2DGw6cP5O8VffHi3f604sCzPaAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
	b=ev5cACEsy1vS1E5xIP+drgiG0OvD817DesWM4Jt5VFbmXEknwfJ2zXeH+J3ZcJ9KUVxY
	 OdzZrquBYx3OexTtMZyrs8R8zlr3Uw6TbSMDyvQadY5Kle3UzNUAuxl9bksBV4h7bHBo4
	 PhvJ+lD/RhSazuBaoZgbOWrpEuj3BS58VRsRByU11DUGn9ZuiZiiACN6X67kmA0YYg4TT
	 i1/wzgODYyc3Fdr9Q/OhcOmoz7WteStqpcXVJI9sBHa1ejtt4EjzKsWqo9fN99LbGFImz
	 MatWNwlc9hR1V+a0v/BQNK+QEFB4YTjaGqdA8cLzKvvfTq19mfCOyyc+Qis2w/v+QRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3trgOPb;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB7606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFB7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3trgOPb
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1003094a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491528; x=1793096328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
        b=p3trgOPbamSlH2FX6sMX4Uk+/fGAXeeETd4TyWqfq+VnLK/VwB8r1znS5wyJ5609iO
         t3ehoco6VB/rKdXKCEwMmaTdasjbvmjUBwqIpUR1776N+PtAkVyTjTRxTw5QfuCYM6EN
         JJFtgvvPN3s2NwJeF899DzlenLBim1v/CzNMto0IZum8QhIwNP0O7Gf2a8ENfsnP1lTF
         mGQfncnOEvArhugKgF773QgTMsRhmqR1U7pDseY0yV3w73lObqCOw3HvdBBJkhF9QE3D
         4r40bSBstEbGd+DziyqW5RrGTaHLW2wote0/jDCQ7+gTmzOHTgZwJYUiX+poUL6T78/z
         siIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491528; x=1793096328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2GCcH5pUMlDh8NZlJjZn+eXBw9+EHTk4lp7mOO+heY=;
        b=PIRVuezPFFp6eQkkqt+Zk6/GOpYjimByQy3ASP1gIJgNM5X6PMZn9jqHdIXI2qWtd/
         D0frhJ6YbXTafpaUQToqOaC2ypuPxEfoyz4LhMSlNOrQT1HbZf+7g84uwo8WSxLm6O/m
         mr9SYafcMWjd6+mGkde6VwmGbtKn1+IFYfoGNxEN01uN+FyHoM0OsTmXqasuMTafyt68
         AGAoYPi+yDKi/mxWQO1oN9w0Lvbj0l6hGBfsq+OWHCAYjnpXOiIpYKpVetUWE1dcN7aR
         y5e3yq/zLE03n+oPu8Ay5Gs7T2/NafrvbH0J2JqFN/SLkZ3Qci4JLIU0faGLTcDt1PA4
         R0sw==
X-Forwarded-Encrypted: i=1; AKwUvBy/W331Apx7/ktz0naLe0WBrKtSedDNapR0OehzT4DXCaXThlEY29PnkMMpwg7FYqs9qbRdUltoN1JUGAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyAWE9tQZo9tPKEHAwwqSno3q95YgcWTV9Cjv2x+L/fkO1wfEJ
	4c2Y4z7eaKN819B42qdBd1K6WzAAVN7uUq2aAGPP82T0jYvTwBFpNhpl
X-Gm-Gg: AYBFou0AiprXlKWTaT0eMr+0jOacySA6d6OcFzFiHuJ2OguXGr895eKqTFTb6UqCSLY
	wlGLL1Ha7YxNCL2QEJLQZLB1FoF2//PcOFAkGWo3dcw/P1nNrOhdFF0cPv1fWAktmda6JAsJs+D
	eXE/1qkj1Ijcj7cWpiZ3mmogRn0r1UYmCp8Dffow8uI1jG+kMuf5XtCX3uiTE1ZWFq2EEIqphqc
	dJpIGwIdzVFvZEPG4V/YbMPWyiaOaX6fZdA+x8m3253Q3d3AQCONyJBFUsZjyCiN7OuBhX4BSs5
	gnlbsfSA12675p4/Hx4eHCsgfrzqaykln50+cXfQ8vH1Z8G/6We96SlYP3FvlhPjBrcmNf1qyQP
	LabCvDKTdZaVLCqk7GITTFTyIXoiV1fXueLnl9nQy2tr68F1CjS+8ezlZBKJRTx/C0EhI0NYxla
	L2mq51PBxGWVxKwEi2pMGQId+fUH6Oxp2NgKtPhrpVeodDj6ndeVyq92LK63GLMfhB9kQYPAa58
	SEYK22XUkMZR45ry9RwrLXPqWiCu7AxXZcrmtV34NHLQxTd0c3XT3u8jrxM54xmeREiQS3s4nM=
X-Received: by 2002:a17:90b:582d:b0:3ab:c674:d83c with SMTP id 98e67ed59e1d1-3acef13e7e2mr7913373a91.27.1792491527690;
        Tue, 20 Oct 2026 03:18:47 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:47 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] selftests: ALSA: pcmtest: Check the frame count of each transfer
Date: Tue, 20 Oct 2026 19:18:36 +0900
Message-ID: <6f16e2a01f18c0ea069164bab31999182ff6d49e.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792390197.git.sammiee5311@gmail.com>
References: <cover.1792390197.git.sammiee5311@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tests keep the result of snd_pcm_writei(), snd_pcm_readi() and
their non-interleaved forms in a size_t. A size_t is never negative, so
ASSERT_GE(res, 0) always passes.

The capture tests still catch a failed read when they compare the data.
But the playback tests do not. The driver sets pc_test to 1 when it saw
no corrupted data, and that is also true when it saw no data at all. So
a playback test passes even when every write fails.

Store the result as snd_pcm_sframes_t and check that the whole request
was transferred. The calls block, so a short count means an error.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 95065ef3b441..5bba17434a6b 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -166,7 +166,7 @@ FIXTURE_SETUP(pcmtest) {
 TEST_F(pcmtest, playback) {
 	snd_pcm_t *handle;
 	unsigned char *it;
-	size_t write_res;
+	snd_pcm_sframes_t write_res;
 	int test_results;
 	int i, cur_ch, pos_in_ch;
 	void *samples;
@@ -190,7 +190,7 @@ TEST_F(pcmtest, playback) {
 		it[i] = patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len];
 	}
 	write_res = snd_pcm_writei(handle, samples, params->rate * params->time);
-	ASSERT_GE(write_res, 0);
+	ASSERT_EQ(write_res, params->rate * params->time);
 
 	snd_pcm_close(handle);
 	free(samples);
@@ -206,7 +206,7 @@ TEST_F(pcmtest, playback) {
 TEST_F(pcmtest, capture) {
 	snd_pcm_t *handle;
 	unsigned char *it;
-	size_t read_res;
+	snd_pcm_sframes_t read_res;
 	int i, cur_ch, pos_in_ch;
 	void *samples;
 	struct pcmtest_test_params *params = &self->params;
@@ -222,7 +222,7 @@ TEST_F(pcmtest, capture) {
 	snd_pcm_format_set_silence(params->format, samples,
 				   params->rate * params->channels * params->time);
 	read_res = snd_pcm_readi(handle, samples, params->rate * params->time);
-	ASSERT_GE(read_res, 0);
+	ASSERT_EQ(read_res, params->rate * params->time);
 	snd_pcm_close(handle);
 	it = (unsigned char *)samples;
 	for (i = 0; i < self->params.sec_buf_len * self->params.time; i++) {
@@ -239,7 +239,8 @@ TEST_F(pcmtest, ni_capture) {
 	snd_pcm_t *handle;
 	struct pcmtest_test_params params = self->params;
 	char **chan_samples;
-	size_t i, j, read_res;
+	snd_pcm_sframes_t read_res;
+	size_t i, j;
 
 	chan_samples = calloc(CH_NUM, sizeof(*chan_samples));
 	ASSERT_NE(chan_samples, NULL);
@@ -257,7 +258,7 @@ TEST_F(pcmtest, ni_capture) {
 
 	for (i = 0; i < 1; i++) {
 		read_res = snd_pcm_readn(handle, (void **)chan_samples, params.rate * params.time);
-		ASSERT_GE(read_res, 0);
+		ASSERT_EQ(read_res, params.rate * params.time);
 	}
 	snd_pcm_close(handle);
 
@@ -273,7 +274,8 @@ TEST_F(pcmtest, ni_playback) {
 	snd_pcm_t *handle;
 	struct pcmtest_test_params params = self->params;
 	char **chan_samples;
-	size_t i, j, read_res;
+	snd_pcm_sframes_t write_res;
+	size_t i, j;
 	int test_res;
 
 	chan_samples = calloc(CH_NUM, sizeof(*chan_samples));
@@ -294,8 +296,9 @@ TEST_F(pcmtest, ni_playback) {
 	}
 
 	for (i = 0; i < 1; i++) {
-		read_res = snd_pcm_writen(handle, (void **)chan_samples, params.rate * params.time);
-		ASSERT_GE(read_res, 0);
+		write_res = snd_pcm_writen(handle, (void **)chan_samples,
+					   params.rate * params.time);
+		ASSERT_EQ(write_res, params.rate * params.time);
 	}
 
 	snd_pcm_close(handle);
-- 
2.43.0

