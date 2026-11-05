Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885426;
	b=fAti5TwXqpkfvKqxuxUWIwU/lAB32LUX3r2+hZcxtuopjYns95RqaDcWlWKUIZFrKy62
	 hPchWpRmJavhG5ozBDqK30GgM9kXJai3ROJkNWYzwqhxjhzIgniLPXPadG5+9TV6BD7Za
	 zp2+zuFwSalCiwmhH0tRf3JRiYj0SfFN5ailokTnw6qC9iMDAdqq/0cpP0iyJWPjBBro9
	 So/CNuCbjEVzQ8RAp0/Fr8ng2aG9viFcPXs00gHfd7fVzRJpRSSUUT1Syxp+WDCVMBqD9
	 MmiDe1jxaw1dldrHzxXiwWBdsLYxDGI13ncaJ2QJfpPUvppRDv6+0yEgObKLJxrUZpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885426;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A59kBhYhVh2cwcGIS0Bice4IBYZ7xgZ31BmecGfB75k=;
	b=gIPego9SccWqGoZoxV95O0TtOETb68kVP4/2MKwytaWGWezDCvoWvnZz7y1DXoAgsVu2
	 FC3MTZVnTWlxOmHoDu3lH8N9eooUS/hs2YHqOcz41pS+O3n71Iv/M1K//+UkRRYFSSDkk
	 PIWlwFdL7vAFUzNGxHldYHure6MMX0PMsHfivMpsXZP1Joas5gBIkB9WR0Nbf467XEdTX
	 5Hp0Yy4b3qJ9KDYXKl0ItMuy9v2JHA4wu1FwGMdcDWrmjDaG2gsgd03F2LZTh8uABGfeu
	 5zo08RdakYx1SSRHqlPwfZjDTutL1SH2aGFgQkD1Ay7gkQKtA37ju/sfMAX061wP4mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShLVjeZ8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529C606D806;
	Thu,  5 Nov 2026 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShLVjeZ8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793885425;
	b=UrLBskcGwNVCgQwxBvLuZF0N3ICqazELH4La0tV+ZvQjsJNQ7/yj8H+N3UujNNLG/Ara
	 yRGSWEbi0WyDZ5TrGVkcS/BaZERNiklijZ8WC6pCdmKJULvOqZQ9JJR6dAl4+Rq8l48Dd
	 RTFsMdYIMKURl0jkoVNtH0JW/Cx/lBdr1rLDkEciIitBTKELQ+4KCZgkY0RkQujQJttt3
	 Y9RV6bJrTrjzW2BLJct8jgzKJwXoYVmRsYHylk5xYhPh3mp4r9SDKWIPeyGvJtkang+0J
	 twgyXEvNhYcaSBEMdFwI+iCITE+x1wEhKp1mtXYXn5VXgr8S3YCoWaFXlRbs/aqZpfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793885425;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A59kBhYhVh2cwcGIS0Bice4IBYZ7xgZ31BmecGfB75k=;
	b=J4kvCsq2jV7wtXGaM9e5qFrVALKfWnAxqjBRlxZ7tndsOK5lGLhIiHMmP0jEWMEXNSM2
	 rOCnJnGKUHgjJ1Os9S644hi1fiz/NU5MkogfMyqjUlb9PzE+1Y9c5YqKEzOW8QKXThmO1
	 Mf//Bl1qVIU6p9I9vxOv0qex+X6eAzu0DvZtTL8N1zWw/2HCeHAD5Fycfwn+b53Y+lkFu
	 bdBZKyYRoEUx0MmF7ZReuwCZpEV5sRcPofidpIc+MSI8jji4/dj9Q5BCbOJn9jr0kDNCe
	 DJ7FN9reuTddgatoUNUfTaudVUn9uJpThibxDeBOBBnME9IowQ2YPCImdA9gmQAP20g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63B921F00A1C;
	Thu,  5 Nov 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885425;
	bh=A59kBhYhVh2cwcGIS0Bice4IBYZ7xgZ31BmecGfB75k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ShLVjeZ856HvQdF/PZZQP+Du+urtAQZ1fVs9zXThBLj+MfI+lNyuqs+2tjfhlakyq
	 yWa8yErWMim4u3QJcfKgnUugYtKQ7N+YWmNHwIulY6k+3s2tbt1Flfkef7x7tWEqtv
	 Gf0NLXzzdAxO8Oi7KyiOkEdGdQQMlfCnc5BwDIWDdzY3TppG0Ta/MMiKVfavQYiioM
	 a2kiA3Asq227aDTlQwH30H2firUQTS5KuxwdWSSWbnzOxjxDnZ1/XzgjQtWLZ5NihW
	 X8A99A7Ty0vi6XaCGz4ZuQXjuhnA8iMaXkVesY+lgTIZukCeWYiqO5rxpobsk15/wP
	 PBgUZ8MvnCSOg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E2A2547293;
	Thu,  5 Nov 2026 13:30:22 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Thu, 05 Nov 2026 13:30:03 +0000
Subject: [PATCH 4/5] drm/msm/adreno: Add speedbins for A660 GPU
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
Message-Id: <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793885419; l=1126;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=oTxpg/D+jgMPGwDowW4xu7/gXp7fpT5IY/GcQ0zhKx8=;
 b=GtKovN95UpCfH5qWyBuGsZ9za1/hCqHtLIDArXBKbwZbdw5gl9dUiN/Oe/pd1G3Hp2tGiyp7a
 4AUL0ZNm6tVDmNcNu2ff4xE54HicFA9S81wb4KHBOoCJwJB8mrSFmQy
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org
Content-Transfer-Encoding: 7bit

From: Demeter Barna <me@fromdisposition.org>

The SM8350 GPU comes in speed bins, read from QFPROM 0x17b bits 7:5.
Qualcomm's GPU tables for this SoC give:

  fuse 1, 3:     up to 900 MHz
  fuse 0, 5, 7:  up to 840 MHz
  fuse 4:        up to 738 MHz

The levels below are the same in every bin. Map these fuse values to
speed bins 1, 0 and 2. An unknown fuse value falls back to speed bin 0.

Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 4ef2bd6e7..f1ae9932d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1096,6 +1096,14 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 3, 1 },
+			{ 4, 2 },
+			{ 5, 0 },
+			{ 7, 0 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06060300),
 		.family = ADRENO_6XX_GEN4,

-- 
2.53.0


