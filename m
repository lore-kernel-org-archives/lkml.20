Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49E5172E9;
	Mon,  5 Oct 2026 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220685; cv=none; b=aHV7M7YTaPj47VHiWh73O2tHaurY9WV6mbwNk95uI0VgPWBRwx6XWe8Tc1TW0NtAJAgzSDTXuWUpROfWHSU/bNrvIBcyjQbLk7fxdbk9a7TnVoNU9Yru9knQr4+5G9JY0q3aHIrrNcDmc9gkYIKZNDX+zzfawZv5J9hnqZ9qFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220685; c=relaxed/simple;
	bh=WfRvhk3MYpzswYMwhoL1fB2M6XWyLC0Luin+lDHgQvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8CKGlbXqEUCwQzqADrkhl1BRTx3lRgqQog1JiPL87w+rr2Axka1chWlho6yURQG2yQ/4Lj2NtO3HKdiiykMnKHPOXiP3N4ZvurEyg4rNDUHwYL8R58ZWjsIxhVpEsyUwEsds/lhzzuJVZli8fl8LsdsfYrOI3keA/HcGoYrbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjziWnSG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjziWnSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902B01F00893;
	Mon,  5 Oct 2026 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220684;
	bh=IydbXxA+TdL1VCUZdzAGOv0LcibHYsj53sAyI5LhWbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cjziWnSGWi4Y0xKCjtWpT0/nFbDzCX8PX6e1QJgOarw/Hs69RIl+5UfGSTanfPaqa
	 KoIl9BOZanEcLbVru9wu8TioFDSh/Zg37CUYYvq3D3d+mSRvi8U5RW57eDsjbec3cF
	 VAgvUrDsPtRe7nhnmhoS4sQ2Tp8RtvUCaAuO3ACTmQW59Q0xnVeftNjXgkIFHIYYN5
	 Jkm8htTy6I3da32pR+HsH3GMV6T6mwKOuHMs9f9b7qfIRH10Tcwfvumsa4lV49Uz4c
	 +imd8Uc6Lv+ow9v+PudT3Vmg0aWUNSvX/gam571CRpVwASEmjUuDHeWR7EFXwRM0xc
	 YB+3++IR+6LGw==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:10 +0200
Subject: [PATCH 40/74] media: qcom: camss: vfe-gen3: Define full array of
 write-masters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-40-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=bod@kernel.org;
 h=from:subject:message-id; bh=WfRvhk3MYpzswYMwhoL1fB2M6XWyLC0Luin+lDHgQvw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sdXbXNGhzSyufCppMGIYbYVBM3f3618fbV9
 6JD8oATvcuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbHQAKCRAicTuzoY3I
 OszND/9dHpe7OP7fb2JlOwqjJp7K1uy3F2aJd0xY5YMYjdRhUs3Y/M6HWLBGKaY/zfpk1yt9GJ+
 6PGQPpg8obl3xcWpX9/y9mZ/J7ved0Dyg0tdYR1wfqeLMnnoyAuJ48DddA8IoVR+wt3O/3ZiqSe
 c1+V4dAsGY4Dz2M02ezSWeYXCGF2jcojRNRj6+p2BK0Rc5YfEJ828g+acR1Pele7S5xnh3AYQdR
 BTv14G8eA2bqR+qzjZ9pbCuLNhSTOwq6PuYzRcMkuN2HnMxwiNzUbFHrRGNSa06evPhvzocWNKL
 /Mz2YeZ0pbPa6Kq0Mb64lvAqKnHxeqI7GfHShdSmtCO5Nl8r/Hua3IQuWL/sHuJoFSvVudARaCt
 FX/aFMp3wwMGGBbingLAh+6d77WkpKketPCYZJaOe4ydMwHaiqLxym/L25b0fPK+EDOAzAOlMhu
 y1nbF1sTx57EI5aBV73+hqNYx+xSgwVjzE1oCHhmrPjGGOuEd99q2Wa/vVEjSplA2/uNZVWRqY3
 YRIQdwmZo6yXoTq+sQs1TMKrg0hOvZbe9qMqV0Hbwc82ADRfhxslBbYQrL5bBnf8O7cNHa+uPW4
 3kdzlxYLD1Sf9xu1daSXYZ7LNuXQ9MmbAr9kwGTrnYnhbcptSqrnY0m0EnYHvhz+qvMNj8OWJ9j
 136tXSWJhRzWp5Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index a4a2beb0c38b7..32b6565aa91df 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -12,6 +12,46 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
+typedef enum {
+	VFE_WM_VIDEO_FULL_Y = 0,
+	VFE_WM_VIDEO_FULL_C,
+	VFE_WM_VIDEO_DS_4,
+	VFE_WM_VIDEO_DS_16,
+	VFE_WM_DISPLAY_FULL_Y,
+	VFE_WM_DISPLAY_FULL_C,
+	VFE_WM_DISPLAY_DS_4,
+	VFE_WM_DISPLAY_DS_16,
+	VFE_WM_FD_Y,
+	VFE_WM_FD_C,
+	VFE_WM_PIXEL_RAW,
+	VFE_WM_STATS_AEC_BE,
+	VFE_WM_STATS_AEC_BHIST,
+	VFE_WM_STATS_TINTLESS_BG,
+	VFE_WM_STATS_AWB_BG,
+	VFE_WM_STATS_AWB_BFW,
+	VFE_WM_STATS_BF,
+	VFE_WM_STATS_GTM_BHIST,
+	VFE_WM_STATS_RS,
+	VFE_WM_STATS_IHIST,
+	VFE_WM_PDAF_2PD,
+	VFE_WM_PDAF_PREPROCESS_2PD,
+	VFE_WM_PDAF_PARSED,
+	VFE_WM_RDI0,
+	VFE_WM_RDI1,
+	VFE_WM_RDI2,
+	VFE_WM_LTM,
+	VFE_WM_STATS_ALSC,
+}vfe_wm_t;
+
+typedef enum {
+	VFE_LITE_WM_RDI0 = 0,
+	VFE_LITE_WM_RDI1,
+	VFE_LITE_WM_RDI2,
+	VFE_LITE_WM_RDI3,
+	VFE_LITE_WM_PREPROCESS_RAW,
+	VFE_LITE_WM_STATS_BG,
+} vfe_lite_wm_t;
+
 #define BUS_REG_BASE (vfe_is_lite(vfe) ? 0x200 : 0xC00)
 
 #define VFE_BUS_WM_TEST_BUS_CTRL (BUS_REG_BASE + 0xDC)

-- 
2.55.0

