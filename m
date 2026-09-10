Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503A046C835
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038590; cv=none; b=L/ZyInYxWf6Zob4Q4iAnYdL5u/xh6Zcc3T8kNFDuc/L4fuT2cQovc5+e3FSmF0AVeBZmW4ASpqhyWKnX4VZeNwvWWGB6Wpy/zpbL6x7EIzHOmgxzWOYAbBUjhbovZ87KpEdZIzCC5ADVYOp6RyoYEdEgEr3dd3Zr/fi+/NbSiL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038590; c=relaxed/simple;
	bh=Eo81uOdJ+VH0txQFT7CDWDmJC3Wu6IIZvi7ALvkgXzU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=H2UtLSaeVCjUFyf6wyeLPWwhXLjGisMWWqQIxPf2VJ4wwi/P+W0Aas9RSxTbyRTeG3pahZgx7eTzE8plJQ+9lZnHlojLZ7So2FNzG2xztzI7/tdlGIN40HUo2+hSq5TIwXCkdiC5tcqPIomP+bnA7C1K6ULfDNbpom3d/M1mfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajYJdw4t; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajYJdw4t"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso989808a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038588; x=1789643388; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=ajYJdw4teckvPm1NNseabla1HsidOImL0DbGNDMgfy+nS9LhksOvln/KTRyuC2PlML
         BGmBJvnDvf2mEzl/XXGbRisGAXunAFN2FVU5gcyXvcNXYDmvJV9swEdFRoyXsWqaZKzs
         STlZsZCeo7rdyNzeePAUodffnccLCf1WUMvABUQemnP/D0Bo+gE10erJSXZ+QeKUUWPb
         DKNGcpIQPQAOocNzKoH4JuUPAQJz9goxqnpcJMUn+/VYvP/yxHx5xDU9CoHA+TjF1axk
         RHDAoYhYAPlmL8e3drNTe92czh4tQ7VJfz4hEMppUJ04gr++U81qw/Yk55yeaqjoFrA8
         NTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038588; x=1789643388;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=fHFN+FDxoKN25SipDm6s4bK2tPLJChT1aNlmWW180lnIiXXEP6N2bO3cQC5xOywonj
         QW+jsivYlQZGxLQhRDbGN7dBXeO7bZdXibP4asbomg7WOADehoyQpKdJMy4fKDO0M0q6
         8ero5b056cKt0ZHQtKxpSsB7N4QjtwwuqMz4UCYY0Yozu7UOa8/SRasRJ8NADDrj3Azw
         pXEjBZCXkT2AC15qSgeH1V06FUW8nMo9tqoGeysA3nO1WuBajew8f5f4U894+MvsYNc+
         hFmi2POQSenx7nMN/2v9rh6AE1zWbeMSR9/HbXzORNFelri/VeBoGQwIkhtU68xz/mYd
         Xqhw==
X-Forwarded-Encrypted: i=1; AKwUvBx6Y8MuNuh0xzJpdgMWq34UmkgfJh3Hji4DJqRp5wZKz3ZKLk1BqylzGadOinE+GdXdhIskxBKlOIGbGJo=@vger.kernel.org
X-Gm-Message-State: AFuF++l001xdMbagOLrbyUQy7PcKi1e5IVh08JH0KN77b0xGrJPv90hg
	xOpPo8+Rw4KzAxF2Co0zx0n8IG+49qFVhP2wFBIGXQwtlUzde0B2x9JQ
X-Gm-Gg: AYBFou0cUKWs97nwuVS6SvlYoawKU2Kh6FIT1veptZFiGtNiYaoiiKwLLN0edMVqUMD
	MDi9crd20Y7HQmMlskhUcGDXDubCKPchaegiqfTc/jCncW8peGwe+hxwKs5sIIdduUx9SAJIQ4u
	Nh0U89NPITQSKL1qLYztQUwLwVedKHClfnMVYmJVp3mV8U4PPv0ONBsHk+J32t9vrNgTsBkm70b
	Df+j9pxRJo+38gH3DIK9rJrioneXc2yl+Ro+3V/bFarwX3yLupRRRYcPqSW+qMCbU7IQ2pPR+/n
	Rz0wLTea251CYhD4r/v99QX6cMCzeCvHsQ7LAtldvqacsBXBOHNWuMIXbVZUZjJqBN9ksUbae3L
	sQAruo1Aq/k0X3uwTXZP/nK5QMpRstvjkCNa+dDyNJaP7r72j6ujgfs1dzoxn2f+SRvX40rrVFV
	6GY5AS3P6IIP+OhbgvmBk8LSwnIGPZ6qHs6YhPd3bgQzI87VpuAjJviFsTanLHPpYpa/VjHmJH+
	nlz8qqceeS6I67aCUBSj3NBDLvbbW6Lle7f/hCx0rBzymxgAuTyWTs=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11082578a91.19.1789038588475;
        Thu, 10 Sep 2026 04:09:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm68881202c88.2.2026.09.10.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:09:47 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 11/20] KVM: selftests: Initialize vm->memslots[] with invalid memslots during creation
In-Reply-To: <20260902164123.2546762-12-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:39:02 +0530
Message-ID: <7bkt1hyp.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-12-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Initialize vm->memslots[] with an invalid memslots value during very
> initial VM creation so that failure to configure the core memory regions
> generates an immediate assert instead of potential weirdness, e.g. if slot0
> is coincidentally valid.  This will also allow hardening the region APIs to
> guard overriding a region's memslot multiple times.
>

Sure. Looks good overall. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
