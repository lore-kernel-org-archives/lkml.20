Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793836767;
	b=Uy2TCVZdT4g4fQtn1kmDrA+a1+YJV3Ml+SAKiZNaLcmXoERXWGvHr3qothA/rPBQUkMm
	 XopyCPY6ZN3a6VMtAA/9R2miLzOQnFfwklNG45HT7rALHZrOTjwW1xx9XdM4AfCbMtGW/
	 8o9qLu+3IQL6MwEAROMq+AWUUSuWi5yv6pnJ56le21wXjK8Nxd1Him25DoSLPwRCev2xJ
	 YYT82k2xtpnVPeeJgFhZzBJh/6Qi9y4vgxSOWBSAWPs6MQfBALOlCtXv14Qn2vYb8DBKf
	 2srg0xG43qkpUwuSjm2S/cftdgPcCzkxK70opV0cWIIMrOV8rLpqPmhfWrxcvZeg9PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dkiq8G97zH+ba7bC4JuE4QsITtbGVvYbvH0HqLcYoWQ=;
	b=gJauhGhRzNEysXLqdAjU+c7ktSrPKPX4tmeqarlTBDjFAHAP99+Xotv0PPIFo0Sts88T
	 XTGn9PaTkUyJiIqTbA51VUEq8b8dapz7dnDLOyJcLjnW+uOHPnZyYFbLi9zhyjCUanfTu
	 E5HX3ewi+Lq4WzlLxtCGUHTa3Syany8/dQKktVk1SZ4NUNSZq6zEGTLEKbVT8bAfGMaG9
	 mHoHprWzXo7RosX6K45PUdjw+cd0nUXMvzNMAVHbMDDclOL9uEPHi1ut3KatAS0Hs+aSt
	 uMHF/NTF8PAbTeJMuDosGPrHplrr6U5CitFc7xVZITYymigLpotrg7xncjjyjty0NpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vc9LIe1U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFD606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEEFD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vc9LIe1U
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso5058a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793836765; cv=none;
        d=google.com; s=arc-20260327;
        b=NvtQyIDWnRcl1tCmM1PCC4mwaPk4g2dhttp38GJ8qRB72BdAqKRxwPZlyq+CQQHmMQ
         EKNn029xzgsu3lTLkaYzAfdijjAZbbcM/AUqjUeSIAg1nyAHrNkU4aYOfT60YC7AA8Xa
         Dzg+0ESeQQ885bt5Q7ZvxvrcUQMKHXiq7j8Ww90EQKmI6kbzAYXdKuzu7ROY0ti1AWxC
         cD0HNp8Y79YsTm4hnXMFT3kUPQDt1h+yrORH+tfqo39H8UNjxsj/q9YA+x2Mf5yIvAWf
         5MX665sJIR3EZSZ9nvq0NsscLFrmmgWaHFYW6zrjC9PPWrsbLLUm9Ve+Un1hxJSh17x6
         ss0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dkiq8G97zH+ba7bC4JuE4QsITtbGVvYbvH0HqLcYoWQ=;
        fh=zJiPamB/sBWHdvkrOm0t6MfFbBoXLmlJTADumiuH5Ms=;
        b=EjdXcu03m5x++9kPOGgyWRB5ZaGt4UvDZqR2mAGY7RpF30dlm9tfugd+eDvB6AMIaZ
         MNGrKFS17Gh6Bme4UsHiBo7L2dIHI4zUVxlpAr/DieDbNj4cR6ArrZ78Tpord5/Dxud/
         7kG60eIXZr9OCkUTYtZQN33947C+y1X4mleDalWbW+V3ss4PISkK50QMXuui2LyydGvC
         TcRDzbMDkBATgG8Jpiobnq84kdgpLBl+uHKGGnpOneB7uKlKKk+J9EqlCt2Qrwmwhala
         +dlMh9UHwD/5TaDFGoIxfA7vjj5CXPXfVqINZg5LMt/1m4lpXSVEtEMzDwB1RNnIA/eM
         GTWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793836765; x=1794441565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dkiq8G97zH+ba7bC4JuE4QsITtbGVvYbvH0HqLcYoWQ=;
        b=Vc9LIe1UafFwZGai+igL6zs/Uc1hhnfx4DdJRxwvpr+7zSjSTZKN1ETxXX8zGMpdnN
         q5w4J1gdbeRebvVAKTHV1XJ/mljgTwBZ26MEVrWaGU4MMl06uzqTt8jN7d/RJR3KB3ZP
         FPNqjWU9A3ORayG155iRJlNh1r3+/Qggc03cHKppDCDHulNi0aosghQ0oCIDY8btbeY0
         PFlorf5a4pYeuFL393kwZNK+irgZm5BqUJ+3YtxCyo1OM4kxaXaOEweJS6CJiZAMM6OO
         YYNrzPf2HVDHqDhDSZTrHaYOSYnNBeENCBZ74dmXTZxIFWJi0FyMnHV6uTDdwSTeBSiF
         /wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836765; x=1794441565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkiq8G97zH+ba7bC4JuE4QsITtbGVvYbvH0HqLcYoWQ=;
        b=K4FbXiB2HYSNtIWeb/KtzBBpywiiRTyK9JmiEUlA9xhFiA4o+QQvc8tXTgdOzo/xU7
         rj8WDdoBrYqz0Xlob3WnruN6n4kAj+ReFRJT0H8qrlwfakfVrkfW6qRuGsFbl/fZdEiQ
         ysTCzgrlseFpZ/ysTTweQIIDeTRTlI42Oy42Fw45WBahUdYW9MgSfV3+hUjFXp4bJJAI
         1BRpz5iMr8Xi4tzSW8SV9o1cgmA9eo4XbcZU1FbRTphHwsbxakI54nfKUCLGW1kvSVCy
         jxVedrCoirUe1twdH9iNy5ShawCZoNt96OWdj0L8jHaR9JHHMqqajxCBU/qI7HGE3ajj
         ZdOg==
X-Forwarded-Encrypted: i=1; AKwUvByv1R3Ly9pvzXoL6xfpm0vb7KqwR6YJUcKrPtf5OH1Ws4DFeDsRCzcXFaEipSF6Opum7HzaOWkXMV5Uzx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yq37IP0cPm3MQ1N4lT+cEyS2+glaVYKbw+zNx87SyvlTCEs3U
	1TH9zsP3mZW5yPIHNoYDbE3NS56aUe2kl2AkvzSnayA3YE6mvs4DBgVNeOZDzPs78B7YvsrAYN5
	OnDLtolbyEbUIfwqqMmlOjgMPPIRvki7EUN7ISACr
X-Gm-Gg: AYBFou2368nydKrKyUJVKcpy/T1uzA6xQzmb3tkbtxegWvhFyZVs571xLo5Mj5okrDR
	JIBiqntCEJ+yf1ZBe/JgvMB1udYV3TyLO9j9umzkda67p08ECABnJvH2IleJIcNxFFu3gnFNfx3
	ciEDkBLtXaZkv8M0bfghun6kToRYu/fE1tjGgqIVKe1LUNqnvannBrYNbZe7XKiqQyV+itPEklx
	ZgnFUekmhjQ/44isUaoUcmjCQGeTBMxXOQJvWeF+4dTJtEdTKQLuFx08qamupHYOJ+PCYZQmEmP
	PO17O0wS5Ou9YSo21X8aqM9HmSIcmt9FEObMEBHlfqsyQSe6kcKsSeCU1LFtKCwSEloRmJOkMc0
	HkDTyIUje0Sz/XQFYa7B1gYl99fUwsh3WnUtP
X-Received: by 2002:aa7:c952:0:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b57cdc6385mr16040a12.9.1793836764713; Wed, 04 Nov 2026
 15:59:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020234535.3182385-1-jmattson@google.com> <20261020234535.3182385-3-jmattson@google.com>
 <auuZcZhBhrkZd9qM@google.com> <CALMp9eTpWP6XSYPJQjBwPsNWmPzLNh+EDGivMFZsUnixqpGkVA@mail.gmail.com>
In-Reply-To: <CALMp9eTpWP6XSYPJQjBwPsNWmPzLNh+EDGivMFZsUnixqpGkVA@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 4 Nov 2026 15:59:11 -0800
X-Gm-Features: AclHuK8_LY-OTUKdxgAEiTiBoWtOGamSflwZcfkOr9pBxGweoCUz57HuFcean9w
Message-ID: <CALMp9eRU6G-spTgzkKdh6E=U7omQsFDM_2nH4KEPZieg1e-zgQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: VMX: Refresh LBR MSR intercepts on full MSR
 intercept recalc
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Like Xu <likexu@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:49=E2=80=AFPM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Wed, Nov 4, 2026 at 12:45=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Tue, Oct 20, 2026, Jim Mattson wrote:
> > > Re-apply the LBR MSR intercepts in vmx_recalc_msr_intercepts() if the
> > > LBRs are currently passed through, so that changes to userspace MSR
> > > filters are reflected in the MSR bitmap.  Unlike SVM, which can simpl=
y
> > > rewrite the intercepts in either direction, leave the bitmap alone if
> > > the LBRs aren't passed through, as a filter can only force intercepti=
on,
> > > never prevent it, i.e. the bitmap is already correct.  Note, clearing
> > > msr_passthrough to force vmx_passthrough_lbr_msrs() to re-apply the
> > > intercepts on the next VM-Enter isn't an option, as doing so would
> > > leave stale passthrough bits behind if the guest LBR event is no long=
er
> > > active.
> > >
> > > vmx_recalc_msr_intercepts() is invoked in response to
> > > KVM_REQ_RECALC_INTERCEPTS, which is raised on MSR filter updates, but=
 it
> > > skips the LBR MSRs, and vmx_enable_lbr_msrs_passthrough() does nothin=
g
> > > if lbr_desc->msr_passthrough is already set.  If the LBR MSRs are pas=
sed
> > > through when userspace installs a filter that denies them, they remai=
n
> > > passed through, and the guest can access them without exiting to
> > > userspace.  Conversely, if a filter forced interception when the gues=
t
> > > LBR event became active, relaxing the filter leaves the MSRs needless=
ly
> > > intercepted.  Either way, the bitmap remains stale until the guest LB=
R
> > > event is torn down and recreated.
> > >
> > > Only x2APIC MSRs are exempt from userspace filtering (see
> > > kvm_msr_allowed() and the KVM_X86_SET_MSR_FILTER documentation), and =
the
> > > filter is honored when LBR passthrough is first enabled, so KVM's
> > > behavior shouldn't depend on whether the filter is set before or afte=
r
> > > the guest enables LBRs.  Drop the LBR MSRs from the comment claiming
> > > that they can't be filtered by userspace, and clarify that
> > > lbr_desc.msr_passthrough tracks KVM's desired interception, which may
> > > not match the MSR bitmap when userspace filters are in play.
> > >
> > > Fixes: 9254beaafd12 ("KVM: vmx/pmu: Reduce the overhead of LBR pass-t=
hrough or cancellation")
> > > Cc: stable@vger.kernel.org
> >
> > Meh, this isn't stable material.  Unlike SVM, where LBR virtualization =
is tied
> > to a pile of other crud, if userspace wants to filter LBRs on Intel it =
should
> > just not expose LBRs in the first place.
>
> The functionality is not equivalent. For whatever reason, MSR
> filtering can be modified dynamically.

Oh, and, duh, MSR filtering doesn't disallow the LBRs; it just
reflects them to userspace.
