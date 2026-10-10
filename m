Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204F39A808
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599515; cv=none; b=WRViO7trUld4h4s5vYPxRlBWn+buuXmRhBW7vpvGFT/D9ZeDlv1DO7KnsNv0s4ub9/HhIsHtiYYbcD2WCNuq9wOaw6d8GN0vmgRlmjdIJMhBQf6CqFTH2QXe5e9n6XbJHTzSzkk5BXBm6u2Ubh7pGtlZONNQA0TzaIwPgixRCbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599515; c=relaxed/simple;
	bh=Wsfe86TYaGANkos5Or/r/Ovy9nBCe20RY2SVazy8WIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOKBptZ59Kp9cJmsgjO1eC/yKXRJ+w19hPtxvugZ73g9E6d5gPi18/TnYhUcVsx4bdIR4XfnG4inBODyAPTRRb8sEXqwy1JjMyUUbo8PECrVdGlu9BRDfcnYY+co9eVWK3Syyl+OwAtcY2bDdAOkSswDhjX3jjLnIb0NZBdIIwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WmWw5wNs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WmWw5wNs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db33db4de9so10395ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791599509; x=1792204309; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rzKQ4RjsXxN/zYQ6wEGpTgXALdkb/UwVP3kYDgAqNA=;
        b=WmWw5wNsqZpB+8WRWeSe9liypog9W0ar/G38tuDgxJe+NVyjQmP5Mp93bmNtCPmt2V
         zlzLYuOYH89h9xXqvkId35MN4g5pHOXgHgQZr0n2/onbS1GqR/xFwmnvO0k+tILObkeY
         2ewKyizq2n9M6mCCXQNn3zrNl/Hxe75ZwODTYsNfOrwNoHOXnStIZlNGmc0pH978Ckvm
         gVznEuKnIU9zddP8q6QcD+q4oYv/K6IRcOSoAdnC7/9ePj/W5k0wwXtBtZZjDk6yLGPt
         OeH6yn9VIhZ4VX/vBZEEtXoJaPIhUh2dcuT0YQQuQrZpvF78OZ4StS+v/iij4dlD5Ie9
         c/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791599509; x=1792204309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3rzKQ4RjsXxN/zYQ6wEGpTgXALdkb/UwVP3kYDgAqNA=;
        b=M0BdwCZhyR/u1klCafFppxD+KBjvk5b7645uIOQgKiFmEfxfCDjoelH5FUEpMcYWDr
         5ZCDHXHQ1j3RarGNEmzkr382C0TuWcbkiAbKXmZ4wiE9Iy9e8mde3apgGaKv4l5phrW5
         Xs2jb+040SczcIrcP6pXlg/VK189zdnk5qsehtc92eXmgtAJbZBnE7SCacvScOdfqGpB
         4auhSBnHUGVwAoT4xrqf1LeWE8CU/sWTT6p/WtfspNICRz1Pzj2VpNgGCwpjlv6mR56j
         dAv7ImaffsHc80ZSP0K5RAMWkFD6ISaD0SGmxO0uQ+n9Paztr4zMkpsDpnLK6VmmZBAt
         QTxA==
X-Forwarded-Encrypted: i=1; AKwUvBwFV7pb1fHqEUZwqarZ/8cCaVQwLh2iGR7p/IKTNL5sPZc2q/q9aZIEZ9TgqhRjq+EjG4pqencoY1IOgi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5frT9rk9tVPjCh0sy6dHToS+gLX3w9xiZ9Mh01JmaVaygsDat
	GYT3q0E/vrWs+nuokgDVZHjfRzgnCKquRsjYTvUFFTEg0uehx1YdNV2kB4agAnPqLw==
X-Gm-Gg: AYBFou3FDa/KbighF5ocM13snTc6F2MEYndZscxgQVsnOve+oE0L0iZIkXHVZuKHFhP
	93jlByMhMaheHusKFmhpZ5fyCqs5gSgJfZBYqeAnFCX0RKxlBU2N51xdR299EAbw+PCKCKpNGhz
	lOeBDRE0YGbRqvDZFCXbnNzcMFQpEUvV15LdMmKZIc1Se7houd1BxedrZPFG+liUpw9f1Vv0Shp
	Y7XaIOkOLXm2hJHocyISaJ8MHLb8/D+6xitRoe9n2cbAfVREhkUzaFzDJHaUBU/QfyaqqRukYsN
	wSvwLcEYgODe6FjGKX6MOl9j5JzPHlgyHdR9hDsg/xl9jiUho6CO7DtP9WA3I+HZW52xcD3LgpJ
	rTDbtTM8NnhR0NZUjimHU4LD45JhU+7Y7UycyapW1+D5jmNHaGLIrvexFSQLV622WO4WCkHkkVS
	Y1vtVt8vrJoCY/QiBjYnAd2Isg9eukFi50CFOH+DCGijq/64Gfu4dQbs/j+cSulzPG8AJbhqu4j
	YLfiMPqdV9TjrfMLCUjsvEe7ZGQyWgY6Ak9jJ6eitsXCoT/+VhC17tBH7Tksoux0LQ=
X-Received: by 2002:a17:903:15c3:b0:2e6:1917:fd with SMTP id d9443c01a7336-2e87e2bb07amr579615ad.7.1791599507817;
        Fri, 09 Oct 2026 19:31:47 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm7435279a91.6.2026.10.09.19.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:31:46 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:31:42 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v5 13/18] iommu/vt-d: Preserve PASID table of preserved
 device
Message-ID: <asmeX0tryM-fR-d_@google.com>
References: <20260921004834.2601285-1-skhawaja@google.com>
 <20260921004834.2601285-14-skhawaja@google.com>
 <f48258bb-df50-43bb-9141-433601d885a2@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f48258bb-df50-43bb-9141-433601d885a2@linux.intel.com>

On Fri, Oct 09, 2026 at 11:38:57AM +0800, Baolu Lu wrote:
>On 9/21/2026 8:48 AM, Samiullah Khawaja wrote:
>>In scalable mode the PASID table is used to fetch the io page tables.
>>Preserve and restore the PASID table of the preserved devices.
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  drivers/iommu/intel/liveupdate.c | 141 +++++++++++++++++++++++++++++--
>>  drivers/iommu/intel/pasid.c      |  10 ++-
>>  drivers/iommu/intel/pasid.h      |   8 ++
>>  include/linux/kho/abi/iommu.h    |  17 ++++
>>  4 files changed, 169 insertions(+), 7 deletions(-)
>
>Should this patch come before patch 12/18, which restores the device’s
>domain attachment?

Agreed. I will move it before the patch that restores the device's
domain attachment.
>
>>

[snip]

>>diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
>>index e4f24d3f19a6..59cc69383799 100644
>>--- a/drivers/iommu/intel/pasid.c
>>+++ b/drivers/iommu/intel/pasid.c
>>@@ -13,6 +13,7 @@
>>  #include <linux/cpufeature.h>
>>  #include <linux/dmar.h>
>>  #include <linux/iommu.h>
>>+#include <linux/iommu-liveupdate.h>
>>  #include <linux/memory.h>
>>  #include <linux/pci.h>
>>  #include <linux/pci-ats.h>
>>@@ -60,8 +61,13 @@ int intel_pasid_alloc_table(struct device *dev)
>>  	size = max_pasid >> (PASID_PDE_SHIFT - 3);
>>  	order = size ? get_order(size) : 0;
>>-	dir = iommu_alloc_pages_node_sz(info->iommu->node, GFP_KERNEL,
>>-					1 << (order + PAGE_SHIFT));
>>+
>>+	max_pasid = 1 << (order + PAGE_SHIFT + 3);
>>+	if (dev_iommu_restored_state(dev))
>>+		dir = intel_pasid_restore_table(dev, max_pasid);
>>+	else
>>+		dir = iommu_alloc_pages_node_sz(info->iommu->node, GFP_KERNEL,
>>+						1 << (order + PAGE_SHIFT));
>
>This restores only the PASID table pages. The PASID table is eventually
>installed in the context entry during probe_device:
>
>        if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev)) {
>                ret = intel_pasid_alloc_table(dev);
>                if (ret) {
>                        dev_err(dev, "PASID table allocation failed\n");
>                        goto clear_rbtree;
>                }
>
>                if (!context_copied(iommu, info->bus, info->devfn)) {
>                        ret = intel_pasid_setup_sm_context(dev);
>                        if (ret)
>                                goto free_table;
>                }
>        }
>
>For a restored PASID table, the call to intel_pasid_setup_sm_context()
>should be skipped. Instead, it should check whether the preserved pasid
>table is compatible with the new kernel environment.

I will skip the setup call here, but the compatibility check is done in
the intel_pasid_restore_table(). The command line configuration and
other things can be verified during iommu unit restore as you pointed
out in the other patch.
>
>>  	if (!dir) {
>>  		kfree(pasid_table);
>>  		return -ENOMEM;
>>diff --git a/include/linux/kho/abi/iommu.h b/include/linux/kho/abi/iommu.h

[snip]

>>index 5aaa29da6832..308cd83fd3e3 100644
>>--- a/include/linux/kho/abi/iommu.h
>>+++ b/include/linux/kho/abi/iommu.h
>>@@ -129,6 +129,19 @@ struct iommu_dev_map_ser {
>>  	u64 iommu_phys;
>>  } __packed;
>>+/**
>>+ * struct iommu_device_intel_ser - Intel specific state of serialized device
>>+ * @restored: Whether the device state is restored
>>+ * @pasid_table: Physical address of pasid table
>>+ * @max_pasid: Maximum supported pasid
>>+ */
>>+struct iommu_device_intel_ser {
>>+	u8 restored;
>>+	u8 padding[7];
>>+	u64 pasid_table;
>>+	u64 max_pasid;
>>+} __packed;
>>+
>>  /**
>>   * struct iommu_device_ser - Serialized state of a device
>>   * @hdr: Common object header
>>@@ -136,6 +149,7 @@ struct iommu_dev_map_ser {
>>   * @pci_domain_nr: PCI domain number
>>   * @dma_owner_token: Token to identify the DMA owner of this device
>>   * @domain_iommu_ser: Domain and IOMMU mapping
>>+ * @intel: Intel specific serialization data
>>   */
>>  struct iommu_device_ser {
>>  	struct iommu_hdr_ser hdr;
>>@@ -143,6 +157,9 @@ struct iommu_device_ser {
>>  	u32 pci_domain_nr;
>>  	u64 dma_owner_token;
>>  	struct iommu_dev_map_ser domain_iommu_ser;
>>+	union {
>>+		struct iommu_device_intel_ser intel;
>>+	};
>>  } __packed;
>>  /* There are maximum 256 buses, so maximum 512 context tables */
>
>Thanks,
>baolu

Thanks,
Sami
