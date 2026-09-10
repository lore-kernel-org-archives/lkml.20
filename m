Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481C38A720
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068165; cv=none; b=MfiYt6ADJsEyu1vRW+/mcNMmjBexkT+ZkEMzl0eqxU1ePucDv2pN37q5AF1LxEASIV3DjcXGtASzC0wLFIeYBaCuzR2Pl3mvUny+V0jVp72irRxyYJzaBU/I9vMLLzEzQy5DQgR79g+unmk5UEKskuYkFYAtRrB5zcvx2L3UtHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068165; c=relaxed/simple;
	bh=PQ7ZF7tbCdfpJdm1QzKqAujOYElxa1wi4iIn5WHbJZM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Im2DHXkCV6Te9VOWGmvzJluoG6usfIIq1FEvY/OIY2+jV4QSm7uPGY+1qlaYWkhTcUYSSm0xZ6JZq/MqEQ329XVZsLyX1AaPf8gK/EADhk5f+5+DoLgIK6zUx+F7S1OreIJVKAfAi7bdAbzdnLXGJ1z9CLaWxQug7o3BclUt7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDpzPQX8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDpzPQX8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so112315f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068159; x=1789672959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STtSOXgwYAOvGJIuaHYNYi0eV6MrslGFexph89oXLmw=;
        b=hDpzPQX8t7KrWSTwafXDYXis4e5C/y+oKRIhW+8B5izsciQQ4uEnr8Y50NCGluVRk4
         GoAdO3p2RxcVU13EMWNGGmfMGUbluXfAQNmwp3gXFtJXTsne0sdpEjPUfpPSqWgddfyE
         DwQxJc8GBp68qvsB8eyUZ38fOBnIG6BYanHjqteCvIaSLqhyWzbVrkaDkRHfHrgPvr6b
         c+kvhQvbcC+xeDWXrXEfNmXf2kCSptnoNNnAB64ify64MuRgqqcjdfEKpkEmddH37tHz
         r1V/HRil1TH0l283RXn69KWn09r3MR6EiqFFhVXHr247D3MNrjsfkCtlTMya/rxsGU8z
         gGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068159; x=1789672959;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STtSOXgwYAOvGJIuaHYNYi0eV6MrslGFexph89oXLmw=;
        b=ovm5HM/qggBxh3ek3/W8HNGIvyD6iQgnFwDlhErsG0lfvqNDP9We7Mi2nK9PHvQEaF
         QcwY1+gMz1w8I8D8CYRYrOaOfEt1NXSgJoNmOiUdLJdjYBQi73FWu2nCa7UP8UdEddzg
         DWSeQEkMN6DhqYH9E6gz68fKWe6YcQHrelVQ8ZVuK7wKSDmEyUeo781uLKwcHRHQEaAU
         3XEBuXDksPtKpacIah+aQkL0dA9/by6xAybFzDf0+viElrApVsoj+tWEb5SvjHJHMkwP
         KaaWNj+uNTofbWSadvGkE4oYLIrZzCIxms7mQe5e/7H8lpUqfDkiOicymJRdS+R4o5dN
         96lw==
X-Gm-Message-State: AFuF++kEDpmsCbns6/v1qtFmYK+YL83ZSuyDeImEzjcxeg48tnHYmDtT
	GCrUVXOgZ/ISwBy+jn26jTx8O52yJgP62C91ohtwohkhDMdb1OrojCo7uppdZQ2b
X-Gm-Gg: AYBFou1EbUEoy23hkm3rkJTBonOFM5+Ke/LZl/BlUXpv1FHpB+BvE1mY21ugVswSarX
	lmPX2U+vavcefiBVgf4xGcWDHwIoWUHvo/nSXFkSvy2EGheNs/JL+P2dMyxOedsZ9vCBnaxZaD9
	YMyv+5Z4z34PAfA68gMjbDLDKpMxnrCieEjiY+TR9rwol+0lwdvTxWlSiL2SqLYKhOJUwo/yfW1
	U/i7vd/dPixcN6T4Bg9e4/PQ6YZ+5CXnwG6oChzONiAI7cdKXDdY2RdxwUUs6WJ572NzA1WTMdB
	NmsCDopJkR92Hvd9jTrU9LX4PzAaDaReUPJOi6m2TVxfSS9ujIUo4VFkK7pJxKs4m5L7cXyxmYY
	Hn4E/9Z4FEiYh983jT0D7dlPXe4v3KK2DeX/P7CDA+l8P6yXxOGKCufOJDcyBlaw2xKqUOLQFPc
	GnTzsKoMXLZi79AdnghYiuDkFyCdomfMg4Awc6tDuNQmAYjpXoHjop1TmoxrzcGVIBEyM+Ha3H5
	wFd39v3rlZuRfdckVRKgYIGiaQtt6/QsMlgzc+8CFuqjz/HGBUKujV2clJGMB84B7U=
X-Received: by 2002:adf:ed8d:0:b0:484:41cb:d5f0 with SMTP id ffacd0b85a97d-486eb2f0554mr408036f8f.17.1789068158634;
        Thu, 10 Sep 2026 12:22:38 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eaccaa1asm861074f8f.0.2026.09.10.12.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 12:22:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1506b117-6e79-4740-8e31-ce0d7a9c0d1b@gmail.com>
Date: Thu, 10 Sep 2026 20:22:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v2 02/27] kbuild: Add CONFIG_OBJTOOL_DEFERRED
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
 <166ab4ef8f062db45d5e4ab928f940d08dc465d5.1788899473.git.jpoimboe@kernel.org>
Content-Language: en-US
In-Reply-To: <166ab4ef8f062db45d5e4ab928f940d08dc465d5.1788899473.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Josh,

On 9/8/26 21:33, Josh Poimboeuf wrote:
> For LTO, IBT, and KLP builds, the running of objtool is deferred to
> vmlinux.o rather than individual translation units.  In preparation for
> deferring it in more cases, add a new config option.
> 
> No functional change.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/x86/boot/startup/Makefile |  2 +-
>  lib/Kconfig.debug              |  7 +++++++
>  scripts/Makefile.build         |  4 ++--
>  scripts/Makefile.lib           |  4 +---
>  scripts/Makefile.vmlinux_o     | 13 +++++++------
>  scripts/link-vmlinux.sh        |  3 +--
>  6 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
> index 5e499cfb29b5c..ab6e9970d4f4e 100644
> --- a/arch/x86/boot/startup/Makefile
> +++ b/arch/x86/boot/startup/Makefile
> @@ -36,7 +36,7 @@ $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
>  # relocations, even if other objtool actions are being deferred.
>  #
>  $(pi-objs): objtool-enabled	= 1
> -$(pi-objs): objtool-args	= $(if $(delay-objtool),--dry-run,$(objtool-args-y)) --noabs
> +$(pi-objs): objtool-args	= $(if $(CONFIG_OBJTOOL_DEFERRED),--dry-run,$(objtool-args-y)) --noabs
>  
>  #
>  # Confine the startup code by prefixing all symbols with __pi_ (for position
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 134b15a44625e..566e5be4c3f57 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -588,6 +588,13 @@ config NOINSTR_VALIDATION
>  	select OBJTOOL
>  	default y
>  
> +# For when objtool defers its work to the linked image (vmlinux.o or module.o)
> +# rather than running on individual translation units.
> +config OBJTOOL_DEFERRED
> +	def_bool y
> +	depends on OBJTOOL
> +	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
> +

Just commenting: if you move this option OBJTOOL_DEFERRED (and
OBJTOOL_CONTROL_FLOW in the next patch) a few entries up in this Kconfig
file, menuconfig will render them as part of the OBJTOOL submenu because
of the dependency on OBJTOOL.

E.g. this ordering:

OBJTOOL
OBJTOOL_WERROR
OBJTOOL_DEFERRED
OBJTOOL_CONTROL_FLOW
STACK_VALIDATION
NOINSTR_VALIDATION

would render better.

But this is minor, I don't think it necessitates a v3 on its own.

- Julian Braha
