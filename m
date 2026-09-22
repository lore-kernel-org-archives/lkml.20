Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5433F5B6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043115; cv=pass; b=ubggDEK6A6cp/0god1ysrVaTllIEFbS5fW1MSsteqyXeYoBQ2GQ+TMh+tVLBPz18+sgetd4wscc007M0p6eFLHrOq2+kybXpvqSMhEfTVt6QR9BwMu6xE7uRISKxypmcGuNrGajdOlRDy4xncmwPHusXevFMFdvTyxLcdwQxAyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043115; c=relaxed/simple;
	bh=RmO5GLrXflVxVmPF7qPo5gCMEyya6HFKnHxRxQwc4N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMxtExer6a7rgQltgJIRo2Egs/ZfFWIQHlqnBuaO9ftj5BFnGAIsHesNgQ/UN1Xou5AVNZQElltrBEWaN+3DNtEEabWtAQCMmuomSx5qxR31KWE7q8m5HDNYcGLPR7MEqX7jqtCOy0NMJaB/ac82/r4a88jojOYhRH6kXlD06cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cs2OCwuc; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs2OCwuc"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac8d1fso26421647b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790043109; cv=none;
        d=google.com; s=arc-20260327;
        b=fM0SwT8HEMqcIqLagisZN1DZ3WW0yxEISQTHsIwolpN7u7IO+NKQypbI4b47QKetKA
         +QYWnHj1sSluKu/k4OkpGQIw/8omweseEWIyO8qVDeGwwQm7iaZdlbH6lS2orRIgYOIr
         xxR8N8Ty/oZXUqzJemKli0rIV+XeysSAkAAC58ScE8gwsw0aD+sqPq8PiJ0UJJApuO9y
         vQZQHSkUX/vjhRlLiEB+fFvO5Q/2xAColiWsbtYyjsEo3DUGXprxwMDC8pwXhoGq/pTv
         Q2QhoE6BJtH5+19QJU7EHRTGOdNfssowQUSoKb/ZjgpKh67v+gXcQkOlmuxn43I8nw+2
         Q/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WSqFKvA76kHZ8WDjK46gOjRVqZHbeKSy5ARU/kjfg/Q=;
        fh=R+0hss8BkENgmOfNGGuF7wnCE6xz8b9aXf8fhzoFI6U=;
        b=iaUPkTt+b0Iurai5H402bK0CxDi8xfRTUYQzRj3fValgl9dq0q1Kq7H8zurP325ziN
         /yhjmr9lfM0cJd8vtozTnIr34SB7EARL4rI15M6R/uXQ7MsXtXkBhNDp/5nkv0kpvs1e
         ET9yj4GNJWxo0M+KkkLd+okUJMDMeIVuQYTbm6WYJF8EHOLVBAuddaS/tH65tKLMwWJZ
         5Qss33i0MFR41rBcJ3fKJoaXFOOQUmDINzd2CdFq//TMc1IfWmx1jhXYbYi8uApzxGvm
         idfmRLlJsG21TlyHC13pEom23qnTwLuFWxA9FpkQJFhTMyPuI1jHl/6E1xHQ1/TBSzrt
         U5tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790043109; x=1790647909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSqFKvA76kHZ8WDjK46gOjRVqZHbeKSy5ARU/kjfg/Q=;
        b=cs2OCwuc0eStrOhMReEqbKDwoowqPnRikJEKPI+HTe2oFFAHlK8CrU0Q7J71OQHocb
         C0hAx+bNYenHHqkyv4Ai3KfxI+5LRuPQf12xhrF+16Q4J4CtYOaCf6m/WGxpLp5Z60XO
         lGp5HfkQt9QM6+cfbxWB8L0qJg2dAB5Rx6151nXkofO/39Z6ExjyMJ5kaXymmtGnGsia
         K4/udMHrtHkg+/4hzHTTaD/YQ21XLr0bM4SURTbquQzqsO1wdbCySw3nwUUzGbkIsrxP
         Fe0SXHUJse5Ii5lCMycW1yXXZl75jE33jfMsfRLFJY1gV80hX6m9A8Q1SjlqvkP1h0m9
         qTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790043109; x=1790647909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WSqFKvA76kHZ8WDjK46gOjRVqZHbeKSy5ARU/kjfg/Q=;
        b=zQF2QW+KUrTCCWJa87JQvGiK6fRfhe+hXk5YwfeAO6hteDC2Rk1DYnhKxxm6tXSFc3
         PvvQDz4Y3giS8VM9jX0hxmJ/k/M1CnqzXg61T4JRYPF8gHAJa0vQ5CDsOxuHxLOTvdGB
         ydldkuzt7WFAICTm9iIXXm+/yDBZ+tcsjEcNoDVfweJexJ8rtDm/G9WPUAuKnpU6T9bH
         3dYbQ5tzBSzkX0UUoO33YorDrq/5wEwA7m/+XUOOkjbeoPW1fL37NS+tltnPtQd68XVW
         7cqtZMqlwkRAIi44pARTM5ac87UGbqmemYCHyeH/NmLE3RR+OUcjkitu/U1ZFg6WNLpk
         gWmw==
X-Forwarded-Encrypted: i=1; AKwUvBwfY+hhDzardHCb8364JUZfkVbCDJDw7++tQLxwCWkSl9V8b7PvdGv3Q3uEukx3OYI7Ytqsn+291l7qe60=@vger.kernel.org
X-Gm-Message-State: AFuF++nFJQepM34eqLmqnCByDtDziXl8spOjgF1iDYs71xgQMCWzFun0
	k7LVWiCaLD9v+umQbJboNBIMO7AmDQWEabX0Zz+z21eZc3Z9islJkUOd4FyKHweW1clt5mQa8gV
	5GnNbfR1LKfUicYl8f1bcn1z1sVyyOGiQb7qWYekWg07s
X-Gm-Gg: AYBFou17RviStzM/I2WBMtYjOIRiVCl4lIQ45EGxeO8YqLHSn0u6s5N1ub+yGbhJ/kV
	Kze1xgNdLaR96UAwWPP0lW4PsqCZ/oXJm42ONo33p/vKYwmExVOL1A1NgvxCd8jx6+py8Da9r44
	axPDWEZWLNPV+HaFktvjJqbFEpUQAOwl2zKvc+ov9WiFDwIABPen1kXq/vLYnMj2MR2BIfzRymY
	vO8YyejSHYTa/Gepwow8YYjh2JETl9vHLwr9nz0Y+4XN/+qZeDoCTbQsriIOl8mC7TfWr/D2r+h
	N3C4JoQ5IevWFn5hiKV9R9hy9kXRgYAMkmYeMCjuZs5qBgHTm+IaCdLw+Fc=
X-Received: by 2002:a53:d006:0:b0:671:3b1b:997d with SMTP id
 956f58d0204a3-672c54d38a1mr307218d50.88.1790043109182; Mon, 21 Sep 2026
 19:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921082609.244774-1-lgs201920130244@gmail.com>
 <arFKFmkpldopUIMI@quoll> <89bd2593-e0ef-4b9b-8c9b-833aff327a3e@kernel.org>
In-Reply-To: <89bd2593-e0ef-4b9b-8c9b-833aff327a3e@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:11:36 +0800
X-Gm-Features: AcwNN1ULcRqBryBnufCeX7rqeQatFi1km04Dy1jR2ehl0tsOS-FvTsDL2fGI_aw
Message-ID: <CANUHTR91qqHtCbaFHSqcMa8eZuD7EnTqyFSfDMwX=LsiMiHoEA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/amd/hfi: fix platform device leak on init failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Perry Yuan <perry.yuan@amd.com>, linux-kernel@vger.kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	stable@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Tue, 22 Sept 2026 at 06:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 21/09/2026 17:15, krzk@kernel.org wrote:
> >
> > On Mon, 21 Sep 2026 16:26:09 +0800, Guangshuo Li wrote:
> >> amd_hfi_init() registers the HFI platform device before registering
> >> the platform driver. If platform_driver_register() fails, the function
> >> returns the error without unregistering the already registered platform
> >> device.
> >>
> >> Since the failed init path does not run amd_hfi_exit(), the platform
> >> device remains registered and its reference is never dropped, preventing
> >> the associated platform object from being released.
> >>
> >> Unregister the platform device when platform driver registration fails
> >> to properly unwind the successful device registration.
> >>
> >> The issue was identified by a static analysis tool I developed and
> >> confirmed by manual review.
> >>
> >> Fixes: 5d902ee5609a ("platform/x86: hfi: Introduce AMD Hardware Feedback Interface Driver")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >> ---
> >>  drivers/platform/x86/amd/hfi/hfi.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >
> >
> > You sent multiple independent patches, to multiple independent
> > subsystems. The amount of these patches clearly suggest this was
> > AI generated and most likely not tested.
> >
> > More importantly, you sent all this work without properly organizing
> > relevant patches into patchsets. This makes reviewing difficult
> > and might cause multiple reviewers to address the same issue.
> > Replying to the entire set is impossible and requires handling each
> > patch independently, instead of applying or discarding the set.
> > Maintainers also won't see the bigger picture of your work. Quite
> > worrying.
> >
> > This is on the verge of hostile patch: bomb us with so many
> > contributions, we won't be able to handle them in efficient manner,
> > like responding ONCE to ask you to slow down.  Considering all this
> > is untested and LLM generated, I have even more doubts whether this
> > should be considered for review.
> >
> > Please read kernel documentation BEFORE posting more work. It will
> > explain you how to identify subsystems, how to organize your work per
> > subsystem, how to document usage of LLM and how what you should not
> > do if this was posted in a good faith.
>
>
> Apologies for spamming here, mistake on my side.
>
> I guess the OpenClaw on the other side did not even notice...
>
>
> Best regards,
> Krzysztof

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
