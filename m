Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D455930D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888144; cv=none; b=n1c6kM4VotFGksVuL4mUDAc21uJeSpn7hUwIOV4E0kRkDq3s8c4EDjdECiYHLwAzA+LJCnp5l0XSK+fVdB74fe1e8sfH5VxUmx9egTRledpNtsoY2Zs5942pbaprloJlayJQRq/vDW4Znja+JLJwX672SBtnq6ZmGYgT6oJMNxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888144; c=relaxed/simple;
	bh=yNBFvkyXPc2cDeY16n1RC7KI9GdsL64r6EmDH6VG3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSJQElYkWimRsjKMk+5hXOoMD6ZbhhZQ627yzQ3GEhIbgWO9LjwpWLd6ydaOFisWakf+W/WfFT7PPvRFjDuUos8tYFlp9Gj5hb2dBD7+zVnvfDRMGvMLXHliBR3GCmkim1buDJKjWyiwwIKxROwpe8+bMSzDQgvZ3jVeQfppvTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4HsHUvo; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4HsHUvo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso5305799a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788888143; x=1789492943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4QjhxezMuD4M6Sjd/ZpNTJ/GPfFmgcgxaM9H6LF+90=;
        b=o4HsHUvomsh4vBHTNEbSbfDWD7ETGq9T8gruPizY5RMKvuBAozdbSIr2uEuLUbBusJ
         xnxsHcSWh+ZMK+Uc3Bm9Ig/CRHCn25v+J7W1tsx8+EdPx7UhiRMSnMkkNMZTZ+PvpOtc
         IcXfpdBZVwYXXKabD1rAbHL6Am6R7k5MuuJiQwOsZc46R1H4Y4DNaeebEbhDfjaRrQYQ
         z0XTzTBiwgAH8g7U27Dva9zPuxtBVPbX3JDymnLDTU5KB1bwt2a+hE3alJgXyMWQcQdf
         /a6sFoXclBykcYnPt2Bf+9AK7ARrAvdjP3q/AAgPutOgMnMKSFUstuVScDNMxrRetC3b
         xtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888143; x=1789492943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4QjhxezMuD4M6Sjd/ZpNTJ/GPfFmgcgxaM9H6LF+90=;
        b=BlbgUv96/QGH7QmRUmtqPH7WqA5WKjCKZEDlPWLwlK2TWfW93uhZOKWbxnq7ISuNcW
         BHIIPoX8PxBcXAoCSTLFZgdNuaG6tyX0tADbcsXMZIPeuigNFBRjixVSe3I+ZW7GGYoe
         F5AP2W3I44iNwQ2all/3DqzVktpQCMViQmPBQ78Yn1WJYv+t2cfA+yaCH9XXg8DNTU6s
         45aelmTbScJ3Oxh8AHgHp31MdORJbm3Mxd8PZlcP+HEGS9Vp5M9XhQKC60eDjGAXSHlF
         6VYCE3bqgTgLM4ighJI9uA4e8FJ86xgx9FgN2pBpI+iIKMBNotfh7gZ5PI7zpYliulzr
         NwFA==
X-Forwarded-Encrypted: i=1; AKwUvBxbZk/QnVjDhEZYn9FqUBZOltKeobP/W60uwCaLpEA1WTINNxXecKFk1vlfTVIt5dAYrZs7/JVNNC7/m3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mEBGrimEDub+eS9uAeryVF92puCKug6YFy9G5QYcz/Noh21zRH
	+/Q8vuCtlGuhBPD8S/GWL9nfsV9KED7IQAF8laauRDyDwah5RakOnxgxg0wQSSUiywc=
X-Gm-Gg: AYBFou1nJboDf948zPElhAC9fmHoSkgT3/EVrnOln2cQbJAIE/MbtNsz+ftYsrfHO8J
	fEINjL61YHUVtFH/D+UiebQG1zG3ydkQkgTQ1mBx3tzi/I/iVo/a6dhq48RKRVI4IUuO6FKLLJo
	/zTT+mVS5wi50dV0UQH6KJ7jV3OBEpI1Vqshid4w2aQctdE5b39cSEzCfespOlhDCsmLddyGS3N
	v07w9iba8DpcJFQdyv/UcGgqGsz2ALy5gcBdo8saH4ao5rygfpLbSKuf/c5Jxyd5QT1qOEL8pJE
	nKHZDMSEkuMxneYiTJwjABIDbnOgEnWSM6j8y4d8IbBU2K4EHVC5u3+qp9u269mhn4owkOChQPs
	Uj5w5C+W4eFR5JvZyHiFRSJU1X8mSCdfBuv+aUS/HbjUynxPi/Q8ZDtdz0NEn0tQ/MdYkYLcZF7
	TWoBVG8zH9hyfUYvldIzXbHh4K5AV94kdBZQkz4cWQegfunS5zb/7zDY0t3mnc52WEOg0D1WM4n
	6s=
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr45236783a91.4.1788888142766;
        Tue, 08 Sep 2026 10:22:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:14af:4aef:7bc8:f5bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm26886750a91.3.2026.09.08.10.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:22:22 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:22:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: fix typo "upto" in comment
Message-ID: <aqBETPYGwsKqUmL1@p14s>
References: <20260907061927.4585-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907061927.4585-1-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 11:49:27AM +0530, Hemanth Selam wrote:
> Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 1b8bb05924af..28bef36931e4 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -110,7 +110,7 @@ struct virtio_rpmsg_channel {
>  /*
>   * We're allocating buffers of 512 bytes each for communications. The
>   * number of buffers will be computed from the number of buffers supported
> - * by the vring, upto a maximum of 512 buffers (256 in each direction).
> + * by the vring, up to a maximum of 512 buffers (256 in each direction).
>   *

This has been fixed in linux-next and remoteproc/for-next.

Thanks,
Mathieu

>   * Each buffer will have 16 bytes for the msg header and 496 bytes for
>   * the payload.
> -- 
> 2.48.1
> 
