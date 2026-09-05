Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6A1320CD1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620587; cv=none; b=psduQ3PV0wuMLR1Hn+ja2M+JFdGpm0zdhV9opesqwW8mAnp80qzqsMO8t510mNN644Jpr00DlnTMO9CnhAaqxjFy6WTzc7uvkh6mesuHYnXO+LarYo0VtIe+4tOhizZCHryJeDmIeC7TLv+5qPIPYgxSbe8hgjucoY69ghRapGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620587; c=relaxed/simple;
	bh=ix2jsdPytUfBxhlQ03yeIyNNme19gAi4Ev5xrjI063E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GToLIYvMvQXMm2U1Fkkdh6QSygis/uU9hd3kDjbKDCiselqVEqT1LJRbNgCqlPmB0i1/m/FaniWYjHljASNTYSmCVg8hHMcuVX8h03qcIH7Y0WODkjlBmOT6jnB+vwFDcjiPQoyGPbqdx2VH6ltSvfIdLTclq4KUapff+frub54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTmqwLmG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTmqwLmG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so25677885e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788620584; x=1789225384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLvnLjmDLrGiiA1v07CX3ZMiXBmMM+gMXxqBKqBcsk8=;
        b=dTmqwLmG6SDBT/Qo/E4VK8ssxokWZDyc0KPeY1JMyaJzzex1dxHLByCYPYFCQGhhES
         iPrDDUxeffsFLJ/xc1wSNLYff4LpwbbrluVY17Jsb5j4SCIh5spq5Rt3lW3Ae3XYqUzT
         KlrcxbK5asOSfnv3bRSUeAF4jkGbZ7+BnJKSo661ZfW9EtpDBVIv0CKon9JPxV6IP/bo
         KhwU/fTupnbOjK5/4FPNOypjulfB8HicubC2fv1cyhqbHrGNBi8HaPISLReJpPIc74RV
         WouTVjpx1mz06SKtmY7LQS96WsKXkJUL6OEDp10DEaVgUqCsACSH83SPpxY9toRDpUN9
         xGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788620584; x=1789225384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MLvnLjmDLrGiiA1v07CX3ZMiXBmMM+gMXxqBKqBcsk8=;
        b=hHWBF9PlBkwBGdP+gC9p8Db3UyrGFNyIB+570YSARO7N0SdrWhD0NFjmuPfIOxT/fF
         w6mGlfWNqL3dwtBqMGuHMv+8pmg6mSKdDrlcvyWrV3rLaEJ2ajSykYlzwYBzUUlO0eHf
         7qg7XJZxCfhq+NJaXesgEmyONdN2YS/7AgRzugKokBngojxY+AuaEk7kXlnaFZrNHC2B
         6VW3djtbYQubOughpEmWKn6k5MRQyJFwz+ybSVtSHjfREJVZE4OCQ1clt6lCpd1jshrm
         empg3/ZMdK/kq0sTBKutan19qx7YN19oocfxyfZ94QkVVT3dKsQJu2MKTL9Hd9+hUauJ
         Brtg==
X-Forwarded-Encrypted: i=1; AKwUvByuXNdxPijNTMyfaSzXBsDoGk2sU3xLwd8BngoEhHH6qwiIa9YsQQpECiuSvQ7uaB4atTE+/7ogoBRqtNA=@vger.kernel.org
X-Gm-Message-State: AFuF++lfv53DYhdU7WENvepAn/QorKloiXGPjYxetB+0KksIIzElU0i3
	yyte6zGR5hXmr5vlPIqIeoNAmNxWgXo/ENCZ+q32xQtovryAHa8AhJuq
X-Gm-Gg: AYBFou2Rj45/lEtJdtcAMMI4/jyQjQHZ8QUPkassdWFHXix/S+9Krt1RP3JpUclzohu
	aNsUEEeksN5DWxLrmqVAp+lYahWDxrevfs7blQ4kjsi1GRSK+g5AdwBhyqKLIu9b0f+0+ktNzrE
	AaLVEYJBz9p4JQ+n/3wEKDut3EAZ63T2lTwwMH2LKgBTIHY1BtEs/4cA+Mxepr/CauWZllHGZow
	HUvAwmOTdrw3vq8sIMn1MIDGZMBMpAE3xyNAeBHaj7QRPWudEqTn6f6oE54Fc4zW3DRr3JlZWBm
	SNSTMGQqTTR7luALbuYWIh2pgOv2jRlWJdFPKzzRbVW3IH7+xFOuQ7a1AbjhhBEaF2JKImhujf7
	eKZKOGFnEbfhDKsW4EZC7mzW7p+xs6iV/iF31wu8C2HnhmISwEVy0m0mp2T+RG2ApmuRAm2dyZT
	a64/OtbpBOyJnCPJsYKAkFKnhDSfAJudQnOUPXRR52zNV/b2kM1/zse205pNfPl0j2mbYRAglP3
	TZA5ovHHuYXFlr8S0UsR/OWGo0qt5AJ6Z58neDjhnb80d87wOrzD2u7CQ==
X-Received: by 2002:a05:600c:3e19:b0:49c:fa21:e747 with SMTP id 5b1f17b1804b1-49cfa21e977mr101661385e9.29.1788620583491;
        Sat, 05 Sep 2026 08:03:03 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm337818035e9.15.2026.09.05.08.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 08:03:02 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <54814f0e-d36e-428f-9255-3c7c2c09b39a@gmail.com>
Date: Sat, 5 Sep 2026 16:03:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kconfig: fix shell function syntax in caveats
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905124045.42713-1-hexvalid@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260905124045.42713-1-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Erkan,

Thanks for the patch!

On 9/5/26 13:40, Erkan Erdem wrote:
> Kconfig separates a function name from its arguments with a comma, but
> the caveats section uses Make-style whitespace in its shell calls.
> These expressions expand as undefined variables rather than invoking
> the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> example fails to parse.
> 
> Add the missing commas to the shell calls in this section. Keep the
> Make examples unchanged.
> 
> Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> The issue was found and this patch and changelog were prepared with an AI
> coding assistant after a request to find a small, verifiable Linux fix.
> The assistant also prepared and ran the verification described below.
> 
> Validation:
> - Built the current Kconfig conf tool on macOS with Clang, Bison and Flex,
>   using -Wall -Wmissing-prototypes -Wstrict-prototypes -Werror.
> - Extracted the documented working CC_HAS_ENDIAN_FLAG example into a
>   minimal Kconfig, with a test gcc-check-flag helper returning y for either
>   endian flag. Before: syntax errors and no helper invocations for either
>   CPU endianness. After: both probes execute and CC_HAS_ENDIAN_FLAG=y.
> - Built the changed page alone with Sphinx, treating warnings as errors.
>   The complete kernel documentation set and kernel were not built.
> 
>  Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
> index 6163467f..e15af278 100644
> --- a/Documentation/kbuild/kconfig-macro-language.rst
> +++ b/Documentation/kbuild/kconfig-macro-language.rst
> @@ -225,7 +225,7 @@ not work::
>              $(MY_TYPE) "foo"
>              default y
>  
> -Obviously from the design, $(shell command) is expanded in the textual
> +Obviously from the design, $(shell,command) is expanded in the textual
>  substitution phase. You cannot pass symbols to the 'shell' function.
>  
>  The following does not work as expected::
> @@ -236,12 +236,12 @@ The following does not work as expected::
>              default "-mlittle-endian" if CPU_LITTLE_ENDIAN
>  
>      config CC_HAS_ENDIAN_FLAG
> -            def_bool $(shell $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
> +            def_bool $(shell, $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)

Here, the space after the comma is actually included in the argument.

Checking the tree, I found 20 instances of this, but none of them use
whitespace after the comma. It may be harmless in most (all?) cases, but
we probably want to exclude it when documenting ideal usage, anyway.

I think you got it right in your earlier '$(shell,command)' example.
>  
>  Instead, you can do like follows so that any function call is statically
>  expanded::
>  
>      config CC_HAS_ENDIAN_FLAG
>              bool
> -            default $(shell $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
> -            default $(shell $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
> +            default $(shell, $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
> +            default $(shell, $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
> 
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c

Same thing here.

- Julian Braha

