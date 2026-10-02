Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25DD31E822
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951720; cv=none; b=JU5PxjE8zJsQriw+Xe7ILh6QfMRZcp3vbKW8c91TNL+fcEFfFtJUy4Tmkvo+AZwHBbofhrL++i4I+uoltXyz5H6+iK4OC8XrCqPsDVUjZBShr8sSooYae85jhdMtfKDxDYdxvi+vVg9mZ4M0qvhVpG9vJTYihe2JKhzTPlnEcxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951720; c=relaxed/simple;
	bh=ZwGLWWfDdxgwX/2ZPPWeSdutuSgdXs4v4RxoOF1j5Sk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g1ujUB3MTXJfJWC3xwbe1uRUBI9919sTS70vuvjUpux5AO7TOJv2VqEzvG473iGsapohMkkYQdMo7WDaoJKvHDOnaofrqZAsJEj5j+EKlCKf9K4EFb4HS3qJn+qyVlEqBQEpyODeJB+Q8YmIGo6Fs20mo70TozQXlb11Ozn0axE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JUOsGg+4; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JUOsGg+4"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-919552173fbso1072176d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790951718; x=1791556518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUZHvQcoBIkffpV8PIGZ0uLl5ElpxWThYhs1r3yrdKY=;
        b=JUOsGg+467wxKi8rXk26GbsOu+5vI/gYcrbPkH2bW1GFmN5ILE4R6fm0qSWz/M+z/2
         cbX34IkIFs2aD7fyA9F0dlvCfi9B5KXaR2Zm5aMrc9RvEJWlZQpIUImgrNHa8UMO6IY7
         TAMrRK6mXgl4Myu305XbojahpRb0HYoIaLE+mzitZKEfyiIsKiw13cQaJN/jXx4R+3U8
         kuHjc5wQQRpfLB8/IlzMeqMjdPQDROhPTy6JdipCs4WCDAjbtAdZA0uCAeL2JnW/MzJT
         bY68HfCbtNT5fdriwnRRc7AYDdG2n+Yf9vZeTdD6a6b+DH6j2e+Gp/lbg8uNXgkh2zvi
         ewpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951718; x=1791556518;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUZHvQcoBIkffpV8PIGZ0uLl5ElpxWThYhs1r3yrdKY=;
        b=egUhl47GFeuyVVpIhc+SNbxnSR3/SQxWqXQaxf4TQeD+0ZpCYI79mhNbsmJgKEaN6b
         pMQ4DsDOfZjZjJw9lzydg+IGv5uhQPXPkp/UBihopiIuEo3ENe85tiKl9OMC34qMvbaI
         7CdqW5Mxwe8U2w10I+rmvdkYo/io1YhdwK/2pXIJUkPnLkxO4YZ0v50mwue+hlcy0jqe
         DC/9F+q0kpYANf8APM2GnFSRrYUE3ACZCKbVS/lUDYmq7PH0XVfael4h9AxXaWdCjXog
         p/JtEvLa4a6wafgMF+iwkrQxRMEBdsfRi+vaRt1KVGD4dwPCPCf5uNOtDZ82Yn7Z25bj
         egOg==
X-Forwarded-Encrypted: i=1; AKwUvBy9G3j4QZxjAt4qFeuvOVydYr2ilOn7w07KokD/zER/wXQ557dvge6mkmITXyB+vDyb0IaVEm+gw5pmCAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mQpZa3fV+OGsA0jLZfPQiSgTh1kkoUl358wGN0l2rOByg4VTfj
	cN+VDulwQbOIXlm7R4DW1eJ7lu/y0/F51a6rgf2kciZuI5cEuHNulOqNLLLhZOCxUpn0YUudkXZ
	+BH9SJIA=
X-Gm-Gg: AYBFou2Yxay5LzHfRiKkImBrQQacpt1w/hb8OXW2Bkzh73JkLVnSZZwcxMlNPbN5uOq
	XFiCMiTtfTetYUqN1F4FhOZhDmd/yn+b7tveoEXOZ2QtRMlSKlYBpLYqUYa0etGkVsIP6sbYFP2
	AXfsXAymeI4aCKZk+RZiQHMR1hQ1D9+8GQnzOnTl63c6BK/b5ViJUqlrfEa7E3d9Ve9AHv4y4gH
	Xl+tJMIn4TvNfsamL5N81fI5mcVVhqUCJ2jMHYT/zyfM7RmIJJKLmwq5a5i9dhtoqu2UIUzYb5V
	HOIBUeBxwC3dq76IsVsj4NEv1d5uL+MErjMSeL3/AplQrxjKBrYJiLp5kwXIPMR+8fhIHV4jVFy
	yMXz8mhIdsG46NXYA5sktfog7c5p1Yg5Rjp5Gh12EaEEOrTmM25h1GoPbv+1X2+XaxNwQ0exb7n
	A85tzWVUTMddzBA2e0C1q1eAjihLzK6KHwyrLXe7t8huW08gvacO0B7pkLKeJs9B8+Sg0Gmn4=
X-Received: by 2002:a05:6214:240f:b0:917:b048:8611 with SMTP id 6a1803df08f44-917c007daddmr58434466d6.20.1790951716928;
        Fri, 02 Oct 2026 07:35:16 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917d593a20asm21495386d6.2.2026.10.02.07.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:35:16 -0700 (PDT)
Message-ID: <6f1e101e-9c15-4166-8ec2-346e587d6b33@riscstar.com>
Date: Fri, 2 Oct 2026 09:35:15 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: Kconfig: tc9564: fix and simplify dependencies
From: Alex Elder <elder@riscstar.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, bhelgaas@google.com, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20261002140738.393453-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261002140738.393453-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 9:07 AM, Alex Elder wrote:
> The TC9564_PCI config option selects PCI_DYNAMIC_OF_NODES.  But that
> depends on OF_IRQ, and TC9564_PCI does not satisfy that dependency.
> Simply adding "depends on OF_IRQ" results in a recursive Kconfig
> dependency, so we need to satisfy it in a different way.
OK this still isn't right.  I'm testing with a SPARC build
and it's got a circular dependency again.  Please DO NOT
TAKE this version of the patch.  I will send v3, which
will address the original dependency issues AND will
complete a sparc-defconfig and sparc64-defconfig build
successfully.

					-Alex

> On the other hand, PCI_DYNAMIC_OF_NODES is a user-visible option and
> should not be selected.  So switch to depending on that rather than
> selecting it.
> 
> PCI_DYNAMIC_OF_NODES already depends on OF_IRQ, so we no longer need
> to depend on it directly.  OF_IRQ is only exposed as an option if OF
> is enabled, so OF_IRQ enabled implies OF is enabled.
> 
> Finally, PCI_DYNAMIC_OF_NODES is only exposed as an option if PCI is
> enabled, so we can omit the dependency on PCI.
> 
> Therefore, depending on (rather than selecting) PCI_DYNAMIC_OF_NODES
> satisfies the dependency on OF_IRQ, as well as on OF and PCI.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610020124.ieOiopjQ-lkp@intel.com/
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 1304b0c47ef81 ("misc: tc9564: introduce base PCI driver")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>   drivers/misc/Kconfig | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 9c5b1e9d672e8..6ae10ef8b3cc4 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -570,9 +570,7 @@ config MCHP_LAN966X_PCI
>   
>   config TC9564_PCI
>   	tristate "Toshiba TC9564 PCI function support"
> -	depends on OF
> -	depends on PCI
> -	select PCI_DYNAMIC_OF_NODES
> +	depends on PCI_DYNAMIC_OF_NODES
>   	select PCI_QUIRKS
>   	default m
>   	help
> 
> base-commit: 04434a1d0f311d76b1f15fa987918b471a0b8c6a

