Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6DB4D6C21;
	Mon,  5 Oct 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220544; cv=none; b=SccUyyQUVfTXqqWaITu42m1M5jfUN7uqm+pVI8A4gLZxgfNsvQtGaDkw+4gHaJWXfy7O6Tzx361TvTANX1BHFnct+ugUKnqANcwuDF9H47pBvajgWktNDCYvU6oqZ7QkmNZW6rXFVKWMHfhnWUTzEJ+Hn9bFgP3ULc4xNi/RaJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220544; c=relaxed/simple;
	bh=NVQzTWMKllY+AjewCXqDKOS9dMGiUf8Xf7ZvOao1udo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PX45qFYw9gqdZi9GpXjCKWdOipqlES7QaNRlH6KjYC2Gf0eSurjzUrWGiX0+fJ+haP7OAU8LvxcbCrdv2WlpjNlavNtmnhR3FZk/MNLEsF6RVi4tU/LxLukpiNMFviOPEiH945238W+gEsy/u1Z8tugeOfF5UaaUESxC2OxvGXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBsjaGiA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBsjaGiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB1A1F00893;
	Mon,  5 Oct 2026 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220542;
	bh=v96+STY8ud8kO5ROJpPIswk24pOOK9qTlaNX+bsELd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fBsjaGiA4/1uRUPeDgnbIRqNXkhK953Gcl0G23fS9RjFbC48bXAMQwDg8EuqaHNqC
	 aP69HCowNU7jZAy2BpjMDnA14SO6WH4Pv7mihkFK72FSntT4DRdtDsnlahGVKZiwue
	 X8GDYyRKiKiBOHZ9/HA0xx1rZc0S3GtN8n4kTnLTUYNb46DLhg3z6eT63JBJXXBZY7
	 DD++D7dxXv5mplkQR4+PAJv2Rf9rsN74PJjcmJFWRTJKaYNwwQOzENi6VAqmUNBr4U
	 gn5g6J7mYudsvqyyFQ9w0dvaFQsFQVKtNNy/4aLHTOvvTKjlMa7+c9xhobqs3qQtWD
	 sSRMhtbJfYETw==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:31 +0200
Subject: [PATCH 01/74] media: qcom: camss: vfe: Rename gen3 back to vfe780
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-1-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7709; i=bod@kernel.org;
 h=from:subject:message-id; bh=NVQzTWMKllY+AjewCXqDKOS9dMGiUf8Xf7ZvOao1udo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sBy3sposrQp/BR70DlM6exHpLKIpHNC3tzD
 9PKWzGqM+qJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbAQAKCRAicTuzoY3I
 Oi0cD/4zDvPEwBZFg0Lj3HvIfVvEyoGOOjwHep+HhyIN64jnbMhO4gQnFYT6dwl5R+OXGSGmPQR
 jeQ5z3wLMLaqHca5kPPOt58liNbErsi2wqY+bJvlwFiEXp6P0TP5iWJA66uXSX3/8z4JG0L7nPZ
 ad59iGNcERjaoMmeznPF4lbLukSXKfvWV3Vl/Pj0eehmHilPTrr086Rz+ZVwnmhSeimqnCF+xSE
 UzVVcV3W2ejnvZ9OCkOOn6ViGceYoeCYZ0YOD3A0rtmuOlCvsFWiq1qT7Bjp1vJhzBrnujSTZj7
 abI5huNbz0Ty9E5PWDr6MlqgkpSW5l+yZK9nwTbzftVq17YUsJD/vt9S4yIDQNjYqJpFz0dYVGi
 BiQtTDCOmllFkRZ4/UYoMUNveGTzOL0seC427Da46lMwdR3l/jRGR2zOz8WoScqmw7eokG2pvGs
 vlVhyTwEnr+ODiu3KJ/k/oo3xy9uS3zwzK9+q7v8WROjGOSG0SrKRMwm+2QS2RJEEQhtKJcOdgR
 /bR+ZsDbzrjASzNpZZI8UUOWcwG2DQW7KI8ZQmuYmqohJy3W6m1Mafp60LHd0dAaNFET1wFccY6
 BKXvakuTbueF1xdZOhAGXnF01tJU7OTbNeZIpKsY2y8VlWdO1ek9ra/bjMUdUC/7u/ku9N7rR8b
 eY0CzMqqctSXUBA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Conjoining 690 and 780/880 class VFEs doesn't make sense when you consider
he write-master indexes are different. Clearly these are not the same
generation of silicon and the code to support them that way is cumbersome.

As a first step to fixing that, rename vfe gen3 back to 780.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/Makefile         |  2 +-
 .../camss/{camss-vfe-gen3.c => camss-vfe-780.c}    |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  2 +-
 drivers/media/platform/qcom/camss/camss.c          | 34 +++++++++++-----------
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 27898b3cc7d3c..e82bc8141c241 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -25,8 +25,8 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
+		camss-vfe-780.o \
 		camss-vfe-gen1.o \
-		camss-vfe-gen3.o \
 		camss-vfe-vbif.o \
 		camss-video.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
similarity index 99%
rename from drivers/media/platform/qcom/camss/camss-vfe-gen3.c
rename to drivers/media/platform/qcom/camss/camss-vfe-780.c
index 22579617def78..6c04e3c64b841 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -174,7 +174,7 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-const struct vfe_hw_ops vfe_ops_gen3 = {
+const struct vfe_hw_ops vfe_ops_780 = {
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a378..68cd05331ffe7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -248,7 +248,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
-extern const struct vfe_hw_ops vfe_ops_gen3;
+extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..80697d0ab701b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3218,7 +3218,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3242,7 +3242,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3266,7 +3266,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife2",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3287,7 +3287,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3308,7 +3308,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3533,7 +3533,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3560,7 +3560,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3587,7 +3587,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife2",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3612,7 +3612,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3637,7 +3637,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -4001,7 +4001,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4029,7 +4029,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4054,7 +4054,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4079,7 +4079,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4104,7 +4104,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4129,7 +4129,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4154,7 +4154,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}

-- 
2.55.0

