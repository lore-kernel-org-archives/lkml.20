Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8E37A83F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371725; cv=none; b=I6G2HqInF7NK8Y+0Q9q8+Zrp2eMxWRinUdZwOslPdK7ItPNbHXjzftBy5LOkHkKfuXvJRrdUo3n+o9z1gxTa4c0Mc0pUU9ea4ucf2qPxmFMBQOPe5ssZK1HNmYghf3mZlcgvo4IrBtjTN6pfN1z1U3LZBYKXd/7zaYnpI6PzBGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371725; c=relaxed/simple;
	bh=lxYajqr4+u9bb/bxk5jn26nvm6QJFX3vsnrk3DRP0b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ncc9OLVigfpikxZ25LzQdf1PnPcUVTvCwNRSbM3pU3fTjJozg384FlB6qzD5N6IrebeVcxArpD7wBiqpaWzwS5ehQMUdP9jwwQtyd2TbgvaBHZBEhMSbwbvrS0rWwnDkd9jGgQ2e3sFwyWK1RvVVoz5Tqg+DpbdLMcA6nSjbEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkETxNhX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkETxNhX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so15003715e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371721; x=1788976521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFRI8+rNhkKH03jGhsaVXbeguN5xAlvbHG9GZ36jhpg=;
        b=rkETxNhXjVCI539Q9hSsjXfJGGMnG1HoAMijdlSt5nNSJfcz3S7kRnBvw4xnlH/lQ/
         E2+q83AZLgkd+CVJxs3ePwp6vsItJMPKBw/KGTdlP/kYbbpezxG65V+A5Fe4AqmN9Lop
         FWWBNSU6BdYdRYHoLrXlyiqsFtCGDQH8HsHp0TR1ziiKfux/piuMJR41NAHr9cespL2O
         tyJxQcGyxQ1U2lfmEsh6gumk5xlecfPfX620PX6niKsAhMv5ZeS5/S8PWsh8SsZ2R5el
         8UusA5Mp91mAk5TV2ZTpQNXy2p+dnJywtGHLGsL4i7A69zNkF2h+qioLyI5JwHUaClUd
         RbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371721; x=1788976521;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFRI8+rNhkKH03jGhsaVXbeguN5xAlvbHG9GZ36jhpg=;
        b=Ece1msqna6CrZELT5tmVuZ0NhvFzG0BGVSLffzzlTrS5YBWqtgh/WeqvvVJ/42B0WI
         gWi9eueRXh7cPphmTMgb7t/tk1wdqgZzYcucXABA7LrelwBj4d3pRRisiLEtsjkkZ1U2
         meI0wuhyN2ZCJgLAP2HuM/jnUNIC+xIRXc2Z59P3IKrPa6+BAc9Gb4kIY1f9Ts0kXllG
         +9CBefbKJW9j6LDW7ie5LUywnlOEdRYNxI17vC0oiiW71e1ktj6Uo9u9FD+O96CTknL9
         vys92SccRd1a7YGmyltbgMOJB+Dm+iQY36iAtzpYBTPePlEkNPa8qgzIOSbOHqrWnuPy
         j+SA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0AHiY57FG0SUB0OYYO4SLiyIR3/zpbZcQRVSp9OHATYV3mlrsngJtQSoHsy6lGZsfm5wN9Zy+zNtqog4=@vger.kernel.org
X-Gm-Message-State: AFuF++lmqD2nhftAT2HQhUVXgLTChkh2karxnXkkJCGvecfJ3slhlcdm
	muhU8Qg5FvEWBpQS0da/19RVPWFsPQjzk1URsywBqUVkpqYQk8F9D6jA
X-Gm-Gg: AR+sD10YAvgiXyPAVPmN9DoEyqeOvIWrtJMt10OE+ETnYWHFf9QHYFkCnG8C0jn9Jzs
	6ngS3YqIKyzluVY6LDwckTZ2pw3VChr0BqixqAB9q6xjcxs/LBr7u7kvLMo8+iTRZ1cL58JB1Dr
	YnVewFOiqss3OeX6EpZAIrdWJ5J4isceQr/rsctCzBVUzqhpcFV2uRoqJSfhi027fltkBtRSd9z
	Uip1ZL2ibuJdyCEPYIImyAly0XXXeCI96UJyMdPxV15sU2SxWyJrPEqc0RXueKq1+i4py2HTKre
	70L82715ggXHPdnRVmbCvoPJByNCNDDTyETq3Xl5fzT+qsVB9ayYQVfsD+2ZCOk7ZHRK/4wgCZP
	3WhCiVu9H3TW9moNor8Rmq10lJafLDUZxztHspnZEhAJFZDpWEEhT2iNJVuLqc1vt0S8a/knvbn
	72IOA/m62PzRHIor5k85loD3R7Ajnm9MqVBsRq4ig8ctCNlO1/skQnoyVN/jnRt5n/a2Jc41Rgz
	Np5RbxrlwLpRyR9Ujs/lwgwpQRDvzvxBHvpHJppld9nliOR7PwMEO/+S6RRu79FvguxAcLghtg+
	0Xyx4vW9Ia6+uWE8OZfThi6QkTfpihbT4QQzqBMaZWR9YzayWT2WA3yNssnc11HtUMew7Q0/axZ
	Bee2wZPewALoknDSo
X-Received: by 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr137492565e9.14.1788371721009;
        Wed, 02 Sep 2026 10:55:21 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d1fe2sm9693665e9.3.2026.09.02.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:55:20 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx8: check imx_sc_pm_cpu_start() return value
Date: Wed,  2 Sep 2026 20:55:17 +0300
Message-ID: <20260902175517.209406-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

imx8_run(), imx8x_run() and imx8_shutdown() check the return value of
every imx_sc_misc_set_control() call but ignore the one from
imx_sc_pm_cpu_start(), which propagates errors from imx_scu_call_rpc()
and can fail with -ETIMEDOUT, -EINVAL or -EPERM.

Reporting success after a failed start leaves the caller loading
firmware onto a core that is not running, and a failed shutdown is
similarly hidden from imx_chip_core_shutdown() callers, which do act on
the return value.

Propagate the error, matching imx95_core_shutdown() in imx9.c.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx8.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index c2b4d379a3a3a..0820724dbb349 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -41,13 +41,18 @@ struct imx8m_chip_data {
 
 static int imx8_shutdown(struct snd_sof_dev *sdev)
 {
+	int ret;
 	/*
 	 * Force the DSP to stall. After the firmware image is loaded,
 	 * the stall will be removed during run() by a matching
 	 * imx_sc_pm_cpu_start() call.
 	 */
-	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, false,
-			    RESET_VECTOR_VADDR);
+	ret = imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, false,
+				  RESET_VECTOR_VADDR);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error stalling DSP core %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
@@ -88,8 +93,12 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
-			    RESET_VECTOR_VADDR);
+	ret = imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
+				  RESET_VECTOR_VADDR);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error starting DSP %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
@@ -105,8 +114,12 @@ static int imx8_run(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
-			    RESET_VECTOR_VADDR);
+	ret = imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
+				  RESET_VECTOR_VADDR);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error starting DSP %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.53.0

