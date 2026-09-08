Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBC359650B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889644; cv=none; b=TBo0GgqsW8pRX/t9dmp2LTDAFpkBposcNZ4D+Q6A3zqmj4kSsCDUkCJ8yuqPlleN9mS4io0OOYhxhDk/nRoUEf/VDPln5aIl/Y3Zz6n64ctyIRLAYxVI5+xBAvlPGUgVeHilLXruCmg5rCjB4r9eKCW8STGh5RDxNTtZYoqHg3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889644; c=relaxed/simple;
	bh=U/7Pe7r0ZMKz37Lw42Lm+e/3S1UsI243tV/LJVvgzbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iua02odx31es3VKzFW2obUoyi+DH5P9r33YRLeGUsdgyul+a3TSMRIwjexmpdaZWx11f+3eIj+jRwDBuY2hP2QBTax5P/Pbusx/EEX2MJBuR5359fLSZbQ5PIgr1qgiAEkV9EuewAhGdJrIv5N5Szg+lXQaGTgcLBEkAK4nWZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mY6IwZz9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mY6IwZz9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso145645e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788889640; x=1789494440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCVkwa3k8DOjVmDVZ4RnssOFce+vSofrYawaYtydteo=;
        b=mY6IwZz93LchzX5l9nwHvr3uMOaq3cXh6x1jiVxdhOUFDu6xVap9hvRiRbZQMjGGMG
         PZhsYg8An9FMofmGOEVyu5S9Hdx1HZej5Hf5flQgFPP2gdphrj+TbzXCArGvCxURKyQR
         iFLQdLow/a6ZU4kkOMRxTqxzdVAKS13M9rSUcxQr4+ae/h6O2GiWGaTrB1h10Tl9ss1U
         jPgvajk7+p4oYGEcLZaHvQ8apdIR1+QCIPQEs4Ag7F9PIRrR6gWW3FetOoQsa3ihZAWj
         hzYpzOhbZdUK+ek8eP2yPCRmssUmZZg/DDWcmLp8u403WbWQIVm3qji1KeK3TD7Vjp30
         c4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889640; x=1789494440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCVkwa3k8DOjVmDVZ4RnssOFce+vSofrYawaYtydteo=;
        b=nI4FRkRqf9qIUVL1aYHocMi0AYN3ObuNSS9AOf27VvRh4IeJnDLI7FOO1ozCP71cCr
         sArHkPPO/3ZDqNiTtBo6MNJF0hjHzH9yk+Snn8eO93dGvZqAWsek7QFLrR+0YqxYwsIA
         K6BngwKmRRTybIzxzF9hwabBaSPdl6nFCjcxiKo0PntAulEkA6r2iyChM4xA6uI82JVt
         xmRBs+/tV+xWXoMgi/kWrnj9HE7s42fnPL9iKbebyoHq8Yp6FRcJ0fl6TfAJsPB8CMfq
         wNr+s8re2OFMDF9EDkORnfxdvzWdOw8nR/D6QE7TW4ZeDshwg0p9y3lhYn/XDfytH72f
         /9Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwnKz+H4TCZT6+ObyTOMz/jGmt1NGwseUI35j593T8A6gXx0C+2/2CB4odojO1dzqI7D+zEYkYnwWSdfXE=@vger.kernel.org
X-Gm-Message-State: AFuF++mbmT+5KIR5k9EBmoZAIAYwL8QmHeKS2fjlt3foBm5bzwaIF1gN
	nw7sJu0+H7V5FlnFNRvDexOuBplF/NKbC6SG02iIMdAg3lim0w0ATAZmP6XEwzfhXA==
X-Gm-Gg: AYBFou2ZIu2fAxQdfaoDUnNnjbA/AlT1GlRsSykE3mgiDZFRxAd4IiGoAOI4HCU4sEg
	ykUaBp8YVhwAnccAdk7HSNDR4Hp4gq6/hsRDQY3ESaVpLYrrFwkbWFCY+aRWSZytmnzsTD7jnAi
	tPT4o5w6OwKwjlaUT6x+99FNYz6p10aC2z7fncZ6jEAbWTK1bGNgnyrE0ZAt69q7QFnpyIyYXd5
	WCcGmQoBd2seIg2ivL1EuYXqttP9e8x+KlX1OCZ8SBVxDc4Y4UoSJBFBiv0pxtB4v3npB3YRyy5
	Zadr5c+aXIY/n0FIbgxQ2PxmHEhy4Z1/isaCGjvyxhWZKkiGh/QBz+4Pa/N5p9wwekL4Z1d9zVQ
	mB2I/qUusOXhNVbmiDHL2Ill5Pp6v0jYUM/eQpRo8TwXKjpMfGdnBE4f9J7SuSgOHskuMg7WGW8
	uTPoNXRJuKym1PNwTyeMtifrilXsz2J/yPy4MLuaLLsDw0CGZpS6AvkNA9QPe+zJwARHhIH3uzJ
	OcXDibhWOBorUZ1BmuHEdyL09qdrw==
X-Received: by 2002:a05:600c:1c20:b0:49c:e7a9:ebd6 with SMTP id 5b1f17b1804b1-49d01daafe2mr3937845e9.8.1788889639702;
        Tue, 08 Sep 2026 10:47:19 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm29337706f8f.15.2026.09.08.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:18 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:47:15 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <aqBKI0Fg3ZqYPOJh@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
 <ap_69OsnAOwQyo50@google.com>
 <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>

On Tue, Sep 08, 2026 at 05:04:44PM +0200, Jens Glathe wrote:
> Hi Mostafa,
> 
> On 9/8/26 14:09, Mostafa Saleh wrote:
> > I don't have a display connected (never managed/bothered to enable it).
> > 
> > Can you please share your .config, I can test with it, just to eliminate
> > the possibility it's causing the issue.
> > 
> > Thanks,
> > Mostafa
> 
> This is my .config [1].
> 
> [1]: https://pastebin.com/QhDizqCB

Thanks! I tested with your config plus
- CONFIG_EFI_ARMSTUB_DTB_LOADER=y otherwise I can't load my device
  tree from UEFI shell
- CONFIG_SERIAL_QCOM_GENI=y, otherwise I can't see the console.

Booting in EL2 is similar to before with SMMUv2 errors.

Booting in EL1 hangs with timeouts and missing suppliers:
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
[    0.000000] Linux version 7.3.0-rc1-next-20260904+ (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP PREEMPT_DYNAMIC Tu6
[    0.000000] KASLR enabled
[    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
[    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
[    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce ids 32->19
[    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pages 1024->256
[    0.163152] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
[    0.163313] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
[    0.168334] clk: Not disabling unused clocks
[    0.168336] PM: genpd: Not disabling unused power domains
[    0.170770] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.178347] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.184718] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
[    0.211932] Warning: unable to open an initial console.
[    0.212057] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.213907] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
[    0.213928] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.244210] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
[    0.244275] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
[    0.251833] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
[    0.259418] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
[   10.213618] qcom-pcie 1bf8000.pcie: supply vdda not found, using dummy regulator
[   10.214873] arm-smmu 3da0000.iommu: deferred probe timeout, ignoring dependency
[   10.228713] arm-smmu 3da0000.iommu: probe with driver arm-smmu failed with error -110

With that config my device tree doesn't boot also and hangs similar
to above.

I believe we are testing on different SoCs from your fastfetch:
CPU: Qualcomm Snapdragon X Elite 1E80100 (8) @ 2.96 GHz

While mine:
CPU: Qualcomm Snapdragon X Elite 1P42100 (8) @ 2.96 GHz

I enabled CONFIG_QCOM_SOCINFO which shows:
[root@alarm ~]# cat /sys/devices/soc0/soc_id
635 # which does not exist in qcom,ids.h
[root@alarm ~]# cat /sys/devices/soc0/revision
1.0

Thanks,
Mostafa

> 
> with best regards
> 
> Jens
> 
