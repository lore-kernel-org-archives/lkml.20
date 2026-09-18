Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E334FD7B5;
	Fri, 18 Sep 2026 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744081; cv=pass; b=M45ASsOky2tkyVH3JBZXpjmTLpMvTRoklXd2pgWkUmjNXTukcschhyoyGcjPCJrSJxW8yQypGQ+x1gsklcSxofAWEwdZn5jPLx+1I5gx5sxDFYY4kf9CcpNriyfhuzm9cWEVERhP9pJs7nGpL0MwmuBynzJk8MLUJvX0HXU3uG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744081; c=relaxed/simple;
	bh=jsi3UUXRgbbIy+/aogqfeBFzjsG4NHFYXVtrcEV5mak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmmv1D0zNrdnk6rheE3XjRPoDRb9eCKbdMMpjX+OwHCZKRElRjlbllNsuPvOc5UB7MgTzYOdB7j6UA5zcG5/GPdG3WdPeaXwAK88InP84A6pqauyrYFmIn96kyWoa2FK1Sm0IXUQ6++wyZ5SEyQrsVOmQ48p137R0BM8XBTY1XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=Iveo383U; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="Iveo383U"
ARC-Seal: i=1; a=rsa-sha256; t=1789744065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I6AW+OWNKfm4s1J1lr3yv1SWdLqkpIuUnes4bAC1oU/tIdhk8iXNdTdmVVRlsViDKJ23EjB160SMgGIV5svRWbnLU7LUqZJhQkaJG/ndOLztCQZtjNC/hVDOrgV0HDTq4srb/WtXy/ZDO9tQ3ez318TfrIqg4jD78kL2YtenAc0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789744065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6DYLdUfKD8lQHyVdszF6+D1lk2bnnMb1mJc/zRkdlrQ=; 
	b=T700XLKdSf0EGDN75SihmMKYg3lAWCsUqclWVCyT6oN7KvzMiSmi8ugGG8ylbpfBEtqLjHddEh0JBfDj5lIQwQSSGDMZ/zg/U/ZsTBUJitrdGLvIP9saHZVnFQhEPexxtIsQqDm5Eg24LQGLJp8azKalhSJDgNZy3ufDuaZo0r8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789744065;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6DYLdUfKD8lQHyVdszF6+D1lk2bnnMb1mJc/zRkdlrQ=;
	b=Iveo383UsiLdY2oMy62uJysUNVHEvUOdK4YiiR0HmfG3LJ82de/K91VgKfFIqFzJ
	2MuWVDpTt3ko9gQQz6FdUrfvDMCVIYFYOfSPZzXxgmydGBHb1Amt2X77NPqlkoWJgah
	BfXG4l1kNpj/N4L5Kd3/Haz+kEBfSW3C+IrZ+XG4=
Received: by smtp.zohomail.com with SMTPS id 1789744062457111.72786165405773;
	Fri, 18 Sep 2026 08:07:42 -0700 (PDT)
Message-ID: <eee3fd59-adfc-4f36-b467-e1e7c2ad38de@collabora.com>
Date: Fri, 18 Sep 2026 17:07:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI
 CSI-2 DPHYs
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

Thanks for your work, very nice!

On 9/15/26 12:42, Amin Gattout wrote:
> Hi all,
> 
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
> supported using the existing phy-rockchip-inno-csidphy driver.
> 
> This patch series adds support for this variant.
> 
> As you may have guessed, this is part of the efforts to bring the
> support for the RK3576 camera pipeline (VICAP) mainline.
> 
> Looking forward to your comments!
> 
> ---
> Changes in v2:
> - Patch 3: drop the RK3576 GRF register table, which duplicated the
>   RK3588 one, and reuse rk3588_grf_dphy_regs instead, so that the reset
>   names are now the only difference between the two variants (Michael)
> - Patch 3: reword the commit message accordingly
> - Patch 2: spell out in the commit message why the RK3576 compatible
>   cannot use a fallback (Conor)
> - Collected Acked-by from Conor on patches 1 and 2
> - Link to v1: https://patch.msgid.link/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com
> 
> ---
> Amin Gattout (4):
>       dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
>       dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
>       phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
>       arm64: dts: rockchip: add csi dphy nodes to rk3576


For the complete series:

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> 
>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  2 ++
>  .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 34 ++++++++++++++++++++++
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 15 ++++++++++
>  4 files changed, 52 insertions(+)
> ---
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
> change-id: 20260819-rk3576-dphy-2304f848215b
> 
> Best regards,
> --  
> Amin Gattout <amin.gattout@gmail.com>
> 

