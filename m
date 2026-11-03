Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664635;
	b=t8DVQ2mkYlhZXa0U9M90tBsCSo9Up9LjX9txzH2BMMMBN/jIWVcgShWLEZHBjqNr1p/I
	 rGzViBtPuAL5U+A/GZFi9ncz5piYZy465X3Z+ZzlNjNfehaD19tkmRhkcezQkUKULlSRW
	 mIpD4Cdu08bHrj2dQcifRwfpfsZD0zr2WqmNA4QyhZJVIxepDq3sEMkHIiRV1QJ3tH6s8
	 Q2CSS859vRXMqSt7nIV7T5WkyIsguBfHtbev8PAUHF3wthc8AY9kU4ZotwOSfnRGV3BoA
	 kPThpy5FSW/RWf6KFkwxjMwxx2nylAuxJg1acuLSfG/gfpnpodsEPMIKJHu+Pwv7IGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=J6L8mY31MNtz95VGUAtfNyYMcOeErTGfjG4txWKjWTE=;
	b=I3/YZ6W37NPBS80EUGAvENGNzWSKh4lvBu/vQRi+oJoHey8Pf4XP3TpywI2iUDCfUi8K
	 vJG3xKru2U91NdFrTZOtikhD/SA4SDxZRiIBNCPHb0kOLMM0jvTRDqXIW56WIwQir3mUU
	 nrl2ssxq2t/rlPjdPbt4fnZcwpQLssCuoUi0AgKgdVmPxJfFC6Upvw8ME+rYH8oz5xLX2
	 nIdQMN3SLSuZ6495k5kcPaANV+fSsk17bvsRM+cFE9izdYYihMxhK4/xTVRHSdQd2VM1q
	 4rHS2XZPUZi9gtMr6Hnq/C+kUjByGzVwgiHoUN0Vosd3/LCgyHm043BqvldVc+6vNLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ehVpHByY;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1F606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA1F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ehVpHByY
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so2543840b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793664634; x=1794269434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J6L8mY31MNtz95VGUAtfNyYMcOeErTGfjG4txWKjWTE=;
        b=ehVpHByYYF2DK9rR/bSPBeu58DBwDQ4nrUyGNi9vI0lfJ7BQa41cOtPIazX8pL4Q7x
         U4kKinUUgvsFQDFBkmqv9T14DpG3DG5iPDfjEQX4geYGzX0SNEyA/ZMvnKAltqaRKvbM
         AbAtm3VMq+LfszI+ln2vBRayeWn7xX/cT/ioXUaEvIXpHBD2zOMDcjRtV+4/pAdvLZs7
         HDR1BPNFlvYgnoDcTnkNm+K40M2ojo+mJGYX9/Ei5p82ARUgcYcY0EmjtiEkwXdEL9xX
         NlaqjSQ7VlXc9mbhexOQC5Ji0NE/Y37yvdPT1z10f9EI4xII66hJL1hsRS1mUaRWPQLD
         YNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664634; x=1794269434;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6L8mY31MNtz95VGUAtfNyYMcOeErTGfjG4txWKjWTE=;
        b=oJPQ4Ynaj5IU7L8DlSODwxTG+1H35eZ67f4su3AOMtW9a4mD6KSf+LdSAp53qQsGxR
         808ZY8YPiWNVpbnYgVdpKgzu8l7eashSImxLm4wBju41MdRUXjGH2gBc1SpAT46eQXCb
         dvhDMlAHlkypvKi2NZdnndr1QKx+NXseaXHa0Z3HDA4U1KMC9/xAYsmPJaKtL0tqJTBe
         +k5BiMuQo0aIDHnlQJfZ84dZRfHArMyjRbBcCq7BT2OVU+SDh8a1mFTP4PM/Jjk0AAtL
         oKWTGWSFAVVXlYS93CqZ+TEg0ZG+rvmN0rTLpcXChUVUHGdVJg6P7oIu436k335xIMlm
         xf1A==
X-Forwarded-Encrypted: i=1; AKwUvBzQssk+bSsRu2j5pRiBj4KOOXuvox7bZu8QemwKdyXsNozqW3AGyh96tsKUzSuWrNv7QQZRQgCfLXit1kU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GSDyWMTDvQ1G1aId8eekLP9+QEWgUaFi8EK/OZufp9LucC+cc
	jluQ0l8JM3fHKCtT0ihGQsOzxqGHL6PUeLRg9AVJSBWmSsxYISTlZOm31KQi6p/JIV7QkV6gIns
	lmRCbWg==
X-Received: from pfhx5.prod.google.com ([2002:a05:6a00:1885:b0:8a0:9321:5329])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ab05:b0:886:9078:546
 with SMTP id d2e1a72fcca58-8a9be96509amr9968061b3a.26.1793664634176; Mon, 02
 Nov 2026 16:10:34 -0800 (PST)
Date: Mon, 2 Nov 2026 16:10:33 -0800
In-Reply-To: <CALMp9eT7cnBf6kSXZLWuMyG9a52QveWjzzLz3Z9E=kPuX_ahVg@mail.gmail.com>
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
Message-ID: <aukmeb9mV8b504T6@google.com>
Subject: Re: [PATCH 4/7] KVM: nVMX: Process each host MSR entry at most once
 when unwinding failed VM-Entry
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026, Jim Mattson wrote:
> On Mon, Nov 2, 2026 at 3:19=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Add a missing "break" in the inner for-loop of the open coded mess that
> > unwinds MSRs back to the pre-VM-Enter state when VMLAUNCH/VMRESUME VM-F=
ails
> > due to a consistency check that is caught by hardware but missed by KVM=
.
>=20
> That sentence does not accurately describe what the code does.

"attempts to unwind MSRs back to the pre-VM-Enter state"

> > I.e. move on to the next MSR in the VM-Entry load list after performing=
 a
> > write using a value found in the VM-Exit load list.  Processing *every*
> > matching entry in the VM-Exit load list makes the processing quadratic,
> > which is problematic if the load lists are full of MSRs that are expens=
ive
> > to emulate.  E.g. writing APIC_BASE triggers kvm_recalculate_apic_map()=
 and
> > a whole pile of unnecessary work.
> >
> > Functionally, arbitrarily restoring the value of the first matching ent=
ry
> > is "fine", because none of this is architecturally correct: the load li=
sts
> > are never supposed to have been used in the first place.  In practice, =
it's
> > likely a moot point as no well-behaved VMM will have multiple, divergin=
g
> > entries in the load lists.
>=20
> This isn't "fine." This is disgusting.

The "fine" here refers to what is being changed in *this* patch, which is t=
o
load each MSR at most once, and to use the first value encountered, e.g. ve=
rsus
the last value.  IMO, that claim stands: in the context of the existing cod=
e,
this change is "fine".

> The assumption that the VM-exit MSR-load list will "undo" every
> assignment made by the VM-entry MSR-load list is misguided and wrong.

No one is assuming that.  The comment even says *exactly* what you're sayin=
g:

	/*
	 * This nasty bit of open coding is a compromise between blindly
	 * loading L1's MSRs using the exit load lists (incorrect emulation
	 * of VMFail), leaving the nested VM's MSRs in the software model
	 * (incorrect behavior) and snapshotting the modified MSRs (too
	 * expensive since the lists are unbound by hardware).  For each
	 * MSR that was (prematurely) loaded from the nested VMEntry load
	 * list, reload it from the exit load list if it exists and differs
	 * from the guest value.  The intent is to stuff host state as
	 * silently as possible, not to fully process the exit load list.
	 */

> Xen, for instance, puts SPEC_CTRL on the VM-entry MSR-load list, but
> it does not put it on the VM-exit MSR-load list. Instead, after a
> normal VM-exit, it restores the host value in
> vmx_asm_vmexit_handler():

...

> KVM needs to do better.

Meh, KVM is doing pretty darn good, all things considered.  Yeah, this code=
 sucks.
But I'm not convinced the alternatives suck less.  We've gotten the set of =
missed
consistency checks down to effectively zero, module the TPR mess that I do =
test
by running warn_on_missed_cc=3Dtrue.

E.g. for Xen to run afoul of a misbehaving guest, Xen would have botch its
handling of vTPR.

I'm not opposed to trying to figure out a not-horrible way to snapshot a li=
mited,
hardcoded number of MSRs to make KVM less wrong.  But I sure as hell ain't =
going
to spend cycles on it at this point, because potentially clobbering L1 MSRs=
 when
L1 itself has already screwed up is firmly in "don't care" territory right =
now.
