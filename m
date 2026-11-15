Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772594;
	b=4F/k6NKyTmyNCKtuJnat1a2YkRe0q51vZJpzYKKRNDkoqhrygXnWnp/gTavWNUGDqvKc
	 Tqik9UB1ecWqSeVP5D7Ak9G5uXkCxdA4PmoblkUxHsK4TfiB7ai3tI3MUTnr/tMdeziOH
	 T2OTdfg0mB3znKsmJ1c1MxC1T1mvHrdp/JFLkr8Udm3EY9ZbkjWWxJEv0txRgi+NUsQjT
	 0M5Q6ddi2FKiagWYsGO46VI/dB1LBs/cFH7jbyavl6f68qZ04fack/gpZBinJ6OtbFehG
	 E6DmDSSvErPvnucf3Tpzt8PoKXe3tWMN2uwfgiLMmM4xmyNwP31BhdvjegZ4Ts+2FuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772594;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Y9HeiXoY81Wrb+Oc8emAfIXmBO/XgM6wM5edLhFpUMU=;
	b=3sSxokaiJteOdPwxpDXk8JL+4/mkXOJn4wrn+dH3ED3H5UP8Y2bQYyidsL/Z0yLkCl6A
	 DZYBGbXRbGMSATuVBDBAXWZ0MtegYLQpxIZKOBpygXSs1KFM9T/3q+gojDLISqxgcUdoB
	 qnC+ggJQ/OoNHWLtqXz16Rm1X11xkWqMEst6pK5aV/kwdbznSvPOZ+KG6+xrxAIJGG3K0
	 U2Vv2T6uIx9KP5wNW9bODrqNr+qrnaflkdFgslRQ1Y/SV7/bctUB2OWpzr/jbexXJrzlQ
	 4b842dv014J5lAkD3ZqLSC1GzZokffWPbizsMdhH4hWJGKAMixuQPosMv/27qRVeZhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BF606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE461F000C4;
	Sun, 15 Nov 2026 19:56:30 +0000 (UTC)
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
Subject: Re: [PATCH] phy: mediatek: mt8195: Check PLL driver setting return
 value
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, vkoul@kernel.org, 
 neil.armstrong@linaro.org, mani@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102072139.3588-1-sreekuttan2156239@gmail.com>
References: <20261102072139.3588-1-sreekuttan2156239@gmail.com>
Date: Sun, 15 Nov 2026 11:56:27 -0800
Message-Id: <179477258790.135135.18445455960030835441.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=612;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=eileMYDYBKoPQdgMpGCKEGd2Rd8i7gFuQRzv0kIVzxA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+g5uw5yoC7DdghORcWiKirCC7Y3f+wwpthQjL
 Ot5u7rQq1GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoObgAKCRBVnxHm/pHO
 9fN5B/9gix+/uFGVJNKn69SYdcUnNe8tQXcBwew4RpqhpKrjqoRoJthvRkgkmvY5gPV4eiRNV3s
 GMp/ufdtaYvnUi0uKa1GRAvj6KINn0Pg3V8LE6ddL+rypjWi0OaPZHQurM+lXm0RG49LSRWoB6I
 EGbVv3tTARsusSgSsVg/puY1Sd8Hai3W5AL4WXiLUpfnCiZ76y7Lwxn7Fugb2kLPx6V9UsbvLoS
 xuIIqyjsYTzPvNXqSp/JmHHbq9s8djQ607IrAbq6KgqjKvoV1A5eXKOyMZ8XSwTH6wMUTC2wJaG
 n73A9BzJ/4FkkmSFPJaFcLBm1FcCGy6E0XR4029UmIcv0ISi
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-02 07:21 +0000, Sreeraj S Kurup wrote:
> The mtk_hdmi_pll_drv_setting() function can return -EINVAL when
> the requested pixel clock is outside its supported range.
> 
> Currently, mtk_hdmi_pll_prepare() ignores this return value and
> continues with PLL initialization even when the driver settings
> fail.
> 
> Check the return value and abort PLL preparation on failure to
> avoid powering up the PLL with invalid driver settings.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

