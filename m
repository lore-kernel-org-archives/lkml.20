Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9C83B05BD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355702; cv=none; b=giVTcZM6Cp33vEgYKfWUgMjsBDuepbS/RYT4zSUGSBi71+ZqH3seWGpvWbkLr57fjSTJceAHzMkrICE7dZOOOIH46LeJsb1a9fjE2PV2bwEWBpbCmpXpNXXoFtwegqQZRiVHiUi6Gb9tveKh1tLc8CmU7/IQZv/EzvxPkgeoAUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355702; c=relaxed/simple;
	bh=ae+7nNWeaOcwtzoJ8g8zJTapU9Co0WkBDAjHguCRKVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQtgTpuzp2b2OS2lG21S8YLyox8P49Rsu0NTSCdgurTZsysTX319sVJfQv57J+t+vkWiUw63J+kIB9HRcLwp8Rq8nyUBOgzmYtTcQDFnauWWcxxWC0SNQnsTCDpAEv5Ssd3dznFwSobQiyRa7sHUYFt5VBOuirkjMc9r0NbT0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnMpzoBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnMpzoBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3988D1F0089D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355694;
	bh=0ffWHiQbZIsxSI5BXBygJAUPT1n/Ksw/KozICfj7llQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NnMpzoBuP6u0rUip0usj+vy4a1nH3PDmnC/0VjqdKczZwipFNTo6diGuH080ku/3c
	 hEBNkWJVLilry6lGZAIOwRlusA0jZcNLLzv88ZnbXXZRJ3eeeGigEpxBMIn8tfDFmZ
	 zBoBx11HY4qLoDbgZ/4yH/3irgR94ve+4en4SRX+AIIhdRhKkLI+qHIULytblXp/CR
	 +SnX3Snp/EvNITIVus7J+YcLjuTJ2327kkfOTMeFojcRjimBAl4wfppMzxMqrDbrwu
	 lmvG+bvu95J8cQQo/szt0sUsW6SRGZ4Us9pFy2VeufbRU6ZB8ihZVhHP7hFxaIik3k
	 UZhWCBi+LI5mQ==
Received: by mail-lr2-f21.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso8103051fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/DyZTrLFXMI8K9tfpCuzrKoU4ENtUAxWWjLiUomoQkpZJOatSC+TUyCmtJwe0zKCm6BrgYCGQk3B7fXg=@vger.kernel.org
X-Gm-Message-State: AFuF++ltan0uNB9vQIjyNh41Ct5Te4aZlR8j7Mbn5P2pEd8LlsX2bkvm
	qf6qKKrTixc3yKK1jkVcmaorPS4MSIoaEiNFacqrGOKGYCYsJfXX0Tr5JRM/cB5qddaA0Sz+rD4
	AUFG/mZLHTgz0fDDbk/3YoSubNvH//uA=
X-Received: by 2002:a05:651c:890:b0:3a5:b507:dfb with SMTP id
 38308e7fff4ca-3a64caf4363mr6778101fa.29.1790355692625; Fri, 25 Sep 2026
 10:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909224818.2177311-1-mrungta@google.com> <CAD=FV=WFBmq3kniULxcXNsKgY-Zrb82JfaX5uRWVewQi_tJyJw@mail.gmail.com>
 <aqQBFxCjSdPmFJXh@google.com>
In-Reply-To: <aqQBFxCjSdPmFJXh@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 18:59:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hBTGdBo-sgooV6_wscQLm9qv3bSnCqyUTODc5wDi4ecA@mail.gmail.com>
X-Gm-Features: AclHuK9rAcNfhTZvYquNzX8E_7QQVb0DrSRQ4EHHrRqgHRPmhGpKmAZJUHyj-Kw
Message-ID: <CAJZ5v0hBTGdBo-sgooV6_wscQLm9qv3bSnCqyUTODc5wDi4ecA@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: Add DPM watchdog to prepare/late/early/noirq/complete
 phases
To: Tzung-Bi Shih <tzungbi@kernel.org>, Mayank Rungta <mrungta@google.com>
Cc: Doug Anderson <dianders@chromium.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 3:24=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Sep 10, 2026 at 10:01:40AM -0700, Doug Anderson wrote:
> > On Wed, Sep 9, 2026 at 3:48=E2=80=AFPM Mayank Rungta <mrungta@google.co=
m> wrote:
> > >
> > > Extend the DPM watchdog to wrap device_prepare, device_suspend_late,
> > > device_suspend_noirq, device_resume_noirq, device_resume_early, and
> > > device_complete callbacks. If a driver hangs during these transitions=
,
> > > the watchdog will fire and dump a stack trace to help identify the
> > > offending driver.
> > >
> > > To prevent false-positive timeouts, the watchdog is set only after
> > > waiting for subordinate (during suspend) and superior (during resume)
> > > devices. With this change, DPM watchdog coverage is extended across a=
ll
> > > phases of system sleep transitions.
> > >
> > > Signed-off-by: Mayank Rungta <mrungta@google.com>
> > > ---
> > > v2:
> > >  - Extend DPM watchdog to device_prepare and device_complete callback=
s.
> > >  - Update commit subject and description to reflect coverage across a=
ll
> > >    system sleep phases.
> > > v1:
> > >  - Initial version adding DPM watchdog to late/early/noirq phases.
> > >
> > > Testing:
> > >  - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel=
 with
> > >    DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
> > >    backported).
> > >  - Verified hang simulation in device_prepare and device_complete
> > >    triggers DPM watchdog panic and stack trace as expected.
> > >
> > >  drivers/base/power/main.c | 31 ++++++++++++++++++++++++++++---
> > >  1 file changed, 28 insertions(+), 3 deletions(-)
> >
> > Thanks! I guess you dropped my (and Tzung-Bi's) Reviewed-by tags
> > because of the minor changes between v1 and v2? They look right to me,
> > so:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> They look right to me too:
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied as 7.4 material, thanks!
