Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248569;
	b=qsOBAlRx4kdCta6kusZatt43nEPtHh97viak9/VyF1PKgMniDYrpvGk6af6nnw9IleFD
	 jhcpCf3TK2B/W032+DSF9pk9AwyHqwtBQKL6rDxSv4/npAoxNeV7i0ENCwS4/+dCQbmoD
	 I1+mgRSEyKBuObp6iJza/Oi1itBiY24t4+S0rRP7oKh7nufmrSyCyWHbzNvotxwexBG4S
	 3mNjCucdqqwwAyWkRO9zvJFXTzI1+c/ClChDy4BtJCvWDyBgnT4OFGXa50j5CKoTiZf95
	 cJsjOE9X6cYG022KCnKWJA1xbDSAt24pzqn7usy5yHRgrQC5/mNN+L9MSAo0/fjYYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PVjD9UIIFCSC8dyfllOxWG2BIVsv90HOg6kMoCemq0M=;
	b=uW8C2FsITqJp/sdG98lyyxMbRZyACQH/9IRv0TwnBqEV2bd2LWSeZsfkqTliHmyChq1k
	 WE925ygqN2S1+pWnwcLBrUDn0rjAim+DOAvOzWybBdlUJsp5D4jwwIIzMXCX9cDSARYWP
	 wBBRU3B21KX8YbH+XmhY7Mgs89e7iZWE95e+bJI6DPRKUkM1X5j4Y9ChGEJ/itOYEoyi+
	 25Khu638a7HXyAoEAOFyRNAFZM63IUwB93XHaJ4tSCci7RpYao8zPi1zvE/t55LmEThaz
	 XKb2+q1apVtIHJwWyoNnOZkCMZZpMV/WQLPySVSTwZN9aTjhvVx8SZPugs97K9RDQyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tw+vXnuj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D3D606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tw+vXnuj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC33D1F008BF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248569;
	bh=PVjD9UIIFCSC8dyfllOxWG2BIVsv90HOg6kMoCemq0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tw+vXnujlg7ABSCPDOqiib45O61thN6NSbT6pW0gShrhPlvsjoBNurK6cM8a7KKgx
	 0wLUyfGY3TrdLLZFj/KWFOzghRjraEyr4En3fGSKkHkDmRqS/HBmCEpQLfBq+D7gbh
	 ASkA5OfPZ3+BocWSm9ijtWmstGmEXrXI+1103j+i6f6urfRRz8PTOoqok/9WErlU30
	 aT3w6lVmdOzoYnk6KJ42CVLXZajar+OqPe43h3n1o7uRZ+mfDa7dV33KtIOBlNRbA2
	 ec2uqtVhMLrnlNemvK7UESddpyIUUAlmIVgh9Qwj9mkn5kN1SvB4442QrmM5wAcZgN
	 t+IzqzV+hbcVQ==
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78fb1fb9508so864149137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:22:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwRBv5USaFwyj4bqXR3eJnJoly08a1dPUb6PJToDZPdazhXYWUQi2BFN9PE6YDywkVi8jiffJdWIdVgG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z87nctfFHfocxmZp4U2uzJNVofTys6PYyRM+9TzJgrDK0blYea/
	Xr5y8Tf5hUFcUepbtZfm30MD8Tx7D6QqpQamw7Zj/Nv49CHtP+TU2Sd71Nknl1Gm0uEezAwv+N6
	8E6pgWr/VCdTuMZX0sj70u2kMZiQTXA0=
X-Received: by 2002:a05:6102:5087:b0:7ca:5626:11e with SMTP id
 ada2fe7eead31-7d3011e4a24mr101959137.36.1794248568104; Mon, 09 Nov 2026
 10:22:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014204558.466130-1-uajain@igalia.com> <20261014204558.466130-3-uajain@igalia.com>
In-Reply-To: <20261014204558.466130-3-uajain@igalia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 19:22:34 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0htK7MdRQ3N+bNhzR5uvfxtS7g1mPvQwr1yQsoJ7qM66A@mail.gmail.com>
X-Gm-Features: AclHuK8gvI9HefgKRb-A51im7xZhO6B7JSKgS_yuv_YzzJP2XEdS1thpJ1w0130
Message-ID: <CAJZ5v0htK7MdRQ3N+bNhzR5uvfxtS7g1mPvQwr1yQsoJ7qM66A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] acpi: battery: Read Battery charge time for
 Steamdeck devices
To: Umang Jain <uajain@igalia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:44=E2=80=AFPM Umang Jain <uajain@igalia.com> wro=
te:
>
> Valve steamdeck devices can report battery status as
> charging, even when low-powered power supply is connected
> to the device. The battery status is reported as charging
> through sysfs, even though in reality, it is discharging.
>
> To handle this case, read out Battery charge time ("_BCT")
> as it is reported accurately on these devices, hence use that
> information for report charging vs discharging status.
> Battery charge time ("_BCT") with an eligible power supply unit
> will have valid values whereas with a low-powered supply unit,
> it shall report ACPI_BATTERY_VALUE_UNKNOWN. Use this as a
> differentiator to determine, whether the battery of steamdeck
> devices is really charging or not.
>
> Signed-off-by: Umang Jain <uajain@igalia.com>

I think that it would be better to merge this patch with the [1/2].

> ---
>  drivers/acpi/battery.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index fa20900bea0e..b7818695b6cb 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -242,7 +242,7 @@ static int acpi_battery_get_property(struct power_sup=
ply *psy,
>                                         : POWER_SUPPLY_STATUS_DISCHARGING=
;
>                                 return 0;
>                         }
> -               else if (battery->state & ACPI_BATTERY_STATE_CHARGING)
> +               else if (battery->state & ACPI_BATTERY_STATE_CHARGING) {
>                         /* Check the rate and capacity to validate the st=
atus. */
>                         if (!acpi_battery_is_full(battery) ||
>                             (battery->rate_now !=3D ACPI_BATTERY_VALUE_UN=
KNOWN &&
> @@ -252,6 +252,29 @@ static int acpi_battery_get_property(struct power_su=
pply *psy,
>                                 /* Full and zero rate. */
>                                 val->intval =3D POWER_SUPPLY_STATUS_NOT_C=
HARGING;
>                         }
> +
> +                       /*
> +                        * For Valve Steamdeck devices, evaluate _BCT to =
determine
> +                        * if we are really charging.
> +                        */
> +                       if (test_bit(ACPI_BATTERY_QUIRK_VALVE_STEAMDECK, =
&battery->flags) &&
> +                           acpi_has_method(battery->device->handle, "_BC=
T")) {

Can you check the _BCT presence at the time when the quirk bit is set
and avoid setting the bit when _BCT is not present?  That would allow
you to just test the bit here.

> +                               unsigned long long bct;
> +                               acpi_status status;
> +                               union acpi_object arg0 =3D { ACPI_TYPE_IN=
TEGER };
> +                               struct acpi_object_list args =3D { 1, &ar=
g0 };
> +
> +                               arg0.integer.value =3D 100;
> +                               status =3D acpi_evaluate_integer(battery-=
>device->handle, "_BCT",
> +                                                              &args, &bc=
t);
> +                               if (ACPI_FAILURE(status) || bct > ACPI_UI=
NT32_MAX)
> +                                       acpi_handle_info(battery->device-=
>handle,

This should be acpi_handle_debug(), but I'm not sure if this message
is interesting at all, especially if _BCT fails every time.  Also, it
may be confusing in the bct > ACPI_UINT32_MAX case because it may
print "success" then.

> +                                                        "_BCT evaluation=
 failed: %s",
> +                                                        acpi_format_exce=
ption(status));
> +                               else if (bct =3D=3D ACPI_BATTERY_VALUE_UN=
KNOWN)
> +                                       val->intval =3D POWER_SUPPLY_STAT=
US_DISCHARGING;
> +                       }
> +               }
>                 else if (battery->state & ACPI_BATTERY_STATE_CHARGE_LIMIT=
ING)
>                         val->intval =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
>                 else if (acpi_battery_is_charged(battery))
> --
