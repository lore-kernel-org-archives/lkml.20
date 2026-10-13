Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEBF480DE8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910758; cv=none; b=G85po0uG6M0adjHbyqWBTDK/XqQlxKVP7i8zpckQZmK78WoOHI1U+a8bH4dYzRJ2zxwHmMhMdB00XBHK+nRbw2FMOUsfI4wwT8AgiMui05820uOBgFdVrE9ZPBFUcXhQIP9lIUw3q5ZFu9Hgp6CcVxhu0dabgYHEsZy7D9ObHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910758; c=relaxed/simple;
	bh=XwdMfr9FHu6qgYpTDGc2/SsEYhFTb7QX5BQUno/5z5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYVx1+gLiovAknZRcZPMAsvtoEiDiLVD5+ueom1HyXsr8+QNoR/cDiMgmglP38PRpCaRZvzf5IJyH/NPMbXTWf2i6oZU3wLufiJC/RwIsQup8TfBg2RirCIpV5JZa+a+62PKYyLgcq1iXRMNDhJYtNTDP0oYEnXLkzb5NEy3gMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=WVQ/B9R4; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="WVQ/B9R4"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab8d96d02aso24994117b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910754; x=1792515554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjPFoJ0mDKhZbg4j/RMY3/uLWUv+CViZqO8+0A6BckY=;
        b=WVQ/B9R4l18arz0ykyBxhulVwYtf5HGXglWOs8CrzOoCMbgGGSoQQExakmxIlcNu+d
         J/5mtqHXf6tfxitXGy5TLc+r7UhL8cuhBKrNpUV/ixVelSTZRboIli3bouosUJJktye5
         T+xyVkz//Wb11vvooWvsGurmaQEJsGn9MpiSUOHXbRTtUpCSLE1ZmHckNqUxsXbAZZ5x
         rDeul2HXZHUNxRYmW31w5N2h0bQBuaHjoie/7jP32XHknNVn2xmpM1mBrT2phrDXg++R
         AXy5SXr/1ORtFWqr4MkkobYg5MTEk14L4r93ZivxV7zUDXT27+z51pTPfNFoPy0yYTnA
         G37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910754; x=1792515554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjPFoJ0mDKhZbg4j/RMY3/uLWUv+CViZqO8+0A6BckY=;
        b=GPSNYiJkoQzkN/cRI2Carh9wcck+hdFbN8Yx25hGkJmjDv5JWRS3vcWPH1sCb7Rt4R
         Y1owQeL5m+KiZePUinNJOML+xKFJOuBnz6U/YMel0L81DbooUwnbEAlNmT4lzB8/lIKc
         F5eyZuHzNsv490Q2EOAV5CHwl824VH22xUrfLPFrwERVXJwAEWtGeySnRJDOxBcVvVTr
         NeYFjknVz9VG4h2A+PCNuvwInbRSQSpCAzvf4/cxxKhjtyjeUMjrJaQyZJX/JBuPUENk
         8TCqDgK7+AOhis7g5/mODUtxZ1dq6cbHMGuJYCMTnUnQMk4jeIprQZ7VpGLive/6phrt
         AUtg==
X-Forwarded-Encrypted: i=1; AKwUvBztIR6MXCZCpUwNhgB88dXsyAyz2+L/gqHskmagGYHzJQ67UyOeD2nQu97ZjhA/u1HKVV7Vd+gbmyC0Yfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKACAedm9CqoYNWeat9YGG71ySwCvy50xUe6JHzjcS+7Bc001kT
	ye5H9DBvU4Lt0NgFUyZ4TyitcUOIT7/Vic68t57xHagB6A2wTFT8oy/NnVb9LgV3oFomo7yQXM5
	1LIysO4DOKA==
X-Gm-Gg: AYBFou21itvcOb2jrOOWc+UxawESYZMZL26uTwEQqWiOWaftZe7/68hs+nnffrENxmT
	66gHmvcIVgUaZOX43+SwIIQGGk5c+CXf/RELW8qF6BQgcg//OBlqSVf2sVI+R62vWxURUw0RqBc
	IfkrNwn27XehrvhbG3cIyv0G7kQsYtyXP7T8GC2wN/eVklwA3ctlI+rUo5IrnQagDhLwrTDObL3
	tNTfWQbgoPvreC1Xnu93VFEkSqynGbeyRgq8pcXc2am0hVpQ2TDAt0j08GbctlFAkSu+0oLdS7x
	Ytd5EAJb4gOZS4AcP0FNAZEkKBgFlQVg3DNPFh9Fiot6eOFUeiJWujR6bdBOtx1s7+rA8R8ndII
	Fdcp28xiHeW97yxrAWaDORSbRdH/poc2RxkMZoqgsEEIEnZvH2VFJ4G2rJ/CjolUTBj2P8BH+P2
	hS/5hrH7iCtZlaTMq7SZrRrOspW40zgNUiUza6JpLh67ucEvzVvK5fOIMX19DwJv2NF9VSWeV2s
	06TmUkQwwJdaUoSQtyk
X-Received: by 2002:a05:690c:5310:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b07ee0118fmr31810657b3.58.1791910753585;
        Tue, 13 Oct 2026 09:59:13 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8a075sm49030607b3.5.2026.10.13.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:59:13 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:59:12 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
Message-ID: <as5jYIDw-VVi_tuT@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-2-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-2-samuel.holland@sifive.com>

On Wed, Oct 07, 2026 at 01:51:16AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This appears to be unused in practice, and
> creates confusion in the extension support returned by hwprobe(), as in
> this one special case an extension reported as present by hwprobe() is
> unusable.
> 
> Since we believe it is safe to always allow vector usage, start removing
> this functionality by dropping the Kconfig option. It is possible to get
> equivalent behavior by setting the sysctl at boot via the kernel command
> line, but that method will also soon be deprecated.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks!

> ---
> 
>  arch/riscv/Kconfig         | 11 -----------
>  arch/riscv/kernel/vector.c |  2 +-
>  2 files changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d6c2dbf8455ce..e26450f0d38fb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -650,17 +650,6 @@ config RISCV_ISA_V
>  
>  	  If you don't know what to do here, say Y.
>  
> -config RISCV_ISA_V_DEFAULT_ENABLE
> -	bool "Enable userspace Vector by default"
> -	depends on RISCV_ISA_V
> -	default y
> -	help
> -	  Say Y here if you want to enable Vector in userspace by default.
> -	  Otherwise, userspace has to make explicit prctl() call to enable
> -	  Vector, or enable it via the sysctl interface.
> -
> -	  If you don't know what to do here, say Y.
> -
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index b112166d51e9f..9641343732782 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -20,7 +20,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/bug.h>
>  
> -static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
> +static bool riscv_v_implicit_uacc = true;
>  static struct kmem_cache *riscv_v_user_cachep;
>  #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
>  static struct kmem_cache *riscv_v_kernel_cachep;
> -- 
> 2.52.0
> 
