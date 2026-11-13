Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540390;
	b=hXFSFtQVjGi6I+LstlS5ie76SOD9VpHCx4WFQO/dIbxG8apKWGHCFdCQwf2yrcK0IOTo
	 z5Nor1kp+QTL5FzqRZeS27x2dHwYC2UeJbGSRJfRCHjHeLx57SJKbb2YODEw90qpbwDG4
	 SLm4RIW1adJs2HI6fCEgb9YMf3hlaGG74CDKwKUQITmMGkQlkGXtXjnI+YRaRPUYka3qb
	 4wm5QvCkNoG3EDvqJhmQYan21yzAGfW2c6P1TFpHvmiyc4OtAW4eOBK0xthV6P8hevP7r
	 wTE44MhcfX017pJ/mMQaO8mU53KJXlxoTs0L4UkfQc8QOifnScJQ2kEaSOIN3hPLdRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
	b=1qlHtRcRIxmrj1iMSaTgtvkrAdG70RBV9YTRe6vzALhLyK7T5AS36vWUX5rKh9zKS4F6
	 UseHgjDsuv1ml7FTzxaaLuTw5t4hOO414aaINmmBHnR+gWaHrr8Gb0hGvAZBwUi4vt2xc
	 LI6SIMektFROdwvSxSxQaK/XfAkkD1FHN+f9GzX7E4RHfashNmAjUZj/h26QsFvnPxBeq
	 I9emjXrD6g7u3UW6rCiw1BgYWnVZJqPe8MklPMEg+PhnfvZ7Lo0pviHFeCvk3leQugDvj
	 ZqnK3lZWSMA3uYog/pG4AKeoh+x6fpo4fK8kYzIZj3Qx0t98Gh8RXYXwONJfmDTv8Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kxN73p8o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698AC606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698AC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kxN73p8o
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 72B5440CD5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794540382;
	bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kxN73p8oSR5vGLoJc/vys9znvxLI91UCrlejOnyW+sCZDzxkkBoLWm97eknDcm3gd
	 xxCf9sjm1b8mJGHm3K5ee39RupQxZd7XAgy9xNG+WF80FYV67ZBjQCyMYTOjO2nAMF
	 LXCtbJXTAfaqYxDaHONyPxIZ5Kh03G+5b/FJ9nGMMpZz6KN+zpDzaiYvjjZxeMwDRi
	 ZlsBo77vx20S5G0KU7Ff/3brreORJSAuGxVtBC+84OirxLYxSAxbGRH7yeuUSui7UP
	 UG7xYtstKAQxuKxkcm0wpiVueaD/3ZSQ8zGrGn11wlyS3ZGEjtiPr33/KLNdJWdhDm
	 8cIludxtDIV3DOROfM2xcqoq1Gx5MSzLKfUoPZ4sP/PbCkWPBxMrcC0zficIAn6xu2
	 OsOGSg/PN9HCy4MCoVOpZ3+4t6CHxnwdckYfKiGWSSyHJr4Wq9/WPiXkE3BQVondPl
	 iY2eQFSXLUagkpTX1ShwJYXtb6l7Q1q9aaR7vBJG5DLNiLBSh4zeFqOrxoQSNoXGzN
	 aBy/Nc6tFTFHNWSOzCne4vkHfM0u38/Alyfez94vSjRJ5q7iiEpp+Zf8AOYP4yuDYq
	 bwOQZsxoeFz5PlYVtjqNEzVEI4Ra3yPQ3h9yarHNv1tDfl+EjKVtwDIPYyA8ohEGtW
	 VHVjI5jhlhifBqso6kfoh6qg=
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso304465c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540381; cv=none;
        d=google.com; s=arc-20260327;
        b=cakXAFNl3bry4obMlmmUTj03VPuMPeA/YbsvEwt8IjyS+ecAn/LSQPuFzMvQQHzTL5
         pcUg+G78qpvfO+xaEzMQ2IlGZrWQ13JczBvskjAybRMgGKbmLYZoZ5hsMdXRmJNUEJpq
         n/YNRQJKvoTukGHd/jfxzONqRI6Ukl1woroMHPLNDIz1UFx5FFReVFD8e6IfjRtlQyd+
         v10luEeeAIqmNUDAhplJ7kidVPKRzsTQDgN6SXDvTH/X6N5WIQFCQfGggiOjKDnVEkK+
         5B3IF0wweDoX6QIeWY8MTGGoKV6Ql5RuSvApOBm+oPxDnuYTi5GPPQw19Ant/Ux5+1kY
         RpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
        fh=tRjrDB5UT1DdNe7UDe1LCHFTA9I69AXnj+FQtIyGYVw=;
        b=PAhC7bE1fD/7GenKq/wBfXE1aYr+S/OLDTcHUwCpn+PG1j9E82/nRNeu26yf9SdUgb
         hxS+CHd6XM1ZzDpfqYxPJcHQnMpWv5KBXAwdFSxOEXxOAt14rHKjrmUK08SOLc8/MR8f
         8/oukpPElGmgn9AL3N4boK6Kk7OGZZHRFY0nWEUluAQhiobPnxu9xfAG1e5qo2XcrbkW
         g+56PdKIi0RfjFeqWEdAzsfSKSaKm4yg5DTUTFlVdMJpfkX4qWhPZBNPIeGNrBytuxo8
         chzEEhZDrW99granz/3B8TUR1WaawFXKrAkd3zmtiYxLIpajwHzgI0KuAyjcM0nwjAmX
         U35Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540381; x=1795145181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
        b=OcpCSGdaCOyCfP0rXUatrkBYCqmiSghD0Is8G5Mwse1houJ1BDnHEcPwE4VSuV8Y6D
         FdS5JLYSRsUXi9ctLQHsgGVxLO00bbWhvscMCbnZJhhe1q7zZ7db2NFykCZ8yl4rdcAM
         sDCvSjGBi0hCK0FPKZoes4t0L3kTgkvk57PKQz3wDQ4vqt5UWT50RRykZysGJW6fWkgZ
         PMge2tli5ACah/bCX19ffprzKsfeA+VwOGYaknWtiGQhNygF8MGVf23aw+9nUZC7uCya
         rmMVmjiBd2Su3/bO9WxGuoRFoT4lgRE+jS2LDpNhrA33cvDpLP+7r3kz+s+UHQ+2DuEH
         NfHQ==
X-Forwarded-Encrypted: i=1; AL+hErEP0Ac/qNlAFQ7BKWRjc8YVaBdgg84FF+gu6g3k1vNkQLM38Asf77YOG785FdPPB9k3d5iytHNH7ZhsjsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/foVRt62/14R/yYCYkLrGX9K8unocCOEHcWimz2VQV/budf1J2
	4K+wz2q0z+w902JuR4YY6DcCEuBNB/FEekPp2olkCxURzV1mCjKZl3+n9toFcXGc8+SZw+8Nf/T
	OjgtN8R62V6E+1qn09sShUe1FWdK3N815BEGsBok19EjscSWExkMG1UaT2qCvqz/RJ42uI+jgBe
	XfUeDg5VAYgApyDoOEcEvQzlUOjvNisyS9Qg/l30NwD5/aADBN1FQ/mk/1
X-Gm-Gg: AYBFou2/EwYQxJHiZ3pzWP8Yt5MW0bM+o9QEEnL4GCheTUS0dOuBUMBBVDtRRJAfutI
	RGCNo5dMIxSEl1sm/+NM+KLuVXpqmuv+w6IyzzUqiOU3E2dBFuOckEkg638o6Oy0Kj/KYGooTgp
	0mvIfrFvfCzANt9GTgWnL/0+usZiaovNTGnnCJyT87oRzRheqmbLJmivGbw4EKttVjW2kiWVKEW
	QUAcfJ2JMzHquB58CZFGIJRyL1WioS+nA28fwF1oNC3IMh+BqhGyQ2gnd0eNR7Q2BlbwKpAUD4U
	/Zn+w9RYzeGu4Qd8T4TsXwzCP/OXbJqGdrpKAbmB7UIRJ1xVH3eu8jueE2DDiyf6DQGLtQPf
X-Received: by 2002:a05:701b:2094:10b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1b5030eb08fmr1338577c88.38.1794540380512;
        Thu, 12 Nov 2026 19:26:20 -0800 (PST)
X-Received: by 2002:a05:701b:2094:10b0:19e:1ad9:1c2 with SMTP id
 a92af1059eb24-1b5030eb08fmr1338552c88.38.1794540379945; Thu, 12 Nov 2026
 19:26:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112074823.853819-1-aaron.ma@canonical.com> <68B20AF1-0037-4810-98B8-49E3CBF17E92@gmail.com>
In-Reply-To: <68B20AF1-0037-4810-98B8-49E3CBF17E92@gmail.com>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 13 Nov 2026 11:26:08 +0800
X-Gm-Features: AclHuK9NY09oDT-JYI6FSoxGBV8nu19hty2L1c694GHrFMFgqBAzTGZC1cOlY7U
Message-ID: <CAJ6xRxWvxd72y5zAsEC-Qs2_R8fBekVTJas3OfYe8owEvE39Dg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Rong Zhang <i@rong.moe>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 10:46=E2=80=AFPM Derek J. Clark
<derekjohn.clark@gmail.com> wrote:
>
> On November 11, 2026 11:48:23 PM PST, Aaron Ma <aaron.ma@canonical.com> w=
rote:
> >ThinkPads expose battery charge thresholds and charge_behaviour through
> >thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> >Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> >charge_behaviour and charge_types on systems advertising those WMI
> >capabilities.
> >
> >When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> >duplicate charge_behaviour sysfs attribute and unregisters its battery
> >extension. Conversely, registering or updating any power_supply_ext on
> >the same battery runs sysfs_update_groups(), which removes standard
> >power-supply attributes not owned by power_supply_core and wipes out
> >thinkpad_acpi's charge_control_start_threshold,
> >charge_control_end_threshold, and charge_behaviour files.
> >
> >Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> >thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> >table check when the corresponding driver is enabled in Kconfig, and
> >update the force_load_psy_ext description accordingly.
> >
> >Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery c=
harge limiting")
> >Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>
> Hi Aaron,
>
> Looks good, thanks. I'll test it in a couple of days. I have one question=
 below but it's not blocking for me, I just want to check my assumption is =
correct.
>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
>
> >---
> >Changes in v2:
> >- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
> >  device IDs, method pairs, and driver configuration checks, as suggeste=
d
> >  by Derek J. Clark.
> >- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
> >  instead of relying only on ThinkPad ACPI device presence.
> >- Check whether the corresponding driver is enabled before looking up
> >  its ACPI device, including for ideapad_laptop.
> >- Update the force_load_psy_ext description to cover both drivers.
> >
> >v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-=
aaron.ma@canonical.com/
> >
> > drivers/platform/x86/lenovo/wmi-other.c | 51 ++++++++++++++++++-------
> > 1 file changed, 38 insertions(+), 13 deletions(-)
> >
> >diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/=
x86/lenovo/wmi-other.c
> >index bd64e7b44669d..14b2c3f4cc7ae 100644
> >--- a/drivers/platform/x86/lenovo/wmi-other.c
> >+++ b/drivers/platform/x86/lenovo/wmi-other.c
> >@@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> > static bool force_load_psy_ext;
> > module_param(force_load_psy_ext, bool, 0444);
> > MODULE_PARM_DESC(force_load_psy_ext,
> >-      "This option will skip checking if the ideapad_laptop driver will=
 conflict "
> >+      "This option will skip checking if the ideapad_laptop or thinkpad=
_acpi driver will conflict "
> >       "with adding an extension to set the battery charge behavior and =
battery charge "
> >       "control end threshold. It will also skip checking if the BIOS re=
ports that "
> >-      "those features are fully supported. It is recommended to blackli=
st the ideapad "
> >+      "those features are fully supported. It is recommended to blackli=
st the conflicting "
> >       "driver before using this option.");
> >
> > /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & f=
an) =3D=3D=3D=3D=3D=3D=3D=3D */
> >@@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle han=
dle, u32 lvl,
> >       return AE_CTRL_TERMINATE;
> > }
> >
> >+struct lwmi_psy_deconflict {
> >+      const char *hid;
> >+      char * const *methods;
> >+      bool driver_enabled;
> >+};
> >+
> >+static char * const lwmi_ideapad_psy_methods[] =3D { "GBMD", "SBMC" };
> >+static char * const lwmi_thinkpad_psy_methods[] =3D { "BDSG", "BICG" };
> >+
> >+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D =
{
> >+      { "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_=
LAPTOP) },
> >+      { "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> >+      { "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> >+      { "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> >+};
> >+
> > /**
> >  * lwmi_om_psy_ext_init() - Hooks power supply extension to device batt=
ery
> >  * @priv: Pointer to the lwmi_om_priv drvdata.
> >  *
> >- * Checks if the ideapad_laptop driver is going to manage charge attrib=
utes first,
> >- * then if not, hooks the battery to our WMI methods if they are suppor=
ted.
> >+ * Checks if the ideapad_laptop or thinkpad_acpi driver is going to man=
age
> >+ * charge attributes first, then if not, hooks the battery to our WMI m=
ethods
> >+ * if they are supported.
> >  */
> > static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> > {
> >-      static const char * const ideapad_hid =3D "VPC2004";
> >-      acpi_handle handle =3D NULL;
>
> I'm assuming this was moved to avoid handling cleanup each loop?
>

 Hi Derek,
Thanks for the review.
moving `handle =3D NULL` into the loop ensures it is reset on each iteratio=
n.

Thanks,
Aaron


> Thanks,
> - Derek
>
> >       unsigned int props =3D 0;
> >       int ret;
> >
> >@@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pr=
iv *priv)
> >       if (force_load_psy_ext)
> >               goto load_psy_ext;
> >
> >-      /* Deconflict ideapad_laptop driver */
> >-      ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, N=
ULL);
> >-      if (ret)
> >-              return;
> >+      for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_lis=
t); i++) {
> >+              const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_dec=
onflict_list[i];
> >+              acpi_handle handle =3D NULL;
> >
> >-      if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(=
handle, "SBMC")) {
> >-              dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages =
battery for device\n");
> >-              return;
> >+              if (!entry->driver_enabled)
> >+                      continue;
> >+
> >+              ret =3D acpi_get_devices(entry->hid, lwmi_acpi_match, &ha=
ndle, NULL);
> >+              if (ret || !handle)
> >+                      continue;
> >+
> >+              if (acpi_has_method(handle, entry->methods[0]) &&
> >+                  acpi_has_method(handle, entry->methods[1])) {
> >+                      dev_dbg(&priv->wdev->dev,
> >+                              "ACPI device %s manages battery for devic=
e\n",
> >+                              entry->hid);
> >+                      return;
> >+              }
> >       }
> >
> > load_psy_ext:
>
