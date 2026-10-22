Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646446;
	b=UfZh8QjnShB8qQ6xFHAvqXDKJfZNE/Xgz6nPN7PxKw737K7t4nZJrjPxnR0TEIZUwP/I
	 X6AaAjDZScvbZtdfOnY/9EQGCAU37gu2bENuh/8g1LNnQ6iaWlxN/E2iQeGhLnK4r6Kk5
	 9+JNUQ3GQ+oJUBHFmpCcaklHf3XQ5STwTLf70ffu2pwSUxfcY/dd3sjqsrw2iU90CeO9C
	 iX4wHosYJQDcLBc1YwIB53i84G6SrUzdi5QPBQspCjr5jknV7Pm4QX1hcHiQClEWRu+1A
	 vXJw1c9hxGHiZgnEyR/IRo2fHkk2gKH2kmeLEYhstneOrXg8ZKk18Nig+E1FJdISlzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
	b=TZXUxuoK8jj5k4X1i7g5W8/wM/8RmhyDFcm/D1JryFF9fR8jkHbiYlrXEWkspDrBCQuR
	 nkIWdcai46YpNygCLDAc/8HNGjc3INGu3EZ8XTyFer53yArYJkGZK6ZTMDJ9LWss6+4kz
	 CSnX61+VT2V1BxAd+BG32uUFyOpspXqEgVDla+vtqPKqOH3EvKPBDX5/AdOdjJpaWx3DK
	 CK6zlFGOH4A13nTLshspBxIAbJ9VGUf7tQr8/6gUHdQZ7SsNh4obWKdZ0PYBzJFgcpjZK
	 8VgEb99kYZ8PtIe1RFKHvLH+6IvKOmnfQkdSn+KNVdQO3Amgsvw3O49b3lYpOhnd+TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=aMLRwuAa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007C5606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 007C5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=aMLRwuAa
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1252134f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646444; cv=none;
        d=google.com; s=arc-20260327;
        b=NQWjAevhb1MzoOYFh2i2N3IEQ6lK3RP2b/ep7liRfsaL+hkd5dEfKBMdSRmw3clkiJ
         99tmz+LUnORVwYQ7dx3mDzJ8nTzKPo1JfhYXFxIScGHAEKMXI+eE0pajje1WJaXMMxW9
         mXqFiqQoDOGvbsah2/PddAIp4uZYkFLbI1K4obI8CE6/ro+FAx1detq3fI+VRAm4HOm3
         YERTp4r69QcG9RDv/1I5UnmROqWYRQ/vxM9lrFIyE0DoivmIynK1/2tpV2oLy/dNsByF
         xKFAT8VgoXdpQltUhTH306Ni7yhDqAFzTKoOwxcgr/P2ftYphhqTwx/Gh4rSKfcCUG2k
         E9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        fh=ty+VXL99bQhwmaXNLciwHcCUX2DwOKo8ZXwT2Az1nUM=;
        b=U9Y8K/wPoBoxKQ22KxozSRm7Gngxfq9xUDf9pWm8C2rAll2etQZ0u0ytc0S5TuOUap
         Iqx5ToibrO/3nxMXbvnnRMxXf1jrkHiLoDz2fdXt0zVlBKq5CrbznsXzM9Jx0P8kYxtU
         TDkJqKlKDM95vrXa7Am997QRvVwJALKztKwJYJQ+pNn6iC98E/IIJqjq9HMcOiows+jh
         DmixYO6Pz7Knv84MfQm6Exn2Bul41cMp2XAXCMbyoUNTb0onpXPvLPn4c2/Vpq+9lFZx
         NPGLSGhvHRUaBUzO8EGToxClGhkqJQBHaFwdnVe5MxhXLXjIfc1/IrjWvhEusoUNkOoE
         j4gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792646444; x=1793251244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        b=aMLRwuAa3ERHVGJY70WDS+qGWqIhOrxtO8b8v9SoygeljlCPgsS9qiX1mL8rvP1xCx
         FpFHdwvboaJmbBGr42Q56PIl7PA7RvBcbqtwAEVi2tN7JoP0GFhzw6TJ/jsx/obytj8s
         x1yRMv9UObcXmBCnRgJhjYyreJWvs8m5mDy+84AR8tReeWe6fUhEZxtf22vfWX76lYhG
         SScV+wRoxe5BHsDMacZOCPSaBy2WtXc1rBxDM1OM8T1szLChNzv0BtbhLnsjUO7xsx/B
         jDQ98oAqxDtsehGTKaEZWTDbitUDthYS2qhR00W6DFto33fME86vzd3XSXRoSAHYw+AW
         eqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646444; x=1793251244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dV8J2o+756ExcNaGq9topEd2CgNZBpheBIgCfX69Gs=;
        b=FqTA6FgOwUb/PdHoQqDNvkduDtX/dfruvCwR41T6GBalN4g0QqdIS4ELRFUf42tB9j
         MIrUIudOb7T6oivOuY932+8z6Kb05+qPNeoJqsnCTmxcoS7/PUknkFroHpyRwIpxvQCX
         Tc/stpM+1QcDQYJWnm4wFUN32q7NscTo2MeP41PNTtr85H2gOq4gDzFmqUJPE5iv131M
         bqMTUB6UmdY/hgG+lLi/85gQYOV0KbOBhhEDsYjeVFELR8OJlXPlq6muH+5rEH+/nK92
         AFvH4odmepumZGWRAPuia8pQR1uH5XPHMuEZql01BnoyUtxoPN8heofq+CV/27Y4UQxo
         oBHg==
X-Forwarded-Encrypted: i=1; AKwUvBzmNJddSCaIEOoQXgoE6/vaNu7N4BbDgrW0SpNU+O6cKhk5qENJSNpnxfWSaTdPbvt2CQ4UM81nvCj4e7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuPXlr0aOlhGBnUXYuSkhTE1tMglvFO82N8Xo2WdVNTJMq6RIL
	11LkA2rrjjN+YW3SJx7A5VQRxI0seGEN0oJALzgkkHKRRBZwjEG7txbBENdQO0igphSM5B5KVGD
	QBUdqYJ2Hz18vJG1vf5+bVJrO9mY7N3dCKOYcColmPQ==
X-Gm-Gg: AYBFou24JtXJbQzl/9S4pOYJdRq4LCEM1SPaEQeN13lSxua8DJDhkBYgF8D3rCA+UFl
	7GOc4njwlw7T0zUijF6xuxKhEoLw1Rz92estYkCT5sQdMrxScyCMVSWwxoP3SJI4cE9BZt90+1J
	z2MDpy/zUFeUp4I1IxJgARF400bcSVmx7TKMrDE0dh3Ckf0B/G4v8p/MopiiVnOFLrcPhqVg+Lr
	vvTavsPQuwPcg3vgzcTw47si2aN8VQ3B7TcoAUaRQyX4ESdP6bWJ6UYhzUq6p+qgbIGmsC1aMss
	IPqRDaxyC+C2kiShUgrkIa6vDdRvo/wHLjl8FU8C+R00kt+2+hi8wdXsX4t+Jr4+Flzr2JP27vZ
	jmscsGBG9pZlhcMwtPDEZreVEOldyTaIgHVNLcNv8sUYgPpq98n0dIKsAsgmZ5WV/PxgRGlefvd
	A/ZYaEY46dBL8hIbYQfA8MMVsBP3lYuCEANpr4Qu2hrTLmoZOyPbQ0D3NluktupgyOSqFWP6/bt
	j/xoQ==
X-Received: by 2002:a05:6000:4025:b0:48d:c29e:40c3 with SMTP id
 ffacd0b85a97d-48e264bdcd8mr8669565f8f.33.1792646444331; Wed, 21 Oct 2026
 22:20:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019134709.2610129-1-andrew.jones@linux.dev> <atZPqGKEip_sW3fr@orel>
In-Reply-To: <atZPqGKEip_sW3fr@orel>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 10:50:32 +0530
X-Gm-Features: AclHuK8Srkuid1EQZ7HZGvxQuXz3bcbCHVgrlN5FrFRdxoTbUp0B6JefKaok7ws
Message-ID: <CAAhSdy0KvbHT6iShPfMkhePP0V2cVohv6WcHWieWLwZYqkFnjg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Convert IMSIC vsfile_lock to a raw spinlock
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 10:46=E2=80=AFPM Andrew Jones <andrew.jones@linux.d=
ev> wrote:
>
> On Mon, Oct 19, 2026 at 03:47:09PM +0200, Andrew Jones wrote:
> > kvm_riscv_vcpu_aia_imsic_put() runs from the scheduler preemption
> > notifier with the raw runqueue lock held, so it must not take
> > vsfile_lock, an rwlock_t, which sleeps on PREEMPT_RT. All vsfile_lock
> > critical sections are short, so a raw spinlock is fine.
> >
> > Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC v=
irtualization")
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> > v2:
> >  - Convert vsfile_lock to raw_spinlock_t instead of adding a separate
> >    hgei_lock [Anup]
>
> Hi Anup,
>
> Sashiko found an ABBA deadlock with this v2[1]. Making vsfile_lock
> exclusive serializes kvm_riscv_vcpu_aia_imsic_put(), which runs under
> rq->__lock, against the SW-file inject paths, which kick the vCPU
> (pi_lock/rq->__lock) while holding vsfile_lock. Lockdep confirms it with
> an EMUL mode guest, and the host then hangs (I should have tested with
> EMUL before...). v1 doesn't have the problem, since its hgei_lock never
> has anything that wakes tasks nested under it. I tested v1 in both EMUL
> mode and hwaccel mode [again] with lockdep and it's good.
>
> Should we take v1 instead?
>
> [1] https://sashiko.dev/#/patchset/20261019134709.2610129-1-andrew.jones@=
linux.dev?part=3D1
>

Okay, we will go ahead with your v1.

Regards,
Anup
