Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87781A6816
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292749; cv=pass; b=neX3zLWEW048RbdsjPPfz6Dsz640un4yh982dnXN/rV5HfpxShUiOakffDRPrmYTac4Z9tXPZHLMQwUfv7g1BjXO8WKScHMEFUaiihE5IGE6WUPuFbYoJQvuqGItXF4sG3/OJrc6E/qPJ+vRZbpmhTCWxUzd4dD3vLlb2NdBGw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292749; c=relaxed/simple;
	bh=St6W6hDnL+quEVCQWlY6BjLk2qoCPo9Xwae5VZ5pIg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbyOxhY3IslbnC0zFhMvWuA7KdNwSFmGWE5C3ae9BNFaQPst9RZJPmv15S9+AABePmgxhcVoZaIoC8eU77Rd4w/3bXXjnWZg9Do2hqgiWRjYlQBzE+la//T9+dsDHSPOZNSQVYJJOMYFmLZq0a7Uz22QYfAopE+cdGLqkilt6qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZy3dquN; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZy3dquN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c299e81e0e4so49966966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789292746; cv=none;
        d=google.com; s=arc-20260327;
        b=qOAq1iKGoINfCYhHetmNswZuvr70ty8dKOpx7HWXKyT2T3vtlrAv+9j+s/VVrFym15
         4VjZmSJd77RyS9w0Q5YO8LBb5jpsZehVOl5V0H0TvMJEoaDZmXh8Bc+tq9lN58O9ommq
         fDDO3mJMoeog8RXr7r5isiieeSmUYsqER4aBmQfX2YxHmH55JyzLED6p1jXwaCaXgb8A
         GwiV6uN5h0QvnrTgbOQqThrsjMOfOC4ZfjjkouuHu6zyDFrzpW/7JLn5gVBwtIt/PlwO
         7TZhf+6tBgP+X9tXuRLTNPBGLShTfHwmkL1xGim8pfuNieL6JzqQR5uZ3jBg70BHtvkp
         tRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4GSFK0IBNPKD/n/w/B3EdbmLmtX6QuH+6lVrbbUZq5A=;
        fh=nRc1mMBXJI2cwwANRUWLBAi9d0zPSkXf8zM7TfmEboU=;
        b=Qo5jfgGjOxKfziSKuvLBxpUC3j1mSh/LNgf4jJt1F4Hr26xh4B2CZL4IXdzkd7yKDd
         76+hwXKJKwgLGHVsRElH/0jLVeO6cx/lzmPTnc18jipyCpfLshqAnGM4Vp2qhdxicGqk
         aODXswPpTjZjFP/rZTMCzqSa2bGl3Ma+z/hosos7lhgEaANqpo+zVAFyEDEWqnrhDW+S
         YX6ZJPa/Q5izGyRdywFPxKOz58pRDdU/ytD4fQTIPuSaeYh8r5Eh+C/PmsMB9/KOLPLT
         rNz/PNjnR182Q7rCkwe+DYLcVl5FyiJHC4KczjVqTPRpwha9ZQf7EZMoQ5SZxfAS5b3l
         vNyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789292746; x=1789897546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GSFK0IBNPKD/n/w/B3EdbmLmtX6QuH+6lVrbbUZq5A=;
        b=iZy3dquNJAjoMgwIl90UDpIezY3BLSZyc2K/HsAfc+n4oqXi0sufr+raY4f4lCZlj2
         EEgiCWXbD8FrIzxhUufDLJVM63U2Kcx8mmSgg1hg3fn6VZ1zZiQ5S7MVYmcWvU5CIZej
         i13PSoBxzuZJRWLEWD4svym5W6ZaeyXwyx+4qhk+fFHrwyJ77cG+LogJa54xGTfp+k3Y
         duLTSihXgdalsCgcWLEiIH62IjuzQ3R23bQ0BK5K3gi9lqHHoJD4MVNOoxAOqhSfZ4ys
         Px9Bio1gxzCHPoHy49U7h558uKtw4TQI+KAdyV2VYqozK5trmsJt57OYmd0rcQYNmDaT
         JHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789292746; x=1789897546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GSFK0IBNPKD/n/w/B3EdbmLmtX6QuH+6lVrbbUZq5A=;
        b=TfgkJGNAQ+lrHU9u33WmvepfoeC9SGllHAOmhhf60e1N/yO8VPWMrkL7BEp+L+0kuD
         4d/0c7BK98TjYhF4yWaUF/He+eV4QdY263zJKqStCHLt/9uqNB9iDl3qcCz5p9WrmmBG
         snV4fxNQ4VvRLz1j3LUsoApvIqOq62pugZCmSCIW3+pjZDMCOMyO7I4R2xyBaKZXUYPL
         d0YtpKnC0D/wz9hxr0zeMSNPy6oWqw7xhhZWcu+epTaB0mmNNu5G48YTFEwzmw1m8uLB
         71nVNOc5rjAk98AURMo4PAqz8KjqelF6rjyosTcl7OcgnaSdXYQ3B4Ta6qAUtKCqh3LB
         fBuQ==
X-Forwarded-Encrypted: i=1; AKwUvByNTrzUibkA3FmrGItI5waO+My42ELI5OMNxQEY1rfL2CADtz+um3l133aVCjdshv3ko9x3nQTLlXSJeko=@vger.kernel.org
X-Gm-Message-State: AFuF++kzeV5rseW7j+3/91z1zN1OCrdYnI5r8QQYt9JjwV5xqPjOdwxq
	cUkZms6MgI1DWPFbqTchwAOeNvOnLwP86lWNizdp1c2F7L54ZpUPw3ozADuI6CbqW4qWGy7kwF5
	RWw1wNrim/3YYUiReGJ35shrS/O5djl4=
X-Gm-Gg: AYBFou3oTK8VbGAirqUeYDBFQZYl5JtGJIph36TBkZ4LTqO69X8hJOdhmyK5WwOXqjh
	+ZdZwEkTn4Tm7zhb9B3ix2kY+9BxeEVpt4o3cv4b2Mvq2xXD5yDViJQPH4sdTrCFl31npyHRKV+
	nLHWJ82YHBtOsv6dr8zpqJbnZcnA39h83Vnrm4sworqv7kznwNiWaC+JjiwuSQGIqS9BeNlg2lT
	gO+64UXpdKCEcqlIV7h8HTKglwiR5xia9v1Es/Z+ZyQe/pil3bVQ3/RmygyEQbW6tNhsHVX+HGY
	pHYVWA0EuXCyeRHPpP8d9CJQKt+M6sOouZzda5J//HQQGFlLA/CtC6cegle94STtQYkl/JtGDCk
	7mo5ovQVhDLqm2Ss8ZGaMMyD7tR2u7rpz8o62Pfec
X-Received: by 2002:a17:907:724b:b0:c26:19de:9126 with SMTP id
 a640c23a62f3a-c29666bc600mr654836366b.25.1789292745708; Sun, 13 Sep 2026
 02:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com> <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 13 Sep 2026 11:45:34 +0200
X-Gm-Features: AcwNN1UDXelwUT5y0X3b0OlpBwZ_KqKPnFEdccs_qg7KSWeFBiSwlRza_aFNtcQ
Message-ID: <CA+=Fv5SfPzqPx8-YqOatq7YNJ_s=z-9LaCg7EJbsgViB54bXLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] xz: add arch-specific tuning for alpha
To: Matt Turner <mattst88@gmail.com>
Cc: Lasse Collin <lasse.collin@tukaani.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 12, 2026 at 9:55=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Alpha has fixed-length, 4-byte-aligned instructions and no XZ BCJ
> filter, so it wants the same LZMA2 settings as the other 4-byte-aligned
> targets. Without an entry it hits the default case, which warns
>
>   scripts/xz_wrap.sh: Arch-specific tuning is missing for 'alpha'
>
> and conservatively assumes 2-byte alignment. Alpha gains HAVE_KERNEL_XZ
> later in this series; the correct alignment also shrinks a UP1500
> kernel's XZ image from 6469320 to 6448840 bytes.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  scripts/xz_wrap.sh | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
> index f19369687030..5af0d9045cbc 100755
> --- a/scripts/xz_wrap.sh
> +++ b/scripts/xz_wrap.sh
> @@ -10,6 +10,7 @@
>  # XZ-compressed kernel isn't currently supported on every listed arch.
>  #
>  #   Arch        Align   Notes
> +#   alpha         4
>  #   arm          2/4    ARM and ARM-Thumb2
>  #   arm64         4
>  #   csky          2
> @@ -44,6 +45,10 @@ BCJ=3D
>  # Set the BCJ filter if one is available.
>  # It must match the #ifdef usage in lib/decompress_unxz.c.
>  case $SRCARCH in
> +       alpha)
> +               ALIGN=3D4
> +               ;;
> +
>         arm)
>                 if is_enabled CONFIG_THUMB2_KERNEL; then
>                         ALIGN=3D2
>
> --
> 2.54.0
>

I built the complete series with CONFIG_KERNEL_XZ=3Dy  and successfully
boot-tested the resulting XZ self-extracting kernel on an UP2000+ through
SRM and aboot.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
