Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792435805;
	b=2wmp+iapljIwuWExoQtqN9wdjAvs6Y4UOhIr4g6r3DXEd+J86nxyFfeGvowKNEyuA5Gs
	 m+YXMRoXvO56belL1IY676diL19aZsjx124ebmSjYyWWKCVZZ7UBR0PRKpPTpoUGUlbmG
	 mu8WNmKTMvP3MoQiZy6ZtNfnwZ8daejAT0LzFj8BuCsGRPF71v7kU2NDxl3qos78+5DRa
	 D86u4xQJ9kT789KR3CDVqtyGHVFhM5tT9ugvRZVE9V2D5GO15D+gW9I6hQnPN5usysolq
	 MF2XIevCJ3+GM9jrO5xXooZco2lcqdTXipIEcUu3ClfDZsA4piXO1PN07PkT1J/w5Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ysOFk37b7EhjKYs1jlxO5/HNbou30LEDlMbBjMznOzQ=;
	b=JZBYxwbW8Ig6nedx/WjJlZ7fS7a2CTx1yGrOcVSMDT2C+AjI/7XMwXKvG7xfXt92EI0W
	 4bvpWspunN0rHqt7Qvfd53MyBDrlaEYB7wCB/SqxfIx7rEDa7HkITWyQT+sXe3upoiXos
	 fopi8FJ3mqbvNJew4WYhnjF1+0Kuc1EsRY6uYulP/5VsVsiL+2NdjhAf0WJQ6qTm+7aYB
	 gnESXDtq/QgCvlTzRlW2ZlH++Xewe6dSIQ+uAgr4j95pYScyvVU2hCjUvfMrz93oFFcir
	 ioZtb2YPKCtVoXX9wpvdYZxOWWaEzbR3HXW5JMKKJJzahY+Ppx+qpxp0TX69o/10aKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gp2KVdHC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E7C606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E7C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gp2KVdHC
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1711a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792435803; cv=none;
        d=google.com; s=arc-20260327;
        b=d9hZPaTcBiukxNRNSJT5yJs5G+e/0A7f7oP88qndR4fkEyolMbvfnXWjY4BmkwFIko
         p3ESNGlaA0lB0/KygdMnJCT8O4tx2EKLkNXbMs/oMBoeE4zBABT2S9Xya6e4rsBj3H3A
         madirxpYsCQJVaeBhuL0MX+9ggPU15uoQRpb0Yd0GJCrOp5o6/0QUXrMrGdcHHE22qFs
         6se+5ER1VYTNS7NOaaFrd8TaJwAL+TdCoOY7GPmY29WqZaEjPD45mTjuzPt2vcR8ZdPA
         9fXVMUyr6PR5Eyc3dW/UO7V4b5SiAYVjsf91BAdQb034V11jMmlEaR9einX38NFCq2HQ
         0kQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysOFk37b7EhjKYs1jlxO5/HNbou30LEDlMbBjMznOzQ=;
        fh=9VzhrgzbZs3q6BJgxqfidbDjop8CaUGLbWo1hQg6+Q8=;
        b=LPLExcjS/go4yeITJWN4si7a3DAhiss2zPH3xoa/Y5mHNNjrNxwB7H2FZuVq9AH2Aj
         7peSj5GxVrqSpMxXnJQWFF64nZ3jnpWvE1a3m6rJsmpohJEIcRktvBjjdsywdIHc1xy8
         aj1wvRqFh79CfIL+QostMzt6+BJ6gOAl0PS87LU0IX844eYQknV8zs3w7e60qi6D5SXe
         ADbIR6eRdYUqyaaLgiKeOVsi1Cr0dGjLcCcsoKIJNgIfT460mXctJq5saKa80zu9qlkM
         h1NzEBqe8igEZHqDK+Xmfgt6lBnt684OU3u6tcQoFZAbnp1QHx96Lw+VwSrcxV4tuKxY
         JkPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792435803; x=1793040603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysOFk37b7EhjKYs1jlxO5/HNbou30LEDlMbBjMznOzQ=;
        b=gp2KVdHCF/tHupiE14bhXUoXsrCrfiM3vgC4SszA5Lgw1AZHSl5S1knOomWoE7M7XJ
         3vWoWvWTtYYw7rbdyoepgtCmzQgB/deyFYs6FP7+Ynkb7hjpfDg9PM8UbPYm1xB8EVzy
         FfDZ6hPqvWCqluBvPIuDfpxMIkvIXIno6biDIYBGVv9Nq7VJLFHMvWfur5XVlfFASOwC
         3Y8rsSQMJG3ixI8qLK+WdD1IIg3BBCjsdhmJnxLbIA+v1GThFO+Q3FTlQCFxC1fc8JrY
         /6isrjIe6rw1Vf9cY3dxkk/mQgSadCi1HEwsInW4Pw4iMi3bD0tUiXLXUpuU/YoKFe+w
         6nvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435803; x=1793040603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysOFk37b7EhjKYs1jlxO5/HNbou30LEDlMbBjMznOzQ=;
        b=raGrLIA37CWrOD/ShyHwbJ/4s0E5jZFQaZwUPBh+EZdmrjUdaRxeGs1yZAufWz6k6L
         Duvoa5a2+BoyPkMq7feoXRblybx5bp2piDXhUkm0VDvtTTiQ8P9+uUSnnhEHpYXzcJXC
         LCsaqTUXOF4QWRSSZve9vBwYGFbndsGxNwdy8C2Dv9tJzKIUA9CS6uZPbE9mm7axG9iV
         nzrjkNo9Bp59NbAWRT3ytw0RceWxMY2Zponz2/hko85bgWZc7JrCMcJA92PPIv4dy+0+
         4fQbCQc1exMdvkgUotyGzU5sgRBhxZPoc203VnlnVW8LTD8YpNnEx0BU3rxMfUVrTj6q
         gcpA==
X-Forwarded-Encrypted: i=1; AKwUvBxiKf2Th08ioOEv8AMXLMjRnrEnlVvg7uTMpZHE1gWolXrgB78M+Gu36TZReXlsfDF7+DZV5Bwb5eoKC6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJse2UywXgoNzZa95Kjdi5D2gD7jwoLpeDIhfKL3J9b3meFoxOO
	tHPndf+JjHWxXM1FZ0xVJjN+TM0yTOusxvpdV6JTCbDgbp8NP7VcdEO22bR9Q83RooHkHlHfkBU
	oV/sbh2NCLVC9AnfR9EoG/xscWQlI4Rj+Fzsf4RkC
X-Gm-Gg: AYBFou22OfXCvlCuh3A+/CUcYZ1V6b48cQreMkQiO2nhHmA97Zmt4oX4a697B5/oPW0
	cVbSAPRxacOl9T7fYPMJoKiwR4ug9jJeHqDAScvWIk6O5MsgAWBcEaZUeg1htQ/s9WZPdRUG0kL
	1RZQ4FtdaI0ndjQbFT8korOpd7Xqxerzm527Da3dmQnVCU12vBv6A0zvvYpcjMeC0Fadsl9bLkd
	90qwkgQfit92n8EW8NyrPb0GCZavxjSGkOQe+hqum57dWcA0Xa8/nXq0dDTZ5bTQLGcATGLzJrL
	8/ErJfOLa47n+yG/s7/ksV+BdOm7s4Wfk0qDu/m2o00UvbWcX2r5W2g=
X-Received: by 2002:aa7:d68d:0:b0:6a9:d188:2374 with SMTP id
 4fb4d7f45d1cf-6b3e57928cfmr6518a12.1.1792435802430; Mon, 19 Oct 2026 11:50:02
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-27-yosry@kernel.org>
 <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com> <atK3Y5XxL-zmAvY-@google.com>
In-Reply-To: <atK3Y5XxL-zmAvY-@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 19 Oct 2026 11:49:50 -0700
X-Gm-Features: AclHuK-HB6pH30iHmiqBTNMP3lFUzo7O87u3CK_c_9C3jbnplSPKBf6ajDasAA0
Message-ID: <CALMp9eRcWZ8fh8_m35RDw-VNrqz4kapVodGoLr=B_iAZaPOA=Q@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] KVM: nSVM: Use different ASIDs for L1 and L2
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:25=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Fri, Oct 16, 2026 at 02:17:30PM -0700, Jim Mattson wrote:
> > On Mon, Oct 12, 2026 at 4:37=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
[ ... ]
> > Per the APM, volume 2, Section 15.16.1, "TLB Flush":
> >
> > > All TLB entries belonging to all ASIDs are flushed by SMI, RSM, MTRR =
modifications, IORR modifications, and access to other system MSRs that aff=
ect address translation.
> >
> > With two separate ASIDs and the unconditional flush removed, do we
> > flush both ASIDs in the above instances?
>
> SMI and RSM, yeah I think so. kvm_smm_changed() ->
> kvm_mmu_reset_context() deletes all roots, and kvm_mmu_load() will flush
> the current ASID when a new root is loaded.

Okay. Is this mechanism obvious to those who are versed in the ways of
the KVM MMU?

> MTRR writes seem to do nothing beyond store the value, probably since
> 0a7b73559b39 ("KVM: x86: Remove VMX support for virtualizing guest MTRR
> memtypes"). It is documented as an errata but I maybe KVM should still
> flush the TLB? If that's a real bug, it's separate from this series tho.
> We just need to make sure if we fix it, we should flush both ASIDs. We
> can probably just reset the MMU context here too?

Probably. Admittedly, it's orthogonal to this series.

> I can't find anything related to IORR in KVM.

Me neither. :)

> For MSRs, I think the relevant ones are EFER and PAT:
>
> - For EFER, a change to KVM_MMU_EFER_ROLE_BITS resets the MMU similar to
>   SMI/RSM, so covers both ASIDs. Clearing EFER.SVME frees L2's ASID and
>   re-allocating an ASID will flush it by clearing last_asid.

Okay.

> - For PAT, I am not sure if that falls under "system MSRs that affect
>   address translation", but KVM isn't flushing for L1 today on PAT
>   writes anyway, so I hope not?

Maybe not. Intel, at least, puts the burden of flushing TLBs on
software. In volume 3 of the SDM, section 14.12.4, "Programming the
PAT":

> The operating system (OS) is responsible for ensuring that changes to a P=
AT entry occur in a manner that maintains the consistency of the processor =
caches and translation lookaside buffers (TLB). It requires the OS to inval=
idate all affected TLB entries (including global entries) and all entries i=
n all paging-tructure caches.

> >
> > Moreover, does this change the semantics of PV TLB flush? In
> > record_steal_time(), we have:
> >
> > if (st_preempted & KVM_VCPU_FLUSH_TLB)
> >         kvm_vcpu_flush_tlb_guest(vcpu);
> >
> > IIUC, an idle vCPU that wakes into L2 will flush only L2's ASID. In
> > the past, with a shared ASID, L1's ASID was always flushed on emulated
> > VM-exit anyway. Now, L1's ASID will be unaffected. Though I can't find
> > any real documentation on PV TLB flush, it *seems* like the remote
> > vCPU would want L1's ASID to be flushed. OTOH, this change makes nSVM
> > behave just like nVMX.
>
> I am honestly not sure. It seems like we should be flushing the context
> that issued the PV flush. But I also suppose (aside from Hyper-V) all L2
> PV calls should go to L1, not L0, so should we always flush L1's context
> here?
>
> It would be a pre-existing bug, but this series would be adding it to
> SVM as well. Adding David here since his name appears all over the git
> log for that code, so hopefully he'll tell us for sure.

It's just happenstance that the PV TLB flush mechanism works with nSVM
today, but I don't think we should feel free to break it.
