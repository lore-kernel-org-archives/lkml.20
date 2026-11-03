Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793734842;
	b=dQZ7utF5fFBnFx2+zjQ/hudhgjS3lQw+qjGfUon2zuRtCGfDCgodsRW1JWYYDnLlKA33
	 XF3ig1RgV5qNK6AB96E5RGaXA62mXOTw523w82+FRGFZHG3cfBwqW0DzJOCQqZI/ilvuw
	 US0mvUjwR1rZlVNiPZdZicekkDnridV1DVggy7wSZdlAISZNvEwMqPwrrGBlRU6sR9dO2
	 BFkzKnoH1TY4rUS26wJhPFvoLfx5Ow+gthLHeu0QsykBgSLdj28KiPvwLidq6B8oTEtmT
	 fIUP6QqMJjS7GzZR18wifYuQC0566R0Uj7Ut9R7tcJK9tmCpawoWWC12rONbhUUz+gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QEdyje6GYOeiJ8aiWszqlJ8NcWeswSE5soiCL4nt5hE=;
	b=VLrRUF/ZrCj39Uc0g60uX1jPp9uhY8I8w2WagneOkAEG6c6b6lkomySIAjgHbFXzhsnt
	 exDeynlheCqq9zR3C+2/a5hXWmDEFjAmcwdM3XaYURgSTuOl3RQwqCVh+tdgcoC9BcEzI
	 uEPnRldFlU12wv6FSGsRBEyvjZdD4XUUaR4N/jTrwf1ePyNAVINXg7ae90mNarvNDrnVd
	 n1l6akK+RAoVvLGbTOGxdkLqbH1y1p8ypgBeg76Ipbee4kx33n6oTH0Dgxej/kbW3GI9Z
	 LkwqS0PDtwJ1MqhXOQ6OaeTQ5UHrt+V/jyRQH6ftAbCJ0PM8ta3GjFD88pT4gDPK8rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pT8oYGJF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177B606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5177B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pT8oYGJF
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1992a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:40:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793734841; cv=none;
        d=google.com; s=arc-20260327;
        b=bWc+j4ALREdCa9VdYLuEAlw/nDSSJzc/CqiW8tX7rW+qQtQGcf/ETp4t7rlqIX+lC3
         4tMuxUaf5m+Llrxx9bd5vTZaoBTAe82xYdNJzdQHTbp8JqgGY7wUfqEzbHuj4qufA7Tp
         RPie0yCzZuraMfZPGzl/QWYMdV8VATBuZyX+CW8DV/0COuIF2Je+xLA7QLAz9r2c+9tI
         Kj1JsVEjRvCgl19M7K/VJyhEGPvAwIQrPnfIwKzPVSc/u+laMMtF+ed28IwMFb0sZMkn
         QfNoOpE/rf/v+beP/OdgMmm6Ai84enFRNm8TWAN36/i8bs3IB3D/i58Cf41eynQmKG1K
         x87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QEdyje6GYOeiJ8aiWszqlJ8NcWeswSE5soiCL4nt5hE=;
        fh=TMnlwvb79P2hx9feLgNXFgMSF4g1B2smUBIyylCCoOU=;
        b=PEgHic/Uu1dV++1yLvDTXyeFNInP3H4Z6IAdXY0/oQcPtGncano3cp3QJD7uunhMZJ
         +yYaZ6quHvodTx4qGN43RvXIzdoYHGGQXP/05eeLaZaxUKYJWa91lYx1Ts9bY0xpmDaI
         v7tDXCBDKL4Nr3+rUlAYNZtS+gz4C4XQ9kkpsNoI0gYMDcsLvU1Pt/VwvE5pp6+Vo1I5
         MegDTyl3/H6/KNtW5isnHMBhzJ1L3b82eSIL6OS1P2KUjaxMvHJjcAqvxn7/caSqV8pe
         Un2Hnl2PCxT0wboOG5C/Yr8pC6AekFQZGVxNepIoObNGZlkHYz3WXaeqaR2XuL8BWhic
         sWgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793734841; x=1794339641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QEdyje6GYOeiJ8aiWszqlJ8NcWeswSE5soiCL4nt5hE=;
        b=pT8oYGJFh4OylXN6LyeQXGxqmvowxZqdmP7Y3GI/F86yIdKK61uaZXbx/qqo4fe3LE
         K+10ICcH6HQsz0hOTk4irDRXR09D76sjU72Eo7frk2aJyBkj2dTV3oxzS65+g7fbWTC8
         wqA+FfIIFa350fcZQMunKgAVUt3C05tdFY7Jdp4RiUaQlqlzlIm8cY1WHZBTeMsmEZqE
         S2+gCEq5vSCj9X0osfjThi+pXaT1qJgU+NoTEx3rcxFkyG/2JGCTjrDSb8aM8e2Lh3Ah
         nu1LXgiXKkBl9s62wwdN3yiPrVRzPQZj9DxfH1T+f6cxa236+QxvMVFbUha7FIycQPcC
         tgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734841; x=1794339641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEdyje6GYOeiJ8aiWszqlJ8NcWeswSE5soiCL4nt5hE=;
        b=UiLyES8QSrxCTdcoxKSEgOdYD7HVA7r6HsDpJ4pYjaXLii1JK41H7emu1d3NQlNnGn
         eUmfYVxRFpSVpAj1x3EbbCNxF3sM7CJoMBb5WqwXYnz3v6O1tddhlfacYVJV4I08dirE
         vYNz0L2Eysai6VWVgiqOCowqan4FZ0iDK38W2ckQlDhpPCF1PK8BIaxyW0Wi/DzSjqzJ
         a8Glcq0UEpMUqm/5dV+rnYBIPAIKzJf8jjPXXA4b7vP+4PCpWJwaKNiAGO9yL3WK4rHg
         XsIAi4JPJXKA6m/2KysiXiNS4zkYQBX93KTP5LSXMHndwMgewUzoFHcVRC+ftV7HLRED
         1Xyg==
X-Forwarded-Encrypted: i=1; AKwUvBx41PaoS7wCvyoCiwT7mczltYWddbVEajf5Vwu2w5EEiKe87dNI+xZxVyzL9SVdL3UqxdkYQuTKj1bR3xQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lKaf+1YSod2ocHrPGaFkLHEUxQxPVMBwk/urY55IdicuMmfoU
	Hdflq0gD0reu+CNIe/yRAHGEqR6JneCtC5nc8A9n4fyJWe4R8/C1Y0+Flq+Fj0sTbDRtLQu98AZ
	gYGAB02nj4E/norLoG+dVuaFGAemJaVnHkQnGUoVQ
X-Gm-Gg: AYBFou3PSbeD6/602kxCzM13ciSKRFn6DHZGzGxWmxVXyBztkeok1hOg7d01kIr66c9
	a2MCwJE/9kHqdmv6TyIzcSIgWMQ6UuENoW27PfLeYw4Jdzzct23cCUH6z5RklrqTm1CArgML0rl
	Snl2Uq0XyVBFn8j6mUcpWgeAmFXfMwS0oZvsVN1KHdqmq8gAJUPI1xC0EVNGyTUs2KGsykpmB6e
	ggl+UGqVWhM/nll6cBTLfMpdbAQUIrOo/D2d3jV38ThiNRbEwx39d5yiD3/QVjyqLrGgyPOGmAh
	oEQywCf/8PxYGIDg3+qJ9hBQoEl4s3pmuA+gi+6fK8SNQSSaaV1JuKAcI0y43F1cpKwchK+cM4l
	lBXld9VRu3yGYeaQgNSpvSkbyqtHxOOPCcb9WOIpzrd89QgAwG9cK4me4Hg==
X-Received: by 2002:a05:6402:b15:b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b5560924abmr11211a12.7.1793734840182; Tue, 03 Nov 2026
 11:40:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102231428.13523-1-pbonzini@redhat.com> <20261102231428.13523-5-pbonzini@redhat.com>
 <CALMp9eT7cnBf6kSXZLWuMyG9a52QveWjzzLz3Z9E=kPuX_ahVg@mail.gmail.com> <aukmeb9mV8b504T6@google.com>
In-Reply-To: <aukmeb9mV8b504T6@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 3 Nov 2026 11:40:28 -0800
X-Gm-Features: AclHuK-z2TRsVV5-P73NQ-eqccqZjCkcB6JcQTKj-t6dr0cpB0gWLBc8vRzU84k
Message-ID: <CALMp9eTdY3=1BrOYgov852VeAy3+Os7bvhWogvB0YF-JQrmtig@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: nVMX: Process each host MSR entry at most once
 when unwinding failed VM-Entry
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:10=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Nov 02, 2026, Jim Mattson wrote:
> > KVM needs to do better.
>
> Meh, KVM is doing pretty darn good, all things considered.  Yeah, this co=
de sucks.
> But I'm not convinced the alternatives suck less.  We've gotten the set o=
f missed
> consistency checks down to effectively zero, module the TPR mess that I d=
o test
> by running warn_on_missed_cc=3Dtrue.

I don't understand the TPR mess. The SDM says, "With the exception of
fields corresponding to virtualized APIC registers (defined in Section
32.1.1), software may modify the virtual-APIC page referenced by the
current VMCS of a logical processor in VMX non-root operation. (This
is an exception to the general requirement given in Section 27.11.4.)"
I would argue that this prohibits changes to VTPR between KVM's
software VM-entry checks and hardware VM-entry to VMCS02. If the
hardware VM-entry fails because VTPR has changed, section 27.11.4
gives KVM the freedom to implement whatever "unpredictable behavior"
we like. Yes, that probably does include loading MSR values from the
VM-exit MSR-load list, but why complicate things?

Something like returning to userspace with
KVM_INTERNAL_ERROR_EMULATION following a prohibited write to an active
VTPR seems far easier--and cleaner. What am I missing?
