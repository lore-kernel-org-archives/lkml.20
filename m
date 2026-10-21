Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614620;
	b=XWBKrJpuYKj3eJwino37/STQmeYghQzf6yA7kOz2mlFQEQFDJxI+azvTzhhXtRX0fOGi
	 dfSoKnPqqg4u7sTqJe6O1z8m+WzjBIQrGQ1lH/fGbrpWYm0qouOBHRPdhAcDBqYOxPjFQ
	 0l1/WaTFy8K/ty+tPltyJvsk8vF2Zj2KhSvps5ktmmdrNKioFhpy9d/AZYHsEJTPT91z7
	 Z0zJqDZG09Ry25wEORFDlnRHHFD3T4txyFzhAJ5R6RnMsGQ0XaKZ4CW5AIJPhrUElgKRE
	 9PVri6R9iqT48GgjIWRogoAMaCv0ODEoXwkqvEksz0FonSXmPE2kCOLztaUf/7QpILw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1/Tn+NIx4tdDy1sazjm+66tf6KeWLd+iSCtDVa0loeg=;
	b=2bqwbvFzZQHn0PX0mPizcco8EsSUIQlBCFBuW4Xr9hGRijTFuzzB7b0eW94TWlTIeG1T
	 KBKXP4dK1OM1CWLnAf/xjpKkN6ywjgmWyNDPX0RETy80KkyjRopaF8lG5uwrfogi9uPxm
	 GxRnYWgxpIbpJrxr5YllX4xTyFuEcmH56ULHtOoOnPA/kvTlhM3IbutdZotYAeG21XJUu
	 XUkrvd1ytmlYd9kZ8HKz9o3llXeZxw4CHgMx1BH6oYsjvPyhtJmtTDIsscBf7Ef/lRrY4
	 QTjGOVba7ZRNQm3yA7eXw/s2fc8Xm0ng/53eLInJcB3hzzYjAlT2sgrHdZ+9VULnj7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NGztUjXB;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA367606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA367606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NGztUjXB
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso7598525ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792614619; x=1793219419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/Tn+NIx4tdDy1sazjm+66tf6KeWLd+iSCtDVa0loeg=;
        b=NGztUjXBKhQgYrXnfbtLvSf1T40pglhTVvHHVVL7AzdgZ0ghWMKeIwrdTCzQ/G5ec5
         ppkqnwGG5Flx3SpF7l2QzwmxIYbgGA5lUFvhwVNWAaAfIxRA6uME3XYS7nPjWAn4khIM
         0IbB7ZkFj7yc2ChLp2ZDi711Ni6ZBZC5W8k8oVbWqelkcGtX3qQXdh4NK3CBJlmTwAj/
         OyhyTNsBEmxbInnlxBwHWY5KvzkpmQ8db8PZbdItrOFg8g2MwhtpXpZqXbUD7kdHfMcd
         YWmHgc+gAsJEJV0DMlRegD3SV/BhDn0YvrWlbARJ6ATh/Q3Gd1T2rnyT6ZXIyEHsJsXM
         KbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614619; x=1793219419;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/Tn+NIx4tdDy1sazjm+66tf6KeWLd+iSCtDVa0loeg=;
        b=1dKhtvZ6O7IM2N3zE9aC6stKckras0kg9f00KRVNHj+aaNvpUubP/rAw/VFlSk8AI/
         3iRuXURTftEmd4JXGYyt27MwsdpR1qpaAc147RUAs0VDtaC/f1e3nQBFQCDO+RRW+ujr
         HmP0MqOTsugm/JkHjtkwA6O+UKN0eNPFEqgCdaqf9PxWYJnWD3vxusUSYM+0l/51TIlp
         DyP1MK9F/djqZ1emEKlDD7GHKsKh+emEyi6dvHiSjNBfEglkPwNhmnlW5Y5tYPQgV1fw
         mawwc7CvdKSW+LH7t/f+nirCjO8HeyQDAPXz6j7SL7LMIOhcDXlKFWdEd7cdMVUXxFsi
         sgkA==
X-Forwarded-Encrypted: i=1; AKwUvBwOGyJGJY5nMZk68nZGs7wFm/Lg+Os0PBIjYChN3eImEyL+u+cvgvMNihxwNXNr5zK51Fu3Mf71iFdb0lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0XZ62sM0SGmianfkOKMZ+kmjkS7ALg6ZUWolTBn/rMGMqpD9K
	HdRiefQmeHiU7hxnoVKJPRw0tfX/dD/ljekkkvTJJXBzetAbHKjknAUM
X-Gm-Gg: AYBFou209BN3pvjJ+MdRfqEnrhEOiqX1qidrv/hRHMA2WwLrEApoSVY/Fa6CqsZNCDC
	PiPDVEyuuu3w9sitBp8XNA2P5JBu0i7d9XI5hPJIO15BlccftzZuik3Ir+OPUnilGOqmnUs5NvH
	JvJo+aYcTdaozsETj4o+UJNRDv2PZfRzcmU0ZtUuU26KWX/aBHdpJeR6wQnf1VwvNtVoTQCBaZ+
	EbjNqPKbe1BIOXt4K3c6Oywkyp2IKl687FNnoh3MDSGwX3XX2Uol0SivczeA3BSBz2i9Ss73phh
	gnhOJtVtzQlEBOnmpEmbs1UrgdbyNq96LVef4MHigLqoNEeAuiL9Lc6hfE62/SGsUb9w+gie04J
	UzgIbsLQBUqMi4qH/Bt+HbaeQdA0odZSGAHO+wLdKyEveL6nfAnQx2Bcqh8Knp+1QJX/ImHpzqF
	5F/UrQ3m60f6puolKB5gB0JDhJifgOEtTVcWB3hu0ZdRs5lqqKkB3WvHTLiHRXcClaolVqBrra8
	AytAGsfeNSQKN9YR5KFNu+En/EkQ051DZzHOatQTDs7FujG4BPT2Ezwdu9x6jagHIlGDBHD/UE0
	dLFk7B0j1IxPFUd3Dg==
X-Received: by 2002:a17:902:d552:b0:2e9:7ff5:5459 with SMTP id d9443c01a7336-2ea439f4ad4mr28663555ad.15.1792614619097;
        Wed, 21 Oct 2026 13:30:19 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b49caa7sm15515825ad.69.2026.10.21.13.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:30:18 -0700 (PDT)
Message-ID: <e8f08d9a-8b67-4c7a-8ef5-1ed38351e499@gmail.com>
Date: Wed, 21 Oct 2026 13:30:19 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] sparc64: Use relaxed ordering for DMA_FROM_DEVICE
 mappings on sun4v
Content-Language: en-US
To: Stian Halseth <stian@itx.no>, Andreas Larsson <andreas@gaisler.com>,
 "David S . Miller" <davem@davemloft.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leon@kernel.org>, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013133731.1795299-1-stian@itx.no>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <20261013133731.1795299-1-stian@itx.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 6:37 AM, Stian Halseth wrote:

> sun4v IOMMU and ATU mappings carry a relaxed ordering attribute, but
> dma_4v_map_phys() and dma_4v_map_sg() set it only when the caller
> passes DMA_ATTR_WEAK_ORDERING. Some network drivers do, storage drivers
> do not. Without it every device write into memory is strictly ordered,
> which on a T7-1 (M7) caps DMA reads at about 280 MiB/s per PCIe device
> while writes run at full speed.
>
> Set the attribute for every DMA_FROM_DEVICE streaming mapping. Devices
> report completion through coherent memory or an interrupt, which stay
> strictly ordered, and a strictly ordered write does not pass the writes
> before it.
>
> T7-1, fio 1M sequential read, QD32:
>
>                        before        after
>    NVMe (PM1725, x4)   281 MiB/s     3169 MiB/s
>    SATA SSD (mpt3sas)  278 MiB/s      502 MiB/s
>
> Closes: https://github.com/sparclinux/issues/issues/114
> Signed-off-by: Stian Halseth <stian@itx.no>
> ---
> Tested on a T7-1 (M7) and a T4-1:
>
> - T7: fresh RAID1 on two NVMe drives, 192 GB fio crc32c write+verify
>    and md check: no errors, mismatch_cnt 0.
> - T7 and T4: file checksums on the SAS boot mirrors identical to a
>    strictly ordered kernel; no new messages in dmesg.
> - 4k random read and sequential writes unchanged.
>
>   arch/sparc/kernel/pci_sun4v.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
> index 61f14b4c8f90d..4dd17b65dd6cc 100644
> --- a/arch/sparc/kernel/pci_sun4v.c
> +++ b/arch/sparc/kernel/pci_sun4v.c
> @@ -403,7 +403,7 @@ static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
>   	if (direction != DMA_TO_DEVICE)
>   		prot |= HV_PCI_MAP_ATTR_WRITE;
>   
> -	if (attrs & DMA_ATTR_WEAK_ORDERING)
> +	if (direction == DMA_FROM_DEVICE || (attrs & DMA_ATTR_WEAK_ORDERING))
>   		prot |= HV_PCI_MAP_ATTR_RELAXED_ORDER;
>   
>   	local_irq_save(flags);
> @@ -503,7 +503,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
>   	if (direction != DMA_TO_DEVICE)
>   		prot |= HV_PCI_MAP_ATTR_WRITE;
>   
> -	if (attrs & DMA_ATTR_WEAK_ORDERING)
> +	if (direction == DMA_FROM_DEVICE || (attrs & DMA_ATTR_WEAK_ORDERING))
>   		prot |= HV_PCI_MAP_ATTR_RELAXED_ORDER;
>   
>   	outs = s = segstart = &sglist[0];

Tested-by: Tony Rodriguez <unixpro1970@gmail.com>

Tested on a Sparc S7-2 with a Samsung 2TB EVO SATA SSD.
No functional issues or major regressions were observed.

