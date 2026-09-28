Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE24EB876
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623573; cv=none; b=JQph7AEcfKNgna7YW4luwKzzwYCzS/5udkYjc7zd1gMIdaucHd07S+52OIWbILV0G7Zyntr+wiATWIyHecYrzIZA1Eycc6D+YaArLdHkraYyUjf0TQrJIu/tLISvqnEeiCvVlzkGjk/tM0+n/5Xp+gSc6LcJxH47ZRiJUmVGarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623573; c=relaxed/simple;
	bh=j/6Iu06N1bxUnrcYFaW7Y+bggLuadcmx+PEc0B3682w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ORYAzdhGRmSFgBezUHp25TA7sKu5pkDMCZeIbZulmqZPBKku8MudtCyCwXr6XSvq1/73ppmmDRaHHNOXYjrL2QQuByLwxbbdOk5butx5bl81D/qHK36maBfzhBNEceW//L49ThhGV7CBf5pnHl+kQphyU5NoYBz82QmktXNWv6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qyrLF3o6; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qyrLF3o6"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8484f12cso32910515ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790623572; x=1791228372; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNYJ9iXwZtkkaIquLN753az1rX5eiSNS35Ev0JuX/44=;
        b=qyrLF3o6PxiP6qvD1EmYvtyRtqRVU0rRLCAE3bA1XI+c8bGvDEfsQZx85tzdCPfNuK
         Q2avXamuY1f0115kEdrSQj9WMqlCUX8mzeFT4t6K0FcIazIb+wZEyA1012mSKQEkJcLr
         uKCwxal8a05VQNYwZHyQrVTqTPw+8w9FreVOq9BCdQDgnu25N/l15OjrRNwI03/ElWHN
         ZvwyCpXzD+PhRsu+V48aTudU7Qi0+tFM+XQY6B6F6DLVv92pG/p5ILtdv/qRYDq1X54B
         2bRxF1MN8ffx5wdSUc1eWMJ52EPCzxtwL+5DJm4hvzAvyLhAYP4aObC3uKzh9bjdpJKS
         erIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623572; x=1791228372;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNYJ9iXwZtkkaIquLN753az1rX5eiSNS35Ev0JuX/44=;
        b=dTUi4Vla++yQJkCfUT199ehCKsXfKRLIwqqbFPHv3/8vaB3FTpn0jQ89+21Hs0IESS
         j0j1HLBoxlvNmw79U5SbanQwcUCUkhMAIkWprr4MLdkYpJlWFNFTD5AHAutbzTjNu2/2
         ngJB+LEwt90FZUJy9cZM0DpyMxIvh4wToanmwR/v+er7VyfBTfA5qDfRuSJRu5d3Yb/R
         N5C2uCiqxUC0bs6g2ReO/63lAx+B4eXYFlQCH/AaW8yDi0j9mV4WjxefgytRF2vJIPFR
         n3PZWi0rPCgKQYDtteKtAo+YT2L+zuzpDZaTQoDq9bTDiKayFgxO1P5oKmhfJZKytecy
         UycQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAq5EY3iZL6Gi01Fb1/T3jfcIkRpQKO1bqyUIARj6JkosPw3e8jbPTcwq6hs5l5AeAujwjOdo1NZzkvUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWUj8vj+2UWxm0upl4ObPoTruImo8t128HPE/dsiQ0g1RAYdI8
	RWv+6OIYOFl+0WwO2MZgwmo9/OEeRu8fymjWZ1tCmtucCglPoiqIIAmoe3+SrmoRjpIbJNiQwiA
	zkL9KSg==
X-Received: from plat19.prod.google.com ([2002:a17:902:e1d3:b0:2df:b3e8:1983])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c951:b0:2dd:c053:82f8
 with SMTP id d9443c01a7336-2df7deb7760mr122583415ad.47.1790623571619; Mon, 28
 Sep 2026 12:26:11 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:26:10 -0700
In-Reply-To: <20260928-vfio-v4-0-e32e226d5932@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928-vfio-v4-0-e32e226d5932@linux.ibm.com>
Message-ID: <arq_Uu4cXOT5PA5C@google.com>
Subject: Re: [PATCH v4 0/6] KVM/vfio: Use file-based reference counting for KVM
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 28, 2026, Steffen Eiden wrote:
> This series switches the KVM-VFIO interface and external consumers over to
> standard file-based reference counting, eliminating all external KVM symbol
> exports.

...

> Steffen Eiden (6):
>       KVM: Introduce file_to_kvm_<arch>() infrastructure
>       KVM: Add file back-pointer to struct kvm
>       KVM: x86: Use file_to_kvm_x86() in SEV
>       KVM/vfio: Use file-based reference counting for KVM
>       KVM: Restrict kvm_get_kvm/kvm_put_kvm export to internal KVM modules
>       KVM: Remove unused file_is_kvm

Acked-by: Sean Christopherson <seanjc@google.com>
