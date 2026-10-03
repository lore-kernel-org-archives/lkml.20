Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0598645516B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791059979; cv=none; b=K5K/pHdP2ppxT4l0tfANtHzUvALlIZG/qjoBEN7Iex0/YsJwzBKZ5ioia6jfMXoajMDoLzFlCWi6K26EoYuH1SF3ltrVvabmn2v4JIJ6mOsFKs7j2zDpZQRUFqUWyG5lftu00zX31GkFlNiv3x9ByeGGdXpVK/MVkiZ1xejL8x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791059979; c=relaxed/simple;
	bh=oq6EqG7Y5/d47J4IcDBkt55PVDMqnYeRy844W3EFL6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnbmZe5iNAYkX3BAzLuFutg3v+L946CJbt8+/temfUlcRSKXLktiT2WU9wGMUrYOuCFFrwAlY0cgVHmNSV9qT9g5k0+O87c3BAvGS7e9R67H08xxk0suMfp5m6qJKodAwNhrXK5eL1vrWZ9hWbs3XknHV/jAlXyV+6gpZzS/VSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noA68/7k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noA68/7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A7D1F0089B;
	Sat,  3 Oct 2026 20:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791059977;
	bh=tSUhjkfC0Q2//h6dWhCqwgi4jeXYnkhNBRpnLdYChkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=noA68/7ksmbSP7UWWC0+zA5kZh994tu+Z+faRzxxNrfp0AT6nCJlGUpSNMXxx1fUP
	 GRIbAYUlUrqClUoxTLdcx0TP8SVcfUtkH+sAaETa9Z8whx8gxSbLAjebarfJitsFJF
	 7XHDuUURtnQGPfZYoHN2F8p+EXF5ACwpGpguq31uHjm3yolN7WBeTPNBs3Z2NS5TNV
	 DwJksVsvtfbsS5ObA9cWGmuGLG1RKCry+TCfkDNBR7d57lxhkrKnD6yM4B8R33rsD1
	 yN2OmBM2kE9RRGwbcMgGOMQzjVKgx3pCmUzyUuVqfypnWNqg8MMkoAz6dR3ba7HeVD
	 zxLHpuf9ort0A==
Date: Sat, 3 Oct 2026 22:39:34 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/3] phy: hdmi: Add optional FRL TxFFE config options
Message-ID: <asFoBih6P7Cr6Ute@parshuram>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
 <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>

On 01-09-26, 22:55, Cristian Ciocaltea wrote:
> During HDMI 2.1 FRL link training, the source and sink can negotiate a
> Transmitter Feed-Forward Equalization (TxFFE) level to improve the
> signal quality.  Starting from zero, the source may increment the TxFFE
> level up to a maximum agreed during the LTS3 stage if the sink keeps
> reporting FLT failures.  TxFFE adjustment is optional and only attempted
> when both the source and the connected sink support it.
> 
> Since the existing HDMI PHY configuration API covers the FRL rate/lane
> selection only, provide the following fields to the frl sub-struct of
> phy_configure_opts_hdmi:
> 
> * ffe_level: the TxFFE level to apply, only meaningful when
>   set_ffe_level is set.
> 
> * set_ffe_level: a 1-bit flag that changes the semantics of the
>   phy_configure() call, i.e. when set, the PHY driver must apply the new
>   ffe_level and ignore the other frl related fields.

The ffe_level 0 implies it is disabled, so why should we use a flag for
this? Rather use if value valid (non zero) logic to apply..?

> 
> The flag-based approach reflects an important invariant in the link
> training process: whenever the FRL rate or lane count changes, the TxFFE
> level must be reset to zero.  A separate phy_configure() call with
> set_ffe_level can only follow after the rate has been established,
> making the two operations deliberately distinct.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/linux/phy/phy-hdmi.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> index d4cf4430ee8f..1d4b62475079 100644
> --- a/include/linux/phy/phy-hdmi.h
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -19,6 +19,10 @@ enum phy_hdmi_mode {
>   * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
>   * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
>   * @frl.lanes: HDMI FRL lanes count.
> + * @frl.ffe_level: Transmitter Feed Forward Equalizer Level.
> + *	Optional, only meaningful when set_ffe_level flag is on.
> + * @frl.set_ffe_level: Flag indicating whether or not to reconfigure ffe_level.
> + *	All the other struct fields must be ignored when this is used.
>   *
>   * This structure is used to represent the configuration state of a HDMI phy.
>   */
> @@ -29,6 +33,8 @@ struct phy_configure_opts_hdmi {
>  		struct {
>  			u8 rate_per_lane;
>  			u8 lanes;
> +			u8 ffe_level;
> +			u8 set_ffe_level : 1;
>  		} frl;
>  	};
>  };
> 
> -- 
> 2.55.0

-- 
~Vinod
