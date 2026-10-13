Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8EF5013BE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898240; cv=none; b=IhTobey6i1k75FpbgMjriTvHjQKc0IUBOOOe0V6mcpCOopZCBeTvM1g8jfnWGrHn8L8Un2NQ6AtnabGULWk0D9xkTkVzZOwPi/qWCGaEEtO0rW6Fz/X+n2K0HqkYtZNSQCCIeQmH7TPn/wqzuQv0vLgM3eDViR64k+KlAuz7nRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898240; c=relaxed/simple;
	bh=PlBzu5bIxgzsVNd8YW2W4F6Ph0gpnLGqokew09Q7to4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haYMCrUUJOXHIXVny/GFPwv81HSH9KQXE21x/TamJ2W7aUWORZiRVxVpT/tTAHsOO2UWvKGhNlPXTEF3UV9qLJo2kc2i79Q9ojkl1H3KL5NN/9wONCakh2arr997Lob+3pzvuAIh9V0oJpIKeZ+fxKNSQqiUbWniebe1mXinTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHb542gK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHb542gK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D447A1F000FF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898238;
	bh=pJ/UBJWX6KYy+UT9hMNUkHk4sC9Ccb877JQPrw3bZqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eHb542gKyrzOY2yAYVgzuDqQI6wt5rDca5xd9uvqBkzmerL9QU1CkVpDfFYnCalVq
	 KEPkthty+D25hg9FUOaBQQhwCcwtkxbiGsU/FMcNn6hHqSLF5fcowFLXcPQj7eGszd
	 IyOON3c5MzCLGgK//Opu3timg6uD6JsoED5PfTVXWp5sLbM3MxnEFx9vrUZ+y7fnJu
	 ixREZbQCN/ZcspxXJu63xqBmVm7H9QInPqzDsVvYH13XHMwMKlRDEzn4so+nAeO3D3
	 dnVy3+qE1Sa0YOyTQnsAe6NgHx91pb+IwFUrCUfMqNYnDHljQ0/LEeR+oeq0Ug4zz3
	 kBxYLImoGgfIA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2177268e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5FTQpb2FwDHF8uTtvnUxL8owlFBM7Zz3dyAJ4Vv7ymxEOWe0otskscFVtwf0JFY4990RyiFFH94IPlKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhmnN57NvsYtygs35H3M+juyV0Y7whnv0NSUZNvnYv0NOfr0Yw
	uI2tAXlj4CgZc7ZJwy3z4guyvRvbeyP7xgJU3WxUcfEsTEiAF7PYUdM0zERfJWzaqmqSqNtYAgB
	rDWkiR98gqG1GL/pv8vRu8CXU78SzJZA=
X-Received: by 2002:a05:6512:110a:b0:5b8:f780:5ebc with SMTP id
 2adb3069b0e04-5bcde35ba0cmr4342256e87.9.1791898237244; Tue, 13 Oct 2026
 06:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012041733.798932-1-yangyongxin@kylinos.cn>
 <20261013023411.1364546-1-yangyongxin@kylinos.cn> <CAJZ5v0ig+XkpPwM53WpQoewWg8D0UXeLNaKs18YvSM792RsHNQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0ig+XkpPwM53WpQoewWg8D0UXeLNaKs18YvSM792RsHNQ@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 13 Oct 2026 15:28:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gzCS1C-U2bD=skZFRxcQwkH78a3_Hcfv72Zx=DqHsXWg@mail.gmail.com>
X-Gm-Features: AclHuK9Hz54pIQ5efDHMWUh6X0cwPMgFmmXSuxk60Xs84C83agA6yEOUozkLKuw
Message-ID: <CAJZ5v0gzCS1C-U2bD=skZFRxcQwkH78a3_Hcfv72Zx=DqHsXWg@mail.gmail.com>
Subject: Re: [PATCH v3] PM: hibernate: Log the hibernation mode on entry
To: Yongxin Yang <yangyongxin@kylinos.cn>
Cc: pavel@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:22=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Oct 13, 2026 at 4:34=E2=80=AFAM Yongxin Yang <yangyongxin@kylinos=
.cn> wrote:
> >
> > The hibernation flow is the only place where the kernel decides what
> > to do after a successful image write: hand over to the platform
> > firmware (ACPI S4), power the system off, reboot it, or resume from
> > the image right away. That decision leaves no trace in the log. If the
> > resume path later fails or hangs, the tester cannot tell which outcome
> > was requested, so a report of "the system rebooted instead of powering
> > off" cannot be attributed to configuration or to platform behavior.
> >
> > The mode is selected through /sys/power/disk and stored in
> > hibernation_mode. Append its name to the existing "hibernation entry"
> > message, so that the line reads "hibernation entry (platform)",
> > "hibernation entry (shutdown)", "hibernation entry (reboot)",
> > "hibernation entry (suspend)" or "hibernation entry (test_resume)"
> > instead of a bare "hibernation entry".
> >
> > The names come from hibernation_modes[], the same table that
> > /sys/power/disk uses, through a new hibernation_mode_name() helper, so
> > that the mapping from mode to name lives in one place.
> >
> > No functional change.
> >
> > Signed-off-by: Yongxin Yang <yangyongxin@kylinos.cn>
> > ---
> >  kernel/power/hibernate.c | 32 ++++++++++++++++++++------------
> >  1 file changed, 20 insertions(+), 12 deletions(-)
> >
> > diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> > index e365e440cd52..6f88b42b1af8 100644
> > --- a/kernel/power/hibernate.c
> > +++ b/kernel/power/hibernate.c
> > @@ -72,6 +72,24 @@ enum {
> >  #define HIBERNATION_MAX (__HIBERNATION_AFTER_LAST-1)
> >  #define HIBERNATION_FIRST (HIBERNATION_INVALID + 1)
> >
> > +static const char * const hibernation_modes[] =3D {
> > +       [HIBERNATION_PLATFORM]  =3D "platform",
> > +       [HIBERNATION_SHUTDOWN]  =3D "shutdown",
> > +       [HIBERNATION_REBOOT]    =3D "reboot",
> > +#ifdef CONFIG_SUSPEND
> > +       [HIBERNATION_SUSPEND]   =3D "suspend",
> > +#endif
> > +       [HIBERNATION_TEST_RESUME]       =3D "test_resume",
> > +};
> > +
> > +static const char *hibernation_mode_name(int mode)
> > +{
> > +       if (mode < HIBERNATION_FIRST || mode > HIBERNATION_MAX)
> > +               return "unknown";
> > +
> > +       return hibernation_modes[mode];
> > +}
>
> Thanks for the update, but I really meant this:
>
> static const char *hibernation_mode_name(int mode)
> {
>         switch (mode) {
>         case HIBERNATION_PLATFORM:
>                 return "platform";
>         case HIBERNATION_SHUTDOWN:
>                 return "shutdown";
>         case HIBERNATION_REBOOT:
>                 return "reboot";
>         case HIBERNATION_TEST_RESUME:
>                 return "test_resume";
> #ifdef CONFIG_SUSPEND
>         case HIBERNATION_SUSPEND:
>                 return "suspend";
> #endif
>         }
>         return "unknown";
> }

OK, scratch this.

The table is already there, so it can be used below.

> > +
> >  static int hibernation_mode =3D HIBERNATION_SHUTDOWN;
> >
> >  bool freezer_test_done;
> > @@ -794,7 +812,8 @@ int hibernate(void)
> >                 goto Unlock;
> >         }
> >
> > -       pr_info("hibernation entry\n");
> > +       pr_info("hibernation entry (%s)\n",
> > +               hibernation_mode_name(hibernation_mode));

But is the wrapper function really needed here?

> >         pm_prepare_console();
> >         error =3D pm_notifier_call_chain_robust(PM_HIBERNATION_PREPARE,=
 PM_POST_HIBERNATION);
> >         if (error)
> > @@ -1130,17 +1149,6 @@ static int __init software_resume_initcall(void)
> >  }
> >  late_initcall_sync(software_resume_initcall);
> >
> > -
> > -static const char * const hibernation_modes[] =3D {
> > -       [HIBERNATION_PLATFORM]  =3D "platform",
> > -       [HIBERNATION_SHUTDOWN]  =3D "shutdown",
> > -       [HIBERNATION_REBOOT]    =3D "reboot",
> > -#ifdef CONFIG_SUSPEND
> > -       [HIBERNATION_SUSPEND]   =3D "suspend",
> > -#endif
> > -       [HIBERNATION_TEST_RESUME]       =3D "test_resume",
> > -};
> > -
> >  /*
> >   * /sys/power/disk - Control hibernation mode.
> >   *
> > --
