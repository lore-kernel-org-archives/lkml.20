Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0285F471CF6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039690; cv=none; b=tMIUTo3fl7+pVY1NhDfqQyoVTGqQQs25UZrDTPAHuMXrJikWXZJguI6KriFcVH+J32haoo9/z++aMky0NmiEwcKouPuQOGC/2IVx9a2pc17wUB3+nfJtcgpNPSbIFmtuAX9sAZXPBREqTkzZMbifBpQDQNAvJDRLWeEqbwWUCRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039690; c=relaxed/simple;
	bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=E0arSJ2kA1Nlu5JSRl9+npM1MPFNNN8DHHIlSqi89yyiaUP+PPaGeUBu89/fCRP9GaqWmlwydZ5AuUsXE36v4AwZhwiq8C3jGQJxlZQqQzSPuvgdGvyZpUloVNAMgMYs5puufbwg3AI3s0Tzlnkba2CwnQmN4IdrCaRV2Dk47+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erHsHykY; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erHsHykY"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b381337e1fso6616891b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039687; x=1789644487; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=erHsHykYY91loEwSURWmcGU3eqYDrnWrFj+g4RMTCSht5u2VSncyxjNGH+f+EwfhPk
         Y2lqwo5FiJE1gy9WfKMZm5Ri/ejfj0/0dhrZe02zWPoxhriQsnUN+c3ydAluU4GaeF8m
         N99835VqZS8IrRhC3VMTciw/o0wt9GHOgGICCm0Rs9Sr4eyqNb8tFWaZSJCumPJWBFVJ
         cook0EQMj3LMQTVbAdXovrYyVDdi2XYCHqDJ7QZP6NtBj++rhZaUjONPs6qHWLTF89dO
         RVgAUpMNl5+hO7irYaId1UTl1hYmlJFUldcHd8LoQ2SeARluUJoabeML0t9KC3OAb4DM
         mBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039687; x=1789644487;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=RiylDanXHxbFF3gYZVOsZAzhWF8P+GTbW5Bq6CdOnocP033ODkaDXR/INBrRtprKf2
         Fxrhgz2JcjWtq6thsm+k2ZR994RfxpO/IDzQS6EHnVJb1Fu6BGiWCNJ0CXuUued0Va80
         m53Dy13yYPFe2EaUx+9qlf/xMWwB5fBCCrtaFoWSrtzXhkn5H9OzVkf1vl0/IDl6SUva
         ogWp6gRH5tC++SJOl+ImRVhBWVNPtF7UZEfUb5tZz1SAq8jDQHvwikSbf7bzJ77uacj5
         5AjInVJC2mDtAadXeZrisgcNh08W30K0oHiy0GPGD8jppuiCNomkLbqyKqcGIFTQNPk+
         fP0A==
X-Forwarded-Encrypted: i=1; AKwUvBzglpAIbKCdzhVCdDw4fWBOlJrIb2F/oD1M/vQAPmflN4gf3k1IkCBh9pAG7iL7vpK+gzjDxlcFPBQjJk8=@vger.kernel.org
X-Gm-Message-State: AFuF++lDq7GYlOauzFQDW86vXUisKgpgNu+PGgG++TxsQxE/H0BTCed2
	GjOSLpKdFE0502rGndge3oq0Y52oNSGXWZnV6LQ1UVqAuYOnsOQaA98s
X-Gm-Gg: AYBFou0ODg6nWC66+etpjI5vrrWlz1zVJYVh4vXgLTpeItJj1fI3D/H5Uy1eFBTH/H6
	/VQtMPsmnk2/UyECh45FvN8BvCsT03QdZwvGsBBkzqvcIso+gIn09icaZBDYZFkIaZsSQMfbqQv
	3LDgGihXOObNeK3rKqGzm3/TQeDIAXWpm73fhhWPr/YhanUVWihuFi450nvyo+in9YG6/S15p5m
	mVdGtN7eRZFfJRDRXxsK3ip8y1oRwpPno45xx+3kJe5MH13Eg739IQiyYCYNtxW3bpuqSuG+ZyC
	Sw0mawUU7SM930LNErYt9r1NqkZ/jguoWobo9USZzLElvE0NzRjKOeihOcNYjDBM6+rckImsnSC
	QTPecg2yV9YudceR7XfPirjrk51v2h7mvufwneVzeiMGRpm+sa5ZG/TNZ3QipJeMFWfwh906HM9
	cSKHMk+KQS2MulEJgOSJIXGHsC0+ZZiuDkwECPAAlQBRacBk3+F8Q+sZ0NlKbVF3jGKI3exE7aM
	i8D4gill57FF95kH/Not76E6cl2p1q6Q/19wRUNWOO+YvWmxnGrXeKG0kYD0i/UfA==
X-Received: by 2002:a05:6808:f09:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4b95db6da80mr27637088b6e.0.1789039686755;
        Thu, 10 Sep 2026 04:28:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm49398440c88.8.2026.09.10.04.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:28:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
In-Reply-To: <20260902164123.2546762-19-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:57:29 +0530
Message-ID: <4ifx1h3y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-19-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
> input is guaranteed to fail the test, and with the standard error message
> format.
>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
