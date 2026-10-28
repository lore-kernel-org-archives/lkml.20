Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190741;
	b=kj/Lfe5VORK1QlmlXnTZBOj/i4vkhZ43ZIZgabI1zGgT2kChHREvK9woIXn7DU3KsJSU
	 GBVunuiw6C8BIfDwHHOJ6N0uWlJnZexvnQfbTS992gDmliSkJDJoIadchVQg7Up0QxFso
	 ZFsDpwSYDH4FIYQj2J5aW84hZ5yjjqoOdsfgMoqQNdWc94vGVqzGFQVPap5HoX/oQ+QNF
	 LburwMQywY9nlVSy5zgHAXfB7P7JeYaGqpEqddBd8M1X1IA+7hVCu3OVDQMBafu/VhO2Q
	 EhqjZKucphRKTZIuRJVhmXtaaXBRoAzUAy76vBZPSKNtx4/wM6dp18orJt5KN41b3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190741;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OWtIv2rMCHEkb9YrYRFfqNdiQBQqnQmJx5Z8aHn54NI=;
	b=szfQ78+KU3XUE2gtsQIChmDN4Xp3DLg7+siYbDD4sSpUtzR9KHcvw3pP8PWUzKIJCRKS
	 Ppic4Rc1EneWr8ym0u61QCQZYZZfBInvXRoQ+TggZ55jbgKrzZM5fSmH0A9l9R5so322A
	 Mm92jusEsAklyipgeCWs8c72c5CSpp/gOYFhK8Zqg+68FLbzkUEToZe+Eboq0YoO08AnG
	 B/6eRfZZiszSmLtB7FE47T6zFTgceTAue22ZeXqCTxqKy2JbXIxWDStkTPgHq7Pq/jZiX
	 aNZsF/SlQjnDRGPtexgy1yzOg4Winullp/wePG38piJ0CtTPO8AYzh0OVzLMdeBHdtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8qL2zK4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848D606A320;
	Wed, 28 Oct 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8qL2zK4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0FC1F01825;
	Wed, 28 Oct 2026 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190741;
	bh=OWtIv2rMCHEkb9YrYRFfqNdiQBQqnQmJx5Z8aHn54NI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=k8qL2zK4H5UbQnirnjxELeoSUjas6GR43drulrTkmAGDnfWFhe8K2tGH5Joer3tN6
	 t4AWTID5K5qj/nIfH48dZB9GWoKP/cpIzNPOtWziR8b2ITwBOn5faCNm9Qaw5oKoar
	 E2fjSz9TJbs0cSDiowmcXhSw1z5tJ4O2OykGM/zj607jtqxjT/qEiIqI76QGg0dT45
	 8/eHEySokNnXMvAO0kBJpfNpUCnBD5l/kyPGd6OVYdfXzSxdt4JyxQabky8Lmyh+rz
	 xauy+WCUXjG6A9/VHNfJj3kNboXzB51NMehS/S9z6aaHk5Rv+INpzkqUN0yXMmmPKT
	 1AOleMil+AjZw==
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
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
From: Manivannan Sadhasivam <mani@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006162807.2843858-3-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
 <20261006162807.2843858-3-coiaprant@gmail.com>
Date: Wed, 28 Oct 2026 18:02:13 +0530
Message-Id: <179319073317.10280.5733564257033545150.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=mani@kernel.org;
 h=from:subject:message-id; bh=vxS67DTf/JwGyhIBlIUbrOL/+WeuLhEf9HYah2XysGo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4etQyYPtZ8kpKV2DjVhh+jYGLvZ4KQ4Kwo7w3
 Awg/cJKHuyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHrUAAKCRBVnxHm/pHO
 9X9yB/9ZQLWzKP2JQ9tfLeMVLBcQ1sqRk2Sjhqw8Mq5KMyXWMnPh3H0AeVgGC9IEyI8d2SIBINv
 N2HUwFU7ps6i6Jnuwd4FDLqgndqErXuLXg/eTig3s4C5ttTUqw6dSzIxOLE8T4Gpa2LiMCQcrh6
 LFedPPf7zIKH2x7dvsayY4lZQNcYdcMm9YdAQXe3jPGgWyLmq7yE/9+QJEsAN97YsOqTbYj54T1
 buTE3xSKOywg2PiDiDi7GPiJzvX2MnHIhuGzrQYZJEYGuNPMSJ80gDaNi6IQG7jNGecZKQ8HDeC
 ZSJ1sboCaVBlc+XPaFvxgOz/RsPvw+wW3FZ29LMMR010RSh6
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-07 00:28 +0800, Coia Prant wrote:
> On RK3568, the SGMII interface can be routed to either GMAC0 or
> GMAC1 via the GRF register pipe_sgmii_mac_sel.
> 
> Add support for this selection by introducing the
> "rockchip,sgmii-mac-sel" DT property.
> 
> From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> bit 1 (pipe_sgmii_mac_sel) is defined as:
> 
>     0: SGMII routed to GMAC0
>     1: SGMII routed to GMAC1
> 
> The hardware reset value is 1 (GMAC1). If the property is set to 0,
> the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
> If the property is absent, the driver leaves the routing unchanged,
> so the effective value is whatever the bootloader or hardware reset
> left.
> 
> The driver validates the value and rejects anything other than 0 or 1.
> 
> This is necessary for boards such as the Ariaboard Photonicat, which
> uses the SGMII interface connected to GMAC0.
> 
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


