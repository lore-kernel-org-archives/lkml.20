Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3189C3E1CED
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921899; cv=none; b=E6cVsjWZs6CcsS2kf9WV+V7AiW0bQCmGKGofEMJFanHT4mwH9Cq10xrVFHIJCwq/eR0CyQL04d/OVamjYq6w4QcGxIn+VfvnwkG6Iazdt/yRW0YLjW6A4KCfJt57vN11gWkmTM8UVLiJwW7Qd7S8YltMI/YAOiUxpSQ2PEpRBcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921899; c=relaxed/simple;
	bh=jsf/N4puSeJOQIlhIhkdxik0aMfrnwHvBR4c/f1fBN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=no7cu4Ie698NJm/GMctBhdEcXYWUFifyN2bFhZNaYXNf/Di2Iv8zNcIPq13iJX8Fvp1QIPnHTkFsVOsL4v1Mkla6IipjM+iziFtvDI07WNti3Vmexuvw0OJmx57nbjPkvtmnnplLkOxyoC7mIrckH6Bm914lTpgDLUFqmigUFVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h7+Kmg2n; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h7+Kmg2n"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de2f213b7aso1431188eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791921896; x=1792526696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8k8GHcZymDm4VuYrOBPVcb94WVXehxdLUIl/SQhO0TQ=;
        b=h7+Kmg2noTICU1LwuDE7LKCT+ll1OhtqfHLp2Jsy5fmulpQM5RUsLgfDRKO51guKOG
         XgBoxYVRS6X1+wv6DGaLfqbcn7tugLOHjtPF1gK7pf6eXYwTkw3ja1FWrCn51hrZpcFJ
         Bo6hgINnltAx45iZRrAIsUYE3HQJjQEe9v00M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921896; x=1792526696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8k8GHcZymDm4VuYrOBPVcb94WVXehxdLUIl/SQhO0TQ=;
        b=nyLe790coyjbFzOUti6mV6RrxIUOzXDPHVOYTONN9XbuxCi302fjoZbscipBMb5SnX
         h06kosyB4BWFRKIvS3IyAbq3liWXJNIPYrVwELZdV8fBW6xOzAbPWkRAriYKP4Y0/Cph
         8Q4tKWij9IUfmsAoCMnGCi3w22GgPIgcYvaznG60bM9sccaM2Bi8m1xZxDkAs98E2bCm
         QTdtiBywYBLcRG6lndfxjC4JRE2tmHyUAPmC9YmmneOkZTkoXy3A0lvJFi/L6OR0KBjk
         MXp5A4glWtcN8c3bbgIO+wgC+9ayvuhxjTbV0EzH9QW0HEQhWPwSytOhQaenjazHp9v8
         qmzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd0NzQJ6I6zQHYrKf/MWbYr0u0CGzL+w6a7G/uwWyRz4uCplZ51t0G8Eo2s7kbytvjiY4MHqXCi+lBR4A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDNTEefGtMmA5byGM6oQ7ZctbB3dCAYlEYvWgHXWMyk6Ll9Nif
	nF8LNeJJFNX2NxXOYwxFBzgkzr/6e4BovWthK3VP2nmH8+KRqy+vqrOG8WedV0U6Xz8=
X-Gm-Gg: AYBFou2pqkgUPkFhpROzv0CqwZdcPSiRu0FT8I4ml7Yk14KrIpUOHkZAeA4YmHrDlPY
	4kdvfVoxgCFjjvPjmM6U3XRuMzLBIWyavOiBqn4yCVB/vK3kmXnYnL29qtNdpJRnyJ9kVp/D2GI
	DBK+akE2vHwkwQevV/YWoGKzTriFN4/wUrmf9b45R9peabLqGLwMmIZsMPKuihS8F8hIzQPe+KE
	FIUsWN9gVvwNNHvkI/rPLWdbn43lahVl/VKHlvG1V3wSaNZn/L0lkE0+/oEIrKuHoX8Ozmu3Dye
	Nri/2+Y3CLzJmuf2QhCbfGhlxM7n9UQvMFs3tUniFvi+v2IQRjIHiAijmv1xLjSvXyaWeMFpQdm
	hmuudJDgXVkxA/wjryC3264FOqIY7So+bhlRcnPHUfT50uAD5pqvQj1aOprch+ZtfGvcq/BNATZ
	0wqaw9y9NsJ3IFzqXWaOMIGhb1Ktki8s1mgTyrYWWVPocS2rwqfuDKmoq4oUMc5Ps+XALJI42dy
	8RzJZc=
X-Received: by 2002:a05:6820:c8b:b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-6ef10e69495mr9069578eaf.82.1791921895794;
        Tue, 13 Oct 2026 13:04:55 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfc3150bsm505062fac.10.2026.10.13.13.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:04:54 -0700 (PDT)
Message-ID: <21d16f93-316d-4043-a4f3-b4abbfe7990e@linuxfoundation.org>
Date: Tue, 13 Oct 2026 14:04:52 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 13:40, Mark Brown wrote:
> The kselftest_deps.sh script currently takes a compiler as the first
> argument and uses it to check that libraries needed by the selftests
> are installed.  This works well for GCC where a separate binary is
> provided for each target architecture but is less of a good fit for
> LLVM where a single compiler binary can target all of the supported
> architetures.  Extend the script to accept "LLVM" as the compiler with
> an additional optional ARCH= argument so that it can be used when
> building with LLVM in a similar fashion to how the actual build works.
> 
> The duplication with the main Makefile isn't ideal here.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/kselftest_deps.sh | 83 +++++++++++++++++++++++++++++--
>   1 file changed, 80 insertions(+), 3 deletions(-)
> 

Thank you Mark.

Looks good to me. I will wait for others to chime in and will
apply this for 7.4-rc1

thanks,
-- Shuah
