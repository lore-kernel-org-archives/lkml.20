Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502612;
	b=5H8TaAlIKMS/KtwhAxhyS4BjUcH+JtgKQQuQFT2KTfrOjmKpXLAsDWNGmfTA5LN7VkVl
	 PIPN353dL2FgDA/W9DMcFnP5cC6/PBHSbczCPp9vb3oGVWtNJ2QeZxMHZTzJs3qccRxYs
	 /ENKLj2x/m7QIByT0j0HEJz9tjB8UdfB49LUqVpgbkBLj+GtXGPzq6p5dLZ9mkG21shhW
	 KmwqO0a9xS3L7gBT3x28A+trMykhBDRYXhvDCUSMUJxntYayJ9zLPcfui0OoUskmx9Atf
	 WoEaG1xIdzIiu/foG8r1DDyIiJphpeNt+tsIL/N7Z3g0TqTPlgiC9BbeGsVZHfNUX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502612;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=vm6uQFMUOlEK8EAN2+0e2HbI3MSSUoFOndOtynycXe4=;
	b=pRuiPcA4FI1itiXlOH36SrEW/clXo41NgriSe+BS2CRcF1U1tIyAlftu3ULYFkCB/hBN
	 0lwS84eYJ7fjdGxAq7V/G8tarPSOVp1WGjYzEydzmnEJyn7WISJxK23sN1CvqVkf1BccI
	 QpmVV1OxNtLpePxdP4iKgr+soMXJJSwJrFqcRkeutOHZkuUfFe2ihUv8tMRZRWy3gaPI7
	 1cqEC9ZzuVbuTl1tXT3OtXTPmwedw/dyWpHmISdm8TU/LLOby6NFiYuuS0q+/gNHbYBvT
	 zNG+wqFA04mZh8umP2RoKKSWyn4XpnRtMrMkdAYccDod3rVYZSsT+Ei1kn90LHU4TBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eXKLZ2CE;
	arc=none smtp.remote-ip=91.218.175.18
Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eXKLZ2CE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vm6uQFMUOlEK8EAN2+0e2HbI3MSSUoFOndOtynycXe4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792502609; v=1; x=1793107409;
 b=eXKLZ2CEsRs3cc8t/0JN+EqorP7f2s5GnSPn0qVrFR5E/YtNuz0eLndpRFgvebuRJ2bMgl89
 /Cvy2FUcXxY8yIJxdjQpOI468i+CzMEkGomyQapM2hgsT6WaXtWnUvghhiJdc6Gsi2atpRhlhfu
 5EFdthVLtiqTV7OGwjmBR67U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f4af6fdc374eb88f;
	Tue, 20 Oct 2026 13:23:29 +0000
X-Mizu-Trace-ID: f4af6fdc374eb88f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6909e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXRKmzddZR8BKtODGbvEGfNNfijxAGb8ztVa6PVuOdL5+D34z2erOT367jakqtJQmKFQTDZthfDaFwQzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHrDTIjOkzMEbyP+965QxfC4bBTLtfN6Dp01dofDA+m4KTNcSd
	qy3ff6T5ja7RNxaaME9szI49MCky2pFyWnt6XihyRJ5sahr21fELAcWNjmUaOnLMBr8R48DMGwP
	0UD8fysvxhpSRBDGPXVMwdHCGtnsieLD+yGr8+y9U
X-Received: by 2002:a05:6512:10ca:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5be66f2d62fmr149788e87.12.1792502608409; Tue, 20 Oct 2026
 06:23:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-2-fuad.tabba@linux.dev> <atdUzfOA1Obd7Mir@gremlin>
 <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com> <atdoknSMviv1xdqd@gremlin>
In-Reply-To: <atdoknSMviv1xdqd@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:22:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwBydjpMR+jheWzFBy6X+jXxvXF5vygfToHaTYh6XEcyQ@mail.gmail.com>
X-Gm-Features: AclHuK-B0w4gvRBhE874iuCL5xWD4kCqXtNGNKe6lqJ9UqbH-GMhLoiaQjnhj4c
Message-ID: <CA+EHjTwBydjpMR+jheWzFBy6X+jXxvXF5vygfToHaTYh6XEcyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Price <steven.price@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 14:16, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
[...]
> > I'd keep it: it's why the whole folio has to be cleared, as the flags
> > on the head page cover every page in it.
> OK, but there's an inconsistency between the comments in 1/3 and 2/3 (you update
> one in 2/3 to reflect what's happening), so maybe worth having the comment from
> 2/3 on both, rather than this one?

Sure, I'll use 2/3's wording in 1/3 for v2.

Thanks!
/fuad
