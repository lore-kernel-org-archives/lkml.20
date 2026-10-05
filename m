Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A302530E06;
	Mon,  5 Oct 2026 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220759; cv=none; b=j9qBy2yaWemaXFcbZuCxBIrgV4GWzAX2Z+h9KvpjoHDxdF2zxZvYBXdmJHmFXoWcp+W1rRGyO2ASmmtv7mkEBk47hISyb42L5B8VxCMstnlKeZ+qwIZFxNwqVqRorggf4gWEnbvyaAusEhzx+M+kysNC+qGzqfpn7KnE/p8ocSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220759; c=relaxed/simple;
	bh=R/Wf+iCV5OIpOk4ARp50jI/CfNcjLaWVTz95rDPKGsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pM8oZbXqHaRQMzmPCAV7cCKqAWocLHTFevos9f7CGejR7mSIePZLOeqi+RJIfQeme8y4ZkcKmXfL9yrYkzIFctEFPU6687KAuWaU5Iofqg5a3xxne2JfaifZTLi0lHLKdtBHpEJKRVYsz4SwiJSp+2Oq9TSK5QAl3LEhxNKHUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyvtUmrq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyvtUmrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331601F00893;
	Mon,  5 Oct 2026 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220758;
	bh=QLJi2iC+gVHm4rNAhO+oE9aXYqCC8e7UITg8o41jhro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QyvtUmrqRWlV70DhWMj+wpD+o5f0K7McoYxluXzCNtncLh56ytVyga7JbahVdlasa
	 gKQ0DtRhz4683jP3LVcr5qLlQa0Z6pbgGgWyeir2P+TBfyYqpteafdpqgq2g+ld7K8
	 QrWnMcU3H9hw2Z/04itbjNr2CJt+9rN3jnk0VAWqGP1Xtisbk+3Cl/EEDHjZMIyrzM
	 vJErYt7ulx/w6Dc1RBSZbTXWIvnhX4UES50ihcifXEi7B6O0x/6XDjpjbXWV3ie+9N
	 GOmBGEuWUekrKqvR7G0hN/rZjFpmn+od3PiJ4nvsbQAOW+1L6mU+gh7XO19na4s1Gl
	 qpmdsTvlDh38g==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:31 +0200
Subject: [PATCH 61/74] media: qcom: camss: vfe: Size the pixel path clock
 by its pixels per clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-61-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103; i=bod@kernel.org;
 h=from:subject:message-id; bh=np25x0qd4SQEjScXdahmff2AfvHOC9bljVvPMRGNckw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9ssVbb1Uv7roUtVNzyqN4JLeZS2XTM28dkAG
 juS0dlRR1qJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbLAAKCRAicTuzoY3I
 OjtUEACpjaqicD0qRxyb/9KZj74QfeCpeLya4nREZlBOEsmHVMJM3c9qpZvHSkhlRsOZGE3uo54
 OcBWB/oCDi9ucDgHlKFmoQtiBdQUvmvAlSy1EnUWDeHuVqLhYyMkJlnMXS/8Bdgq5nyDqWwSU7L
 AWG6q5mZJkvy4u6wo6bAnv1XR1K6znY/FdEYCyxn9zVPYAN5R/oslPLabbnPorA/xdCGxLvsxg9
 eCQgsnv6CRnM3vlYWtejRwP1WprAvHqUtYbgnUni/Q0hWfFwGWdqaoTPltQN18J7earVXrMaOh7
 zc4gEMawDjyQZnZ9KCCLKw7ITDRCE4q8JpK6J1VEvyoTqSZEEAOM9faMBrVCH2xgtkX8rrtW+2m
 OtzV9+Yi9huBw83v+XOSaspklV6mpLeSvSLDGvmBkqMXO5z+p6LWjHWMuqohYsqJYa9/NqFojMF
 DR0tNTQ0OEZ9tFYN2fifvbn6JG7KmjGI6bNlobd6HLvzLX8SPj6Yzl9rUsX2wvSqddyoU2+0stL
 dVjB1YHc9iusQX/ZcPGEXqMORwqJ8kliBIpchjk7tsCPx5RFBJkGmLA3nZ9WOAAS1OJhlBgp4HE
 JF0gbvJPr2tWXpV7ZTv5PdaHbdsDOLtyyPR+z0Pwers6OdtHX4qAbMygg7apHrlmNT6dX5lODr1
 Q4ZrsRQIpTX0VRw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

vfe_check_clock_rates() and vfe_set_clock_rates() size the VFE clock for
a pixel line at one pixel per clock. That holds for the VFE 4.x and TFE
pixel paths, but the SM8650 IFE pixel path takes two pixels per clock.
There the PIX line asks for more than the highest VFE clock level and
fails to power up with "Pixel clock is too high for VFE".

Add vfe_pix_ppc(), alongside vfe_bpl_align_pix(), and divide the pixel
rate by it. Every existing pixel path stays at one pixel per clock.
SM8650 takes two.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index bf8ae6a6bfae0..588a355b67ff0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1137,6 +1137,23 @@ static bool vfe_check_clock_levels(struct camss_clock *clock)
 	return false;
 }
 
+/*
+ * vfe_pix_ppc - Pixels the pixel path consumes per VFE clock
+ * @vfe: VFE device
+ *
+ * The VFE 4.x and TFE pixel paths take one pixel per clock, the SM8650 IFE
+ * pixel path two.
+ */
+static u32 vfe_pix_ppc(struct vfe_device *vfe)
+{
+	switch (vfe->camss->res->version) {
+	case CAMSS_8650:
+		return 2;
+	default:
+		return 1;
+	}
+}
+
 /*
  * vfe_set_clock_rates - Calculate and set clock rates on VFE module
  * @vfe: VFE device
@@ -1169,7 +1186,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				u8 bpp;
 
 				if (vfe->line[j].is_pix) {
-					tmp = pixel_clock[j];
+					tmp = div_u64(pixel_clock[j], vfe_pix_ppc(vfe));
 				} else {
 					struct vfe_line *l = &vfe->line[j];
 
@@ -1250,7 +1267,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 				u8 bpp;
 
 				if (vfe->line[j].is_pix) {
-					tmp = pixel_clock[j];
+					tmp = div_u64(pixel_clock[j], vfe_pix_ppc(vfe));
 				} else {
 					struct vfe_line *l = &vfe->line[j];
 

-- 
2.55.0

