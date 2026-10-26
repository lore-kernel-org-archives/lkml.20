Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032782;
	b=PSfbXZCA6QciSwcorALLTD3CB+Vw9wGaMYnTW/cWoDnST0u4A2ernRfgWzfwdv+ghJ1T
	 H4waAaZYhmz5weXyLB6rf48tFDZPT9LuweqVmsrvcgNEFea4Gs79qzN+qX8MjdXzYYujd
	 //CSf4cCaTRYZ7kEl3n1imgtoCnlhC+M1SDQMQ+M4YsNZgNlyl7sqfNGRayMUQSaYDeLT
	 hIbpK6Tr3g91zRACPrQbPrG8DBlJqyV2QIt4boLQRkTWoHTu7JYu1oiOQgNt2ATk1kWq0
	 3T+QNPWEA0bGhxjjYZW9Ctqe1gunO+D++9IClRj1Utmhk+Rw11ciddAbXLj8tgrvoRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032782;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=6gA85CyMOQkuO4GtKon7BdcQlSKa+F1G+8pHjrdjc5A=;
	b=XYoCTwcER2c+2fSeS5FL8j9ybK92ADkz+AMSGAIDXNakzmCos+x6l0bGrt180XmloIMF
	 y/jFaV99BUn/SJGOXfA7vTDFy7bCtjWz7x6SgYtoiMf8nP9wdKmYhLVsdxUbqaEyZdIKx
	 G5bhLk3560nQW668ooglm9Ad+q/wFso1jZw/UwbWvpeZjB0UmbloJwP9kW39LvaFnGY15
	 yMSY+72ZK1mVWXzP7SCZi2jEngFhiYKbOhyx8xDucwHEdwsmDsaXgb0PvESfaH2+1YSeL
	 KRuYW3L2f0QYao0Jrul2hy7HonlYGosuwepEFepgWfkQtNExwIvtwxr1A3MZ1J9/pJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mzmb/nX6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5213606A31D;
	Mon, 26 Oct 2026 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mzmb/nX6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793032781;
	b=GbcqJSFucOxhGmmRzmOaNsrQouZqF2095H+4ie/UbqJH4Zv0ht7mpNPc4lsRKNL5rHPo
	 xIeCp0LydmmXxh/L7AP2tNm8pRDGX3L6Oetm/ksT3gAj/dsAqgtG20UHOvVvFbigv+s9B
	 7wPp+kXgsJAudYGszkrmhj9Gjp0cbX6kOLDN96K2Mm8d4C90j3fvcauq0K17IEOMSi40J
	 +TlspiPG2ycU8TCPjnZIhpHryU+nBh/s7fUjRFr4HmacwvfjyaPabu3rTkmcGHH+hw+UW
	 p6JmgYchqLgj8DOOaSeYuRga1aIUGNmyEy0KY9wNVtn4OzFvTqIhNOHXDVygMmcdmNQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032781;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6gA85CyMOQkuO4GtKon7BdcQlSKa+F1G+8pHjrdjc5A=;
	b=cANYSbVvNxWWilKsWcAhAzcAZFmf1S5Ee7IC/KRfjSbynbRnIj5q/HDDvFuxIuewRpe2
	 ZDB7CX1bpNo9XMewxVeEc7qd7+9S3okjgkvCOhZneb7CL5EXnSaEmYwGa7LLr7di92iTu
	 SgYrEOvi7qmDpvQPDvTV2XaR9M1v3E8/vdfnEDQNyBPB7D4xC89zkVIqIJ9dbn07dwjbY
	 6WVR7Uzec7OCXmcfPUmzJzaPOJ87IkmY0rS8r0oE/1NIVoKG2pRfMYmrLSMfuqm50+Khi
	 13v3ecysJq8x8eKJ+o0ZYSN2+rNi4sdJP04X6MMvFsvkLOo9A762MWjBb7IQEtcXieA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAE391F01825;
	Mon, 26 Oct 2026 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032781;
	bh=6gA85CyMOQkuO4GtKon7BdcQlSKa+F1G+8pHjrdjc5A=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Mzmb/nX632SEp9kFIAuMUZJyepYsQKwPy6QJBK89W/FzjV0xlOHZtF0OQl/D1nU4r
	 8znpwKfAWLzHGLPwJaUVfve0B+wqeIPxD1qTLGQdjgLGKQF3E4fPzW3BK0cHIT5rgH
	 j38w+p1/4ZkmebOQh0ZNb0DBF24OezjL3did86EQG6eTwF3Ay9ADoJ8F+y0VSJAcFQ
	 iTvNqRE9OERVboZ2E2NP1I9Dk5tA34I39HQ9yJqVqJNrZ98QUh20qqztWHLUTDq6HO
	 QxW0scTQwpXY6sH+yxeCe2z+BzlMZHj3Z+vRkjS04x80Peq3A84D1kPQLMy7TrC2QB
	 UcwvLzuGA6brw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3373644DBA;
	Mon, 26 Oct 2026 16:39:40 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH v2 0/2] drm/panel: Add Samsung AMS644VK04 panel
Date: Mon, 26 Oct 2026 22:09:31 +0530
Message-Id: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2poy1kZd+R+GRQtTGR+FdLDRE
 P5dwL3Lk5x77ghCiUngVIyQKLNwF2fATQF16+KVFDczA2q0pcad6l2kh3JPscbkuzaKwsGjR0O
 ICPOsTxT4vSYv1Y/l5W9UD0tnMVqWoUuf9TOXi/cnn0ul1d7qo3VUNzqEs08ubYWhmqbpC//zP
 73AAAAA
X-Change-ID: 20261023-panel-ams644vk04-ef8b2b24e222
To: Ishu Brar <patches@brar.si>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793032778; l=2277;
 i=patches@brar.si; h=from:subject:message-id;
 bh=4KvuWUHaPdgXq8ehofY3K9oc4EVZW4Z4TVVrcbXXOJY=;
 b=oSUMPeh/n1fzasZaiOnn9y+qAgPxIn7YgjYD7xmaw9+shBNZFQr2yzmiEhCb8tcSEzXPwGe6s
 ALIYNO0WNnJAZwe8hZCAf7ODwNP07CZqLC1Sgy1iALMHiilk8zatLUl
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

Add a binding and a driver for the Samsung AMS644VK04, a 6.44 inch
1080x2400 MIPI DSI command mode AMOLED panel with DSC, used in the
OnePlus Nord (SM7250).

The driver describes only the 90 Hz mode for now; the panel also does
60 Hz, which needs a way to pick the mode from the display pipeline that
I did not want to invent here.

Tested on a OnePlus Nord with the msm DSI host (a 7.3-rc7 based tree),
including suspend and resume. The SoC devicetree nodes are not part of
this series.

---
Changes in v2:
- Rebased on drm-misc-next
- Dropped the T: entry from MAINTAINERS (not a committer)
- Collected Reviewed-by on the binding patch
- Send the PPS packed by drm_dsc_pps_payload_pack() with
  mipi_dsi_picture_parameter_set_multi() instead of the downstream blob,
  so the panel uses the same DSC parameters as the DSI host
- Binding example: sorted properties, dropped the unused endpoint label
  (dt-check-style strict)
- Link to v1: https://patch.msgid.link/20261023-panel-ams644vk04-v1-0-56096aecd0ff@brar.si

To: Ishu Brar <patches@brar.si>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ishu Brar (2):
      dt-bindings: display: panel: Add Samsung AMS644VK04
      drm/panel: Add Samsung AMS644VK04 panel driver

 .../bindings/display/panel/samsung,ams644vk04.yaml |  76 +++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  17 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-ams644vk04.c   | 356 +++++++++++++++++++++
 5 files changed, 456 insertions(+)
---
base-commit: 650385a0fd0ea6475a17d39a20ec90470c7a4c67
change-id: 20261023-panel-ams644vk04-ef8b2b24e222

Best regards,
--  
Ishu Brar <patches@brar.si>


