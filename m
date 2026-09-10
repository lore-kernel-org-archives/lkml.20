Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2846EC62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038010; cv=none; b=htMrBZbwGZ+KaxOTxonhXIJ1C7555m3Ei5ChxzgKlGxOA/NgdbCOpJQU8KaziFnDU/RY7hhCooQW4C7SOGfcq1YK4xZP5ZnzTS0GNsr2yCAXQcAifnk0/0fJTHukic3F1fpZJl8K6VTWJ2r53qf3Vx3fKaiEMSM0KHBPAQnQJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038010; c=relaxed/simple;
	bh=UDzFuqayMptXRxyD0sVNI7x/dzCA7DIHFk14h2KsjfE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=O1clgqQ1wQbldBwgMXysjMMHWoEm8q+OuZqgW0GZ6O7LsfGAW+4P9N8ltFD+VKv4povwpSsKvKR1QIydcapvEKBMrFIkmXV66dBfcJffs4u3OxezOhF+/vgb8OY6CojYYXNypZLtiBeB6/E/XUr7RZ9XZICCrQ352kS6CooKaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIIrBGJq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIIrBGJq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca12086c06eso5368459a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038007; x=1789642807; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=gIIrBGJqKIHk8cIyZEkCNQjmwhSOmnmB5SUHt4Pmb1Gai7K+cbZ6ZL+bUqRhSz5RGg
         vCfMEjdeRI/ZCrOCx3672xDJJNn1Akxim7g183QajbfB4c6kDZ/rayTsaeAxNxcth+oo
         ixs3gdUdANlnB26VAQEJ7uQu0C7hL1mlzZuSa4fxF+yTaANzfSWPzDfrQXGZfRhZyGn7
         oBYuZjmmgg2CWMTu7c7tW9s2lMQddbsSooAMIQNKVYZrL7qBR4hcEuXyZPFRaBFRnf4V
         6LEholhrwxGu5atDEOLGDKxj+tHvLugO5bblhPowVKJJSbwx44AKO6H6h8N4IwQ/rKMG
         cEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038007; x=1789642807;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=B0MOSCH6xWIQ80aNOvznwAISV/MV9gi6ztfC8fWxhcbicL9zJKEbCoe81bqY+fTZUS
         rfkX7O8AcUOguvIsM65Dlk1z3HlZPGEhOie2wEFEuqaQ9DSo7flbg6QRa3Q3hEmVY0Kp
         w7LNdpc4uRznEzdjtbuAXEz24YMSt0sAdcbqfPCRA8vCWGjK4+8GPD5Ni2FK2A9T4Tpn
         LIA9weg/VJwUsUY4uneIGwwFLVs5o7fzqnhA0S0H2ZhrUnQRCTbwyATF4Dr3VnZlpZ2N
         Rh4p739S89lg00BJjfjvOKlYfi37j5VZ171NCdRP1LJzkNoapVxe2lumKBQOCqUbDJbH
         Et7g==
X-Forwarded-Encrypted: i=1; AKwUvBzjulzr4fb+9MaL33c7/y4YTtewyaHrYQdpCOhR5I+vFMZoixaeA/oWsJwYjYaSiOjvkUKinmUh+tnlFLw=@vger.kernel.org
X-Gm-Message-State: AFuF++lPzyOen/mQxpjG5qRMzMtkhnlfrG0X10SQ6pLT3MKFRNrRTZwZ
	czkeo+qL2sqEN3Y2qO54H+63yCzUMOYH9OBeNnq2B9H/LWKOgFSVNv4j
X-Gm-Gg: AYBFou0kAjZZacYa+ppwm/To8781uY8eeZBheiOFlwEV9uqg7X5nUettjtk4iXY5ZU0
	285nEV/GA2SxeXRCZhM540O1PpdgrKR7HwVDChdAoBcLnPTiLTuhZ4Je8yFPyZB++jY5fgDczdr
	y6313hXe9agb9sufCSjq/wyLfSSLpufrPuL4SAYAKLBvKZERwVfzx6LnxBfvYq/NcQYe2gB6GVY
	dIypDD5zJdHQFv8HtzdWLmdUNBsCAzpOMCTVG2YZN60NsWGrheHEk4GetsEIoHcyIFgt7FA8xG4
	FNHOyn0uXHQ6oI9MnYCq3CfNw5ZfgGe+1QqTLhxDWva4rU/dtpOapfqD1gzBxRrS80X9jSYOEob
	S5wcq7psq8RrAal9BJHeiInhloyHL7Uh+x1H/8dxCWeqG2xl+t9INtLmyjQTrQ2e33e4jpnptFs
	MzCeQZ6cDH9+jJTYWztT3V+tWr7JJwhIbSmhgM2SMhoFtgvx+XsIjZWcYkLdIJBOG5mxOdHWe3t
	fzkiRa5AZ+iy48AcyFlb/IrYVvPl6cziWOlPxNSZfee+zLzJ0wGTMk=
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr58529054a91.21.1789038006053;
        Thu, 10 Sep 2026 04:00:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm46703778c88.13.2026.09.10.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:00:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:25:00 +0530
Message-ID: <bja51im3.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

Agreed with the reasoning. LGTM.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
