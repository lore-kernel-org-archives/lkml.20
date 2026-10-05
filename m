Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CEF4F055C;
	Mon,  5 Oct 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220626; cv=none; b=FYHAwQKEufdc6GrMq1gj8GKDlBF1TQD3btn61dgirbabXaKqwqLRR6vW6UU95gUUcCD21o03HiAPgsBYL5Q4l+/WCRtMScN17YAxEprBVseQxbR+6O3JMC/qpNggTzi3aCL2wCfbnb8a2onCqncVHG3aBm2+FDJdknsm+K6+Hhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220626; c=relaxed/simple;
	bh=nqGv45I3HU4q+ldvtTNW0ao1IyIGnUsRNzBbdqPGbb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACZNpZK76W6jTJj7lWBwRaGc54QB1DasFIXfGAQW2NLzCxDt+0ZE9x776fcSm1JHjCHK+lFTpHRpLGmIHBIDnl2Fj3Yu9cVPbWiIqBfkfsycDgYEzPdLzfyKIp9fX77pc6Qib1Hm3nbaiGSg1FQtwrIcZfafPSdo0dTFQqna44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrDbVbER; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrDbVbER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5F41F00893;
	Mon,  5 Oct 2026 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220625;
	bh=Ha7d1ahR4nusvF5T2W3bqQjoFGpr8UgYJjzxCOg5zC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CrDbVbERh8HRPk6NglaE1+nKyPNJ3CSX/6vGmZG6I5cAePsY9ghl/NuziCq7QxB1i
	 RHkS7bCeKcLRobq/LoLzrBfz2fRoedY2SISm5OhX80T3kRIiX2wSwIgod9L6VMvPPJ
	 rUIiAEou9va1afwzRuD4rjNv6i9dU1Er8jFwZ70pYpGvcuZaJ7Jf4U6Bzg7EfwNy4L
	 fzwlbGd2PJEy9m+zICZ7E77KV+K1kzEeG64DVpPh/f8tX5Ne6xFBUaz7jDkjYuEI1M
	 Sdhq58aCyPP2BDyQCquyNZcnLVwoXNruzK1lyTnxT6hFi1Zl5NHqyjx0F9pRkh//Jw
	 s6SANXxoo981g==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:53 +0200
Subject: [PATCH 23/74] media: qcom: camss: vfe: Add comp_group to struct
 vfe_wm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-23-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=589; i=bod@kernel.org;
 h=from:subject:message-id; bh=nqGv45I3HU4q+ldvtTNW0ao1IyIGnUsRNzBbdqPGbb4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sR+Eq//uixubCWRdO2gR+MSIGexPYdBgRiy
 4n3W7FNkY6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbEQAKCRAicTuzoY3I
 OuW6EACA34Hra6qb1ZLaDF70Mqu/xVJegl4DE7uaMoHGLHwT8o3qK7EIkyhunpbAOwKsqTooL8B
 I47aHC0qZSm6Vl/RynzdZ8kktBoUDGtG1zMQ6bWdZTCTFnCj0RV3pRfV0K3ywodKMnsxA5XUxbN
 8E7X03+aDr/1i95ZsoQnuP5BlnZ6kPG5Po8X04Zd0jgfQ/27KUeY+//o801Hl5CBvRhWxtoAon/
 SzA/7PC/rfZf/Rwtt+47WANnUiLD0wF3InbXf9j2cE3osqiS9jTf9dyCEZmOjtUjqEi79Emzi5D
 np44Ug89VaEaZKYQFCvPu4ymcAthGH0Qv2CkpTmxOxPC2kFHtu/FQ7ACHSQDCuThgZ7OI38bQTB
 ox+1g2kHz+Y1LQ8CGF69jZCKm/OjIPAN3ttCwmIn3+Qz/OvcdAIxr+NmJR6SSj/Deu+eUCPOQ0Z
 XfAnufflYx6B+OpLG3DQif/6HmUMRnlrFwvyJR2zRNujbY8IjYyexO1EXnL77laaOPehRKqGO/2
 6z0SpoxxX/7GeeGVdqYEIUdOFaywuai8yV54R6ZZ1lvKonwzcuRoi4jywIM5QekdGmuZxD7cXIn
 bLjVsLDpQurDl2GyX3hO7bGMO4ybYZhOrRjyhrZiI9xTE/lvYAcoQAVTWCbAjIK5nf9DG8MhKfH
 Kli1I5IsamcoCwA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 79786c34e48a9..925b0e59f9605 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -85,6 +85,7 @@ struct vfe_wm {
 #define VFE_MAX_WM_PER_OUTPUT 3
 
 struct vfe_output {
+	u8 comp_group;
 	u8 wm_num;
 	struct vfe_wm wm[VFE_MAX_WM_PER_OUTPUT];
 

-- 
2.55.0

