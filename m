Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417985;
	b=rSOhmL3x3AitCC8BHkH3ygacSBesqTzAIM30rXKwOXH/DySc5+f5LSINa7gzky2rdsML
	 49uGz3NDa/FUfVWv8nDMUm7pL3hmAOOwRbSgOvq5G/tAwVE6zEg6RzRDeoCHn9jkyzEtN
	 lyxL02wjiJMdYsxvuIr84fZugKtbO4KoWEWF2vtqqQoZIyU+9VUptQn4SkkCIaehf0+aw
	 YJgFiEr6JfPhtYCdFKHIuEWvgDfXLSfHDOrtnGbvfhN7IHnIHh+/AWrxxlAHqVDwQHfFP
	 awgKWQRNFGtKIPb6debFWc3NuKm/Ncc1ECAmZPhIvnQQaiy/OdBRxNB2M7zr1qTJamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=NXyWjDtz5Zwj67m+4i2xpy2FHpW9IbWNwHkPcCAx9Qo=;
	b=WDiSHRMthanECtZZjUP9m7fNaqAALlQI8OM+zANu8ASda+Csnh3QEBVtv+5jYGTf3DaS
	 LIPt37xJSb776jZZpeO+rBX5+Xt6bydDA2ujLDOskp+Dj212TjMsR0+CMlovIHtrWc9Ju
	 TPnL9qJyclgFOFZlDhRYPUqsl+J7PCgrNFKK/goJVsuxf4CuG1FF0ytZd/pl/RtRZNGfg
	 ZctNhCxwoyMfeOLqwbGfMFGzSomcrlSyD3HKY6mPu9kmLdRcbkntch8Vgx9oPrrmzPgZz
	 66hUHElMvng1VW/M0Y7ND8kt2xDGav/3wdL0PlVy4Tk0nzwR4LBVlOm7v1atSh37CWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M2eEn+xk;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E06606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E06606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M2eEn+xk
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so28245ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793417984; x=1794022784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXyWjDtz5Zwj67m+4i2xpy2FHpW9IbWNwHkPcCAx9Qo=;
        b=M2eEn+xkW9HXdrnGBVCPoD0ATd230Y9lo2N46HE9du4xBUIn0CB2r8KZWRIq5OOU/B
         0VnD3VAOuTN+hVMgmmxxcDq8qAZvj1XV8yTnOnUSPrp1Bdf03E9b9MUAAEXQUygT9Tmx
         qJYakEgHBxoGAHmPOVurWLcN/iFC8of49wIZyMgC0AMa0kqST0t3wI+nM8LqU9F3+Cle
         pk5c1pgM4DA5ABRTcW0FA2xwp/Sg0jFNkZZVOCD5D8kHQF+C7ZVsQDlyBYRMqtLZrf0L
         IqRJNBtaeR3ZUYDIXiPsQFVxABgtSaBDMKLF3pwDwLINmLFCtSepOuGMdYA1T4Q2R0tl
         llrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417984; x=1794022784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NXyWjDtz5Zwj67m+4i2xpy2FHpW9IbWNwHkPcCAx9Qo=;
        b=cWuNnhZlZDjxUzzewcXfTQjrbswvQbGmRAlpmlG55CFDpIK3s9s9nzoM5ojIXazXgQ
         kPIrM1uYBxzkNwdA6x4c5J5L7hfrdP1wpilsX5rSZkhgYoCgcHrEe6ZsGikvkZLFtxh4
         Sdh73ejSKGX4h0YfJlIQqKAKJK5nDFjuyrsINARMdc6UgUznAKTAKTJAFLltmKCGrggs
         I/FI+eBgHakJScLSP5id8dh5mgklsMwbAJiBqI+6KE50+GvkYzYKKPfMfFCoWYOF616I
         p0l3IyDfKl1yg/imGWMMagP2xhfc4UalON2xSh75K64ljgCKEXykkMTYmCLUtdFCUhGf
         YI8w==
X-Forwarded-Encrypted: i=1; AKwUvBx9DNSpo5JOQQUX7hmknZUXa+qEeSceJVYs5xxJsW4z7iDSUUdFqE9Pib4tTd77Qng3njAhZ9tdlsm9bM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCeVH74/1W/ILVvGHDWXpZ4EcETYHk3EynWqLOa37PyvWEZ93x
	Vmwik0Yf2i7Qh7eDhY902yzmBhaWVJTk9CzC4Zvrma1w6qFM4v4oXhZ5d8GrTa/kFw==
X-Gm-Gg: AYBFou3cQJlanL8SpV7mCWOzk1BV6jkdnX2W5AfjvcJRsSsxfw1HmED92vST+jfyWi9
	Xs7sO0wMrDMk4Mdi2l5TIS0zg677F/BA9/eNhyk0+3cNyrxn4ThAkHXbN9VbMtTaP4k3W1BQ/wU
	MWtrCvkVHS8eAbKTFb2SLRSQxeda3M+F5+kgfH0zF4y9srcKOycZgAdwlLvd1uKFrSAXFQep++1
	+Jt6bfqKsZA8MOzHdaEZZSSOYVm4Gs3cOpr+m4M8+UW1OgL5qTkVKJo+KrXtR8jNwio41rpbRkC
	SsdA1z0CL489gJaz/9BSZse2ChqeykW+UukdMfa71LI5CuCKDtkUq7W0WQ09E64LaMpnCS96MRp
	MiMGNQOwi67GNtoxntk0ydpwB9rOg2dHb/qXog6+jqAoxCPghy626L+jVYh6kHgP4aOvA6pEuXS
	IdiTRfrCPqJeHLCfe6RGe2YdOZNT30bZk4XN8lLV6QPyUZqhe4Ou4ASlIOAghvtWeX1yU6PjAjd
	ynGVPRtEprHh0I060pSZaJqOD9bW8w/N0mrEHfqyCKwQEnOSCovgI8Q6nWvYbgpuWwmqOe1cCia
	aJFSoSTVILrsNPdmd22ojDkxM1YKwLG3mqcJnAYEDsF9BXtOyBMbhNMRjiTSRecmPFoTFuqE0mq
	Wz6ckBmPXj1gHhEmQ3cE9NUo=
X-Received: by 2002:a17:903:3904:b0:2e2:d665:6ad8 with SMTP id d9443c01a7336-2eb1b81b9e8mr15045105ad.4.1793417983213;
        Fri, 30 Oct 2026 20:39:43 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9583c1sm11236719a91.10.2026.10.30.20.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:39:41 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:39:36 +0000
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
Message-ID: <auVfqaDhk25JUkYd@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-6-skhawaja@google.com>
 <df75f891-05a0-4d47-8705-d6a00c81ff97@linux.intel.com>
 <auTzN4NWuKsBvIZU@google.com>
 <51b23019-8ac2-4f6b-9be7-29f3635b472e@linux.intel.com>
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
In-Reply-To: <51b23019-8ac2-4f6b-9be7-29f3635b472e@linux.intel.com>

On Sat, Oct 31, 2026 at 11:04:22AM +0800, Baolu Lu wrote:
>On 10/31/2026 9:45 AM, Samiullah Khawaja wrote:
>>>>+
>>>> #if IS_ENABLED(CONFIG_IOMMUFD_TEST)
>>>> void iommu_device_unregister_bus(struct iommu_device *iommu,
>>>>                  const struct bus_type *bus,
>>>>@@ -626,8 +668,8 @@ DEFINE_MUTEX(iommu_probe_device_lock);
>>>> static int __iommu_probe_device(struct device *dev, struct 
>>>>list_head *group_list)
>>>> {
>>>>+    struct group_device *gdev, *gdev2;
>>>>     struct iommu_group *group;
>>>>-    struct group_device *gdev;
>>>>     int ret;
>>>>     /*
>>>>@@ -661,6 +703,13 @@ static int __iommu_probe_device(struct 
>>>>device *dev, struct list_head *group_list
>>>>         goto err_put_group;
>>>>     }
>>>>+    for_each_group_device(group, gdev2) {
>>>>+        if (dev_iommu_has_preserved_state(gdev2->dev)) {
>>>>+            ret = -EBUSY;
>>>>+            goto err_free_gdev;
>>>>+        }
>>>>+    }
>>>>+
>>>>     /*
>>>>      * The gdev must be in the list before calling
>>>>      * iommu_setup_default_domain()
>>>>@@ -697,6 +746,7 @@ static int __iommu_probe_device(struct 
>>>>device *dev, struct list_head *group_list
>>>> err_remove_gdev:
>>>>     list_del(&gdev->list);
>>>>+err_free_gdev:
>>>>     __iommu_group_free_device(group, gdev);
>>>> err_put_group:
>>>>     iommu_deinit_device(dev);
>>>>@@ -3543,6 +3593,26 @@ bool iommu_group_dma_owner_claimed(struct 
>>>>iommu_group *group)
>>>> }
>>>> EXPORT_SYMBOL_GPL(iommu_group_dma_owner_claimed);
>>>>+/**
>>>>+ * iommu_group_is_singleton() - Query if group contains exactly 
>>>>one device
>>>>+ * @group: The group.
>>>>+ *
>>>>+ * Return: true if group contains exactly 1 device, false otherwise.
>>>>+ */
>>>
>>>We discussed this interface before, and the consensus was that such an
>>>interface is not feasible, because the membership of an iommu_group is
>>>not fixed, given the hot-plug support of buses like PCI.
>>>
>>>I am fine with the usage model of ensuring the iommu group of a
>>>preserved device to be a singleton, but I don't think we even need such
>>>a kAPI. It should be handled case by case.
>>
>>The iommu_group membership can change, this is why we check it in two
>>places, both under group->mutex:
>>
>>- During preservation we check that the group is a singleton, and check
>>   again after setting device_ser.
>>- During probe we refuse to add a device to a group that has a preserved
>>   device.
>>
>>So if a device is added to the group while we are preserving, either the
>>probe fails because the group already has a preserved device, or the
>>preservation fails because the group is no longer a singleton. Could you
>>please elaborate what you mean by handling it case by case?
>
>I am fine with the singleton-group checking logic you described above,
>but I don't think we need a helper like iommu_group_is_singleton(). It
>drops group->mutex before returning, so its result may already be stale
>when the caller uses it. That makes it easy to misuse in the future.
>
>I'd prefer to open-code the check where group->mutex is already held, as
>iommu_attach_device() does today:

struct iommu_group is private to drivers/iommu/iommu.c, and
iommu_preserve_device() is in liveupdate.c, so open coding it there is
tricky.

You are correct that it drops the lock before returning. That is why I
recheck the singleton state after setting device_ser, which handles the
race.

I was thinking of adding something like iommu_group_lock() and
iommu_group_unlock() for this, but the number of devices check also
needs struct iommu_group definition.

To avoid misuse, I can add a comment on iommu_group_is_singleton() that
the result may be stale and the caller must recheck. What do you think?

Thanks,
Sami
