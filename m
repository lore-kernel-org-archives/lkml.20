Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038002;
	b=DCXhhveiWrJzHdp9b81K/vUdp9Dr8gp4eTnoFkh++ZtSgFd0FG6WoS3WTEZXcaAl22Ae
	 VN1Cn84bNQOMElIVkc6xDx3HGxg8pkAKl627LuHj4xPDGwvMFBRF9Nkng7nGI6vTYGuSW
	 JONJmhroWrKgp3TX/6xQ26egrgZU2zNRIocGy+5ko+S2U5Cb56OikpNUrQRvxkW609uCa
	 zTZMArEGrZ9zgDmOIcS7HahXJxoH4czLMsYy/oEhUXvRzYvy1Eojr9tc0kXhoBDSffW81
	 XV/3oIOgZ1Q9ZYz9kE/bmrL3S7nEWT0UGKHDAwUEE/DmkD6RlZRtKWMEDBUioax4Sdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038002;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+WO5y2AngqrfTxKT/T6m0OE0wBrX03D/nrxV02HU4vc=;
	b=L6mVY1RkWCR6mqs0A91gt+hTf8nNjeklwUWUCXrfle+PRJKjewfm14XCBvzKe5IVrOpy
	 n6wzifJnqFWmGBZ9xDAPGnDTgdYyQbOEkvfC6D/lL7Ohm800paUQIXDC4PPVCCPP6Ye0M
	 0ZpmpKHDAwXVb3h/9vHeZeDaZsx/NsgetngyTtYk+XdxRQKAo+eX9RJftjKKG/VPVdhB7
	 qCrDe74Idq8xh+rETUbr9h6jTe1GkVrqabIdbr8CzgO7Wv6MeglKUsLVMUj/1T+faH+bg
	 dGX9N52V1OrZTin2M5zN7bWHpM67+Lz5N8rtD/vnJqxLzo+KBombtDyOfg2YQ25QfpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nuZXGavS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970DD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nuZXGavS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757CE1F031E0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793038002;
	bh=+WO5y2AngqrfTxKT/T6m0OE0wBrX03D/nrxV02HU4vc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nuZXGavS7nwFeAtYZG7Ii6CGpwv1djXJ4FILZrlSUIc/7SDyHIO6iDDZZxvwrm5fB
	 jcFWKx3mcvvX1zH9ZMh+bDWAO2Auj0SS4Vs1jScV19plYqqgc0djX650H0AGyeRHS7
	 sHBXCymBNa2Eug59E93QeFQx9Jcgl+n3fSjHNEAmQDN2wKkissZqp0MrUW79u+nTFt
	 gtSnUzGfqk+10Hxe71diHoMxPx6bhOPEYKOT1W4AqvT3grHwCdqVrQuEjGnhMclcDa
	 Ct77NL6BxqTRehOjetYmscGLySn1ssD0IqEjrFiB+T1s/VMtg2goFQnaeTUYr5U5VV
	 g71TmvtcZx6xw==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f1e5d7450so311281585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUhGzOxKxVtLFw569fGaaSYRO/158PCNI//X9EB8OUHsgQB83KRp0uoDqIcGf/PtQG69LTUnXpqYxBZSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRYSrNWPM1ZIcIEFtAJJYMBS9v3TImCMGdiy1gtW8maY2AHHNY
	sXgTrPA3yFmjUPKHdGHPh6c3cwUcHA0atW7xc8NX3bF1jlQE6Y5ICADXLNuNYcOUoBz6nUxZynN
	Sg/abpFI3Cmiq6fVGnxDyGcr3rM4bXzs=
X-Received: by 2002:a05:620a:2984:b0:93a:82a:71e5 with SMTP id
 af79cd13be357-940ef901e83mr1117271685a.19.1793038001851; Mon, 26 Oct 2026
 11:06:41 -0700 (PDT)
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
 <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com>
 <atqRyeqSXViiNIk6@google.com> <CAO9r8zMqiW=3t7zRo_WAhKJfpYsDwuG3e=nK14GXhrq+foYnOw@mail.gmail.com>
 <at-O8-tzgezj2du-@google.com>
In-Reply-To: <at-O8-tzgezj2du-@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 26 Oct 2026 11:06:27 -0700
X-Gmail-Original-Message-ID: <CAO9r8zO8ViSqCBer4rV5qBQGcDKA_60Aj_KEVQx2obd9zU7-Hg@mail.gmail.com>
X-Gm-Features: AclHuK_nwQrxES2GqNZh5mrxNi_TR0Sm-muFcxiIyZPzWxpBNhYA6gRX4WEkbgA
Message-ID: <CAO9r8zO8ViSqCBer4rV5qBQGcDKA_60Aj_KEVQx2obd9zU7-Hg@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] KVM: nSVM: Use different ASIDs for L1 and L2
To: Sean Christopherson <seanjc@google.com>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 10:33=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Oct 22, 2026, Yosry Ahmed wrote:
> > On Thu, Oct 22, 2026 at 3:44=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Fri, Oct 16, 2026, Jim Mattson wrote:
> > > > On Mon, Oct 12, 2026 at 4:37=E2=80=AFPM Yosry Ahmed <yosry@kernel.o=
rg> wrote:
> > > > Moreover, does this change the semantics of PV TLB flush? In
> > > > record_steal_time(), we have:
> > > >
> > > > if (st_preempted & KVM_VCPU_FLUSH_TLB)
> > > >         kvm_vcpu_flush_tlb_guest(vcpu);
> > > >
> > > > IIUC, an idle vCPU that wakes into L2 will flush only L2's ASID. In
> > > > the past, with a shared ASID, L1's ASID was always flushed on emula=
ted
> > > > VM-exit anyway. Now, L1's ASID will be unaffected. Though I can't f=
ind
> > > > any real documentation on PV TLB flush, it *seems* like the remote
> > > > vCPU would want L1's ASID to be flushed. OTOH, this change makes nS=
VM
> > > > behave just like nVMX.
> > >
> > > That's a bug that absolutely needs to be fixed, probably relatively u=
rgently.  We
> > > should also document that passing through the steal_time shared infor=
mation to L2
> > > to utilize PV TLB flushes for L2 is explicitly not supported.
> > >
> > > I hate to re-introduce deferred actions for L2 =3D> L1 things, but th=
at seems like
> > > the only sane way to handle this, because handling the !tdp_enabled c=
ase, where
> > > KVM needs to sync the current root, requires knowing what MMU is goin=
g to be in
> > > use when L1 regains control.  Yuck.
> >
> > Are you implying that *you* will be re-introducing deferred actions? :P
>
> Heh, probably not this calendar year.

Are you opposed to this series landing before that is fixed, keeping
in mind that it will expose nSVM to the pre-existing bug?
