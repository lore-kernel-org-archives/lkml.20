Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806711;
	b=21Qums6j8DHVgitgHrDMi4BFHvOSxeRVLU3FdLgMgEahQMwVB/5RGJ5lDnSahKaFITvK
	 L4W3pREhHs4TmOQNROBZZGjGyVr1ofN0Z5zvK2x2kUC3FY3daoS1SNGqEBVTv5zTh/zM2
	 YQKJgroaTLLUyekGriVzCsekX9WchEZHUr8Ks36uAM/aHtjLxyYpmcde9fAxKLilQUPbu
	 6YBprmPvDUhKKenBqO8blD6hMqlTdxKg8MxO9HxVzgcHKqYBa3AmcrhMDuPio8+Q60G6t
	 2A0tH4fHwRqtVLwGebujcPK9nsd88l8lh1V6K2mbJeyJRKsLVW0WWNQmpcKjTbSORvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
	b=wPOP0K9I/9nv5UCm4YVPDuLfmuFpiFdIB+xiIlZKejy+V2nMtraOZQ+W6KMmWPOkK3WZ
	 Pi0Xvdnne4DXBFP8y3f544G1iEuJz+krFFueDqqUcM2ue8Aa8dBqDTQsJ9e3ZtR60GTL6
	 JIkgQrdkDrGRR9Bk59Wc4Qk4Z4tPJcqR+/4LqOO9K0W9AYAZahuToC6yRKPhDN9fLe4Jn
	 9wOElZin3BuHlnWZk7bLfGh26QIpLnrnWn0LhGeaIH5WsdmncBFQGPd2ywOXfDyx+A8Tf
	 X8bXaBU7YcMbwUnYqFwgm+oJzVUTfm2rQUeC3eZ+BpKmHZKFicOiDSscpB2e4mfO3lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmcAGjN7;
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59639606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59639606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kmcAGjN7
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-4b4e4d13850so1801945e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806709; x=1794411509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
        b=kmcAGjN75d/L6lSX1ezkuk9sXECFR0lagd69BJFErdFPzj5Wd6MzDJkznzskgyMeKo
         4pc2wUOtFWSCx+ZM7robeEsZRfAFhSgfKwnGlo0JdaxaiZt7DuLRrynVt03JZYVLVumL
         X5IqXtfvQJsBgIthxecWwGD43ZeOw/Ufs2MXHUnjGF2rNu2E9ph0WvNmFfy/p8wxtmY0
         sXjYnlh1d2fRUktyqS/knL9WJctufsyfVuCaQP61+bjwV25GCYQemTJNvjJhOhU/YriE
         iNKscrKUxgllDyqIbJupqhe7PSccF5oKGdZzzombgx0Gbk/LvrRcPVG3DHB+lKm2kKm6
         06nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806709; x=1794411509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
        b=XG5Qni4jo5JBlXakOCXgMT0dCiwN8Fpy8HMBFthIiQoppi0RHenbRZnAuK4VLDheaG
         Td59xWvaPzommPim7oZCC0/aLsquRaQPI//fQBUt3p2BQOYGrtLQMy9EALECO0jS4WVC
         hN+Mtd7haif8HKuY4+MnOg15WHCwN8Aqk2+rYXCAEr//gjAGualfZ0bLQqaoRnc3SaR2
         GHuNTWfHk7aC+yQp7HZ3KhBIrFe+mbv+IxhUWi86ivPCblxhin6nVvSj0TaVdvIW5yL7
         7uRnfvVRwYLn7lDaCRBAmXOx5UVDcH8kmtdytBrc4FxfLSHIXwJ1GDnKrs9f3dSy+hPb
         uNfg==
X-Forwarded-Encrypted: i=1; AKwUvBzxgR+EOnGgG7QY+mKWutYzXFoZFnVpODA3G0B50u9diqm6mybKl75UKoki9sGtmIlVrrXgi3sQxi/IWKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mRDdizjJk7GA0vYf0Dj7g5h4VoTR7OSlR9bjWSNWc2dqmYHTs
	llLZedEyYCxkHSyhDv8akmHDwHNjodulJIEabugGbOeTLod37PoILboA
X-Gm-Gg: AYBFou1QLFIO1pf+drlApVhTqMAxEuL/euzJGCHPXyjCYNeIJAaIiChwjdmorZw13qN
	3xF0b1GnjnBoZd13FnhcBlQeqnm7c1BCnli/FAeJb11/Y4+KaV+EJhC4dMoOy7BbEUoui3m71Zp
	Q3U/IZ3QSQEmjhtvNxmCj4vu2TF121ojuEQ37Q7ISH0RKTd20RA0Z5KrvGo7Mw81qM1B0xUrZ1b
	IAK5BFKY4gkGUCjGcqpfitgG/8g2i9skRJFGyQOF6gkkWMM1cN+QC8OoHl1vktHKnh6I88aeqY1
	hEZWcZUQia1xnBCmGWZxEs47EZGwtoi0I61/1OYdCjQAZK2qSIuFW1saV6IKNy4OINYaX7Ax+8j
	pPKkUW6d5ot36G9iOAJmzVTGZGOJTDYONSTUk32Usai6lXhck/TGYDrpKI9IsnZZcqtDrgWgoNu
	XQbbJla3le52T679/xt++2L05EbOf/VSLBIAcdIflZt9m7CU9adcNwCz9565wQD4C4VbJ5oE+9E
	0AK+bgXe/42d1uGDZRiWDur2n4uuk8rucJF3plj19Vm2dZK+gOCC05DzRWtw6GINtrvIY4dqfr9
	n7tBZQv2v76Urr9BoiKMz6NinADM/+6xU5tMVh8X
X-Received: by 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr394129375e9.21.1793806708283;
        Wed, 04 Nov 2026 07:38:28 -0800 (PST)
Received: from [192.168.100.182] ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm89849875e9.5.2026.11.04.07.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:38:27 -0800 (PST)
Message-ID: <496706c6-e15c-43ab-ae0f-6230e098dfb2@gmail.com>
Date: Wed, 4 Nov 2026 20:38:23 +0500
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
Subject: Re: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Alex Elder <elder@riscstar.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20261104140750.761330-1-alitariq45892@gmail.com>
 <DMMHM7OIO97H.2SHNC575QC4PY@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMMHM7OIO97H.2SHNC575QC4PY@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 7:14 PM, Troy Mitchell wrote:
> On Wed Nov 4, 2026 at 2:07 PM GMT, Ali Tariq wrote:
>> The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
>> control logic register, which causes controller to reset itself once
>> PERST# signal is asserted even when acting as host.
>> On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
>> the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
>> runs again, its first DBI access hangs the CPU.
>>
>> Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
>> in k1_pcie_init() before enabling resources so controllers
>> dont end up resetting themselves when PERST# signal is asserted.
>>
>> Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
>> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
>> ---
>> Hang log: https://kernelci.cloud-v.co/scheduler/job/420
>> Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
>> ---
>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> index 92a71ea90ac3..af6028e8825a 100644
>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> @@ -47,6 +47,7 @@
>>   
>>   #define PCIE_CONTROL_LOGIC			0x0004
>>   #define PCIE_SOFT_RESET			BIT(0)
>> +#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
> A similar but earlier patch can be found here [1]
> 
> Link: https://lore.kernel.org/all/20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com/ [1]
> 

Thank you for pointing.

I missed that. I will check that patch.

You can drop my patch.

Regards,
Ali

