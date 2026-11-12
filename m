Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492216;
	b=5pXhyXVMq9LCFfnXvyjUaTkDWlQX99piIEvLnDVrVIFHxwoIV8tVM3NqVRWNaWPDHlEK
	 b/9W4XcS4oCdvA1kZWWAFWVrlECZN1iWVh+g65K5ha8hguG6l/5pQLd369bWwQ3t8k6zW
	 0HXCod2f5yYULbLjvwiOFOiPzEdwtojve7hw4gvgYU5OU1HwEQCzyFy3duziFafyOoD3f
	 SwKiLppykVOmMNdsz6eGarBsB17jQIcohU/o2utKdv9g/5jHMiASErzq447Bmr3igF5kl
	 yK2y5T5ji8vr4xc9StQ2+ymxqH5XjyuP7qNvUXueeg9rCdv+8+zmypf5MoUaTxSCdWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492216;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zmPWh+NYf7w6PPrSZKb5ErSaLMlekSlLFc1zs9w8z0Q=;
	b=JqpFehiMbb3cWt8kl+UvFj6zE0GTWJM5aQdKoNCcNaQWcViSjQgxCGLU+qkcHQQzjeWU
	 DIESGc1077yMUksZ86I6rXfHHsGMu2f9E96DVJ+fqQlD6ItHINL34xhs6pW2psSFpbD2h
	 9txe0sEPj6V0G2cFC25PFj7/E+ZJIYu75B3LUq/cY2/s1AfAqd2y1tsvS5k9im/ic0z+U
	 8Rq7O9eE2A3PtI9aVqqJmoRcYpoKNc221i8m/UW0wOxRAJ+x6eTuo3q6WMKwydzEjIqYK
	 13wvVocun9cIVxXmCk9ssIAa2vw4n51cexcCNMqf4aP/8f2rJ/Jn1b+T6/QgUsyLBGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orsbQZ0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA560A261C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orsbQZ0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88321F00A05
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492215;
	bh=zmPWh+NYf7w6PPrSZKb5ErSaLMlekSlLFc1zs9w8z0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=orsbQZ0Fs9Yc8FoXyxHjcSt+uJVAY+FT7P5zPQScjNFhGP+bVpgRbU3Y7B2W4r5ip
	 jYZ9/Q19ow3k5lCv00/d1zZk9ds6paCeSflAFSlCvbbLvyeiiaAW4Rq+kHZBeRW4Pp
	 bTr+jvfP6jzc6TcM/YurJSBpq5Wtu9sgabNOIxa4E1NqT7TPcCIN34HGb5mzwwhJw+
	 +BSvzMnr8Ru5liz74l5qe1mFxtxLV9B1KTq2GpRMWsDQ9w4AsJy8W1i3zy9f8H2JQ7
	 5uRyQi5gB9uowIXCvriwEaOesFmJhMU3QZ0k6xQHTxWXqVhrdlI942Gh4e9e2TUEJf
	 Eu7mfm85Zywug==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bccecba199so4223534e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:03:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFL0sC2nLfQDwPfPpVrFPFIez545gp19n5NJGUeuf0v14youNqLt3/Q4oCp9UANZz4uEP8J7NhTjwEoMw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3BO+I5B1hzzS+06BxVKVhdHLor7jV28I3D+4K3xlSSH8rT7TS
	99VpDp4rRLP0c3QF3i1YIdiblakaKPHFrs3kaj5gC81xa2MQy73Bp9IgfwD19/fGQX9BQc83pnh
	PO7PkIde8jA391oNcer5l4zfg5Q4aHXo=
X-Received: by 2002:a05:6512:1325:b0:5c1:4a5d:6ae1 with SMTP id
 2adb3069b0e04-5c15d62c5dcmr2107662e87.14.1794492214280; Thu, 12 Nov 2026
 06:03:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
 <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com> <CAPx+jO86pgUXuHMPKAMKN6Tq9unxnpd9kB8eE9byZw_B=0xxyw@mail.gmail.com>
In-Reply-To: <CAPx+jO86pgUXuHMPKAMKN6Tq9unxnpd9kB8eE9byZw_B=0xxyw@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 12 Nov 2026 15:03:21 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gEDWA_zc6KTJqCPNwHt74+pt6WfBC8Ka6XCp8ZSK15HA@mail.gmail.com>
X-Gm-Features: AclHuK8e-AJ-XjrSAXBkD-hu4PMVxz0LC00YFvk3ACIuaq22lQdmQ2x0hsZZ62o
Message-ID: <CAJZ5v0gEDWA_zc6KTJqCPNwHt74+pt6WfBC8Ka6XCp8ZSK15HA@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM: sleep: Do not arm wakeup IRQs for hibernation
 freeze and quiesce
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 2:46=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Mon, Nov 2, 2026 at 3:47=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
> >
> > Freezing devices to take a hibernation image and quiescing them before
> > jumping into one go through the regular noirq suspend path, which arms
> > the wakeup IRQs of all devices that may wake up the system. A wakeup
> > IRQ firing then aborts the hibernation or the restore:
> >
> >   PM: Triggering wakeup from IRQ 180
> >   Wakeup pending. Abort CPU freeze
> >   PM: hibernation: Failed to load image, recovering.
> >
> > On a Qualcomm Glymur CRD this happens on every hibernation and every
> > restore. The WWAN modem keeps asserting WAKE# once its root port goes
> > down, after its driver has shut it down for the freeze, and the WAKE#
> > GPIO of a PCIe port is a dedicated wakeup IRQ with wakeup enabled by
> > default.
> >
> > Neither transition is one the system can be woken up from, as nothing
> > goes to sleep, and Documentation/driver-api/pm/devices.rst already says
> > that in the freeze_late and freeze_noirq phases a device "should not be
> > allowed to generate wakeup events". Do not arm the wakeup IRQs for
> > them, and only disarm them in the noirq resume path if they have been
> > armed. Wakeup IRQs are still armed for the final transition to sleep,
> > PM_EVENT_HIBERNATE, and for suspend.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>
> This seems reasonable to me, but I can't judge from a reasonably brief
> review if this is the proper place to fix this. Rafael, what do you
> think?

I think I'd do it differently, but give me some more time to think it throu=
gh.

> Nevertheless, please add:
>
> Reviewed-by: Ulf Hansson <ulfh@kernel.org>
>
> Kind regards
> Uffe
>
> > ---
> >  drivers/base/power/main.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > index 16a1f017051e..34ba0e5941a3 100644
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -949,6 +949,9 @@ static void dpm_noirq_resume_devices(pm_message_t s=
tate)
> >         trace_suspend_resume(TPS("dpm_resume_noirq"), state.event, fals=
e);
> >  }
> >
> > +/* Whether dpm_suspend_noirq() has armed the wakeup IRQs of devices */
> > +static bool dpm_wake_irqs_armed;
> > +
> >  /**
> >   * dpm_resume_noirq - Execute "noirq resume" callbacks for all devices=
.
> >   * @state: PM transition of the system being carried out.
> > @@ -961,7 +964,11 @@ void dpm_resume_noirq(pm_message_t state)
> >         dpm_noirq_resume_devices(state);
> >
> >         resume_device_irqs();
> > -       device_wakeup_disarm_wake_irqs();
> > +
> > +       if (dpm_wake_irqs_armed) {
> > +               device_wakeup_disarm_wake_irqs();
> > +               dpm_wake_irqs_armed =3D false;
> > +       }
> >  }
> >
> >  static void async_resume_early(void *data, async_cookie_t cookie);
> > @@ -1685,7 +1692,17 @@ int dpm_suspend_noirq(pm_message_t state)
> >  {
> >         int ret;
> >
> > -       device_wakeup_arm_wake_irqs();
> > +       /*
> > +        * Freezing devices to take a hibernation image, and quiescing =
them
> > +        * before jumping into one, are not transitions the system can =
be woken
> > +        * up from, as nothing goes to sleep. A wakeup IRQ of a device =
that
> > +        * signals for attention once its link goes down, like a PCIe e=
ndpoint
> > +        * asserting WAKE#, would only abort the hibernation or the res=
tore.
> > +        */
> > +       if (state.event !=3D PM_EVENT_FREEZE && state.event !=3D PM_EVE=
NT_QUIESCE) {
> > +               device_wakeup_arm_wake_irqs();
> > +               dpm_wake_irqs_armed =3D true;
> > +       }
> >         suspend_device_irqs();
> >
> >         ret =3D dpm_noirq_suspend_devices(state);
> >
> > --
> > 2.54.0
> >
