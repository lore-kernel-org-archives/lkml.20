Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633449;
	b=sywq10hf/bKexRVNKw8eVIXJjK7lyNz4guBuJiEykt/JpcTtsssADtAtPh8mRTJg/3PY
	 URSFH5kXBgcXiPqPz93N3ajF+T1bMYnFeVGs/anKxy2knZZpam3aJ6HcvBu6dEOqJqyK6
	 ul0CqOlOO+5N6tJpo3biDPZcbKVBYlGcW432yYJCpBVo1aiED/jDC4Vj1IBfQ8Xa7syo2
	 gKsaRzFOzm1H4lOKdnmt06ZN1gxJ/+TeAZBHmDdX8MIfP+VUA9rTQHSsSQqYM5VLn4xTe
	 DG3i6OHW1cy5ETzRb6Z3ksdBn57mNYP4hQDMAVrFfEf4gqGvdffn1hTbilwziHrytUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633449;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8kJkMtRp5NxpBwXWK16sC7h36iQ9rBNvoglPnh69ZPY=;
	b=rYII0cj7dO9ct1Mf/MY/MzlrqLe9yJz+0yTN4R19yiWWOl0rVSM5FZjnVa/RE9oO23pI
	 8Tpid5eRYu2V60TYrvXdZHUV91l/J2rtL/DYjFgfzDnHh7pRl0imMJ5wxx7TePnbM0woS
	 7A1DvbznuV/6J+qgmFolSUEnQq14skss8Mlsc09GYGkdD0/2hnqB+mvRsMQu4ONIQaoie
	 q4lfGRyGGBM+8vCe/+pv5N9EGUZ9oqFmP1lzw0XKhitWdoplgp8/iHxjND87cKXspN6oL
	 gvLyEv2989uDgDqVr9SXNYqqvRzMBZE+X2n9kSguD+gcnRSCEm8v/LJ94aC3aS3jsgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+IUCCTE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE76606A319;
	Thu, 22 Oct 2026 01:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+IUCCTE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728071F000C1;
	Thu, 22 Oct 2026 01:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792633448;
	bh=8kJkMtRp5NxpBwXWK16sC7h36iQ9rBNvoglPnh69ZPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e+IUCCTEbtNq4Zu3iaNqbFH7jfR+WK2dtZAdbT2YhzTLC2yaG5YZqifkaDGBpZ1r5
	 DvIPqe215G9szWDx/EusZPWbqIPkt0XBaOkG26wa2uowUPc9WJO025v5C4V0MJ5uv5
	 CfxxrWTyUXIrBGEwxEq7eNBrz9iUc++V+WDUgamAh/zpD6mdmUOdK2Z2SJylIEO6Rc
	 e4n3JqvON/J9mZo/+9w+dxFgcv56gi+e4ar3lZT2QsEXQ1vQ5BvpEEupCvAOnsA2SK
	 S+lDqYZopPeAz0Ty8BgPvraDI/Y24Sp/DCQpD6L07WM+lxqQakQprGA1n0vfDtSv2p
	 t9VIoGnsEpcKw==
Date: Thu, 22 Oct 2026 01:44:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: sean@starlabs.systems
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	kernel test robot <lkp@intel.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] firmware: coreboot: Fix CFR error-pointer handling
 warning
Message-ID: <atlqZb-LZkkuUIz0@google.com>
References: <CABtds-16eUH6ah3Rr9R=N2605TPdFgDekM5oXVeWqGcmYfWqag@mail.gmail.com>
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
In-Reply-To: <CABtds-16eUH6ah3Rr9R=N2605TPdFgDekM5oXVeWqGcmYfWqag@mail.gmail.com>

On Wed, Oct 21, 2026 at 07:57:49AM +0000, sean@starlabs.systems wrote:
> From 4e74bf1ccc0f61b4712f688eab66a7750f693243 Mon Sep 17 00:00:00 2001
> From: Sean Rhodes <sean@starlabs.systems>
> Date: Wed, 21 Oct 2026 08:55:54 +0100
> Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning

It looks like the patch is malformed.  I'll remove these when applying it.

> The scoped kfree cleanup already ignores error pointers, so passing the
> pointer through no_free_ptr() before PTR_ERR() is unnecessary. It also
> makes the IS_ERR/PTR_ERR expressions appear inconsistent to Coccinelle.
> 
> Return PTR_ERR() directly. The scoped cleanup still leaves error pointers
> untouched while freeing successful allocations on later returns.
> 
> Fixes: f2e05ce9763f ("firmware: coreboot: Add CFR firmware attributes driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610210637.LiJ3U0ob-lkp@intel.com/
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

I'll queue this after -rc1 and send it as a fix.  Thanks for the quick
patch.
