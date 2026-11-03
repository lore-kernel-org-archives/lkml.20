Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739592;
	b=ftl9M1rIM+r8LKxm3FG3wg+11SkAm02lKvuuR6JHf1D1iYo3enWCiXJbLXFTUthbtnHw
	 Igp8Kzy/VWtS4izhY1BBO0ZKgM1I653MkALJX8OWRPFPgn9tQkA1cjWSEp54lQ/Vw7XUD
	 au0TzS67THHuxasQd8Mm7qud1t4qmEeDFbmst3b/S3Bovpw2//HFI0NUJa8vCXvuVwjMS
	 Qy9STDzbQ3EevuIbKhL+MJPXUycXtS56AcricIN0rJLIH9VmFaRRxicQPJlroiOae99Bc
	 ZkDE+Xx5liV5mEVUfF7516UNvYZUnHzLpL6sDDCyGAi87/eUYbX5gdIPe92o0iPlmKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=2lqPU1i/NYd7KL1kWuqVHp4WfF9iJW5OIp18EbwlBIc=;
	b=R0vBa7lWtdNoH/WPMWpMzO0p5HG7B9Xs2k+PDb/MszfVndG0aZEDDtYDVfFOXWBLooPB
	 8jKxtgmxA7Be07+wA3Xwwa8zTrEWm6n4lW2fR7otzygkBA8SXNec5wrO5zz5AUDUw0Jrd
	 FeQfHFTtiiBkxyUvnRxkA7o1/23p7OprdfsajtxFwDzTRvmvMXYgbjEN1NlWe61eTrOzv
	 HbNt4/ItdAfHZ8XlQLznb0o9W0q/Ln4V7a5KRegO8QI7GO5Cwy7FbSYm3uDQt1oiTJudQ
	 5GEZpH6FyK1eJEPFM9j823aDb+SNkGvJcBkCUDgT+hefLaLBddj5NEmSqYNXBuEV4kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kn1dICsH;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49E606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E49E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kn1dICsH
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso57093a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793739591; x=1794344391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2lqPU1i/NYd7KL1kWuqVHp4WfF9iJW5OIp18EbwlBIc=;
        b=Kn1dICsHv3kIJp4YekG1h6JEQEA+bb5bCjvVPaeJ6H/LaCXUx6GdnQcLOIAReqRk2B
         cA3ung01tvuILYIEgFi9p/GdsTTRJHqk1NLM0Zh29v/pGAMnCaliaRjQbFYf39uMaP6U
         SCxpfso98S46IB43YPr3mGqI0FcYjFlm673p6yeRmxalRdip4/HTBoFvbULk2M/b2Y3k
         rUk/HW2G8hcZJ1+qm+gv4H5lhYoV4wZivpIKuMkH6sM6dOx2iZwrFY2JOYdPYIUxc2xB
         OzUjn6SwmK5uxcJ6XiGSDubmTIAckrb9be0eEudZIohO0s3KkWORPTgGszhDXHmagmmu
         Cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739591; x=1794344391;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lqPU1i/NYd7KL1kWuqVHp4WfF9iJW5OIp18EbwlBIc=;
        b=zZyN9HyMZgguARBtpnmEsLZpLsgVdjg5DKQ3vkApgbI7lK9P4/meUHW7uAkB2GEaB+
         5VlSQbe54wzYdVlSV9bnXK5r/SswKJ/qy8oB2moc2E/LUeANhOqA+Ft20YiaCToqEhBX
         sUvmUPO1qBWRjkdo56vtGzPePIGgxNSWfQDi2t4Rj2U/gonGTzOxMjYYlpj0jR9Jrmml
         xf7M2UUydP8XOHW/12a9Dqy19i2KiKLwxEbMRtL6Nzn+qx7x0nL3lVIbjZh8nuqgWc7Q
         POsEs1Qy2uWTJt9GKFvIazxOcMNXZEn7O0FTiuwznbITrzFotVOI/HssUmv4qafFN00H
         +gsA==
X-Forwarded-Encrypted: i=1; AKwUvBztZsYWb+jf0+UI1D+aydpiHPa6/stxPIYDf9sYF68qD/H7A/zhyYah5R6IDuH08LFfsd2IAmBFYa2KxOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qxi17csK79/p1W1LhPm2cPw/tZhvMc721geQ8FOewyg6ntymQ
	vBbVLQOpoICuJNgmZfscpajX3WwPuu1X4EZAGCEkicN07yGkMnZ13HZxlCZ/5QgzE2s62lclsw7
	GyGxxGw==
X-Received: from pjhw8.prod.google.com ([2002:a17:90a:5288:b0:3ae:c401:753])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d887:b0:3ac:8af9:4a77
 with SMTP id 98e67ed59e1d1-3ae897c94e8mr12522138a91.10.1793739591455; Tue, 03
 Nov 2026 12:59:51 -0800 (PST)
Date: Tue, 3 Nov 2026 12:59:50 -0800
In-Reply-To: <CALMp9eTdY3=1BrOYgov852VeAy3+Os7bvhWogvB0YF-JQrmtig@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102231428.13523-1-pbonzini@redhat.com> <20261102231428.13523-5-pbonzini@redhat.com>
 <CALMp9eT7cnBf6kSXZLWuMyG9a52QveWjzzLz3Z9E=kPuX_ahVg@mail.gmail.com>
 <aukmeb9mV8b504T6@google.com> <CALMp9eTdY3=1BrOYgov852VeAy3+Os7bvhWogvB0YF-JQrmtig@mail.gmail.com>
Message-ID: <aupLRleTJSIDTE9M@google.com>
Subject: Re: [PATCH 4/7] KVM: nVMX: Process each host MSR entry at most once
 when unwinding failed VM-Entry
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026, Jim Mattson wrote:
> On Mon, Nov 2, 2026 at 4:10=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Mon, Nov 02, 2026, Jim Mattson wrote:
> > > KVM needs to do better.
> >
> > Meh, KVM is doing pretty darn good, all things considered.  Yeah, this =
code sucks.
> > But I'm not convinced the alternatives suck less.  We've gotten the set=
 of missed
> > consistency checks down to effectively zero, module the TPR mess that I=
 do test
> > by running warn_on_missed_cc=3Dtrue.
>=20
> I don't understand the TPR mess. The SDM says, "With the exception of
> fields corresponding to virtualized APIC registers (defined in Section
> 32.1.1), software may modify the virtual-APIC page referenced by the
> current VMCS of a logical processor in VMX non-root operation. (This
> is an exception to the general requirement given in Section 27.11.4.)"

Oh, I wasn't aware of that.  I agree, that gives us an "out" for vTPR, most=
ly.

> I would argue that this prohibits changes to VTPR between KVM's
> software VM-entry checks and hardware VM-entry to VMCS02. If the
> hardware VM-entry fails because VTPR has changed, section 27.11.4
> gives KVM the freedom to implement whatever "unpredictable behavior"
> we like. Yes, that probably does include loading MSR values from the
> VM-exit MSR-load list, but why complicate things?
>=20
> Something like returning to userspace with
> KVM_INTERNAL_ERROR_EMULATION following a prohibited write to an active
> VTPR seems far easier--and cleaner. What am I missing?

My biggest concern is that KVM could kill L1 if an L2 coerces L1 into tryin=
g
VMLAUNCH/VMRESUME with invalid state.  KVM simply can't *know* that an unex=
pected
VM-Fail was due to the vTPR wrinkle.  Even if KVM re-checked state, it's po=
ssible
for the vTPR to be "restored" to a good value.

I.e. if KVM exits to userspace with KVM_INTERNAL_ERROR_EMULATION, then ther=
e's a
non-zero chance of a false positive.  KVM could exit to userspace if and on=
ly if
it caught the guest red-handed, but then we'd still need this horrific code=
 for
the other cases, so that seems rather pointless.

warn_on_missed_cc helps, but in practice it can't detect cases for which we=
 don't
have test coverage.  So *if* there was a bug that could be exploited by L2 =
to DoS
L1, odds are good warn_on_missed_cc didn't catch that hypothetical bug eith=
er.

Maybe with AI we can be 100% confident that KVM performs all of the VM-Fail
consistency checks?  Again, I'm not opposed to alternative approaches, but =
at the
same time I don't feel a sense of urgency.
