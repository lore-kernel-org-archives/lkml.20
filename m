Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036161;
	b=pVAtN/k4NhCLi2xAxSmO8zJSiBo5km5/7Djyrptmid6gQtat7009ziSBrCehcDN/nwSj
	 qvdAoSzikByC8XT1MYK+he8NPs8Hh8xGs7r0VxzQAjZeTRKaQ1WsVtTLBpXJNtQYlmKN4
	 obckjTUz/jy9yJHK4a1W7b4Zw/ymrEZqx1+UvZ8dNvRpbcFi7ViVESf2HLmLIpgygGgeS
	 CLabh/3bBhv3BM88gho8JklDlu6EwlE13nF7uMc3LhdKb6sfAvmPkx7a6ux9D+1c1Jx9j
	 KEmSZbuyqs9Uv979rB2VBZCBTYTO64Gzac9S+mB09mTmdD9LK0gAtVwy2hcxNd3hd5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=axrVcD0p5PvEtJBCkRASdU2YtEOHDgVXbwmKjNoGb30=;
	b=eKpzzM+3JuKDcKIxEEqjOSy08FfJ1iqb4RyVKb1FGXSbSyNgs5rVv/nL/XX1s6+xe99F
	 gTArhUZ2ZrhR86h0sTdN38sU+jI5PxHx69LwxDYzhuLPNgZoyLPwbDEJPE6M+Mw7Cmy57
	 TRalKpxD6NOPNcco/JedIZLNzW66X7A/X4Cexjmy8wsKvOZ95VU7bp5PW9dBIiJlh9jim
	 P25QZXkgob2XN6SA2uER5weVPPFTdPDE4OL+ZLwLQss4TrIv9AjwuJGLiH1Mk6WtcJBKk
	 OfA/7Af7kO+mRTeUllSbzm2pwWkUWvh401cNwGjnQtJcKGFH8OGYvhLrOpRdEmuWYow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eGncRXIq;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eGncRXIq
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so2245315b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793036160; x=1793640960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=axrVcD0p5PvEtJBCkRASdU2YtEOHDgVXbwmKjNoGb30=;
        b=eGncRXIqVGHNQGs4hfSwjOtKaTJd4KaN0r9pHolyrwa+OmicTDLvbFll4VIj/WztRu
         apDgOypywlVYFZ0PGCNTXsd53runcxOM9cYkc+WF6h3uvP7BRUtjWXNglSjisCd6ydAZ
         1yO5qExA/QuDaRvfsP10XifQI7DQDL7MFQsxaSV/XiXHeMZNwsKNdi5nK0mywrOu/aBX
         gRqDawHWUKybklxjNxlMJ8NCieN7AH+by/m0fhisjqPGnUyThKPhSOM4CI0N6l+ZSdNQ
         rsV7n4TcTsZxRH01sHci2k7hXYDSht4JdeP7wQPnuUrMNeWOgGL/Z957x+k4vGV12dO2
         vnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036160; x=1793640960;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axrVcD0p5PvEtJBCkRASdU2YtEOHDgVXbwmKjNoGb30=;
        b=oiVjephjUVatxGW6wvqac0xxQeYJZ1V3tPwLJLALpCsRnb3oXjEgIE5CuF8BDtF31u
         TDMnfLd83Aegdi80UJBNDRUN6BEO5n8XmR4RElAP+rMWaKFAs00C1MLjzZ4WDHT8p/yo
         ozl8hLlRwe6cN9dYfhkjuFnrI0oaA9nKFFqrJgqHI6SM91H+kwSJGbpcVO7RkieyVrE/
         9GAYFDTccV4AbSyRMqlcxDEbidrHbhRLBoiNdLUlP90sWAQIfS+cVurVVJbQ48p3T9wG
         hNA9ybqStJXRLooET8TMD/oVbTtmoC6sGI0vJctWTNeXvMg9XcwD+5XA1si3GFC4LH5C
         jP8w==
X-Forwarded-Encrypted: i=1; AKwUvBwpKXVL/64RwBvDXXLTzwVGoII7Td7G7pSkjPYMMbrnt6aUK83CFVCu5lDRKVYj27KxiLiBgbdN6xN7Ua8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/KzEBiY5CAdUoHRqI3F70NXpk5h4Z5hGhhcUfrbOWmpFuZvS3
	sm5oSxnPxbGktPAHFDNxtTr0Dto5ZimAW40D2lwF65NG6BzekpBK7pDQAnq482VAbhXUyktipp/
	LfYEUpQ==
X-Received: from pfbfh38.prod.google.com ([2002:a05:6a00:3926:b0:88a:f8c3:9c75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12c1:b0:893:4980:630e
 with SMTP id d2e1a72fcca58-8a3689aa54bmr6009770b3a.31.1793036159953; Mon, 26
 Oct 2026 10:35:59 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:35:58 -0700
In-Reply-To: <CAO9r8zPFEwUVYSTePWN-FurHLzGN6cY8bd-BOj3sjRmjj4xQbA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022215541.631694-1-seanjc@google.com> <CAO9r8zPFEwUVYSTePWN-FurHLzGN6cY8bd-BOj3sjRmjj4xQbA@mail.gmail.com>
Message-ID: <at-Pfgjt__PJl55M@google.com>
Subject: Re: [PATCH 0/2] KVM: x86: Convert all runtime WARNs to ONCE
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026, Yosry Ahmed wrote:
> On Thu, Oct 22, 2026 at 2:55=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs that ar=
en't
> > strictly scoped to module init/exit, or similar, to ONCE() variants for=
 what
> > should be fairly obvious reasons at this point.
>=20
> Do you wanna CC stable?

Not really?  Maybe?  I worry that this will generate an absurd number of co=
nflicts
and also have "misses" in older kernels, to the point where it oculd do mor=
e harm
than good.

I could be convinced this should be tagged for stable@, though honestly it =
might
be better to omit the automatic backport trigger and just rely on someone t=
o
"manually" provide equivalent patches.
