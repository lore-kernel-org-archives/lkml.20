Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361039;
	b=srTTuX3Ecw9UNWeHAMEmMWQcpX1kmoxekD9MGHqCsY+yatgsWIGw2Vg2UdoUKJNqcYaw
	 00UlQZLSOmwPlymrHPwdh6C2cNsLm2dMHMHjaAzEPo+JrNVePC7oBPgy0w+InpAev8VPB
	 sYIgDt0bNmaw5DXa7wDQ3k8zgVuid72e6IF/4J9uJoXaj5hZNgMzW86PnOCUfoANYvEHU
	 4xkt/67FuMUai8CfuleNYHUY0PxbWJVqNOW7j5CYq2oZS07Ilx9Wd++vE6yFgAxrCIoWf
	 e/dZzDmvyNNnO8DxttHjEiBB3rjOadUZBO0QboOXnpVBetTkFY5QTanZAfAMy8rX2sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361039;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=MXzFIbuDJ84A/5AW07Mg/XHQWGN8y0TeHvaMsntxdaA=;
	b=zH5+XG4IxlFvFIppsCbq3jfnnaAFkA1S3ikEdgO3N2mXPORdhlnroSz5tB8mEwqTPKzK
	 ziFR9a/49hV2I+EA71VB6ye2J603S2eq1R/xCIiBNGBKUE20qVsEMhzwEATwt3v7r8WCQ
	 dKmAPfcQkLuzTFw59vE+ynijn/vVHfkW2Mt6vAiO5AnGyMiQAsvpbsE206ZcA7+59zMyP
	 aHwSeuTkuaip0DLtQ9mCLYhB3DnH3RFxypziTHlegv+LGaYZ+8MC5VN4UTyKl3nhqay0i
	 CwGLo684SJPKzNm5c6ylOVcXgJY9oJtpr+DFsvuWNOgosCszM3w4h6GjiebGbGk8wIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="lU/tWOyV";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25850606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25850606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lU/tWOyV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4022C1682;
	Fri, 30 Oct 2026 04:50:35 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05E583F7B4;
	Fri, 30 Oct 2026 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793361038; bh=RP5O8+TrrNiChKav5OBQ0e3c5WvNX6Y1zOlCAMRl860=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lU/tWOyVHaLrUngFuy01LnUghNCRymm8KuQDWfUt+bNjrVmcqHWMPOLOE+tEjEf4y
	 F1eH9vtlZ+aNfreW0na2a03e7PObmDRiHq1zOHTZbRn1xxIdQVHK3A5ve29GXFTI2w
	 hexk5/pmFi5m0iP0md3LhC6nGY+3Qn84Ujtw+J0s=
From: Leonardo Bras <leo.bras@arm.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA alignment
Date: Fri, 30 Oct 2026 11:50:33 +0000
Message-ID: <auSEiTmuLcPmG7Gs@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029175238.3214788-3-weilin.chang@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com> <20261029175238.3214788-3-weilin.chang@arm.com>
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
Content-Transfer-Encoding: 8bit

On Thu, Oct 29, 2026 at 05:52:38PM +0000, Wei-Lin Chang wrote:
> Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
> in kvm_s2_fault_map()") created a variable to store the canonical IPA,
> instead of calculating it when needed. It moved the aligning just before
> mark_page_dirty_in_slot() to an earlier place but did not update the
> comment.
> 
> Remove the stale part of the comment.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/kvm/mmu.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c7df646af79f..695c6229a216 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2232,11 +2232,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  	kvm_fault_unlock(kvm);
>  	kfree(mapping);
>  
> -	/*
> -	 * Mark the page dirty only if the fault is handled successfully,
> -	 * making sure we adjust the canonical IPA if the mapping size has
> -	 * been updated (via a THP upgrade, for example).
> -	 */
> +	/* Mark the page dirty only if the fault is handled successfully. */
>  	if (writable && !ret)
>  		mark_page_dirty_in_slot(kvm, s2fd->memslot,
>  					gpa_to_gfn(canonical_ipa));
> -- 
> 2.43.0
> 

Reviewed-by: Leonardo Bras <leo.bras@arm.com>
