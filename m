Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792650471;
	b=YXythxsf4WfpaKnpcoWM9rCJrAbv5tna50x/wbq18xb6oqDgYZwD7TsJEit5tCy+UxfR
	 9p8jHzXgLgdE1+iJ+HsoeO14OExtGJ0Mo9Au91cHPgjaZlfaZo1ms3etq1klX2vmBb/lT
	 Z1FxliTUC6mM7S/4FlaFhKLTekhKkQEWfT+3+pw97nQ5jw/32QQpBgTTaAFwOZ9VKcYLI
	 C7JkJfeDCw8R0KLwq9bOcZY16RQb6WsqwFRPHMSwT4nWxWlkYg+YjZGeZDBbxCTsrXVhm
	 31TRaEHYZd2Ywrk8CJxVjqqCgO9vBmHGEZ09cMcmbodZ1ya/UmpApCO4Zy/zyA5VfZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
	b=mX7nDgq3/wC7oe2VRqogVBlAPM5V3XU3DB8kA5BKjp/VW1DKPSKB8iqEiVmdb8/C1w8W
	 YYcHzfRKZkPCqSaS6QlNY1fkdXOFrW/uSpP9aL87SCpDIMMTfZmbFcEmh6VkTy/yI1geb
	 uChEjGhGZMTP4ypkqb++n4VmZWhmhPIP9nDKHm++kRWy79/QZhauo0OODdiOHwBNnO7my
	 0C/2W23z7oEjEKMcGeEg7eYGjsiL2vjXTvqK91zAc0PkQK1a/FvC0UdBtMIbtZgO5Icz8
	 U0yTJs3S8kqJtUFjXx8KyO4uf6GV6FWLCQzRaSK3pYQS+4YnVjXwI2JFBVqddkTIteA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=I6BJalyR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A2606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=I6BJalyR
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso11104381fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792650468; cv=none;
        d=google.com; s=arc-20260327;
        b=Mdy0BTYSkfR+Dj8NajQbq5VH77S7ENq/5Gf1uFR1I+P9ZntfwpTRJQQywGf/xXgZy0
         vUnkaQLe9XmVDrF27QeB5dDE/1HMPnwobbLSttFrI7syBRaFaDwvrcO8EJoOiph85wX7
         pPUUNIdyhQLrd3k/LVIOXmzmCkw+4WWX60QWREAf1OJl+TZN3rZlX7ZK5tXrCqbRlGgX
         8+5Hy5/pG2RSaqfgHS1FKNNYMHq3Ea5husPvV7sVyQ5tGOkWeIdoX9QTh8+wdktxU0fj
         vrIOUuo2a+74FX1uByI6a7ghi4EOJqcalAO78dS4nnr/zajFKlKVj2aCF+46izls85bx
         FkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        fh=ZEIGkHvHQewUjCmu4hIyHkXIxHxNMXJ+PZ0rdjcsOPM=;
        b=ZI4FJb4iT2U/RqnGb7EpI6BAmIDzleIzfIDzCg08SON3/ul2nsmNhlZ+OLmy0qRr/s
         FuW1MoWloSi3kb2dLbbt71qfQMl9OAqQIBDr013DkJL9oJBgcSv6RNpMK0CcmcnbYaNp
         x4sfbnXLp/hzYq9pZmLE2TZ6RTxPhY1TVTXTuIMKhc1pBCMdciyrFA1I1hA+oGYGkTZO
         K0ytY7S9eUopVG08yRR5qHbjEogFZF95WVai6tMR8G0VvEXXs/ktFHKSEMrtXlmaq+R/
         UrKcjDTz1k94Q1XBbTVjK6x4QUMTWQSI20mndpnoi+y9KK6X23irFPDFi7AMjCNQN1IB
         0K9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792650468; x=1793255268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=I6BJalyRUjlXbBnTqLj/Hw9e0stD1hDGncpWi81zlLKHhhX9z55e2piXfBA2ShEicd
         js+eeYjcAscnQ1MR2guAhdfiIgd97VwaWxDn+3saZwZwoqyxwsmPxQwCBReVsef3fi4p
         HEicD/7M6zZU/EAZiEqlwV94O9rbzRJkdL83ScTGERS/129XNqV2yh/Hh2s/GU/rg9ge
         DoqCjcnoMxuiGu6E6gcAmJyT4Y2sR4GGSTnfKptQqRlRKYVm+KrnjwXvBBM+fKAI1zlB
         K5EAwtzHBKSotwtsXA1CbDDeNN0sAqJ8tryxfVR/RMqCO3lBl3delvIcRWlgb+9Kj9+j
         eUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650468; x=1793255268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=ZLZG3vGbi1Hjt4VJ+qdYANurT6bd1eR8mGhDxQ5HeRAUf6mcXRaZC+CAVTO1Fz9fUD
         SPw/poLHGfA+yIlk2bVbFmg3jDkBdjNi1ZT8hRcS71dpbDOxAm6U3zXk23ObyKC4N0/U
         HQnfUYQ3ndeYC/NT74j71P7e+qfOsPdfxL0n+avoAyj4SWRneJ9NCz66lz58cbPu71XQ
         TAJYKoJNpQbMXpPdOoRZz81eZBgeAb7RKWFXH1OGuJdf/7rSDHSmbBpbNVsEMekWYNsN
         7h8xmEmkow2WwLXzN8yK6cuch/14R4YPGuXs+DCap7FjnALYt1nxzbV9BJ63webeOF2V
         c1eA==
X-Forwarded-Encrypted: i=1; AKwUvBxe+2aWkGbbZe54pTodxkzpYHgJYvDW6m9bkrBJRAPl+dbrhu71Av4H2ww4A/fIHuQLSvCf1Gf3dqxPHSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5wilWd8czBBPQAdH7MJXxckeiqldjsB5lE80HKcynIWlgBV0t
	/VTnp/c/cIYgczWGE4V06sXp18934AbTh5AX6w0Kr40gJbpMjNzz+RN+zOFRGgrjhowvIMLjHEr
	ZqK7FdoIQtertwYuRGc7pWgX9dG8SWYzpLLFf2TVlOlF5peaH/ZD+
X-Gm-Gg: AYBFou2scrnwDUwY9Wqmden9MTYePKVCiaQkY59p/Eqv20mJGluKsBe0al2655h2VJE
	XS+PR1/7/gME14YTymAGcoZ6XxQ91ylCJjd3xsd5LpussF6vX3FuSSkrwJVCtNOoYlJ8qLb6cba
	Ah6bE/uuHZhXJQ1Pilbd1Dh9+mfzJILCNX/3Pi18VE/QP2tOQIByWaqBSs0it8UARuNm1jDpqWn
	JM2KTsyzrEk5BkFPn+AJFcD5AazCZZMPVgge008tST0nrvG055ZpNouvSTvz2XsZytX0DkDmOTc
	FyYHJa4ncfTtEND0uwpb9t+toY/obeGIlsuOd5n/zhJQwRm00kcHWAhpzlgaQel7D2Gh5z1E7K9
	VeItOcKkFkS17TzEhZ50mtLT5pg7kPHdvJ6SRjJAw6JuDOWoPuhPtaEk583OkFRC8IgoHSRgnZK
	jiNggDQaB5WUxV7Qc6S9mQhq9XYDWDnrZ9AIyL7cAPJnS8eUa7lk9H4ajoy1usAZDArGScjmVXb
	TcTyg==
X-Received: by 2002:a05:651c:3134:b0:3a9:9a3b:6036 with SMTP id
 38308e7fff4ca-3ac440b53c8mr12628651fa.2.1792650468375; Wed, 21 Oct 2026
 23:27:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 11:57:36 +0530
X-Gm-Features: AclHuK-9TFsRegjYZcIPEHWDYDOWlB5NKzsnn-yH7Qq40hb2qm3j1NzJo9FfRwI
Message-ID: <CAAhSdy39UtV0sUqL0=FX+HWa7oAH0fkei1cFKiF6OBSSFT=gdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs
 in guest
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sarah Emery <sarah.emery@canonical.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:12=E2=80=AFAM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Extend the KVM ISA extension array to allow KVM userspace to
> detect Zicclsm, Ziccamoa, Ziccif, Za64rs.
>
> This is just notifying of hardware provided capabilities.
> No KVM specific support is needed.
>
> Add the extensions to the get-reg-list test.
>
> Heinrich Schuchardt (2):
>   RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
>   KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this series for Linux-7.4

Thanks,
Anup

>
>  arch/riscv/include/uapi/asm/kvm.h                |  4 ++++
>  arch/riscv/kvm/isa.c                             |  8 ++++++++
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
>  3 files changed, 28 insertions(+)
>
> --
> 2.55.0
>
