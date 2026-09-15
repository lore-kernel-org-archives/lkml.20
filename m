Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD474489898
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789497405; cv=pass; b=qhTA86Wv++RbHfpKdnKJjE8oXJP8lH+PZQIKVUV/6fOcOFDMvMphHRJCKxgkpM19Hqead08muY92ntin/00wEftT3wLWqprGybWx0KAodvU9WW7ci4QVnxTuSDZK0jmQDxGkgFWIuFcw1kIvmBKYuTNxcUXxDEh7DdAdGvZXD/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789497405; c=relaxed/simple;
	bh=0fAJ96KToGBaJVYivQxfXHrnlsaMATy4LRpTL6ELZ7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAdr0Zc3s8I8zmrwlT9Ku1f+pI3rbeT+toJuL4XeqiWZJvS+z92Iyhm8zF+YRgf850OUjLJRt8oOacQ/WCI5EYh0uGtHeouPCXQoM+LChtE86Ao0HHF6I871v1U3UYfHCisTjsDWLegq1grt2TwrtK1/YqjZ7MTJN9PN7FrC2mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imblA3iD; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imblA3iD"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20ce3c118aso163153566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789497393; cv=none;
        d=google.com; s=arc-20260327;
        b=GTnRhhoXJ3PmQsYMqBUIIK1lyyj+qXgnUZwQixv1JPk4D8mv4YM41RDJaelyJLL7lI
         Oby585j4P/MknhUQMIx6NpXXsc7MgNVsdgEUrkyn+XXDH+Cn4G6v3uY5DEQZSAUMU108
         fSXnzXN4lvE4FfG0lvVapQe2Cee9GUwqNeUVMia5DQ/JgZnHMAd4VXchH0In3fJAdSBh
         26W3bWgaXOnvZDnz4nSARktdNzw2+uRxWWIZLVAn0x9FvrWI+VoWU2qx8rQYP1f254Th
         QpI5ZBUoKFyQ9V9SBi2IEohfLhNR9UKPRKgEmlWsTPH483jGC8EDOSXWQMSdRRbDUwDQ
         ecfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gIXlRpFwzAqF+gXj9N4lNHJj37A+1bZjmxnWxX0j5Uc=;
        fh=up3wCNiIr9Yw+lZUEZH0olj0ouFg6CxSer2u1CS0pS0=;
        b=ih3iyV8iHw/rTXXVdcnQmYHybkw9sf9YKlB9+76mqHcD3Y5qb5EgImj/tgAIq6iiBZ
         g1B3zBaw6sqxR7MEfEcTSTmxF5KKyFmwPaT/D1ia/zcPCDtuVo+0dzmUrKCOgamsdC2J
         /7rW3NP+cIyFyhgCnobp90mOGyP59DYOmFHyzH2jRLauIlry0LvsN5c+vYXE6JvtmX0A
         rCB18/9jHYFcdphq7csh/jRtI9YcgKQqzq4F65PGqKvehlIohxDGvMTdyq5ZaDi/hw8l
         wziJnvudIcwjB1WZ5Cf06xrgx12tB3wTCrubJ3OJilGwXtzKzYhnGYTheK06wPXYzkcI
         k27Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789497393; x=1790102193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gIXlRpFwzAqF+gXj9N4lNHJj37A+1bZjmxnWxX0j5Uc=;
        b=imblA3iDClAKSsVa2bgWVIUxEPPlq3RSc9OuP5ZY7CURKGVC/HGgz3MIldEi/rr4YN
         ZUm+jBo5nbanqCuCwKJnTGfGlhqlcLBBZQkRP0828Mfe8KSMEHe6cIjHDP6MXL2+qr2J
         Q8luU/6AvQ17yIa5idPBk775lNVjxzCWgrj5y8KXKM3o/avD+W9CkpacPSpFwNROOZga
         FHF1rzCWwEpU2EAplRJXu073Zm6sxKuIlVaG/+7zzrx3B2Hqo8FxFnRTULzWdQwb41SJ
         6VVru0zdOjUJStmjcZQzpXsxMA85i0oke/Z0PTFq1J7qOTxUqB8Tuf7iFVeVCWE1OB+t
         FxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789497393; x=1790102193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIXlRpFwzAqF+gXj9N4lNHJj37A+1bZjmxnWxX0j5Uc=;
        b=y5qzIkVJ7Gc49zQZZkrUNh6CtiQ5BU2eHt0w9ap5J2ElYNEduaVo04uOgZBMD4hpaW
         W4N3RNWyLrKPN0MB5vMW0oOxf/DWxNzQG2fSLo8slCgFcZsk7PxDfj4l8FWG06lmd9aG
         988Oo03Jmn6gszEqQgKJd+y07VBvQxcSPt2WU5ySh5w2oIPyln5zwyX81dQMEVxK5Kmj
         UF1cWnHAfbEAVWE2prLgV36mskGcdXMoqf004iVx6bA9ZwY1tYRq8Zpb9V65pZjaiLYu
         OYwdsWflEJaHKsS5tbQc9ArZX5UWnVsPgOD4bVF8WoX/SK3H6Hw3mpUmzoGyIftzpXaA
         62Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzSv/eTYJu3KFDHHEqX3hHaSqMS255heFE278zWV2UiEplUdix9wFCeT471y/ujbHwUyBdCPcJzR4eY3bc=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Tw5qB0mG/hdFPvPMnkO59A/15pW7SCc/0vL61zW0mMqx11be
	09XjSR8pNQfZmHdqeAAWgAx+lNT+WE5vPeEU3X5FTbOb5ydM/KaFbZ7NjSY0Fxgoq2nKwDQ/OXk
	AB4tmFGTq/DrzoTYpac0bqP9t4dmDdyU=
X-Gm-Gg: AYBFou3IrCXDb4NSdBgnVPlmQeV2r8wclE/boGL6OE71hBPzfQPUGo/sCSjTH3rb/DJ
	EceQM94S6nqVdPVMhzOZ+a1ynHrAPxdQ1V3UZVkI8D/KlLKTrmXwdltuYRzUGr0NZrQdTEqDxbY
	1akJ/yYvsebFc9W01DPvRv16YxLlSChhXFtxy7d0f0JzKDKTvlO8/bErdZ5wMd8z0+zbdP9sFBJ
	2wX70ahmUrPTzo8SyYSc/jt954ThcSLD3YFD6OapoAVwGjXCneefYRxCHVjGeq8dpwzqR28FOYf
	0GarI7QrcnlGoLR/efbIZFa5BGq8YntIzOFgd90oFUQru6tU2h9EgCDcbIemzQkM6EyDoVbYmyd
	/vDD9SpgF7Q8fWu8lwubX5tktu1ItFCNIqNWH0UGR
X-Received: by 2002:a17:907:c0f:b0:c25:f7dc:2d3 with SMTP id
 a640c23a62f3a-c29c8b917c2mr383788566b.20.1789497393092; Tue, 15 Sep 2026
 11:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826103012.240453-1-meatuni001@gmail.com>
In-Reply-To: <20260826103012.240453-1-meatuni001@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 15 Sep 2026 23:36:20 +0500
X-Gm-Features: AcwNN1WcJfuWtzktYvt8Aa0_L2cgMeEC3hDziX2ljeuoLSbyMQO8ELH7LkNEO_U
Message-ID: <CADqcGBnQMBwAHLfeg_1Jvr5A_w5D-MmNJpCBHVMisiBp7mqfNA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: fix heap OOB read and memory
 corruption in hp_wmi_perform_query()
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping.

On Wed, Aug 26, 2026 at 3:30=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.co=
m> wrote:
>
> hp_wmi_perform_query() evaluates an ACPI WMI method and expects a
> struct bios_return header in the returned buffer. However, it only
> checks that the ACPI object type is ACPI_TYPE_BUFFER without verifying
> that obj->buffer.length is at least sizeof(*bios_return) (8 bytes).
>
> If the firmware or ACPI method returns a buffer shorter than 8 bytes:
>
> 1. bios_return->return_code at offset 4 reads out of bounds from the
>    allocated ACPI buffer slab.
>
> 2. If return_code evaluates to 0 and outsize is non-zero,
>    (int)(obj->buffer.length - sizeof(*bios_return)) evaluates to a
>    negative integer (e.g. -8 for a 0-length buffer). actual_outsize is
>    set to this negative value and passed to memcpy(buffer, ...,
>    actual_outsize), where the signed negative value is cast to
>    size_t (e.g. 0xfffffffffffffff8), attempting to copy ~18 Exabytes
>    and triggering an immediate kernel crash. Additionally,
>    memset(buffer + actual_outsize, ...) performs an out-of-bounds
>    write before buffer.
>
> Fix this by ensuring obj->buffer.length is at least sizeof(*bios_return)
> before accessing the return code, and compute actual_outsize safely
> using min_t(u32, ...), which is sound specifically because the guard
> above already rules out obj->buffer.length being smaller than
> sizeof(*bios_return) by the time that subtraction runs.
>
> Fixes: c3021ea1beee ("hp-wmi: allow setting input and output buffer sizes=
 separately")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
> v2: Rebased onto current platform-drivers-x86.git 'fixes' (confirmed
>     matching current mainline, blob b2773fc1aca414792b99406315496a2c3a64d=
d06).
>     v1 was diffed against a stale local copy of hp-wmi.c that predated
>     a batch of unrelated upstream changes (GPU MUX switch support, new
>     OMEN/Victus board IDs), so its hunks no longer applied. The fix
>     itself is unchanged, only the base and line numbers moved. Also
>     correcting the recipient list: Hans de Goede's address is
>     hdegoede@redhat.com, not hansg@kernel.org as v1 had it.
>
>  drivers/platform/x86/hp/hp-wmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index b2773fc..d7ad206 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -691,8 +691,9 @@ static int hp_wmi_perform_query(int query, enum hp_wm=
i_command command,
>                 goto out_free;
>         }
>
> -       if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -               pr_warn("query 0x%x returned an invalid object 0x%x\n", q=
uery, ret);
> +       if (obj->type !=3D ACPI_TYPE_BUFFER ||
> +           obj->buffer.length < sizeof(*bios_return)) {
> +               pr_warn("query 0x%x returned wrong type or too small buff=
er\n", query);
>                 ret =3D -EINVAL;
>                 goto out_free;
>         }
> @@ -711,7 +712,7 @@ static int hp_wmi_perform_query(int query, enum hp_wm=
i_command command,
>         if (!outsize)
>                 goto out_free;
>
> -       actual_outsize =3D min(outsize, (int)(obj->buffer.length - sizeof=
(*bios_return)));
> +       actual_outsize =3D min_t(u32, outsize, obj->buffer.length - sizeo=
f(*bios_return));
>         memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual=
_outsize);
>         memset(buffer + actual_outsize, 0, outsize - actual_outsize);
>
> --
> 2.55.0
>
