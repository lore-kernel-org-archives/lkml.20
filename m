Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963E4F30FC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563850; cv=pass; b=XT3NgfhHy0i6/aWPLVvRIPS7G7+idjdlyIFCAIaX/V5HkOi7aOF8EjEzXQ/OTjTEun9j2W9APlrWgL9KOXeT9imaLw4rIHNry/S29qV+xrFHr5fwjkkvVxGcKvw6SLj4sZPN6JX3M+HBTseXQGIVmAqZMRB1r7QvGdwRy1L/95Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563850; c=relaxed/simple;
	bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAakEa6fClMvINUQxKYJWWeMO/1TgSbFDKi5jVCH2wHEyj5ddLqrxWe8i57kSJWvnT1k7fB6o7OtLz2aAP9DAoi0UaqyDNEBZg/x2vJupWKpQgizmT+63T5RYPWhJDycBhIEjT6BhCHUL9IWIASslY0P4SuYmsR1v9KV5TwW25A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=F3VIz5qE; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="F3VIz5qE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4207ac26so9496f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791563845; cv=none;
        d=google.com; s=arc-20260327;
        b=OfSwPA8DZb5eH0a1+YDkj0zhPQxfJZvC7KrqMJSo+Rz7kp5GSQc8xtcNT5eqEsuEip
         0PB6DDwwp3l4tLdVlJyXOADjLJyjLLsYIOjEo69ASnboMZ7L6HtEFmRzK9wbSPwrVf5M
         OZ5N0r66VJqiKjSAynkR9v2UNum2erdQvx5OTF2fpuhpcDdxxZXejn7hypb7WQMwI6nF
         3SyUdhjewgX6fgekBn2mHkBqIXLKZljJWw8gxvroRzaaYrobvzKFMRS2Mb/zFpDF/cZh
         i0YZJxMjIOAYzJ6zWS0af0JW4gGr5RxYujSV3JWGtrrKYI0VdC2LiqU/C2GfPr+3weUf
         M3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        fh=gYFP1WWfzgqw5F9fFuLwwCCFFbEKGWE9zJI6tTwD+cs=;
        b=qb3JfBPs4YseV0/upEl2ITP5PQmSGd0afSGhU9J4ZhH7sV6yhgLXSd98SpgorRv9yh
         ljVqlqaGlDPp2VrWFQwOFTCrlOYEb7PFLnp4Ye4r7gZRBgy0+KwawUKtS5MkEaU9pjtV
         jYyKBIsiPUzSAcIAuRpXgMOo8EdfQe3uB+DMJdo1tuNM664817TJ7ewqse6k1IgW3JPv
         1SmzrcCE1SX0zxy0FzVnsYgfNf7uorRtHjywJrFnM1LUaDn7s7T3e31ToY3w6p0ruhRf
         q8L1f228Oqg+/J8M3Bim76Fm1brpaLWWCOZmPiJjKB52NM7zSrSx9h56cTE72454ktsz
         8Kmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791563845; x=1792168645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        b=F3VIz5qE3aWHrSSf/Dd33psysfSfCUO2kYtVI6N9FN6L6jBjHyIclYT97aROmKujAE
         c63KczfxmI1hmN2Jin5nrs9kejp0WV76pRfwJm+atDJ7YtluS6sOqJYd7POa9m0vyZTx
         PdlfC0BGOrvsexXdcHjNsomEtgYsml4IMhJB7nyynVwW68yu58Xqu26ufvQ4qv1mAgAX
         Y9MiWUFiuuPcZZF2sLfa/RuTevPMq6iPHHiglmiqBWVuvI360FiJ/bUOUDcxQVGvMbgk
         4esbvjhM8n9F+1WFa8kJ3JeLCgkis83pRAGcQh0L7EqV5VHNo4vEHnK+ZBQvAn+4I3Hf
         FoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563845; x=1792168645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        b=uD78Jit88q/kEZxOMNjflzQp15bCdSmLS5KNLCS6Vjm1Ub3zsrFguhYTsL9EfH+fFM
         QmDxnaHn1Cla25cEa2QIt4g5z8GAeD/9S6gt+lKF23HnOvx/QC9NY9bqaWWxWW5XWaS+
         NGdgkTMJV7Kmc+YtnmaqEoCauhgCSkJ3WLuWF/7afMXobjkfaXfirUW6tH4V5sQWj3Yi
         ZlZsKqgk+Gapra1HiKVO5mI0/oUG5p3h89j/eh79OZVKkXYUshr5XK+BF3fas1Xvva7l
         GN5+snNvftodmR4eEygbw7uZus/OscSOBnR1RUwaWhvQWOVvMSJC7+YZzB/Lv+nNQtTy
         OzoA==
X-Forwarded-Encrypted: i=1; AKwUvBzgvrvUU3PN1ELp6nF0aCv5eiKNSx+aeMnmooiIdaV2FMIaeRMxRgHHFIcQTlTTmHrqeQFSLOqnRO6UzuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwBUqOEZAF0APqZi+VgZQH6KXP2bgQ4XQtSrYTKlF0U17+uPGg
	2S6T/RO4rUq+qxn547lDCc1F5l4UjRkT/ZWGvAVFql2Fs2YYhuO/bs97yoPOs4ZX75L3857giQB
	DluYLERDiRkQAprZf+2LNA3Ks/I+LpwRa4Px07zwLyQ==
X-Gm-Gg: AYBFou1+zz7bGOT0XcDI/YK9llA4M5Ejyuwgkz368VvCxwpped/xT8334nQkE5xdYC2
	MnQjPv43ABnIVh3lp5l2X5T9HNusTf8Tz31OdT4qvdjVvXchl5vzWDvR22U0vlDTPZC0RCl7DBC
	HMWqGuF6CGGzGVCyq1VfFrKsblK03kY5b1I4ltAvyprtIBZzzL7ifavOeobD0BKkpUfGMY1kfne
	I/7TplNFP+cN4SCC6n6olgXmxxJM0OOYv6tx769Kk0KWeKdr0ty2W/UkdYK8F8zTyevmeYLAWhc
	rhCnc7LkEH/itXO+CyjTWTDmOP/Av67Pwr11QyZcelQ7fLleITA0kySjQuoNt1FbnNoeDsHchoZ
	AkF4wKgexac0XawopAIuaN4IK4mKN+6ptb1LB2uA7zSUFi/lBwQBmP5xd7XH4kvodxA77L7YJ+w
	==
X-Received: by 2002:a05:6000:46db:b0:48c:652b:9694 with SMTP id
 ffacd0b85a97d-48dbaadd069mr3527485f8f.14.1791563844566; Fri, 09 Oct 2026
 09:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
 <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com> <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
In-Reply-To: <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 18:37:13 +0200
X-Gm-Features: AclHuK8vtPQ4aaw6JsQ85iwGdZHaeULxx6XNPczP994xQTrZFbfymhhY5wrwX9c
Message-ID: <CAAhSdy2mAs6UgTk-hbGd3DX_1242Jpy9WLnOp6kmPvVVtABWHw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:44=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> Hi Anup,
>
> On Fri, Oct 09, 2026 at 01:45:20PM +0200, Anup Patel wrote:
> > On Fri, Sep 25, 2026 at 5:51=E2=80=AFPM Andrew Jones
> > <andrew.jones@oss.qualcomm.com> wrote:
> > >
> > > kvm_riscv_vcpu_aia_imsic_put() can run from the scheduler preemption
> > > notifier while the raw runqueue lock is held. Taking vsfile_lock, an
> > > rwlock_t, there violates the lockdep wait-context rules.
> > >
> > > Protect the CPU/HGEI pair with a separate raw spinlock. All updates t=
o
> > > that pair retain vsfile_lock and take the new lock, while scheduler-o=
ut
> > > uses only the new lock around the HGEIE update. This keeps the wakeup
> > > setup serialized with VS-file publication and release without bringin=
g
> > > wider IMSIC operations into a raw critical section.
> >
> > Instead of introducing another lock, why not replace
> > read_lock_irqsave(&imsic->vsfile_lock, flags) with
> > write_lock_irqsave(&imsic->vsfile_lock, flags) in
> > kvm_riscv_vcpu_aia_imsic_put() ??
>
> Unfortunately, write_lock_irqsave() has the same PREEMPT_RT issue, since
> rwlock_t is sleepable on RT in both modes.
>

I am not fond of nested locking, why not convert vsfile_lock into raw
spinlock ??

Regards,
Anup
