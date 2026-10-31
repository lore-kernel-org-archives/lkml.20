Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793433223;
	b=iIdYrouumek/LhfaKUj/dUYIu6sG6UMbO+JB0wmoBOnUwCQUBQ5jVUqxBniekZAbSjqY
	 CihreUk5AGvtj9DT/FEMobKauP0q2Z/B46AUCVTAIFsbeCJQR7I5+tyeAObt83T+pXIm7
	 iAWBCcN1yRczuu/I6CqE2buGqmANS1S2u8DDxTrAGgQdHNd89z2GipUSLrVZvRTqdAZF+
	 gT7Jc7Te9f+VB3MqitjhdY4qCkb2xNNGPciDzArX30RRsEurXlwErFjxdPr0qJOOaa2FJ
	 h5sisgM8Bi8uo1okVBuy553RoTFybOr3/Ftk7EGrCxM5WLUQSus1dj8xIFdSDZcaH5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433223;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wf7S5JFytIBVaojS8+eTHO20u2HSVydPobWXTDzC4Xc=;
	b=Q4HmfMiJdSBiNCKz1vBOMFyH1XN/WQb0iLTavUq00h23xqSq6TBoOPcG9urKp1WAf60I
	 nkD47EfISedaRWXx876mMmdsYLxjU5BQwu98q3tJsjFoyUuBbwMRXj9jRqzAUUPDxRY1W
	 F8O0KFD0utyENkDBAbe94atSILG96mwIhDpI+IDryHOgOVw522wSGaDERTWc4CUe7S11Q
	 2uGiF9DDx7QTIKnn/LtNtEOQRCH37APrp0eyRCCQ/LqUjTSkKd2gQDKolF6ePogpZ5kf4
	 UOYTaRToahaDFIcgQArL20NfDK8qFoFo9W92BMc270MRTzPYxQ+Oe4hhfobG1y5ooqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAzivkly;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932D606A332;
	Sat, 31 Oct 2026 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAzivkly
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793433223;
	b=ZYXJkdWL3vzEWNnjfow+cRrs8utVvm0CK/Gka+qeh9YQswNKNaQw4ul6WvAn6Od9w+wx
	 ANk2rLuwiaQ5ZCL8GRhLZKJnnxgknDUuWoM+dokLVbS14Dqrp+SSg3VmffLuTVXc0pC9d
	 HPVS5yOdiBJzLARIcwbuqGX6Lpxx6oCdmvNIlaVtwBoGNafTWM/SBkSqCMgYsV+Z4qj7m
	 95Xs5/xSMQBc8TcfR5qmXNvJRspklAmHJr39bpQBqBf8AFJ04ik5Ep9YO7fctC15UmYFa
	 N+LKBpR9tzkC7xVhG4dZ6vXSCFwbrf5Lz4WBeFSD2p8nqQyKYKPGfBVEdBslV/nM2ng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793433223;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wf7S5JFytIBVaojS8+eTHO20u2HSVydPobWXTDzC4Xc=;
	b=PixScGuEPEfFxaOTrx1ZcJri/l7ZhUrR5jGPef5EKAbYtNc1tLLLhOd36UrPgj0G13ca
	 7Kvp3VRc+ceaZPrj87YFGBFQFnZunp0TpOriMysCH+s88CU5PMSP5dTTU46BSNBQQmpsJ
	 itV233dL3UtnQlm8XZfbSlXthx3T/OB/qYA9GLVkiizex9Bj6yu+aKwH1pvYQEDDO/I98
	 o7AsywWCX83v7xQezF3vEnPPZ+qdLVTck2OHZK91X83AjzBRl26VfG03YKj1ZQxKLooVw
	 HowJ+6d593pmEMYnoG1+omgCcb/ODPqK7AVcdDlIc9EMUwR0sz7ocXFa5LiMmmwzF9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 309911F0093A;
	Sat, 31 Oct 2026 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433222;
	bh=wf7S5JFytIBVaojS8+eTHO20u2HSVydPobWXTDzC4Xc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KAzivkly9GqBySEM8SKJ9PhSrjhnPN+T+Ka912lNesDiPvMaMtX03tNDVAANUAUyV
	 fHPS1PcIrio8NIXO8MwwXHBkzmCjFPUwvBntIcwH3T1jPT0jZpfMzpGWFrtjSLPwnu
	 HXgQDRXMpPcks8iMTZWQ5ZEE5rvB+k0iDXkZfHy21RKxxmX6TzI6V3a1LgUuMPmxfZ
	 iZVtKkoq16bpTTtLXEPjdost05y2ZW1kML9uvt9pRE8XJXEoQiWTV3ckzEPSbCrwtr
	 u1hRxxl0WvMtBcTkBN9UUJu9w/96s69jcqIiUtdMpYgJGT2XI6JU3AZ/Q0OGlJizWr
	 jUDDJQTzLrGaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 688E345A38;
	Sat, 31 Oct 2026 07:53:41 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Sat, 31 Oct 2026 13:23:41 +0530
Subject: [PATCH 5/5] drm/msm: mdss: Add SM7250 support
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
Message-Id: <20261031-dpu-sm7250-v1-5-159f403ec405@brar.si>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
In-Reply-To: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793433218; l=868;
 i=patches@brar.si; h=from:subject:message-id;
 bh=g7vyjU5OaCWQAuB+XPDJ7H51VnQBWV3XEI2bru+QI/o=;
 b=DIsCJEfbTq4ctqWG2qjdMbE2vI4+qelE1Uv786Dz1zMEOqjCS7fn7tGCVTnWZkc0nhh2z4tUz
 aDqmyZqIbWZBkI8mjkIdmx2eU7g+YOHI/d8pyl/m2/KN7O51DkvN8MQ
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add support for MDSS on SM7250.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e69b122f2687..f619052bbb46 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -562,6 +562,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6350-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm6375-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm7150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm7250-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm8150-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm8250-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sm8350-mdss", .data = &data_74k },

-- 
2.56.0


