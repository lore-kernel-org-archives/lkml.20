Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251046;
	b=criVAkDt/a8sJxELFWYc4jdUHfOzrZyfXe+OXqasnI/Zj2BwlNORDLxRlNyF9Wc2mQMM
	 l2l9kV4oni4i4eruoJuRCkeTQtGbWnE9VaeNBVdF2f9eWuIphDoG3YkRryS36F2MPrhIA
	 ijeFPh/4LORYzODV9C3Qx0MCZBFa+pSjieIPl/yJei9svPug+yvSTvi9G2w01g+BWI2T1
	 barKC82dVvRL4OPHR89DNyiU/G4YOaQN1vVgpItnpi9SADLB34b/0N1EvOK4DOXt7oEbD
	 TtKYiDksFblY0cZGiwMZJwflkGc54nEpi/TKzpM7t+tihG/GhzYbl9ak71GCZR23pag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251046;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ddDpqHN8JMlGYqqaMYsS2gQ4WMRnoqKhbmSdNjKCYaw=;
	b=19uJ4LNA5VqtJyJdpM/txOSf3GHzCx4qH2j+/VK8J/7L7ZjTLt6R9hGAm4GKCDnLmZWg
	 wV2WUNQFh7w8Art1R/tXsxge0X9/NQnHzua8QnMoffmXkNIDUUWMEpMM62GxZVh+YDVr1
	 0JIKvmz5gCZXi3Qnm2Ak8zlpNfwArSJh5+ny6ujQkcPSKsElvxcUNTw2gzrUsu1GLtL6x
	 C22J/tpZtZ3u6tf4KGSLO8xKhRi7+IM3jmoC95W4yWRCECRBQw4CmCcDfvZYenv9s9vV8
	 TLzp3zDaSXpCjv5RPBnVPS1skN3Mg3yMxlpkJLrPEIvjr3Dr12owiEpcZjQfxa3Y40w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EilmE4fY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B68606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EilmE4fY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286361F008A3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251045;
	bh=ddDpqHN8JMlGYqqaMYsS2gQ4WMRnoqKhbmSdNjKCYaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EilmE4fYEHbdQVuvHGBp4GUDdJ+lB3EpIywbmEGKbEugMjM/NPr9az+FNp7k6/25A
	 4pOGUoqF4IwuCSgFNF908+vwfiqfdf6vBYxcKQR5PSz0SK+hzE9uuV5Yd4x/wRoAHC
	 Tquo6ffZTtOsuTaAS6kOz1xSTB9qMaymvA8z+P3KfhvBj+JIIkZtVUgDAH08BpMS3B
	 pJPILsw6PKLwdCuGAqoAwNaTzeQ2uRgF0w7Nutw1QqnknCP1A4/GZTpgR1sdMT70oW
	 wpzpIq2rUEwH7Yq8aicyqy60NRV+ALXXMLDab8rqwgGQ5Y3bEC/VidzbLLY9VO90BP
	 v8pVx7h/Vp8hw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c10dc41270so1055418e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:04:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH8EXbMqhEzIXRE8HcM06r7G8fICVwG2MYXd37eheNuK4EPJtm2vJ2A8ia6Rs35Nhqvn/9UTnM9d9IbwLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C2tpekBbEta5PyXSG0lGGZ9HplfboncBGRvS07+57FemP99oF
	B3c7lUTtxuJCSZBcHeN2ETR0EJgQF8SYQRc3A9jTyPeZz9IdTkncBBLt+O+XKv2qtw5bwDB/tn3
	FfN7TbxFvlGDr4ycnAAExvGRSo7M/Erg=
X-Received: by 2002:a05:6512:1395:b0:5c0:e5:7e49 with SMTP id
 2adb3069b0e04-5c156ed8345mr70112e87.44.1794251043503; Mon, 09 Nov 2026
 11:04:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015204450.1270-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261015204450.1270-1-atharvatiwarilinuxdev@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 20:03:51 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hmEjG4pqst5SgD4mKncUAFgvJ_ZRbzQ6htXyWV-pftvw@mail.gmail.com>
X-Gm-Features: AclHuK--g_rgeQVvXE21BjxlcSk-Qh41OeZUkIE3HOwkyV0SN1WdI_6ZYKRXKVc
Message-ID: <CAJZ5v0hmEjG4pqst5SgD4mKncUAFgvJ_ZRbzQ6htXyWV-pftvw@mail.gmail.com>
Subject: Re: [PATCH RESEND] ACPI: processor: Use Apple-specific methods for P/C-states
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 10:45=E2=80=AFPM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> Use APSS and ACST instead of _PSS and _CST when available on Intel Macs.
> These methods are used in X86PlatformPlugin.kext, and when not found we
> fallback to generic _PSS and _CST methods.
>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  drivers/acpi/acpi_processor.c    | 22 +++++++++++++++++-----
>  drivers/acpi/processor_perflib.c | 10 ++++++++++
>  2 files changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.=
c
> index 5fbab5417..782676ef7 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -18,6 +18,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform_data/x86/apple.h>
>  #include <linux/platform_device.h>
>
>  #include <acpi/processor.h>
> @@ -837,27 +838,38 @@ int acpi_processor_evaluate_cst(acpi_handle handle,=
 u32 cpu,
>         acpi_status status;
>         u64 count;
>         int last_index =3D 0;
> -       int i, ret =3D 0;
> +       int i, ret =3D 0, base =3D 0;
>
> +       if (x86_apple_machine) {
> +               status =3D acpi_evaluate_object(handle, "ACST", NULL, &bu=
ffer);
> +               if (ACPI_SUCCESS(status)) {
> +                       base =3D 1; /* ACST is a 4 field variable we need=
 to skip the first field */

s/variable/package/ in the comment.

> +                       goto success;
> +               }
> +
> +               buffer.length =3D ACPI_ALLOCATE_BUFFER;
> +               buffer.pointer =3D NULL;
> +       }

I'd put the above into a separate function returning 1 on success and
0 on failure, say acpi_processor_apple_acst(), that would also reset
the buffer on failures, so the code in acpi_processor_evaluate_cst()
can be something like

base =3D acpi_processor_apple_acst(handle, &buffer);
if (!base) {

>         status =3D acpi_evaluate_object(handle, "_CST", NULL, &buffer);
>         if (ACPI_FAILURE(status)) {
>                 acpi_handle_debug(handle, "No _CST\n");
>                 return -ENODEV;
>         }
> +success:
>
>         cst =3D buffer.pointer;
>
>         /* There must be at least 2 elements. */

The above comment is not applicable to the ACST case, is it?

> -       if (!cst || cst->type !=3D ACPI_TYPE_PACKAGE || cst->package.coun=
t < 2) {
> +       if (!cst || cst->type !=3D ACPI_TYPE_PACKAGE || cst->package.coun=
t < base + 2) {
>                 acpi_handle_warn(handle, "Invalid _CST output\n");

You should also avoid printing "_CST" in this message if _CST is not
actually used (and analogously below).

>                 ret =3D -EFAULT;
>                 goto end;
>         }
>
> -       count =3D cst->package.elements[0].integer.value;
> +       count =3D cst->package.elements[base].integer.value;
>
>         /* Validate the number of C-states. */
> -       if (count < 1 || count !=3D cst->package.count - 1) {
> +       if (count < 1 || count !=3D cst->package.count - 1 - base) {
>                 acpi_handle_warn(handle, "Inconsistent _CST data\n");
>                 ret =3D -EFAULT;
>                 goto end;
> @@ -882,7 +894,7 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u=
32 cpu,
>
>                 memset(&cx, 0, sizeof(cx));
>
> -               element =3D &cst->package.elements[i];
> +               element =3D &cst->package.elements[base + i];
>                 if (element->type !=3D ACPI_TYPE_PACKAGE) {
>                         acpi_handle_info(handle, "_CST C%d type(%x) is no=
t package, skip...\n",
>                                          i, element->type);
> diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_pe=
rflib.c
> index 9e25d6124..b4b36e60d 100644
> --- a/drivers/acpi/processor_perflib.c
> +++ b/drivers/acpi/processor_perflib.c
> @@ -17,6 +17,7 @@
>  #include <linux/cpufreq.h>
>  #include <linux/slab.h>
>  #include <linux/acpi.h>
> +#include <linux/platform_data/x86/apple.h>
>  #include <acpi/processor.h>
>  #ifdef CONFIG_X86
>  #include <asm/cpufeature.h>
> @@ -324,11 +325,20 @@ static int acpi_processor_get_performance_states(st=
ruct acpi_processor *pr)
>         int i;
>         int last_invalid =3D -1;
>
> +       if (x86_apple_machine) {
> +               status =3D acpi_evaluate_object(pr->handle, "APSS", NULL,=
 &buffer);
> +               if (ACPI_SUCCESS(status))
> +                       goto success;

In analogy with the above, I'd introduce acpi_evaluate_apple_apss(),
so the code here can be written as

if (!acpi_evaluate_apple_apss(pr->handle, &buffer)) {
        status =3D acpi_evaluate_object(pr->handle, "_PSS", NULL, &buffer);

etc.

> +
> +               buffer.length =3D ACPI_ALLOCATE_BUFFER;
> +               buffer.pointer =3D NULL;
> +       }
>         status =3D acpi_evaluate_object(pr->handle, "_PSS", NULL, &buffer=
);
>         if (ACPI_FAILURE(status)) {
>                 acpi_evaluation_failure_warn(pr->handle, "_PSS", status);
>                 return -ENODEV;
>         }
> +success:
>
>         pss =3D buffer.pointer;
>         if (!pss || pss->type !=3D ACPI_TYPE_PACKAGE) {
> --

And there are diagnostic messages below mentioning _PSS directly that
should not mention it when it is not actually used.
