Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870188;
	b=rxechAQ48XGkujwT0uk3aTduOoURKQ4vmgk9cqdstrsr/V+EQgJAdHGdRmWVyLompm2L
	 +LpUXEwvnNFMmmk/N+zoAuap5Sg/wHLd8nbYQeRxUD7E+rBxoqJfQr3++qi6USxjPSZ7q
	 Bp3mMSL+zyd1EIXhF6SgKl4Ctk0Yz8QfCitwVtV47eYy1DPw16/LNK5Mk93fLFCMwcDuE
	 2/w/1Ua0XQ5P6qP+1DUZDpE2eNdkxLrY7SHb+B6ub508FsMGKqTJNTS9zKWRgTWA/HRtz
	 xO8vLl12Bxb1H7b/ogyICQU/pLvI2EKKFGp8H3D11tzzTqDcPGIZf9BftR0bDnuYvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870188;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Y8kBtBaVO81MFy9Ojpfy+eSSWqJ9vi0lzc/RZkyvVQc=;
	b=DMviwuLacDkS1HlQZWjujGShZkonXqPDQVkxz3vk/7HLDRIouztPlAu1h8mSxEx+0lQQ
	 rVpFBv/adOMPGcleeFz/e2gf/hh1fqU7IkTQ38CSKjESiBGlyvzwA5cmCxhp4xPClNTB9
	 RNevOyEIYk180YgbuvgG9CichTMDXRJVoaS4GyzGP4+bhT+n9n9yLCy4vHSfwjp/IWJUR
	 yPsKR7G0pIa6k03dzqkfpTiuIXND+ZfmwJzZWBa65QsEW7a+ljsVRZ9GnhxG/y2ztUu+X
	 An+JEHKhWkQ07ZzzHy0Ia+BNSfOYvPX+sicicmI2SchMLJH5m0wvxw2eSXYuIYGe5ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbDzTwg6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 5A177606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbDzTwg6
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 49B7E1F000C1;
	Thu,  5 Nov 2026 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870188;
	bh=Y8kBtBaVO81MFy9Ojpfy+eSSWqJ9vi0lzc/RZkyvVQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UbDzTwg6NBBDiaqHUTTiTHNsqZwkvNzoMsw0x/eARP9Zh2ZX9jheHWN4ZnCrKP3yE
	 gdLFYO1L9LY/gvxqn1oN0zWJxmIJ2QTvg1VKOpUc81D5uBKk8paITkJSog0EgCwRUA
	 BJx3Rm3kkqx6MjSu9dfbYpIccG62Y/o6Yuack9GoE9ZzBKJzcOvtozO7LNVtzjaybW
	 FDXZ9EXEM7Wu6lSd3sE/GYRORAQ4TIkFTuQzoHjtELkov1FZjsfLsNdJk4n552MEu5
	 EzuMpBHsO5ivFn98DoZIScx6PClWuEB/4vIqd8N1Aw6DNPAzz8Sfr8WljJPh4dqIE8
	 8nPHrYBq9zkQg==
Date: Thu, 5 Nov 2026 10:16:24 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] reset: Fix issues reported by Sashiko
Message-ID: <j2pauso4n2na3vytjskwa6arl2psd4zybxk74wxqetmd6dggr6@7opqymxo2it5>
References: <20261104162038.48622-1-tzungbi@kernel.org>
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
In-Reply-To: <20261104162038.48622-1-tzungbi@kernel.org>

On Thu, Nov 05, 2026 at 12:20:36AM +0800, Tzung-Bi Shih wrote:
> This series fixes two issues in the reset controller unregistration path
> reported by Sashiko:
> 
> - Patch 1 fixes a reset_control leak when reset_control_put() is called
>   after reset_controller_unregister().
> - Patch 2 fixes a circular locking dependency between `rcdev->lock` and
>   `rstc->srcu` in reset_controller_unregister().
> ---
> v2:
> - Address review comments on reset_controller_unregister() cleanup and
>   teardown ordering.
> 
> v1: https://lore.kernel.org/all/20261102155840.20376-1-tzungbi@kernel.org
> 
> Tzung-Bi Shih (2):
>   reset: Fix reset_control leak when put after controller unregister
>   reset: Fix circular locking dependency in
>     reset_controller_unregister()
> 
>  drivers/reset/core.c | 69 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 52 insertions(+), 17 deletions(-)
> 
> -- 
> 2.53.0
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
