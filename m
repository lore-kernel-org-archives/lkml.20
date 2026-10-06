Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E61A95E;
	Tue,  6 Oct 2026 03:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791257232; cv=none; b=V1a4m0kqM63K11p9mcepHzJ9XuvmKNjYodGX5Wl5mgI4ljoxWgQNPTJPYvBu/vnMTIgd2mjza3JUL+8U5ll5FlHlL04WxqmAqgPYsVxEG69DYeUU6ESJaI8CqmC0eHJ+7vwuHfs++cwkSm793r3AJRzStw7sfK87+O2Fgpgw21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791257232; c=relaxed/simple;
	bh=lsyULX46BG4cZxmOt4009fabwRKf/AAijRyg4XZJANE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBkrGqYb6Ba9mmpc6srwXYK70GwtMy09zHs01Y+som2wmCT1fd13Q/5vhfyDbG4VseQdvrcp1SL+D9/G494W5Uj+bFDBTHWkGz68AEP1XMjsHfKwFiekQATiuDL9Iz97MSQKSryKw0lIw+BStJ3Y1An8+kL3Nx8iIs56770lttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agzj5web; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agzj5web"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12061F000FF;
	Tue,  6 Oct 2026 03:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791257231;
	bh=BjT4eIz3gx9cpb3bB/A7BLnqv/sJrakTzUqKFsTtq7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agzj5webOc/vjusOJXsIWgm1dpyC1w68XusjyTZ22WS+ZxS35CYb6KU++CaagoguV
	 6bEtjDOplbw0XofFS/QqmaVzjlTqrv4MqAceJZAmiXbw18hwuPli07voe6E+eiwDMC
	 2yr0OC6rbEMR9FAiQEqX5Azp6Y3FvSMkIpAuVcxfPHs+wFYui5WfTyuynN6oP6wFyw
	 sgChu/npvlZDM1olQrNozKtIthl0xYUv+IgSG+GkCEHABK5sAOXojyI+Mans1aV+wh
	 pZ3txDOEAyFQK4iue2cbvg4Yl8oLPlSGTigoek9n3TtDYcd5KKqDaYjpykneD9dZ55
	 ytnPfxGF1seHQ==
Date: Mon, 5 Oct 2026 22:27:10 -0500
From: Rob Herring <robh@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-ID: <20261006032710.GA3539706-robh@kernel.org>
References: <20261005225944.1171574-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005225944.1171574-1-coiaprant@gmail.com>

On Tue, Oct 06, 2026 at 06:59:42AM +0800, Coia Prant wrote:
> Changes since v10:
> 
> - Drop the top-level "default: 1" for "rockchip,sgmii-mac-sel".
>   dtschema injects top-level defaults into every matching node, and the
>   injected value conflicts with the "else" branch that forbids the
>   property on non-RK3568 variants, breaking dtbs_check on those
>   platforms. The driver already treats an absent property as 1 (GMAC1),
>   so behavior is unchanged.

What? That's not right. 'default' has no effect on the validation. 
Please add it back. If the property doesn't apply to some variant, then 
default doesn't matter.

Rob
