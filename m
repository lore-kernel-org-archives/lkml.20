Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039927;
	b=3S+qDSBqK3waOmTFFhJC9lCY5tLL3+Lwl6yn2oiB3O76VlmA6/+qySeUkN0dErMkxVbU
	 fEgBuTEyYk6t586linGykmPsoefEEOUBMkPuXkm1CMYNt5xmQwM2Vfn8vThr9PzGrqqOK
	 mkCen/wgi3vOVQCOdKe0YNPZhLPzRo6FoIrht5N+flFZzeb51DTGJiIuBIPR40xWUHXgw
	 twE0pW9L3XTuVa8CfHBNnux+3i87RuGo9PxkKITVbBw2Ffyb85lFtp1Y3uAeEy8uTruzI
	 vHaPWRO4LZsvK/3fQk9RCX0UBYLs7TsjEoU1xps6NoXU2Ls0AGviO24MOBm6LYmW3ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039927;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DIo0VfjwZn3AOCG0zh4j2BunB4Fnna+uUykWKTKe0fQ=;
	b=DLCYTL731+REN1GkW4Q8UYXn3eTrSKLl8zhEb+F3eJwMDE1sXIzbIOz8qGrpZectetAl
	 zN1U2z2jQ9OZG4AsKrc6IwED8njurrJear38aLUaKhOBjnO1URIt+UBg+mll0qfXF0G5f
	 d3fQlHZNNJtF8ABftSKpOvc3V7RR/gp6dcJCF+N4gw0jKQHUT1iO0xlP/exVVQLkzvjj2
	 GmYnzLB0Ob94w7l6aBj/30VcewA5D/1D0GwlvEnmDn5BDqUT0/bHYCI4c9xGvN9+8awYh
	 HoRuZyGLbI1tcoYUNA7PrlAp3Rde0/5eYPKceOaUtZ+J+AVtP1++8lnJ2XUPWVnrKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JdAVFcJQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pEPejcmM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0A8606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0A8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JdAVFcJQ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pEPejcmM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793039925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DIo0VfjwZn3AOCG0zh4j2BunB4Fnna+uUykWKTKe0fQ=;
	b=JdAVFcJQF2ZBAciSdFcQkOT9J6m6JJ5eM0i2adn3AOMQlpgdSoPho47x1pSkwtPHUlEhap
	gjl6smvFjnfU3xEGaIqOfpc1RZSX7f4z5CScyjcCOIBEoD65OMU+lbrwf0QFlsZqQG14d3
	0F76i1ozaBBcyB0XmhUta4xRCKK42hQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-za6xXsxkMVeDplxOylRCpQ-1; Mon, 26 Oct 2026 14:38:38 -0400
X-MC-Unique: za6xXsxkMVeDplxOylRCpQ-1
X-Mimecast-MFC-AGG-ID: za6xXsxkMVeDplxOylRCpQ_1793039917
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c4445512dso2892332f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793039917; x=1793644717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIo0VfjwZn3AOCG0zh4j2BunB4Fnna+uUykWKTKe0fQ=;
        b=pEPejcmMAzYpBQAMPa9aCPQcnPmng5cqgox1cUHYQxasK+jSOlmwLUChtXsFp9N8ad
         b2gHOQgLYEDwNV6l4EKm+vKGxhOtDB+jwVQQy3rbq5oimMruH/Fj3qpu0HnpBbywR2ze
         eQDFysTa7yPARXYBJ6ZiF+sCIpQu3HCroKObqJTv+uWhoYLE8CJf6JUb5D6HiH87hamJ
         sWKTBGdJVSimVEXsFcRgPSCgncBZL5ilfyD+YsC9ivMn6r7mRdfuIKhM8uXpjc1jFuIj
         XWusVS41Suhaw1H8sg7mraGTP4AAInqvoalqETkQoliwrYrSmH8lD+h/BJiA3VtN/gZ6
         VHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039917; x=1793644717;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIo0VfjwZn3AOCG0zh4j2BunB4Fnna+uUykWKTKe0fQ=;
        b=wEy2kSNnWsux/c7gYvahGC1FrY4Vdt07VghdOnQYfnO9vqIYj0pPX79tfroGHpj87V
         CWHhCJ6isq+soQZzoqyxkaW1uekT9sWExuTEJKBAs/8bBcWIrGuJDiK74Eod/Gp4ADIa
         qRGRAamVNThZ/PciAY00b5fxaM+B+2lMe6PZVYMF24iH8RJUbMeQ5+KcaNyZy+wAhEO1
         3dvVEXrmndNRkeIhP6+UpbI6Wdp/0iG6QejAbEbJ3Hc7GHkzBPMP8DBiJsOLqXVvFgMo
         t65i7OG/sMbYOKmiqz7YA7JO/HhEpwar0hNpSXeSZC+NUjxQiDQm0bOmsSDIbNVXrPpq
         FzXg==
X-Forwarded-Encrypted: i=1; AKwUvBzNXT8WMQyiX330mr8LlHfAaQOI3is7joBI7W8Uv4OOVZ1Uf558DgukXMdNK5MLfqDqCdFc5IHEKOSYRbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT1D9IuZ9P40n9wBmBOBRdBQxC1R5R6I1UbSkGOH2PlR4tR8CC
	jLxoHMj15642OehmmnRGh92TwY83TL7taomQienp80rhXpQpyCM7VstPyV4fEl7ieBJ4OA0adO5
	nDiRfsk9P1UuwER6U9pqGwUu1ao2jLr21wJZZ/5MV7OqfnQb73+W1/0QydIUQU/Km8g==
X-Gm-Gg: AYBFou2JkdTbXD4tG59OKjuCzrF1I0IuUYAONARkbpgAnkYEbkPwfmw33U9PXD6JoQb
	vIfSQSQX5ongNY79ZlluPug2D+lCEmbNkE3MV1d0d3d04LSFfULM83ufaKSPMqPN+mQ6CI9/kra
	6vemwNdB25EpnHf5ODxmC/UBndCmQv7KbfYWtGUvFOIAs5pm//HQeDrhQeWPyshXpGBfY9vvNQI
	pgcoyv4hnX/tEw3LC0zFJ0ln/aI8ZHgog3tQSVJHIFEClupTJjIn8z8iCn05SPivyhILBrTPwvk
	w5t/1nNa2osQg6IyA8uoaQNRpiIrC9lqc3fOU/InPUpe9cqnT8Dhsvl6LPkXjTJpxnOhHlP4tpn
	0xylcpM3qUuBppFMCVENlRF1k1XBWQIOMJl6d
X-Received: by 2002:adf:fe8b:0:b0:489:bc38:9438 with SMTP id ffacd0b85a97d-48e3eb6f908mr11308915f8f.29.1793039917064;
        Mon, 26 Oct 2026 11:38:37 -0700 (PDT)
X-Received: by 2002:adf:fe8b:0:b0:489:bc38:9438 with SMTP id ffacd0b85a97d-48e3eb6f908mr11308891f8f.29.1793039916659;
        Mon, 26 Oct 2026 11:38:36 -0700 (PDT)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb ([193.32.29.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm17981151f8f.54.2026.10.26.11.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:38:36 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Subject: Re: [PATCH 0/2] KVM: x86: Convert all runtime WARNs to ONCE
In-Reply-To: <CAO9r8zPAvi0vCENtj+7+gVrojB2nOHEoYfyhgdgxpmiUA2kWgQ@mail.gmail.com>
References: <20261022215541.631694-1-seanjc@google.com>
 <CAO9r8zPFEwUVYSTePWN-FurHLzGN6cY8bd-BOj3sjRmjj4xQbA@mail.gmail.com>
 <at-Pfgjt__PJl55M@google.com>
 <CAO9r8zPAvi0vCENtj+7+gVrojB2nOHEoYfyhgdgxpmiUA2kWgQ@mail.gmail.com>
Date: Mon, 26 Oct 2026 19:38:35 +0100
Message-ID: <kupecdcwbmc.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yosry Ahmed <yosry@kernel.org> writes:

> On Mon, Oct 26, 2026 at 10:36=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
>>
>> On Fri, Oct 23, 2026, Yosry Ahmed wrote:
>> > On Thu, Oct 22, 2026 at 2:55=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
>> > >
>> > > Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs that=
 aren't
>> > > strictly scoped to module init/exit, or similar, to ONCE() variants =
for what
>> > > should be fairly obvious reasons at this point.
>> >
>> > Do you wanna CC stable?
>>
>> Not really?  Maybe?  I worry that this will generate an absurd number of=
 conflicts
>> and also have "misses" in older kernels, to the point where it oculd do =
more harm
>> than good.
>>
>> I could be convinced this should be tagged for stable@, though honestly =
it might
>> be better to omit the automatic backport trigger and just rely on someon=
e to
>> "manually" provide equivalent patches.
>
> I can just see this ultimately preventing a DoS and if it lands on any
> stable kernel it should be a win, but yeah probably manual backports
> are needed :/

With my backporter's hat on, it would help significantly if we split the
patch per-area (hyperv, [l]apic, posted_intr, vmx, svm,...). It would
also help those who want to analyze whether the particular WARN_ON() is
actually guest triggerable and open the corresponding CVEs.

--=20
Vitaly

