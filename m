Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816226;
	b=WhrRP/GHD4mI06IshXdj/ee512KYj55nlzQ/Y8SxpAaGlTAu1vxnNjO25Lj0we7quy2l
	 d1KXc8ixcnX4wR6QLrtXLXrPLiXEOTVApdR6ZDEZyv4aw2FjlFy84FH7X/EEKnlc7sOUF
	 tLNfpsuOdwZNEzd3G31s3Op6QIH99nf8efDpmBmdUhasTsFSFdft+/CVur/a8+RPPHrXI
	 LrH/KtPONxyHEPNFTfQIQ8XB3tISUtKI+LNjnJdRnbVTK6klVfwvvIJBzt016dghiyHMs
	 fL+Gsfcq0QRcWezIu2FVrdF7wRDo4Gxnd5gXGBVlIdl1uLHpgLDZaFCR5ocalINfmAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816226;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=bLtDbnN1VHE+ADoqLmLIlJzENxx+1wvCpI3fUOziHnM=;
	b=gz6BZ5Lnce6RSlvqkCm5A592Ex69rzluQDDfeAxiy3SR6zwnG9d6TFclFmGrFc0TLz+s
	 I6rUkdVjf0dCDXtC0IcXeQd2+1j3fqhvv0B2cIVmezhBe8b5TTLg3FiFrnNfsscgDuWi5
	 IgYY+5EanxvnVQU1niTjcMf5Pf4DTcLOoSS8rizvHOWD/hPr4NO9WQT3zqcNWH7NTZ6td
	 jrltMEji/2xiPySuSQuFH5LR1Gfk8/5+8XuXO10jZ0IiTqTMgc9n8bRjoT7e1xC2N5ae7
	 tM3nJHSKL8MTUfKvTmpXneJGOstr521q2b4cM9oxVJaNuKGFw/HlX/Ag7+1xZRMitAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hcQnItgw;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81FF606D816
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81FF606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hcQnItgw
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f3c89594cso90932885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816225; x=1794421025;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bLtDbnN1VHE+ADoqLmLIlJzENxx+1wvCpI3fUOziHnM=;
        b=kIPbwHkfsqe4m+UTQAOdgsgH+eJazjT62lInOQd9W39iDdti37CdOpT8rTao5Uj4XB
         D8R15HWL0xri3GBsYIFtvYWwI8sGfI8uze8Fx0RkJmGMgyauMJYuywyuik/gUTQDfF/y
         heryOMS4UH2CJbeVLr1tfuihk8SXPID+ObSFEMswZKTa7BNf4bwXlqd7Ut9S7XHMLcf8
         r19CAw0RsS88arOCZKWgAak7TrY8TXJG5VA1+4QWEwdEAdHMZej8yXbuOjhUwjtWQWbE
         ASu+CqySm2qI+w19mx0fjgDa8bAwG0VO+OkVs/I6A830+cnWYBTYpOBWcJ/G2el3JHys
         VZZw==
X-Forwarded-Encrypted: i=1; AKwUvBzeeYQP/EqCIlN6ExnLInqDANNA6jYlxRLGQvFUC34PPBzPJQNEGkSv7GpvvFRBHyRxfaCyb59BuRz78GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ohGiNwTp7bleC32L0rDRlAruJfTwMukE6vevmc48msAB0vdPb
	rWBQ8h3ZlweqPfcLRSmjbzgHv+DSnDh989KvxKWjYd7wG2HhsdB7cFH+RQu+h9T+CW3LTSWMt1F
	daRDQlm6kCcy+c8VfRrnMsWAaf1wP+dTZ1TovUKAaeT5tuugJQ5OuSACyeEpCljWD3ncAGcwlSl
	8hESkrzBH8S8dZqfXVON4ZPhJeQ5IbT/bke/M46xREet8hH/V5RUgux3lirGRzV00q1Wy6vDAT4
	yqmNOtK1GL9MfxIAJAKTtQ1mVc=
X-Gm-Gg: AYBFou2GOE2+rY6hxelPdUHS7kJ/ub3ZNiUDketyl5zNGVNThpPlzrWXq201rZZpl9R
	9fCHaPNtmDq/mFnMoTW/nIIy/Sq76tyxhfFoqDiCqWl2yj8wIBFwNASChWkRW7cwxc2zz5wc+1b
	KUVQuxP95i53uu0xWILhgH1AGm6hXUwe5k9UC/veStE28lAEKYIlZhcoP65HBpqSSRbd0c9J1jj
	aVGpU+6Eok5At6d0oC5bjHM/o7JN4fvnfbzIHuWJ59F+lVj66/lHwl9Uc/wLJjsFpfIaNW0eAk4
	tbT7hkBIvxZTKGkpO3VBjH1PSmRoAgOj2UHQqWI5pyOoWwiURHCGITAYqm7NCqGqExpaLwwkV5G
	SvOy3y4eDrKFRPV9ZV4vk+Bqr618nPxiAnse+crr2v0TU3v4Cjt/WUeNo4/arnewJTT+jr4OIqw
	Jlzg2Q6jsalYz9tVMhYAmVst/fnsnP0RSR2B+0Unn+
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-9442171e25amr2831759885a.57.1793816224603;
        Wed, 04 Nov 2026 10:17:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-945d477e91fsm39296685a.9.2026.11.04.10.17.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:17:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7a26f892so22605546d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793816223; x=1794421023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLtDbnN1VHE+ADoqLmLIlJzENxx+1wvCpI3fUOziHnM=;
        b=hcQnItgw8S+799u1ibS6+lxx0vZ+BqHAOqDNpXOKcg1PT4kKVSw1cetu2S15UPs+av
         LoDWuud0E4DquEJUCu2s0/NmTmW10mPAZrBvuYPXz1nMDsXVR/oJoOwzgF/9KwpByfEv
         5BzckH0cK/8S8wMjatWpVFDDChqWZXceBVVWs=
X-Forwarded-Encrypted: i=1; AKwUvBwjrZEL+fX0figzakQdFemsHeAN1kIA6mtFRvN85tYK/UWR89/oM51+7aKWkFgs9OcOl5wvkzmhG+a72x0=@vger.kernel.org
X-Received: by 2002:a05:6214:611c:b0:91e:747c:f833 with SMTP id 6a1803df08f44-91e747cfbe9mr64271286d6.46.1793816223100;
        Wed, 04 Nov 2026 10:17:03 -0800 (PST)
X-Received: by 2002:a05:6214:611c:b0:91e:747c:f833 with SMTP id 6a1803df08f44-91e747cfbe9mr64270826d6.46.1793816222510;
        Wed, 04 Nov 2026 10:17:02 -0800 (PST)
Received: from [10.14.197.69] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e7146a1sm25250956d6.33.2026.11.04.10.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:17:01 -0800 (PST)
Message-ID: <ab9893c9-a874-4b27-b152-02fdef49ab33@broadcom.com>
Date: Wed, 4 Nov 2026 10:16:56 -0800
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
Subject: Re: [PATCH v3 4/5] bcma: add host driver for the BCM6362 integrated
 WLAN backplane
To: Alessio Ferri <alessio.ferri@mythread.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20261104-bcm6362-wlan-v3-0-e46562b2ac12@mythread.it>
 <20261104-bcm6362-wlan-v3-4-e46562b2ac12@mythread.it>
Content-Language: en-US
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
In-Reply-To: <20261104-bcm6362-wlan-v3-4-e46562b2ac12@mythread.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/3/2026 3:31 PM, Alessio Ferri wrote:
> The BCM6362 integrates a WLAN macro on a dedicated bcma backplane.
> CFE leaves the macro clock gated and in reset, the backplane is
> a big-endian peripheral, and none of the cores has a wrapper:
> gating and reset of ChipCommon and of the 802.11 core go through
> per-core control registers in a separate WLAN control block.
> 
> Add a host driver for it that:
> 
>    - maps the ChipCommon and WLAN control register blocks;
>    - enables the clock, cycles the WLAN and WLAN UBUS resets and runs the
>      macro enable sequence bcma touches the backplane;
>    - provides big-endian register and block I/O ops;
>    - emulates BCMA_IOCTL, BCMA_IOST, BCMA_RESET_CTL and BCMA_RESET_ST
>      on top of the per-core control registers. The PHY bits of
>      BCMA_IOST report what b43 needs to hear;
>    - sets the big_endian and wrapperless bus flags before scanning.
> 
> As for the PCI and generic SoC hosts, the driver is linked into
> bcma.ko and registered from bcma_modinit().
> 
> Add a MAINTAINERS entry for the driver and its binding.
> 
> The 802.11 core (rev 0x16) is handled by b43 once a SPROM is
> available; on this SoC it is not stored on the chip and has to be
> provided. In openwrt i use 6362-sprom plus fixups.
> 
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>

Very neat, with Philip's comment addressed:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

