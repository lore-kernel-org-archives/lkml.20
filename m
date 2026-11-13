Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588392;
	b=aGj4kgzKTar9fF/dtBhiJTRTC4bUSIKPXRSoIVjipZPEGdNZ86YD9uCR2V2BLbddboEg
	 qDYkFi7c4pHmsAKDwpjaLE2eYLGy5LPzF1S8H1BRStUE8XFdg4DcvdviPs7npG9opgKK9
	 lbKWH1i794U2lV7zKz11/JyltDK4tKjSCS6eQFY1FE+0sCS+8SVvbutMtPYgGjndXd9KA
	 tDLPyB4Ve7WJ0VUVAHdhH0T1vhZHCXwpGZHsH+9q3dzJUYJ7XLRSglayfKhumm+zs/JJn
	 1IYF6yLRDY3GPCgDj7x/RzuFg7CyUW8kBJ3rsBlC/i1qCFG6L6CMUhWckyeImzOn6Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=72MfZYvopQpVYse1zx4/Q4H4dnKwTtleOUe6/DuAvNo=;
	b=YQYZJbGHOe3uh8OPS904ZoZOCeJhAuTNFpsbV2xrjeQ2DzcpHiym1GLH1Spvq4g9pepv
	 Ob1mQa20ZXC7LR9vJI+pQXw1RWRonN2Y10xps/lRu74X758nn1PpCD2q8Uif91tQ4SjeK
	 D7oT3t7OA2/VqEzW8PKZSVEesxfbVESAgtc4elIV6xer4me5mgRiev9Tqkj+OqLhsgXpo
	 SKRsrAyKjk2I9mCWMhrJ/kbj85mI4uJAocJ8LXwJDZ21kubYDUBe0WoVYl6mLYw8lLA+D
	 H9Us9HSE06EofAwrz8zknKwn9XVKCROt1NvsUPuvW/zuI01m/Lzdt2ZCrwwOk//3uLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xr3Btyt3;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB5606F5D4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECB5606F5D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xr3Btyt3
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so712666a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588392; x=1795193192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72MfZYvopQpVYse1zx4/Q4H4dnKwTtleOUe6/DuAvNo=;
        b=Xr3Btyt3iLlJkSbXUZ/tdJ7o1mG8bsf8i6d4z5fsQXNqJvG11cxs7MMT4kGbkjCX6z
         5lE5cCiIzclOjM1rKaOS8QQ1HM1I4qg+2pqmpQ3Otx/G5eob2eI3+6LXKfBCFbAU+f80
         7pTTqmKCjlDDzVdkgzPvolSgOjKMDH576FczZeI+tHjHrfDGT4dJasXVlaL+zyukPBnw
         2EXJ8/YxLvX29A0In9hL0+4MXoKcqU7DgnD+Lcj8FnrpTkgyNllu6FZTJ2WgG5zZOZBY
         /RdnbIoXCXK/Y7P1V/QJ25QfEAOH5d3SOTblQM6BW58Ja4GPOGL0GAMWFVUoOpi/1/m9
         Le9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588392; x=1795193192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72MfZYvopQpVYse1zx4/Q4H4dnKwTtleOUe6/DuAvNo=;
        b=rij8bf7/Doeq7GEq1xK+e9ERQScJIjYjf4uetjpTMm5hW3OTKvMHX2oE7DNTDWU7+o
         y/fqWuCvBj6iccdn2O+zz2sEiQDrgZ25T5r4nbMupvw+hRSg7l89PiyYhe2En2qApi+C
         5PoRdPD4+nk33pFTPgN7/M31bt2b5Svd7GXFntDHnD4ODbt3T3GpYP29XmDefDWpFgI5
         S56RocRPxWXHPbHo3mZpQHy0/JujXvcsaxgZuFp3+qLm2FVW8+77O6MCHK+0+BoScw3/
         eN55wDeCwl7AImljPTxVFt3/2v5T9V21pELbkqwFLV8BTcuILdVM2aBZmHpCbtXl4l5L
         7Phw==
X-Forwarded-Encrypted: i=1; AL+hErGmB8uxXE1LXEAX0M5KdDUn9XK6ejdD4L/BBrNv1EzYs2cJF7OM0/zxPCCRV/E+KUIfIQbI6VE6NbSildI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pQdHl2IZ0T2o42Y1+UHlRO3aIy/wQTVQ0utOp5Kq/kIVf/siW
	jGaz3UAlatdPlTeOkgBbZFjDpl62NNX7XPvwC6rfsGFOTBjp2XciaZ/8CzU3PzRPZq/SRofkFuQ
	0ggtsfQ==
X-Received: from pjbng15.prod.google.com ([2002:a17:90b:1a8f:b0:3ad:3715:39c8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8f:b0:3a5:133:ca5f
 with SMTP id 98e67ed59e1d1-3b1b0b983efmr2928551a91.46.1794588391487; Fri, 13
 Nov 2026 08:46:31 -0800 (PST)
Date: Fri, 13 Nov 2026 08:46:30 -0800
In-Reply-To: <20261112184929.GGavYKObGQNQ0wbDpD@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1794244450.git.prsampat@amd.com> <c64b614ddc83eabc6bb1bdf288272110df04256a.1794244450.git.prsampat@amd.com>
 <20261112184929.GGavYKObGQNQ0wbDpD@fat_crate.local>
Message-ID: <avc-5lkQhoR6US9o@google.com>
Subject: Re: [Patch v4 3/4] x86/sev: Add guest support for Enhanced SMT Protection
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Pratik R. Sampat" <prsampat@amd.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, pbonzini@redhat.com, thomas.lendacky@amd.com, 
	kim.phillips@amd.com, nikunj@amd.com, michael.roth@amd.com, 
	ashish.kalra@amd.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 12, 2026, Borislav Petkov wrote:
> On Mon, Nov 09, 2026 at 08:35:13PM +0000, Pratik R. Sampat wrote:
> > @@ -849,6 +850,18 @@ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip, unsigned
> >  	vmsa->vmpl		= snp_vmpl;
> >  	vmsa->sev_features	= sev_status >> 2;
> >  
> > +	if (sev_status & MSR_AMD64_SEV_SNP_ENABLED &&
> > +	    (sev_status & MSR_AMD64_SNP_ESMT_PROT)) {
> > +		vmsa->vcpu_id = apic_id;
> > +		/*
> > +		 * The mask fully set puts every vCPU in one group, so any two
> > +		 * of them may be co-resident. A legal ESMTP sibling must
> > +		 * also match on ASID, so the sibling of a vCPU in guest mode is
> > +		 * always either another vCPU of this same guest or idle.
> > +		 */
> 
> This comment doesn't belong here.
> 
> In any case, this set touches multiple trees so I'm open to suggestions from
> KVM folks how we should do the patch merging tetris eventually.

Post and merge the guest patches separately, and put any architectural collateral
need for the guest code in those patches.  This is not high on my todo list, i.e.
the KVM patches can come later.
