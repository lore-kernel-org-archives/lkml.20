Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF1496D4E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177909; cv=pass; b=nfBg5PsHJKws8TdHOE5jgKRBUJBir2+yocmZX8bEbwb3fuYc1tuG7O0U9RITMBPsiTvazk8yIR6vksnprwceiS7xm6ld41uvfXHhva9D2fX+UfVYhqr0tHQcARfU9CrZ/gPWrCeS6u6bl/uZbrEdWytqRDegUmqhvMy5y9+RrG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177909; c=relaxed/simple;
	bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4tvjI+WgCxKOr42WGDQLAlYcnmJ8M6FOtun8BwJdfUMPh0hZlgMP/ZAikIdO6m/Pv/pB3XdiKQTfZurVE0fIdBcEK5bMrlI42A6KCEtXoKX0JzPUzbZk66L7XldL0WMmbXTU/Fz2zyMg79VpFVPclBYLHCvPGwvnXMtA+m5JQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1rfZCpV; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1rfZCpV"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b34ee88df5so139539b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177906; cv=none;
        d=google.com; s=arc-20260327;
        b=aDGj7+oF4yzDnvmoVgIYVmGd3RK+uZZepU9eMECkMAvpGQ8FrW5CtcZOqOSISmj8FE
         zXWkFxHJI6W7qNSc8C3mYiuwH5a9hT5+/kNusvPFyt0zoEmC3z1DVnQUoFfW+KPt/TWZ
         2CV+p5erL0Ek9GZuLDqlqPOUyNFhBB2IV/XN+sNQfFDXfBKv/RQoJBEIlwLdbIKN/mHo
         O20CtlHgHynIT9td9VN9R0qOd9xRP3BAfz/tN9ZLzL5CrA6VRGkeGjumLnrpVGvTPeAr
         xPvS0aHNbLfg1QBr/M32mJ7T7C6JPaNqZ3l88ojXy26Cb/T24lYtw17o8Ior9HCB0FHE
         gqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        fh=0OkyN8OZc7Z341kYOVZKZhvhJobjuImMK0wMCmiX188=;
        b=VA207cczIEWWrMOC2i/EWzC6RM2HJqGMCrNhdDFaN1sT2loKi0ifuPotC2piLhseSw
         rvpWFgK1/+ZWSz6FE1d+57rutDL+3Lcr3K2BExb3wNmWFLFAqpYRqxol6Y+pr7Y6wj81
         C7HLFlgYj8/opXDamG+d/hi1MK7TUAzlPbTOBKcsOe06KfuoyWe5t8GHBNjjL47l61QN
         MRxoyYe8n0WyViJ1OnadkCYb9NvhNtWo0gRsvQuViSZSteSxDxdnPF3eXnf8gi4wwCK0
         op8/aW4Vre03eDEN84Cok/On4v5LNoNE+NHAJ6k+JMZIcBPTpgtiOILefBBCpZxzkGBo
         PpDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177906; x=1790782706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        b=R1rfZCpVaoeS1I2e9V3K7gFOBN4qX9lpx2qWsDz6TSFzILf9pqdosDuJZkprYzJUqy
         mPSNCdaCsCRHbpk6WVGCjxaAALCpoiyA30X/TtQbkLIz1p4ceuY6XUPBKEdEBXv4EE9S
         2fnqvMF+M+RxE6Kgwj8mBgt12nP7s+GU9YdFI7tJbg+4wH3JmHZwJNGEVvwPJVaBrIo2
         VbHltlbqfqRtmHgK6nkQyVs7NwGN4y/3T/7N7X0qCtJvrBZ5D8pCB62U4Vz/hOvHUKi4
         seRU0faKnD9B/KzQxPXca3DwxLerTBl0nDK9kHyaN+DvX+i5ebUXe7rwbaDdIJmBDZuH
         CJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177906; x=1790782706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        b=xP2eNzVltBgd+nM+FO5blIIwPlVdWPZjj4ngcWO2gxskadVNgmqq9yHVvMj1gFfTWG
         +mGHgKiPslGDmMUJWvK8eoChUo13dazxqn0ZWiPfTduu4Bp/ri9L0MKcBzMEq7H5bcfe
         TIIbhRhmeY4mocYIs4L3MkUsAPbYg9WfVwUj+Gum6vEcMk2+v1Elll9MNlgOeGLTsjAC
         JtbKrcoT8HOkec/fHj0IFzUOXLe+YcbTKRJ1d33JY9rzJmdurvwYE5rFLlpRra0nVBzL
         Z/bVtU0eBQO8+qOmA24DAMIQJzyv1FehuwECfRdoF/POZzqAkuXKrxRFzOE13CJSR5WI
         RXZw==
X-Forwarded-Encrypted: i=1; AKwUvBwsaUnZwgz/ksyApb3BwV6GsLbf/PeN3bxZaoxkmTVyvWVX/jfBrDd4aAW+UOO5nybEUEkcJ7C0bgkOg/0=@vger.kernel.org
X-Gm-Message-State: AFuF++kRkSgMfhYZ8WNNBA3Pi0NyI1+zrwZ30YqaNbA7bdqWqQl2cw08
	eSvqTrHHk0YzRgPo3f8gKM82jGW91Uj3dV5ny1WrGqmHtYdFa2gYDMKwr7j9G5zVMtwPYl81U1V
	1h5xFWUStGWySsg93lieNIDxX2H9Wt70=
X-Gm-Gg: AYBFou2t+MRCBvQVExAZRVRdSJyp82+TnyDj9xQ0467Vasy/3hQxJ0QaHkn8Bv/SDUe
	3pTr8VXZTRRXLiybZcqqZK75K5WcFo7g0OoJ08DcRqYEI37lPJWLwJOdYthyfFaNFGGgSYVVwMI
	utGI03l8i2X9mJZ4lTVSE1WMi/K36LGtJJ0UHxWC7o8rCw8RJG3N5TsblRPmV8/TFctU5gjo4oQ
	PTZDx2RiW06PkCV2vj0vRsWPReoXF5QnqZdwbI7PodIIE/p29t3vOXNX9NacrDi5WTIZro14SZ+
	YUa8iTB2vv5vCTE+y6tk/tiKPFPIF5kootpSRv6XDRkeCJbyizhlh66EpQK73J2O5Tk0rPo=
X-Received: by 2002:a05:6808:ed0:b0:4b3:9985:1734 with SMTP id
 5614622812f47-4d5ba3c4acbmr3726514b6e.4.1790177906420; Wed, 23 Sep 2026
 08:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-1-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-1-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:38:14 +0100
X-Gm-Features: AclHuK-2YGSrpzgft7by3_dFRSTPGzkf9KPty-TIWRA5mQOXoN0qwCVvVkFO1d8
Message-ID: <CAGSyskXex-Pu1n1wp+YfpVgbZnCRrd3CmGcLR9XWxenVNnk6NQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/5] netconsole: send the oops when oops_only
 is set
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> A target running with oops_only=3D1 receives nothing when the kernel
> oopses, which is the one thing the option exists for. Only a panic
> still gets through.
>
> netconsole_write() bails out unless oops_in_progress is set, and that
> flag is already gone by the time netconsole runs. netconsole is
> CON_NBCON_ATOMIC_UNSAFE, so console_is_usable() keeps it out of the
> emergency flush an oops prints in, and the records only leave the box
> once the printer thread runs.
>
> die() wakes that thread from oops_exit(), by which point
> bust_spinlocks(0) has cleared oops_in_progress again. TAINT_DIE is set
> in between, so test that as well, behind a helper.
>
> With oops_only=3D1 on a netdevsim target, an lkdtm EXCEPTION produces 44
> lines of oops. The receiver gets none of them before this change and
> all of them after it, while ordinary messages stay suppressed.
>
> The taint never clears, so from the first oops on, an oops_only target
> sends everything instead of going quiet again. Sending the aftermath of
> a crash beats sending nothing.
>
> Fixes: 7eab73b18630 ("netconsole: convert to NBCON console infrastructure=
")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
