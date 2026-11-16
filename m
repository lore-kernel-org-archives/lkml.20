Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861259;
	b=gTqoZ8cJmGzIslz8F+i5Iv7Z2i5p+BBcv7IUARuOze0F0i7EapZbl4Bfnt57ur1b7RjF
	 /puu5J/naCTXuGx2giGHsAs7rt6QBs70NfLyWM/+XT6rHV8rjIlbQMq5KuoRYEcxfJqKl
	 n64FYEhOKs0v7fqgZcM6lZfsH4J0HyNTbjLzIDMLgvxvtBakB2TLErbHoAycFHdXrZ+Zx
	 KOj5JCBERbljSMn4BBky5B4CwZVpurnytM7VuAj5sMFr5Gr4TUPrYscEj4qH6BEiEysNT
	 uF1dnnDwERp0dJK2+XQIm8StmKOvz/XMPEyaWuNbBQMaG/EA4W1vl5MZzqSE85678Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FuP841QZILSYrGI+sOs3ttqavD6cxIfZJ60TQUpud2E=;
	b=g+zN6lkPc5f7CFfbCDjMKE6VMk0j6aeU3t3TTFFfq1dgzmvmpHJbDCnFTjGi3FONhteZ
	 PVxyOEh/H1EtEx78R+FZICD8MkT0Sb37tv3COZDsOwPANoFMU1QOsHj453o+vCHJREtXW
	 0RFMC4B6HT/EW1fQ9DMYXExj4j+ROBKRW+lZr9PT/c2wYAFBxROlDG0pZBFukVHKUG1iD
	 e8+AhoddesysW7BdopATAOPKkGorcikbA53yaYIf7NrES4XJRkFvRhhRArbbSEPXQ12S7
	 Rnja/Fm9VicoR41m/qH97EYlYKqGw3XAnaFRmxj7D3eFJJOnF0Xc8axZsznTaaEXA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dmIh0sGt;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B99606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B99606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dmIh0sGt
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ee254f6eefso18095ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794861257; x=1795466057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuP841QZILSYrGI+sOs3ttqavD6cxIfZJ60TQUpud2E=;
        b=dmIh0sGtUdCAx8LVvuF/0RO/gJohVjpsrtSP6D1QcLtRNEi2/v8twNsF/c14q5WWea
         5aJpv6F0z2BBmb203b94WEPy4PXC6rPyo6J6qignUfTVY4xU1ee1WA+qn3DvYU3KJWPM
         dO8vtHLvA4gSIufqC84szJg9Payfl1GxRnA+yj/LMoXwNhpCe1YTz9Wc24b3KkCFcWTx
         AamxzZn8M2rcTxGe1aCkt6LGHqA2EhAWiYmonxn+RRDOAFTv6tSYKxAZ3GgzqmIqqY5d
         MPpUrwTmupi2pLnunFZs9nEcLvGteQGea9UzdaVTBPPTcCoivc5w5biFVnrG4KR57E1E
         eedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861257; x=1795466057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuP841QZILSYrGI+sOs3ttqavD6cxIfZJ60TQUpud2E=;
        b=gU/dIdxjdDL4carZPyl5iGQmtLm+hshupwoCH437S8vVLu0d18wsRjUosqBdX3jBT9
         qa5+WU1c7oO1EvjatRFUkA/y7wmNIxNdlOlCYaoQHWqjQoxcHWIJGwhITemyNMgyuSK3
         oi0J5nU6RRToeBLAcwBFqzbZL8h0UGsrvxaefTaIz6u8PQHKvvUrtYsZoZ7gLza13j8G
         UjAT1IvmvXuGnrYJMtnU3KSlJZJmOsVinJdrlJW2HQHT+38K8oFWNKysq15iGHeUniBt
         9MjxceNgcXqhPR7Uh5OAlxbvGJ6maOW3TLKAf4+hLOM5r9x2UnWS9fJGjywntSC1v6tS
         Y4Lw==
X-Forwarded-Encrypted: i=1; AL+hErGlPF4K1rI+ONK8YF08AgAsgTYtho4RYsnSRBnc7vupJ6gJ9bL1G01Gj7aJSMz0CdEgao6Er/o878KePdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uAfkOeO0xDwf44laL5fV8hcNz0mtRbRX9VgQwFbZzAdMbx4yE
	+zwNoSFZXRrXnogW0jVyaykferWkIkCA5AnT7TS7ajFCBjjaFgY2ssy0s/PtU1+0pQ==
X-Gm-Gg: AZFdTZftypm1HbucoPX3Z2Kj9SL5gMoxoku1JRZ1D8kV4/lYs9H99ZnuIqVgNuQI31A
	r89HpFY1kc1hCUFDsj+A7X6lzKac7wb5PQzbxdzNhXXu1Uevdj8A2iG+WI9s8Jzo3AW/Vat0tk3
	SW3CoOE2vEUeFn7QpbA1VfNioQhLTc1A7D67fP8s22huFofckM9ndeisJ6DV95IrbOKgHGe3j7m
	vKlG9JliRbx5B19fkmBiyguHJFsR2/myHIwGBvW4kMt9Yo5wvS4zPIzG4SUQ6Z8+ZlJzARLPOwT
	03AnBzEHM3S/0iss953qWH/BuvwxooSAYCz2F7px1WchtU6wrTZd29rPcWVR70Nylfyxgdq+LfG
	oAxgmTYe7OjSThZV+wkrzg5WOzuD974zhoCrINvAN3DcGZ8VI9YCkvDvfADgw+VUxlfts9ZylQJ
	gC/7Lqf7vrNDMl/4uegtpI8zdo4aDuXr+BOALpXHQcAjDEFxAZa0CouNOXkGcywtsXAPLPPxPCp
	Fk+cEih5fdoo4QAnkXkOYlD8jwZJkMFIRtZTr4xgjJLGU7ehlVkMbXWX8QRozZoPALmaZXcChMQ
	jJiAXixIxRxSkHc+SHX7NFbvQ9BxUivA9TGeK3NXazrA7NxSshP4pF5pocqeS2UVPE3uqfNSiuh
	GxJzRrekv5qGaN9Ffs/qHZg==
X-Received: by 2002:a17:903:37cc:b0:2ef:d87f:8a20 with SMTP id d9443c01a7336-2efdc89d1a2mr134375ad.12.1794861256762;
        Mon, 16 Nov 2026 12:34:16 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f4c98sm775625a91.0.2026.11.16.12.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:34:14 -0800 (PST)
Date: Mon, 16 Nov 2026 20:34:11 +0000
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
Subject: Re: [PATCH v7 10/18] iommu/vt-d: Restore IOMMU state and reclaimed
 domain ids
Message-ID: <avtiC6VfIf7uc5gj@google.com>
References: <20261110040828.1774343-1-skhawaja@google.com>
 <20261110040828.1774343-11-skhawaja@google.com>
 <57c85edf-8400-4b45-9a64-5eddc0d29134@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <57c85edf-8400-4b45-9a64-5eddc0d29134@linux.intel.com>

On Mon, Nov 16, 2026 at 11:31:29AM +0800, Baolu Lu wrote:
>On 11/10/2026 12:08 PM, Samiullah Khawaja wrote:
>>During boot fetch the preserved state of IOMMU unit and if found then
>>restore the state.
>>
>>- Reuse the root_table that was preserved in the previous kernel.
>>- Reclaim the domain ids of the preserved domains for each preserved
>>   devices so these are not acquired by another domain.
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  drivers/iommu/intel/iommu.c      |  57 ++++++++++---
>>  drivers/iommu/intel/iommu.h      |  14 ++++
>>  drivers/iommu/intel/liveupdate.c | 139 +++++++++++++++++++++++++++++++
>>  3 files changed, 197 insertions(+), 13 deletions(-)
>>
>>diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>>index 6c86c155d12b..a83971368bef 100644
>>--- a/drivers/iommu/intel/iommu.c
>>+++ b/drivers/iommu/intel/iommu.c
>>@@ -987,6 +987,8 @@ static void iommu_disable_translation(struct intel_iommu *iommu)
>>  static void release_dmar_iommu(struct intel_iommu *iommu)
>>  {
>>+	intel_iommu_handle_drhd_restore_failure(iommu);
>>+
>>  	/*
>>  	 * All iommu domains must have been detached from the devices,
>>  	 * hence there should be no domain IDs in use.
>>@@ -1452,7 +1454,7 @@ static void intel_iommu_init_qi(struct intel_iommu *iommu)
>>   * Returns 0 when the ID is reserved, was already reserved, or cannot be
>>   * re-assigned, and a negative errno for a genuine allocation failure.
>>   */
>>-static int reserve_domain_id(struct intel_iommu *iommu, int did)
>>+int reserve_domain_id(struct intel_iommu *iommu, int did)
>>  {
>>  	int ret;
>>@@ -1743,12 +1745,16 @@ static int copy_translation_tables(struct intel_iommu *iommu)
>>  static int __init init_dmars(void)
>>  {
>>+	struct iommu_hw_ser *iommu_ser;
>>  	struct dmar_drhd_unit *drhd;
>>  	struct intel_iommu *iommu;
>>  	int ret;
>>  	for_each_iommu(iommu, drhd) {
>>+		iommu_ser = iommu_get_restored_state(iommu->reg_phys,
>>+						     IOMMU_SER_TYPE_INTEL);
>>  		if (drhd->ignored) {
>>+			intel_iommu_handle_drhd_restore_failure(iommu);
>>  			iommu_disable_translation(iommu);
>>  			continue;
>>  		}
>>@@ -1766,7 +1772,9 @@ static int __init init_dmars(void)
>>  		}
>>  		intel_iommu_init_qi(iommu);
>>-		init_translation_status(iommu);
>>+
>>+		if (!iommu_ser)
>>+			init_translation_status(iommu);
>>  		if (translation_pre_enabled(iommu) && !is_kdump_kernel()) {
>>  			iommu_disable_translation(iommu);
>>@@ -1775,14 +1783,18 @@ static int __init init_dmars(void)
>>  				iommu->name);
>>  		}
>>-		/*
>>-		 * TBD:
>>-		 * we could share the same root & context tables
>>-		 * among all IOMMU's. Need to Split it later.
>>-		 */
>>-		ret = iommu_alloc_root_entry(iommu);
>>-		if (ret)
>>-			goto free_iommu;
>>+		if (iommu_ser) {
>>+			intel_iommu_liveupdate_restore_root_table(iommu, iommu_ser);
>
>What happens if the incoming kernel is booted with intel_iommu=off?
>
>intel_iommu_init() calls intel_disable_iommus() before reaching this
>restore path. A preserved device may still be issuing DMA, which would
>then bypass translation.
>
>Could we detect preserved IOMMUs and force VT-d on in that case? We

Booting the new kernel with intel_iommu=off after a live update is a
configuration mistake. I will check for preserved IOMMU state in
intel_iommu_init() and force VT-d on like you suggested.

>should also ensure that the ACS configuration for preserved devices and
>their upstream bridges remains consistent with the previous kernel.

The ACS configuration of the preserved devices and their upstream
bridges is preserved and restored by the PCI live update series.

>
>Thanks,
>baolu

Thanks,
Sami
