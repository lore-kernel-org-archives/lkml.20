Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882614;
	b=hwBPC8DvH8b+eYMCUcSkkvoo5mX1HcquJF63moWZPA7RTQZ2fj+kRU6XfykiwP/3D+HH
	 tqbAHFC0U7ckWh2T/cVrX86GHWwqmlw27+TihbiEfXw74uoIg3/ITD8tYG38LEGOgbvAG
	 b8t07xH05N0fMkRpjURrt+dCMnnwi0TKKvxeregmpZ2l4S+E0cBuMj/R5CNCcghC5eADs
	 xJ3Lbph6Ta3KhfDjOSta7wGyjBxPSZVjvYYBixiTPdNvydsu4TSHS18CeGaKEG1ds/FpA
	 sFaKAoXvRaOzu2VuKLt4jA9efWgcg1npvvtn0ZS2VSBTRSN/GYAZ2rLvRaEszWhzveg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882614;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+vU+7Y2PCRNUDXo+sq9092ljm50COrhrbCWF1bkUu8M=;
	b=wts2agfbh+gCG9FmfEpNe+3qqrHf+wvrq9zQ64PGdWtgC5Cy4CVsvlThiUAL9pgNXMdu
	 KVaKsRGTyvCwAD61Dm1ZluiBC67n/8fYRuuxFuVTgqixcVktfo8KR/RTAOFDpHjvO4iO+
	 KiIrmcaqreN3CdBRKiWpDmCYFRrlh5CAq6fn+tpMaETshEibeUvHf8r30/UUlq1IulEiO
	 c3t/fAi6DN077j4FADkGtmaMpgg59heXe/dV03FvQjd+s0hAYNdV15i/mZHBbTIV6jSUZ
	 ESzaJkCOkj/P/KV72YCbgdxsUWhYo62HV7e8KSz43H4iZdGCzR8K1y8ugUXXt3Bk5vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5U60MJs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F633606A329;
	Tue, 17 Nov 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5U60MJs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DCB1F000C8;
	Tue, 17 Nov 2026 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794882613;
	bh=+vU+7Y2PCRNUDXo+sq9092ljm50COrhrbCWF1bkUu8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K5U60MJsVwNbCJzL0WUx0AlEL9z26JnyzM0wvja/NBLbfJAxRDGXg3IKk2BykT4TF
	 xquHMR4HCX1awQlNOJNeNuTPkVgUOZCz+vjIvaflhCFJxX9F+7Mu3dGmtrks+9e2vd
	 e4w6vV9D8w6ClSZ8uLuWeWKozVypqTeUc/Utly9BcrElvZXUml22Gl+O8m9T2Y7PaE
	 NlVs9YSLXcPORoumN0XZKXgGITyfuSZb/uCwEU+sWg0F9K/Oepajz92v/9lvNdvyEb
	 5z9JH5oBj6w+wVqwbiUwBVoqdpCm2q0pYYwKUGS8Q7KFZIUikTZbQ9p82vGKwCQ6e0
	 9KOp79/Z8lJuQ==
Date: Mon, 16 Nov 2026 18:30:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Coia Prant <coiaprant@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Paolo Abeni <pabeni@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiko
 Stuebner <heiko@sntech.de>, Aleksandr Loktionov
 <aleksandr.loktionov@intel.com>, Fabio Baltieri <fabio.baltieri@gmail.com>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] net: phy: move
 DECLARE_PHY_INTERFACE_MASK_ZERO to core
Message-ID: <20261116183012.11a7ba72@kernel.org>
In-Reply-To: <20261110160554.918652-2-coiaprant@gmail.com>
References: <20261110160554.918652-1-coiaprant@gmail.com>
	<20261110160554.918652-2-coiaprant@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 00:05:53 +0800 Coia Prant wrote:
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -159,6 +159,9 @@ typedef enum {
>  #define DECLARE_PHY_INTERFACE_MASK(name) \
>  	DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
>  
> +#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
> +	DECLARE_PHY_INTERFACE_MASK(name) = { 0, }

I wonder who suggested this, hiding the init inside the macro seems 
a bit subjective. I see no such defines today. We'll need an Andrew 
ack for sure.

Please try to add lore links to previous versions of the patchset
in the cover letter.
