Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246303;
	b=rAZeSzwLZEWtkyIg9MiO2Fyn8L80tiyx6P/rIjSTMMna2L5/Gd794HRr1oaqfvGB1tmm
	 a/kvX29NJvvxUnuG1+eoo667pp7NE9IZS/4Z2+nzMIH40mDkeQr0wz46NXOJrg3PUKlsb
	 Y7WBM4UANYmeDjVul+DQVRaaLHuAr5ayP8Sxnf5RckQPSi5OZ1WaeEoUogZsOcpEHTHpM
	 KgfCu2PeonGTSP8Q7Upt33ynxQHuEHfqUEAXF4chdNybiGD7hSQLkTmIj2HCzbVmopWnD
	 E41Hvx/o2/7wPO8U3nky/vCRZSgBX2jzgxxShuM2KfSPgfNpLkjlEMatCWyYGbzKQcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246303;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tvTIiQEGOEWU0flF7t6aHKkREUisvkkIXYmx5h+gLXQ=;
	b=rDj7AyeYZW4p/twTYnrseeK7MpRt8rrCkpNiJ6J0x8sxmNUZPa9cl+2zw3QIqT7L9IB9
	 /lB/2cmOmaSSLd1fuzFAj8RdSgRkkLjdVnz2c2blJm7JjyiFzRI6zKQHF51W6LJmFYAyt
	 p8xOXciwnS48okdxc78RWzmKlsFsWHlaw1x+3qAmttCm0JRl0CLb2suE4MbMWx5bKKfZa
	 Z7bulNGpJHsKC5qlG5LOVEsM6vDKF+ZWS3uxvr3CvAWCNut1L0QcJ5E2CdSjSoDjiAAOe
	 x3TOODLveormHSYInQIW644ntm1XT9xDiFh2LqgWtKS0Ojcg1SPWlDu6VlBP4WYgX2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiaNZdMt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37AC606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiaNZdMt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A151A1F008AB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794246302;
	bh=tvTIiQEGOEWU0flF7t6aHKkREUisvkkIXYmx5h+gLXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KiaNZdMtJZmfWSh60d4QfA3OQ37nt3Jhc++izjQcPiQ8A0e1M7eXsEixyX/vEPqO9
	 F6VFAfUtVQB/Xcjyc6gATovUgsFyYgUti7tTmbTzLO/IRsafqQhlOT8fSSnCKpBV0F
	 3hgHhoEN+xtlqU1hUBHPMIWRVjupklF7GUAvhhEvNBPxuICisz+KOz06GjNupAL5Pp
	 7DYKGyYzoqH5hQiNOFTE9kOAmFAiw8UnZ2MGW9mZU0PfYPidSiQmumqdOXthTJa2+e
	 C52bTiScNwIDqpy0vvIf38zchYkLP/9a6+XayAKABFL2fdSmmibdj4pVKSddn/NX+i
	 LCRG5+gPGlZmg==
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso385333e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:45:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE/odxv8FJPFolJKntJpOC/mmBDuQ3c8Vk3NYzQ5TBtFodNf6qw8XuMAu4Iu84d31jRPjo0K0yuHeY+cUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mn0FrdSGvbxhSF36ECYUFzCgWgDGJ1XwnxiCLstVpLV/v8Bo7
	vuS8TO27v7pZj26A79L8Y2fdLzVEUH0hgFRBOU3GloxQUGi+YOKax+q3aMSfDOWS5Sx8oKahKJS
	Xiju5gl0zE+olKH6XmaKUg68Ams/2V1s=
X-Received: by 2002:a05:6123:109:b0:5c9:66f7:2f23 with SMTP id
 71dfb90a1353d-5ece7144366mr1578911e0c.2.1794246301761; Mon, 09 Nov 2026
 09:45:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013063856.1755787-1-liujinlong176@163.com> <20261014015034.2248352-1-liujinlong176@163.com>
In-Reply-To: <20261014015034.2248352-1-liujinlong176@163.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 18:44:47 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hvn3ttLKeEMVrLy8uz=goaQH8hVmWLaDTEb6So2oAJOw@mail.gmail.com>
X-Gm-Features: AclHuK8XrsETT6WVH283I15CkZltdafQ-ZSMOqyWWmhM57V1PLqPwgGaffyVU0A
Message-ID: <CAJZ5v0hvn3ttLKeEMVrLy8uz=goaQH8hVmWLaDTEb6So2oAJOw@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: button: Evaluate _PSB to determine power button state
To: liujinlong176@163.com
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, liujinlong <liujinlong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 3:50=E2=80=AFAM <liujinlong176@163.com> wrote:
>
> From: liujinlong <liujinlong@kylinos.cn>
>
> The ACPI button driver always synthesizes a press followed by an
> immediate release upon receiving a 0x80 notify.  This prevents
> userspace from determining the actual duration of a power button
> press.
>
> When the 0x80 notification is received, evaluate the _PSB control
> method if present.  If _PSB returns 1, report only a key press; if
> it returns 0, report only a key release.  If _PSB is not available,
> fall back to the existing press+release behavior for compatibility
> with firmware that does not implement it.

_PSB is not defined in the ACPI specification AFAICS.

What is it and where is it defined?

> Signed-off-by: liujinlong <liujinlong@kylinos.cn>
>
> --- changes in v2:
>  - Dropped the new ACPI notify values 0x81/0x82 per Rafael's
>    feedback, as they would require an ACPI specification update.
>  - Instead, evaluate the _PSB control method upon receiving the
>    existing 0x80 notification to determine the real button state.
>  - No longer touches include/acpi/button.h.
> ---
>  drivers/acpi/button.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
> index cdbb1023a8ee..2d079703899b 100644
> --- a/drivers/acpi/button.c
> +++ b/drivers/acpi/button.c
> @@ -456,12 +456,25 @@ static void acpi_lid_notify(acpi_handle handle, u32=
 event, void *data)
>         acpi_lid_update_state(button, true);
>  }
>
> +static int acpi_button_evaluate_state(acpi_handle handle)
> +{
> +       unsigned long long state;
> +       acpi_status status;
> +
> +       status =3D acpi_evaluate_integer(handle, "_PSB", NULL, &state);
> +       if (ACPI_FAILURE(status))
> +               return -ENODEV;
> +
> +       return !!state;
> +}
> +
>  static void acpi_button_notify(acpi_handle handle, u32 event, void *data=
)
>  {
>         struct acpi_button *button =3D data;
>         struct acpi_device *device =3D button->adev;
>         struct input_dev *input;
>         int keycode;
> +       int state;
>
>         switch (event) {
>         case ACPI_BUTTON_NOTIFY_STATUS:
> @@ -482,10 +495,18 @@ static void acpi_button_notify(acpi_handle handle, =
u32 event, void *data)
>         input =3D button->input;
>         keycode =3D test_bit(KEY_SLEEP, input->keybit) ? KEY_SLEEP : KEY_=
POWER;
>
> -       input_report_key(input, keycode, 1);
> -       input_sync(input);
> -       input_report_key(input, keycode, 0);
> -       input_sync(input);
> +       state =3D acpi_button_evaluate_state(device->handle);
> +       if (state < 0) {
> +               /* No _PSB method, synthesize a press+release */
> +               input_report_key(input, keycode, 1);
> +               input_sync(input);
> +               input_report_key(input, keycode, 0);
> +               input_sync(input);
> +       } else {
> +               /* _PSB returns 1 =3D pressed, 0 =3D released */
> +               input_report_key(input, keycode, state ? 1 : 0);
> +               input_sync(input);
> +       }
>
>         acpi_bus_generate_netlink_event(button->class, dev_name(&device->=
dev),
>                                         event, ++button->pushed);
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
>
