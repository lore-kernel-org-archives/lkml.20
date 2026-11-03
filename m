Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722549;
	b=zrKtPbKAYfUII201dT9NVo1g11BTLT5LZYKHdrOlEwFZI5XyRmQD07HmZ3pd/Bh0IBQc
	 JWLVbPsOVMCiUkUWFDYp9rKEBGmdRuJkAEuKQcJ8OUSyN3Y2vXLjOLrWaDHkgtCbgBPiT
	 zftDjT+UwC90FF325BGV02TwycfAJeV5NoixJJRWMkmSTjru2cyN4DZ8oIfNlNVaW2L+H
	 JnhfKUOWsAxDf8XWRu8gaMBklVS5KO+4/i9KFQ43YITjKs9577B52o5XJKckNdjatvwgT
	 6KV7Tg8yP3BEwaSgaczGwPA1ayLcX0h8+JoC30KLPLPffd2iw+dDgtmzIGIn2rghw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722549;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ctm+OvOOdF3/eRDZQ9mCZGJ4OrDu4+sLjWj8shOpss4=;
	b=yGI5az1IV/J+ni5LOJFR1XWg+ee00OZwJFdQ8M/gb8JqbtQJ1VD7+IkpgkwVxYpSevAX
	 AQkdcMQpw+kcLNHp89YydHAEYIREN1nJA9fwZUC0s0yx16dUj0b/dYFFR1Ygv1VJzkQAX
	 2qDPEzvOb3eoxaMylLDMp6CVrC8Aw+9ewzCuZX3XZMVcXdK9KMh253uRn9UtCmxEJZ0YP
	 PApfT0RB5FzLhWPbWygS/to/dQNyq1fwk3hZ0sIoR5bTTlHkA7K+mzt9iWkWANbg2bjiY
	 ongTgPU9U1f3qqVdpUkyShmmPftH1aeEqwQdU2b3nr/1cIRantcZHOBKA5z8P7Q9+4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y0LSliA4;
	arc=none smtp.remote-ip=95.215.58.24
Received: from mta1.migadu.com (out-24.mta1.migadu.com [95.215.58.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4AC606D83F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4AC606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y0LSliA4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K8R3zoPWS9GjOtmgfFeCE0/yDhy3x8tsootf9dJemic=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793722546; v=1; x=1794327346;
 b=Y0LSliA4mZEhLLYOtJd6RLW45ykAB1wMAQCOESHJOMDQX/K40Q9OJdH27HYKP6rf/6Dw1hun
 68IEyz58Gu0KQnewRBoReTyeOKy/5DqYsRwXj8+h9kKD0W1TsVR4jl9RVzb/b5lvu1ZG/4SLNER
 u1W8CLzEEbd0J/pVROydWHkQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5704e67b2e9b7fbc;
	Tue, 03 Nov 2026 16:15:46 +0000
X-Mizu-Trace-ID: 5704e67b2e9b7fbc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8566e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwUhGv5HfK3jW9e3pXC6CI7MiyC+w7bMlrkueFvjw2tEldoia60le/5M5b+Kp7Js3W1yzLO0P7o+Z55B0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fQqwdKAGa0QZoW5Hc9vh1JyJnin5iermXgFlxqRiFedL9VJfg
	rYILW85AWvWZrjkt15A03jXfjXlfoLeyNl/+FYEmE/BtI3E/Twp6XkELdvbO/SiuI+93pwzSfEQ
	nWBa0J5/dhMTSRzXEL2dbJ5DD1JtdPcr+g8g6O1Ui
X-Received: by 2002:a05:6512:1247:b0:5bf:f0b8:f896 with SMTP id
 2adb3069b0e04-5bff0b8fd75mr147439e87.0.1793722540055; Tue, 03 Nov 2026
 08:15:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev> <aun1NJNtnOeSL4oc@google.com>
In-Reply-To: <aun1NJNtnOeSL4oc@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:15:03 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwCPHp_odMPJAJ8pfPtymtU5ia_RrH30DavFeiZqvhVAQ@mail.gmail.com>
X-Gm-Features: AclHuK9jF3GIRHTl9ZfS7oE87Qhpm2sxTx6SMNL-HGm4GrBCk1nlKw1LtRNf6Po
Message-ID: <CA+EHjTwCPHp_odMPJAJ8pfPtymtU5ia_RrH30DavFeiZqvhVAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when
 destroying a pKVM stage-2
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Tue, 03 Nov 2026 14:52:36 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> > Walk the mapping tree once instead, and reschedule after passing each
> > mapping to the reclaim or unshare helper. The unshare helper can't
> > reschedule itself, as the map and unmap paths call it under the
> > mmu_lock. A failed unshare now leaves only its own mapping behind, not
> > the rest of its chunk.
>
> Not a problem now, but don't we make the device assignment story harder?

I don't think so. In Android, the host doesn't track the MMIO of a
device assigned to a protected guest. The hypervisor maps it into the
guest, and gives it back to the host in __pkvm_start_teardown_vm(),
before the host reclaims anything. So the walk this patch changes
shouldn't reach it.

>
> >
> > Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
>
> Isn't it an optimisation?

No, it fixes a regression: 4ddfab5436b6 replaced a single walk of the
mapping tree with the 2^27 lookups, as described in the commit
message.

[...]
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
[...]
> > @@ -513,10 +514,18 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
[...]
> > +        for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> > +                u64 start = __pkvm_mapping_start(mapping);
> > +                u64 end = __pkvm_mapping_end(mapping) + 1;
>
> __pkvm_mapping_* are rb-tree internals. I think it is better to use explicitly:
>
>   start = gfn_to_gpa(mapping->gfn);
>   end = start + (mapping->nr_pages * PAGE_SIZE)

Ack.

>
> Also, I wonder if we'd better WARN if the mapping isn't aligned with the
> destroyed range?

No need. The function's only caller passes the whole IPA space, so
every mapping is inside the range.

Cheers,
/fuad
