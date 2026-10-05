Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5024D9563;
	Mon,  5 Oct 2026 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220622; cv=none; b=fJ+FFzYoioY93PBLd311QFAukm7BGqymB4tcRsMBEW3Ztevi90jFCC50jS5h8KRPlbD3nGFGuvisBRSH4pLfEOSGoptqOjL/QlEHR++Ufk1wsd8qTrdxb9tZ7Q6da+JyrgescaJmkZLZKrqiaMNlKNQPAY2bGkfzsveGKbijit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220622; c=relaxed/simple;
	bh=JPuva7QZtLamKWAdVeVsRE0euPZ+x87KqFuXg6nFB3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrtLtfkCjfwhv+ObQOoKQPWaOjF7rSJAkC5g9xD+5ZSBjZucHvtnkTRygTw9lIV1FbbPB50iWA/JsKxKUashRS9/ecpvgtiGRwp9gFZ3bHAtMBMDvpGFjJGgWh/YtZs20oTSz1Tzp5FZi/u5+ExjeEBpTomh+Mc0le3SgtEs9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHP8OC73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHP8OC73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23F51F00899;
	Mon,  5 Oct 2026 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220620;
	bh=W0NKi1qQb48zzSUgOuY9xyOYM8hAR1kRMFhyRqRfWdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DHP8OC73BMTCw5HIPlysfNk8rfX+2u/+6l2ezfSuLZk4rNHnM1jEnejVWmRPFQpO8
	 8AOnjuuiTL/d8LNY1bM9EuiLA98jfD+6/hspamkLoXYrY9vBifOd1BXYpPE/Ztwrm3
	 37K9JAzAKrvm4c4RebwaxCN27WgysMZu3CF38r/teKDhlWqX6VV7uyKvxRHOGaFgCT
	 895/0QjVh+TXsp3CJppZLCY09qSjlwCWjpyEj3weO6UXt8J2IIuVWUKizvysQTgp8Q
	 o8JMMOoe0jZbTeLfQvu1IYb9di4hIqZolm/rwfLNVlia1ZGxc5Ucu4/BuzfhvSStjC
	 hdzilgiD1rt3g==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:52 +0200
Subject: [PATCH 22/74] media: qcom: camss: vfe: Add is_pix to struct line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-22-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=bod@kernel.org;
 h=from:subject:message-id; bh=JPuva7QZtLamKWAdVeVsRE0euPZ+x87KqFuXg6nFB3Y=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sQTdJCRY28evpxoNO2zqHZCbF9ZAXpEeF5T
 hgPBATjWhGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbEAAKCRAicTuzoY3I
 OoYbEACW1iBNK+1Db0z0g6xuyMai55kGZ71o99IAFot/d1hzg9PxMJF19oRAZ0wp5I4981fiqQS
 ieprbp6Tbn8XhnvATtVhVSVLfW5K/XGzbbjMGDJ+RvMaYonbBrh4ijOX8qcRC9gmD6MuFeKN69t
 qG5xpWM6E+1FU8J/vjmZZ0/Ft20UurPnH/Qd7HLq11uLku1VD7xis7EPYY9xRQMikXRekbbSvzy
 qkU9ozx+iTTmhOXOXRcxFiPYz84ImboBXSYQ3Me1LQJeT6TqFTowZYzBs91jnISyir+Si/L1fej
 y1mQIqVcG4QBxrlZTcuJd0/Nig/Jg5B8JToC3vGuI9zwQIzqg521euvBzQKSS1GlMH2+NcnKUBK
 wcXsB2ADMuvTPXNuMTaXwYjIyuHb+I82I4zT1K5J9SJTREJGDLbcXPvv6goTSQRv3wbVlCe5i7s
 ewCS3T8c49ZVv4Oo9kbZNfmrvSUNqNxkwB40FewMMaVl91V2NaerZH/jDmgq5GK64ilnnVt7ecu
 qL1u6A47MJgTYZjI4lP4+5TkVO/mxBFaxNEKk4IygexoLtAPW9QcxzgsEjYXAMKvbHVF0wZ4bSO
 UxNz/aPLR5UsrH9g2Jolwhd2LES2fEPOCmIZnuVetbhGMzWGqcPQlNA8mwXNEGv/IrLrMLcaSs+
 X4wLtTK+2Zq7FIg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Differentiating the "line" the input line to the VFE as pix or non-pix will
allow us to properly differentiate PIX from RDI without any magic indexing.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 29682e8e9f401..79786c34e48a9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -116,6 +116,7 @@ struct vfe_output {
 
 struct vfe_line {
 	enum vfe_line_id id;
+	bool is_pix;
 	struct v4l2_subdev subdev;
 	struct media_pad pads[MSM_VFE_PADS_NUM];
 	struct v4l2_mbus_framefmt fmt[MSM_VFE_PADS_NUM];

-- 
2.55.0

