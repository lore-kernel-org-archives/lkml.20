Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876838;
	b=CvyX/ohwJaTWl6ssEAYAJMkcjMAhX6fY0v/m0Lbo0Bi1eiKg8DDhbF/ihQkkl83qQ8c4
	 nXannq7r23InF+neFFED6RU/qSSl+ksB9EF/cV3DGF4vROpu2MlGgT25kbWPDSwazdecs
	 f8iHpi7iZ5s/vJHhedGdizH3X/2JeAAnEy4MA5/1dewB3MlWH0xXDyOTKvv/7q2z3XcpH
	 tD/L5CauZFks4qiYrbbcZ6QA61LyQLt/nBMAF0CiQlZyk1QeoLx0cXRqCBEp0W9iCL8Xx
	 z7nlcVXYiQ/ob7qtId7/Ii1wreckD0kTSJV+t5j0KTR2BP0YLjU7T5wI4yAmKH7rn2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876838;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ropK3m1T6/3AAvbHU3cjiTXYKF8W9vyhn7j6GYWwVws=;
	b=x6TAiEOnb+2hRCdEY7iiwjWro3L7bvygTM/v1RAWe2Cbz9a4DDimmN3O0/uNf3zL6PO6
	 f69OmSl1xbLzeMdbAByAUwTC44UlLZ99OUqdHJTi5FTKIVqIgdPhKmk5SPbwtK1eDuwX4
	 xIXj9SBqR5FK65mTBI0dS+nND1fsvKIIFfBo6N8wS5XZ/YnA779LcB36vROmegLx7f/A4
	 4fgAGHt+XGugPxVfvEL2zsUoIwOKEFgC2OHYwkLEYWrtxfcu+9FKoTWGSbcilWfUlrSnf
	 o3pZTaMurLH8fTzXt4Pi0k31vqwoQZHIPrHn4SA8wRsvKSGyyboOF1xQOPjBzd+2srg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T2WIrlIO;
	arc=none smtp.remote-ip=95.215.58.20
Received: from mta1.migadu.com (out-20.mta1.migadu.com [95.215.58.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB66606D83A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB66606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T2WIrlIO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mxFi/NyYTfA8yYXfuMYDhLBMuAD3UI4RsO03kk+Phpo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793876835; v=1; x=1794481635;
 b=T2WIrlIOIDnNf47D6OdvjPvCVrBN2oBK1xqubZmKCzE2EmpB+G41yG2JOaZDNgmNlVWdVI/V
 vSACM6nVPjYNv7LrwUiuUkxkX0xycZ7i+hCamwIB3C5jiX8L/OTGomjVDZu3XQ3vbonAgTGXjRX
 deEt47Cu+cUUJKwzLWAda6yU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b0fbcd802ac85f8a;
	Thu, 05 Nov 2026 11:07:15 +0000
X-Mizu-Trace-ID: b0fbcd802ac85f8a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so6151e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:07:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw7mizdOpgSyKVDQvkHulVbDU0168gsTuMlyizaU8/+LsL8ZXXjK1y3nL3Fx9L1Dx+c6bWeboVVdSylEPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aBQJfIRQsWTJbNKzfchGDI71dgDUQkmdvkECphs9VN+87C0B7
	A53IZYiggc2mcn4b3H1IdJ4VArlUdowUb7XZOQjjC9L0gqyC71O7KnAUK64h3FlJXwCMUZrCtYD
	YSo6WLQuiagkKXgoUPCNDRjkaiFYVwIT0Edt75wdw
X-Received: by 2002:a05:6512:3095:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5bffa4dbd87mr143654e87.5.1793876833801; Thu, 05 Nov 2026
 03:07:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-3-fuad.tabba@linux.dev> <auxQMCboC9bhfW7h@google.com>
In-Reply-To: <auxQMCboC9bhfW7h@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 11:06:37 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzGijxFgv8Wr2DEGB82UUbA6HqK2n-JgNh2b-7jNHn1hQ@mail.gmail.com>
X-Gm-Features: AclHuK83MrhWtqS0VanllDqm6DgNhbZ5WWUV6AmGa7VFC3MdfNbrKHk581c5qiE
Message-ID: <CA+EHjTzGijxFgv8Wr2DEGB82UUbA6HqK2n-JgNh2b-7jNHn1hQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the
 next mapping
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 09:45, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> > -     return addr + size;
> > +     /* Mappings left by a failed release are still in the tree, so look past the range. */
>
> Hum, not sure I understand that comment. Which release are we talking about? The
> _reclaim or _unshare? If yes, we don't propagate the error and WARN if any of
> them fails. So we don't expect any failure here and I'd say there's nothing
> special to do?
>
> Additionally, in any case, iter_first(addr + size) seems like the right thing to
> do and is self-explanatory.

Yes, a leftover mapping would be returned again from addr. But since
that already WARNs, I'll drop the comment.

> > +     mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr + size, U64_MAX);
> > +
> > +     return mapping ? gfn_to_gpa(mapping->gfn) : U64_MAX;
> >  }
> >
> >  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> > --
> > 2.47.3
> >
>
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Thanks!
/fuad
