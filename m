Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530877;
	b=U5ZU0EKXaZHKuDKwxIVcZFyw0t5ecwbPLy4p6G235MnQxrEf8iH5eWJu4VGPGtTpEPRn
	 IDmn8owFygIQ4rPYVM7ljVsuPRLxI29DoPe5ydnMqVZ/wNEiL8ADLXo+97vSKvfHWKUox
	 JzGLhGURo1tQBZkg4POAbKv5gK1omcBydF6XVa6UOJDtgs8SsHhayeoeZsAgy1DqUwvLU
	 47jWC3tcdmz61cG/8knHp7/h696g4ixpTdqOEYoVeHg+4YJkRbkYho/PU8UbRdhZvTUvp
	 l/1VNVdu1tkBIaKKpvzSc/9g2kgwjiwzj4cUorxF4FwvPbiQHeVVWvyNYcYefA+lCWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530877;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1xCsCum4W81R+P1kEUptIDoi+4ELNoqKmaIVdJvxeMo=;
	b=To/WgOG41nU2emic16CQhLtsS86qAKjH70ETLNhoB73GA5vBqNs2lonUlDD+ZF/NINOq
	 Ymag0RymJqHi/AoaweI+mPE42GKyteGtJcaEv8bOGPkn9cv1PtzGsG1j+WTiDetEX1y/T
	 sIdeAvj5jetyFvkzOXhtV3PWKeC24j0T880jHp1mScWs3Lrq89/kbu6jLUeyP83FsJI+P
	 4WDuDSTJb1/YLjxfETwCekalGQaSIU7P93jCTm78nWWfmQxxiUSNMDIDN8gwFKpdk6CIf
	 kkn1JxSl4rbD0BYPCbHWyHQNhBZa4fMrG8fvvE9ti0/I23hNhA17Eitw6H1ProLE/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUR7Oz6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC91606A324;
	Sun,  1 Nov 2026 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUR7Oz6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224B11F000C1;
	Sun,  1 Nov 2026 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530876;
	bh=1xCsCum4W81R+P1kEUptIDoi+4ELNoqKmaIVdJvxeMo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GUR7Oz6WADc5CRMmq0ybOjfBnAgBvNs2N+ZZwbeBiXNVquDYxwgxHx0Dvv6AcBHbk
	 m8+PH5Zm+vjgN6ohHOZd99MBwIe+Ge+xhV0+H9rxgFp4azz1ClAvNZDEXu4/Jv6ewI
	 aNriN4uNNi+Ss4CzgDMXk+bCV+2oFep9MsCvj3XmmzQi0AKFgYS5L03nt67TIS68yv
	 LN3BD+wYnAuZcJm1Y0GM0NP+YP0XHz8UaF6sNNNj8RdV/SRT742hsn4e4oBypox1DQ
	 ik/RYllpWsuWOkk7rWkf1WOr3HiCZQffxcq3//BZuAHYJHFRw9ayvQ+FxhONjSRT7/
	 PGGbJInxEip/Q==
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
Subject: Re: [PATCH v18 2/7] phy: rockchip: usbdp: Add reset hook support
 for dwc3
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
Date: Sun, 01 Nov 2026 16:31:10 +0530
Message-Id: <179353087013.2955.6406615135050034585.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=mani@kernel.org;
 h=from:subject:message-id; bh=p1oL61d8c14uqGgknj8yB3KbgyHypRA6MkYYlKZBKP0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xv4XbeysRLw1HQgwGNIUQZIABb32RuEwTX/8
 hNgW7Djq8OJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucb+AAKCRBVnxHm/pHO
 9fVcB/wNwzllkYkudD613UP/rMmnTeDwshWG87frpImWtJY5uo8/Q5JMSSvDREUpiE75rLU9wnc
 8vUsR5yIG7O4fAa+TzNDt8Dj5tLxLpxzLyBfS+T3Tjei0VqQD5mdM9Eabk9r671SakIZvXzsn8K
 N0ycMiD+3sJCfHlFyvwqUJ8rlwJJ9/IOKY0sdhVGv/8gH397pqBahFQuz7P6ZlGzBQTt2MiuKOx
 9VRU54n5ZQZA9wMeIP7jGAapD7nOAaPvpw/7rFNEeIFDr0z2lN94j8JlvMaHZFwijDXmiln2HIc
 CRvmsFkf87LlXs4eOyX0DTJ7oCPit93zforrwNnRtfA4fkoH
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> When TCPM (Type-C Port Manager) triggers a orientation or mux
> change, the PHY needs to reset. This results in the PHY no longer
> providing a clock to the USB controller. If the USB controller
> registers are accessed without the clock, SErrors are generated.
> 
> This can be avoided by switching the clock provider for the USB
> controller. But after switching the clock, the USB PHY sometimes does
> not succeed to lock its "cmn ana lcpll" PLLs again. I suspect this is
> due to a clock glitch and after some debugging figured out that this
> can be avoided by disabling the USB controller's PIPE interface while
> the PHY reset is ongoing.
> 
> Implement an API that allows the USBDP to actively request a reset
> from DWC3 as a quirk.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


