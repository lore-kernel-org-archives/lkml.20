Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899A13B7B7B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564071; cv=none; b=AVVkPSXG8d0sffb8chTgHclE7MpCtFjoPKKWIQFKtFQ4qktMp4HS7alXL3T4SoLbZBoaiZP1Iww6wibwyKFsMg1LETEmtoe1qVF0GyhtNw5t+aII3Nv1RXsoN3uRnhIPhEiCFJ2izOnItvMZlPMqEbXvPNMAimEIrrepKy3oAZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564071; c=relaxed/simple;
	bh=7S2+LLfEzJhkPEvw2phXVKSDIEia/jqj36zYQtIwNio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRmW9KOTWRrix+wwpk4xQ1aHyoOd2NFJvQvkUV61S8/PTa7mDfWzFXcB4PpqN7RGUA65UB1unxjbzZxKwF0rF6F9mfgmEhVgTFzPoOO7A6KbnMls1JCj+XEJYPTzBwhMYVFJcdccPHmUDla5xBNPpk78glCzbMoPvCB5Z0B3VTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgZQdUyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgZQdUyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE2E1F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564070;
	bh=raxTRKDGtdPhYhfd5hHAT4qTNAWhyEwS8MbKiJVQ/z0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YgZQdUyhnft5w1xSkVYCxyXnMeQZ2kX71w6axfLMWrTqFtJknL87BsyRyLTKnvGAL
	 Wvqgccy4AjZOc3xJnCrwc+hwXsnRJUPprpwdiMzC0YV8s/qwhMHX3hwU1ta8xLbkvd
	 KgBYbjZ5rcW8wA5A6hJRUPnTmabC4krqkiqni8Z+37A/BQ/0hBwDRQDDV+oDk7iSmX
	 VhEb0xpcU1BmfVN2KjuvX8ohdLXJpRVXD/kNUJK8RBoyohkci8mXlTF8mfPoI9rye7
	 8Ei7SSIKzAUqcbWuxqlyVG9wm85QWU2BUZ7JnT7zAqqZoJkHlc9WJSl0vaRuym+GkY
	 ISadER6DFzGEw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c81so888917e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:07:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrfrwIWWrHFqZ+jxRpzFQrDIexeyauNVcRDzPtOhwkSwk06XAY5+bwDBkJi3swGDUlqwl7xZU/CtmRP4o=@vger.kernel.org
X-Gm-Message-State: AFuF++lAW4QIajeVOkpspI2GEVmCYWMDQc/FqVaonvVdXPFL9pbmMEJD
	urVNk+fwSiG3yorp1KODLa3jglgYtUNvEYz/dMyPWbYNU+9tkuTP/Fs4hXv78pZj/MRK5H7iUYw
	WvvvJXQEQENeoS5nJFBYZutNeTLuetWI=
X-Received: by 2002:a05:6512:1192:b0:5b6:1a7c:fd96 with SMTP id
 2adb3069b0e04-5b8b666a82dmr710721e87.60.1789564068297; Wed, 16 Sep 2026
 06:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913125123.109803-1-bolin.liu@seu.edu.cn>
In-Reply-To: <20260913125123.109803-1-bolin.liu@seu.edu.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 16 Sep 2026 15:06:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g6yM2B93QoH8CeKpOvjJ_A1bTu_4UV0DNEKz9OxiSLaA@mail.gmail.com>
X-Gm-Features: AcwNN1WUigr_XCn_uiPujXvCXbGrgg9veFi6vtbdcs0VBro7CYC00sbWiGvINL4
Message-ID: <CAJZ5v0g6yM2B93QoH8CeKpOvjJ_A1bTu_4UV0DNEKz9OxiSLaA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: tables: handle failed initrd override mappings
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:51=E2=80=AFPM Slavin Liu <bolin.liu@seu.edu.cn> w=
rote:
>
> The runtime AML table-loading path can invoke initrd override after
> permanent mappings are enabled. Mapping bookkeeping can then fail.
> Return AE_NO_MEMORY before reading the candidate header through NULL.
>
> Detected by static analysis and reviewed with AI-assisted source auditing=
.
>
> Fixes: b2a35003dfbc ("ACPI: Implement physical address table override")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/acpi/tables.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
> index eb93c060426f..749a128a889c 100644
> --- a/drivers/acpi/tables.c
> +++ b/drivers/acpi/tables.c
> @@ -560,6 +560,8 @@ acpi_table_initrd_override(struct acpi_table_header *=
existing_table,
>         while (table_offset + ACPI_HEADER_SIZE <=3D all_tables_size) {
>                 table =3D acpi_os_map_memory(acpi_tables_addr + table_off=
set,
>                                            ACPI_HEADER_SIZE);
> +               if (!table)
> +                       return AE_NO_MEMORY;
>                 if (table_offset + table->length > all_tables_size) {
>                         acpi_os_unmap_memory(table, ACPI_HEADER_SIZE);
>                         WARN_ON(1);

Applied as 7.4 material, thanks!
