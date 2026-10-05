Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7255275B8;
	Mon,  5 Oct 2026 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220742; cv=none; b=KAN2agdBYWt3AoHQmAOW3+daEl5HLdtNfuCAxBHgsQvXqD+dSTRq36Z2vUB0sVjJ47jj0UEej9tOMbtx266zBrWY4LAWaIsQvvLLvQggX1srT1JBMNi5VQp12z5Z4zm7yOHameHhRcxUd9ljgPpaUOx2OsSzLPpWS7d/SghNe88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220742; c=relaxed/simple;
	bh=yZ2HVuTygVJMzapQCYCssfDOm8otkJGGwtq6aLgbdCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUS1wL1nMJ4T8Vj/Cj3o9xoIu7miG9hBXmQpzckb4HOuFHuT9nzCr4NUNcjir6MY3Voumgl3MsNjp67JptCY2Ys5djS/nnvhtBIBmsni5BjhogEaOusvXphqekdHTHfaNh1HDXUPaD7EYdvPY+CVILOQ+0Bv1psfC+6Kydt4MWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdGKcaJC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdGKcaJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACCE1F00893;
	Mon,  5 Oct 2026 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220740;
	bh=CfRbBBC5BsG4pdm4602y4R/JQAo7FMM0EFzZK8cdzQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AdGKcaJC4uPtEVP+YoXrW0kihvI2CEWPWNo+esOsBKt8enU7D8s8jylVuhcqoNT/c
	 nfGT7L0pQa/bdcu4AmtKWkxp2I0LTuzDu4hUS0TVbMj5snzA/NZzf2LkSoTMq6MVq3
	 DDi9WOKXgNLwdn8lhsGKJzauYEXYfUif5UbKqYkK38k4i4C2CYM24MpmS1DUC2hgNA
	 8V3Sam/0cJyCmapXjDYeNOeCXaO8fU8rVslaCsZcPpNmoGVJ2gV6Jq+iX0PKwJeS9v
	 NKmxGPxIi87h/Ex/WcqrsNrRoSOo85sFebh/tM5d0H4RLKw2S4lOkmvJ3L73hDe93O
	 kOUTwX5XSl+/Q==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:26 +0200
Subject: [PATCH 56/74] media: qcom: camss: csid-gen3: Route IPP completions
 to the port the IPP feeds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-56-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=bod@kernel.org;
 h=from:subject:message-id; bh=JISvBcJmWKg6nJyaUMCRJVlQy02ThhkRIddi6R/1SCM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9soWl6uPnUaklOFjIucrZ2bnIn+wMS4H1hiR
 syYCl1l4sCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbKAAKCRAicTuzoY3I
 Ok8+EACcAO4qqp6d9DHInSEC8XYxyod74yunq6RdMwDQZc0iOnovMHM8rH0OlXcqglJJbLCQ3B0
 8tCd/z6swvGVR9VPwjZRp74yRc21+oIzN9L9rKdgCa1HJndLKpSIJ0YfLjKVVVVMc91BhW6S4xS
 9gRHELyFqUi2qyG81uGRnDa1F78/KNzeF6dIIwfYEJm3OOU4CDBL94QW/RIzPBJ1iSaydCMPhJp
 4r6U0YH0iUfq1+n4dM88PdM+irB3UTiivW79JEK4kGK5rG37MU22Bv4oAUN8TtwdBkI8zt+BLgz
 1Cz7J3LEm0dnWlqNM1Az+BCb49c1dw9oP89lm2Ss7PMdRi0XNOOn4vxhdr59actKaNdNGrAohs6
 uZpIGhp9B9vhRpL40pNv3i16jERcpM28Co7Y7HO+PZt3JP2Zd0KswKk7l9zVA3ygXMJWv4cU1Og
 VXyXeX5IVM1AacgB8H5S7WZ92eeBGKEXPE0zhWM1Vdm8+pzTgnwJWIDFMZGyQA+qbgQBiLeSpj/
 2p23S0Wz5MvbfCGx/pLs2TUzuJPSiatW/f2U3nEHRz0G1148u5uIs3fH5z1sa9KMbVuObIzfNyE
 3lTf1Q6rkmHU5fVm2BXwZczsW+wMLYcZ/9ATjcKoBf17HRIa1IfeKgvq85RzKG+x0qoOCrXnYrc
 cO+QWk7UGUQb/2A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The pixel and stats completion groups sit below the first RDI bit in
CSID_BUF_DONE_IRQ_STATUS. csid_isr() hands them to port 0, which only
holds for Valve's NV12-on-RDI, where the IPP output is written through
RDI0's line.

Record the source port csid_configure_stream() routed through the IPP
and complete the groups there. That is the PIX line when it is
streaming, and RDI0 on the NV12-on-RDI path as before.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 400995f35f0ef..b67cb1306acf2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -161,6 +161,7 @@ struct csid_device {
 	u32 irq;
 	char irq_name[30];
 	u32 reg_update;
+	u8 ipp_port;	/* source port the IPP feeds: PIX, or RDI0 for NV12 compat */
 	struct camss_clock *clock;
 	int nclocks;
 	struct regulator_bulk_data *supplies;

-- 
2.55.0

