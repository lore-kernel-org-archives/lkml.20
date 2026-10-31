Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793474629;
	b=WIgwUCTi5So+dFUBQnvWBUNL8f6FmU1al/DcbG9sZjKQrxkJaJGIOzRXguTwwyWZRygI
	 eGobi13ryLtD3rQFHWRCy6a5cgffNGOHVB2yltNRA67apSVismOWKBXHdzaWkmoAJj8jN
	 uI8oQkxY7NPBr1VumDuVyq0Mf/imEqF9OSZ+qGBgeaojzcjLBibbPNgdwzTW+fbgMUjKU
	 HwGr3H10u7bfzWBE7BeG1Bi/xSZolREIc/k6FANsp71gtTZRDtyTbqJe9ouwJ5js6Kp5b
	 5HcyitdQXuEacOduK03aAwuNyZP6fX0Oir3kWOPjyif+1NIVkdwCardfqf4OI00si+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793474629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=qee3FwDn+lR4Rdz4X353Tv1A8/aooI3LNRhrS8wuqjk=;
	b=TzfB1iJI6+hhgygEloDi1uOuvHogcQMvx8CpPNhH6iq0bCmYDcP/SZtKK9RIN4miIytD
	 TcfgwcA+FgkE1MfDrO5GKxOk6k5Juje1HvO23MSeilj0cXrM6Sos+v1XYmFJdWsDGE/tD
	 Q9AngSJGdf3WSStfOY/x/vsQWzVkLtNjb3xtxDzlXie3kwq0XNBgTp/BiyuWyKjNRv3Np
	 dl229YH3typ6j9FcK0TJKAbEakRZT83YimCa1P/0j84kNrnV6xYq+JuFCyq3iTq87RaEP
	 cTCgXVLBOdFnhpI31OJnKeGPw6aPrG7LGa1jpK/HVKLnlwa/p7zPI95GvNpZlGCPcLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Aam5o7a8;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A286606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A286606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Aam5o7a8
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2eb0a52d605so38705ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793474629; x=1794079429; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qee3FwDn+lR4Rdz4X353Tv1A8/aooI3LNRhrS8wuqjk=;
        b=Aam5o7a8hUW4mc8284I69mOwmhTF493/rFhQuGGspiyeTybiS/cluWSoa64PtfbBb/
         ABnWD2HlOW3xv0edtXq3OAdDmMk80Npd8dsL7UrCg1Yh4uB+WEEqi+jxIHRJwDOixemH
         Mq52MZLQpfPDBeVW1lrO+V5tH87YOpccoeXNTLh4/CkK+WNvDbQ/+5m2X3Flhe+/l0V9
         ObA+I3e5BCPZ+E31xJyEcze1c9VYcKTy1Zxe8p1398Ak8gTmleOTi5TUdg/Miyg7+VCe
         X6PnNisIE0Xr7uFBONgsRs+S7ZWawVGABpOc0adz9V3eNQ2yZIfk/Z6/a8IM7oHCFoZZ
         Y16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793474629; x=1794079429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qee3FwDn+lR4Rdz4X353Tv1A8/aooI3LNRhrS8wuqjk=;
        b=f2k5oKW4KRIe+wEf/xlVsVpZwZM9DprSJsHOMKfA0XDu/5D7bR0MXi87RPEg8rrHJY
         HHv8qaa9Ng2rGXgTiAPtJ4CtePzI5mZJHogrMIfq8JLyo+AqQ0hJiw3LbiiNmE8pgHoz
         Xl1rW1+Xjn+6c432Q2wUy5rgyLUcjHs5olAHHZvdHSEnvbaaV2L3mPB8f0aAZhZUkoCP
         0tOByTbPT0/hXvOtTfd9HnvuFmLt0ktWAU9RhV/fh+mC2MBYOqVcXoy+XL7Qe2P6Ne4+
         eSFbqPtuweICkpnmPZkhhmAY45fxq2uNN0QdFqq5U7wDGd++NOsmmhOz99SNC5feXrDl
         s27g==
X-Forwarded-Encrypted: i=1; AKwUvBxN1ZhZQwxqpqLf2V8wXcQ8eXoN2CDHygobgwUUHPFw2e+R/SjXO7omnJoFvWGfDiATAxzD5Igz/y90Bjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAuD1ZgHzCSWoz1XP9zVOSDJHbT2SYR2pX98wgiiK0AuDBoyqT
	VyVr0AOA9wIdi9WqCarSzUBmIzxwm6qGFD40vnmoTA/1BYijAck8R5TU9Q8ooi7iEw==
X-Gm-Gg: AYBFou1xO3A2nhYFVWGEIi10VTAsIMmUOK6Z/g78yLiCcQNca8mzMMUih8iPQgKasjZ
	XyhLR72M1a1x2RporY3mW9IAvdDE7kTcvdqFXLQtBFUFoise0/ZGMYbPOx2rKcZdPV0WhkWjc42
	Hup22zduGoNKsPImL8ZbqYvs5Vsp022h2UYAIlGbw+odSR3rcFIfKdxyJb1dWnF5hs2midZNW0X
	5gyj0UkCN7ZSc8fuMngUOSVXFqImFaajmOsULBCjhJr+jwPagF3w+FW4QFDoyI78wTdXcJmxQRj
	NfCNR8SGcC23vsKxy2kti2ZmGk0XZ+AySuH+R2MsPDHQgRnkc6VVTHOhxJPoeiHDZ5puMwcdcpC
	T+aJElA/xGXF62Vo0OfHoDQf7cZi9njj+BxcxuNFscX3QWC5cfFtlvrA/qAYJJhzrV9CgMY6kvE
	zOsuJHAlVpEpLdfi4q7p9XkMoizvesBaraFlJnPP8/YzR96tj1Rv1+fZOriWOVu/i+kzi+RXCgX
	baxBHrVQl5c0r3NeOSoR7/g+EIRdgHy9+w99V823sUEGGEA6O9TGiYGg345Fy5y3oYXLjOKDkU+
	xCN8YBpkli0+4xR2ejq5Q2ci5AcGU9heGpNHPYYu+bHgl8POvfP8ymBFiFPVI1uEzIpkumG5101
	f63YcBDPr0RwuCfIylrN6RA==
X-Received: by 2002:a17:903:3c70:b0:2ea:4a1:e8a4 with SMTP id d9443c01a7336-2eb1b8c029emr17347455ad.13.1793474627935;
        Sat, 31 Oct 2026 12:23:47 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb1ddsm12878243a91.5.2026.10.31.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 12:23:47 -0700 (PDT)
Date: Sat, 31 Oct 2026 19:23:44 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Woodhouse <dwmw2@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Subject: Re: [PATCH v6 05/18] iommu: Implement device and IOMMU HW
 preservation
Message-ID: <auY_eWa6J567s1uU@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-6-skhawaja@google.com>
 <df75f891-05a0-4d47-8705-d6a00c81ff97@linux.intel.com>
 <auTzN4NWuKsBvIZU@google.com>
 <51b23019-8ac2-4f6b-9be7-29f3635b472e@linux.intel.com>
 <auVfqaDhk25JUkYd@google.com>
 <7b059c0e-3b60-4d8c-b7d2-7dcb89a51c6f@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b059c0e-3b60-4d8c-b7d2-7dcb89a51c6f@linux.intel.com>

On Sat, Oct 31, 2026 at 01:27:05PM +0800, Baolu Lu wrote:
>On 10/31/2026 11:39 AM, Samiullah Khawaja wrote:
>>On Sat, Oct 31, 2026 at 11:04:22AM +0800, Baolu Lu wrote:
>>>On 10/31/2026 9:45 AM, Samiullah Khawaja wrote:
>>>>>>+
>>>>>> #if IS_ENABLED(CONFIG_IOMMUFD_TEST)
>>>>>> void iommu_device_unregister_bus(struct iommu_device *iommu,
>>>>>>                  const struct bus_type *bus,
>>>>>>@@ -626,8 +668,8 @@ DEFINE_MUTEX(iommu_probe_device_lock);
>>>>>> static int __iommu_probe_device(struct device *dev, struct 
>>>>>>list_head *group_list)
>>>>>> {
>>>>>>+    struct group_device *gdev, *gdev2;
>>>>>>     struct iommu_group *group;
>>>>>>-    struct group_device *gdev;
>>>>>>     int ret;
>>>>>>     /*
>>>>>>@@ -661,6 +703,13 @@ static int __iommu_probe_device(struct 
>>>>>>device *dev, struct list_head *group_list
>>>>>>         goto err_put_group;
>>>>>>     }
>>>>>>+    for_each_group_device(group, gdev2) {
>>>>>>+        if (dev_iommu_has_preserved_state(gdev2->dev)) {
>>>>>>+            ret = -EBUSY;
>>>>>>+            goto err_free_gdev;
>>>>>>+        }
>>>>>>+    }
>>>>>>+
>>>>>>     /*
>>>>>>      * The gdev must be in the list before calling
>>>>>>      * iommu_setup_default_domain()
>>>>>>@@ -697,6 +746,7 @@ static int __iommu_probe_device(struct 
>>>>>>device *dev, struct list_head *group_list
>>>>>> err_remove_gdev:
>>>>>>     list_del(&gdev->list);
>>>>>>+err_free_gdev:
>>>>>>     __iommu_group_free_device(group, gdev);
>>>>>> err_put_group:
>>>>>>     iommu_deinit_device(dev);
>>>>>>@@ -3543,6 +3593,26 @@ bool 
>>>>>>iommu_group_dma_owner_claimed(struct iommu_group *group)
>>>>>> }
>>>>>> EXPORT_SYMBOL_GPL(iommu_group_dma_owner_claimed);
>>>>>>+/**
>>>>>>+ * iommu_group_is_singleton() - Query if group contains 
>>>>>>exactly one device
>>>>>>+ * @group: The group.
>>>>>>+ *
>>>>>>+ * Return: true if group contains exactly 1 device, false otherwise.
>>>>>>+ */
>>>>>
>>>>>We discussed this interface before, and the consensus was that such an
>>>>>interface is not feasible, because the membership of an iommu_group is
>>>>>not fixed, given the hot-plug support of buses like PCI.
>>>>>
>>>>>I am fine with the usage model of ensuring the iommu group of a
>>>>>preserved device to be a singleton, but I don't think we even need such
>>>>>a kAPI. It should be handled case by case.
>>>>
>>>>The iommu_group membership can change, this is why we check it in two
>>>>places, both under group->mutex:
>>>>
>>>>- During preservation we check that the group is a singleton, and check
>>>>  again after setting device_ser.
>>>>- During probe we refuse to add a device to a group that has a preserved
>>>>  device.
>>>>
>>>>So if a device is added to the group while we are preserving, either the
>>>>probe fails because the group already has a preserved device, or the
>>>>preservation fails because the group is no longer a singleton. Could you
>>>>please elaborate what you mean by handling it case by case?
>>>
>>>I am fine with the singleton-group checking logic you described above,
>>>but I don't think we need a helper like iommu_group_is_singleton(). It
>>>drops group->mutex before returning, so its result may already be stale
>>>when the caller uses it. That makes it easy to misuse in the future.
>>>
>>>I'd prefer to open-code the check where group->mutex is already held, as
>>>iommu_attach_device() does today:
>>
>>struct iommu_group is private to drivers/iommu/iommu.c, and
>>iommu_preserve_device() is in liveupdate.c, so open coding it there is
>>tricky.
>>
>>You are correct that it drops the lock before returning. That is why I
>>recheck the singleton state after setting device_ser, which handles the
>>race.
>>
>>I was thinking of adding something like iommu_group_lock() and
>>iommu_group_unlock() for this, but the number of devices check also
>>needs struct iommu_group definition.
>>
>>To avoid misuse, I can add a comment on iommu_group_is_singleton() that
>>the result may be stale and the caller must recheck. What do you think?
>
>I would suggest something like this:
>
>size_t iommu_group_device_count(struct iommu_group *group)
>{
>        size_t count;
>
>        mutex_lock(&group->mutex);
>        count = list_count_nodes(&group->devices);
>        mutex_unlock(&group->mutex);
>
>        return count;
>}
>
>and, add a comment stating that the device count may change after the
>function returns, so the caller must recheck it.

Sounds good. I will replace iommu_group_is_singleton() with
iommu_group_device_count() and add the comment.

>
>Thanks,
>baolu

Thanks,
Sami
