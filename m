Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B743282F1F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290537; cv=none; b=cWgoNwA77WA8BPRAtKk2dT4kNu3q89xM01nG4N8aEy+z4/8pcvbDV/kEY6ZzkdWHDuQULUWSwgsIKQYXzKwQsL0HhmckM3HfLkO9kZIMEIABNA+HklRnGFIJP/+ze6NMH4S6hy7ippicf1+sb5w6VmvGnGsojvcDdbG2X/IQLxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290537; c=relaxed/simple;
	bh=Ot0cDlosSJ7B0rKy6gYVAmZetDbxU6jeRs6fzTiE2ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBfmIebDWAm5kwzdgc5dLKoniR94l7V3UTOGCHO4lADcBZayufwXdvCUzhMGoisQwX+DTvI6Optgd0tWwbBpLnFhOGnblar6qbqh+FzcBCdwoN0+p9PgMmExsoD1Zj6xWnzGaGi9FWlhn6J5h26rwufRyrbIq8WXNnjLGo6CeYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=aLacATwX; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="aLacATwX"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so338503c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790290536; x=1790895336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIp+aiyQTzTnGdKMDtuefZl/ywWVdEoeMd4a05iequo=;
        b=aLacATwXjKl9i52SEYMYnrs0OGOUMX1JlWUXwVDtvblpkgbAmp2aebKC/OrLKReD7J
         v2Y5D2cJv/bmpJ3TD8hxFAnY8u4lFWHBBa2Dk3pGqQCFcjAPn0b1RcgXp5uEXEVs0rPA
         odm0JW94q6NaYcysaS0JZ1rBWEKyeyyDJ81TRthDEMAqilBazfuo6tZI4gfB+didmW0S
         w/VBkMSMx0+XsgK0IurMa1OyWGNOSXlL3K8icsewIYO0imWqCuicEHdvdQFscoym++HQ
         h8dkHHGt8HPtqdaltXCGq2nSGVY8x1BorLhAGDbjk+MILFhb4W87MUucY5RxzUwVhziQ
         2APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290536; x=1790895336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIp+aiyQTzTnGdKMDtuefZl/ywWVdEoeMd4a05iequo=;
        b=UklnQP/rN6eDxNh0LM9wfa68mJUkuYHgjSXEFUBL7SAcSJjmhgP+NOUujySVPyUmjd
         j1/WnyrDAG3hi6FHtI0bLz5kA0vgEbQiLX76Q7zVADG9Zkdk6wkG1WtbdPFNvB20kTgJ
         xNlzPWr1OavlbPFA692cwaoLQtS7Kq9Q/D51Zorf43Ir8T1s51no7TL132ZX1zAos2Zg
         uQ+qEXn+twb168H68I3YYiI/0KWltcFCBG/imPE035BSC7UsTMu45MjdH2DzrTLpxz7j
         3c+wntWFo1+DCV0B9MaZGBByK1jqPATO+wO4z64xgg7OVN+k5w5ltb7vgvlovNUcqzJh
         JWNA==
X-Forwarded-Encrypted: i=1; AKwUvBy9Fvo61PXklA+DlSyJafX+jxIBvukT8Tm2TiVeQWa4BZkkdwaU2QoUZ1EyORVFgKGSKcYAiK7yuq/cfDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mK0trHgdSos8QPs9IURagWQLBlnE2rlyvnZ4MdncKZXkzyb9sN
	86ecXGgWhVMYLGxdYA49GVD9XCDhZX/VNJdubx9RnWBfmMztt09dHtT977+EyVRxvxg=
X-Gm-Gg: AYBFou1o4kw+ZHdMorbiRdbutnQ19H6PcscEVZ4cCMngVJ6qMowaHiyizhjxnwGpm+I
	7pHNr4M0fi5fdNbNhB5i6Ijn3mucv5EF2/z3PBEf7Yd+p+LC+VRr0EobkBZVaIeB2G+0LhD27vW
	nnan30Do81z+gBh8RHU9TUV3r3FyayzOSr+CYg6P5ji4IlIfAW/0y3mMKnV1EKjVcvDVPxvkNC+
	rBnuLWDh3f9tzPwu5LGGYo3x4aUsc0Xc1WXOK/7nqAIpRZNz4+cEdV6fyWOTm//BQafLSGSRfLb
	G0ou+gddoHyZNe5cbswpwJiBuK5pbY0O/2l2jF84lnMXjPPTgkcx/W5k5EZAu1irn/C18SFCwMT
	R39pEDePf+fYuyorzNw3tCYGOIYI/aWQ6umdycXIwba+9RsrJPmaA8LON78lgTTaSNvQZSYNlDo
	nD4ZaxfIFS9TE5+v0usT3ObvmBV06a2UyHXb9NCydInPdE
X-Received: by 2002:a05:7300:7312:b0:33b:dd45:716c with SMTP id 5a478bee46e88-340cc11f887mr2763537eec.13.1790290535581;
        Thu, 24 Sep 2026 15:55:35 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1639551eec.4.2026.09.24.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:55:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9sLm-00000000elU-0EsA;
	Thu, 24 Sep 2026 19:55:34 -0300
Date: Thu, 24 Sep 2026 19:55:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260924225534.GD16465@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>

On Thu, Sep 24, 2026 at 01:36:12PM -0700, Daniel Mentz wrote:

> Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)
> 
> When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 tables:
>  * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
> queried and cleared on a page-by-page granularity
> (iopte_set_writeable_clean(ptep)).
>  * If a single 4KB page within a 64KB CONT group is marked clean while
> neighboring pages remain marked dirty/writeable, the descriptors in
> that group will differ in access permissions (AP[2]).
>  * According to Arm ARM D8.3.1, all descriptors in a contiguous block
> must share identical permissions and attributes. If dirty tracking is
> active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
> should be set or whether CONT sizes should be suppressed when
> IO_PGTABLE_QUIRK_ARM_HD is active.

This is right, handling dirty and CONT together is a PITA. You should
probably make them exclusive for this simplified implementation.

SMMUv3 is the only user of dirty and it will switch to iommupt which
does all this right.

Jason
