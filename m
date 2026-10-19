Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9EF4EB849
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410248; cv=none; b=bGlgUoA6kH+RWcYbwgPLKQu7nBAaGzz38IdLoGs4nS5iPdX6lEcRvoNrgF5t3vJOsT4RVrBB6Frf9uudtUX+0sbwcWaRkY8qYDmUjXQnqLpYgwr3Zy8UIBqDY/e0McF2jB4JI0NBB6abY+9sC1p7atK0FPH36uzI+K4au+xydA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410248; c=relaxed/simple;
	bh=QkdzoORvtgg7KQohGDt3TNHW0PH2R3Zz6T0ndc+56Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4VKFsLOlxRYJVT9ac9IosPX0lChx7x/JYq1wvhkd6/q/peUF/2V47bZIHwJVjOFxZXYSZR9YXBIzrbK99olwOIMrop1lr4vT1wRS6fZXPVhTnxToOxNG79GHtL4TVOC19VQ8zkkPeKFxIksOMtk7fLMMSycs9TalQaRY1nFbGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LKmpTjE6; arc=none smtp.client-ip=95.215.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LKmpTjE6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QkdzoORvtgg7KQohGDt3TNHW0PH2R3Zz6T0ndc+56Wc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792410237; v=1; x=1793015037;
 b=LKmpTjE6NlXhvyA0a2/Rfs0iI2As3QBkMkf9I12fIV9QfValtcDar0Xq4y6w7Sg0Ao9TA8sv
 6qtEYQ8anC2SlLILaDhX1b5CrUrDk7gYRmqxu3M9W2nonynBOSU0nFz0r9QuURiZfG4wR1lZuSv
 ycsa4wAELOeJOwPiT1pY7h+s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e578383164884499;
	Mon, 19 Oct 2026 11:43:57 +0000
X-Mizu-Trace-ID: e578383164884499
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM
Date: Mon, 19 Oct 2026 12:43:56 +0100
Message-ID: <20261019114356.3528479-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <as-lgxiD5wFBWEOc@e143914.arm.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev> <20261014125510.2928306-3-fuad.tabba@linux.dev> <as-lgxiD5wFBWEOc@e143914.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Joey,

On Wed, 14 Oct 2026 16:53:39 +0100, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
[...]
> > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> >          unsigned short refcount;
> >          hyp_spinlock_t lock;
> >  
> > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > +        int *last_vcpu_ran;
> 
> Trying to think of a better way to reword this, it's an array indexed by
> pCPU, not per cpu in the normal linux way. Unlike `mmu->last_vcpu_ran`
> which really is per_cpu. Maybe I'm just being nitpicky, and it's fine as
> is!

Agreed, "Per physical CPU" reads as a per_cpu variable, which it
wasn't. After Marc's comment on patch 1 [1], it's a real per-CPU
variable in v2, indexed by the VM's table entry.

Thanks,
/fuad

[1] https://lore.kernel.org/all/86y0buyo5s.wl-maz@kernel.org/
