Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793081977;
	b=vKn3Ff5fsiL1hFgCZQlKRT0akksBoFkcn363IVEwptnBiDz6uaFvM9PIrI2FYwsyiHOm
	 xwul/oQLRtJTBDJLhjeRWnGy+Sr4tDuhIg0lV9rvLv6M6HG8ggge7SZ6aXhsR1l2dpMqy
	 XEXd0CK8RLrTW/GM4DPTrL7i5CwAgj+NHMkQ/blSIK6l2ldWMFxeuEij0C05bY0Aun4Vf
	 AtMUeulfNFnxgnSvxM+uziVkq0Pn8kbm0yaK73LUXBtqY9dHf61t5A75hTKbllbzm0K3S
	 OYYKDPyVseCnB8zW6egnv02z8EPATA2+gwDv9tcda5VIWGOeZbCeyFyy8W8XJqG3eFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081977;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ivU29qg5oGDXaTq9LgdVfx5ORptDin69w2fecE05sTI=;
	b=pE/sDZ0UW6NrPrjDZv4bqbq2HMVQB3zBUWhtSXJiYMoKaaROYjLDIvDQ6Hmr6aoe48Bm
	 tj4/A8CWFXLp6lG7OTb0MkEnaDaxWBk9ZfB5OqTaejpCkmWuosyYMBshmMaVeRw4SB9TY
	 hGCUMVhseeqGUCRRfnqV1DtKmf5oXN1xPNbf3RVgXgLa3ARjy6XOE2IbaJztL/ilKv3l4
	 rvrvKn2LcICFIwmr9Chc2uwwVOUyUjoUJe6S+IJMtfgaIp3SPHFtaPPoE9fou6dbKjiCX
	 w2IQYfHY8SKS4vHtXMWHYWJi1WXCK0SCraW6d3Bt8wGsRtS6ws6JcPgV8v3/S47Y/jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TD4Vodkk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0E606A31B;
	Tue, 27 Oct 2026 06:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TD4Vodkk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793081976;
	b=rdEkCvt15t+eL5EQEEou8MrCv5OYyZCkvqRX6bgNS4n6Dd3FuVbfmH6lG8094cHKpa1R
	 RDJvLXj8I2RTZeSlDFcwbmG0KJSu90QYqlRAuZ0FCG667qGBa32rMI3yVAnXlN3wRRGHe
	 xVq77FeU5rcdeiUyK9ghWrJ1VeefYzxafSY/rOrlbReelMG2L0dDh/yvwPTT9kCGeJkbP
	 ZU8fxeQE31y7dwUasdj9JyhlPv00QdFCVdo6/1jezwxR4UjXA308Mlh8UICHKLI0xL2fU
	 ldL6YNbUCSCEmHLeUXK6IIaO7hE7wxt8mxjn4vrHZ0VDUf5RSVHakEMZyWK+zk5S2Vg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793081976;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ivU29qg5oGDXaTq9LgdVfx5ORptDin69w2fecE05sTI=;
	b=k67kQ77oz1ftBg9cQLGrBt4jOJdnhvzfzMWlNDudw9romI+O/+I7q8zHbs1dMTwv2v2O
	 rNl+cS9BoMgkm/azkWZJfju1oigaOzQhcDJdCzc67W7YiUZRYMEvflXWPV7dPMgOSToDL
	 k/zEPM8veoIvEjwmO5xuurChq662mziGQgQjrwRUzRQjV+Q3RB/oleON/PtjkllCYk1RS
	 XT3mnu8ONpp0Uv6ysHdrK/LEmW5BEyDMex8jvA8EikbxMyNr61wrQHlvnILHCzO9VQOYE
	 bTgJJhSMeLzfybWwt+Okt5wPmvIqBwkljGWIHAGc7tpFzEgFUVHPK72pyd1g6BGOnFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 513941F01825;
	Tue, 27 Oct 2026 06:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793081976;
	bh=ivU29qg5oGDXaTq9LgdVfx5ORptDin69w2fecE05sTI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TD4VodkkPdpGmYkbJk4e8VFebKGK98XvFAt/wZAc/uQwEFNyljkvfuSeu2++ifRHu
	 pduiD4qDDche0z7HNQ6BqYv5ZTYDTKrZFUYjGWa2HLdaWj8Mfqkp8sGvZA0KJrUq55
	 s0k2GU/BmW2WPS9p9+u6wZIGViOhF/7RTBFf6dBMLWDm9RFDSVZgbmB8+y2dmbvI8O
	 pTGd/ZeO1KGrJstWNyUsvQ1gNsUK+71fYUJ9HL59K2tGaYlrs9HFfalNddATs5Evtf
	 cNS0ya6N+FpOYKSn6ApjYL02IRibb2GXF0jeYRJQOBsprg68DVp8uNol2OcIr9xG82
	 d/JOc2vOs18Yw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A504244FD9;
	Tue, 27 Oct 2026 06:19:35 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Tue, 27 Oct 2026 11:49:31 +0530
Subject: [PATCH] soc: qcom: ubwc: Add SM7250 configuration
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNj3dKk8mTd4lxzI1MDXSMTI0szg5Q08+QUcyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBUVytYbwAAAA==
X-Change-ID: 20261023-ubwc-sm7250-242960df7cd7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793081973; l=2431;
 i=patches@brar.si; h=from:subject:message-id;
 bh=REZcuYhSVnpK6b9bGZLR8ew5vobahVC+TA4omr/hSOI=;
 b=P9YCRWo9cUO0sMQMc+mKBfT6mQPQ2Kx+JESL+Z/8VBissJTa540GGBwSrT4m+eTQoCGLrMPJB
 M71j8bl6kmBA6MMl9+MzmLb0qDgnsOCMIPMFG06Kya9lKaGIiydbKL6
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add the UBWC configuration of the Qualcomm SM7250 SoC (Snapdragon
765/765G/768G): UBWC encoder version 3.0 with highest bank bit 14.

The downstream GPU devicetree of the platform sets qcom,ubwc-mode to 3
(UBWC 3.0) and a highest bank bit of 14, the downstream GPU driver does
not enable the 8-channel macrotile mode of UBWC 3.1, and the downstream
display devicetree also gives UBWC 3.0. No existing entry has UBWC 3.0
with this bank bit, so add one.

Without an entry, the Adreno and DPU drivers fail to probe on SM7250,
because qcom_ubwc_config_get_data() returns an error.

Signed-off-by: Ishu Brar <patches@brar.si>
---
Add the UBWC configuration entry of the Qualcomm SM7250 SoC. The Adreno 620
series [1] and the coming DPU series need it: both call
qcom_ubwc_config_get_data() at probe, which fails without an entry.

Tested on a OnePlus Nord (a 7.3 based tree): the Adreno 620 and the
display probe with this entry, the GPU runs Vulkan work and the desktop
renders without visible corruption.

[1] https://lore.kernel.org/r/20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si
---
 drivers/soc/qcom/ubwc_config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index a4d8769f8550..456995699fdb 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -42,6 +42,11 @@ static const struct qcom_ubwc_cfg_data ubwc_2_0_hbb15 = {
 	.highest_bank_bit = 15,
 };
 
+static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb14 = {
+	.ubwc_enc_version = UBWC_3_0,
+	.highest_bank_bit = 14,
+};
+
 static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb15 = {
 	.ubwc_enc_version = UBWC_3_0,
 	.highest_bank_bit = 15,
@@ -168,6 +173,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sm7125", .data = &ubwc_2_0_hbb14, },
 	{ .compatible = "qcom,sm7150", .data = &ubwc_2_0_hbb14, },
 	{ .compatible = "qcom,sm7225", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7250", .data = &ubwc_3_0_hbb14, },
 	{ .compatible = "qcom,sm7325", .data = &ubwc_3_1_hbb14, },
 	{ .compatible = "qcom,sm8150", .data = &ubwc_3_0_hbb15, },
 	{ .compatible = "qcom,sm8250", .data = &ubwc_4_0_hbb16, },

---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261023-ubwc-sm7250-242960df7cd7

Best regards,
--  
Ishu Brar <patches@brar.si>


