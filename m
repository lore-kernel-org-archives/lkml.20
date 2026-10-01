Received: from mail-ej2-f30.google.com (mail-ej2-f30.google.com [74.125.228.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043351DAE3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865697; cv=none; b=GyHUKpbO1izA53HhkPwRqQUMlR0tMtSvxd6YFCfV5d91d4++gwJPEjUl1RX7BYviBaqsWUx9Fk772AlZS58dcDwX9CprLcD61TvdWk4rJuqrTzwwFno2KpfGyhWes3qj68g9bQIvHSNbCgaLuaNinGQ/luNzLazS+t0qaVXAsP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865697; c=relaxed/simple;
	bh=xdtLk3dDtunMm0rlgxzVmxPE5FWLT6DAQ2rvMMAwY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m59NrxNBdWjYvWRcXHw3pLTY0KSes2JhBwnQqIlePlJIGNhLqT+0ykkNCxQZTPASMdLfUrJnD8kstqAZ9tAKieEsZE53Y/LiZsR0YC22BPukjFmSFhxcwV+Fnm6i41oPrhakcXxhzBL27qHaDAGszjVlE4TX7l/Lt8k/R1r6ezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQirWanT; arc=none smtp.client-ip=74.125.228.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQirWanT"
Received: by mail-ej2-f30.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so1040020666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865690; x=1791470490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GLkmS6P/05hnOdDp0Ez1dkg/qbTAZZjwunW0NtpHx9k=;
        b=rQirWanTvG+oPUQga0T2csowynWxPbAgdcP7MNuHr0UFa1w388l+2mxBwymPbkgaGc
         d6MONIFdn9guGTRSSWc/bmL1BmmeuiqZBfHO+rRoUGOEXkChI/baNBVWSAoiCw7FjHH2
         mfF28+BIpyF5/VyOblnDkKjJ14sU49nIagJtVh3GKecuHxD4+swsMXYm/bmfE6qBcbFx
         1zYO6rYDAk3V03PatiMRd1f9MgxLQDx8bKIJNzd2KII0LwGpz3zvdsVMZu9uehC3Bqp7
         Yi/TboRWYY2FIZNO9UI3S42X3fYdy2iU/w7JCgNbtAq6Korm9FbpqiPQoGr5qT3/3HnP
         nPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865690; x=1791470490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLkmS6P/05hnOdDp0Ez1dkg/qbTAZZjwunW0NtpHx9k=;
        b=XPuUnId4ZEYthb+3tS+HhQk20SoBrNfdyUKXRFTele7yQMpieHp7hLw7tNSOKvFNbs
         jtKQR/BpSvgfy3VV0mx9mZG8sCtgwQABca4gtJA5GJ12cAQWDyDP8VAOrEdEksk3zdwC
         1GzvTQd/oL+yEORtNRtlnhcLLMJ7kwtuVUeqIHEu44tDYab66jn6mTyQodRy6JcqQ7MP
         mJypV+GfREhG30ulyoxBArfsmkx5idPIBWlZncT1aM8f2Q0+sYcTT/ysLZUv5w3OZwxL
         0rwruQ4omT9c0JNzxGyCv/2Iz1R75W8TJe2+FRZxrhBkk9Hys2JYQ1ztrYYkbMslFpvq
         9GfQ==
X-Forwarded-Encrypted: i=1; AKwUvBywqaflJNp3iNoiC+Yy2KwarphS7Hk6oSY2qiKia3RmYcynai0bIgrghGe1q1F3tI17fvncMNL/oX9x95E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKNLx7Hj4KKOpro+UTeEF35NXavxfWaJVif/jSzTSm3FAC+THV
	keVTzFm0JUZiKW/iZnaBmXWinWQKo46AFoIXgwF1QBmKBthNXFtqQ50r
X-Gm-Gg: AYBFou1ijaop7WShp7vr7+eXHeE75tfFfm7Qb7zkUVxxEZ1WINoS/xE8qnG3Beva//t
	Z4wBz0S8pWzwieAW3CJHpTEwB4rJKOm7VQcsA96nO/5yZBryuWSWzoOoR8D9962oQAxVWtzrUSX
	qAUKWi85f0RLYVBtDhf6KzvZKBKa50/kk+Wo7ZzCTfEhk6JGzAOItxQLlwpoOhqgVUILennpVph
	V7adafZnhFjkOSQlhF6yQinsS4ALFCYGpZBW0/nbP3IAGlnilRT+scDQqltoex92rgHscSKgy4C
	svRIbtN6MtkVIW23JGIX0B6u1h7kW/PgKslHqxNQysmrcuka/jGDjk2IwF4XHTOJhooTa61mOHU
	PHQRDNwH5oPn26ERFBLhIKMY1QVP+9X8kTcHgZg0X+8ev7Z87JstTLZgWjoRCwcTROLUVhcbbHi
	bkiULnGLpgw2lqbzIAzt/LyZDElbCyHoINHtJXIMrLDLjqPnXSIUqGRy+0GQD42asDoFk=
X-Received: by 2002:a17:906:dc8c:b0:c29:f5d8:9c7b with SMTP id a640c23a62f3a-c2e23d28f30mr404197366b.42.1790865689919;
        Thu, 01 Oct 2026 07:41:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc70a2sm173052766b.64.2026.10.01.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:41:29 -0700 (PDT)
Date: Thu, 1 Oct 2026 17:41:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: return bool from
 check_pending_xmitbuf
Message-ID: <ar5xFfULgNEwWeQM@stanley.mountain>
References: <20261001140640.107536-1-matheus.aalmeida@inf.ufrgs.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001140640.107536-1-matheus.aalmeida@inf.ufrgs.br>

On Thu, Oct 01, 2026 at 11:06:40AM -0300, Matheus Alves de Almeida wrote:
> check_pending_xmitbuf() returns only true or false. Use bool as its
> return type to accurately describe the function's behavior and
> propagate the return type through one of the call chains.
> 
> Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
> ---
> v2: Add missing "staging: " prefix to commit message.
> v3: Change one of the call chains to also return bool.
> v4:
>     - rtw_transmit_thread(): rename err -> xmit_status and remove
>       unnescessary initialization.
>     - check_pending_xmitbuf(): rename ret -> xmitbuf_pending and remove
>       unnescessary if statement.
>     - rtl8723bs_xmit_buf_handler(): remove queue_pending and directly
>       check the value returned by check_pending_xmitbuf() instead.
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c        | 16 +++++++---------
>  drivers/staging/rtl8723bs/hal/hal_intf.c         |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c   |  8 +++-----
>  drivers/staging/rtl8723bs/include/hal_intf.h     |  2 +-
>  .../staging/rtl8723bs/include/rtl8723b_xmit.h    |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_xmit.h     |  2 +-
>  6 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 57b3690bc48af..513a4934ab599 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -2463,37 +2463,35 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
>  	return pxmitbuf;
>  }
>  
> -signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
> +bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv)

Ideally boolean functions would have a name that indicates what
the return means.  For example, if (has_pending()) is clear.
if (check_pending()) is less clear.

regards,
dan carpenter

