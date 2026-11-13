Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581714;
	b=YV+apxFEYT2C/yv69JtQbnoULKbXbxLFN6lMUrhdaVHJT166RkSfwHQ8ow375mHW6HQP
	 Z5S9UWDiOnr1QQL8au98YPM+VMfuf7Fgs1lv+JWwh4cJY/tiH11K0+F66FkE5DJn0et42
	 txolDp15ABB8cTRrr8x3MO9f6iGOQ+JerqzHH4BLdks+/juhs5/Pj5MVeZQbGStX2ewS4
	 A4OAsHfLjNdmt3Q+M7G25ZR69BegHYaPzFX6wDC1QVE+w9NyvIonIIpt8LCz99T5YY+pP
	 E0GFShTnhYNtt7YT04P1QDPj8dVGh9Q4LY2ELCoZe5Tkow5vs8p25ZUduWi+52safkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581714;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8nxha2BknqjImD1m3gCjlKPZ0GD4hnrRTt8W76a9ZRs=;
	b=UZxuxUxKTvSyGuEFMCmyzfzNOPNxqOIT64fH03R2LG9TPhRg179kXgqvXxWbXS00jR/u
	 kQXbOuRFyEb1pe+yb6E0hxvXFduP9xgWDXwiixf7mBjD7WiVhvYbstdg7FKcQEsRfybgg
	 cqD4VXrn22ySHPNAekTnECKjAenhfZbUMVk1HcAfy1PSFSuKu2y5WlmRXzMRuQRu+06NJ
	 wEnG6hHUCLCcRyTKpcEYL9SSuR34Hv3ze8i4dJgQIoANxHWsTCLZZxPLFD+s95wIDWguu
	 omS/aU6hhbqNKB4o3DAxuQ0vGMMKufWDglHo0xS8lb2DQ/Y/3vFEaEp7NLBMA2kKA2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2gnOm9L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96319606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2gnOm9L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C08B1F000C8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581714;
	bh=8nxha2BknqjImD1m3gCjlKPZ0GD4hnrRTt8W76a9ZRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2gnOm9Lr2v6ieEmflTcP/hrwQ3R/gmve616RQzut3y56AklNoa8Nepc5oieIWO0O
	 All0nPILllMFQrmuChDy5DHUuFf6Nkal25WkGBgPF8G1w+G/EgZHf3nI8ofZNRMqN0
	 uZ6Oh8wIG8zKXPpANpGwH3GE40RUBJzowIZ3jbMyo7JfJhKhjQfF1nKhylRrMqz5Wk
	 lbq+lavh04Qln0boNyefsPtIEcKZ3P1ZRfzgCGRMLd7Er6MdJkXff96EssYIw1+9q9
	 zkiGvZBE2t1dCjt95mX9NdqlmiHfhFbmkp8KVRoO1tqjFVCccFeWmXlSBa+l3Kmhph
	 io3F65lfAhsyg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ad5529ae64so15268941fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:55:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGOL7LJ88yQHnsyq0nrjj9AJvx4NP1AqKIQgk1xGwVcauJJXJ76oqw4FNKrqJAd8BQEdr6vfinu8JBDpn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RN9rW+qkOwistzXuf5nWg2A+53QZm/9GVIDbLYfLj+Ad8McEP
	SyDSJ0BxKHNds9uA1q8Bx/7vHh1m4qQ2/WbmTS9RkTp2MxiBYUDVGqNfU73FdevqtxMDfqGSrFF
	ifwSJtWgPfx1kPGGyr3JtW360TJ26wds=
X-Received: by 2002:a2e:a814:0:b0:3ac:f011:4863 with SMTP id
 38308e7fff4ca-3ae2b51f00emr10078261fa.20.1794581712678; Fri, 13 Nov 2026
 06:55:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113130411.1433174-1-christian.loehle@arm.com> <30a6c6c2-95ad-4f98-a63e-25f311967ed8@kernel.org>
In-Reply-To: <30a6c6c2-95ad-4f98-a63e-25f311967ed8@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 15:55:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hDkVA50qgMPn0H1NYUj7mK+VB9=w9Dr4GVV5ix8V0bSg@mail.gmail.com>
X-Gm-Features: AclHuK8xHLw6WuiwLQ7pOVG6xG517KuCsdiV2zbyhBwshX3MDuG4Phwds6Ak4-s
Message-ID: <CAJZ5v0hDkVA50qgMPn0H1NYUj7mK+VB9=w9Dr4GVV5ix8V0bSg@mail.gmail.com>
Subject: Re: [PATCH] ACPI: CPPC: Reject EPP registers narrower than 8 bits
To: Mario Limonciello <superm1@kernel.org>, Christian Loehle <christian.loehle@arm.com>
Cc: viresh.kumar@linaro.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumitg@nvidia.com, luoxueqin@kylinos.cn, 
	zhanjie9@hisilicon.com, zhangpengjie2@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:52=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> On 11/13/26 07:04, Christian Loehle wrote:
> > The EPP interfaces use an 8-bit preference, but ACPI permits narrower
> > fields. With a 4- or 6-bit SystemMemory field, writing 128 succeeds but
> > stores zero, requesting maximum performance instead.
> >
> > Reject a present EPP register narrower than eight bits during _CPC prob=
e.
> > Use the existing error path to release previously acquired resources an=
d
> > leave the CPU's CPPC descriptor unpublished. Keep absent EPP entries an=
d
> > registers at least eight bits wide on their existing paths.
> >
> > Fail the whole probe instead of disabling only EPP. This also makes
> > amd-pstate's acpi_cpc_valid() check reject the platform before register=
ing
> > its MSR or shared-memory driver. No affected hardware is known or
> > expected and the specification is expected to no longer permit these
> > in the future.
> >
> > Fixes: 922607a2b462 ("cpufreq: CPPC: Add support for autonomous selecti=
on")
> > Link: https://github.com/tianocore/edk2/issues/10838
> > Signed-off-by: Christian Loehle <christian.loehle@arm.com>
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Applied as 7.4-rc material, thanks!

> > ---
> >   drivers/acpi/cppc_acpi.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> > index 11a9f9eb6b4a..4c3d5778e428 100644
> > --- a/drivers/acpi/cppc_acpi.c
> > +++ b/drivers/acpi/cppc_acpi.c
> > @@ -2094,6 +2094,15 @@ int acpi_cppc_processor_probe(struct acpi_proces=
sor *pr)
> >                       cpc_apply_platform_quirks(gas_t, i - 2,
> >                                                 platform_quirks);
> >
> > +                     /* EPP interfaces require the full 0-255 preferen=
ce range. */
> > +                     if (i - 2 =3D=3D ENERGY_PERF && gas_t->bit_width =
< 8 &&
> > +                         !IS_NULL_REG(gas_t)) {
> > +                             pr_debug("CPU%d: EPP register width %u is=
 not supported\n",
> > +                                      pr->id, gas_t->bit_width);
> > +                             ret =3D -EOPNOTSUPP;
> > +                             goto out_free;
> > +                     }
> > +
> >                       /*
> >                        * The PCC Subspace index is encoded inside
> >                        * the CPC table entries. The same PCC index
>
