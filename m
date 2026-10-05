Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F35187F3;
	Mon,  5 Oct 2026 17:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220689; cv=none; b=EBoWV2a5kgJUhXdyHlBpdO6r/pemkxKmoU/ewNlNsvCvdS8hBT5pc+jgDz3x3MGRQlgelwfemfDUhhgc4ZL/cJ5gZfKP6IpAP5xuw7i8q/xTYc2CFJfgxTZxA2iq+nSeO/K2mIXDnhS6jmV21iTEpKk3TW3emqN8OMGulGFlSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220689; c=relaxed/simple;
	bh=mTo6MAmOG0TMWEylFnDu+93NVpA3f3hWu656fTwrsJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWAbaHLt+YUReWvXs3hVxhfCA07kHpAjqDtcK1LBMR31afFij513i4bSz8qjsc7GjbF9pmnQS4ydpoV4m9GLEFMpENhNCVAtd56Vqxy0jr37PMs2B/mdmMAkrAIiJaDDruts/0EUG127rjiAomzyU3H3r/bMX4uAlnB2E95iLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcTt0nRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcTt0nRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B50C1F000FF;
	Mon,  5 Oct 2026 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220688;
	bh=1/QNc1J+B9twFWeTCu52enJfL+yKcb+Yyl6MGRdx+AI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hcTt0nRst0akULDpC9QliScMU717mbSXykHOJjwguTsW88MsIdbgxViRhHoDO75bh
	 NzjS7/d0faqA3ermATMpNnU6mxy78BVDzdSoX56PYJ66AUBdJ3/4rzs01gc3VtgMEy
	 4OrdiFVjDHUlM7KgyVwrX+Wpzr49HL8lrj60J1lqxdeY4jg3XkA1fxofbr61ookptK
	 9PE43xvRa96W1FPAmx8ciegJaRXfvjfE2Gv8v/3efGkah04lAsc/a/IJ1vlk3KjP2W
	 HIcYohoDYIKAR1KAXPC/ezyWbB5pdS/x9iTHM27KHOw8tfp8aZuP5X5mkq/JwuVikQ
	 IAZ310b/vM3jg==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:11 +0200
Subject: [PATCH 41/74] media: qcom: camss: vfe-gen3: Enable PIX formats on
 PIX interfaces
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-41-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=bod@kernel.org;
 h=from:subject:message-id; bh=mTo6MAmOG0TMWEylFnDu+93NVpA3f3hWu656fTwrsJ8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9seBYdSniPvAqZpATVMBRdallDJ5OuJ1gm2X
 zy2KeTZYVGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbHgAKCRAicTuzoY3I
 Oop4D/43aA+YzoXwUDaIHjA/txLvCGh8Uy0hvaSQS2/iv24S7Dpe1ipJd0zgCJQei2iJhdFfcac
 iPSYJI4BoJo9IGSu9UoOwjszXmCbpfQ+PNXiwlAp4FPlT2UwFUKaNuC40CMBc0noGjokd63Uhf4
 cfdVJs8k2Kwhff2ibUynVIwkYKLdmZKJEYmxRD1j/Y5wzSAa/7SM1NvtzyjmXINqahW8LYNhlvP
 z0ABU12OCEkpuxBABmQ6XQOvH51Dbagj4UQ1SxcLVCIdB3Pw6b+FN+Ye3BDUyE+RAdCZrrVvlsi
 jBnhEfHFFfVKuUiZWuK4Oc1t2400/OWwcz8pb+Cv0RbTtCRZKdAgNGco9vu7h3TUNvjWYz0TTra
 7WmiGRjOFQsicUAqZshSbzM9nfI4mvJKvcxHPQkQpYDgwq2DLEd/mK7l091W9VXcEetj78pmeDT
 4WI1X45EoLGWkCFnQUWWmlHNcnXBx2VfnmFP4U3g9S3GSu3ZEfHL128y9ELbHevWb9vT+uP3TeB
 yo1/rJVPKGRyiO+cHg0/iqyGHkCOZwt33/HinCQldwIHSsDkM4ccjYI75SJzvxD61yvHHrujsjV
 Njw7FdWfJAFuPLRieRWlEd0S49bzOEXwLElwp3LMA2aU771cnVxaxQOWnm9Gc4rhbyba34XRpTW
 ddTTEUoxoahxXUQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6f3de2c185bc9..66aa665848fe8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3535,7 +3535,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		},
 	},
 	/* VFE1 */
@@ -3562,7 +3562,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		},
 	},
 	/* VFE2 */
@@ -3589,7 +3589,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.pd_name = "ife2",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		},
 	},
 	/* VFE3 lite */

-- 
2.55.0

