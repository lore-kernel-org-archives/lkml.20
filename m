Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42284FECF4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544834; cv=none; b=rMRLc1Etbu+gCCcP5jgcBImdaF3aLGVRL+PFxlF2bCNcGcjppCoKNMJt9df/hdtd1j+JfT7wUUWcVMWF0za0xjwH12y/s2h2QEc+OzqsK435NZMiLC4Ba/kkcLHayKcN5k+kE+61tbeMLaGP1RZXO/yEtZlqCEfzlLJyJHwtVEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544834; c=relaxed/simple;
	bh=YxiKBx//2sUyFwX1S42S7TPTcxzk4U6BBJBEU0T6h/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAkPBFHsA3Qaz2vpnAo33poUU9z0NV1jfmv0XIUuW3AaIOdvwj6je0hZEiZW2cTg+tfF4PqIpfiOTsyVcuHk1jGD+FtKRIDUSpEmc0b61Xmx+dK6S2rTfeyt9KcwYOJJyIRqZLD75jEZA7yMPBD468Kp+HnqdLbuTQwmUp4loW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gW0qpvAa; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gW0qpvAa"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6acc74fef22so682738eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788544830; x=1789149630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ4z45aMbFmWqyZKcuBn3UhHwfccm26z5b2Jk9Hp5CU=;
        b=gW0qpvAaVgRiwRsXec9HNBy22aBb54Oky6fcNf9tx3KHHAgntdOOWG/0Hom7Q3549H
         o+uSGh0a8NYBCFLEHEkKEQYlsg49y+qPmVG1phk20YV52GCIskv0eODGxrrZff9bf/fz
         0b9Zv9Uo0qkr2A2ByV5KuM335dnQcv9Zdattk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788544830; x=1789149630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJ4z45aMbFmWqyZKcuBn3UhHwfccm26z5b2Jk9Hp5CU=;
        b=ox2Ad4GgSnGoD/LKZRdWqNWRIkYcAMxSghuaLO34OY10UlGQcvsIqSJzO7FqZPMstQ
         FsbHwXU4HbmqlyFZ2piBtgyQFH5+i4nLi3DIg4jfAwZ/reHxBg7bCo1qXwNkSAy+LGKW
         JuGDFmv7IVua0mXfkFWSJwPLrMc0XXNYdq4hnm7vD0uYC8oA2eBiGoosvsyc6D2SveoG
         IVurSntrY9b9vknLtPIdRaZ0MQOKVc3JBr4yB68A6QeibkAb+4IV+5lCzmeXuF0CdZI6
         z7GUymdCmgQXzo/OElFSGDRnsTEL4OxSa2uSEaPhi2fVH8UwiZqKGKbMaZtdl/SiKwqU
         /uzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSVtdfaXbATzLScrXd9Tg4NY38wAovtAOYS69cqcHJUW+RvrABZzpLbUMHgwk9Qi7Q36bsIYGKr2nO9jg=@vger.kernel.org
X-Gm-Message-State: AFuF++lpTWslNt2RTJWB1F6JFsl7n9/JBKsL4psj/eBpCQISkpr7116a
	g0Qmiwf985qrFw2V5hD91k7J+13UuUJ0xIyM7OLgUeE1A4H4Kdow3drfC1yJ6PLYXEo6xYbidyT
	J95oTdGE=
X-Gm-Gg: AYBFou2phpR2+IN/T2cGIDiPUXUwIQ4hmew8NON4wxesPY3QpW4feo6SnDLafXvOsZf
	hMEjW0D7bCpNtBnV84fjEJr8RFsxh98YqC1S9Zu8p6bzElxYerpQfn95g74Y1mHv4qZEf4YoiQF
	CTmXU/7JtJIE/U5n7M23LBQTN6y0czthEPdyvz14qr8Cw+/bsnR9VCl1egJ7NPeyyhz/jfjwbmt
	2DmQmXIFAc9dB/3+kuDnMn5Ew8f8uV/uKS3DVsFHxMQlplzIRHRLgYt9YaIQQB480cGGkSkzCgu
	THs5qiHdmRpZXvs3UrROYTLYve4UrwG9sSs2hsIRt0VNWTR9JP+hNJhtfapR/ouU6ko2fciJNKN
	e4IZz34Y46sgLURnJQZUJJ837DP4yQwjlZ7DbLEueHRPjVFAKcuUg1ZROLrYVkTxGB7ECo/GwnD
	OpPyqU7uID7RfSa4c+wrGDRNBcj/EtZvq7xCEZflzTMMkiMPmLQlkqh0uWukefNJGuJwviUw==
X-Received: by 2002:a05:6820:810a:b0:6b7:46e9:96fc with SMTP id 006d021491bc7-6b746e9a31cmr3985828eaf.44.1788544830464;
        Fri, 04 Sep 2026 11:00:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6de03fa6asm4348054eaf.12.2026.09.04.11.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 11:00:28 -0700 (PDT)
Message-ID: <269fd99d-b031-430e-a917-78ae97d9bd0e@linuxfoundation.org>
Date: Fri, 4 Sep 2026 12:00:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpupower: idle_monitor: add NULL check after calloc()
To: longlong yan <yanlonglong@kylinos.cn>, trenn@suse.com
Cc: shuah@kernel.org, jwyatt@redhat.com, sageofredondo@gmail.com,
 jkacur@redhat.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260902065224.1392-1-yanlonglong@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260902065224.1392-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 00:52, longlong yan wrote:
> Twenty calloc() calls across five idle monitor files lack NULL return
> checks, leading to potential NULL pointer dereferences on allocation
> failure:
> 
>    - mperf_monitor.c mperf_register(): nine consecutive calloc() calls
>      for per-CPU counters are used directly without any NULL check.
>    - snb_idle.c snb_register(): is_valid and per-CSTATE previous/current
>      counters are allocated without NULL checks.
>    - nhm_idle.c intel_nhm_register(): same pattern as snb_idle.
>    - hsw_ext_idle.c hsw_ext_register(): same pattern as snb_idle.
>    - amd_fam14h_idle.c amd_fam14h_register(): per-state previous/current
>      counters are allocated without NULL checks.
> 
> Add NULL checks after each allocation, returning NULL on failure,
> consistent with existing error handling in the same functions (e.g.,
> hardware capability checks already return NULL on failure).

There is no need to add null checks for these small amounts
of memory from tools like this one.

How did you test these error paths?

Sorry I won't take this patch.

> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>   tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c | 2 ++
>   tools/power/cpupower/utils/idle_monitor/hsw_ext_idle.c   | 4 ++++
>   tools/power/cpupower/utils/idle_monitor/mperf_monitor.c  | 5 +++++
>   tools/power/cpupower/utils/idle_monitor/nhm_idle.c      | 4 ++++
>   tools/power/cpupower/utils/idle_monitor/snb_idle.c       | 4 ++++
>   5 files changed, 19 insertions(+)
> 

thanks,
-- Shuah
