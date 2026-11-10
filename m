Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341695;
	b=PGyCLP0F3nzJPLvycnvIE+0L79bltggj7VvFCH8W69kHSb5f43r/+OyliA+drRvWO8r+
	 cRwsNq72On14ZsAq04DbejF0HCzOL89prZezQAKKydfTSEmMMEm5aRlcAvFSJUU6NtLMP
	 uYGMOHRF2fXWcWxC3oNguBYOni5xn45GsXbvF2oOxvPbuk/licOXmpFt+WDr6NCNo9Kq5
	 VpvRw75uk827/orkSehtk9uQJsVy+emdqy0dI59pp3SGDckI423IaOA/9tZVLgFj3HRRl
	 +plyA9+z+ZgBdbJxtwK+vD1uxqSVLBsZV7fEP7/18PWM8jDpj5at4SrlbgqSe0CQOGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=14T1p32+VtvUlhSErH4xscJ3EXnpusJwKW/S5Km45yo=;
	b=3CE8dW4GPWfzLNTIikhwnjpRjxFtppuuVPJXbOgN8oEXDp8IpjgjQCA/KvxmgDpZkMp9
	 JGUcGVLCH82F7VVzwz0PUnIBnIVUHuL4xn/UI3gZyJsUO5S1r7G0+c25MjFXdMq8/jlzF
	 hK4iumcIfnUs1dKJiCpIU7u2OtjO6tktH1ijza60zMmtcZZa+BG7cn9AYy8xsxEdANeZQ
	 xx2eEqvOnQEznZ5oQggWdm3e9suBrW7OlrXtw3XiBQUef6bjYTfhhQa5gaO3gUrXqgiLL
	 ZS5SMT3PqXmE8E+4sGo/Wkg+o5618dzhX9SumXSBGakt6ubSSvMzk3NHWmp4nVV53Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LwiHVhPi;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9633606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9633606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LwiHVhPi
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so2514341a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794341694; x=1794946494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=14T1p32+VtvUlhSErH4xscJ3EXnpusJwKW/S5Km45yo=;
        b=LwiHVhPi4e5g2jJg7nU1IvdqBzyzYhNnzRG143klAGsgg4KHx0IBXebsdt84Xu5Wib
         pbMwqJaPfbwnguC+Mk7Hu3177pzJha7j+Y4TK2uP5Y7okUMxO4ta7nITVUPnHABZumeg
         T+wn42JzHhCRHQee7bZsxmBKWD6nQCMAMg4lQUlnz6OHbvFnMZKaCk56W56QHoYY4wP+
         iZocqzGgiPMwgfKo/aw2+eU4rJAV5XwrBOh9Vte7vRub8IzOZBgupShNuriPaxh5E901
         WUyjRGkBqGpcuqaCMUGMygsykzGNluKAO+h9nIzTMTaG66Ma0ZSMUslT9ux5MlM560ku
         qcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341694; x=1794946494;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14T1p32+VtvUlhSErH4xscJ3EXnpusJwKW/S5Km45yo=;
        b=bSnK6kCNzdeTs/IjU8x/KltboyVJU2L/KgoXlJufgzUptoar4XcJ5cablPrHdrlBMl
         IFUnXCsxin52ZLBvsw4eluE5nDiD418t86uCeZoG3ZsL2HHfbLQMkn+mRPqhI9yAZwTB
         RYk8CRslJDGZVTGum/Yy7malWvLjNN9+sqmIGBTXu+cajE+RIXp2CXpTD/anA6dNnaOC
         gQBvo5KnOHJDJrezEHiSGQh5nKwJ8gXn1DkA7DHDjaVPJff8k3dRqwWlkshHqxcCWg52
         vLbeVQuhjEdZDMUvoS436ZHR6EN1Ux+hU2LjE1ril7ixbHNWEAOnhUmqSm1EL53uT4KP
         3+Mw==
X-Forwarded-Encrypted: i=1; AL+hErFLaisoFgz+u2k57ricJGpFvRMhQoSCNkg57dNBIchRbSb4A/qt0+OaRiQxnghHitw+1lcNyi62hyIfef4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LXrGPfx9Gr4WKB3tQKjD4hHqJcZAymbkzyMvtL4sB/MLQ1Jjb
	szHueNYjJr3qLRKhYbBhaadcSZHTw3pFvRIcFVZnD7H1QrwHWPW0MATqvCyGxo9WMAVbewLbI6w
	XoBJdVw==
X-Received: from plim16.prod.google.com ([2002:a17:903:3b50:b0:2e3:bd2:38ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:904:b0:2e9:4048:3031
 with SMTP id d9443c01a7336-2edd7a1102dmr2284595ad.39.1794341693808; Tue, 10
 Nov 2026 12:14:53 -0800 (PST)
Date: Tue, 10 Nov 2026 12:14:53 -0800
In-Reply-To: <cd458ee9a0c2405349cd2aaecb180f0b2e757aa3.camel@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105020104.2507083-1-dwmw2@infradead.org> <cd458ee9a0c2405349cd2aaecb180f0b2e757aa3.camel@infradead.org>
Message-ID: <avN7PfMdfZcYl7Gt@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 00/20] KVM: Use atomic SRCU for gfn-to-pfn cache,
 reinstate guest mode for x86 nesting
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rcu@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Durrant <paul@xen.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Fred Griffoul <fgriffo@amazon.co.uk>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Kunwu Chan <kunwu.chan@gmail.com>, 
	syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026, David Woodhouse wrote:
> On Thu, 2026-11-05 at 02:00 +0000, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > Based on v7.4-rc1 (kvm/next doesn't have the atomic SRCU flavour yet),
> > this series:
> >=20
> > =C2=A0=E2=80=A2 Converts the GPC to use atomic SRCU, ditching the rwloc=
k which was a
> > =C2=A0=C2=A0 scaling and latency problem, and which PREEMPT_RT hated be=
cause it
> > =C2=A0=C2=A0 turned the rwlock into a sleeping lock=C2=B9.
> >=20
> > =C2=A0=E2=80=A2 Fixes the pre-existing bugs which torture-testing that =
conversion
> > =C2=A0=C2=A0 shook out: a guest-reachable dirty ring overflow from the =
hypercall
> > =C2=A0=C2=A0 page write (128 pushes of the same gfn against 64 reserved=
 entries,
> > =C2=A0=C2=A0 without PML), and a lost TLB flush request in record_steal=
_time().
> >=20
> > =C2=A0=E2=80=A2 Adds KVM_XEN_VCPU_ATTR_TYPE_WRITE_HYPERCALL_PAGE, for V=
MMs which
> > =C2=A0=C2=A0 intercept the guest's MSR write and need to replay it from=
 host
> > =C2=A0=C2=A0 context=C2=B2.
> >=20
> > =C2=A0=E2=80=A2 Cleans up the intentional lack of dirty-tracking of Xen=
 shinfo and
> > =C2=A0=C2=A0 vcpu_info pages (Sean).
> >=20
> > =C2=A0=E2=80=A2 Converts steal-time / preempted status to use gfn_to_pf=
n_cache.
> > =C2=A0=C2=A0 (Carsten)
> >=20
>=20
> I love it when sashiko-bot finds things which my own local runs don't.
> I'm still iterating on the latter part of the series; I think it
> probably makes sense to merge the first half (patches 1-9 above), and
> the nested parts (below) can come later.
>=20
> Sean, what do you think?

Ya, I'm definitely in favor of that.  Even if Sashiko didn't find anything,=
 I
think I'd want to grab the GUEST_USES_PFN stuff separately.
