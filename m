Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592988;
	b=F48xTMa+Gm6e4vGxjnKzp0Bxcz97uO4LdV6hwlS/21KKpkMH4g8fCNI9md7qjBj9FoHA
	 5nZa25WX+Ajy3nCQfFvPouDIJhtGf4OzhwqllrixEB9lHgGG9ntOwvSIAlLfC3zkcjBYG
	 d1HSD3KbwmuTVEPwKwgSkHImTy6BjdJUiY+cXZEcz/dp+JLhmLm/QrWg2tLFjexOoU5ld
	 aqLjvgdE7ArF35mhsLplLpahvv081dvwGiVEOTdhrMSFJ9bMNKWfLhS3mcMmtzErRmeVj
	 SwZgDw4f91uJTOcQsckqZ8pJHzFs62wKjkVkUD6IUNTOZ65INvQJnYrkHov0eNRC1Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592988;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+G47jzw3JYsE9pT98xgL+H9LhozLbLQVlFv/D8tdtxw=;
	b=UdOnd10aYZald2aX9Cr4JSjQwwkPd+qEjOG7yxOum1jtwaGtZD1JyU+F1MvazuV1Gid6
	 sGmepejZl2M6egpAVeRfqCCuDiKi68snJUZjB4FKXPd8gEN8efZ+WzoNi6qZ912Uzogvj
	 s5s0bvJ94z3KNikJZnvEbAE6njmY281sPYVT3CQVhZVrLPXDfqGkvxaAJ/ilg+eQx6L0l
	 p0vncJWpKRIrn7u68Yu5XvFLglbK+xayTUIydaEwJOt34prUPCdd47NgSIH4LoY1DLN2M
	 X1APKrdl+xMX5DmW3antqwVJ/+2lVPuU2zLbpPlZQUpfGb5BhufF7KMtGh5PYV2Csag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPh82f4o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2F606A8B2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPh82f4o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A3A1F000C8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592988;
	bh=+G47jzw3JYsE9pT98xgL+H9LhozLbLQVlFv/D8tdtxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nPh82f4o8MP8LzTO+cl6NuGelxAQ2ckgH5PZv3l4MC22xfpN0185/L5yqd1bwoR2A
	 TzLbUQolRnSS2eVlizaSzSnzR73L2D6UFAb+p2EzNlkf9ryXRFe9f650MdI34MyJr7
	 O0aIdHZBfbJVV3FSNeldR526eGY/fMBZLyxOOTTKL1l/ZDQciXI1q+jJSfiBHd10PV
	 VnYcrmIvX7iPuS1Ipx/tayjFEW6V4OMCtHAQl3LxNGW6fTgXAn8FfiYUOa6fKuGHMO
	 OJTAoQsXd/Agk9B3xEQbNUDN6OxtaG6XCxFKRLwHgSQ1/53L6CfdfLNph0z95nGAmP
	 55BpLfmIa4xkg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so17044911fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:03:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEbVHuX+zDr0ce/w98hh1uJgTh+pu5ThK1jps47WvFEI7INZ1hZjnURPq749rM/PuFXQk5BtMnxpvNJwmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9rLe+RN6eV6ER5y8g2WTlUUPf+JXDMz/Lyit6EmJI5TnG9sL3
	cnf/pbn5e3P4Y4fP4lceBk2vglFRpSVR5U1yY6EmpTEmEpAL/KxSr5z4deN4TW/Hv6pfEP+VVbQ
	2fGRhUCmB28iwWlY8SEniOjB7qWyAMso=
X-Received: by 2002:a2e:8a88:0:b0:3aa:fd7d:6164 with SMTP id
 38308e7fff4ca-3ae2b68121fmr10253851fa.25.1794592986378; Fri, 13 Nov 2026
 10:03:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110225452.2349540-1-jamien@nvidia.com>
In-Reply-To: <20261110225452.2349540-1-jamien@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 19:02:53 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hZHT8P2Ld3xa6K8OboUdoNAWvWrcoE1cp+4=Qtqc=PPQ@mail.gmail.com>
X-Gm-Features: AclHuK-O7QkpH7cmOnGuu9WgWj8q1A8eetbKHBhEoZxBhcB3jUpXoMj6E0dz3a0
Message-ID: <CAJZ5v0hZHT8P2Ld3xa6K8OboUdoNAWvWrcoE1cp+4=Qtqc=PPQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: sysfs: Release the table references taken during init
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:55=E2=80=AFPM Jamie Nguyen <jamien@nvidia.com> w=
rote:
>
> acpi_tables_sysfs_init() gets each table with acpi_get_table_by_index()
> to create its file, and acpi_table_attr_init() gets the second instance
> of the table's signature with acpi_get_table() to decide whether the
> file name needs an instance number. Neither reference is ever released,
> so every table stays mapped. The file's read handler already gets and
> puts the table on each read.
>
> Release both references once the table is no longer used.
>
> Fixes: 174cc7187e6f ("ACPICA: Tables: Back port acpi_get_table_with_size(=
) and early_acpi_os_unmap_memory() from Linux kernel")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
> Sashiko flagged this, as a pre-existing issue, in its review of a
> previous patch that I sent:
> https://sashiko.dev/#/patchset/20261013193900.1258808-1-jamien%40nvidia.c=
om
>
> With the references released, a table that nothing else holds is
> unmapped after init, and each read of its file maps it again
> (acpi_table_show() already gets and puts the table).
>
> Tested on an arm64 server and in QEMU (x86_64), with a test-only change
> that prints each table's validation count after boot:
> - Every table's count is one lower, and the second SSDT's is two lower,
>   since the instance check in acpi_table_attr_init() also held it.
> - All table files read back the same as without the patch, and
>   repeated and parallel reads leave the counts unchanged.
> - The BERT and BDAT data files still match /dev/mem.
> - Loading and unloading SSDTs through ACPI configfs still works (QEMU).
>
>  drivers/acpi/sysfs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
> index 49a820b39c2917a..d1b57d1246aafb1 100644
> --- a/drivers/acpi/sysfs.c
> +++ b/drivers/acpi/sysfs.c
> @@ -372,6 +372,7 @@ static int acpi_table_attr_init(struct kobject *table=
s_obj,
>                          table_attr->instance);
>                 strcat(table_attr->filename, instance_str);
>         }
> +       acpi_put_table(header);
>
>         table_attr->attr.size =3D table_header->length;
>         table_attr->attr.read =3D acpi_table_show;
> @@ -593,15 +594,19 @@ static int acpi_tables_sysfs_init(void)
>                         continue;
>
>                 table_attr =3D kzalloc_obj(*table_attr);
> -               if (!table_attr)
> +               if (!table_attr) {
> +                       acpi_put_table(table_header);
>                         break;
> +               }
>
>                 if (acpi_table_attr_init(tables_kobj, table_attr, table_h=
eader)) {
>                         kfree(table_attr);
> +                       acpi_put_table(table_header);
>                         break;
>                 }
>                 list_add_tail(&table_attr->node, &acpi_table_attr_list);
>                 acpi_table_data_init(table_header, table_attr);
> +               acpi_put_table(table_header);
>         }
>
>         kobject_uevent(tables_kobj, KOBJ_ADD);
>

Applied as 7.5 material, thanks!
