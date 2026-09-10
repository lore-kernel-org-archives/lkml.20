Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D933D16E2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038215; cv=none; b=e/lIoU6EaA6jNIDAWSz1DY3uzZIe7+EjI29S6BjWuUT7BbnxTj5iQPcM16JacD7wo3rySfMYPjC1+SWX+jFpC4E9ZsSqhuGjW6Sex7XhCXMpI0bZZMXtU5eyK5aJfIjZIbux4yxH2ipbXxj3vTf2UsNP7oNSyseaqw8vvNBlFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038215; c=relaxed/simple;
	bh=3gHoeS5DETEBmd8V63FOswxYH+BlwM2UupwRK7ysm3U=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=BuDudZtyFWxPbeJs9h9H3NGb6TZd9oF/CdCIXy9ulD7Sd/0xOiiOGnAYJ+aVIv5ZC83qxq6afItGQtMWG8hKhbaH9hJP2IYIlpaoppbbZOMAsdmhuUlq7u+AsqcXinBbV7LxwbjBrfGcZvSGjF2Z+ombuQ37d4NJpjmHUGSbDGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em6YZZv/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em6YZZv/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so935036a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038214; x=1789643014; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=em6YZZv/DjbS4FIaDqISPIklDKqqy0CZ/CC5RUSa5uc2EZr69AqlyogehooMJbd0m9
         imlS4GUaTcg5d2+Acki9v5ZBoII92SWaKTDucBQ1UFDo1wksJssdIGxP69mEosFvTNs6
         4L0/RYunWb5Dm/GXeFo/G2FfitXHwbe+fxKBhkP28nSI/GQTpVWdd82ufZZq+uBcfO6V
         FWxFvxl551zyAl5sMCRPW5+Zm++kCmsu6LpEK+VtNyK2c50/A0/4kMZACscHCiV1fZpK
         xfGnsKvK5/fZ/eRP8Y9P2I/5QQlsR8BnodUWP3FT+dE6Wvd6L7B9JVwSBPZRsZqDSt56
         tMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038214; x=1789643014;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=qrkjGqxEEl3lATFgyPRYyKZaBcY50sUQBW8u7kPP3CUey8TKUoRF3CAyIsU6mRTWet
         ggAXCTZpTfW1MiL4rajcyv0wRlsLah2uJnojQbQB6nnwYrMdIgZbg9JyO/nw7jpDaYhb
         kxsWuOIqmXuFjz3S1oFroh3fXjVI167bGqUuCiAAvqaf0WNvxBjqFC5+OMiO54LqnkBr
         QbL9PVeCrWWDWDqi0T/9N4IKMEUcrIQd978BeE29Iksx5gUgeLeE47+70wo9B4eyACm6
         y6yehJPr90UA9GM4z2jR9vHWMVws7WsbJWNlu4WbTT9WUC7zwVlUf76UhKwYEnPTjIvv
         DIPA==
X-Forwarded-Encrypted: i=1; AKwUvBx8xGDuKw++xYc97N4H0Fo/iWOeAKJsPc27Bb3mc7S4HN68JGSJ0FHyIughqhcYbS2TWiOoFp+FnFOJ3+U=@vger.kernel.org
X-Gm-Message-State: AFuF++m3qVDt33y9EcfQTf6KUXLu1D6P0TK85FO+kLVz1Z3pWG4JE79N
	H3MlbJRmfOHEUkfp0DKbfVoogOocUVTxhhZ+8bqd2tG179JK2G5L4gDu
X-Gm-Gg: AYBFou3BjWtD+7fUh7D/h1l+DeK3ELZhJYIKf+KZTKUWd3kFGFvmptLR1o+rbOW7zUc
	2cPm7XofGb1CQEUmoqLjtgQZXnLB7vzqKGCzVzveWPOo9r95OXUqXUSGxXEU0kRVxYoO7P1gOej
	5H0dmnon87Qwaa7en83wbswkMwQtFVqoC+U/FiEBMP3dpktf96IPqDw7REeeEIJHNtSWHnMHQ3K
	qLGK3/XQd6SW73E32LaSERZmWZHFfhw20cKufeKUDfE2gtqn+A2BH76WacscnUIyz0BeuHIL54B
	iWVvb9GFmxAAvJGZiixDTVZoILkGg7t5E0RpS/Ene96frPTIbN8q1Vs7kK3rq1kXlT71FIzsw/i
	J98xmzCEPaSzTpjXGG+62JVqOoOqhqFpV9Qp8VmEbRg2TLxMEZMbluQmRzZSZXj1gg7zUuc3Gyr
	OV/FVpbSngm4pnjDuBEX5W4qMcC0K/SIwOXWXOkgkojCrqzrjeMll/HX+RlDfsw+uNCCYp2goj9
	z/5oJJ6kbgRiTIprPRHf7JeMM4u4LuF4eduSdwSBeB3sz70g3/c19s=
X-Received: by 2002:a17:90b:3e46:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39d70a5931bmr11901184a91.10.1789038213696;
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm50133517eec.10.2026.09.10.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:30:42 +0530
Message-ID: <a4pp1icl.ritesh.list@gmail.com>
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

yup. Indeed the later APIs will drop the memslot argument from the
main/outer page allocator APIs, so we need to use the
____vm_phy_pages_alloc() variant here. The change looks good to me.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
