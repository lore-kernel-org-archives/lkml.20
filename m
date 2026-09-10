Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E93DCD95
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041928; cv=none; b=ImkllBWMQXxxTzPj0QwCGAGG94vVF/zVIiotjdb8U2NmZDW0+0qZ4rEyR51kqjdC+JQTWve6hqFaX0fHpJDQazbe+SOLZP4REsbjCn3Mvmz26kFsDB4nI0Whjy9Yhgow6/W9uXUKtEruoLlwudKNP4hPSf8/ce4NNIjIH1kRjeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041928; c=relaxed/simple;
	bh=DthyWf2+A2G2Y75caLR9paCIYHUzGrDRbammkA/3Uc4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=JbBtXhZuMUTbKimFKd/388kArjW3ymO0RzGjEPigQtokYnf4PNFfVVWf4SA43skDezyLciVlilPK7hogQWSyrS7ZCKw8cWjacBOywCJEQA/UR0cxx75SVSV/XefuxPVfql97h+fkUPaTL6/jJC3RPz34h1aLf/bZpZEFEBkjZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYWA8wvG; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYWA8wvG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1499996a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041927; x=1789646727; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=kYWA8wvGeDud4JwysGNjSHcAcd9wE2You1T7agnFoW6lVbpLJkeQE7xg474UwTmARN
         VkrCyzPBwiJYVncpCLOedeaSI4XclxDvpfgMKqROnPc5iXzk+kbtosbkjx5olJn+fI6n
         A8lxZFcY4Oviqe3vojSitjY0gVuJQWfTuIQ7lz5DooTciw6jFxIOhzDasmWrMV16NHeD
         Yd/mY3WewGasK7sHNga3trwcWzjMxc4kQVQAYXCr5LQAMFyLAhRXvBJg8+jivbjp4h8n
         xewoj7/bGexSpKe6+fL8k6Uk1BnWCvNAvZZ/++hKIk1lAv/zaWTG7lQeo1mpnVi2dP4N
         Frog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041927; x=1789646727;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=MuiFuM3xTYze6tLy8+HiBff2IZDHIhAIWuSyo53GTTanET3atm7jS+cZFE1CYiOqzq
         5ZQ034R0/4DSF1VsuW7cpKnvn4aqy2or3DoR5FcbgtFVi/XYGfwRuGK2RM22j/rLwczf
         mK+mcO8tYZs8V6zoUTe3jdtEhFru6/azAm55J8UfIVFIy5BEM7qCJ+HXvRYcGn5uUEPi
         2zdc+ar9GHE1MO3goJy1pTWLhFJQxMkDgqTAVLM+KFc0D1AN2g6Ib/j5/yGNoC3vcHsr
         zBj6o8GuRE683n0e93Qxl4I64gwbdXspaLQRSRd5ymNkDImT/cH+BQ4HWO/0WxK/GrMJ
         0x4A==
X-Forwarded-Encrypted: i=1; AKwUvBwhdJCqaTpAcjbS5iNg3jCvxr59BayazNy4nVOxuX21z21pLPkXIjKapk1Xh+Hj8iF+bqKtvvVJgyU/L1U=@vger.kernel.org
X-Gm-Message-State: AFuF++nygMBHiS8jsYHdBtbkdx3GXyV0zocKtQIO/mqrULDhLdzZv5aG
	dDnbGesKxHvll9IT4jV6Madb7Sa5KvRE89z5oQB8ytBzTas5FdAQmWt4
X-Gm-Gg: AYBFou2eY//wbvxhN869jathAGxIe5sy7/HwY2u5TdK1P9/vfufxbmFD8SAKkN1dOv7
	75B7xdUG7TKOhazdrU/X9KLFmwiqBfNK38m9IxL+DOH+a0N3ggF06OgV4IU+RbPhpE26V9lpEq1
	NW1tCV2mH4sWKjhqJdhw8JHpZaRfEZaZhq5ZU+4VbBmA7J8L7bfLr3j76GjghGkyQy+i0PkZ05H
	bQPvYXr/E0MJVRRLwKJmMs64EWz6jBKkfDpuCmJ0TVLopwUDzmvDa3omzlTxxiqmejLNWmsM77C
	PTQD2l2lfmcB5eI7lH1JOhRl3mykYn32merxDcwLotG3fpE1Gu+n6JHNG8LJJERwUFuxXRhkAnb
	qJSR1hP5my3in0kVEbEdlcaEEL8munbHbwBC+QP1ziv7W+xrpI9ShLH3a8C13nDtrJ41LF4B2M6
	Jr2Ui6PS8UHa7WVOKKkblWFiECeKn0T5eVyEEilDwOsnqdbSq75LtycMfqOQOlDI5IMUN8WU1m0
	PhGQBi1dR1gGGt66LvYGqX+3nCELLWySEb3dOjGzjsLo8RcYR2vmq4=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11567376a91.19.1789041926812;
        Thu, 10 Sep 2026 05:05:26 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm59190560eec.21.2026.09.10.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:05:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 20/20] KVM: selftests: Add arch hook to force page tables to be naturally aligned
In-Reply-To: <20260902164123.2546762-21-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:27:18 +0530
Message-ID: <zexpz5cx.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-21-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Add an arch hook to communicate to the core physical page allocator that
> page table allocations need to be naturally aligned.  The hook will be used
> for upcoming PowerPC support, which has MMU tables that are larger than the
> guest base page size and need to be naturally aligned.
>

Thanks Sean, for these patches. I have addressed your review comments on
v3 of PPC KVM selftests support and ported those on top of this series.
I am still in the process of running the entire series on a real HW
(and some todos/minor changes to be done).

Will soon post v4 of PPC KVM selftests on top of this change series.

> Bury the hook in the physical page allocator to avoid having to plumb a
> rarely used param into the main APIs.
>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

As for this change. LGTM. Feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

