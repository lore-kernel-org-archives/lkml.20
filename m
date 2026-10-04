Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23076352030
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111133; cv=none; b=GqF7njFFW0atx5tluXnWNbTRO4Rrx19Rkn3u8gGcf1cEz0h7pREo8bnuwx9qbImRJmvv3xk05qen7zGcBSj39hF452l5hxyFbO1tfLs7NpFtQAbgXGDvwDy9Vank56UIVsbwsCfqPVox7DWieZPO0jyjYYCcJQvJfloARhWNy8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111133; c=relaxed/simple;
	bh=1KnkVSj/piFydI7sB3zDz2RKRsQmO4Rvj3CNKKnUoiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVeu2ma6c5aTCxQbvOP59FzSqfCfYc5JA5ymqWShqBKRT91oQjO8HQjQMXjStabSYqGGZUO86fH/nEcs0ES+1kJqt437kYjCf5LMbSxvuuJ5E7r9NLHc0iwg7HG1Cdxulgm8JUntiotYAE+A8P5C2PaaxjdD+MQwIggmzLgu5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFLg41iw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFLg41iw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0C51F000FF;
	Sun,  4 Oct 2026 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111131;
	bh=Ded2t/lxa5/OOJ87UbsbJnDc5Xdi5OA3X44Xyk2z2B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFLg41iwcTX3eTrwV8t5ajXGLkgtY0ZvuL5T/qeDdnKQBwVWD6N5vCzTPBYi+bBZY
	 05fFRj3tAJZR+cbH5AyVdJa2W40q3K3/wb9BimQtqdglNKNr8+LXBwCiacs6srl2OR
	 D1nb+Bqi7YFJkK8yerA5MXws9WGktv/Pf3ROeJSV0kVYffAZuT0/PNGgMQx5+u214k
	 A7n7yhaCNIk/le8m+R9bbMMpGoc9Bfk21DQzyv2XNzjpVvTYeobV8hfnxfA8c0sh0c
	 1v8WYrvs0C4AMhH4LDWpQBYsyvPmHVsnuGAofGaPT4Eyd4NqyueuT98NECkdbuH0nJ
	 vVE6AkYtBSPsw==
Date: Sun, 4 Oct 2026 12:52:07 +0200
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
Message-ID: <asIv1zepKlIvzHX5@parshuram>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
 <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
 <asFoBih6P7Cr6Ute@parshuram>
 <3c0dc77b-b692-498e-aed6-aa97d827b2f4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c0dc77b-b692-498e-aed6-aa97d827b2f4@collabora.com>

On 04-10-26, 00:33, Cristian Ciocaltea wrote:
> Hi Vinod,
> 
> On 10/3/26 11:39 PM, Vinod Koul wrote:
> > On 01-09-26, 22:55, Cristian Ciocaltea wrote:
> >> During HDMI 2.1 FRL link training, the source and sink can negotiate a
> >> Transmitter Feed-Forward Equalization (TxFFE) level to improve the
> >> signal quality.  Starting from zero, the source may increment the TxFFE
> >> level up to a maximum agreed during the LTS3 stage if the sink keeps
> >> reporting FLT failures.  TxFFE adjustment is optional and only attempted
> >> when both the source and the connected sink support it.
> >>
> >> Since the existing HDMI PHY configuration API covers the FRL rate/lane
> >> selection only, provide the following fields to the frl sub-struct of
> >> phy_configure_opts_hdmi:
> >>
> >> * ffe_level: the TxFFE level to apply, only meaningful when
> >>   set_ffe_level is set.
> >>
> >> * set_ffe_level: a 1-bit flag that changes the semantics of the
> >>   phy_configure() call, i.e. when set, the PHY driver must apply the new
> >>   ffe_level and ignore the other frl related fields.
> > 
> > The ffe_level 0 implies it is disabled, so why should we use a flag for
> > this? Rather use if value valid (non zero) logic to apply..?
> 
> That's not quite possible because level 0 is valid (and the default) according
> to HDMI 2.1 spec. The source is expected to reset TxFFE to default whenever a
> new FRL rate is set, hence the API shall be conformant. 

Ah, looks like AI gave me wrong info about 0 being invalid, this is okay
then


-- 
~Vinod
