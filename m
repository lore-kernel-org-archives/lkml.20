Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792445603;
	b=R7Pkd5c0zRrrp6t5wJk3hiULInkDr9bKQDZbtImE5t+CnUo/UXUpyvHmYQd3LOnCZ7bm
	 TvqjdNSI+Y8zEHp4rDmYAEPk/W3KPjPWIslhqL1MS0cqLUC6bh/cgQDAXevLlI6rfOl8J
	 ootBzhe3CqTH3h+y2Roq6Uljd/TJUZx0UJOZnJnPwpq7Uj/LA+jQ7BIxmeRkRf9g1NRjt
	 WAnFymdGjuLao2umVcpTHXJsp+xtW7OcUTfQLmFUlnuQBUpaSpPeOFiOyACHA5pyCWZHs
	 +v6kqeDig/h4GpVXNgZNu/UE5HAUU6vRzDuAz5LkIlZux4cjqSljfxmIsbN+sbivCPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GQlCl9dWOqNQIRweq291SZTEueEEhdE4wMGJJ0+9RY8=;
	b=OHbacPYP1/3w3mVIqoz7+StzaUkCHyFGNiRHmXeN4Ip+WxniiKhvDQdHvrsWr3dZm1mI
	 JU16ICykxZ+6hB25OCyoPDmcYw3t/5A1PU+RzYAlpiaorXODO4AVbUNehwIULXjrimSSU
	 djyDWcVSElOm5GFb72EpTP6ideml7pGL0l3qP96zSC/tX0REk0hphCQNyUG0qLOjfi39X
	 DA68P4+6B0cpNZBzeLCZW35tL0ZmJ5awov7+06d2+ohiN4pn1tezcR3jItVA4UrfvK6+j
	 FlFO08ru+Ne2mT/2wVZJH3wXBAduNRuvatXzACnjZPjQ8MFRMuKxhgP7pRAjSaWuh2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gUgfUG17;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88302606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88302606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gUgfUG17
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-363cd582f45so116676eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792445603; cv=none;
        d=google.com; s=arc-20260327;
        b=mzZYDcMmya4Ut5r24NpHlitVO7jUxcwrf3357A1YBEaNroP/G4MHAJiD6ZAbYoZ6G+
         bbPW/zdHuFevnDh8G7krpD8xmqqFuBzIL8okVSjSvS70L9ZYTWcGVWzj3bBTGjXVlN9K
         y0KNgSqShCtAuKMWYGt1aXrRA/xKw7Nox/Tf13XLf/VageNdauEGKM2zi4EaSwXD3Sm2
         FTuvojctAO9YV0X2yLZikN5im4v3aK5AVftQibksqJ+xrllBMgbpMq8DdRbwj9DL2O1L
         ta7i4uxO0WgK8sXV+L+DSIg3wlO9SiEc6LnNgiJMfpC4hDUTigPd/4PuYZKtAM6kEA6R
         rcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQlCl9dWOqNQIRweq291SZTEueEEhdE4wMGJJ0+9RY8=;
        fh=WKF9LSKiUCSaiAOungV3ngNy0wzFc1aybWb1b0CxEUM=;
        b=senjr60ahyEEFFuRT86rBYA0VYqxqvTWqT5P9+CETuEuPP0IEETuPO9JCMedcpjer4
         8VQOJwp7phm8xy5gbesp2yQ4jd2Nxmd8hMlOgwG7vi9ZJbJeO2t1A65mIJc+04PNe01g
         X3VOlz1CRIMXa122A7Lo+fU4mAu45KzoypMRBu9/aj95VNxpZ9eIwEGtdx2qCJYWJ8SA
         XDrXtPKuhkF3XG5mVK6spxX6CxmXk7f0Y1zb7B7OcoIF2rOgq610hLr0TDElSYZNn6Ut
         S3vTO0fJq/m/gp2bKc2mFyAxDvFblifhjUUQ5lU49Lwko920OM/rIxv4WtrvlYJNXrPF
         bdqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445603; x=1793050403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQlCl9dWOqNQIRweq291SZTEueEEhdE4wMGJJ0+9RY8=;
        b=gUgfUG17z0e9e7xDttbn/IQ+OSl26RigqQDbccM4tWH4Yo9RFzPOkx75pqf9oPwpvI
         QTpehTLDJ/kFat2tjz4P+E9fgxwVKKdfm9pCWH3+WiCqKNfDSPG9j369cC8DtF+qC7S0
         fHgICV8Gk13mr4nMEUXNHhkWMhi7JUaeDX/xF4qu83FgcwUMYgSQG8Jbx5HQOeEWzJQ1
         9Jb5fAsko2b3JsaU3sJG5rOeUNd6WspG0ttBxdDqnGQK0KVe9x746UmEmmVBrLv0TWGs
         efxYJxuxO9cAoC+5lndO+54WzXZR+/T4Hza//qpdi9a/RzQ0WwV6WV5jFQGGl46guikw
         tkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445603; x=1793050403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQlCl9dWOqNQIRweq291SZTEueEEhdE4wMGJJ0+9RY8=;
        b=g4jlss/Xj1Q/gT94t1063+5Dl1400G+VgOBIWhBkMrTzUNFCfq12PLXM8WqmC6iWns
         75AMq4nDNJc9GL8XvTuvhqfOImo049rtt7Y9doibLKcbguA/aiKwC8e40sYWalXsv49x
         kLnJVHOGu9ZEfezGvYIec5mOJJY4vle2NWBHyMmeYDG8YX7e0uwicz/+w31e3LnN3gHF
         69pfrvkxxiwPtSQeh6oI9K1PA/H7qEOKwJU11sTJEf62MmlHCjffC2+jC+zdaHN1Qbyr
         nmYqkHNTwcs2ITxxxYfD0nSehs6RbXLIEP2LsPIW+2HPKEFVAezwYoZYOAPoV2tTCiUZ
         ABOA==
X-Forwarded-Encrypted: i=1; AKwUvBwXQxa6b+n9h9LJfGr+V0WdKxQcU8UT6ZWCnn8LRKkqY2GOycaAglaP3y0660k9tJKydiW9dT9LnGV1V3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLK/vVyoS+deI5HwSvsRJbXlT4y2h1sdEUSczuhoAdeEozID4i
	SVGVZSMSr4PzCMteacbfsVHnUG8Ua67cJVCHMuttSpQY0kzEzU55wBagfCHcUD9VwjbCbvv+KMX
	+WdkR0SdLtoG4hRa10frO1OBdNkJR3RGj+QDPJ/g=
X-Gm-Gg: AYBFou3M9FJAKpTdUweBnDl37FU0HmkRoyUFScpzY1PhsbP03jLNK9Zp9Edy/ea4Y1/
	svTodrqJgom/pl7dUC7vx6AWOo08SGIRXdvHjUBIYU/q58eO+1hB3E8V3F9cT0uoovYcRsGe11o
	ZINNZB76AgXokShjcTubymy5/fyzSWZRCWjLWvX3aSRhTcCfA0EFu+ZBQMCow0MRWDXw3FvrPqH
	FCZDh+NZgiu3YHVmVpQrr/JKtEFIu2gaSN6oOwBjzDN5Q/52IXy1x3BPIRJ4V3R6zRnOYid1WBJ
	hF1XMBJIlfOCETqtkergESdd5bWuZMTgKI0Iv67010PIsjy5ria4sGesYiVU5NRN9/pk0v/C51A
	qIcZ1TV1ZuKlLFE6wicCFSjwAn/2lavVeA1lR5/NbFQ==
X-Received: by 2002:a05:7023:a5c:10b0:183:d275:cf76 with SMTP id
 a92af1059eb24-18511adbd46mr19516085c88.2.1792445602643; Mon, 19 Oct 2026
 14:33:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016141504.2794541-1-yaojiale02@163.com>
In-Reply-To: <20261016141504.2794541-1-yaojiale02@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Oct 2026 17:33:10 -0400
X-Gm-Features: AclHuK_Me7TacYeo4mJbcJaHVL-oGV4AZjveGBSsw30ka30ykjikfca5QZHE9gM
Message-ID: <CADnq5_OneLPoTnDtowe2zVfLwN3_NZ3uFefNOw5itRKi6HivvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: validate SRAT subtables before parsing
To: Jiale Yao <yaojiale02@163.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 2:26=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wrot=
e:
>
> The KFD SRAT walker reads the first subtable length without checking
> that a header is present and trusts subsequent lengths when accessing
> CPU and generic affinity records. Invalid firmware lengths can therefore
> cause out-of-bounds reads.
>
> Validate the table header, every generic subtable range, and each
> supported typed record before reading its fields.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
and applied.  Thanks!

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 35 ++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_crat.c
> index 6e0df685503d..32d7573dffc9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> @@ -2056,27 +2056,33 @@ static void kfd_find_numa_node_in_srat(struct kfd=
_node *kdev)
>                 return;
>         }
>
> +       if (table_header->length < sizeof(struct acpi_table_srat))
> +               goto invalid_srat;
> +
>         table_end =3D (unsigned long)table_header + table_header->length;
>
>         /* Parse all entries looking for a match. */
>         sub_header =3D (struct acpi_subtable_header *)
>                         ((unsigned long)table_header +
>                         sizeof(struct acpi_table_srat));
> -       subtable_len =3D sub_header->length;
>
> -       while (((unsigned long)sub_header) + subtable_len  < table_end) {
> -               /*
> -                * If length is 0, break from this loop to avoid
> -                * infinite loop.
> -                */
> -               if (subtable_len =3D=3D 0) {
> -                       pr_err("SRAT invalid zero length\n");
> -                       break;
> -               }
> +       while ((unsigned long)sub_header < table_end) {
> +               unsigned long start =3D (unsigned long)sub_header;
> +
> +               if (table_end - start < sizeof(*sub_header))
> +                       goto invalid_srat;
> +
> +               subtable_len =3D sub_header->length;
> +               if (subtable_len < sizeof(*sub_header) ||
> +                   subtable_len > table_end - start)
> +                       goto invalid_srat;
>
>                 switch (sub_header->type) {
>                 case ACPI_SRAT_TYPE_CPU_AFFINITY:
>                         cpu =3D (struct acpi_srat_cpu_affinity *)sub_head=
er;
> +                       if (subtable_len < sizeof(*cpu))
> +                               goto invalid_srat;
> +
>                         pxm =3D *((u32 *)cpu->proximity_domain_hi) << 8 |
>                                         cpu->proximity_domain_lo;
>                         if (pxm > max_pxm)
> @@ -2084,6 +2090,9 @@ static void kfd_find_numa_node_in_srat(struct kfd_n=
ode *kdev)
>                         break;
>                 case ACPI_SRAT_TYPE_GENERIC_AFFINITY:
>                         gpu =3D (struct acpi_srat_generic_affinity *)sub_=
header;
> +                       if (subtable_len < sizeof(*gpu))
> +                               goto invalid_srat;
> +
>                         bdf =3D *((u16 *)(&gpu->device_handle[0])) << 16 =
|
>                                         *((u16 *)(&gpu->device_handle[2])=
);
>                         if (bdf =3D=3D pci_id) {
> @@ -2100,9 +2109,13 @@ static void kfd_find_numa_node_in_srat(struct kfd_=
node *kdev)
>
>                 sub_header =3D (struct acpi_subtable_header *)
>                                 ((unsigned long)sub_header + subtable_len=
);
> -               subtable_len =3D sub_header->length;
>         }
>
> +       goto out;
> +
> +invalid_srat:
> +       pr_err("SRAT contains an invalid subtable\n");
> +out:
>         acpi_put_table(table_header);
>
>         /* Workaround bad cpu-gpu binding case */
> --
> 2.34.1
>
