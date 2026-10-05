Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B7D4C33D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213812; cv=pass; b=KWGVUXcRqyd+lfcxScUQWIbS5Adz+3/8lq7tOB117Io43WmB3zMSDQ6TO30olH5aHNeSTgI70yUHZVYOZ0R5SOjr+Kqy6Y11FxXz0zxSgL9WKjenuiOmD/Pg9LlCwrt0cmzPk5wTXxTmu9N8othGoqShTws67q1Mjxp/eKkYO8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213812; c=relaxed/simple;
	bh=3BMrnTWZwyr6lX8M+0judiPrKn45ns0kyGkanT5/PWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdinpWZhGshMrHL8P2t3zojcM5z1nNZSKoy63U0KAnYr8nn23YnFR4wTpt7CThDIepZI2sHYzidXRr78ymiD9dkfjkiY9gAN3g8WGM9sBRWrPuW/oMkEv1YdyFQ/EkYWMW2bQLTGehLJ90Uw46qJdIyHwCi4OiQlh9Es0WHthKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=kEcvYCs+; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="kEcvYCs+"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-822f7e70796so1838706a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791213810; cv=none;
        d=google.com; s=arc-20260327;
        b=ra/pBoLown4ujxrgLR79RzAOGDzhvzVZBPxk4aekNGi9ayuvW/KF4TigLM1vh+qo6u
         Ya5COfeKIJTIsn0ziIFHWOCWrxm8GKb0cdRbldHZFnQqy/7XOq958wnJUzBwJ8unSJkv
         37JYCMhbLWljqA59BnYrwBsm1hLJQLefmdYig0PNW6kEUdSNZiQtnzPsQnxRV9GsI86C
         7HtMZ9I7C27J4OL6YHCjwYsx+KWWkt6EwyMz4CxeB5wyxh97Yx9r6RtZQA32Gg6E+0qs
         2xN5gmEiqUCMwTp+jH3CocNcQOjI98cqRYpDMThTVgDJxZnCgbQCcdJ5NMDGDidsdsci
         r6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MlekscLQcc45qbwdnWHjJzOVHRL8WZqGEQw9YVgtc0=;
        fh=Wvo3lUjrulLwiqtkwOyqp3El9r42M6lYZXSVY+5dAi8=;
        b=b5u7dQSOepEqR1HEH+KoEhIx1+bDnquS08Ixd3p4Ng/ckg3HIKJLAdXr+2VZpJKfUP
         HsMv9gIisG/CH9ykruzMH6pNbFV9JkwDqMYkssNzdqTKxsdWPHrdDFhebk6Ha0kjFOJh
         owzR8DRAD9O79jM66u+CeD1vik/WnvsMEyDJEMeNKnMFXArYlNjlAs5uPoomVbMBXdAs
         Znwcxu2IhhVcGuMjrGmv9nbHvzsNYKB7scYohcuWntYeJs3iT9lE7tYz2A5NOSvWpwbf
         kcDcYrms3I1P9YRv76DrSXE231Y488u60NFaSzmepAC7OSBrKAdARKYEpih8pBaQoOJS
         0iIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791213810; x=1791818610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MlekscLQcc45qbwdnWHjJzOVHRL8WZqGEQw9YVgtc0=;
        b=kEcvYCs+yoMQ0MIrKv6Pd7uDS5T1NRSIlF7cZCieAzfe8feWF2E7+3KNrpwsBHe0KM
         BmHhsQtKBkWP81YrCed9Pg+fxUrQJwLFNFUem6XPTdqeF+Rvmlv+ZkleepsPT5HR8bJj
         UYSzfi2qZeUVvFrLrxBGfZ4xgnAvva1OU0kGuCgT5y5gh1ub8YueEBdiwmMUqcRykYmc
         G2tDkHmYSTEFgVLbR4UCTsHv5VpVpPYps13Nu7IXWwPhJAR/MUHhlobg7dK39UzYXrCD
         Wu906NwoSV1oVBUC64PW8pFJwp3uhg8Y4KHU3tilqjzLkwb8PMdiM/NINaPQxpou6bXq
         f0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213810; x=1791818610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MlekscLQcc45qbwdnWHjJzOVHRL8WZqGEQw9YVgtc0=;
        b=wh2jFBejXHOBhrvv7dGL+BPYgWwEpq/3TFJ/9HDk6zVRjI4a4nJlABiK4Yz5sxHSky
         BD2cobjHBjMi/yOt6oTFfixKb2Vs73u+MCJklTTJJOaqEVNb+Gx4IYJaDdWfb/qNjTnt
         36fEu7yayYpdFe1qjkb0ny2ZhbJWq0IEA5vU+jDL5I8LXnGCWNVTEZNfK26WR5bwpJtt
         o4+vQEWp5IV4tyzNCAuCTGReSp+IjpJa1eNVH1HYHGGawOSKexmk3JcfU8esnrGp3ovo
         B92BzSIsqwC1BpxSepGU0VOIcvdGAT8MaPnJ7KWFMM4bb5cCAYP1Y2qCkKgLSv7rXtsb
         xEmA==
X-Forwarded-Encrypted: i=1; AKwUvBzklC1bImyOMdlSgT94xjgmw86zuSDjIo4TNex56YxpwgaPieDkNHneNHn3hU6F32eVtKjO/hnAiMhFl20=@vger.kernel.org
X-Gm-Message-State: AFuF++mUAVZQcG67GRL+NWrcS56sq10xkusis1Jxrm36Gs2jo43CfFX9
	Rl0rYU0lBcFxbaQPsw5KDrSdiEQx4w1GHtDhwf9lcyMCRKF+7T/Ex482+qIr7Ze6jQgVy1kPUUK
	LjZskY/PZdmGzBPjkX2vB3dzIA6ZRxBiIesz9ksSVLw==
X-Gm-Gg: AYBFou2NTPAlTqxVNS37M2ttPOh8hR+BI4Kug7E95vhJHfABOUdPN0Yf9yFYpnEzChP
	ZywoBiE6yLcyAy7YIY2krpXkTVF3h+0U64n5r0Q/ZgQKKQQ58mAkDUMV1t+0WS4gpJfbsE5CQTS
	4Hcx1p7qaeIIfNruitDMO2qbTWgyicrUlhEZJuatL6AoIKo55Yry+RhiOYC7cg9d45AQDnWbxq5
	DgFvaOgYogUSmyS3PwUv3P4HSP3sPSicnZwxqkXa0rV6/R0iPdrLuGQgCzBC/Ih+aM0bBvotP+b
	9DxK9GlWnoCkO3h67q/EU9BUSqiYoXyZKOquxQ4WdqxP3dV6mlvFNvVuek9TDT99X0mgdjBsGUg
	6JmOQ+bY=
X-Received: by 2002:a4a:ee14:0:b0:6d7:69c6:5292 with SMTP id
 006d021491bc7-6df34291b3cmr7901748eaf.45.1791213809230; Mon, 05 Oct 2026
 08:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002151942.491680-1-bruno.produit@trailofbits.com> <ar_PNEIvsQMQPMLg@google.com>
In-Reply-To: <ar_PNEIvsQMQPMLg@google.com>
From: Bruno Produit <bruno.produit@trailofbits.com>
Date: Mon, 5 Oct 2026 17:23:17 +0200
X-Gm-Features: AclHuK9_-Y1kA3kFfm3uCM4nQvVKm2VIHGmvvm5x70Ipyd8j9bTevti15kTGlWY
Message-ID: <CAN3w+PPqe9C8TcU4CHjwEE3tUG8k8MXXAHRQagb8iR4ehWbLLw@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Cancel PIT timer on failed creation
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, 
	Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org, 
	Dominik Czarnota <dominik.czarnota@trailofbits.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, agreed, thanks for pointing that out. I=E2=80=99ll send a new patch wi=
th
that change

On Fri, Oct 2, 2026 at 5:35=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Oct 02, 2026, Bruno Produit wrote:
> > From: Kyle Zeng <kylebot@openai.com>
> >
> > Cancel the PIT hrtimer if PIT creation fails after registering the PIO
> > device. This matches normal teardown and ensures the timer no longer
> > uses the PIT before its memory is freed.
> >
> > KVM registers the PIT's PIO device before registering the optional dumm=
y
> > speaker device.  If speaker registration fails, a vCPU can have already
> > programmed channel 0 and armed pit_state.timer through the published PI=
T
> > device. When I/O bus registration became fallible, its cleanup did not
> > cancel the timer before freeing the PIT.
> >
> > Fixes: 090b7aff2712 ("KVM: make io_bus interface more robust")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5.6-sol
> > Signed-off-by: Kyle Zeng <kylebot@openai.com>
> > Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
> > ---
> >  arch/x86/kvm/i8254.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
> > index 1982b0077..b7875345f 100644
> > --- a/arch/x86/kvm/i8254.c
> > +++ b/arch/x86/kvm/i8254.c
> > @@ -793,6 +793,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32=
 flags)
> >  fail_register_pit:
> >       mutex_unlock(&kvm->slots_lock);
> >       kvm_pit_set_reinject(pit, false);
> > +     hrtimer_cancel(&pit->pit_state.timer);
>
> Given that the timer can be armed if and only if the PIT was successfully=
 registered,
> wouldn't this suffice?
>
> diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
> index 1982b0077ddd..33d772c7160b 100644
> --- a/arch/x86/kvm/i8254.c
> +++ b/arch/x86/kvm/i8254.c
> @@ -790,6 +790,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 f=
lags)
>
>  fail_register_speaker:
>         kvm_io_bus_unregister_dev(kvm, KVM_PIO_BUS, &pit->dev);
> +       hrtimer_cancel(&pit->pit_state.timer);
>  fail_register_pit:
>         mutex_unlock(&kvm->slots_lock);
>         kvm_pit_set_reinject(pit, false);
>
>
> >       kthread_destroy_worker(pit->worker);
> >  fail_kthread:
> >       kfree(pit);
> > --
> > 2.53.0
> >
