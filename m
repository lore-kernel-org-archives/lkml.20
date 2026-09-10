Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4813CB579
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022334; cv=none; b=eh4op8YIfeNxsYd8IuFIgcAlPnDx0i40nL0v8f5MKfwi91QuKe8aO7pV11XVspSWzIMdziIYbFIse2UDCL/s1wB4kZJI34vFpCqe8wq//18NktSH19+sv4HB2QhiZ1e/vNTqGp5LWgqkXD/2Uaja5alesSPy5Galvd3tBEoE82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022334; c=relaxed/simple;
	bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=j5C9ddthTrlAOImwEt9Y9cgoKgWjoReozngPS+T0Gy0qFUkcTV4vXcGi6mvj4m+cF0KC2fVyaBWhM+zq55+5mWdu4HtcYbicnBkSxmQ7pwRra9Hp0BcBEsNZ48vjXARxhhRfRM5txz52zrEqRqreYWyisYkrjngpsxq/0vCHY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3rEMY5z; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3rEMY5z"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39675172593so5698104a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022332; x=1789627132; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=C3rEMY5zQpJoUyUIRSHpprr56mpVbR3wVWT34RtYT60GoXPTdkvU8gnc2zd7WLzaRu
         itRbHwRMPPH5jjYSq4T0+4OtV7ReuHjE6ga/KhxlRoBBAAADxmSxkQEm5UCaXWTl1RL5
         BXhUaL6p/aQIm2hoaH8Nbus0qAem3baIoIw/vjHo85oFeungf4i1RlhYrHJiT5+qKtnP
         o/3D2donNSyAvWNovO7IilXHBPTTnXCWX1U3Hpv0MhGuJDDBgqooVaU7D3fVb4+KGi0X
         35bpsnsiKkr1vAX6WxTMCpZv4wbVopVDHAFxun7A7Fx20ttVxrAOcjnKKmSgiRwrUfFb
         Aztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022332; x=1789627132;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=RvuQmZSGQxxkBwgwOifrTE10pc3+0YOHIcpHr0a3ACBMN8ETZLX6xMt6tW+iuGzmQr
         l946jP+Awn4nChs5fe2KxxgT2yfO7LGM9JiHLeQn5mubFP1qo94ceNmr9jpAPacp5V1k
         +hl4+Y13XtRUfSOmN07ACkIq2OSDufL4Rhe5C7Un0+DKv7Cj2TwszGLIZwyvbUWV8/vG
         vVr1j4ibKEIt/AbZAUqeLc1WbWruUfLVwwrXyGHF6FdNO0e8h8xcfDxTuqDpiDMKhz/D
         4E5WOJlCiSzLb7wUGJZFoRtvQu1UOBCz44A8S9VClRUKVK6CXGbZ9HjSKM3WfPxilwVG
         u56A==
X-Forwarded-Encrypted: i=1; AKwUvBywwOgYSHx+emg/gNfsZH5PgbiszULhvCy9mvJ/PCB1TyjmwTcBLU0xnvijhemqvYIVYsAX8AVPIOTkEhs=@vger.kernel.org
X-Gm-Message-State: AFuF++kklgdphmSnwm93F7xCDW1GvYCSZW63cQXKQFJO6cHhop1YwXxO
	qYWeYN+84gnLQgYrU1fmX0ir2ouuHytm5YZBPBxLDBxaOZsZM7fV2Omi
X-Gm-Gg: AYBFou192hLcJqxntYkMAW8x0CahM29BIgajz9Cmza69IELi0bpf3/PmInyVREaoi5z
	40xK/acYZlgLX8cPfCKXqLu6XH3H3tdQIKwk51tP0s8OFOwF5uTpjijRBBFqaRIsD1Em1EcGrIa
	DmywPZbDExYs4CiO/8csfhTJrH6YrsQc3cn1h9UCtO8VZ4449DK+jCmOsg85dDJCeqGtuX5r0Wu
	CplM7g2R3DcJEu5JKGjE7yTRPPGDSHgI87PJrD1ynUjqmSMeEwH+cT568VLKDLCoIgUOj7Npuqi
	VPPF4rxSONzHc6KbU5IiXiAdvtmAhiCxIushKiEVUP0migz7gDjRdcdyBw8ThCokR9xkVEl440d
	7uANhT9lgy6vD5SNQZCsXqMk++MCSeGTOJjf40tsVBtTiC/ytsFn5Hd2Mtk8zPPG2k73CWHlUwt
	uoGynXBAQg8CMqniE9vFCE/NXOZCKIjQ4zunZhozlBfKOJOBQOS/X5xUHEiRdOxClVIL9pCX8ph
	3uO2gABJFeAiRWDsNv0a+T7OLXod8s9Xhbljkihld61t0pftUcgaO5T/lKnDaL4Ng==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr38222127a91.6.1789022332072;
        Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10464300eec.20.2026.09.09.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:51 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs static inline
In-Reply-To: <20260902164123.2546762-8-seanjc@google.com>
Date: Thu, 10 Sep 2026 12:06:11 +0530
Message-ID: <ecf11ulg.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-8-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Move the single-page allocator APIs to kvm_util.h as inline functions, as
> the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
> to remain that way for the foreseeable future.
>
> No functional change intended.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
