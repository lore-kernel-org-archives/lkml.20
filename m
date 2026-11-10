Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330318;
	b=nHvl7lAXBOofYm812ifTnATeu0NKZEp1lvk8LeM6/d5MkRKmDZQSLZ1gTbOwWIdw54GK
	 +xnvnIsPSWWVTJJitKTEhBxUV298mnzGGd5WpZOlN1HRdBpM0iwa2Bc0tYGRS+l1KiMwv
	 Sx7ZvoNFgutTA4+mWIIEtBOsk3kdAoLv3SxdIiyAcMzXx77Y/9LIvP/MaSOSUpxgO7TEW
	 rF9sMRBlQAtnW4EniJsM4ZVxvEOEXIWcZniOUvPh5axAlZ/raBiKaJAcfxtiO7TUM1+i3
	 gfA+99JAEZk65kQyIZy9P8VQV4P1uvPzydCZD21cx+uxLUxSkFT+GbFMDkZAfI5pxJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330318;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uB4ZLTKdeIOszVbl3ScpQcZZ6kYQypB/7bAvtfA4px0=;
	b=Aq6tpHYq7b4HHo6Gd6tVj1xiS8FyACluf2BWw9rWAlYMDzpvtO8keqPcaZI9G7m2v6xM
	 P8MKl3LhF1FpIUR3PPKvxbp27c5qq504VVn5b52Rj5fXSig4e2W/IXYnFMRqz/H6FJDQx
	 GE7S2RpVXGhl0YBR7LxLYFNv3aJeVkkvOeUPJQDUb1F2AjU3VN/UGQCgnDegMtpIZFu9Z
	 ndCMCOf6CNqW9coqiEZlEA8irrow2eWc1hcX1p+IaP4ci6sp0rj3M3nEgN28O0W72x3Ds
	 lYQnnewtXynEw4awgOqp3gQfS0Y2Gu8FbJfHcrB1Be+uesKuBPU04KSOoWH5S3yAeVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XpIJYiT+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA73A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XpIJYiT+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C951F008A1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794330317;
	bh=uB4ZLTKdeIOszVbl3ScpQcZZ6kYQypB/7bAvtfA4px0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XpIJYiT+DH6Wls6kI8zB618/xlP5iKiYSo3kgWy0vFFY4fNoab+zmqYxl2/2aCxA2
	 xt54dX7HTI3Yn6CMIqlHPHo8yEJLA2SeKbTC42PdBtd7LHya1k2uDXAjv0InURlce4
	 DgotbK6dFH47phW9EneVun9IOeEXl2iQQspg0gGTU2YK44C2SRz8rxDK6a/r0KleeW
	 n20mfqHWrLA/LmRg+NJvMEtCcWZYLuY+VjbpPvq7uOiJG4SwX8KEshwThbdWhnO1r7
	 KMe/Ue/eBPqI4J9U7xoGGNUVBJzo6+HQS/hEWFC9zsqW+/KAEkMLwJ0T0v7s6ef5MX
	 t51HZYkYMmzNQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso1511863e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:05:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGVLK7OuQ7iV+298ikZyb+bSpBunykUsZxmL0MeKWV2bzzcci8nmHNdDfbQ26JVc7djOQUyOWSLhZM71YM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Iwp4/s5MWWeWFEL8fh5I/QIc+ueOLpnRoqx4vGDDokRGQVHW
	TyVohurPDDXGnfFdKyQO63gxd8pvKgCmn2+pmJZrwgl1fJKw5XbBZeqK0pWuInKobAQ/fQrkp8B
	rYNM7noADUEq+lCyhWYGvyjBkn8QFjlg=
X-Received: by 2002:a05:6512:3408:b0:5c1:4a5d:6ae1 with SMTP id
 2adb3069b0e04-5c156e7d626mr1138550e87.14.1794330315914; Tue, 10 Nov 2026
 09:05:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030193128.19493-1-muniquefeitoz4@gmail.com>
In-Reply-To: <20261030193128.19493-1-muniquefeitoz4@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 18:05:02 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hkM4POv0BYo5uDj7g5DonVx8c2jc2XVXEsBkkqCxVZRw@mail.gmail.com>
X-Gm-Features: AclHuK-M2pQJ8zn9halWfGVBafGfe7PU_zzxvYKLCPtO2WYLRMQ1Zok4-aTVUM4
Message-ID: <CAJZ5v0hkM4POv0BYo5uDj7g5DonVx8c2jc2XVXEsBkkqCxVZRw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: processor: idle: Add DMI quirk for HA0QING A520
To: Munique Feitoza <muniquefeitoz4@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 8:31=E2=80=AFPM Munique Feitoza
<muniquefeitoz4@gmail.com> wrote:
>
> On the HA0QING A520 motherboard paired with AMD Ryzen 5000 series
> processors (such as the Ryzen 5 5500, Cezanne), entering deep ACPI
> C-states (C2/C3 mapped to I/O ports 0x414/0x415, corresponding to
> hardware C6) causes severe system instability, random hard freezes,
> and memory corruption ('BUG: Bad page state' and list_del corruption
> in page allocator / LRU paths) during idle transitions.
>
> Restrict max_cstate to C1 via processor_power_dmi_table for the
> HA0QING A520 board to prevent the processor from entering broken deep
> C-states and ensure system stability.
>
> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
> ---
>  drivers/acpi/processor_idle.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.=
c
> index e113bcbbb..49768b176 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -105,6 +105,10 @@ static const struct dmi_system_id processor_power_dm=
i_table[] =3D {
>           DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
>           DMI_MATCH(DMI_PRODUCT_NAME,"L8400B series Notebook PC")},
>          (void *)1},
> +       { set_max_cstate, "HA0QING A520", {
> +         DMI_MATCH(DMI_BOARD_VENDOR, "HA0QING"),
> +         DMI_MATCH(DMI_BOARD_NAME, "A520") },
> +        (void *)1},
>         {},
>  };
>
> --

Applied as 7.5 material, thanks!
