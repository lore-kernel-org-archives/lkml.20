Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD445C704
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863446; cv=pass; b=Xd1nthrOIe7qvoEwuRbPchQaPgGek0XfU9Oh+f9+LQmuPHOUHRrrR3NUsUHINvGORUgr/CqfTeJh1Z5lK+rrUgR1Ex1fFdKqM3gy6xBMBvqEZW8nPpnQIep16AQT2bNvJs/421Fhc7YEjxhAYRK9BSRRO0ANZLBLiKqwHMW1Nr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863446; c=relaxed/simple;
	bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKCzPPEStgBkv4XUxG026KQw5J2MOkTRKbAh1cGIEKUWFOhJGGnETuN5kKNBirLNfUIk208MI1JZY/vsbzVNzkZvRrgCXHY7lUsYDOtt2jxaa4FLFBzmEEGyYII+qb95BB9yIXeBCDzL8fAkvDWw6ABZSIz/pzP3AvNz98J0VpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxnS9U4M; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxnS9U4M"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a75ff20a6eso35005851fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790863442; cv=none;
        d=google.com; s=arc-20260327;
        b=TX1LI9vqWA+2QVFfg5k2QBP0BwzmHBa6riBsns0hLEzun1hQ79gf6/9IrOXg1ZEcnS
         QY0jBgINDGNNISPr8LDB/llGzkp/MwLq36Gl8RxpgsJppW0JW/uDKdLac7U/N/xMxrOO
         G3o5bmas+Qsp7eHm46MLjhIvJ8GRvd4tfpU3B9V4dU3ulUwUR/UZ0HHiVWurmn5ds2Oo
         cfO3SwPNGvBZptbbCwSAnD16zGZV4pdTVRSzOUO/Pza5t+RALivqQp21maonqVmKCNjO
         mSM9yFk7qWPx2IdJzTGk86eKF1HM0UO30Zqi42UV7zREdCTfSkPqiBIxyrJrUm9hr2UB
         I1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        fh=qTZpebwbu1MB5aLf1gto2n9NHZMhHD+jY/BR2Kism/I=;
        b=GpE2XNNsmBWJobKasrn51NLuWigp56szYxgYDzNf/x8jpmbuL7HkpH3a0Ni7Qp1Xhk
         oGY79vclG2opfwOoNqYhw3HuCb6xIUN9kuL6SP05UmShIKBIVi+8rmhPOx6PXsppW6yT
         AKtN64AozObm/hCrgMLUJtbNKCNmCWrzyUOBH/R8mCq5pSefYufdp6ONsyjsY9ItYBwT
         jvDHgGAIejLrxYD0/fiRCtB/RO5kp0KKq4lNTgz1ozjmgbd1cFFaVrUNb8sZF6moUhKx
         1oY3ScAQZ2sZYEnQvHqvMksnu+z4Busjcr+haczwVtwqMDL7H8tRTf8ypxIY6jzPEcYO
         v2vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863442; x=1791468242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        b=mxnS9U4MAgMkcyZxXxOPp5bmZqUfNqW78r5C1CazNNYZAlO1HmyvOl6SR526BHZ78c
         zQC7l0Hbz7V3sqos12PwSoeVMFBfbZsJ6FpTXz2Ntr1imtKCsblpFIUMxAjHUjYM1MyQ
         ui0rG3MtrCLlL9MOO1KCilQ9PvCd81kP6vU8VkTkreZ0E/Kz07yLSVakR/vl4Khm5VRi
         OFi0M6lmV/hoaIN6SSSF1Rc+3DhGQoa0zgytVxxTFU5LZi0EH7CdxtPyeMc5WaBslGf3
         uu8tPs7on1//MD0XEMsYA15be4qE/RJYNDRSKgndp/1WR9gSaYxor5FqjUFBtmZwxfep
         io7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863442; x=1791468242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9jLK7/wc7B6mGa6+VCwGx4Ieg2jj91kEAwv06rg/rQ=;
        b=mrOvv2cT4doEPC0zs5hcQrvSXH+BshmhP/tad0WgJDgl/ScBHzWO3BHmDILOuJjxV/
         Q4B18WpkYfvIwrcPU08Y0MexwdaP6eH/rApSeBBpvq01ILrW1wZUZxNZXOnFTftM0nOh
         LsAPgr9eopa2p3yyl0FhBgXAxzhTpgAgN+zIW/2CFa7QdwK2g+4Dw2nACDnP0VzReMpq
         jNRHA5uTZnK6DhOhtrGclCIXH/HnK8nbauR/b7X5d7LI46xj6nfvG6BA3XG6tF/Jdwsz
         Ewn0z7K5+W/b5hRjOxD309i8hHtGv5DniqaU7oYx2rCaTpIbJVQAbcdKXfw3E/eMdbGH
         twAg==
X-Forwarded-Encrypted: i=1; AKwUvBw+TpNr01Z/eRNpAwDrmV/cZ3rCkyYMnqER33dr7mJWTmmYwEqmeLhDzDoaayuKwHCrZaFsPZhW/0iNcCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjXU4f9JqTnp2IhVEKtcVrBAixhUXkSWROmo73TNoOxnDqWB1J
	+fy3bBdljeFiA0luKMrz45LFLtjua0hNMqqsb3GtN73IZyg+xNUIlig0rN1ta3Oqp9H4pnbkZft
	cu4KyqXgECJoc8V+J7GMvQq+sVntTLo8=
X-Gm-Gg: AYBFou2o/3D9Goxmbfn/r76EhsUwaiMUl9ipC3/0OzfqQLlSk0Onl2jP9YXtLAGfKhd
	sja2aYkgLtFJsthchRaQOEADXaALrGdV64G8Iff8yA3yvuZIvunPKP746WDKl0XMRtRCYBGw6Hv
	I2KJjfFxonrc6C5K0kThvIGrWpE9c368JjC0jZZOngcqYgJDcWYrO04u818AukpA1p7hDkbn2YT
	HWSo8W6nwgnu97cDi6lElZrnYq5BRfl4O6fwbBdv0UuyapA2uk1r22ffKbL2DqKWoMFt1Wz/s6o
	UU5V/bQnVGlwFTpUj1R3orEg7ZqecZFpcg8X9bAGGHqHau9dDbt7mZluahQu/wl4MnczpWU5msi
	2zHE5RpnSe4prFcjyYCxYThDx/NYidvygEfu9kTchgee42DkY65Dur2jfW8rDxSfP2egj4HmY2j
	naZQ/IU9rSRwh3Ii9yfCFUuDvlJzF59LZevpFWEnLY
X-Received: by 2002:a05:651c:2121:b0:3a6:27ba:be0b with SMTP id
 38308e7fff4ca-3a77928dc6cmr16119671fa.20.1790863442038; Thu, 01 Oct 2026
 07:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001133736.802604-1-tzimmermann@suse.de>
In-Reply-To: <20261001133736.802604-1-tzimmermann@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2026 17:03:25 +0300
X-Gm-Features: AclHuK-MGGGgGsa7XTJEX30X4AH0rHlA77AtOEFwmZmXzvdKsC2XJRDqSMsLZSA
Message-ID: <CAHp75Vf80MzmPvOK7Qpy99dxoKY1JSiJWM6KUVswoO12LgtuBw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: Remove simple-display pipe
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com, 
	ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 4:37=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> There are no drivers using struct drm_simple_display_pipe left. Remove
> the related helpers from DRM and clear any TODO items. Hyperv-drm needs
> a minor fix to include some additonal headers.

additional

...

Makes a lot of sense,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
with the spelling fix in the patch 2/2.

--=20
With Best Regards,
Andy Shevchenko
