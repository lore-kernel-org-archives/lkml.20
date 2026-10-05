Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB23E522EF6;
	Mon,  5 Oct 2026 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220732; cv=none; b=hG3ZnEDDmp17MrBsLXscppzdkPXmMzj62KVjVjl+8ywajnY1DlvjNWAm2nifvlq/aK8DWrY/rtr/Ob2FiC18BuMRCoAtEMbQHwrBVt9UID44y0gcgbvGJX+kEVLRZRG0XL0hbbqFJ2SPyvz2YNqonXL/Ymb7b9OXEDuXSw0N4KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220732; c=relaxed/simple;
	bh=4QhI1dtMj70C7yYkvc1yyTzCs2netIhah0b6+dR5tT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c67SlewVq3tMbpRtpAcky6Rk1j5V8Q1CZYWlPRNqFutWsNfTmCAwfyC4eRy6Nd37t0nvHxXUjvEI3LsVP6M4Sjlf2j/2kC+BpZLhhRpuGSOp027Euj8HduZXf+h9pS3Z1tvq3N3jTVps9DO/hlhzDoqdfMCBFw/tedB09Mk5rR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiU6Vk2e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiU6Vk2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D9B1F00898;
	Mon,  5 Oct 2026 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220730;
	bh=c9YpNFAuhW0p4OJB6itMEQOi6gwhQI/AQTE/3uqlOBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XiU6Vk2etnwiQxCXGhVXz3cHx5OJR5ZxN1r3J91ZxTTGNj8VBKqL0LWisfrKtSLJm
	 vg8JQWN0UPajGgjsDJl2O6J423gIcIDbOMMdvTvKE8DCgLfktdndlsfNz3j+Xop00R
	 wWW0aWzTXfGl4eOUDcIvW7/6aoO9P1A/rBqenRt0tICtCBlDnZCo1eRk6M3Ch+Tv5Q
	 w8KMSdsMWGk8zETH6W6iccqQ4biRToLEHcqStEHbRKBYVcAlnoNTY7e+GMbQ270Glf
	 KH0YFNmzjgWHmgvSDUbqtGYfdmzYs4f7vPYd/1vGUVZ0pCdxLpoojMc3wFAIyJ09nK
	 VbPtuwQnHPRxQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:23 +0200
Subject: [PATCH 53/74] media: qcom: camss: csid-gen3: Define the IPP reg
 update port in the header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-53-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639; i=bod@kernel.org;
 h=from:subject:message-id; bh=gglftPYbG7hjTWkQexVHxZZAkGPwtejpAAcrNvPWodY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9smiCfzb1noGsP16bGMwvcD4+USfkKsNJU27
 c+FrJU4aBmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbJgAKCRAicTuzoY3I
 Oo7OEACr51X2cexHP+zYcXAt9BIs2JT23t3ewiJd0sUeHDycbPNxXMcGKGtVIIPVw0VKFee9Aln
 qZ3xkXieJF7prpQWNcvy88SYewAQL2bhAA5iyRRo+e14svT49CW/e+gUBDo0Ce9j0mlGZufk/vP
 eUhFJoeKfRCtdYbEefBD8cxogobGuqF8dQ+0TImuDRZRm7PD51xA2X4+psb49jgSy3P/crSPASL
 VJAPh1QsylfeM9YUCUq07YrsFOZvCpUmCAwjAlfY/k/0eUR9Y6dT+hbaPpG1WXzOa49tustMPSh
 suwA/tXEtHpecNNEBJswtdPS39CewI6HGROEGgD0PmM3TheHmPlwrYNop8urYU2vW266c3tizUa
 kQIf7f3cQSyGw6RIo5N+GTczRqKE4zGjlUjI5FxAxe4wVPpTg02BNla4ndvc/GYXiPRkiK6eVz7
 auX36ckj2lxvRYxIxbHs4nPP7aDiGwgaW8lzsempZ9zRr9BczBav4fcPOK0+h4lupwHUwod+6D8
 JRTdP+IYMemYJqTLp/2gKAOFG1s9FGEbNyg/q8JdMW+5Wbf2HVuD5bTzBf/kodiC2iyCUyw8p3T
 DdUukbdEqpXW0Hs2zZSnlK4THTP1UiQb+slc9mP/JqCGZT30XHs0GkSQXOYpbpYDVUilGcOytiC
 ZTnZt7TVtY8nN2Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The VFE names the port it reg-updates through camss_reg_update(). Move
CSID_780_CUSTOM_PORT_ID_IPP0 from csid-gen3.c to camss-csid-gen3.h so the
pixel path can name the IPP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
 drivers/media/platform/qcom/camss/camss-csid-gen3.h | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index f8406c1fa45a5..83f19ed0b31aa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -301,7 +301,6 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
-#define CSID_780_CUSTOM_PORT_ID_IPP0	0x100 /* TODO: bod don't like this too much */
 
 static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool clear)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.h b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
index 6ee62da770c17..a82dfb16df5dd 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.h
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
@@ -22,4 +22,7 @@
 #define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
 #define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
 
+/* port_id passed to camss_reg_update() for the IPP, outside the RDI range */
+#define CSID_780_CUSTOM_PORT_ID_IPP0	0x100
+
 #endif /* __QC_MSM_CAMSS_CSID_GEN3_H__ */

-- 
2.55.0

