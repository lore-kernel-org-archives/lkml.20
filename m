Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3766B4E56EB;
	Mon,  5 Oct 2026 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220600; cv=none; b=IA20ZoxA7n6VXmb0eVYjTHaoDkhLs82JE0cpRVhNslyd7ERfA+k37+5769BJ9IJHfBQ4M01XVjXeOUyXcMQjYY1gCjStE1cEkC8wR2on2H+aaWBjD2OqTmDVsrKN/vAiPssSVh8WM85OuYfmnp0GZNtB4+6sBgEqak6NZjAegFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220600; c=relaxed/simple;
	bh=1fM2cWqConx5kmN6vxn2B4RMjoqxNNfUoK9XWGrOla4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UclmAjpQMe82tbR38tBD5Ww2LqkZa73/ruyAcL82llANmDg26GvGy8H4mq49gT2+J9LXMYsXbev+UUG7xut7AN7RD3zip59sBSO28Y/0e4h+dakvRRvdOtzqs4wrvR8eDUkWTjWFAFhen7KzSfngEXGspJnbzK3mKrmk2TPI4qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZPF+RzP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZPF+RzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6DB1F00893;
	Mon,  5 Oct 2026 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220599;
	bh=ijtgzLepcN3kh0RbPTLJQ7U0bVcDQv6nupI6IOBbMag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QZPF+RzPUjcsOjrGb+PioK7sCaV/GuebhvdK5HtXeYIRIfcNWNWYaS4L/mpywuTLC
	 /ocP1p5ZfvtQ9h3JtKDxhroCB556mKL4NIfGlMzYYnyjg8dQWPLxhxXU7+ytLIuD24
	 0AykA3FWPtJHDU2Bt/Fol7OgbS9i23JJJaajfLuY5ciqMZpf7FgvH86dP3wkFQ8lPg
	 JWJeG52frgzpK8lTHrwfMMFTNgrdAxXOfjpNZ4jRzTGiPGCZEt84xlVWv84eLncdHo
	 HJw+P2S0sqKJsOvJoA3661WFslkz14cGF5Ye+eS/dJ7TdiwB2x9I+PJAKsnKGMrQAp
	 /mgljVH7hH31Q==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:46 +0200
Subject: [PATCH 16/74] media: qcom: camss: Switch existing
 vfe_formats_pix_845 to vfe_formats_rdi_845
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-16-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14949; i=bod@kernel.org;
 h=from:subject:message-id; bh=1fM2cWqConx5kmN6vxn2B4RMjoqxNNfUoK9XWGrOla4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sMJuCXChF3J1eOkkBWLI6J7vVCqiS062McR
 9yCNyR7EwuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbDAAKCRAicTuzoY3I
 OqxqD/962Wf5KjS6+WGokwQrpPex+bBNp105R3MVpPprKJfKNqZ6ENZdS1/3ME1b8QNFz4RP24b
 vl4XkQnvXYJTWVgl2BTXsCWyXsjQ2g4jn+fByVyd8WM8Q7L4pWZv/AVQaz8LkSf8uG1mnfLFWLZ
 kp6K3IP+tSKnE4c5nqL4vJfjmLS7nYA73slbYwPvmQskYA2zdubLiTczvcsHS5tyfCxO3lF6ZGc
 124ofDde4drb1pr9OObBnAmaQuLcthyRG2QU/O2cun6eBbL7yOypjZCww/ZG+xCK7VSXJUeX1TS
 EV8Q33J+gGANQTpP6RuhPXiQcx87ixHAhqpmnSqmsUYxxLjzK8PiTC3ezoLrMp2bDc/aLSXF7lL
 Gm9GWOFZhbjOU+VvK+sErPdrgGyyq9m2tP+oamBrf81a/OX8gO6+2QKQNoxKjWGNwelNJKTnrSJ
 52tWYxTB3t1RG1GmV9H6r0GaihxDlRCSJ5v8tlVemIvD1sRMx70fMZDJYjRPdxRLBtOx+mSt9b1
 M29rP1e6Rf0+Wi78R9iGU6aPdOT5uj60bKammhCn8N8DsfdWLvhqkktYyFoOeIM/w3eN52feNI9
 QTJ/G08tsmz/Z+Qd7QktKoNp+ATSqs23c3pccB4qQYLJzNgkq5YlrMlGkGZZm8w6Gve21rkkgCK
 AmhMn8SbXbCmNPg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Right now the vfe_formats_pix_845 points to the same data as
vfe_formats_rdi_845. When we actually switch on the PIX formats though only
some of the PIX interfaces will support the format conversions. Repoint
existing PIX interfaces to the RDI formats they actually support. As YUV
formats are enabled on a per SoC basis the enabled SoC's can be pointed at
the expanded list.

Repoint existing stuff to the right location as a precursor.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 98 +++++++++++++++----------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e7a1a25d7c9a3..ff09873706c0d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -777,7 +777,7 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_340,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 
@@ -797,7 +797,7 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_340,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 };
@@ -1207,7 +1207,7 @@ static const struct camss_subdev_resources vfe_res_670[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 
@@ -1229,7 +1229,7 @@ static const struct camss_subdev_resources vfe_res_670[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 
@@ -1249,7 +1249,7 @@ static const struct camss_subdev_resources vfe_res_670[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	}
 };
@@ -1460,7 +1460,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 			.has_pd = true,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 
@@ -1488,7 +1488,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 			.has_pd = true,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 
@@ -1514,7 +1514,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	}
 };
@@ -1642,7 +1642,7 @@ static const struct camss_subdev_resources vfe_res_sm6150[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE1 */
@@ -1665,7 +1665,7 @@ static const struct camss_subdev_resources vfe_res_sm6150[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE2 */
@@ -1685,7 +1685,7 @@ static const struct camss_subdev_resources vfe_res_sm6150[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 };
@@ -2150,7 +2150,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE1 */
@@ -2176,7 +2176,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE2 (lite) */
@@ -2200,7 +2200,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE3 (lite) */
@@ -2224,7 +2224,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 };
@@ -2467,7 +2467,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE1 */
@@ -2493,7 +2493,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE2 */
@@ -2519,7 +2519,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 			.has_pd = true,
 			.pd_name = "ife2",
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE3 (lite) */
@@ -2541,7 +2541,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE4 (lite) */
@@ -2563,7 +2563,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 };
@@ -2813,7 +2813,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE1 */
@@ -2833,7 +2833,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE2 */
@@ -2853,7 +2853,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.pd_name = "ife2",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE3 */
@@ -2873,7 +2873,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.pd_name = "ife3",
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE_LITE_0 */
@@ -2892,7 +2892,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE_LITE_1 */
@@ -2911,7 +2911,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE_LITE_2 */
@@ -2930,7 +2930,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE_LITE_3 */
@@ -2949,7 +2949,7 @@ static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 };
@@ -3220,7 +3220,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE1 */
@@ -3244,7 +3244,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE2 */
@@ -3268,7 +3268,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.pd_name = "ife2",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE3 lite */
@@ -3289,7 +3289,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE4 lite */
@@ -3310,7 +3310,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 };
@@ -3535,7 +3535,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 	/* VFE1 */
@@ -3562,7 +3562,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 	/* VFE2 */
@@ -3589,7 +3589,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.pd_name = "ife2",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 	/* VFE3 lite */
@@ -3614,7 +3614,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 	/* VFE4 lite */
@@ -3639,7 +3639,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 };
@@ -4003,7 +4003,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.pd_name = NULL,
 			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE1 */
@@ -4031,7 +4031,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.pd_name = NULL,
 			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE2 (lite) */
@@ -4056,7 +4056,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE3 (lite) */
@@ -4081,7 +4081,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE4 (lite) */
@@ -4106,7 +4106,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE5 (lite) */
@@ -4131,7 +4131,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 	/* VFE6 (lite) */
@@ -4156,7 +4156,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = true,
 			.hw_ops = &vfe_ops_690,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		}
 	},
 };
@@ -4434,7 +4434,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_680,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 	/* IFE1 */
@@ -4458,7 +4458,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_680,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 	/* IFE_LITE_0 */
@@ -4481,7 +4481,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_680,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 	/* IFE_LITE_1 */
@@ -4504,7 +4504,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 			.line_num = 4,
 			.hw_ops = &vfe_ops_680,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_pix_845
+			.formats_pix = &vfe_formats_rdi_845
 		},
 	},
 };

-- 
2.55.0

