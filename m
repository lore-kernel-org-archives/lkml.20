Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60B48F837
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810277; cv=none; b=rNY43BKRN+RXgaiw8xFWwR1FM/yrnjO9UyLmIZ0T/4tq5tqftu0n6kzVfc2BP7LkcLFuR9/6pTz9OuB35+I91r7FNfT0ML5bHnoLUYhQkDjkCCEoJOYITm1aKE/Et/c8nr2EeScHTAT3IqO/XxzgQTiC5WnQACrLUihRtuHFmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810277; c=relaxed/simple;
	bh=MQVYYLbltUu3gM+x2chnL6/HZHcYyjfddY/XCJbMqzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUVdKTMPJrkj8WBWDfiQxERNTk6NHPn5vaM/tTKBD0JLv9mYdCHXTlIGYqdwjE5aoUpnLb5w+cfW5idSkxQ+0mh1RkcZzMAiPnKc/eIlqOWV84VeC/W2YYBmLy9R3QjVreSx72bltX6SprIvRMyUragwt84e9qJCLCSJhMU3luk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bbNm1bcZ; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bbNm1bcZ"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3feee1d2so941484e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790810271; x=1791415071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQVYYLbltUu3gM+x2chnL6/HZHcYyjfddY/XCJbMqzk=;
        b=bbNm1bcZLW/4PhXvUVqT3GSWJEzzmfBnklS2Ag0bpisyIN2//R5Q2chIxjpvtWln8g
         4A+V+lSUxtB3af2JmF77n3u3ahNxVDFrF2+kgZCiwCULPokQCRnrjFeoTbYtyZQAMnXG
         fYp67UhIEqERjDu2jW2iFgaRn/2sO52cjoisA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790810271; x=1791415071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQVYYLbltUu3gM+x2chnL6/HZHcYyjfddY/XCJbMqzk=;
        b=buvnAxMvhYEYYW3/4hQEggaUIoiurc5cphHdO+J0wRJP5IAXS1kPPl6s3J7G+SrSY2
         NJNnUXJgHjg/rnsBHwwvRMI3j5J4vvSTLIyxvvHrapwAZjsUiVxmGVy9zKB40YQP+WYq
         ZOMW9r+hO4jE9tfere90RuXByf7EuFzcNzRxHIfXW0mIY9Q6DBzhEZZgCLsijNKwM8Le
         MosIto88aBlOb7RKk7f0mOupSrEtSHxw++jjQeVXUodDIYyzlQx21BCsA7kMheKfVlLM
         hUIjUTVBxBBxGBzjl+WGr9MIKcsnKjVCDEch7Zg+pPijnweXZHFlfstnoXQcC5q69SOC
         9u2A==
X-Forwarded-Encrypted: i=1; AKwUvByt03vDPL0q5q9E/+/0GXaKeG/UfauzO4Nlr5CkFUwgFZSA7BMc5ooldshXCd0t/+jVLkr30pehBUNfI/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU1PA5pN6a0o6NLiW8vJU5ngcsLdsyRfmkiZIfXUh4Zrr3NybE
	kihCbNhN4kwlugAwzaiOBecUGBSw/Lp6wMOqzEORwGcQVErLVcAEiLTjMYDXKkmzL32C4SGrftd
	ahZv8dw==
X-Gm-Gg: AYBFou0OWXMOAjf+xG4fzDD7zslGsXCoNZqiGSHGspuWbAWy7fq5GeHLFIQqPm4/mMc
	w/inbvLbi3VzBlLCPOuXAZnYdfaZUB5urC73dbGo0iactdt/Y4Q7dCXQ/JzZUuCycP1VFlzIeO7
	/JHiIO6XBziFX04sTLNTSzT0WUc6Nm6RRkKapbh5Jz+W1uijBGEUD7lobydPahBWx5jBVgVA9X5
	UO+LzMhz3rNLvk/sxgX7UMgZtzmlIHPcVDX3EYFDIBxuEy9lR979yciEz26t5Cdk7ILos+ShpVw
	fZVESqRejHO6wKkveR1MxB6U9o0hU5wdBO5X/uaJODHWat+R8Jzgyr7rlzW3G4NmmSpL5ZW+UpS
	71E2Ky686rkHoj+LjLeUyDRHYYXh4f+05wFkmccf7UqT+tXlRPlWWm4qeH5/JfyIbEDJCNmM3J6
	uRcuRq7Fg04nL3r2GxJLpTcvBTG1S401At1lRTtRTpqSq8Q2xvtTAjQrtIBxTroaJP6zjaKcL75
	IpJDC2OPb6YWGrjo97qMgwaEmBgGOwfBaTKL2unCUgk2Xyd
X-Received: by 2002:a05:6512:114c:b0:5b8:997b:c606 with SMTP id 2adb3069b0e04-5ba44074560mr189667e87.41.1790810270951;
        Wed, 30 Sep 2026 16:17:50 -0700 (PDT)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com. [74.125.225.98])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf03csm279766e87.77.2026.09.30.16.17.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 16:17:48 -0700 (PDT)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b017a3be3so1045177f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIF289PpPq0NifTXYBLUuu73aLDS6t8EOOmR7Fl5M91O08WKgYzmRNMNj3tR0VkcdKAVaeB3AxOOGq2ks=@vger.kernel.org
X-Received: by 2002:a05:6000:2885:b0:487:9a8:9f31 with SMTP id
 ffacd0b85a97d-48b025295ebmr5666042f8f.41.1790810266894; Wed, 30 Sep 2026
 16:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <87v78l6oha.ffs@fw13>
 <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
 <CAD=FV=WE-Wn60zTn=nsq4qLis_zjncrS37fND6ehtpuvxYp+DA@mail.gmail.com> <87o6deh0pm.ffs@fw13>
In-Reply-To: <87o6deh0pm.ffs@fw13>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Sep 2026 16:17:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuSEzHw8JJsTXuGEEe-w_T=_w6ycsqpzpNWDHxMqyJdQ@mail.gmail.com>
X-Gm-Features: AclHuK_lONYIi2Rjd5xeZvJ8IkAtljr3_IbRPhmnlL1GcuMTyl7rym8vZ20aZcw
Message-ID: <CAD=FV=VuSEzHw8JJsTXuGEEe-w_T=_w6ycsqpzpNWDHxMqyJdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 30, 2026 at 2:46=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Mon, Sep 28 2026 at 09:14, Doug Anderson wrote:
> > On Fri, Sep 4, 2026 at 8:26=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> >> On Fri, Sep 4, 2026 at 8:11=E2=80=AFAM Thomas Gleixner <tglx@kernel.or=
g> wrote:
> >> > Of course this is a regular global interrupt otherwise it couldn't b=
e
> >> > requested normally. So this sets IRQF_PERCPU (it has to otherwise
> >> > request_nmi() would fail), but that looks like a hack to me.
> >>
> >> At least on GIC, promoting a regular global interrupt to NMI (or
> >> pseudo-NMI) level is possible, and Mayank's use case here seems
> >> legitimate. Any suggestions you have for making this look less like a
> >> hack are appreciated! :-)
> >
> > Throwing an extra plea out here to see if we can make forward
> > progress. IMO being able to make watchdog driver "bark" interrupts run
> > at NMI (or pseudo-NMI) level is an important thing to do for
> > debuggability of the kernel. It sounds as if there are no general
> > objections to the idea. I guess the next step is to make this look
> > less hacky. Is that something we could send patches for? Any hints for
> > what you'd like this to look like would be greatly appreciated.
>
> I think the objections have been layed out in course of the discussion, n=
o?

I guess I'm still unclear on one key question: if we post up clean
patches that allow promoting global interrupts to NMI (or pseudo-NMI)
level, would you be willing to review and eventually land? I got a bit
of a vibe that you just didn't like the idea in general, but maybe I
misunderstood. I just want to make sure Mayank doesn't spend a bunch
of time trying to solve this problem if it has zero chance of actually
landing.


> > I'll also be in Prague next week for both Plumbers and ELCE, so I'd be
> > happy to discuss this in person if that helps.
>
> I'm going to be there, but I don't know about Marc.

Great, I'll make sure to look for you.

-Doug
