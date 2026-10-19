Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431141;
	b=LKrwYCgR6MuU/kDo18/OaNEXU0zp4eSnM6oeQ8nkuCc2JB19P+eIhZlRZRI0FS4bfysq
	 rLHDtRqDXYIYwcdRv78Sf7jqfg48NcQYV6suZwDFLCOpx9sERrc9hWB+1J2GaiJAClT5Z
	 uJ5kF5KUQwS9sAhRxykryWhDgPP2XfMQ1Ml0IvLyiitU0WYNf2yfrLqSwRV0h+aHfxMcp
	 lcU94JarktEIxhtP2+o2qAN5jFvsCLX4fC5SxNdSVWrtxVeutAICB0qAsIJKYliHU9Y7Q
	 m1uSZREm5mSods5XMmhj6cPDyn4fMqwya4gX93zb6D+3iTVfR3Vv5K67Bd/nwYKRI6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fH71wL26lccrp6A48zhvdYj1x6+Gqq4exVWEJZ0+OwE=;
	b=Su/tSdu0JethICD4T5Hu4GoWrilBtV4YH8teQZVcHMv8jPvQxwV/tS+1jNjTy8Caxae9
	 vvwwHNcmR+AvsmUYrNUtE5SpNxeCmcbR4OYjRAZF6Wrzs/P5mgX2VQbKcNYaxK/DahwMt
	 GxKoYre7LaPgyeYsJ6QeIW7VCu17aNQuiq1qQuBzfulwMxpIFmd5sdOnfPw3lMFoYWuAT
	 xwSd3NZ+oovYOmAh6iEt2hTU0I/6xc2FJQClq5bV2qEeC6cLWCwMgL0TwqDt3rf60NuWy
	 7ijJBSN/9/c8o5EWoAfhAVfvWuAcpXZVA+sbULexJwqyr/PD24Yv0oRhIiMLU/kAn4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GReyJMAu;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A362A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A362A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GReyJMAu
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so2830619eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431140; x=1793035940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fH71wL26lccrp6A48zhvdYj1x6+Gqq4exVWEJZ0+OwE=;
        b=GReyJMAuaQIYpGxxKPfJ8T99/W2QeBXzsPHCCky+QMavnviPf5a4T4bfTSBcy3ksjJ
         18w9PFibPqr2fyuub4EjXq8Sl3ku/pXf4ZWUCk/mH9D3kVF1le+BwJeKNgw0wXDLpQ0j
         3/M2zScaHu0s1+WElpdiRjFtRA/+iCy7v5BmlXGRbxCmSzqUGSA460hDrls0cel9V3L/
         5gD0qw59HwlawKRpXy9k5OBMJJmTNMV3AnYeuFd/lxSqk3aFNpdxTjny9J5npGomPAmX
         qUccLIlFpWLykv2rcr9e2dnF3+AcXul1fzfbwhKs7RCn3CO4RaR46RRFCSYSnjZmDlk+
         KrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431140; x=1793035940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fH71wL26lccrp6A48zhvdYj1x6+Gqq4exVWEJZ0+OwE=;
        b=Pw8oZZ+CS+iqpk3SNcfohRMJ9KZ/tdPWyYu1g+mXRsR0q/kgvdygy5sRWDeTAsC+d+
         0YvZmU8ON1SgIQiLKJMQz0vh3MghpWPo0ZIdgIOQeOMrnyKDQDQQjNLn/mJREL5GXbRK
         e3ofRTBxRz8/wzjnMlPOakp7Cq2zNhH/jpKhrInuOfwI+02vMOE/Sew+OviH6kl2Jsmn
         kNthrgYgvtyH6CDXLuzAv7OTIJHDeBgOtULKfSjKkKWD2180fUX4tyoDqTShK5tFhsUS
         GImsb4xDtzYmAOmg+CdywzlymTvwbTobc1WP8+M+s3d3pcKoH7Q8WfqQQTpK3ruLO+ZV
         XWEg==
X-Forwarded-Encrypted: i=1; AKwUvBwqH5FSEjm5c2y8YyfxDarBV95DKGH2+BXcJUbHvaKBWmeS0dVHJ3+qnHwz22VFFaz1vYHTCm0nJC/DlYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX4lq2J6bfzqOucA62XtvKpiFKSMx1X5VyXVYH2yuR76+TMgEV
	VEvwHp+wuUfaN8wpAr352GtonAEmx8DHMcNvMyM59YZ0o17FqClFqUK0
X-Gm-Gg: AYBFou2rNEH1DK7p0Hdm5l53soD8PRnSogAM0Vxc/wwz1aigr5Yo0K5TSRp8oH23fZ1
	Apr1vPQ9S1rgt1GWK5+H1trJxOS9zrtpJtaKpa9KbekGPVk9L3rkrUabQWRoyskmmwXZpmz0S5Z
	6OkPh5hH1KBU7uxRC6JULtf5ncGevVFNV2S4Y9WtlKqrVKlNMbqdhoB/okiQEY+BSRkSAd8ki6a
	Fg89E65HhD+t19r1ECsFB6ZFLPWbixny0PR9ewmgJdARyjEcatmxvolzrxWaR7rZIITNZI+xfBV
	JeXibrG4EBZxcLf0H4aVUX1GehqHxeSbOIgZJF0nIjjLYKbz/C1g84OLQcY8hYlqSgrFTt7hB/N
	OfL+WaE5i4MuCHFuUC46jCwwomk5KigFqLba6ZK/b08oK8W8kctx/UAnmxp5d6FpVk1I0WOh6lm
	6QaWEbdhRGkxjGMbUUycpWjIvHAvEHAc6SD8IByuttrahDTHFDtG1tVo7ZE/GaadN+6nhqrVP7U
	2VDyMWzjEVeKpgph36uM4vLnppECXjvE78D4ipiISOs7q+MnGMz90VTGRZdkcU3e9xFgRqVx49Y
	LLoMng==
X-Received: by 2002:a05:7300:e9c9:20b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-361c9c78086mr12197480eec.13.1792431139584;
        Mon, 19 Oct 2026 10:32:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm56584669eec.28.2026.10.19.10.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 10:32:16 -0700 (PDT)
Message-ID: <c5bea60a-e2b2-4bdc-8b1c-9aa464c1c84f@gmail.com>
Date: Mon, 19 Oct 2026 10:32:12 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0000/1674] 6.6.160-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261017160431.119607952@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261017160431.119607952@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 08:37, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.160 release.
> There are 1674 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 19 Oct 2026 16:02:05 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.160-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build on ARM and ARM64 with:

util/event.c: In function 'machine__resolve':
util/event.c:755:32: warning: implicit declaration of function 
'perf_env__get_cpu_topology'; did you mean 
'perf_env__read_cpu_topology_map'? [-Wimplicit-function-declaration]
   755 |                         topo = perf_env__get_cpu_topology(env, 
(struct perf_cpu){ al->cpu });
       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |                                perf_env__read_cpu_topology_map
util/event.c:755:30: warning: assignment to 'struct cpu_topology_map *' 
from 'int' makes pointer from integer without a cast [-Wint-conversion]
   755 |                         topo = perf_env__get_cpu_topology(env, 
(struct perf_cpu){ al->cpu });
       |                              ^


/local/users/fainelli/buildroot/output/arm/host/bin/arm-linux-ld: 
warning: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/arch/perf-in.o: 
requires executable stack (because the .note.GNU-stack section is 
executable)
   LINK 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `machine__resolve':
(.text+0xdfeec): undefined reference to `perf_env__get_cpu_topology'
collect2: error: ld returned 1 exit status

And as reported, on BMIPS, we have this build error:

net/sunrpc/svc_xprt.c: In function 'svc_recv':
net/sunrpc/svc_xprt.c:873:1: error: label at end of compound statement
  out:
  ^~~
   AR      drivers/media/platform/renesas/rzg2l-cru/built-in.a
host-make[5]: *** [scripts/Makefile.build:243: net/sunrpc/svc_xprt.o] 
Error 1

-- 
Florian
