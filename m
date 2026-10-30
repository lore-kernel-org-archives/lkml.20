Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386447;
	b=jn+mBhxV6kKhHAZYsS8kSBBDD7Vzeg69DShTpj53UKp3mBAIFIEPZ0OmQpSfqinko9aH
	 NzhWamYXkhxlyooQJOkE5WFkQeJTvVSAW5113e2K/En7hCxiGLdu/Khf8a0vMoAlLjDpl
	 wrVlRPeph+pjJQHKbwelmFC7pdK1VKMHLyRkCtSiXUPgnFA8M0jmizg0vRCYL6LLftMN0
	 a/4qbj6kNzq+sXfEZbS+c81c4NYW98V9STseiGX2m88RYi0IXpkaPE/J4fmph1+g/Wd/a
	 8+y6fQQm5IeNfiOUR7NHmy7ZE5e9D84Tp/49pUYhq1tt03pZnDO2OSQWUfRMHU/Ba5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=u/p+CdNB031652mF8XZuXCF6muaar3ooWIvBYaXGN3c=;
	b=mGIc+DTU/evsGT2qNL254OeEF1ngymrewKBRll3gTRNx9JN91aKDGD7/gio3fcyG8+Rj
	 Pk4xq/u6Da0J3POSQeo0ebsMro2/DJWRa/ZjWX9eXELYOjlOcePZeVRj3eo/l0AmAXTl6
	 XD8XJkTQkXmKnqYudP2WfjspARATXjKRtUe0SlTts2SjXh9+NV4WGAaqBAlYK3vgVj+1h
	 01MmH8TtfOoqQkK9Hd8hggGmkRhUyHJumj09FuJlhVKhEVlc8k7nxNHBNYSO/JSAIWAbU
	 EgWkuay5hLqqnTEW0EOgUmrGPCDGm39A34Jq0wzuMGgf9oMcv7XVc6HTqPuGV8aCWyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="cnRI/wVD";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4FE606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cnRI/wVD
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so984673a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793386446; x=1793991246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/p+CdNB031652mF8XZuXCF6muaar3ooWIvBYaXGN3c=;
        b=cnRI/wVDs05gS9M2Bq0RLbN+ADojbqHvUc87f7ibZ/up8TS9ooi7XFmypERgojXCMB
         Nku8VC3bOY33aAdfXQg9FmqxGQzv9cRZOEp8T9v8+b+mp4K2d9k/ZafQtAHgMtehPdp7
         x4CfRAWSC4w2DnJX7B+Sc3CUffw6l5VNkgRgFTNYdyLik/ssf+eN41sDXASLJnzJ4X2i
         JXMUNH3wQB9L5AByEY+aS/BauKzCUHHFLoo0nk+frQ+t6mUD+9/9E9rmRw4903/1OxkD
         QnYMFACSTVcv1f5Pl/7jzfFQG47zbMgHOsC6fIBNtnqGsRllKCc0iRCfBscN1SMKwkDD
         dOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386446; x=1793991246;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/p+CdNB031652mF8XZuXCF6muaar3ooWIvBYaXGN3c=;
        b=wVcza4kkDpqBLorDeNE6Obb4+o7OYfI9KSfB5YdVDSYa5anc8ypwgm2xPQ74maiCn9
         uZh+kBE7P5cLLlF+GsE7taE4rKG8Bzv+AhX/4n3lTherEcuYWkPqLGzYesrOCX+xmpz1
         N7oyUd5VTLDotn6gG3+DgiTjIllvQRvZoakknLLvVZe84546mNisBZTegUgH2F6N9Ao2
         MrbaPhsI3IrCD5OSG8zrooguywdeUOMu9CiSwt5ohbSn1CBRmAg2Z5tBJO6fonelEml3
         r1MIIxYX/LYV57W8eSs4OwsDC3xfhfBomLqzAXCgPNIA12YHKO7x+x3zlgCdgk0+1TaB
         B3nQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9tUQtRReUkXDkCq8kLa3je7JAhXR0qhGKbpPdlgpQfevs+jG1k0OgfZGKrKrwYeM1ahmW9JrbfxUKWIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA1zy7NYld0Q5VVQ0Y8o1k75/NS7ubG03Nu0SDh82Fa+Zs9hYm
	l5/+VXrGrkySwFnhB/Z/PIo8A6QCsyrVvmHyZRKup7GYrMnrRkBKF23SzJ06kZ/wkGDSeEp3Lok
	cCT68vQ==
X-Received: from pgkp2.prod.google.com ([2002:a63:f442:0:b0:cca:5338:9514])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:44:b0:3ab:ab5a:ef06
 with SMTP id 98e67ed59e1d1-3ae896f832bmr2783583a91.12.1793386446130; Fri, 30
 Oct 2026 11:54:06 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:54:05 -0700
In-Reply-To: <CALMp9eS_XAyfRQ0aa7pGmC2t-=mbHA7rngWD9oqOB2U8AJZMsw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030032937.2813-1-ma.mandourr@gmail.com> <auTnBZMSHWKL4j4b@google.com>
 <CALMp9eS_XAyfRQ0aa7pGmC2t-=mbHA7rngWD9oqOB2U8AJZMsw@mail.gmail.com>
Message-ID: <auTnzSiIihVgs8ha@google.com>
Subject: Re: [PATCH v2 0/2] KVM: nVMX: Don't let L2's LMSW modify CR0 bits
 owned by L1
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Mahmoud Abumandour <ma.mandourr@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026, Jim Mattson wrote:
> On Fri, Oct 30, 2026 at 11:51=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Oct 29, 2026, Mahmoud Abumandour wrote:
> > > When L2's LMSW exits to L0 but not to L1, KVM emulates it with
> > > kvm_lmsw(), which ignores vmcs12's CR0 guest/host mask, so L2 can cha=
nge
> > > CR0 bits that L1 owns.
> > >
> > > v2:
> > >  - Patch 2: order the CR0 store before FNOP and check L2's whole CR0.
> >
> > I'll send a v3, I already spent an absurd amount of time figuring all o=
f this
> > out.  I really hate x86 sometimes.
>=20
> You should redirect that emotion to KVM APIs!

Heh, saying I hate KVM's APIs sometimes would be a lie.  I hate them all th=
e time.
