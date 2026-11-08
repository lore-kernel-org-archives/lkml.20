Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151462;
	b=Y4hE39eHwXzhCH+Ron3t7GaB+3WufasaVyDgF3maqHrNF7mb9ELk5vgLqNV67WcWBYzc
	 KhdXKX60lVEWkMBdL8yspSyyThdPnrviLsuv0IvTu+3xM4WTg96tQrFPnjoTUyYLUdZnq
	 C2jVhQ1d1JUXICUzzNC4ASJ5otF5EhUNGgNpFJ3YJ2V3ckDPlojvX4J2v3FJJHycVADcN
	 SZkpYBkQxyw3iUp5W0qJ9YlqJ/LUTmS+vsGIgZoMfpKph1kVcCWzlJwRs2Dfbk+bAVbC1
	 coyo0bggafGrCYTP8XxJC7FQp/I2vZG9UBbSLSb5u3p7zV8HhcxXlAmBw/zdLvnc03g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DK+wvhFB9cC/ykY+2Qftzi8KfweL9NRM9vjrgu6Yo70=;
	b=4tCmTQDL6+4pxJjjQ4mhkKUc2rC9tQlFlQlhjPbC12JNGba8Ux1SoovovMHno7lzqIpi
	 UYQAP38QkiIhGLfC/SCPL1x/k0I69YCfTBgR0V3mG2XZk9ahqP++gktRQjbjyI6AYK9IL
	 +RxOba+7Kkepqo/WqO7uywuvpoNT7T5r+HLYS9x4DcPx7IoI5gjviy1OaVj67GdtGo5nD
	 qdQ+tX1SdnMsaTX4N3DUQ3+azPgfhESb4R5Xd3VGXhwAMOngh01yT5fEQWvQSEHR/Qp7q
	 YT0gvbZ/CvlLIXkuOBuJ66YB2UAgNxkXdBAQgRMR6XMwWnKoIOBsf9gobxl7vWdjKSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YRXwVKQv;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529C606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E529C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YRXwVKQv
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2ca055399so38907137.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151461; x=1794756261; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DK+wvhFB9cC/ykY+2Qftzi8KfweL9NRM9vjrgu6Yo70=;
        b=YRXwVKQvX7MBcDAxqrMcNis3RuOHLOW/Wke6qW7We2eitBKszCUrotRLBeyS/C/QHF
         sMyzSP749prW5oaZMkcJd5CQVoDRGtFdVj+sRVMK7xHOjaeavvTOTVeWTnbbGBjDLB/Q
         NiWPC5npIqRBExZEnCM3v3h6d538I94eiD0HnSKDMljyCH1uJi/V45uyKQ+iUZo9xE9l
         hlYhbI1EH0cN+r6Z/+lU5ahL9DZX3AGcYW6cx5I5Xj5lnHGgKG2FaeaZvgoB1NrSMIcJ
         8ckCeXVrmchS7hhY5HRGvj+ZMo6EO1Yk6JxShlTMvkg0A+TzCny/D5h6RksN0f6iH0ih
         rHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151461; x=1794756261;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DK+wvhFB9cC/ykY+2Qftzi8KfweL9NRM9vjrgu6Yo70=;
        b=Cy66in9PzXiu6tzAUwDhITdHqjaZwT5oAwnIsD53hjlPWhVbZufMu0GFuDYqItNNaO
         408+5EerJpo9IwoFbHhy3Ofz3ECFoCX/ddclTl84irigWgICRiThlzXySsaWmCK4jfSl
         mesIqV0PXjXBUL2nc3APNMkfYn5Xlyw580UFhZdpTKOvXd8daLI5GPoqo01Fr/LuPAlp
         hMbO62YssYHYVcdecxjdQPB1b9FsRJY1F0AZ/i9w+HESGf2dV6OceFJwoGw1so5r3yPG
         OVh9s/ZND7Svhd3eh75aTp1VwxOBMCGXIkmUvMLYSuf+553QAG3q4/zF9mWFWbZTnRp/
         4Qww==
X-Forwarded-Encrypted: i=1; AL+hErFuh7e7+eL4HwwywP4g4FuI4KVprYcaOwwmtaK1vvj0/Bbj11/pAdQapeyQbnXdIzfKOZkVWML0CK8yfN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9paWb6tYe3LVuoIhcyFlwRj5ra3TDYszqBQnukCdNw//gFSikE
	IZagQQfBrw4xuGpwYkf52t3ngEpR3c7v4CRDd/E6B3zMYqGlJhiLZ2ih73Z3sU7FLzs=
X-Gm-Gg: AYBFou3FMF4MZUSrz2T3BqprUq9Bvfcdxg9XeV6HLcEvR23SviNP9TWtQ74s9Be2SIX
	0rdzuYQDFlF60h6y4vga1wUJ4ZeHIYcYe1ccruXvHH6tcpG9Ti+sFwnK3Zqh/pqd5bSMgtiuM/8
	fG3o03mS7pNnusu4Fg4ioZYSIMuQJwj9GykL4OxHd23chaGSfQIbhbkrWP1xA1ZC9HWWa6AR9vJ
	59EIlrr35xcsC3EjnsZ3tBhNOz3E67p27hLrX8mmg62XzYpqAkLW2hCVZrloITohl/d5cSKfi6S
	MRpf36QfX7lyJXuNduG+/RLC+/E5d1XJO7rVWUuf2SXWVpZIJQ8krBmKW+xSS7skMcs7GRO7s+s
	iKkmipeNxjwWidlYD6PR/6SqzslXUm5ndq9JP+Sjw792EHvSuFAOk/MV8UiagOsVehpsvyOoK34
	5d3DIvoxHpui5AzjNlOJQgawRioJrrty1q7ekLT8HUO5TUGHxKmhxojt/CJhYTgEj65bWyC8f+K
	SG+A/vaD1bQEzjgPqEs2hmCCITFpaHDIH8gaoi5qe1B0iucKzHjVZTjFezxtJqTIHDvpshB3miq
	biWHabtRdUFhah2T9Ozjc3+JB03gI2cKM407XXL02y/QnH+pFBkfNE4Qmpacld2tqXcp6laSlUO
	+XkRk3yM+oC5z0wx8CzU5kZkSLdbAdTrs3Xw/vDwhdSYLLHXl
X-Received: by 2002:a05:6102:508d:b0:7d2:840b:b064 with SMTP id ada2fe7eead31-7d2daa8ec5fmr326255137.3.1794151460771;
        Sun, 08 Nov 2026 07:24:20 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/4] riscv: Add support for kexec handover (KHO)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-3-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-3-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145358.358073.165272378597657083.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=ohwRzPbI/pF5KX5v3Lzs009TPAWX3IxDBN4XddXH9Jk=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQhhVigFV4eOxTx4e3e80HlzS/OtAzSEvy/o
 QEXLdFCC06JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIQAKCRC7dyhM23N6
 3jcdD/4utq4C5K121vM+fg4odzwfN+cDjx2VRvt37vUTCJl2NKJyDEA/6O74csfV+flN3PepeIe
 Z9mn1ZjNry4hdEYrftWGGTccrmdMzbJnCBtpRCnMLoFjA8FpZY2ACeQIv+IcAkhMOa6wphuDtI1
 N5OfQGqjO0rGApz2R/3xqFSutMTKfiiAY1qtbSiSSWRpdN5YUGxyFL3rebfa/JcPZNB+3Dvc66h
 MtJEyUv0CUrr28lnHvtDe5jWmWnab1yHiiWNGZgBcgaZRMV6UsEGGALfV79zwuIqAqWd/aLq/jW
 VyhN38LrLXymGAb3N6edWgXBKb5Vw/QPsU4N38+QNx1C94ZluCI/raSClLXa64MjPgyj7Vi+yEg
 qQSbI1WFUVWejGUhZBssz9xgwkjx1/WRwaIMWs/jz4yK1Lg1k0fx8oG7nLhTux0NrlFIkMhuWfA
 kMEHUoBr+OtHc4mbRL6OhmThZxeMXfDd2UU7B7l0p6ulbzfREE7ZoA3uYPuju4iVcAQ9b+0hj9K
 34WZZ/zn4tj2f2btFZ0ruN8PS7KCaYmn3249Ay6LlsI0n1mbqyytmeXLPExkib6jwIEp0JSLPqC
 3//pyo5DhG88hIZrnh55hwcBJg8Px1HqmxDUqoVsH1MtHMJtKRyHcHy7231ekVpw6Rs6i7We2fG
 FUugHQuc8USPaZQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

Nit: please change subject either to:
Add support for Kexec HandOver

or 

Add support for KHO

No need to spell out right in the subject.

> The generic handover paths are already in place on RISC-V: the outgoing
> kernel publishes the handover FDT and the bootmem list in /chosen of the
> DTB built by of_kexec_alloc_and_setup_fdt(), and the incoming kernel
> picks both up while scanning that node. Only the architecture symbol is
> missing.
> 
> Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
> and KEXEC_HANDOVER selects CMA, which depends on MMU.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e7891a2a89da..a5c56252ff44 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1125,6 +1125,9 @@ config ARCH_SELECTS_KEXEC_FILE
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
>  	def_bool ARCH_SUPPORTS_KEXEC_FILE
>  
> +config ARCH_SUPPORTS_KEXEC_HANDOVER
> +	def_bool 64BIT && MMU
> +
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 

But pre-reqs. should be applied prior taking this series:

1. https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com
2. https://lore.kernel.org/all/20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org

-- 
Pasha

