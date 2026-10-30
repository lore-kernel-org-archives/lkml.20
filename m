Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389149;
	b=cAhc26+e/v8TGMw+PidCdLTzbhD5TAO1RSivBjqKKlUXNBF5TouKS6wC4wLKgDfowVT3
	 8UKSfmeAebtGJjFy0pES3WVzBAcfVmJsPw1iMtUGezvS9791f1gCJiHkGEBdxYRXQbP/V
	 r958o+pBZTK0osngQihTNiQ9rpRK11+J++HbxwB9/x7yS6wGqGDZ4aJvINyYWXjN6j5r2
	 /WgjeZosV8RquQBOYwLaKGEhaEA1P+lPoi2Wd7BH4mk7SPcq6RUcdULLzIEbAXsiLpi9G
	 fM2fXDx6K3Lrm15Ylwxq/qVr23B4r0dWDgwYDq1B4hof8lRjEgKArgLstTCRn/ypcqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=928MzBvfJGc3AdaD6rfLR7nqVT2HnyKwpgdCp3LF6iM=;
	b=GfZLvmj5+HOK/Iy0HfyjRndM/6uRLGiceLBaEgMOU32EV4Nb+V6Ua4Q4nal7PjsXUQqp
	 9tjnIUxpo52ftSHuaSqWPoY9td+zSWUkJRUnIeQjmt9C3JaRn5eToHESIT2X4oFGYj9a7
	 aDIcL0J/wWxPQ7ydZ86spJZAiz1zLrQ/gZeli3aK8u/tYKmUqKe/CA9MxivqIqXQ0jo1b
	 kxFD9/eT6J3PtHfULrWr2zie3MKsa+Xt85OQOad2gO9KWnA3fmFy+UTjO7oWS4R4tUFey
	 TQSnGqcosW/c9/D0M+rsWlWTcQ8EAt2n7nbmw4/EgQtoM3bXIv2G6QTprdpx9BKAm6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="dQ/dTEoP";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61308606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61308606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dQ/dTEoP
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so11565ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793389149; x=1793993949; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=928MzBvfJGc3AdaD6rfLR7nqVT2HnyKwpgdCp3LF6iM=;
        b=dQ/dTEoPD3WVV7Ho8VHQe9A8qyi5svlbDqa16gbM/7MXLKWR8nHEh683silBiiRDlf
         3t3wlmi2c5Utyy55nETPvrP3qdazTvfk9WpoTx8yohEW0Nznf9PyDBCOvxzPUqTdNO7w
         87N/pWP0Ubq4WhpW6NR5lI+kvlb8fxWNYbbYgD24ZbyoDy/d6DRQcncvgYyC3qBGSUnZ
         z7Mz6XiFB2M2oBvwAT45Y18D8tWEVvqYeqmGN1cut98sTf8iMKKpFuisJazNernmGk7T
         9oSMY+QFXgIChxreoAyz+jSWXcmd1lz50vSDbGxUivDVJ2VBoQkYG04FHXSGV2iLaQu6
         uzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389149; x=1793993949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=928MzBvfJGc3AdaD6rfLR7nqVT2HnyKwpgdCp3LF6iM=;
        b=RqyUGq66EF+ZSAyrPj1KiGPlHxEk4w68IJxoJ14YMYmQ/WMYe4B2pPvlyxnUZ2iBrX
         abdz++4688ajY5N8GfP1vMC0jP1tt7g6EMgZwgu93aDb1BI3BVzNMZ0GC9VBxFz5ZWTG
         PpEK5rySSPoONYsQKgzPBSqycs1XsgViGU/iB6f3+ynuGB1wB3Md0L0Lh2O4s+PSIOoz
         XgJHMTNTfoz+H18ZM83QSOvWJTZHUTz2HPnBbKcF/ax0/cmWv2T5cqsM1/dgytONGNOK
         Icvro5PRWd+KzuwBE81BR82fBgCvhs4PgVnTVRBPfb8ywac6uAuMKnCQuYn4ADO8TPW+
         obxw==
X-Forwarded-Encrypted: i=1; AKwUvByLD8/d2UoRAO53VhwiHfz1UlAFNbuW1FQe4Et1gvZpU9Ti3YxPVDUTRKthexFOP0g4Xr4txKicc3bE5CU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvMVclHs9Hqhp78nZouDch1IzXXjS3kds6v3uKRULbwDG9OLJd
	mA9FNcBf26qoCxxIOfmGqKR1QNRMzlYxGEyMWWt7bzFadTdiBpzQoNq7R5QIhagOZw==
X-Gm-Gg: AYBFou1cLdjhdKjuYXqgoXjXTX0jd3n8zcH7cuuyIUMZQWrZhf4LaNXg2e4WE3y1Lao
	pdF6TAiaBu/hCop8zWumwIJeY6riu8FEazYgD+1/o9m1l8O4+27f0I1Pdwe1HGuYD0urFkTVY+f
	a3mY0Qj29RvTlB/12DClcrquMUvdInlynhSk14MqqZtQVZ66pmxu6xmZV90EMUNvGYKQp8c9cz/
	Bjz8UKOLSKsAruOJujI22WsTQ10MGOeTDNVPQAC9fZQ/hF6i/g0y0/YRmvTEnSJrYWN0/sA8TrH
	QQiVpPUu2Za6ctpS0DAdEAXhZwJwPSQGirgiC7tDYs3efokXswqXTQrRIAn8FyDthY28O6h+15Y
	+jJsCbLfjxIT2ZVzUf6/jELrp64z/TI+8VD3/uD6YCZeBiLnhPT8+/kcfKTYCW1fdT22nTRMBgn
	aOXyXlM162DDsmGcoQt0kgGETi0moO53e11kWjPCq9KFeNzHjK9a8uMavIERh+uku2wur6brckc
	e+CTSshr0dHQvbR+F3QCKAsXQhUKWI1yZK8+NT2rV072E7Z0T8bmo19NA3mYM0jB/tTIGac+pKw
	Ha0e722EkzMNFbxaucPlC6O295aztcrNr1hWAxxMwpi0Rq6Y2TLY5QdG5GGYQKK9aYBdIKwxAV9
	G0pfVGNS8h6ghpQl78sFxVg==
X-Received: by 2002:a17:903:1a2b:b0:2ea:7180:3abf with SMTP id d9443c01a7336-2eb019a757fmr19414385ad.15.1793389148212;
        Fri, 30 Oct 2026 12:39:08 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98f888sm9577767a91.13.2026.10.30.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:39:07 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:39:04 +0000
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
Subject: Re: [PATCH v6 13/18] iommu/vt-d: Handle reattach of the restored
 domain
Message-ID: <auTxXD6mztQRp2qd@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-14-skhawaja@google.com>
 <faeedd16-a271-4ced-be1a-7bd70860bcdc@linux.intel.com>
 <auPC2pByvuW5uHyH@google.com>
 <84fe2789-7bbc-436e-9141-e879d2e90ef9@linux.intel.com>
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
In-Reply-To: <84fe2789-7bbc-436e-9141-e879d2e90ef9@linux.intel.com>

On Fri, Oct 30, 2026 at 07:38:54AM +0800, Baolu Lu wrote:
>On 10/30/26 06:34, Samiullah Khawaja wrote:
>>>>diff --git a/drivers/iommu/intel/liveupdate.c 
>>>>b/drivers/iommu/intel/ liveupdate.c
>>>>index 36816d3651e6..665ebb81bd61 100644
>>>>--- a/drivers/iommu/intel/liveupdate.c
>>>>+++ b/drivers/iommu/intel/liveupdate.c
>>>>@@ -394,6 +394,137 @@ void 
>>>>intel_iommu_handle_drhd_restore_failure(struct intel_iommu 
>>>>*iommu)
>>>>               iommu->name);
>>>> }
>>>>+static void domain_detach_restored_iommu(struct dmar_domain *domain,
>>>>+                     struct intel_iommu *iommu)
>>>>+{
>>>>+    struct iommu_domain_info *info;
>>>>+
>>>>+    guard(mutex)(&iommu->did_lock);
>>>>+    info = xa_load(&domain->iommu_array, iommu->seq_id);
>>>>+    if (--info->refcnt == 0) {
>>>>+        xa_erase(&domain->iommu_array, iommu->seq_id);
>>>>+        kfree(info);
>>>>+    }
>>>
>>>This seems to be different from normal domain_detach_iommu(), which
>>>looks like this,
>>>
>>>       if (--info->refcnt == 0) {
>>>               ida_free(&iommu->domain_ida, info->did);
>>>               xa_erase(&domain->iommu_array, iommu->seq_id);
>>>               kfree(info);
>>>       }
>>>
>>>why ida_free() is skipped in the restored path?
>>
>>The restored device can be removed and probed again while the PASID and
>>context entries stay intact. So the restored did is not freed in this
>>path. Once the domain is reclaimed by the iommufd, then it takes the
>>normal detach path.
>
>Can you please add a comment to explain this?

Agreed. I will add a comment for this.
>
>Thanks,
>baolu

Thanks,
Sami
