Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8EB394792;
	Sat,  3 Oct 2026 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060588; cv=none; b=I1z7SkCisd5hzYA4YhqznnueY4EsJTykM3BuNx6aRIPxPNxLUx5YAHcUoUxF9divGFm37syGiih48uuYy7f2Yji1u58J4qCRgW9+v3QixM2YQ9wxCCIn+romquOreMox1fjOXG0uvvMAjPAWPz4tO0CRgnFSeF63VxgkA4HoQbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060588; c=relaxed/simple;
	bh=KC5YyxgmjngtWl4u2LrF1ZBHhFXX2suujOh91mWIuZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rSS6Acroepsa2f3aBEj1YA8VUdB/EX+orUaKEb0pbx22v3NN6mXVDhPvLdGeqbcC3EITle/tbATMFAUu+zuaz80RFPqdb2JLqRWf7HvFZ7iOhomfxbbzruxYOdbkRncGPkNiRHWI/RhotJ6HL8JYE4xaeVjVNgFwaDlS2FYPRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GM3ziYP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GM3ziYP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9AA1F0089B;
	Sat,  3 Oct 2026 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791060586;
	bh=1BuU7jC4i69chPY01RNYqlbIN9dzYHsP3HeLG1L5754=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GM3ziYP9DJpdpqyZUdsiOItfTiwlDIV53YabQDxNKLKY6JpkOms/6aC9WNsXAc85A
	 ijv6PbGX04i93Vu8W0mWkMuzDrJpy+A1k58fCuYuwqbgsxIMrZQ64rlQGukUtbZrnX
	 KX1mUDuQ2BNtOKdU5C1ZsI5QhzeGYH0C8cQbVQrUur3uMLkDBzcotnk4sdPuo7GZkl
	 HrJs6d9bGceDMMIuCx2eJ/5UaYb2NyYfnodkBJ6lF/tChW7qqXp+Fugy5vS58zJQeu
	 plRpQUFpk709ZQbPlv805TmwWB2rSIGtr3yAkC/YMZlXzyLErCI3W5um9I88z1yL2E
	 e/EYllVn/5DLA==
From: Vinod Koul <vkoul@kernel.org>
To: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
Subject: Re: [PATCH 0/2] phy: mediatek: xsphy: add eUSB2 repeater support
 for USB2 ports
Message-Id: <179106058316.240943.4391434773392918237.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 22:49:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 26 Aug 2026 14:38:34 +0200, Julien Massot wrote:
> Some USB2 PHY ports are connected to an external eUSB2 repeater chip
> that sits between the PHY and the USB connector. To support such
> configurations, this series adds an optional phys property to the
> MediaTek xsphy port sub-node and integrates the repeater into the USB2
> PHY init, exit and mode handling.
> 
> The binding follows the same pattern as the Synopsys eUSB2 PHY, which
> already uses a phys property at the sub-node level to reference an
> external repeater. The driver change similarly manages the repeater PHY
> alongside the MediaTek USB2 PHY.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: mediatek,xsphy: add optional repeater phys property
      commit: e95b476302852ac1fb5bffaa824ac2cd35178e58
[2/2] phy: mediatek: xsphy: add optional repeater support for USB2 ports
      commit: bda1af7b177a94f6d169f0b359c61e7a7d39a36e

Best regards,
-- 
~Vinod


