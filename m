Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4E37F001
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475492; cv=none; b=qPziD7z3Gif9avptSKR6Akk69ALkOnJebG/XHYVri1foVxIEaoXWQNC8iqy6++l1WGPItR+0BgTpvfWOAzftmli6UcOuFOkvzKIFbilUcZ19MErNfXSD7fU6xS3QRUCZaPecmiaC96Hw9V0z43Yhdx1Ubt22fSqs9+RjM+7aAHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475492; c=relaxed/simple;
	bh=PZLapiFzm0NcKyZHGfePaz58sTxZ17Geu1LSk0IN3To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VK8frPCOFJjJbJ+Ok0uHbjIaPX4gszZscKAVXQlT3WRVhWyLeifLwLTbHwDhRdElc2EmhQ3G25SiVfu8YY7zW/4GPnP2aOTjYbaZtS9Q/hIF2bwaCpK4d8/11OqlhUHJXrOLG+BcnehZxSIca7Gk/GEVnToD7AmNLO5uiBjRpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gy31wmTA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy31wmTA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afe0081a6so1585191f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475489; x=1792080289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxSk4bR/3bxIlso1kRXhasH7VwB1p6Z/eeK3zml07R4=;
        b=gy31wmTAKMoGsQZ9G7Iy0VBmyQUKX5YFaal6o8LtNG0Y1FygRRvzyera/xpvGfVSbB
         4gljX58hppnRny6+0+uOI+vxK8BKoZHH8NZLONEFPKrbyrkKkfasSSbCO4RpHam+/tA7
         PO6X5B9oA58jErB77BEBrSdAT6EDejbXTaqxwghv1h3z/7YxFFwjswMeb3Td/u48h+p3
         c3+0TF8kBGFR4c6zRSM+IcwvCXVF2DfuwseH901QROS0cvhZhjV6DmRjVo0A1Io2Ug0+
         hj1iz8AFUpJemdUfo9Y3V/jThuD2WxM3SwHs/eE3u65AyMNvIxa2WFCV2xYCZ6eiwMtW
         iIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475489; x=1792080289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dxSk4bR/3bxIlso1kRXhasH7VwB1p6Z/eeK3zml07R4=;
        b=n7JWfxZ3obtW/sBZ2YlmnQxwZg94U0Cy8CZxKcGC8v1mCwbU+lMorkJlvbmNrSvTYh
         8Ye8g24aKNgKWPckH5L2DH48xKXun2DQGmS/v1lAbG6RaF0K4zFPZuJ1RWSq29gdK2w4
         /fV4uEO+e2BX1ApeTv4Ws6EIZf2MZTP6Rxl1QeTckoJ3akdHmLdMHhqKB8EFt6NS4Sph
         SZUFwZmsaLJf4C4qt6lCtsqgdI/uHu1WVJniM4eOeC9ctXLEKwpnOJ/ZjXeRux6SbrCi
         GUhyxpy7/iQ8t+ar2lZssStlE4823GbDHUtZ1JbHd7qcnvc+LWWFGNusSD8QaEDo1SV7
         dZ1g==
X-Forwarded-Encrypted: i=1; AKwUvBw2Zim7S42+m8REmZNwa2rBhchB/da96+MKsjksNSTbRcN5nXLWg1edmrY0JgDiJox8A4CG/RU1keLQrW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYDnBhB9t0opHA7c3rPH4LoTw1iS1lmYtAHUinxeksW9yIv6jW
	QHlRF6zX4bxGZVm8PW79zvJrXnYKQOI7kRopiO7S6/HVN3fCgHYI/h1K
X-Gm-Gg: AYBFou1t6/PzcnVDgeVPHEuemDheN9qeW+4fzNIGxFnEh0OJv8jAnuYRiketDVkI+NA
	4EH0hJYn36Mzy/5imH3m15BE9aeFDaDFa9fdNjlxKPxhrrr8jExWfjEwUOC5xRK+1jufoHuoiX+
	Y0lCZanFfeC8rlvoax36YATvB6m8kpssASM37CSloswyQAK6Mmpf++YB8hfn23RDH9GANP5pl5a
	6d67gRdaUlMThHYCinOGIdPLuIKWxHV3y80gzKhHLbkCYJ+QuLtlKvh3l3kxJM9RilUkbM9GtBy
	/CuDA2l4TJxLwubcuGe1ogrxTEY2LE+WCWDkZVyz8FIaXdRWnfa0shM8bKcDnhfqacwXeHbj3VM
	9Oh11gSUshk1c3qGR3IuD6mlAQddvpLieMLMQ73FJgCu//T0bOPpbJeeDTodGzcAniqLWUiLkh4
	L7KC9mM4drinlTnk6dy37dYft4JzktjcYKCC66kJ/b22BuVidB2DDZaOf4TRClttr3cPfhg2pXx
	bacpWoPGzZBJIRhiaiPXaaL8jCdAavlSuZk2sEOszL2hChtwo2UDx4LjrvW
X-Received: by 2002:a05:6000:4541:b0:487:799:c04a with SMTP id ffacd0b85a97d-48c726fafc4mr6925318f8f.3.1791475488786;
        Thu, 08 Oct 2026 09:04:48 -0700 (PDT)
Received: from [192.168.151.120] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db653d44bsm335441f8f.52.2026.10.08.09.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 09:04:48 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <080e1a54-f27b-49c2-a8c8-d680cbcef05e@gmail.com>
Date: Thu, 8 Oct 2026 17:04:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] kconfig: fix NULL pointer dereference for defaults
 taken from choice members
To: lzhan011 <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: rostedt@goodmis.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005104050.1786222-1-lzsx618@gmail.com>
 <20261005104050.1786222-2-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261005104050.1786222-2-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi anonymous,

It looks this is your first time contributing to the linux kernel.
Welcome!

First, make sure that you run ./scripts/get_maintainer.pl on your
patches. There should be a few more people to CC on these emails,
like me.

On 10/5/26 11:40, lzhan011 wrote:
> From: lzhan011 <zhangleizhen645@gmail.com>
> 
> Since commit f79dc03fe68c ("kconfig: refactor choice value calculation"),
> sym_calc_choice() marks the members of a choice SYMBOL_VALID but only
> sets their curr.tri; curr.val is left NULL. If a string, int or hex
> symbol takes its default from such a choice member, sym_calc_value() and
> sym_get_string_default() copy ds->curr.val, so the symbol ends up with a
> NULL string value. Depending on symbol order this crashes in conf_read()
> (strcmp), sym_get_string_default() (str[0]) or ends up writing
> CONFIG_X=(null).

Thanks for reporting this issue. But after careful consideration, I
think we'd like to resolve this issue a different way. In a v2 of this
series, you can simply drop this patch, and I will handle it.

> 
> Reproducer:
> 
>   choice
>           prompt "choice"
>   config C1
>           bool "c1"
>   config C2
>           bool "c2"
>   endchoice
> 
>   config FOO
>           bool
>           default C2
> 
>   config BAR
>           string
>           default C1
> 
>   $ touch .config
>   $ KCONFIG_CONFIG=.config scripts/kconfig/conf --olddefconfig Kconfig
>   Segmentation fault
> 
> Use sym_get_string_value() instead of reading curr.val directly. It
> handles all symbol types and returns "y"/"m"/"n" for tristate and bool
> symbols.
> 
> The resulting .config and savedefconfig output for defconfig,
> allyesconfig, allnoconfig, allmodconfig and randconfig on x86_64, arm64,
> riscv, powerpc, s390, arm and mips is unchanged.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: f79dc03fe68c ("kconfig: refactor choice value calculation")
> Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
> Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>

Please make sure to use your real name when signing off on your commits,
see also:
https://www.kernel.org/doc/html/latest/process/1.Intro.html

> ---
>  scripts/kconfig/symbol.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index dcb4b45e6..de88b13f5 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -546,7 +546,7 @@ void sym_calc_value(struct symbol *sym)
>  			if (ds) {
>  				sym->flags |= SYMBOL_WRITE;
>  				sym_calc_value(ds);
> -				newval.val = ds->curr.val;
> +				newval.val = (char *)sym_get_string_value(ds);
>  			}
>  		}
>  		break;
> @@ -887,7 +887,7 @@ const char *sym_get_string_default(struct symbol *sym)
>  			ds = prop_get_symbol(prop);
>  			if (ds != NULL) {
>  				sym_calc_value(ds);
> -				str = (const char *)ds->curr.val;
> +				str = sym_get_string_value(ds);
>  			}
>  		}
>  	}
> -- 2.34.1
> 

- Julian Braha
