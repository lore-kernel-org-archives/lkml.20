Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121562;
	b=aAlej8efzZVnGgzY1usJB2UG0MyUa6bem9MrPCigf7l53dlaXmT/G0jE0MmOItPn95fZ
	 80m2r2QDYouvoL61kKUDw/PaTVA1Yw7Qxr1s9VibbhgmvLKYMKIM64+OU3yywb2KE+z7S
	 1oJsFtcvO1NTDh4y0dDl7wQgEVlp7iGHVCbQcJO5dOhAIrndIfv0kQilNH/8mbTMorb8U
	 I1a7uwj0l7fPYSH7wvDhclXFBzKJ06E+P4WQwhz17/4+VgPhdJQMfME+qFk5RYb7W2IRL
	 ndpb11Y11WCznFhf31xrmi/USjRv0qqDphizECvQxEIlUoxiGpc2sSMorQh6xVvtFvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121562;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=99IwRrIIEaHMFF+rY4borg3F5L+N9Ajlog9GGweBEts=;
	b=YKQt6grGZcKjPb3PdZoHTuA7RGtX0BGwtrg4wjm+d1QiTtWBWITjXjNXGCQK2+oeAWkG
	 mosXLvvveoVUjSsWGEQpwN2c3kHDP+xjchE+AoSPSW5R8/voG0eY927pDQxWYmOpf9ULY
	 AMT6r3HfLAoMPVDOCqIX5Az0UB6epK5J2Uii8sd5CrQUARqZncQ+vmZKcjVuWTNpU3CoT
	 uvrW8UjEKgwPXUaUOe5T1rkVHwblauEkKyY5ZR6sUc26K2dCETRE6PPbbz6Vmh1Rkwyvv
	 DDjtwOLjpBek/S2lnKwgt4NicrSu+1uZsV1TAAcoiF/597Wa6r3iYXkZYI9xiTJAHyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VV5EKrin;
	arc=none smtp.remote-ip=209.85.219.98
Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VV5EKrin
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-91b52ba422cso1531486d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121561; x=1793726361;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=99IwRrIIEaHMFF+rY4borg3F5L+N9Ajlog9GGweBEts=;
        b=oCA2WdKsQoFbh/5T1yd8LIrtcvGxtf2ZBVHDGqvPv20xGwTu1Xyt+n1cwDJxtS+cgj
         zpsSSNtyvljvqM9mMN+7SqVuisNFQgcCv3O6bj4GgdHlLb6I+khougRPEL6QL8ikJpWY
         9x5beqcktIac2e1jzkekwrKCRIt2REsJvHzqJUryCOlIFOyx9JI2rYlPFvZV043N2P1+
         +B0KBoaHhrJ45paFgnupr94/Fy+Eowv4t0iJAIpPOj7hXsf8rLR6t01HjMScVDyE8bfk
         z6McPyjvLOzLIMOt4LQQ8gXFp4j3MqekiXnhvQEgirFVuipeFqwvusZsqDcXoqone/HJ
         Fq8w==
X-Forwarded-Encrypted: i=1; AKwUvBxr0WqZmJndtMQvWgC7CU71JFcllZAjAMGeOd0L3Fl1aY7zqH56gPDZis3F3Wml7ldYcC0jWLmbJ/+thSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL75IGev5YdmbU/n+1ildUpRtldQK1O83LK821NIzUWlbqM/4Ss
	sVZz8c9op0CafOjFoeg3/qLppjQdxFoO/I0YFmRyMqzOPdjF4VmtyFv7FdgI2TVWkE9tzN0sbu7
	VPxv07FGRCtwNm74ZYyPo7V2YUaLZEm5cOkIdBB0KLqQoh2fRNo6d/7EBusr/YIRLD2cH37LrbK
	7NXlXP+sxOE781nEH+d165lgg61DHMMJvotjF4ZvRwSChX1m8/LxtTbhf3wa0NsAXsgItIl8smd
	159MhuPjNHw7koAEZfapHtcXKk=
X-Gm-Gg: AYBFou1bUeqe3a9KoA6/S6M2LxF8DR+0RTq7+4OrN1qCF5IVV6Ijj5567TuRqlVbCFN
	KHppfYd6u0mEqxvyiChydjx9rTv9M1vck5W4y1Z6J0NlE50drcLiyR9+o0tjotBHvgPNIbBqv+B
	j+DAiBFfU/sf+eyfyoNZQkI1+bPPn0zew6byhaPucDPXMBLRyPlNO0y5NmVedNkwN5mNRuGAPFV
	AA+QqRX4eLudALfj2ek7cqc5uT26uEsrZbcpkLl/QmGXXBukinaF8CpyP9fyjEJ0tMYZRqXTfNH
	ANcCmM1zxVb7YW0pENl9ZxcZ0AnZgPByiA0SmNn8KeUspcddzHNDfFuGjlHT49dvnr7ucuCyRiL
	W4Z4sDfBo0YzvT/M2CTYKMDRNOog/pfzlnL8PPgXfTg8qZy24cKfRXc2GpNF6U8+nMQqKrtB0pC
	CI5Wu+M6CAb5C6IdSuAeqTQIddfICHm2Bf9RouA8EP
X-Received: by 2002:a05:620a:4153:b0:93e:c12c:f13a with SMTP id af79cd13be357-940ef930073mr1656941485a.68.1793121560984;
        Tue, 27 Oct 2026 10:19:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f068ca93sm157422385a.12.2026.10.27.10.19.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:19:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b92acedd9so1877396d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793121560; x=1793726360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99IwRrIIEaHMFF+rY4borg3F5L+N9Ajlog9GGweBEts=;
        b=VV5EKrinqzJ/tw/mRSXgjW5pZV53LXpbfhxah4MS24ZMalhLUBJAHGOQiHm2VL+8nj
         6gcyhq3r9Xl4RsZ3VsY8HsUG/o+NthL83XOe9PsDVR+RfnlAdrs0YunP+XP8+9kCfiLo
         aiv9EV+XW8YZE+zliHb2tx5kzXgPyT/qGg7+I=
X-Forwarded-Encrypted: i=1; AKwUvByO6QBbDRaC7mX8VqvmS823UelbCLrsKPNPcvCsP/aXKICmAMpQzvr+F5a845fRBinwi98gXxGbDK2OSro=@vger.kernel.org
X-Received: by 2002:a05:620a:4155:b0:93f:3391:d5a1 with SMTP id af79cd13be357-940ef947dd9mr1698502785a.75.1793121559808;
        Tue, 27 Oct 2026 10:19:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:93f:3391:d5a1 with SMTP id af79cd13be357-940ef947dd9mr1698495885a.75.1793121559363;
        Tue, 27 Oct 2026 10:19:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a982d6sm1012057185a.43.2026.10.27.10.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:19:18 -0700 (PDT)
Message-ID: <8ef10868-b203-4846-bc47-2d046805e1d3@broadcom.com>
Date: Tue, 27 Oct 2026 10:19:13 -0700
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
Subject: Re: [PATCH 09/24] serial: 8250: 8250_bcm7271: fix DMA address
 truncation to 32 bits
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Joshua Rogers <linux@joshua.hu>,
 Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Tony Lindgren <tony@atomide.com>, Rafael Gago Castano <rgc@hms.se>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Peter Hurley <peter@hurleysoftware.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Crescent Hsieh <crescentcy.hsieh@moxa.com>, Frank Li <Frank.Li@nxp.com>,
 Sherry Sun <sherry.sun@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Robert Baldyga
 <r.baldyga@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>,
 Kukjin Kim <kgene.kim@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, stable <stable@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
References: <20261027-tty-llm-v1-0-99b0202ae546@linuxfoundation.org>
 <20261027-tty-llm-v1-9-99b0202ae546@linuxfoundation.org>
 <auC-_1Er0Kp-Wq76@ashevche-desk.local>
 <993d16f4-c8e6-4896-adf4-f7f36d937152@broadcom.com>
 <auDb57N7KCqaTWW0@ashevche-desk.local>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <auDb57N7KCqaTWW0@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/27/26 10:14, Andy Shevchenko wrote:
> On Tue, Oct 27, 2026 at 09:41:17AM -0700, Florian Fainelli wrote:
>> On 10/27/26 08:10, Andy Shevchenko wrote:
>>> On Tue, Oct 27, 2026 at 12:06:35PM +0100, Greg Kroah-Hartman wrote:
>>>>
>>>> The local variable daddr is declared as u32 but assigned from dma_addr_t
>>>> fields (priv->rx_addr and priv->tx_addr), which are 64-bit on ARM64.
>>>> This silently truncates the upper 32 bits, causing upper_32_bits(daddr)
>>>> to always produce zero when programming the UART DMA descriptor high
>>>> address registers.  Change the type to dma_addr_t to preserve the full
>>>> DMA address.
>>>
>>> Since this value goes to HW, it should be u64. Even on 32-bit machines there
>>> are possibilities to cover a bigger address space / DMA space.
>>
>> That is one way to go about it, but since the size of dma_addr_t follows
>> ARCH_DMA_ADDR_T_64BIT, we could also take this patch, and also make the
>> upper 32-bits programming conditional upon CONFIG_ARCH_DMA_ADDR_T_64BIT.
> 
> You never know this. The use of u64 is simple as that: it goes to HW as 64-bit
> value no matter what. Note, in the past we used to have a problematic use of
> dma_addr_t exactly due to its dependency on the data bus size when programming
> HW, and hence, based on my experience, I hardly recommend not to use dma_addr_t
> in this case, use plain fixed u64.

It's not a hot path where optimizing for bus transactions would make 
sense, so I guess it's fine to use u64 and have the two halves 
programmed accordingly.
--
Florian
