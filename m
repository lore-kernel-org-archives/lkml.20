Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA74E72A7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183613; cv=none; b=KkQETe9UeUk924e4xeytKc4rzQeow1fUPI+9orAE4iDrDkUmDYHPLr6pzMtAxAvMMjyDhgV1yJFW21ivLB/4Kysfq9SfeDJjrny5Y21Uhb/tWqa8+TLFro3J8kE/f0mOwq6E5m/WYgHtrS45ApuCmJhiumebRl/ViHLzvzdbIss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183613; c=relaxed/simple;
	bh=FnixRBGoBAkxeMIgEH59O1oyvH+bQbg0YQZeDwxw96E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSdpNNZ6DcGualH6wNNpi3Di15KH/enIkEuKgfMjov51+hsS3e4PYfi8KaY6YHdS1p9YAGP4lqMUmHJev+ipIqyRcVnrMyiW2QDMEvSJIGggcODQ/FtyVlhsUbGwRE0OD+EDUZqauhYweNZLTEtMpvxuvGku7KTnazMc42BfbDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=oArI8K3A; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="oArI8K3A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hM4ke/zUafKbOleC4RvI9fJgOP0Pa4ovJP1DlgTbhd4=; b=oArI8K3AlqSTeSzPuMtl1J4y1T
	YUvp+e8+pqJL4PgyF+8mrhBBapf9Ozv7+ppAXj9g1J694c5kmm3kN4ntbSJt9Tw5zQHXoab4xVH7U
	uoUloe1reIBQomb4EpYGCFluTVz7wAI0EPEiPG7nKIGYk7y9LrFI86nqtQlEyxIQyxbqTYrVxm9Z+
	CqaoHanp6GN3b/xZx1+Yy6a1kn5FTXsaQSQcBz7bZHuhvqgkgxNxCFyFwMZp+e0cpbAo4YRS+q4Q+
	gK8DZxQm4+fc7B6+PJpEqlmeTpAi0VrsdXBjBe279vRt1So8slpMduNFbBz5rSNoxW68vEz7V9sOX
	r9mpswyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix an error and a typo in the CM5-IO comment
Date: Mon, 31 Aug 2026 15:40:01 +0200
Message-ID: <178818359738.1934409.17545491709168923043.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260819064707.1667292-1-gahing@gahingwoo.com>
References: <20260819064707.1667292-1-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Aug 2026 18:47:07 +1200, Jiaxing Hu wrote:
> Two mistakes in the CM5-IO header comment.
> 
> The USB-C line names combphy0, but combphy0 is the M.2 PCIe lane, as the
> comment above &combphy0_ps says. The USB-C SuperSpeed path is the USBDP
> PHY.
> 
> The USB-A count is also wrong: the carrier has four ports, not two. The
> RTS5411S USB 3.0 hub fans the single USB3 lane out to four downstream
> USB-A ports.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix an error and a typo in the CM5-IO comment
      commit: 3bcd04b3e009fdd5b051c95f31c742bc9257fcb9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
