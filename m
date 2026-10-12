Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C7415B68
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829078; cv=none; b=gz51WjTfyG7dCy1qdFaoNTkOn9enKhtC8fDzcS9poGDERZ+056mE6JfHNWDpRBNx0h2y38FaO7webDE/IsVPYGLBjCzFgvxBdH65KbLq7TyJlM0PVs5D7inkyjwWJtB9JXw9+5mICLtkLFPj1IBaix/sUcTGxEH6xbQXbyvQ54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829078; c=relaxed/simple;
	bh=3ZP0q8GCNthWdZOki2eAWh/MqW/qn5mhKHBekD1qiL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOEHpQQlXKAK1VQw2trZYA5fJYdeuJJTOY32Aa1HIMYEE3EvFQYQfGCULvZDCkoC8hkG3s7Zup4lmRnPKl8+H3ci1wvUXwT4t08W4Qg4LfLAYKVgjqQ61V/cqCpyiOy87IeTpppAmohxb/bYk/376GLysdKv7WkxckZNh3o275g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRzBmZqv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRzBmZqv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098031F008A5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791829076;
	bh=I3AcG1Hk03PrxvFSQLk3sDHzjpeYB770bX/Wiu8uvgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YRzBmZqvw4mMr8S238P8syYKtVzp/WCEr+0RrTH1qpg8CK5Bucllm7sFCDG5EtO1a
	 moQ4whMjnazOIGJig/peeqBb3QcfswdgKI1wImCLYjDdkcyt6cEoxoHwCE8259k652
	 hYtaIBY0fO61NeDiWD6VtaitvrC5ie0ehZSw25Lnr3zB0U5wOzG/6z2Ui8hks46C2n
	 ExTnhfHxfwXhYyvRvxRSQTLHkRB9S9zFthRSPckn+5aaRPQRPtNflzysEBUI0eHnkh
	 73hl6nLr3ZClJvrZvfCnsw5NJ0Qy0mJ9vVyKbik4+utKtGqzgzDvQJHpoND+6qcfaO
	 GjUMNz36puWmA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb2ecebb4so1620952e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:17:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfDfpqvzzG43v1oODZqpaiEpXMnmUVq39IQU2NeDtOzBTLpj3vsxMbhNkaf8p2YUAp522+4pXFJbGIc6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLREi7YOhHdH7KhGJQJ46fOvoaD62rmw1Gk4Qi2tG+rURoDqhuR
	wGIgcXWr87JxLtuXAtf1/2+stP+Hnz6oBZDUATEz3G0ggPBz7vPUBgOryJSZNsI8bkTjgg5T5gA
	oqMQ1vC1EW5qoAOKNN/i5q687Md2vPfM=
X-Received: by 2002:a05:6512:3f03:b0:5b8:bc5e:b57b with SMTP id
 2adb3069b0e04-5bcde8d050cmr3322946e87.51.1791829074283; Mon, 12 Oct 2026
 11:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009232955.866131-1-jamien@nvidia.com>
In-Reply-To: <20261009232955.866131-1-jamien@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 20:15:50 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ghc7Ks=nMNwtvm9727NbUQb0XDEu4GrXiEcaDELgRk+A@mail.gmail.com>
X-Gm-Features: AclHuK9v7zMldzQJmNnSgcMRRuB6ebSseupNKggdyNgU6jGcEIArcWpqT8u0mwA
Message-ID: <CAJZ5v0ghc7Ks=nMNwtvm9727NbUQb0XDEu4GrXiEcaDELgRk+A@mail.gmail.com>
Subject: Re: [PATCH] ACPI: sysfs: Expose BDAT data region
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 1:30=E2=80=AFAM Jamie Nguyen <jamien@nvidia.com> wr=
ote:
>
> The BIOS Data ACPI Table (BDAT) points to a firmware data structure that
> carries memory training results and other boot-time data. The table is
> only a pointer: /sys/firmware/acpi/tables/BDAT holds the ACPI header and
> a Generic Address Structure, and the data itself lives in reserved
> memory.
>
> Expose the data as /sys/firmware/acpi/tables/data/BDAT, as is already
> done for BERT and CCEL. Unlike those tables, BDAT carries no length, so
> check the "BDATHEAD" signature at the start of the data structure and
> take the size from its BiosDataStructSize field. Reject sizes smaller
> than that header, and document the new file in Documentation/ABI.
>
> The BDAT specification is published by the UEFI Forum [1].
>
> Link: https://uefi.org/sites/default/files/resources/BDAT_Spec_v4_0_9%20%=
282%29.pdf # [1]
> Assisted-by: LLM
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
> Tested on an arm64 server (64K pages):
>
> - The file matches a /dev/mem dump of the data region taken in the same
>   boot, byte for byte, and decodes with valid CRCs.
> - With lockdown=3Dintegrity, /dev/mem is refused and the file still reads=
.
> - Malformed BDAT tables loaded via initrd table upgrade (test-only change
>   adding BDAT to table_sigs[]) are rejected without creating a file: no
>   "BDATHEAD" signature, size below the header, non-memory address space,
>   zero address, and a table shorter than struct acpi_table_bdat.

Please see the Sashiko feedback on this patch:

https://sashiko.dev/#/patchset/20261009232955.866131-1-jamien%40nvidia.com

and let me know what you think about it.

Thanks!

>  Documentation/ABI/testing/sysfs-firmware-acpi | 12 +++++
>  drivers/acpi/sysfs.c                          | 49 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-firmware-acpi b/Documentatio=
n/ABI/testing/sysfs-firmware-acpi
> index fa33dda331f2440..5fb50a72d468f5c 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-acpi
> +++ b/Documentation/ABI/testing/sysfs-firmware-acpi
> @@ -275,3 +275,15 @@ Description:
>
>                 remote_region_id: ID associated with access by agents
>                 non-local to this range of addresses.
> +
> +What:          /sys/firmware/acpi/tables/data/BDAT
> +Date:          October 2026
> +Contact:       Jamie Nguyen <jamien@nvidia.com>
> +Description:
> +               The BIOS data structure referenced by the ACPI BDAT (BIOS=
 Data
> +               ACPI Table). It starts with a "BDATHEAD" header and holds=
 data
> +               published by firmware, such as memory training results. T=
he
> +               file size is the structure size given in that header.
> +
> +               The format is defined by the BDAT Interface Specification=
,
> +               published by the UEFI Forum. The file is readable by root=
 only.
> diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
> index dd4a99f09efea65..9d02733013996be 100644
> --- a/drivers/acpi/sysfs.c
> +++ b/drivers/acpi/sysfs.c
> @@ -473,12 +473,61 @@ static int acpi_ccel_data_init(void *th, struct acp=
i_data_attr *data_attr)
>         return sysfs_create_bin_file(tables_data_kobj, &data_attr->attr);
>  }
>
> +/*
> + * The BDAT table only holds the address of the BIOS data structure. Its
> + * size is in the structure's own header ("BDAT Interface Specification"
> + * v4.0, section 4).
> + */
> +struct acpi_bdat_data_header {
> +       char signature[8];      /* "BDATHEAD" */
> +       u32 size;               /* whole structure, including this header=
 */
> +       u16 crc16;
> +       u16 reserved;
> +       u16 primary_version;
> +       u16 secondary_version;
> +       u32 oem_offset;
> +       u32 reserved1;
> +       u32 reserved2;
> +} __packed;
> +
> +static int acpi_bdat_data_init(void *th, struct acpi_data_attr *data_att=
r)
> +{
> +       struct acpi_table_bdat *bdat =3D th;
> +       struct acpi_bdat_data_header hdr;
> +       void __iomem *base;
> +
> +       if (bdat->header.length < sizeof(struct acpi_table_bdat) ||
> +           bdat->gas.space_id !=3D ACPI_ADR_SPACE_SYSTEM_MEMORY ||
> +           !bdat->gas.address)
> +               goto err;
> +
> +       base =3D acpi_os_map_iomem(bdat->gas.address, sizeof(hdr));
> +       if (!base)
> +               goto err;
> +       memcpy_fromio(&hdr, base, sizeof(hdr));
> +       acpi_os_unmap_iomem(base, sizeof(hdr));
> +
> +       if (memcmp(hdr.signature, "BDATHEAD", sizeof(hdr.signature)) ||
> +           hdr.size < sizeof(hdr))
> +               goto err;
> +
> +       data_attr->addr =3D bdat->gas.address;
> +       data_attr->attr.size =3D hdr.size;
> +
> +       return sysfs_create_bin_file(tables_data_kobj, &data_attr->attr);
> +
> +err:
> +       kfree(data_attr);
> +       return -EINVAL;
> +}
> +
>  static struct acpi_data_obj {
>         char *name;
>         int (*fn)(void *, struct acpi_data_attr *);
>  } acpi_data_objs[] =3D {
>         { ACPI_SIG_BERT, acpi_bert_data_init },
>         { ACPI_SIG_CCEL, acpi_ccel_data_init },
> +       { ACPI_SIG_BDAT, acpi_bdat_data_init },
>  };
>
>  #define NUM_ACPI_DATA_OBJS ARRAY_SIZE(acpi_data_objs)
>
> base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
> --
> 2.43.0
>
