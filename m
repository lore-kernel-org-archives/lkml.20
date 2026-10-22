Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792680732;
	b=l0S7KDITAYdj3A2jLKVxl0BADRht92Vj8+K2kZQI/xk7fJ50Fzz/7dknuCKtMfmoAAvr
	 lTEtGsKTLPbY1Nprbf/Mtrq5ibCRYUiilfLcX/cFEbx+n8CcPgdSPNrKY6RMk6r7BgP4v
	 Aj4Z6Y6xemxmPMmD4lSVpyzpmNdPoeGG0v39bgwZHAJ/HFcZf6nKf/hlCwKTglFTd0R/K
	 6k4Ei4bd9mGjQmiXEvB7frzX6cj4xAGC5kK6+FtaBkEMQcgT5x0aLsS4L0XK4Op4VL8C6
	 dAtayamQP9TX1Z5twDYVsDrxOoAWC24SQsT/tQU7FECdZ/yC7dzy3YZmla5tAW4+IDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680732;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=LyqlkxtG7s/BjKlWQZlnObnXG9LPJwRsK/cll60vUtwbmvY39x8z4Fiwcx2+wbcf8zZA
	 C78WRjPolBnyXtRHPfD/4CuW8/tFX7I3kWppHcWt2bdcJAQLvw2SscckcWR7K8+QL9uXk
	 E3kaRscKSnxWLXJHFhMbmx+xD73pzUyZw4lFFdbutbOCfIjAmjPvEkQfgjG90czwUMEpn
	 /iOWve06Z5c0GpEt7xhZBAhMokNkodS6flau13JDmyIBaNz4WqR15Yw4VrEOFck3OQdec
	 eq1aqmIT2Ktl7UUlK6t9jlO1BxZW9D5dTdif4/pgTtugmwSX6WgYsOsp93yMSGN7UOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="eVZ/woLz";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FWmexS4o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A068606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A068606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eVZ/woLz;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FWmexS4o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792680730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
	b=eVZ/woLzCHLIZKsWOGeZzqCSUhHWDr21FRwKPJ6tMqpIB/shlxEc1vVmAPXnH4sgFdOdav
	WjkEG+7FcFPLErDr/St1iN3ZoiozvqICBjENUuVY61D4NjKhbI4EhV2UqrYZrxsGfa4RAE
	1Uhrd2as/1RPEfnuK1nzMiGO1RmP4Jw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-Vo51D1PdOiyApc1ZaA-M9g-1; Thu, 22 Oct 2026 10:52:09 -0400
X-MC-Unique: Vo51D1PdOiyApc1ZaA-M9g-1
X-Mimecast-MFC-AGG-ID: Vo51D1PdOiyApc1ZaA-M9g_1792680728
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dea677afcso768904f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792680728; cv=none;
        d=google.com; s=arc-20260327;
        b=Fznkfu7SiusJmkxxGdDwln5aRHrMhIZgQSGQWMZyqG09PaWKZqGbl38nMLb64rL5ZJ
         3nxlSd+4LyVK9j8m7piIl5cbdiCo3/QOoKLP3UkpzT4Y0MePrb6zX2r1iBgX3pwjExmy
         posg9p5VdCVw7JuMim8Qo8xL3/o/fak4m7ESP5Ig5FMYYgfXR/WRZhEUcLZmC94RzShF
         8oKuBEGJ/jMon4mwIH6osSyAoibWXf6EKHq3PYPIugl87aCsI5oewUAc/NoWJJJQe0dB
         YpBNlnzfYH0SHdgDSiW91wou/CNenxUrlyZ8d5Ba+uzyWxBft/4aWm/4sQKNfu4lQ+E1
         MAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        fh=KgB2VxECNWn+vPwskJpZYGjKJnS+cMDqQP+vLTAH2hg=;
        b=QScReYFX3akTd6XNZYfTr/qL2uw2PjDc59/B9hBGOd2RH0vB9FAsRPCahcTt420OKf
         743o/IfAHGTGUyyODCwOfezNUlyFEVDArkGNMOwWScF9MCSaRCmVKPTaA19yvISdnfAP
         FECVtUz+gq3NraDdALxVDyFJEK2+coVWSehjdigmik90WUzL7aruXuMYsK0cyGMOXDdS
         7OgMxiDkCmCMXx6fcphR98k+1IOHtdw2KutQTX4SDeZ8y2IHZSkomcrmK/wWxOqeKTgq
         Qp4CM4Jykk8oQLn73voZj8FhAbxpx6aChcLZb9hIK+41ba4amXdbqX3a6+zY6o4bqI06
         UwUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792680728; x=1793285528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        b=FWmexS4oqL5psvnuSNji5MfojzfX6NMGbUcZ+DcJEmYL+GMrlw/XRcJljgzP00HjDj
         NUzB1fgTEq6kR1ViNKEHZ4pOCMxGMnqV3SWfxZnB6Z8QGunXcRZrOu1yow5Qwgw1p3MB
         Lyjn2vlmaYJ4bvj+d7heNlg7T8j0RBgVcaZ+Yx16dNj01foxFUJXtl9SwAkVHGs2x3TJ
         ljG8ryPgZT8v6yJeqar+8cOjFpMY4OhvGG91lPE2yy+QCZgRZMWrvoUxkJmWaemB8NID
         iMr8Rj261U7wrMNfBYq8U/CzaV8nX1Ds21KeFE4k0B1l06OfBh0bpmObk2UcZrywzUi9
         mVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680728; x=1793285528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqyTtRBZvnyrEsl379QgY7jQoqueXCh5qRvjx+WApRM=;
        b=sQefhg+tlfkPcQs9NrPlY2R5RrR8cj8D5ro8d5pZwwSa6NShAwIvfl8WNzOIFrc4i1
         N9YhNlkNZHTpwo3m0JpdgLGR9LXMdpzLKs5oZhjVHL5MTwfaldI2s/xFZ5chBURu25BP
         l6d0gfqCMkYDwqLwovzjUzC0KxWfb2q0XPFGBdZFAEAalRLKDXJBBLX8cQfbBdr+rHCB
         DbGSV83DlMyLffIHLWwvIPD7G4gAv4x25UcViFO4a3REBBLUPWwvrJkHW1/r9f6AU+6m
         T2B8GGNpbnI57h6jfsulq1VWTx9u3/rWoMB3hQGT7sfzOTMQny0Iop9UBK6iY/SzXdsk
         paVA==
X-Forwarded-Encrypted: i=1; AKwUvBy2pM9U7hinZa0FX9XVrDJPEOIwUh+sO6fZ9Ulsbof520Hx8HlyvhN6F1uaMwO+U9ysJVqoaRPqai3gQ+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBVmEREOfOcHNyQ0SorxUq9UouoDGdwYKShvmEAiF1qbERn/JF
	8KC5uS2DjfndLlBwRJC0Nn2B3i7D8HTD8NsPuVMm8xq+RdwlocjkfAOLhAZrxOl6xuErHMS2q5v
	vLs7OOYm23tf6ytWBx51xJURRV29OwMWcCkCaRCe0YaGTzmaVsmFL1kaPKtKABLV3jmr3oURbEL
	dkDaNN/Hj17wf3nOlFPeGbe1niq7jSdZS4GJCc8vDo
X-Gm-Gg: AYBFou0KpcaXv2/O8guRj/zERxWBlqKm56lg88Twb0+rjHKPKcWnI1drXMZjjBfweBN
	sfBhCuCnNjA94yTxghaCXluOdQ9X7QWY7HP/49ozlerZ7OeB/J3NOgKP6AZeGDYPN0UEgCcy50C
	U0n4OceS453tYyfJ6VqpjCS6loTlZ+ZmoyiaguoX6JWyDiqI9ZXZCcdalkL6xr1T5x+B4eK8svj
	iqdYUUByM+C2AWrrkv46QVJaN0UiswT1AGlqB4rR8wH9XpPlgLrWwrCZKMH4A==
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48e2d102cb0mr5941234f8f.7.1792680728052;
        Thu, 22 Oct 2026 07:52:08 -0700 (PDT)
X-Received: by 2002:a5d:584e:0:b0:488:8347:a110 with SMTP id
 ffacd0b85a97d-48e2d102cb0mr5941198f8f.7.1792680727670; Thu, 22 Oct 2026
 07:52:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
 <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
In-Reply-To: <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Oct 2026 16:51:55 +0200
X-Gm-Features: AclHuK_FNMnKU9XQXzMyqQJBnCAE8EKPJnl7xQPFMv72VXmRnTfH3i81qFyOj9g
Message-ID: <CABgObfYuP+jeOZhZYaUrUX2-z0zWMH2Ch=hdizkzmKHLB6KALw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Implement kvm_arch_pre_fault_allowed()
To: Sasha Levin <sashal@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, Jinyu Tang <jinyu.tang@linux.dev>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 4:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Commit caa63620f9e3 ("KVM: Allow architectures to disallow pre-fault")
> requires every architecture that selects KVM_GENERIC_PRE_FAULT_MEMORY to
> implement kvm_arch_pre_fault_allowed(), and there is no generic default.
>
> Commit e8b32e377951 ("KVM: riscv: Implement KVM_PRE_FAULT_MEMORY") was
> written before that hook existed, so it selects the option without
> implementing the hook. With both commits in the same tree, riscv builds
> with KVM enabled fail to link:
>
>   ld.lld: error: undefined symbol: kvm_arch_pre_fault_allowed
>   >>> referenced by kvm_main.c
>   >>>               virt/kvm/kvm_main.o:(kvm_vcpu_pre_fault_memory) in ar=
chive vmlinux.a
>
> The riscv implementation does not refuse pre-faulting in any state, so
> return 0 to keep its current behaviour.
>
> Fixes: e8b32e377951 ("KVM: riscv: Implement KVM_PRE_FAULT_MEMORY")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Paolo, this is needed when kvm-riscv-7.4-1 is merged into kvm/next.
> Feel free to squash it into the merge instead.

Yup, done. It will be in tomorrow's linux-next via kvm/next.

I'll send the RISC-V PR to Linus next week, so if he complains it will
be there in kvm/next ready for 7.5. :)

Paolo

