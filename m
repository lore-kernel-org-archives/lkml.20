Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426D4A3D44;
	Tue, 15 Sep 2026 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483710; cv=none; b=GNncd4mrbDhcUmmDGePo+gL0HazGvfUmH1wUMQXinzXYqccTLaOcki9gMrs1IDKXqS/gZT/N9DeV8OC8J1RvEwFwiOeeE0DYB03Jbg1PTFAcHBIlB4ZyolQO2eE397Sp3LNBNd5w0ffflg90HAiP6WeDQXy4Lb+VKPkHCpUaqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483710; c=relaxed/simple;
	bh=U4V+Mnx5yBT8muMDdf8O89ESb1sfYJqsFhQw2mJn+B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uhEYIoOmpiKDd5Tqjzh2WiINXaHJq6KnMbGN+lGGPSSMesjMT/0hKid2ihq7DrAuYvkSmKkUk4IKfkr3WiBbceM8EjbhyexiSZdG+OPtXeNhG+qPvRguss1suclCSe8OTLzxQ0IE2WGjvnQn6qoTrzPnNmzW7gM8lgJHBQj3uT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1789483661t5fd737bd
X-QQ-Originating-IP: WsbpIfDhMJsGXWn3oz+rP65P3m3zbFHSIzYe+z2lHOw=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Sep 2026 22:47:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10969957875995836888
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 15 Sep 2026 22:47:32 +0800
Subject: [PATCH v2] media: iris: Support HFI Gen2 on VPU2 4-pipe platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2TVthaZ48j8Mh9puYU0E0iLBE
 P7dgnePbzLzZoVEkSnBtVgh0syJhz6DOhXgOtu3hOwzgxJKi1oKTM4oI5YRu8DYUq+w1pXTZZl
 TU0PejZECL4fz3vw4vR9PctMu2hsdp2mIn+N0lnvvn3+WKJFsJb24GB18uEXrF3t2wwuabdu+T
 zh+y8QAAAA=
X-Change-ID: 20260910-sc8280xp-hfi-gen2-965c64428089
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2215; i=sophon@radxa.com;
 h=from:subject:message-id; bh=U4V+Mnx5yBT8muMDdf8O89ESb1sfYJqsFhQw2mJn+B8=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFkrozp2hk0/sj8m0rx4geI5F/83HsZpZSdjBDxXL2Iqn
 PaC1a2go5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwETSjjP84Zxlo/duQ+PL2G1N
 Et8s9p3t7XIsXbJ91j/zOslnWr7JwYwM+7Kal1lL/L+sGxy60cqreP2zM54iGlFN7516s6d98ZX
 iAQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NQSdGtztsEMuzM6+TTxRk06hwThoGJXs3SC6Pfv8k63GdbkUu07xrbCi
	/fi2SlvBR5G27V0HRZMzC6kkQPKgBTb6FcSGqHcdpJsWTc8a3gQNrYIhMNgv5XevsoyUc44
	ajMQaNL5dOD/gUMxgQWhenfDKUaq7nZEh1D+3Jc9jzFC3wuXYMZIxmHshQEnuUTMtlS6InL
	jxqxBMc3MJZF1n2vRNg2WjfHrwjX92NsTFXKSwfAqWqT+5zHqeGi42LQaF5vf8o3zqiG6H5
	vVmPtEwuGTMlhEB3HlzWlYhrWoJvcE2tEvQYjVYHobMDd4mABSRQWpYwB6D7ZVv0uuTQKfH
	xhntIQmRc9At93948IQb9dNlHHA4Cj8DkHzqnLhD8ByOkhVwS5xSqEn8gxR9h5gTyQlvPv4
	WXm8GGsKqTArXKvd2SEbukukG3eUGapFfNVv3JwIQUDjNYsxgAwplMQwJNW/zREeu3B1m29
	MDjU3XfRoLQPUrZ4zbU/sWIoOaoiausJljOx5SWA5s9edqBK0/zLAig4B/ps1yMNA73h32O
	2LlxaeYvukp+epXAZ0zov1DVt1KItesNQCE4zPu8Eb88f0K5r4N9qBYLR/UprzKqIKOQXhZ
	Rb8JWGAydPX8286HZnmS4wVIwTPejdWtcC48uUm05mOwoFqmCBeLdpIkXwny2b1Raes9Qtx
	DoTVWjvc+Fe1TkLwS1R/5fpAZw9EP7pVxaRSa0zsFLxh22ar4IK8ktGMbTakBwLkSClt7+v
	wn+EPQFTfQ6jPXxRX0mlk2QSsU0efdAD1cVs10yhJs8UYmQzUgE1ySSC+t6qmf4zxm9mS6H
	sdyUrQmBSS2eCXi41nKq0PCi03oIpniPrLUlTlBSFsAxWNyRlDIUMte1+8yeI6H5pMHG1fX
	6MjN1B9Wm9Q6Z+VA+UCkeYLwn1QxeYXlND7YEGJw9Ra0NRlZENoUhrc4KM74lhILzGhWttZ
	Cql2OUxoF91SfU0CW5gHQxFQuGDywilSrlsT0auUECh8n78s2PEA1daJNg0A1Eqw5Iy2xqy
	8oOnuUkNLWzlYssNTAkBVcUGWDqU5NB3iGFB8PA0BjwiIS9ct/PyK1IuGwveA=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Some VPU2 platforms with four VPP pipes, such as SC8280XP, can use
HFI Gen2 firmware.

Add the Gen2 firmware descriptor to the existing sm8250 platform data.
This lets every platform sharing the VPU2 4-pipe entry select either
firmware generation at runtime.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v2:
- Extend the sm8250 entry instead of adding a new one. (Dmitry)
- Link to v1: https://patch.msgid.link/20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index bbdbf21961d7..0bc559b7a072 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -41,6 +41,12 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p4_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p4_gen2_s6.mbn",
+};
+
 static const u32 iris_fmts_vpu2_dec[] = {
 	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
 	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
@@ -137,6 +143,7 @@ const struct iris_platform_data sc7280_data = {
 
 const struct iris_platform_data sm8250_data = {
 	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p4_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260910-sc8280xp-hfi-gen2-965c64428089

Best regards,
--  
Xilin Wu <sophon@radxa.com>

