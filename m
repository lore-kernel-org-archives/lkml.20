Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709B31AA1F4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184694; cv=none; b=V5dmx6GGfcaUZdQJfXDkzyrCYdjH3/Ze0d0Rt9rJyNM0+oTZPeOQZgtolYG/QSUrRDhLmOm7CanGiITpjNau8JGqS7PFHZCuiGFkAuTOkPcciwQdMAfKRk1CYfI2pvoHS7toT821uSlDqK0Uwd0d7W9jbm4lK2gXzC22cN1pKfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184694; c=relaxed/simple;
	bh=sB3MD4hlIt2iJZM8S6IKktOV0CInEyIBRYC9spGD0cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB+KeQXFWK+LkGQ7IUzP4X3rqx2654Z/uhpK/Bw0iWftklW6IqaWns2OghgVt7YpORiQVfZwqpN2yWZcDqJLjP2mhmH3t8AMHVdFX7s4ckq5ZXoLueN3EJ1ITcycq+MwAaEoOk+OD1sJUgk6+4KYufNu82enozVbUsFSajMjaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=a03vhMgR; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="a03vhMgR"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8871ada1a26so2682407b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792184691; x=1792789491; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPYtnw7XMhC+K825KZRyBEk7V8O/GHGxvexBoWflVF4=;
        b=a03vhMgRShvZPZpxJevXO7ddhF5ZmH8uzacW16hRLKuTOzFVxWBHWBJqya0r11BnyH
         Ih4/Wos4NWAe7EXADr3H37y06IuNxQUzZjYn66TWb6eHbBKWpyZWptgw04RCH7sthOkb
         1M3IvQtYW4CXHTHKym2WhvXoWlXN/w8IMurwXtRHG8Kar8dmRQ4kOikQ8T8Sud9ackvL
         CdDB7Aw9IUvss+cEKqHSRlYmiqGVZshWnlT9OcUm0VyI/Dk9Q6VcZSBwM21wGHQlS1If
         QOXMJuAY978MJ6F/ekJE8S72DtwYRv+r2BFP0PgstzSOwiT8zO+Ct6LlO6XJ11vHh6aD
         /2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184691; x=1792789491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zPYtnw7XMhC+K825KZRyBEk7V8O/GHGxvexBoWflVF4=;
        b=gZAk0/0VCVgL6RoyNiCFs9b8d3ucyDBx5aLdxy+aruEOvPepqNpzXYJXhDZ5gfh52F
         th2KjmKqSA+8ZhFFWnnNZCHYeaWTpH5UPdYUZUZkkwwJirtyjOIpbS9twbZBI9Fl6wP3
         s8CHf2anGFks+dD81yERjv5y+4/9Zs6rYhofrT+Lql0/xXtcSAkH5w6Fi/cmLAU90k7v
         8ZpGOkA3baTtz9Fu037fA1V023PyIBoGIJqlzH/qaocvCJX+6vv43ngQu/x761u67QY2
         DChffmf+zNRWWrffzmRJ5c41JBNws1cmI21UpNuYl8yRNct3bSyZUUGZqq681TiE1nkw
         XFww==
X-Forwarded-Encrypted: i=1; AKwUvByIg9rWSPQGCUUHAdUZTrljMXhFh1nn5Wu57cKx89oTWbR8/uvas9A6GiDwp5351FkjU8ZhZNO1lTKGPcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCYkhUIxytQcZyh4PQ3mNZMakULlUTPfVDyZZnLVd/jWbeIqpl
	Q7zoO8fkKHQJ0ZrLIVMRXm6sSGPMWyZqNxg03asrgnWtY5rxPDYc/EEWVRfBaRSK7PQ=
X-Gm-Gg: AYBFou36WQC5lTOE0Ol7tjqQrw74WRyNQsgJLgt5gQydU1ds+yi0prai1y1c5d8DIoh
	fwRH+EQ3SfDX+YT3NBg3IBvwnyOPlKmQt6BozqqclbVoIHXuj0TisDS8tL+SSUt1AJ3ZHkY+cDw
	O2RGr1Mpr2Cs2SyJ4bHbTBipas+wIwb/Yk/qnUR6JWNao1GhAou2sIH9WjylMEsEivl8iR1VGyL
	JgVlEWeB98WC/pftMFFG8DBbnBertoHqf0DdBiyZKtZqCK426bqXv8RCYiXoD8SdkDnZjF+VgGs
	CYLyLpFycp1p0a0ZJbh+Bpb+0474SqYwtkdVbqe9AI4CFWiD4XS0hhETYAtrrJ4tAy2PLjrsoFZ
	wjPLLcIApW0CLJR+u4bJGMJT37poX0CFCKfJ/8D/vp7uG9kr4cFFEGRQUl5JXL84cRoc40Dnvz0
	UOkanSRIVM9ySkSbuLBmtlCHoPBoezUfoZ2u+GmuKdG83L3N4DbNToxoUKtK7U0uBbotPbQtnha
	zzzSLwVLNO2F4k5Rvyo
X-Received: by 2002:a05:690c:39a:b0:8b0:a8ce:5794 with SMTP id 00721157ae682-8b0f216360emr4473887b3.26.1792184691414;
        Fri, 16 Oct 2026 14:04:51 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5889c39sm14125007b3.11.2026.10.16.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:04:50 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:04:50 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Message-ID: <atKRcrG4CxqgFZix@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 09:52:58AM +0200, Radim Krcmár wrote:
> User-mode use of Zcd, Zcf, Zfa, Zfbfmin, Zfh and Zfhmin requires
> non-Off sstatus.FS, which we set only when has_fpu() (CONFIG_FPU and D
> on all harts).  The vector floating-point extensions Zve32f, Zve64f,
> Zve64d, Zvfbfmin, Zvfbfwma, Zvfh and Zvfhmin require it as well, but
> hwprobe gates them only on has_vector().  hwprobe otherwise reports the
> extensions from the per-hart ISA bitmaps alone, so it can advertise
> extensions that are always disabled in user-mode.
> 
> Report correct environment to user-mode.
> 
> Fixes: 2e2cf5581fcc ("riscv: cpufeature: add validation for zfa, zfh and zfhmin")
> Fixes: de8f8282a969 ("riscv: hwprobe: add zve Vector subextensions into hwprobe interface")
> Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
> Signed-off-by: Radim Krcmár <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
>  arch/riscv/kernel/sys_hwprobe.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 7818e1d32622..b57ccd116bb1 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -146,15 +146,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		if (has_vector()) {
>  			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
> @@ -163,14 +156,26 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
> +
> +			if (has_fpu()) {
> +				EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
> +			}
>  		}
>  
> -		EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
> +		if (has_fpu()) {
> +			EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
> +		}
>  
>  		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
>  			EXT_KEY(isainfo->isa, SUPM, pair->value, missing);
> -- 
> 2.55.0
> 
