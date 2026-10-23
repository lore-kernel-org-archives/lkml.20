Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792749215;
	b=K+8C1S6Wv8dgbVO/95cNNYJUxKJQi75hPZOAcu/+RCXbnkdTSF2wscu1jJ0AeyowEkg7
	 3cavWJVS49r4zyTqP+6lTcMbGsbVJVfvjO0JvxDmdqBXmbUIKwHjoV9vWY/lQaARHSXlu
	 zIT/BnvODMJTI8bxf5h7MUiT2fGNvqB0/IfSSfl2O8ACVEo5iq3UNR/6FQjBa7GN9d5A3
	 5l+EWWtg3SJVAQARO6IRBF1/8K5DBoNZDECMrJ0r6pROUg+h2BWit03j7brEiqPOzyHo4
	 oZy85p6qo9EnItBvifzuFvpZROJohVyJRLfvsu8SzzJan8O+7LvGmi+xnn8kHiDryJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749215;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WpJLXi37K/3CLTTtMIyRhtpXtwa/kl7B3kX/L2M2EZE=;
	b=tOnjMaGK485Tp6ph78c0WKk/SPH9AxaLPsQ908euXI/h46Yo/cmO/vv/fEOMQu5Sq4YW
	 DjPq5pBX4YsMPf8KowliXSGGEaLtPn+JMG1fRG0/CYJzZs3C6VO1l3hFmyP0KSmRvdMSk
	 IF6s2sYEVloWsk7x/ZVAY1Xr2dxXcpNhBX3L5BkG23Gp4OpHsYlVaabBdNpYk2Hw4QTgZ
	 o3phsHHKjiNN5MqRlApTdWeAF31R1Kyuvl4WraQLYGtVnTN5SeAlKY1t7JoXyxLe21y91
	 9zTt7XqscjfGL778PDzZnmnaR4OWo/Omko4rlPg6eb1qLiJJzebAcng105oRvlgUg3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsTsANED;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7471D606A31D;
	Fri, 23 Oct 2026 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsTsANED
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792749215;
	b=2kVinHIn/nIeSX9r84qQNxnXb3QejQEceHCa7wSRSsRjVHOIBxxn3G/Xsj3A0jyuqO/L
	 eHSgSuj/KzRSsaDqJrQXO3dd49TQ3bByt0ruZ+u209MVMGTtGh8t9LIidrXq2LnoxXgc9
	 KvD4E4wgnZNr1NcJe6H/jYYkBoeUWvrdvm3VhKddIj25gHcaesuTACgj/LxcZSQJDrjAu
	 3Tg5QYFsElqdWBree2bG9b0oF2uoJteWYQYqCFPKVyHjTKlPB7Y6maR+mLBvva5c7T6M1
	 oRQatFCEMfDNzwGOefXSi1hKwvoRTwDVNV1bJoMci61O3xjBASVUo0R2xX0QgHgwY9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792749215;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WpJLXi37K/3CLTTtMIyRhtpXtwa/kl7B3kX/L2M2EZE=;
	b=cSkwLxK2HQ4X3K5GShQ5cMHFHEWuiLmZkzMbRTF1RihfsqfQh1vRppmIIGn6vGYhn2e8
	 WCwgNyy7m7a3/xWj3DKhNJNA8Msy71uBanfCNVskla1lW38xWo98q8JvxGUNnUMAgQCg3
	 +NMgthz5lKypSGuR0GQQFwWPs8iK1kZ1WwrXot7EZ3FypIcLauH0Rc67/KaIe606nzzZT
	 kKgQ6dYWfKom29B21EOW4O558q2KyA0iR0wkNqjMJwzcYR53HJsJ8qcjpX3Lm80j24tvN
	 YbV87mAEhOVw8uElT/uMvUhyYxJKwlN5zXFExrjNoXkKqUwOUNaKFowQXwAkmxmVXYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B4291F031E2;
	Fri, 23 Oct 2026 09:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749215;
	bh=WpJLXi37K/3CLTTtMIyRhtpXtwa/kl7B3kX/L2M2EZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KsTsANEDu3JfqXt45YdvFZHbtAsPoAuAbK0SFOjFE+w/x9172dEFrby4OOnKXlkYZ
	 LbVGDuajr09dU35B7R6P6wXv7qskpPDjYN2qd3blw8x3tTPuiP/wXVrwZ4CqhBi0yD
	 U1KTfPMzQMF1Oz/X+opz6/ZYxQ53XhZGMAPAtOGwN79nIEBhI9HOc0in+qW4IbxOu0
	 uQgYrK23N5TWJis1f/PTzIudR86Lmek23ebmcXxpM/1cvuxpu9tcnILCjGTM5YA2Wk
	 eoAB7+ti0oFRlxJPyeT+1nSqEdVJLG35F5LLhbcGQtSob0nuvrWdL0otSKG68KTtU/
	 9gV8OFPBbvrOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CBC6E4448D;
	Fri, 23 Oct 2026 09:53:33 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 23 Oct 2026 15:23:33 +0530
Subject: [PATCH v3 3/4] drm/msm/a6xx: Factor out the common BCM list
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
Message-Id: <20261023-adreno-a620-v3-3-2d1d566e5e13@brar.si>
References: <20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si>
In-Reply-To: <20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792749211; l=1600;
 i=patches@brar.si; h=from:subject:message-id;
 bh=PgAl8IML/PCa/TfeKJEqfHfIq1dZ4rfP3H29CAhUIYs=;
 b=BIKFsLm6SmjwX6ubg8zYMthCRS7mwRzqPyyl88fsfMOZQ4eiA/ewUK45kg0Il0/WfpXAh8Qhb
 Wn6ELuiw5F2Az3S7sfNgLJyQ0iY4Zly7t7dfzIvbAA8EBrDeGqQreit
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

The A690 entry carries a list of the Bus Clock Managers it votes for
(SH0, MC0 and ACV) which is the same for other A6xx GPUs. Move it to a
shared array so that more entries can refer to it instead of repeating
it.

No functional change.

Assisted-by: Claude
Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 4ef2bd6e7..c4d332f48 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -736,6 +736,17 @@ static const struct adreno_reglist a702_hwcg[] = {
 	{}
 };
 
+static const struct a6xx_bcm a6xx_bcms[] = {
+	{ .name = "SH0", .buswidth = 16 },
+	{ .name = "MC0", .buswidth = 4 },
+	{
+		.name = "ACV",
+		.fixed = true,
+		.perfmode = BIT(3),
+	},
+	{ /* sentinel */ },
+};
+
 static const struct adreno_info a6xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
@@ -985,16 +996,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00010000,
-			.bcms = (const struct a6xx_bcm[]) {
-				{ .name = "SH0", .buswidth = 16 },
-				{ .name = "MC0", .buswidth = 4 },
-				{
-					.name = "ACV",
-					.fixed = true,
-					.perfmode = BIT(3),
-				},
-				{ /* sentinel */ },
-			},
+			.bcms = a6xx_bcms,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },

-- 
2.56.0


