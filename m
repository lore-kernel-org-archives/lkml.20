Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924389;
	b=PzNZS95oHig7NRLrk8KFy3nm+1XIVWEDfGSd8M+4KSWh39EA7VC/rXVpbwNJLHLKLlpb
	 xlWLSVNL8dusWBYZ19FNRd4LT9pmEzKmNw2nEuhE089AiUKqvlfJGENjssALH8VLpxgFi
	 PO87o514MBvEprEclymr/FZxAbVhptvwA8U8XH3p3QmBWBYNSuc5vMgwp68VPMbDGfDxP
	 gLTAZZsFqUmpYLw0yrbsy4MX3EnHBbq3oZx/orcUzmjPlVcWNIocIW6Vu9IFvDnkgRu1G
	 YO2SKmXcBt76xW8cGiFylw+L1g8eOxGhL5DIcZAqT2gHD6u5LAHUZ2dDbk3EhfoyAuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hoJUQ8GjqLVbnxmC3dWK5K1hjFBXYini5ZOHDxXk4FA=;
	b=r9ofdMsub4MNdA2WUMZuOa0Y3VYqon384YqIwIYRpnEemx34MW6AuPEcN8KY99PU7Pne
	 p1otyasmnR8GeWA2j+fIuUAU21Lqf9OonzttJT4+whmm3JIuyGVU1sC2CiVsc1vzvQyyg
	 zxCYx1hVNGrVaVGqgxFnnzNoNvck40XKXmpnc9qzQIfNfWkujUIUGERQi3KDFaYv5XPYi
	 FZHi29cSOwzSMJlWwKYBbNlJcCKXq/hgqBmzi1i9wKGeVoikb8a+DL4TFxEAyCADyiS9c
	 fcyYjAMCfBWhAJ1jycQJ+Z0PGd/J+kVckEEbh7Tg2HIhN5vrU+xZ3eBms+Chte5zPTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fvf7lQbN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC37606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC37606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fvf7lQbN
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so152a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924387; cv=none;
        d=google.com; s=arc-20260327;
        b=UAwAhLFFsdJAlYEMyceHNPNvrNYocAuMqNgAcJZOn/A7ki0k4tSYOmzLpxHE1IP/kV
         F0lEZYIiivHBoU/mllF7dKVzR87RQxyPX2IFf5k8OjJ5oL4cwOFfTHUs0GxM7YXOQPYm
         WyC6Sj8qWVJIpeBpauaBeHQhuluSu2pamkgoUelxMuoU9XeyAeOdIaB5HtyrWZ/0Bvok
         lOaLrhifY6xd1JaKrrjv0qvB6VoIg/u6NeNy8tnutwGDdhTErZIVRf29kU19MJCAuvES
         5SuteBjI9MxyzvQfntOiO1w+HcqQECeSzFGqSKsOalF6gqWaLGWnydzs6oysG8fboEPb
         wMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoJUQ8GjqLVbnxmC3dWK5K1hjFBXYini5ZOHDxXk4FA=;
        fh=w1E5Ky1l1wI0FPmHZQZMOIPEOjFJB4rybs35EuwE07E=;
        b=Y3S6zaA4xdORb6OLMOQ6PT6y2ZQmjqoiwY0dtDb9NY1Grp58wPkWnI8ASip1MA6rEA
         aQAuin5J6Zpi7AnttElCBIAruRx2U7gVqe5il3BY9k3ox+JY8HiiVy6sKFfxbFETr4jH
         hOGhIev4aaf5eZ3HoqywWdIA/6YTEVc5v4FxEY48dnkZkQsYEqYhOHXXhW5PHKnzV52G
         1gtAvSQyVk4pD9I9sm9VnYwCiaWHjTBgAdHHxxw7qFEh6AB+HA5tRRVpCV30gaMwDoFg
         jn4qF5j5JEmQfZzDDLd/xupBJPtMIJ9KmnN7Bywslb8Zqhf6Vrh0VNXLOJ7Ru7vGuzmL
         dZyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924387; x=1794529187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoJUQ8GjqLVbnxmC3dWK5K1hjFBXYini5ZOHDxXk4FA=;
        b=fvf7lQbNGae5TuiF5ApfciBrEay/Zui4CmeuAAApvDRICkwr5uhcpSu4TWHMqb5hkl
         BxZ5121RpoHWTNuY71Fxtm9k8ab/PtbOzlt5i0cLSwFijHWCRIk9m1S11V1I0yDpEBIr
         VbTGjoWPRqXcoWZ84Xy3pyn8SQAHDNdrajAw2ehErCV05uuLmxD7LmLxrZ8PlvFQSNPn
         SOUDEYNxDwlQgYIBjRXbWmVSwHyFvbOysnuwKYA+0Qb0Y91qqhdAEwxmVkHNSlF1v8qe
         znPNKdwagMIbn1gZLAsnL36FLDd6LOlRRv0bjYbjWnDcy3CAAeYGiZFWkmu6L8cXSlKx
         S9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924387; x=1794529187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoJUQ8GjqLVbnxmC3dWK5K1hjFBXYini5ZOHDxXk4FA=;
        b=tyznRNfu4SiYE698YxyJHo1WPS2/QB4bxb0leGsXkQK1uGRv3/bzwrM4ZyKkQKEGj7
         JZ0BW4NLVXIVv/rq5bPEDdiR7pPytDiQVK/oBF7OC4rEobYlh/iF4VdGqSswkzyfiYHI
         wCuuuEna39s8i9BWf7c8Z0gVljJdrfDNz4FrceExsUC5WH1HfxALeUGkKwcsDNthU0lL
         2T15rH9e1//pbC0StcvK99yivpnzq+9TArhwcGI+vIquDuYqrM8gCn94PDmKsW98iscc
         ADYVI7WyUulUipBnPF/mC61ygTgPQWEIHsjGf5ELIkzWt2bbOrKfshE1QMILxpj4wz+y
         PwBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdmF6gWnbU0EwXNd1NocagJsHRBRFlwuna3Azq6YNYCyQaP68kw6Iyi3+BBXRKSbRTuB3/JWXpHgtz/Zc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lh5E2S7TPnOacxAvWzbhMBmC/1ZliEm0MyzOrdqQxgeGTNlsF
	FLgi3thNYdDHiQhb/8fJh/3Qg/Ig645mp+Tq4oAYDXMmJjGTvBZBRm7dmzG860WGU5kT4gUjvqw
	HJErR05US23sIQwI3Md8eb6lRHb+8iUkDtORdGSU3
X-Gm-Gg: AYBFou1P6qpph9Wj8t6C2M6d9fTnJhKtoygh1pi/DZuAusJblYGYXJc3XrgL3KiMTEu
	+CSoR+X+Rmfqr+2Jav7/yHQbaM+9jiyYtRZzMY20vJ1Kr46eaUL8zl1HzroeTVBCzBZVrNr3T1A
	M7/UyjKi6x8MyaSlKqMRG84GYOGqXEyKu+8DmsVUVS3Gqb+TkIQkVFYWNIosISmJx7EO9poOY9G
	SEjaaWku1Y9+5ow6ligV5YwY6OGBCh4VYTIzFn+k2N+wdzLGDNXJU69yBtYWfuRl36auyfPyRy4
	X0AaTZCNyFNf9VC107wUemjpmAMHI1B0bzCVMegQ3WgOU+JYKx/QxjmEir+JC0wcXu5q3uCgQxb
	Zq1NQRzYU1TqpdgT5X8AGD+GmWPiUNwP+7vTG67j4Y3YuNXqUrrGL8iRaRC1MYNsXTjjBbqJuNE
	ABt+XW41uYh2wZQpHi7ueEI1gC
X-Received: by 2002:aa7:d29a:0:b0:6b3:b648:314d with SMTP id
 4fb4d7f45d1cf-6b597a39693mr35639a12.6.1793924386913; Thu, 05 Nov 2026
 16:19:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-6-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-6-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 16:19:19 -0800
X-Gm-Features: AclHuK_-B7OPovU5fqCuQASHd-0_rKGNFA7sFqiBsSRfFtZx4xW3q4qeIS-CpIE
Message-ID: <CALMp9eSKm042gwYLCT1yxNPViMZcff2c=qR_wc5WKpAYKSpfHg@mail.gmail.com>
Subject: Re: [PATCH v8 05/20] KVM: VMX: Refactor instruction information decoding
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com, 
	kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:44=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> KVM currently decodes the VMX instruction information field using a mix
> of open-coded bit manipulations and ad hoc helpers. Convert all decoding
> to use helpers to centralize the decoding logic for the transition to a
> wider instruction information.
>
> No functional change intended.
>
> Tested-by: kernel test robot <oliver.sang@intel.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
