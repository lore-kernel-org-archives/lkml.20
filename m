Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916191;
	b=vfVs0xHRZKsDMfqtNV56BwSMWLXjiBBjMkGrJkY7mv255YlDGn12KyXtE/19u9P1xcI2
	 S/+0vwgYzm+uaD6e1m10Elg9ovuJD+731opFvpSeoZu5JAf+tykZbP4XtpdZ9da9TaB0f
	 PazwCXb0pfkX0ibvXNDlW1fPf3wjKLJasGyQOPHUhfSOLDORA3/1Y9CX2DJTZTWTcKO9C
	 6E8nfWqsuZZRymG0Pe/GNwJCqzAi8ZBxI1DQ+Bl1qHqBBpHDmDW7DkdG5cjKAi1k/LJ86
	 AXj9JfyNRvRsl8Yg7AIYqOsnCiKgVo/FBLrAFI99WJW7+qRFAw+3n7PwF4BSJ1syugA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916191;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ikeUCHsj8fT7pGEWlQ3BvLYrTD78tfSy9o0vHDch4ZA=;
	b=eBxSwcN/zZwuSJRjIcqslwGnvpokEiUovwVRaEU5nr/D+4RQFlD9i6lEMiJ2cMkCUbCU
	 bss0WSx3EKHttARxr3q/kpNMolMoXYtwWQ7DzxF7VPL/VzzMUyhXNcgKy/vjEGRVUmf7D
	 KFJvn9oKGViMOKbr7NH45jEp+pgs4zhYWWMQP5YlPOTj6gs9D46sf/D4lfWy2k+GSVOXM
	 wE5MdYTBYqxUfWa2QeExMSnYaNVwD9G1qY5d4VthMkkxmfkt3a0GZk1+TxQi4C76IDgBB
	 5dZ1+F8te94pjQzWqimgJ0X3b447uGPp4WeU+rfsjisyowTrEPPQjzsILfJ13xWfBTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xw5YZvP7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xw5YZvP7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E451F000C5;
	Tue, 17 Nov 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916191;
	bh=ikeUCHsj8fT7pGEWlQ3BvLYrTD78tfSy9o0vHDch4ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xw5YZvP7xe2GhTdte/6s2qJRiL1n6cy3SL6+tWopJkl4lwjJ7OLqxwpBbqiLHapwV
	 StOoqOkbmcGZk5di9KksHpKNYJoKIfwi1pMzRszNc5virTiPquT6U54ZzSoRXTl6dX
	 16zZQ7t2ECNbGgqz1/p5tg0rVps9qG1Ln4MZmxXZ+IL3+sIj9WQVGpRzg1+EjxGyQK
	 cI+5Ba7C9bdUVppDQMb8GMrOmtdGIBWwJlGqkQ8sbuQvXqcCzAgMxJv5uwP3SlzrEa
	 H0fjzPcpLshLjrZczRRfkFAg0U84SjMl3yUB7CvHC7RDf+eJu8quMtrsWEbWfcSFBP
	 JHreaoBCc7DvQ==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xTHh6-000000049fg-25j2;
	Tue, 17 Nov 2026 12:49:48 +0100
Date: Tue, 17 Nov 2026 12:49:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/panel-simple: take i2c adapter module reference
Message-ID: <avw_XKo3EzosfyIh@hovoldconsulting.com>
References: <20260716132334.1565183-1-johan@kernel.org>
 <anx_MPm2Y0RVwZ9h@hovoldconsulting.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anx_MPm2Y0RVwZ9h@hovoldconsulting.com>

On Wed, Aug 12, 2026 at 04:12:00PM +0200, Johan Hovold wrote:
> On Thu, Jul 16, 2026 at 03:23:34PM +0200, Johan Hovold wrote:
> > The i2c subsystem currently blocks during adapter deregistration
> > whenever there are consumers holding a reference.
> > 
> > Switch to using of_get_i2c_adapter_by_node() which also takes a
> > reference to the adapter module so that an attempt to unload the module
> > while in use fails gracefully instead of blocking uninterruptibly.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Can this one be picked up for 7.3-rc1?

This one is still not in linux-next. Can I get one more ack or whatever
is needed for this to move forward?

Also adding Doug who merged a corresponding patch for panel-edp back in
July. [1]

Johan


[1] https://lore.kernel.org/all/20260717143119.1815106-1-johan@kernel.org/
