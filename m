Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036020;
	b=uws5V8NY/6clXjyma+eZOjUpZOh8XfCpcajDNTiK+isLAFxD4rv3gfbRmD++C297Yu5G
	 MZpE0k1W/Q5Oz21C7qUn6xVMJsYXSbqV8GuP3A62ZDJO4D4zv2X/2gupvYHC0DjOrS+m1
	 mITPpX/nsgClO8ClXTjvnhDN9QF8pUUgMtnQ6sXVDbUyqoyspQk8sLaFVgwrtnoqOfCDX
	 FZyEQyTXu4m437ovX93s4vTEb1bV7FBLb6cYaL7ACKPzq1BicKLFDuHX5hv1zshdu1iy7
	 XDzJLdVW6dERk2IL693KxYltCTw+VpyGF22MHH4GfvB/EXw2/7Hg7GWWo5CCWNsJBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xMNotNXN0v+rqef+RGi08mcoZsVflWbvcWJddr3TJy0=;
	b=MAjDHVQj2e7pQaYUgoY1Rv7c2av0UlrWIIITElpSUdlxZU5ALidXSVRG21INuF/iLSZA
	 GU8dh+rCi9h/GJzYau74Q1UDkoy5FwhB1GcX5BDp7n11V18A6txRtQTontt6eMoVyWBOg
	 +k2iHsUBDIWWwKfET9ar9QckyelHhacrmCcPFJWPlYGZqvGzpURRn8D1iUCY81B1JRIzK
	 hTXW6v9dLZ9gnYp4DI/c/eHXadnu9dj4USG+KKRFIUgVaU8T5ieaOyazPbt++dZeB2S/f
	 VkuQKIqlP51PKYQ0aoqfwlK98Q09UCKYRk/H7QrRfQpZ9b9vo3pqLGeenEVBCcx/31Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Yx0+965+;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 972E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Yx0+965+
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd67e98f68fso4459219a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793036020; x=1793640820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xMNotNXN0v+rqef+RGi08mcoZsVflWbvcWJddr3TJy0=;
        b=Yx0+965+y9TSk15G0RaTkGx+8zPA7oN4/6+ScKbVEBHUPHpWGXXEJObzM8/IsWw2eI
         ZvE3WWIGS393vaup4Xtr/a1H/Q0cbTIz7Mao4gtBXk3vP08a4o804K8CkuCMciC8MS1Z
         HxmzxGUfJ72rmdY14CY+lSUMHH72svcIH0FBbhfzcJS2zh16rh17L5KWew0vTdwcAXYD
         JpwwABAyPB0r5MfcexeOtwKyYbicKH5gjFtkf1uVn7tfqir70UFMl1ivi6DKcZdcYZ7x
         3ErixlaCdpgbXY9gZX83zlfLPz4CJt9Nnpv5t39DStxFGDckFPSvC4Yau6JKpY+siH+u
         CIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036020; x=1793640820;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMNotNXN0v+rqef+RGi08mcoZsVflWbvcWJddr3TJy0=;
        b=O6PPX0YzZVX0Q1xxw3+Ozd59QClzxC7qGzYM+wfc9HFJCBYdsCOCYK01NY1HSHePJ3
         f/rr7SJF/+AG38kMlRHSTxJoVsuRCrnl0wHpnbeae3yoJIRpwnD4PsuTsq4ckgKDuLMK
         Ju5Xc1M5S7ItJxwS2MstS+68evfh5/vRUDCQn0jQlYE+r1FC2guI3+CD2jQTsNHWqQ9r
         7zJNrCcSQkTexNzlfc1ONSfIekihy6nw4Wi/ozNSp2WvVBMASTJ6UPQjPs+dvAmYboUq
         bSPp8dbb7nw5Z7YBxofZWSSAh3faSjTzuf+fZX7AI+pfuT3yWvNkTMH1gl0ZoPWUaCfF
         b24A==
X-Forwarded-Encrypted: i=1; AKwUvBx2Ny2cOzTB1EsOSaQEXSa6UAIUWJob30eJ3TudUsi90IITRacEqROlA3L+78nhoJigNncU/yR85s4WqfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/F/D8cOAscnrM2ih1n5vmjcirGbS+7lGSyoS95H3a/dS2t4fe
	aYxuIDweMj9yhjP9GXFni4Gs5v5c3/Zgcq5CilUtUdcntUkeI5y8UsZDc4jjJLucYiOoAsTiBtH
	1HoqdSA==
X-Received: from pgvq4.prod.google.com ([2002:a65:6244:0:b0:cc7:52da:b682])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e08a:b0:3e2:83bb:a608
 with SMTP id adf61e73a8af0-3e7afa9a445mr6169026637.2.1793036019697; Mon, 26
 Oct 2026 10:33:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:33:39 -0700
In-Reply-To: <CAO9r8zMqiW=3t7zRo_WAhKJfpYsDwuG3e=nK14GXhrq+foYnOw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-27-yosry@kernel.org>
 <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com>
 <atqRyeqSXViiNIk6@google.com> <CAO9r8zMqiW=3t7zRo_WAhKJfpYsDwuG3e=nK14GXhrq+foYnOw@mail.gmail.com>
Message-ID: <at-O8-tzgezj2du-@google.com>
Subject: Re: [PATCH v3 26/27] KVM: nSVM: Use different ASIDs for L1 and L2
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026, Yosry Ahmed wrote:
> On Thu, Oct 22, 2026 at 3:44=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Fri, Oct 16, 2026, Jim Mattson wrote:
> > > On Mon, Oct 12, 2026 at 4:37=E2=80=AFPM Yosry Ahmed <yosry@kernel.org=
> wrote:
> > > Moreover, does this change the semantics of PV TLB flush? In
> > > record_steal_time(), we have:
> > >
> > > if (st_preempted & KVM_VCPU_FLUSH_TLB)
> > >         kvm_vcpu_flush_tlb_guest(vcpu);
> > >
> > > IIUC, an idle vCPU that wakes into L2 will flush only L2's ASID. In
> > > the past, with a shared ASID, L1's ASID was always flushed on emulate=
d
> > > VM-exit anyway. Now, L1's ASID will be unaffected. Though I can't fin=
d
> > > any real documentation on PV TLB flush, it *seems* like the remote
> > > vCPU would want L1's ASID to be flushed. OTOH, this change makes nSVM
> > > behave just like nVMX.
> >
> > That's a bug that absolutely needs to be fixed, probably relatively urg=
ently.  We
> > should also document that passing through the steal_time shared informa=
tion to L2
> > to utilize PV TLB flushes for L2 is explicitly not supported.
> >
> > I hate to re-introduce deferred actions for L2 =3D> L1 things, but that=
 seems like
> > the only sane way to handle this, because handling the !tdp_enabled cas=
e, where
> > KVM needs to sync the current root, requires knowing what MMU is going =
to be in
> > use when L1 regains control.  Yuck.
>=20
> Are you implying that *you* will be re-introducing deferred actions? :P

Heh, probably not this calendar year.
