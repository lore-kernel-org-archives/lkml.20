Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2180F4248A1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423878; cv=none; b=ubcbaXgiRz5npgtV9wRQAUn7WkycQv568dKraugiDnQxqn9rcayHtNnhLSeM8Jw9gPgBvjXdwxJFTBoD6FjTL+cPVMVkMD3DUYZLOAa2lKNPIQCdrOiWLPf06FMUWe+bmPrsM+v/Ezo7pzG/4QBiByIzQtAwdsC7Q8uZ4rQzlzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423878; c=relaxed/simple;
	bh=jUqRKiy1Als/fPzU2pw1tgkS2Mh780PlQdOLEThN/FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKYya5PpcXlVWjoGXL6Rgm0YsEDW3qgEsR3rjM2BGHW6TdWb86zKAYXNgm29ScBYs/uxxuKuZbLh53zaGVsG+jhxQ9yvLSfhNueIDTIb98oEHhhpCM9ObPEIshgebjL941Gd2mvqHFfvR9fNkIbeQZ5dMFasAbC0eLFwOYwOszU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTVGaBHg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTVGaBHg"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so240104a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423875; x=1789028675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgOyUEIfGCWyeavJ4iucCikM9YF8g1HwJk3n6ykR+jw=;
        b=NTVGaBHgNQn7vMQGRLjUt/SMTYhvWyZFM4Z6hyK1oTS1fZTR6tcXpXBCuhbUZpDfPA
         vtj/DRX9gir9Itx7Tdfoxmm4SLYuzVgEGYK8WdhpIMKzBX7qkPxilxoRZNM3ro8hEoj0
         OlNe4D9R0jdgCxrauRvFnklLZsfa4VDgm0b34ByvsLqupe0IP3qU3Vf0MhXX175VwFQn
         E+pLOv7lp0G1kYrwF8IE57n2WsHU9LeQ3XjkLB2QoP2hqToozQlXQlKvG3oGJLPphrpb
         nY5ztHIw7h5N3MUMKb/NQs4KxMxby4e7g2GJATMRyIKDTnnNjZTAonFGFc7c/H9uj+wi
         ao3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423875; x=1789028675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgOyUEIfGCWyeavJ4iucCikM9YF8g1HwJk3n6ykR+jw=;
        b=eLb9kFlIoSHeFDC6FrlkxvIHL+WQah2FaEP9tfqKfsI5ZQG26tAbU1cdQktKuQ9V+p
         vQijz+nJ26bZ8l3xJDICajQLEWLf2gYD2YTh2ZVAJ5TLKha5a0rSi2SURQ1sFpmdFsP9
         kn1NzxWvkFqjOJNQ5NDrdQdvO0wsvGTJQp+VOBsBRsKD7E53I3bteyDcEvDNzWJ/qjPC
         f74n2aHQyXDC6J2O5uzIfcolG6g5RnN64gW8F/ewmkSF/1EEAs0/IBQILhBpa8XlcaHh
         J+T4NuhIco5Yy6xbV2h/RxUCOMtPx+l+hkAxRRMZ6gwLZGt0AoHUj77HPB3EZMJRaeEJ
         85/A==
X-Forwarded-Encrypted: i=1; AKwUvBxfTxcuK37F7nDgS870zgmD2ivikvUp6hr7MPiyKoziHYif1PfR0IegjFz6rnDoPTOVlzHRHguagVulZ6c=@vger.kernel.org
X-Gm-Message-State: AFuF++m6qa17du7DQinwMh7pan5rbMofF27KupIdrINmYKXbXiFc3b3G
	YYYO5Di0lhtSo/PqGd+cAoNo72R/uUIJUgFAxQg2F06nvKlPosC3RjxF
X-Gm-Gg: AYBFou1uVPKcXqYjtsq+88qY73V5PGJolgzIO9xgK0kxjYbM2LmZosnCrQWcF4YMmp3
	KTaBqxOidqL0snijt49RpialuCfLZAKOQMiQ2eGgXEoKM0Snv0N59rrR4BareyWRLEapzJ8Ho7o
	U0s0dLlC2kPGQoIDW+qpQF3l5REUkC0yWQtCmwjWt/pPBU/HldebxuBpmyFw5KuP+1oWdoJ78Fd
	3/aV6EyN/LgQ2UjwGKc0TPxQsRLuJDxVdfyPbScT2wNztCA4vLIGppHJyCl9FXqH2KU+HOQ2OEx
	KGm+ejEjlktzC8CudtN7MJ5Cw3gMM6NdXUqzKuO9169jb8KX6rW55R5ZeWniDtbwGhTDf4Dbz1/
	pXU7yoNDPy2mnn+LNi2ABaOa2Z4ipdi/2LYQI/7zk8nY8sMWiOI+MjLHKQdtGkgk8oEZHSOHj9D
	uVt2vbXkUUQqmFh9HPrR5sXXLNVaCVD6Phrd1ZQVzgYvp+LrrQqOBMpBK8JtIURr5Kmo2qBBrea
	hZSRtee9zZC8Q==
X-Received: by 2002:a17:906:c104:b0:c25:2cbe:edeb with SMTP id a640c23a62f3a-c25d5532148mr662129666b.21.1788423875110;
        Thu, 03 Sep 2026 01:24:35 -0700 (PDT)
Received: from [192.168.1.124] (78-2-9-45.adsl.net.t-com.hr. [78.2.9.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42861c1sm63169966b.63.2026.09.03.01.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:24:34 -0700 (PDT)
Message-ID: <f81210b9-abb1-4e95-8995-f8ca1435583b@gmail.com>
Date: Thu, 3 Sep 2026 10:24:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net,v2] net: wwan: qcom_bam_dmux: account network packets
To: netdev-bot+sashiko@kernel.org
Cc: stephan@gerhold.net, stephan.gerhold@linaro.org,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831181006.1382372-1-sinyavin@gmail.com>
 <178838348238.3394541.9061693826070810058@kernel.org>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <178838348238.3394541.9061693826070810058@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the review. The TX completion concern is valid, and also 
affects v3, I'll address it in v4. The netdev lifetime issue is 
pre-existing and should be addressed separately together with proper DMA 
teardown.

02.09.2026 23:11, netdev-bot+sashiko@kernel.org пишет:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0 (1)
> 
> - [High] Use-after-free write of the netdevice's core-allocated per-CPU
>    statistics from the asynchronous BAM TX completion callback.
> 
> Pre-existing issues:
> - [Medium] The driver allocates netdevs with alloc_netdev() in
>    bam_dmux_register_netdev_work() but bam_dmux_remove() only calls…
> - [Low] Drop paths remain uncounted after the patch: the `drop:` label in
>    bam_dmux_netdev_start_xmit() (drivers/net/wwan/qcom_bam_dmux.c,…
