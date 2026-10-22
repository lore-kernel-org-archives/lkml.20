Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667590;
	b=Z/yCl+Vmrk28clENAgl1HL2LNTHx8S7vBj9zHtx+do1JFa9lM6ktwa4qcZdLnCz05PyQ
	 igemaNUPeDcVde+aj6Chy8+hoOPVnKobNbSSvCkDiDQgZM9mLIEUzFHNBy/2+1+CfPBBe
	 hgs5AQ0tju4VT+i9iuOdC8fJOMvhAVh1YPQT3/xC0PTkhFold8hdMbRMl+0NlF5dEhGDR
	 hGgwMTByJTM5r146HDoU32Rqs+S3jGPn0SezKPw+tdYXifqJPLOeDdnnCEW9npu3iL+nu
	 T6fnp9MRPilwDuRUXnQVdvoC3UIOTz2hrXSe/O3am4g9Qq5gs2eOKA9E7ppW/Lh9UKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O85oEWnqbB7A3aswtwEX6Ghna+/vXCw0tN0v3/yndfs=;
	b=TYP9ka14RM6cYkrW1ugX8eksE9YQ//1jojUfF1eZ1vlRFfeDEgAnBBFfp1n2iyL+dnvS
	 EMoNrS7RsCYsfU2ZnOfLGkV3uKW0f0BRpGRgO3HJ6xm/lSTovp9KCkqdiOxVOMFeCbnlP
	 Qtq3na0kb3ehQLMGXFO7SKH0qfii7oyeL6zkdI1sYlEWgEZs//S5tAU1S9SONGc9PR5wy
	 hMkXq1faun2Ez1VFHhnSiqEjRgU1OHdvhkzbVjqmNwLShIUTFucS8B9cHcss+tMvbAItw
	 K3NXpsGgPcVzwRGFLOrl2PbSJVZPNR8GvKFM+T2qRCoHXHxPEFG7nB+C4hIQvq7hEDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="XU9/dvRS";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698C606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A698C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XU9/dvRS
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2926424eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667589; x=1793272389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O85oEWnqbB7A3aswtwEX6Ghna+/vXCw0tN0v3/yndfs=;
        b=XU9/dvRSHYB+giTZMeAi9/POi2ADnlIdyVKYNXDcXxlyNMpfOuQihfv2TUQdzwrDfH
         O9vcXGpPR7zy+HiiYg8K4+YLoaZl2gNa0NWbdRXwiBeNz3Kr0diyzhVhw0/q/lWIgOQJ
         Yaz2A5k2RXxN7Xviy7NRWoF5hM0z0guCpp2LvrPABd1AP6p0iYVAhhRwtDCi4t9xhAF/
         CwDEPiIMQk146avf+XPAnDcPOuSu0gs2gjEO463Hx/OR+48Ky68UxBgkMaw8PhPZ9zIG
         t302diJwq3KupsyYif6yfvdRXbVnFeOiCM6H7P4VxvBmp0kdxLdHyRmynhlFnb4JoL+A
         fYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667589; x=1793272389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O85oEWnqbB7A3aswtwEX6Ghna+/vXCw0tN0v3/yndfs=;
        b=X6zQ+hmW2ktM2tuDkiF8Qol53y89sdfdrYplv2Ef8BmzlxodmAV7VS8lK3+WFZwzKb
         bWS9UEZHR7nyddLEdpI69jUlmpewfAXix4E1FJMhrGr/F37hCiv53rp2q1a4O4X4TTQk
         a1tMpBwZ75xrphg0rgi9UDZX9pIFfdruY0IA+d1c1+g2eoUw5LEMCfzD5JUuzAkq3Nbr
         0lEW/oPIQcXYFWQte7DFG8QPrDwYiLKvt8fqOiIZThRrsaI8dlNsk8Qfml6andVigJvt
         RITuaoDPEzcu8hdeby/EDvu9lF2kWdIIAi+3sBsefHLwPmV099m4EtUzyPy70RuhmN/q
         7rAw==
X-Forwarded-Encrypted: i=1; AKwUvByUa+X7bi6vbsUwp6d4CN5nS/parozFVehw1YQnKdzzds3ZFmXEmk+NL1eZlPpM6jbwSa2tVLhvfDr9+k4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYaqnBNKntbu06dLkwKaDmtFG4llgwzOh3dphmzH9AWPwvc3xg
	aS6I+yXnaGBDP7wknrPa21yDv2CgRs1H1FVJwhTh2ljN8jRb6cBkIv5j
X-Gm-Gg: AYBFou0yHAWmaZ1YFbX+ZUrMtYo3gTWMuV7Vzw3znk/eJrf6aHGeqg/+cVmbBr2hoz9
	JFrYR27JrDjfBtiI7rV+YN3+Gyjsi8b7jFBA7EOVDg/msVz6QIeEwDBvRGuGm1YwnZs0i7iK3gp
	5q1zbMQ4XTYd4YMUs1P299RB1l3hHfhoGWDW8GnF4GmGHWGU4Tk8OyGCBFCJc981Mw1eqUQ8dVb
	AAzu80+E56Rv7oecvfsUZjfikloG6T1GerEode1J8MDYZCA9Nl+5RaYzlM9PdHJS8BK1IjRlSzk
	1oJP9KESw1yWqEtIIpnUw17Ln+YLrASAQGNvkXVV1FOC25pPfU4fRQfp3ZkavKYjNqNHuQsicGm
	WBZWPWE7ihGj0N4cUNHwy6weVNoP7M1/xMgUSktHHtyE5EHs44tceM+z2NT4kNkSR9ltup4shUA
	HKJT9F7k8BtiJSqot5IRUN5UHgiDvNEOwyuYikiaDsI+8WEQbuyARGr0VXAwBjQ2HfXVw8URnqM
	a7tx6kRJE/xUC5j6u9OiYT2qpIP9F9TRLj+ThpRLtUio3ziWo+yAi0Rbhr6aTk7G0TUCTcrEywM
	kjC3Ypn222S/VjmYXC4NDHHTmiFtUYRLJVLfvqExAgJh1nGNIySFpW5ry3l4EWJW0B4=
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr1910947eec.14.1792667588795;
        Thu, 22 Oct 2026 04:13:08 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:13:07 -0700 (PDT)
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
Subject: [PATCH 3/3] selftests: ALSA: pcmtest: Test pausing a capture stream
Date: Thu, 22 Oct 2026 20:12:44 +0900
Message-ID: <906d65ff1cf78f5e173a5476eadcbca285aa2b17.1792660433.git.sammiee5311@gmail.com>
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

The driver supports pause, but no test uses it.

Add a capture test that pauses the stream halfway for half a second.
The core does not read the hardware pointer while the stream is
paused, so a driver that keeps running shows up only at the release,
as a jump of the pointer. Check that the jump is under a tenth of a
second, and that the data carries on from where it stopped.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/alsa/test-pcmtest-driver.c      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 380364ee7924..b796a5613c6f 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -7,6 +7,7 @@
  */
 #include <errno.h>
 #include <string.h>
+#include <unistd.h>
 #include <alsa/asoundlib.h>
 #include "kselftest_harness.h"
 
@@ -362,6 +363,54 @@ TEST_F(pcmtest, reset_ioctl) {
 	snd_pcm_close(handle);
 }
 
+/*
+ * Here we pause a capture stream halfway. The core does not read the hardware pointer while
+ * the stream is paused, so a driver that keeps running only shows up after the release, as a
+ * jump of the pointer. The data must also continue where it stopped, so the whole buffer still
+ * matches the patterns.
+ */
+TEST_F(pcmtest, capture_pause) {
+	snd_pcm_t *handle;
+	snd_pcm_sframes_t read_res, paused_avail, avail, frames, half;
+	unsigned char *samples;
+	struct pcmtest_test_params *params = &self->params;
+
+	samples = calloc(params->sec_buf_len * params->time, 1);
+	ASSERT_NE(samples, NULL);
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, params,
+			       self->card, SND_PCM_STREAM_CAPTURE), 0);
+
+	frames = params->rate * params->time;
+	half = frames / 2;
+	read_res = snd_pcm_readi(handle, samples, half);
+	ASSERT_EQ(read_res, half);
+
+	ASSERT_EQ(snd_pcm_pause(handle, 1), 0);
+	ASSERT_EQ(snd_pcm_state(handle), SND_PCM_STATE_PAUSED);
+	paused_avail = snd_pcm_avail(handle);
+	ASSERT_GE(paused_avail, 0);
+	usleep(500000);
+
+	/*
+	 * At 8000 Hz the pause is 4000 frames long. Allow a tenth of a second (800 frames) for
+	 * the release.
+	 */
+	ASSERT_EQ(snd_pcm_pause(handle, 0), 0);
+	avail = snd_pcm_avail(handle);
+	ASSERT_GE(avail, 0);
+	ASSERT_LT(avail - paused_avail, (snd_pcm_sframes_t)params->rate / 10);
+	read_res = snd_pcm_readi(handle, samples + snd_pcm_frames_to_bytes(handle, half),
+				 frames - half);
+	ASSERT_EQ(read_res, frames - half);
+	snd_pcm_close(handle);
+
+	ASSERT_EQ(find_capture_mismatch(samples, params), -1);
+	free(samples);
+}
+
 /*
  * Here we check that an error from each PCM callback reaches user space. The driver returns
  * the error while the matching 'inject_*_err' parameter is set, and works again once it is
-- 
2.43.0

