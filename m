Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E164DA9A3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728829; cv=none; b=bRe+SASnTDZA6O6nRBBqn+1iAsYYMrk4d86mjbHxRHkBGbTgKYMNuiHWzWYHBBRW4aKPxMNaIAchPUIUQjsUXkw9TMf32G6F7UFTWD63PTvTp906PGkSywUWAC9F90tCSnLOyxpg0lER9aY/CyDytKkuIF2MgICJabBu+Gd5wqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728829; c=relaxed/simple;
	bh=ZUwGpl30HDIT8l2z/Osc/Y3a2vr84b85yvTBFDvsGtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJgVdo9lgfIwSPe2nnEYIbDBnIhpsDGViU3wv6UfBViLoexrhKIdrr4ZaPLUoxAGAigAoqDJt/YsKAGDLW1g7bZwHLVPeIZ0+EhYe9jIw4uqfai4YkWAoYtr20D2BYbcD9F89fBBNyaWA9CO41lq2i42Tl0tG1ZG6GN/geBNWUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr7KloNC; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr7KloNC"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2caced6038eso4986735ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728825; x=1790333625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=Qr7KloNCaHnbvCpqyS9wDLbNsjqNJgBjYDLU6fY9KeGRtfUa5rpSFIe0rvKZ8Q+8gM
         RT/iFOq6j2+MlURngZ2kh6NIiXXrE3Jayk2aeKPqLjbAjv8dpqaBLLLK3Pt0YkKT1s5B
         K93MjXaynVvdC+3iiO7jSYNo2Fo4XJWtybYcAf5OlYg3GWikUXUUlhebIqlcbXVQjJl2
         9NswiOhNjLHQbAtGrqmCqaCfrr0cDj8/Mc4JNXS0JDAY53nQvZLk4Y8o9kNKtUK3djhH
         gaOXpd5thJPcAEHUl169171V0Ryq8sAYpCTwRRf9WtuZ3J21Nu+PelkJ8mj9thNajnV/
         RNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728825; x=1790333625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=tsIQExGJmri3VPb1KNNPY8Zh//xyYE37z2XKZKGogFvbqhYCqI1rM59TYTQ8PC7jIy
         951q9B7dvvTJZmukMRYYDLGdG8fj8+/YEpvuwYyb6/7xQH09WqZjCercykXFfphlmsNZ
         UgVDCel3I/0F9E0U49JGokz8OenumJdvEAgyeYeQ/Ndo9JglXAhN88PZ0JUV5dOxZhWR
         wZYAZ69J1+AQpfweU83Jt2NHDp4u1qb0p8H2TBYayR15uVjueqRp5Ea1844NBt4PfirT
         jjll6dGILH/mOmNnNSJkUfYveLvVbqC1GeJypkBDflOfLrMgDt1ycCCaeLvV3p4D2jTa
         MJwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj6HqDjBU3iC8IUn7pwdJONvVMQnxcI1vqLuvImFr4GGpeJwm3MOiufa0T8vyPm3CQLLSlNCZXYz2IzHo=@vger.kernel.org
X-Gm-Message-State: AFuF++nst+Gr40JCPgZXDbOB96ARtgAJmFDlBwFoSoM4N+gyxmuY5MLs
	/zhTjV4GQZ/QRJcu+RJzu28oyiKQJz3tf/uo0yBYD+VfeQjLbjWus4gw
X-Gm-Gg: AYBFou3Aj1uyfv3IqwPL40P/W5089us3TzDR6hIKvbqWI4Au6kKDmtVpVpliOLa5UXk
	SvKWpbF2nrWMHKjN8skT61ackFBcVPEuec9p/X4ai8oy+LfcnpnA1qKY8xNtRtrRzd2N0IqXHvy
	eNH/7DKv7SwTM4SotiV79NglCDCwKeTWjs1uqEfK/UrWbH7sdbj/M4KAcH6XrzHtydEfr1LhZyT
	XVQbeZxuh5AHzrEMDlwKu4mPWfTywaen+7dQ7uDmPTvjXfuVFGduveXeGBCZQnkBDP+nU3TbaKx
	f033pPVRkWLUe5PZJCLNKHSytKTSL5z38wGac0jteJYgwCMUUKLewKZ1kHza/M6fUEeuTisJNln
	IAwBpZ8MZYTcuzTMpasIkB1AmQNg/1jFg1YinCEuuOgay3G5AzEJrL+Oqc9YjMe4LIrTmIRPYCt
	igynqq/QjEo/otnojcyXatWbycZ4Io0kbO+b/1sQHMbWfRo8wf5wsV/tM8feiQktiYWb9dOD33I
	EpBdg==
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr93269015ad.21.1789728825328;
        Fri, 18 Sep 2026 03:53:45 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525b2asm5835555ad.19.2026.09.18.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:53:44 -0700 (PDT)
Message-ID: <1a47d5de-fb68-4c10-a199-f0d274689cdc@gmail.com>
Date: Fri, 18 Sep 2026 18:53:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <aqzznOgILX2pZg7b@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aqzznOgILX2pZg7b@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/18/26 16:17, Baoquan He wrote:
> On 09/02/26 at 03:31pm, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
> ...snip... 
>> ACPI systems already filter reserved memory out of the vmcore through
>> their existing path; only DT-based systems currently fail to filter these
>> regions, which is what this series addresses. The flag lives in memblock
>> itself rather than in a DT-only structure, so the mechanism is generic and
>                                                                  ~~~
> The patchset itself looks goot to me, while I am concerned if it's
> really generic. I raised that in sub-thread talking with Wandun. Imagine
> I tried to exclude many driver regions and split memblock regions into
> hundreds, cma could yell out: cma_declare_contiguous_multi()?

Are you concerned that setting the MEMBLOCK_NODUMP flag could split a memblock
region into many smaller regions, which might then prevent
cma_declare_contiguous_multi() from satisfying a multi-range allocation?
If so, IICU I don’t think that applies here.

MEMBLOCK_NODUMP is currently only set on memory that has already been reserved.
These regions are excluded when iterating over free memory, so marking them NODUMP
does not increase the number of free regions seen by CMA.


Before marking NODUMP:

  memblock.memory:    [ free ] [ reserved ] [ free ]
  memblock.reserved:           [ reserved ]

Now, for memblock.memory, it is one region that contains free and reserved memory.


After marking the reserved region NODUMP:

  memblock.memory:    [ free ] [  NODUMP  ] [ free ]
  memblock.reserved:           [ reserved ]

for memblock.memory, it splits into 3 regions, 2 free regions, 1 nodump region.

Although the memblock.memory array may be split internally, it does not create additional
free ranges for cma_declare_contiguous_multi() to process.


> 
> IMHO, withdrawing the claim can fix the nit concern. If I am wrong,
> please help point it out to let me learn more.

I will revise this description to avoid any misunderstanding.

Best regards,
Wandun


> 
> Thanks
> Baoquan
> 
>> both ACPI and DT systems can benefit from it (suggested by Rob, thanks) [1].
>>
>> Since the reserved memory regions are filtered out, the vmcore is
>> smaller in size and faster to produce. 
>>
> ...snip...

