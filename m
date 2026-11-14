Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794663344;
	b=na0xBhX94Tdfdsd/GoDNRRwNCwTf37o0uXefKH3VkwekBr+asqOiFuAy0zAqq3SSx7wb
	 JXg2gBl0yhL3IFv4LwEQ1oWTHPhIR2NT2lNEpnASgHgu31IgNhvOzDT8/eILMmDWZnTb9
	 W3ZsStgqjheQvVFUHPUBK70UkYzPMlkOEYQMyFsmTCwe4Fk/iWfWJN+7uFaw7P+INpnik
	 wXK3l9mEQFiI8c7h5jF5m/Bty1hWINmS6tC3NCKkBQSb8lWiumlKBklG/Yn4SoiO3jjPg
	 H1L7+coghgTIKQ+ZgpXjd2uHrIAxrQWVpFpWS6nar8cOt+T2ulmTAZTV4smiaABK78A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
	b=FTtYziyjFGhfqAgppKBF1bMe3gu8lzLdFimIdimlOffhJEWcKj5g61lDr0kUjxA5/5Ci
	 jLDGcFzrjDg5ujWte6V3ko0EgEYyGB9XoXL5QraH1Ig/Er6bk/98p5Pbjw1kxCmMzZDPD
	 riHagpZfzJvWsZZN80w6QyCWCHQz8mKLbsL4zPQbVvx88lBHkotiSWo9h7YR8Pe0xwn4N
	 ixRNq9M569ivqkdGmfOlf08w5GD9mfIDpPeyaaiwjPng9z+3xmNcwFuyIQmBWDbdChyuM
	 jtPjUuItbZXB9E3cgAZt/JjQAVjq2/MwBXq9M8FyL63bEucj7RlWCU5Xr92CRDDf7sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=L3eX69Mo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62A606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B62A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=L3eX69Mo
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c151178f0cso2141805e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794663342; cv=none;
        d=google.com; s=arc-20260327;
        b=ZahY+03EjzeWuiy4bpVbPuCTAHbUNC00cVobKRJ4MqysYD4XAHkY73z2P7lEtqwY85
         32dbaNvGniGPtNwxuqwbjzCqAbwmk733zwUtYU7xLeiAKKyyMGJxdwvi0mJVenahUmW2
         +Ywz3bs8mLYxdSeSp6hjjJd0o3H7O88pPNfZbHwlABJ63oUzGKZa6OigVd3S5qPywH8m
         JQCSKnG5PYW2PJj3vGFM+NCNdegO4/mjeK5VNQx5qAAvlY3zI4hVVcxuj/pX1bnfb/oK
         lcbeYdZM44VTDrPOiQNb8gk6PP0E5Z/9ZF2CGz9GmcnIofBaF717g+Yu+rCho+7Et00P
         EsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        fh=mtj+ITE4a4OAeMf/f/k6otnQt7j1Eo/UqI23q6KMaCI=;
        b=euU77ra+TwzSgb4aPCyAwdy65HZta2PbWYhfRA6Z+NJaf2aSe/OfvgjQjAnFY3IFCN
         WN/oi16p/dZP7qWmoPDzuGwhyBhgzARQMp7q0+POgjsfor7n0xKCsuGPrFhaiMLSEdgb
         dqeGfo0rgwpIBFV8pLDxUfW9hMjgmNgmkNoyLdds3ZWHfPQUiZ3ykosQuqOtzx84fpIa
         qugmn+D1C9M2gRipNEpQciThEsS/uNMGUPYbfKkDeyaJFNnBmVz1svwN5R15S5AF28qt
         9ifYq3O8vDRnaf+nj26lY+aQjkQZ5iBvLRL6VD3bq7Hv3rpEyD4jJRZwPc6l+0l5ODDV
         z3WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794663342; x=1795268142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        b=L3eX69MojesZqcpGizRiPTiM/QZx0402ABXzBhG+bHN7zui+JzLQU+9MZigCpAdWrk
         EgGX3VS2MRMf2W84gAiALbfPQUIdSqNWXdU5gcNaim13cTnnnnIuxUegF8uHRcvn9pix
         GFe3p5BdPR+ZPhYWdXR/1FcTTU7Pyx/RUrZiK1wBUTLijMvtOXnhqi5vwOaj6oCUrWRy
         duQGbxkWTdSXMu1fpkvGLIqf3PIcyeQf7cvoXnmQ6zj4zrJaf7GlMn/LLl2q0Z+ncdWd
         zWTA7Mol/2x/L5whXj7aPV5zexLHGcQtD6wPo4aQ0VVMU+QMTi8TWVIhJgUncEM0sJWo
         tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663342; x=1795268142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        b=oMR3ohHEeGDlKFF83tISp0wFDfutw/8xhdUNZ12VFhbuALDL/tUJptqcdtxpenaTqC
         OS+2lVukny1XXn8Tg34/X9xhr2kFLna/9p8qaCNN1zjpEEMIkL+PeypkdI56XDDpuHDp
         rkbsuj1PEjV0G+9DShRcK6lZ7XmqsQaN+qArOAXy0/BfBTA2Fmm83UAtversx7VgWg6c
         MlvZz/cGaoHGpyYOKyBGx1OTJS01+4rVug+HIQDF26jmgypi+zMC9Lo946nOyp3hC3L7
         AsNkx3Lxx/PAHYjFFMiWEoyi0CepycRpCECcM4kDJcrxefdzObgzA2Ybo41bTQ9npVSm
         Wf8g==
X-Forwarded-Encrypted: i=1; AL+hErERDGuvAo5K1qhG5VNrpcO8Wlv1ZTToox7D/MYFMmwHMmwyGGsLfGoajYI/n/s9XVGJCVfCNWF2qF0kgks=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GUz1YjFqyrLujyOS6/K0do+x/bq+hlPIlcOdk9vsT0oZHmeFh
	9nq45DJehsUg/EviUiuICLJjFxJQrvnrt29lIFDVaS8LOdhvCBDSG4T/tHfznd+oeVHyT0Tzmms
	FOzMsC9TDYI3H0o3YY7XCKsfN4pO6cok9oZFjPNgSMA==
X-Gm-Gg: AYBFou0n6+5qjBF3b850D4VADnZMf6qb7aq/Zu7MI2a/esSHbgJHba6hlpGZVYh5N6u
	7QOJxrC3Q9hwPJXNwrBr0cn9yreowKYI6sHO0VSo7g2nsyKGZWOT5hAVs9+SiplWg0kLA3ym5qW
	u1B7Tk5g5hnXkFqsP9vq42hX/YdndH8KlWOp/v0qkqQnpC3vOqvwu2bo85KBRIJZzveQco54gaT
	X2qBaV3nwJUFPNCprtFtLIbuVe9U4qssqduJWdAaZ1V/sb+VVyYfXUljZUT+/qrFZAVPl8pT2rL
	GmBcLy3IZHicPgiZGJsf3hzrwBJLlQTNhha2QYcAgjYDlJ6etvmWWTvUSNandN7f99MxBWvzsbO
	4PuK2zhO4g0mxU924BXoBT3EbRDoKquV1S1FgnUIUvQZzIwEX1OABrKQ6qy2oZlIqLsNcK9pXXa
	ogdQAj7ZrGI5NkFlaYJujtbBW6bJswGsuNLQFgpM14L3CodVzgC3IUCw==
X-Received: by 2002:a05:6512:a84:b0:5c1:5171:4ad7 with SMTP id
 2adb3069b0e04-5c170b383ddmr2080350e87.33.1794663341999; Sat, 14 Nov 2026
 05:35:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
 <CABBgwmuBBbyBytwRBTeAqF=0c1m+TFK8E3yPopGNQAsrMFO2vg@mail.gmail.com> <7e634bef-6d23-4a57-b3e6-b5585045ca19@gmail.com>
In-Reply-To: <7e634bef-6d23-4a57-b3e6-b5585045ca19@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Nov 2026 19:05:28 +0530
X-Gm-Features: AclHuK9nWY20qy2LdzPDWoj5LiIWjiiPX9NCcLCEPiqITYBgVdXOX7JbUWJZ-OQ
Message-ID: <CAAhSdy2cL6u_pAinYFU64nfqespQU+2x3GTeiqvjFUbJyYLLMA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:49=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
>
>
> On 11/13/26 9:00 AM, Anup Patel wrote:
> > On Fri, Oct 23, 2026 at 7:56=E2=80=AFPM Oleksii Kurochko
> > <oleksii.kurochko@gmail.com> wrote:
> >>
> >> kvm_riscv_vcpu_aia_imsic_inject() writes the interrupt identity to the
> >> SETIPNUM register of the vCPU's IMSIC VS-file while holding vsfile_loc=
k
> >> for reading. The lock keeps the VS-file from being switched under the
> >> injector: kvm_riscv_vcpu_aia_imsic_update() and
> >> kvm_riscv_vcpu_aia_imsic_release() take it for writing to move the vCP=
U
> >> to a new VS-file or to the SW-file, then read and clear the old VS-fil=
e
> >> and free its HGEI line.
> >>
> >> On RISC-V, writel() is followed only by mmiowb_set_pending(). The
> >> trailing "fence o,w" is deferred to spin_unlock() by the mmiowb()
> >> tracking, and rwlocks don't take part in that tracking:
> >> queued_read_unlock() issues just "fence rw,w" before the AMO, which
> >> doesn't order device output. So the SETIPNUM write can still be in
> >> flight after another hart has observed vsfile_lock being released. If
> >> the old VS-file is read and cleared before the write lands, the
> >> interrupt is lost. If the HGEI line has already been handed out
> >> again, the interrupt ends up in another vCPU's VS-file.
> >>
> >> Add an explicit RISCV_FENCE(o, w) after the write to the VS-file, whic=
h
> >> is what spin_unlock() would issue via mmiowb().
> >>
> >> Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA=
 IMSIC")
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >> ---
> >> Why RISCV_FENCE(o, w) and not mmiowb():
> >>
> >> - Since the mmiowb() rework in v5.2 (e.g. commit 60ca1e5a200c
> >>    ("mmiowb: Hook up mmiowb helpers to spinlocks and generic I/O
> >>    accessors")), mmiowb() is an implementation detail of the spinlock
> >>    code. Explicit invocations were removed from drivers by commit
> >>    fb24ea52f78e ("drivers: Remove explicit invocations of mmiowb()") a=
nd
> >>    from the documentation by commit 915530396c78 ("Documentation: Kill
> >>    all references to mmiowb()"), so adding a new direct caller would g=
o
> >>    against that.
> >>
> >> - RISCV_FENCE(o, w) states exactly the ordering needed here (device
> >>    output before the store that releases the lock), which is fine for
> >>    arch-specific code, and it is the same instruction mmiowb() expands=
 to
> >>    on RISC-V. wmb() ("fence ow,ow") would also work but is stronger th=
an
> >>    required.
> >>
> >> Scope: this only orders the write before the lock release. Whether a
> >> write that is already in global memory order is guaranteed to have
> >> taken effect in the old VS-file before kvm_riscv_vcpu_aia_imsic_update=
()
> >> or kvm_riscv_vcpu_aia_imsic_release() reads and clears it is a separat=
e
> >> question, see https://github.com/riscv/riscv-aia/issues/172. If it
> >> isn't, these paths will also need to drain the old VS-file, and such a
> >> drain depends on the ordering added here.
> >> ---
> >>   arch/riscv/kvm/aia_imsic.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> >> index f17dc559a709..807bb73a129a 100644
> >> --- a/arch/riscv/kvm/aia_imsic.c
> >> +++ b/arch/riscv/kvm/aia_imsic.c
> >> @@ -1056,6 +1056,13 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_=
vcpu *vcpu,
> >>
> >>          if (imsic->vsfile_cpu >=3D 0) {
> >>                  writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE=
);
> >> +               /*
> >> +                * rwlocks don't participate in mmiowb() tracking, so =
order
> >> +                * the write to the VS-file before releasing vsfile_lo=
ck,
> >> +                * i.e. before the vCPU can be moved off this VS-file =
and
> >> +                * the VS-file read and cleared.
> >> +                */
> >> +               RISCV_FENCE(o, w);
> >
> > Another fence after every writel() is a big hammer in the path.
> >
> > If the intention is to have correct contents when VS-file is read then
> > better place to add a fence is at the start of imsic_vsfile_local_read(=
).
> Thanks for the review.
>
> I don't think a fence in imsic_vsfile_local_read() helps here. The
> problem is on the writer's side, and imsic_vsfile_local_read() runs on
> a different hart.
>
> The SETIPNUM write is done by whichever hart calls
> kvm_riscv_vcpu_aia_imsic_inject(), which can be any CPU (irqfd,
> ioctl, ...). imsic_vsfile_local_read() runs on the old vsfile_cpu, via
> the IPI from imsic_vsfile_read(). A fence only orders the accesses of
> the hart that executes it, so a fence on the reading hart can't make
> another hart's MMIO store land.
>
> Without the fence, this can happen:
>
>    hart A (inject)            hart B (update/release)    hart C (old
> vsfile_cpu)
>    read_lock()
>    writel(SETIPNUM)
>      (store still in flight)

Over here the MMIO write targets hart C IMSIC

>    read_unlock()
>                               write_lock()
>                               switch VS-file
>                               write_unlock()
>                               IPI ------------------->
>                                                         fence  <-proposed
>                                                         read+clear VSfile
>                               free HGEI
>    SETIPNUM lands: the interrupt
>    is lost, or ends up in another
>    vCPU's VS-file if the HGEI was
>    already reused
>
> Hart A's unlock can become visible before its SETIPNUM write has
> reached the IMSIC, because read_unlock() doesn't order device output.
> Nothing that hart B or hart C does afterwards can wait for that write.
> Only hart A can hold back its unlock until the write is ordered, and
> that is what the fence o,w after writel() does.
>
> With the fence:
>
>    hart A (inject)            hart B (update/release)    hart C (old
> vsfile_cpu)
>    read_lock()
>    writel(SETIPNUM)
>    fence o,w
>    read_unlock()
>                               write_lock()
>                               switch VS-file
>                               write_unlock()
>                               IPI ------------------->
>                                                        read+clear VS-file
>                               free HGEI
>
> The SETIPNUM write is now ordered before the unlock, so it is also
> ordered before everything hart B does after taking the lock, and,
> through the IPI, before hart C reads the old VS-file. It can no longer
> arrive after the read or after the HGEI is freed.
>
> About the cost: this is the same fence that every writel() under a
> spinlock already gets. On RISC-V, writel() only sets mmiowb pending and
> spin_unlock() then issues "fence o,w". We need it explicitly here only
> because vsfile_lock is an rwlock. It runs once per injected MSI, and
> only when the vCPU has a VS-file.

I am still not on-board adding a barrier in hot-path. Also, any barrier
we add must be paired with a barrier else where with proper comments
so this single barrier anyways does not satify this requirement.

Instead of this, I think a much cleaner approach is to convert vsfile_lock
to raw_spinlock_t. The current vsfile_lock being a rwlock_t is create other
issues as well [1]. This will also allow us to use writel_relaxed() in the
kvm_riscv_vcpu_aia_imsic_inject() since raw_spin_unlock() will take
care of draining the write buffer.

I will post something along these lines.

Regards,
Anup

[1] https://lore.kernel.org/r/20260925155116.465203-1-andrew.jones@oss.qual=
comm.com
