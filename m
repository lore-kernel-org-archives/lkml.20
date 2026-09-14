Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DFD27FB25
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410518; cv=none; b=CMeuSO2gdmlJpD3xYKfn6Y0brDZvyV7xQU0034dA97+W7BOOQbpue3jO2smnsQbTAJWHhQeD67B9eTIOzG4BZ2vw+RjB/l4cSVK2h67YVT4WMMbpK2EAOmvaaBBBeAkaIh3Kc/GA25sanrhyFraSLM6ClBiVEqibyxDRqaOIbBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410518; c=relaxed/simple;
	bh=Oc3nAJjpp0QjpjXeocnToBp2SCGQxGodC291S1yGpsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o344OnzH4Cfa20J4ni8VKbxEeSSekfGrdLdekli7vP7hbkt5AUV4JeWFHhNpz21T4/o9IfbzwBBC/iLytb1MbnbvaB7U7oAgdBGhwSx8DMH3x/b/kYrPXWfNdWsDEkUr8aTbeKuPVkyKPm89fmtzUY2SqcImW4/4QsVTk0ySz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HirI/9fp; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HirI/9fp"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93a125dd74bso162826585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410515; x=1790015315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXGFxPZOAw9wmXg2dzwPQVLDwdqQiEsc4hGqI92R0HE=;
        b=HirI/9fpT1gBnLbAejD4U4TUTuRwj+w3Mu3k3i7viNWnNZf9xqTLwZCDO9cRZGTvXY
         1hLwizlI8sAVoVPWDfoy1mvT9QgkU02vg2qXGsX3n0J3bp5Lf8c8n/fxwRz8uYvtK19S
         ranxrpjGWsm9lGJp0IUua0sHGp4245uXNfmmx7HF154ZUQI15/pojbM0j25pPuIm9rl7
         5D6F73L3WPiDlTr0S5IVVHpmdOoPM6wrpaGjQcQFklaXhJm0KpSFBI4w84bOZRo0a/p0
         SL/nZjEzq9lZ8Z2vsdmc3Ez4ZNXlrqQuPNzz8WCCMu1yGr4gxXrWLEIYjEuDfIiG7jvU
         mHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410515; x=1790015315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXGFxPZOAw9wmXg2dzwPQVLDwdqQiEsc4hGqI92R0HE=;
        b=j1qPMHekly18pw81tsbiRzb2Dks8Q9ig9cxUMv/XXOTefDgIajacyW5zTfIxPhPWUj
         rdPdHOFRI5VR6TUi41P5PYny2UpVEY2B6bL6bSrbKccFlHaELWJ1HMCt6ZLJI9LHa4OT
         yU+XlBRPCO2RpflD1RxB8vV2xImVz9AjUw04wr7slJybLABqzSH8vfvR+nU86xCBuFUl
         8VOIV1XHzLp7Jn4AwvIO0gdJqUGrRXZ5SjO6kLk/SJidm6bHRsK2QtdLL92ZCWUO1p6g
         IX/Xjdn7N+HkipJk27fJ8Z1cFq7pzIPpWJ++aKiZu7HL3KaOt9ZWdjK1SSvDQFD51Ut3
         /oNA==
X-Forwarded-Encrypted: i=1; AKwUvByDOYAmLqYXR0cgmH2N9qHchk4R87KcQnnqbQ4VZVWzU/q8NV/6hE62xBmQbEgvr4ykGRiYLVYF/AOeCSo=@vger.kernel.org
X-Gm-Message-State: AFuF++lJFYLIj/rfyRrfoPpSn3OmEMvOOEp5l/RM6o1Z1ivRVccnIFzl
	R89yNykeffICLVgN6f6exHk+ooXvX1z195Eb0RPBSLUKx78zbgsC2Erx
X-Gm-Gg: AYBFou2yaoZrlKpnlE4NKfJswm8NJErYNt7B2oyWoisLYk2PR6FD/ZfFQDprBZrtf/3
	LjC2KT64K1qQks5R+EtSsdq8c4gxR4//0MPW1KR+Krf0G/EBwnsqSBPunJnGK0C+SMX5yTiL1bq
	2Wt3yoQOn3l0rBk7JLGEQfbRZU8xZafF+HJ1uZ32JzooaqyT+jX5TEWb+QdsuWI85fqMwuRHEtP
	VTxwPwQbe3795lTvm0vH4zgZz6gzqZ3sJJG15djHEvjiDRNbHhI4WG8csevUYhT7G+bFme6SiBY
	ewkJyjl8dztmdP8AtSspWXb3Aw9QeBEjS+4KEQkSFv6R6iczKaYF9rB5/2EhynIepV7aPmwwMUI
	zGWceyGRi30lh/puHETXG3Njrxpu1IG0wca04s9yIhpiQBiTddQinFrl4jGJWxiT/qDelSKQ84K
	BiEPQM5PXst30zCWsSzwdKjBhPMD4qEbImuMJ6aHHtu8jA+naxVUkvKcNzROYqmgk9/QNG0k7pA
	2z/s/ga0ksv730TOQIcohCyxw==
X-Received: by 2002:a05:620a:2549:b0:939:3571:bb90 with SMTP id af79cd13be357-93a2994242emr542974585a.24.1789410514974;
        Mon, 14 Sep 2026 11:28:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e811b572sm1070310985a.47.2026.09.14.11.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:28:34 -0700 (PDT)
Message-ID: <3d3c3a1e-8569-4798-9cac-68c58416064b@gmail.com>
Date: Mon, 14 Sep 2026 11:28:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 0000/1518] 6.18.52-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260912065623.398859879@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260912065623.398859879@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 23:36, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.52 release.
> There are 1518 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.52-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build on arm/arm64/mips with:

   LINK 
/local/users/fainelli/buildroot/output/arm64/build/linux-custom/tools/perf/perf
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/aarch64-unknown-linux-gnu/12.4.0/../../../../aarch64-unknown-linux-gnu/bin/ld: 
/local/users/fainelli/buildroot/output/arm64/build/linux-custom/tools/perf/perf-in.o: 
in function `perf_c2c__report':
builtin-c2c.c:(.text+0x420dc): undefined reference to `perf_env__e_machine'
collect2: error: ld returned 1 exit status

that is coming from 629978bc30938bc4929ff6c8b0dbc6fb637ac8f3 ("perf c2c: 
Use perf_env e_machine rather than arch").
-- 
Florian
