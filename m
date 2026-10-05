Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4D4E06C9;
	Mon,  5 Oct 2026 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220633; cv=none; b=LJmitCcnrb/SqMvJB0TN3DrHqVKrD/rS6QeXaD7PYQ4xQjYRBL7vY2Rhz2f38nQKnSUjb9Iz4wBN9cHYjEe5s/jJH0IIwFTABMgDgy8hvWJLlDnGqD/0nvs2AZKAHon2dh2P7VSaL6++01lQ5OIiiHz3Gq4uSt6J5aUhznMyfnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220633; c=relaxed/simple;
	bh=7CjIjz6ck7lEhPiWpyGCro2u665LuVpChQU0Ryk1ri8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzu3eCxLxI9UL6qJSi3nFHlO1qHGaVL6ZAkQmxpVifC9iENC5amDIPE+EoFGej0Vtue+hrGVqLGKgvhWZoFaCwM29i/XLmpSGWqLDp0Wx/EXDviYiSljGkI7R+kVgcNl3L3jgkpepPOey4L6f9Nq8+A5T8ZXRTr6O9WEOLJQ6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSt+sR58; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSt+sR58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196E01F000FF;
	Mon,  5 Oct 2026 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220632;
	bh=L/GbXlO6Yh6pnTRsZ6enfxci+N9a+JW4qPHEpkvfv2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NSt+sR58VMjzgaCjVVtK3bqY1lg1kdaztBNuOUjE/LGkXyXr0/lRY+6OnQK56XHJX
	 vtRgHoqXgrf9oY+3Y6MrWZAlc78mlPMYggEFxckw5LT44tPcZ3oK1XjBQP1ER7qf6R
	 8/1PHlAB0AiYZyEgIGbGTx7w1XLqypQ0CSarvo8KrbRDwS4Nk2X2MC/iUrT9ZMLtHW
	 qTtt/fru3ZpC/tCGXXqfsLfDXeT7MJJJx6xSN8g+KkrQEAxor5eP03kd+K7Y2jn8i4
	 Cwz4CENyGuJrbrkPEbMjC6se1DdnpmRPuYOV0w4wV5QPmAzFnScss3vcVOALMD9oiu
	 HghBZ+mNbO2wQ==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:55 +0200
Subject: [PATCH 25/74] media: qcom: camss: vfe: Define output based VFE
 controls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-25-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=bod@kernel.org;
 h=from:subject:message-id; bh=7CjIjz6ck7lEhPiWpyGCro2u665LuVpChQU0Ryk1ri8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sSFMPbXvJY6FWDWW6GTvfTB0nY4P0+d1848
 1d1GNoKOqiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbEgAKCRAicTuzoY3I
 OiR9D/9ClGSnAX4JnicHvDDdvIa/SzaADkVloONJlbsJsEwpchTR667JnjRO/4WImhoaFpf1asZ
 vvk5rCQr7mBekb1pR5o8nP+0DwBhvSy3kdaJzXsA5N/rqzcGv7eYrNx4WZ068I1eBnIzjzUdSQ2
 DD67nVv8hFTcVr6yrKKg64t6Aw4Q/DytcCpPiTIkf9fYRLABZ+rjursx+Ejj6ydYO9JCAESR0AU
 rH1Qww9CyNJBFxPclvgNeuxRjcZolUyNbYRlrLT6biNZf6O/gmtzmjbYuTcafEqPTjOcHrxTc6n
 AtpBYFr6UZ9CxNUFu+/b7CdDLqwCdVt4qYw54G0eIDNxkmSEv0Qr6mk6hK4sQ0BiXuRqWVyDqhU
 qj0dduVeD8eIIRKiQ/Z/NNVwxuvUsen5NB1eJbV8JKysT86rtpjSioA/oGcPoOjmEuw3GATo7vm
 k2eQXSyoYL6UG54hp/HdyQJLAOBfm7ommWsZzn2yqQMdsG6cwKi3gqGQCaY6TcpaPSmlARnhoTV
 Yabmn2eHY5xSQ+sdB8CVp/Fq/EXdJkxR7GuGDkq537znEuFrQnKFwQW9lDfaWgUgQ2p1ZaITwfs
 aro5i2z1gOIKevygdf8oxAElFXLfCD+AP6dNSvwN8p74CD98LxRLUjwVlkSnuyGIRWDVXgIjpVf
 ZiYY3mQOMGVqCmA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 6ba0d0c7d6be2..bf8dccf4c901e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -168,12 +168,22 @@ struct vfe_hw_ops {
 	int (*vfe_enable)(struct vfe_line *line);
 	int (*vfe_halt)(struct vfe_device *vfe);
 	void (*violation_read)(struct vfe_device *vfe);
+
+	/* RDI based API - deprecated */
 	void (*vfe_wm_start)(struct vfe_device *vfe, u8 wm,
 			     struct vfe_line *line);
 	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
 	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id);
 	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
 			      struct vfe_line *line);
+
+	/* Output based API - new and shiny */
+	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
+	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);
+	void (*vfe_output_buf_done)(struct vfe_device *vfe, struct vfe_output *output);
+	void (*vfe_output_update)(struct vfe_device *vfe, struct vfe_output *output,
+				  struct camss_buffer *buf);
+
 };
 
 struct vfe_isr_ops {

-- 
2.55.0

