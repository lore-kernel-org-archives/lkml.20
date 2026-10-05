Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B764FE2C6;
	Mon,  5 Oct 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220654; cv=none; b=eIpOEEYk2Ry5MSMjps+vWNRTRKnnGYcJXG5XRTevbK4St+N6GppUxU2i3H+YOlzVVXRxUZbGuoqa+Gm9X0u8z1SZDzk4KvCEJwZnFnq5cPyC0ylFZe+5+ZdtsjqXEw8TNbsF5FcTEgCm/n+1EmQPCUTCF1K2iDAopUgiAWH5jhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220654; c=relaxed/simple;
	bh=q/Mq5k29Pd5Q/VG6hX3SwIcl/+/m5v3nSG1R1XxsBXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3uCa1iZ/FHNYjDdorjUPh88SG+epfbseC3+e7e5Kp/dVI/vIiDZxdF5CFk5ix8dUH1H0Wx+XIG628aEsiZR9Uk9oC6sLiyLYV5pO7DUCW0CjU7xMkgvIMSNJqFym1bMkvLMcXEOg5WW+3RqDZuTinnH37seRcLLF2Iut3GSHmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg+wr0W+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg+wr0W+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3CF1F00898;
	Mon,  5 Oct 2026 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220653;
	bh=Vf7bahP3WYdgiJp1b9P/oFdoqOuDgOIFK0rUJ6QQCEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Eg+wr0W+f4m/wg5aOsUc0+aX+hQY2w0XmCPsC+vVqCfmh6m+DUYcO9oRnwZNOOpZV
	 0VNM7G5v3A+niHuvwxSmSw3oZQBYF4ucB8hYoxg6qXv+kGkEmUi47uiShXPBN6rEsy
	 /SPVr2lUcZFHGQyFTQxAaVtr/fY+fuKoY7/vjbQ1RpcMCDO+pizTVjDQLMhcVYq9NB
	 mngG/U5nRGxcF6Y5xh86nN9IGwOmECYwameJv6suFqY1pKuLru3Dylgyhw2Erxdzjg
	 cTAdvYHqfEw6e7r8EQvu1BmEq+tGowPm+HVls0iSddFFgj3qhlLEsFVyHYDXSG+Q20
	 Wur87AL6hroKg==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:01 +0200
Subject: [PATCH 31/74] media: qcom: camss: vfe: Add support for updating
 multiple write-masters within an output group
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-31-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=bod@kernel.org;
 h=from:subject:message-id; bh=q/Mq5k29Pd5Q/VG6hX3SwIcl/+/m5v3nSG1R1XxsBXc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sWOLkHZx2M0VwiR+aglxhbsMHLr98bQXwwt
 PJP572mrj+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbFgAKCRAicTuzoY3I
 Otw+EACfw5KgW5I5RBpQPbwYEnLrvrtZb0IaF+AzM+jDR/xbN5SiIAeziOiMk72z3tFmrxUhVD0
 7xrVpFoyfK5sfGhiqoBkHRZ3/zIn6aGsuEeeSgozAJhtgdNkDoK6weaKGzT0/65uD437fxnH7M9
 DLtnzR9CDAQ02fzOiLQodwx1SwiMpP8F0Vx6Iybdc1Er+nXFK1tt06q3aZgUbqOqJ/PcQRksQl8
 R7Ri2nuBOwg0zOkAffq92xE/YJeCpQv/qAR3L2LisynvdX48DT5DJHtv6oEJSAq6A0yF3ZeBtFH
 954oB7jGuCacTiLEMM9NCt556prjFIXSLL3EcWsbiJIQXn5L/0lqqYyRdQMuKUjriUwH19owJig
 VSdDnx0hPVPDQTioAmCA3detvUf8PWYirZgyLu89ffoCwoPIrSdQP4qc4vuKNuXuzeE2G3ONrIk
 SnrQLF7D0EevergW3+Z6vkYMEaPBWvy8fV2m8W4vrWsDgXB3tva9dri3+LtgBzp4erk7lhlSPiv
 mCPOOuv1k9y+G6h3Q0r3n6pjmSxaF//RgSsSO60gS7J0AMP6PAchN4uQlSUMeEi4lGI1xOCBBrG
 xESpxgzflJmn8DtlNqh0g41EJVb8Vmyxe5sRojIMiQpYjB6cDqdxWEXzqezX87IGxVMr1XADd/c
 OcF4LSfAOkYFAOg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c078af53b0758..20d8b3e1e4459 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -673,8 +673,11 @@ static int vfe_enable_one_output(struct vfe_line *line, struct vfe_output *outpu
 		if (!output->buf[i])
 			break;
 		output->gen2.active_num++;
-		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-				   output->buf[i]->addr[0], line);
+		if (ops->vfe_output_update)
+			ops->vfe_output_update(vfe, output, output->buf[i]);
+		else
+			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
+					   output->buf[i]->addr[0], line);
 		ops->reg_update(vfe, line->id);
 	}
 
@@ -741,8 +744,11 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 	if (output->state == VFE_OUTPUT_ON &&
 	    output->gen2.active_num < 2) {
 		output->buf[output->gen2.active_num++] = buf;
-		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
-				   buf->addr[0], line);
+		if (ops->vfe_output_update)
+			ops->vfe_output_update(vfe, output, buf);
+		else
+			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
+					   buf->addr[0], line);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);

-- 
2.55.0

