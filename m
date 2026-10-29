Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311483;
	b=iduOWS9Iogi1UjcfUJuVfha3CjaQbCAErb73PIkqVB7syXt2SNZzQgyI6IrDRRMtBPvZ
	 RuEBGSNpu4Bxfv0uoUKdzI4iJFXlsQ3uXFhh8be/Ojw0XbPM153CY8ntjxG5C+m/M3saH
	 U4/F/1X0FoGT0+d9RKRrhjmUnghUgjN+csJBDmEa0v//S7tI6CpnfGN+dq4m4ATr5cyaO
	 OVxgjTs9WOmODOdK/9vipYfYC4D6J2ObEcmwDgUd3qDmZ23parf6jl77Zd1RaSogQjT/d
	 ryn7lqvvRo15qj8lUZ0wv1jTB/GipkkhHZGOM2xwpYYfw97lMuJcS+Vdph2eZm9HkZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311483;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qYbQzwwz9h4FO+VW0r/egh1lxyBMUI0Ck4LAOJSy2I0=;
	b=KP9f6hhscmvwBhdMs021TEkgyTecQs0OBiosPJgl8m4w4oT9GdzlROOTSBoZhEfkJVHr
	 I59/jNSAbwxL0sqInFJ4ZufESJI0q3GHyVDdqgUDpoGvTeBJpixzG2d7OOsa8+pR7miwr
	 n+krPPIMy29dGkPBMd/aKSjSkGUcr5+5tW4SvodxET+GUZGt/1oJUU+F1pH+L8aRQG96r
	 XDiqoy3xirmCM546q6IG/Q3kYr8drw6aAIU0yUb33w7a6t2RVF9cFQ3y4av2R5vadkw1S
	 TzeC+Vnf0XT0UNa4EveY/vVGDGQDHKugCz0vKBEX5a+R51J2demee06A1oEBJKWbvEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upv+BRLR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23C6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upv+BRLR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD07815A1;
	Thu, 29 Oct 2026 15:04:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE4453F673;
	Thu, 29 Oct 2026 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793311481; bh=cF8ZXU+yg8O7anxbXOyalOzsUNIxFJB1v9XBEV+iq38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upv+BRLRwQd8M2cIlnBmc1JNLj9LEYmnebc9S1iNqq1j4x5hI/D9+E1myTzbd/rym
	 1p/DchbDZg2h79bXS7E+j03dg7Lpn9wXbnSDrELDsekIhhybEFQAAIGGco0MdD6FYB
	 hPBp7C8PNo1dzEk0Ho99RvctNqSedz751cjm88fU=
Date: Thu, 29 Oct 2026 22:04:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] KVM: arm64: Sanitise MTE tags when a permission
 fault installs a mapping
Message-ID: <auPC9aOxXE1mIJn7@arm.com>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
 <20261021110700.493315-4-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021110700.493315-4-fuad.tabba@linux.dev>

On Wed, Oct 21, 2026 at 12:06:59PM +0100, Fuad Tabba wrote:
> The stage-2 fault path sanitises MTE tags only on translation faults, as
> a permission fault normally just relaxes an existing leaf. However, when
> the page is backed by a THP, a permission fault at page granule installs
> a block whose other pages may never have been mapped or sanitised. Once
> dirty logging is off, a guest write to a page mapped read-only during
> logging installs the block, and the guest can read the tags those pages'
> previous owners left.
> 
> Sanitise whenever the fault path calls kvm_pgtable_stage2_map() rather
> than relaxing permissions. If the VMM replaces the VMA after the guest
> takes a permission fault but before vma_lookup(), that path would map
> and sanitise memory from the new VMA without checking it. Run the
> VM_MTE_ALLOWED check in kvm_s2_fault_compute_prot() on permission
> faults too.
> 
> Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
