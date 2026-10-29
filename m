Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269165;
	b=N/CdC9zMCWhdQEj45HfT6sBgLChxeYBdoRaJ+Bia33c5BEYoVjJt+rlxC/ufKWEFZoYP
	 EEXwkkBNkWrljFrAdXt4TPBSOqGS4qNaU0pYsTy6y3j9qxHVMEEwCCvh6Qc/TacYNpRvJ
	 cSHQRi3Yo3Mrq07MFemyPeBP5Jchpgbx/xT7xciJvp0kNii/DS2bV1dP6Z1P3p/Efrbn6
	 vtiowV/YVVXNEjV7kYOFaw2qRrnbfnPvHaztK4sJzTpBnS3HYFV0ifZR6cOBZqlD8igLO
	 nRcTRKtXtz75TNk5c/DHJNs7eHEmJ+uFo7JQgVDjh1xlGer+tKK9Spou68fBWlV1pGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269165;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=btdWeBzs1dLrYh9rnPOS9gIutLtzVR7+pVu+RcU5mUs=;
	b=H0aIaYD4bSX9C5qT4E8fCXCwHZEH9qwzLNTs0464hBGV0VQPcgs5YGCDMTpne7dBQBjw
	 mxZ57en97mCKilLPvo4UnwQ5WfORNGgp51mHn1neJ/tzn4XtdVn+DCO2++AVq3IENkdW3
	 5c1qHacROd1hzXrWRoVafIYWlQCmBlQmuzzPmOMmjp/9YefdQ/d1TO1fnl/s8EA/65uaO
	 edpDUPdTtmxj1gvsOPMerKwzOyogPtgogxAggI0hDzgKIdD9G0wdgsG9P6vxHZrSGo3Gw
	 hV96SRsypiysfmey2wy1IzQaH2HmcCU3ihcavlYQseEh0SQ5RMAefiJ2uQ2LyyBuslg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=P1dTualS;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D0C60A5BC8;
	Thu, 29 Oct 2026 10:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D0C60A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=P1dTualS
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53FD4802;
	Thu, 29 Oct 2026 11:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269029;
	bh=SPcuBBIR7dKdQ904VlxD+Px2WmT4SWS2nZXwa2GCBF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P1dTualSNMa9V+40wcuRxg6QCe+n+q2C5l7Nkmp3LuWwuCJjoRmG/qEPcQUD1jJvz
	 CBgyeH/pCTA+yNz5MXgScOWLqFR/p7UNzZ9X1HniNcuytIbriq7OmpPt5QUBTOduPL
	 O/FzooMDEXZluMw5xmCsg7tJs+zX1+wJbcY6iJB8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:58 +0200
Subject: [PATCH v4 12/14] drm/tidss: Add support for AM62P display
 subsystem
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
Message-Id: <20261029-beagley-ai-display-v4-12-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=uuSl7ff1pNgQFmffpORCS5nZ0IwUw27z/aAJ8FR0KuI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2ZSCOHpzQsjksQQlVbXmtz3xUmnUuL0JWuv
 kdh2YBstPKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdmQAKCRD6PaqMvJYe
 9TmZD/4177GjMXvjJ7KlMltzauFk21xGKGnmfoeg8erkfXJ+mq9j/PELLqBt3r7e+do0/75xQoS
 MQ+a9rdzHCp4itzOFFg6Yeiovp4hm9DlV8Ribj1kbCv5dhDi3jlaPOnUXRT2H70LVcYEFqDSNAB
 KT3PRDwZ2em+ZduB96aYg0HCTlJaCdnfCfHCwlmD3KXDjbVKKK8+mML2xb+/gAaKRHB6bHUuccv
 TWBYZmk0i3KO7JHz/XiBK40iiL1EAJ+uBh6Q5fa1/TcU2EOylAJYXpNCGuQ5LK142XyfPXkIsoh
 dVlJ6xob4ottaTZQG9ZJ98gnRvUXQHvAUna4jwfY9rhBfZzTk8Yi+sLKDjbp1xuKRawDXgmQ8Qx
 JZsxsuQiNmymuN7DSrF6nqrtCm6AyXx86FPoYPm3b4B1iTv/VtubVXM42FvYXxKjFQcU+tf1ck6
 Txngu2bsqcW9XIymQQV64DMUv2jTHP/bB1osMJeNYuq/o5SJ+/3pKF9AmtJZwmEQOjfGFp8idc5
 UUOahF1SvLG8VvpqPaALzT8XYMhstXNkr57w+7ZQ8fJfjSGxEM1WPJw/AarlEGav+r0Wqa8a5uc
 lnoNDhNZyz1Xg7gQq9NOjFCxhWAStpbLETGJJzHlFET6niVkeHsizDLMKRUo8JKsd57Z3LbyJu1
 4f+cDTEwOJ2HYBg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Swamil Jain <s-jain1@ti.com>

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This commit adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 44b0b009c29a..8e3cbfb5ef87 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -240,6 +240,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }

-- 
2.43.0

