Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667580;
	b=48C+wlNGYom58a7l1yPrPg5+S3BNVQZoJmT5Iuns2Mrb3cB7wTZ0wz3bRJhfP7b2Yvfx
	 xktpMvOhYk3noBVnuLtnacjhdVxl2gzqsvFgYdFDBtjLBsnbIvl+k09NId73Ksus+mWiM
	 zRcwSUK8Tk5qrDF9mCyG7DmowDM3lcAMpUWUF5UQrKAVgLfVweomvWBoVMZ2izEXJ7ogX
	 LGx41rFsFB6xpWFy/SkpdFPDD/KxlMrCUn3CUGw/TaRAFgZ32Oym5Jlc5M73ANWaDIHwo
	 YwlvfQFxHDpH+WWgBoeGCLq+u5mBcP1Ao8eNr8ERIxh99Uaz1GbplKWT7Mj4x8DzJlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
	b=m2O+3r91aKvsfhRpIqypaufQTJIhyMV5mw36xNBMVrn/3ADAy+5tZC/AaDPXx4m1v0cU
	 7p9WvVlhJ0PrJLDxysv3ZEbpc8OVZU9QEybFkzhr/tXc594uGCPt3yhmDypCxlduxH0B0
	 eVfMZRU7STnG+gE4Lvw5RYsFAW4NJcVDWnIDMtm4713BaFRrVvI/AjLPcrTIOqVrmXCyJ
	 tDdiBhHYLoawIyfC9OEDse2Z9NNP5KlnNJ7vUmv3uB9JgbDOtytQ5FahnW6MwvnQPQ50F
	 n7PgBIqNgKFwR0AinNRbOxGho9RQUMyKjv9k+sYWScQKBUi6GGtsq8KEQBIt8rMZH0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVlifdhM;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB5606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BBB5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVlifdhM
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1366417eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667579; x=1793272379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
        b=GVlifdhMD8peZksqyC6MnS7qD+0lfFkn24BKyxAmJI7BVH1EiCH6cO0jGnFHNGRWXX
         6UHoo9GYJnNNIYOjysaZOa3YZ2YK34NJ2BD6einTFyUg3t7iK7dqDH2UgzviMn3VR4k9
         rILnvDAmjRllXbgAIj8fMPvUa+mMWs3YSzY4YQ11kWHpBszPHDrzjoyNY+8kStoBi0nA
         5lM8860Mswqh2TDrmPZIMgkBgsHpw2GlR+mR3nf+fYKeXPaQOJZ4EThy+3V/CZo+Yea3
         6f5rYL4w1vQQTNdOiMCb3FisOqQsuWvSkgh4W/ag9VMCj2z2nyn4TFgFaY19zngFdWH5
         OHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667579; x=1793272379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhLtiQT7t6ajo473ebLicX49UUv+Dvbpjn9PDNkFvIY=;
        b=zhLiunxcJ3gAGO1psNL1cRzpRdj5lWz9TiI5uvUwFK1OE7H9fjPO8Q/qULfJqo+OTD
         MCL0URF857XYpP223zw/4oTtazAWI0YDi3WwQSIAUa6Gs1FkkzhVU3u67lTj4ml1ciPo
         7wvkm4bMdwrVSa+faYQV079TcUwzKoDCIvI+tPh4flThqMHXgvuJOI7C/qtwWZH30yVo
         BBiujGBP3JMyZArADogkuwjGUJ/2IibQ2hsVwTyXa9eKIkTgag/VwwmF7RbuVTFGKiPz
         hMMXxwRsJl0Wrm4rlnwRPdovIBsrYqC+34qCApHFxU+ASwkAONR09cQFm7UL6c8PKwzH
         rj9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxamDPU/jcRLeFqjM2s4/W3PbQlNMav6GD1IhcS9uoqVvnpTQmAUeoqsQbRb69dHamOPHp1hNOeAvn3QrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7/4oeqihqm+9xsJ48XMohEa0FSG5UpYRpUkW0z5tH6fklv0P3
	XaygQWMtpAiEDi/g1jvv+vkYQbuttfq6PMGXtl55NNmSrqQ6X/2KKy22
X-Gm-Gg: AYBFou2MXSNubHW+3H7HpSSdlq+BfIyV6qphlXUenaEMKtOU2LJoWJTtzSmNIrYB0JS
	vtzSolnxV2iQavky7kcrLo6hqJmRfc4OJOPcF4rs+HySe4P9ROtOGspiLuQAid503iUUxoGeZDx
	RnFly1uCrcbwSYdJop9LcuXHDN8Fq4/KhSHnpMl9EGDhSjVDpZGckFRfLeb/k4W7VKGDFky5SQC
	YzYnxIdwNk7rzWfk6QN/V0BWVoI7ZbHLAxFCThqH6dC8wOLvlzkv/K4r7XG5+S0bFx/Kcu5L7A+
	WYyf0ISANTQ3WMMo6Sd2DpSUQ6a6K6jgnu866Ljy41IMCdZMogGPvXi3OJyt0w6ZyBNL22RHXWd
	zLLMGQ7v+GweIZxKs7L3iz8mXUwZpJ4b/mMaky+0HVHWWFx5fqhEH6UCscq/pe993wzQwq/X/h1
	dn9qD4b9BQDG5Frv0GsDBf1JDpgLUmPpVqcVjgPJ03LTh2X4CzVGhkLLKajwS8zjxLg18iEx6d5
	DxSxOixojkPKUVoiPgxKIn5OPi200N5PahSA+8B/mjMSBEIJxrsg60TpVOoJW1lKqm3sK+WaKUf
	VkKAC61LjAyXRE+ebehv1CSAseEu+016SEvoeYiViyIO/G5JYx/4/XxFdMjoqZ6orD8=
X-Received: by 2002:a05:693c:414c:20b0:358:2e30:8e5 with SMTP id 5a478bee46e88-3674b62ecdbmr7545567eec.1.1792667578429;
        Thu, 22 Oct 2026 04:12:58 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:12:57 -0700 (PDT)
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
Subject: [PATCH 1/3] selftests: ALSA: pcmtest: Move the capture data check into a helper
Date: Thu, 22 Oct 2026 20:12:42 +0900
Message-ID: <2922e4e3021760ebed68b8e44b80fe0b2e3f1d9c.1792660433.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792660433.git.sammiee5311@gmail.com>
References: <cover.1792660433.git.sammiee5311@gmail.com>
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

The capture test checks the captured bytes against the patterns in an
inline loop. A pause test added later needs the same check, so move the
loop into find_capture_mismatch(). It returns the offset of the first
wrong byte, or -1 when all bytes match.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 18ee72d5d4c9..fc4d12542808 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -82,6 +82,25 @@ static size_t get_sec_buf_len(unsigned int rate, unsigned long channels, snd_pcm
 	return rate * channels * snd_pcm_format_physical_width(format) / 8;
 }
 
+/*
+ * Check interleaved capture data against the patterns. Return the offset of the first wrong
+ * byte, or -1 if all bytes match.
+ */
+static long find_capture_mismatch(const unsigned char *it, struct pcmtest_test_params *params)
+{
+	size_t i, cur_ch, pos_in_ch;
+
+	for (i = 0; i < params->sec_buf_len * params->time; i++) {
+		cur_ch = (i / params->sample_size) % CH_NUM;
+		pos_in_ch = i / params->sample_size / CH_NUM * params->sample_size
+			    + (i % params->sample_size);
+		if (it[i] != patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len])
+			return i;
+	}
+
+	return -1;
+}
+
 static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,
 			snd_pcm_hw_params_t *hwparams, struct pcmtest_test_params *params,
 			int card, snd_pcm_stream_t stream)
@@ -207,9 +226,7 @@ TEST_F(pcmtest, playback) {
  */
 TEST_F(pcmtest, capture) {
 	snd_pcm_t *handle;
-	unsigned char *it;
 	snd_pcm_sframes_t read_res;
-	int i, cur_ch, pos_in_ch;
 	void *samples;
 	struct pcmtest_test_params *params = &self->params;
 
@@ -226,13 +243,7 @@ TEST_F(pcmtest, capture) {
 	read_res = snd_pcm_readi(handle, samples, params->rate * params->time);
 	ASSERT_EQ(read_res, params->rate * params->time);
 	snd_pcm_close(handle);
-	it = (unsigned char *)samples;
-	for (i = 0; i < self->params.sec_buf_len * self->params.time; i++) {
-		cur_ch = (i / params->sample_size) % CH_NUM;
-		pos_in_ch = i / params->sample_size / CH_NUM * params->sample_size
-			    + (i % params->sample_size);
-		ASSERT_EQ(it[i], patterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len]);
-	}
+	ASSERT_EQ(find_capture_mismatch(samples, params), -1);
 	free(samples);
 }
 
-- 
2.43.0

