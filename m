Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8AE3C3BF7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195646; cv=none; b=Dk82OLZ9dZzOOjRBgzMiQ7JsMb3+fYUcUPgT5E3pS+YI/oxHvV/gTWeXc/Xwa2qCwcbr1QRcln4s8kpGjr5d0uJBtdKPpYLETtsQcu9zBx9M4TbJKnOj2OTvxnp0tFJnXR9RaNhLhkNfltno3v5Dff1lgSG0VTdKCvwArUcV1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195646; c=relaxed/simple;
	bh=NU8swq1j2ii2TD9p5qbhktILG9lsOdiw/KHs/qkyj1s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xvxj1VbNdz6rh55KyDAwYO21OhVWMV9VFZnlNBoXj8jtpCgXLOv0dQ+Ck2JedZODhOEHRsc/yTH6XhuVGWa5Pg4IB0JJPOiD1ufN51F8lDKzPFr55P8rjHJNL7qakz+zOcL20b8o3klQfNackS8zIRl0dTmK2ehUPo275DcI7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVL8xfQv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVL8xfQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABB71F000FF;
	Mon,  5 Oct 2026 10:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195644;
	bh=GWsLWEMDwrfL0znv9a1FFmG5Ojsurr2FWtMoeDb6oDs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kVL8xfQvfFGbxJe4asQyapC32bvl7t5tNtCf+kV4HgCD3ysm196T2XvxN078vUec3
	 J5zll9onL2I6q34ewBt5CxXO2/1tc3qhcDYDl+VYTpgbuMtCC0O3d9vSfmDZex9WWh
	 mz6KaNHGEZZM8R2H1H4E9cfePa3nbl0FaULsIYTTr1g8k4np5APdyjGMCKZDbjYO0Z
	 fMKLjFHFXOjpYMH8OfaxtyZ0CJR/zZc2mhk5F9ItlXbbiqAMB5pM5R4phuajVDwomD
	 d0UtqWoQpyxH28/E9OHzMO83qSiHB0r0dsLyVkaGFXI0L5qOFh2/RkeU0+jBvqLnP2
	 t6qsokrdJeOXw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
Subject: Re: [PATCH v2 0/3] phy: hdmi: Add FRL TxFFE level control
Message-Id: <179119564237.316652.11654112643268830882.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 01 Sep 2026 22:55:12 +0300, Cristian Ciocaltea wrote:
> During HDMI 2.1 Fixed Rate Link training, the source and sink may
> negotiate a Transmitter Feed Forward Equalizer (TxFFE) level to
> compensate for signal quality degradation on the physical channel.  The
> source starts at level 0 and may increment it up to a maximum agreed
> upon during LTS3 in response to persistent link failures reported by the
> sink.  TxFFE adjustment is optional and entirely independent of the FRL
> rate and lane count selection.
> 
> [...]

Applied, thanks!

[1/3] phy: hdmi: Add optional FRL TxFFE config options
      commit: af00a892e6515e3f08f2079578695389b01ba3a2
[2/3] phy: rockchip: samsung-hdptx: Handle PHY config after module reload
      commit: a673b3d18e37e573d52bf41c47e75d46982f2fae
[3/3] phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control
      commit: 192244b9cb5d15288f318f20ad202f2274359474

Best regards,
-- 
~Vinod


