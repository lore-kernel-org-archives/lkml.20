Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2E364EAA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430182; cv=none; b=OzxM4rkNYY27O1CaVEUG9tDp7ITWc0rhOHL8u3BsoRGASOu9tOgYpejHUcAR5IfVYu6XU1JCqYP9vIexn72cjEP38OLsAzQznsGgRY1ZH8iodEUShw8nDSKceOp/G0MneU+xzlc3E45lbdh0ketaF2/idQ9Y0lxHB1FFmrmjydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430182; c=relaxed/simple;
	bh=fCovleAd76xKxSIKL0gR0UyoCvGwErIcUGSaO7MBn14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AW05fQliz28MYQltsXSVMyINDvencNujzUm/ojj439Xpy4RC6Am0FbYkMCFm5BE3nW7v1BPolxIghiTXyYwoNijnpl9ON6Bwt3wVpUhdWu9Z3lYwNmdfWrB06waK3JopgXmQfWgjVBnEdMiCWcrXtGKMUQQiBonSmdkyDNrZBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InYbj/Xm; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InYbj/Xm"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so131720eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791430180; x=1792034980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gwq5f+ZLCgN7QGo4Ox3rF7+nf5ThQJje9jM+CC6wfhE=;
        b=InYbj/Xm7x9QrtNGd1WIKKvTEzJdNyz0ygi6UwwFN9QD+3iIWBVbHkYLBFWI3alt4F
         rRaebarRFuiHzB8o1dvia/RQuhFgFoyGxhrsoawOXl9ci+2fz64ppfg3f253tJ0aO1zC
         yNbBgqgJpi3CsNLENWoYPFEBtawxtZ5fLeZMgfrqovCLw2zxXHif310Poi/X381tIh/o
         e2b7ma78ghIhPyR6pYmDs0KBr4MDZDo/WV9CU7CTGKTRuS9ZX7199aXeZHRm09vKbKPe
         xKVED9mfhtiA+GUqrVBU+fXKxo5K9I2dtIHKtzcD7qWEMRgcs3R5KZT3AtP2t6WCl9AQ
         bmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430180; x=1792034980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gwq5f+ZLCgN7QGo4Ox3rF7+nf5ThQJje9jM+CC6wfhE=;
        b=xmyfhhh8BWgSPRV9OYAZIdZyHCmo5jUepOX8ZJ56WGF1fR4tyCkzcHMflVr6t7862K
         Ut0xF66nK9k8yG80rEuYxaRSbSJ7HoiG8NGK4B9g3/JRn0XDF6H6+6gdk2Yj183mzvwb
         mE/lbOw4gnlOSfv8YbB+EEr18PFl87j8um8G1M8UNl7HUEQnzgDqWFu+77IUjSZ9+8qc
         VIEnOZH1WGZlbFMqPxh6rRH0EQsT8AKuotO6CsM6fqu9CCE/1Aty44hqjCbRR9qHg3p1
         Ce6yJSwZqTlTtFN0v4QoselrE6+NnTbGMmCap6IEMfNomxMbl/Mk9ntvdkZHqwqLHm94
         Qvpg==
X-Forwarded-Encrypted: i=1; AKwUvByvrynpy00yGOzCUVUbhh/NK92YZYSvo4SWMndI7ws9f3nuNnBC7Tssto6LWIUIspmrqs9rVIIRZdZxrDs=@vger.kernel.org
X-Gm-Message-State: AFuF++nqjokmiPnQIfEVmTGhxaRL8aQ9ZBm+rP152U8yyfRhVyCR417u
	KqdFVBOdyY0Ik0h/fCHTR14ZUd8M20s0JyCSDdCaA8GPTiZETb/33Gqx
X-Gm-Gg: AYBFou1nc1vImxiywdy4vpJ9ae6T2dwCci5oKvLiFPSnQdhK67Xq5u4RQCtnWGXMEta
	fawXqYnf5d8mUCejC1vUt4a+USqnIhfU4DZ0zw3B+mQsWUhvbGCKhRUH/q/wLOMpOOp0VMaWUTo
	c1QtDznp3F/MLzqojqgLCbPdWOhUse8W11VUBkDqNuj5BLzDdyJhxdKOmZuRYQbEkyqsC+m4IJh
	EEHfFbr6RljpYfJ3P7GhUTrILbAeNoosCgGaGlIOqA3d3uKsMWnFE6th/9YF+1y8MzQHuM00Aj7
	AXqxNP1KawIuetTDzyVTYRzGbbeD4oVWYesxD59HmnRHOBxysmBox6R90ReIkplSJ0ouOhpuyJt
	jQ7Lrj6LUrWBRrFlYUjBnbQYcYmvaVttTnpBEK8Mq4lOA0tbjYFtEtZGdyvCsaMZ4Bh1vU+7M2G
	4KMrKbVKH56J1/3s4fi0/j6dxLh3FHreVZ/Lk4Qwf0NnbbN/+HxmXkdkexjTzEjz9b0ENFPC2k+
	ByWtCjUEgMxGQjUpe2f6YjqcVDG
X-Received: by 2002:a05:7301:4208:b0:351:1b39:9e49 with SMTP id 5a478bee46e88-3515dd83c6fmr4928603eec.8.1791430179747;
        Wed, 07 Oct 2026 20:29:39 -0700 (PDT)
Received: from localhost ([47.254.74.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm12939658eec.22.2026.10.07.20.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:29:39 -0700 (PDT)
Date: Thu, 8 Oct 2026 11:29:35 +0800
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/29] KVM: x86: Add KVM_REQ_MMU_SYNC_ALL_ROOTS
Message-ID: <ascM1BxXKhGqA8n7@U-YXDQC754-96.local>
References: <20261008001425.2458927-1-yosry@kernel.org>
 <20261008001425.2458927-21-yosry@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008001425.2458927-21-yosry@kernel.org>

On Thu, Oct 08, 2026 at 12:14:16AM +0800, Yosry Ahmed wrote:
> Add a new x86 request to sync all roots, current and previous. This will
> be used when syncing the shadow NPTs on nested VMRUN when an ASID flush
> (or new ASID) is requested by L1, as all physical translations in all
> roots should be sync'd (since shadow mappings are not tagged with an
> ASID).
> 
> Refactor syncing all roots (currently only done by
> kvm_vcpu_flush_tlb_guest()) to a helper, and use it to handle the
> request.
> 
> Clear KVM_REQ_MMU_SYNC when handling KVM_REQ_MMU_SYNC_ALL_ROOTS as the
> latter is a superset. Do not do so inside kvm_mmu_sync_all_roots(), to
> avoid any subtle behavioral changes from kvm_vcpu_flush_tlb_guest()
> clearing KVM_REQ_MMU_SYNC. It makes sense to always clear it when
> syncing the MMU, but there might be weird dependencies on the sync only
> happening before the actual vCPU run, and kvm_vcpu_flush_tlb_guest() is
> called in other code paths than handling KVM_REQ_TLB_FLUSH_GUEST before
> vCPU run.
> 
> No functional change intended.

Reviewed-by: Lai Jiangshan <jiangshanlai@gmail.com>

> 
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/include/asm/kvm_host.h |  1 +
>  arch/x86/kvm/mmu.h              |  7 +++++++
>  arch/x86/kvm/x86.c              | 11 ++++++++---
>  3 files changed, 16 insertions(+), 3 deletions(-)
> 
