Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D52525A94
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869202; cv=pass; b=XC7TUSu9QFED8cWSbAch5m6byWf3rSWQzY/8x+gpIwUbUTf93SfAGdgOvDGb4uVAhWAI4MOA3ykhHg185WO3TVS+W3203wJlLoAsXiHAT9Ia7QjS0a/ODmDINo9Gz9p0K1K81GiHiDOe8ZVv/f15NjEkPqj/toRsZzCC4lLIoQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869202; c=relaxed/simple;
	bh=aFUh89Vb7GZ4oVyB3fXPOwsUThKEK9z+VY4rNdjijh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWFMHFTZU7aEE68J4722O5fB6SmRaCz8UxSqdgSZ2tJx9+wvXX8DjgMY3Mxq+C+j3WTtTvn2yk9R4RV9lEJdIvY6kJ8EIdLScItkwpru9No5uytkkfNFEDjfk3K2g0alfXF/8Faa2OdGB6Q/e/2/brpsX5GSJRAmtTFJr1ANkOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e++i91J+; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e++i91J+"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso3478533a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790869199; cv=none;
        d=google.com; s=arc-20260327;
        b=HFRf1hmEewnI00h+MC5vS6a0kAZBT7Gq++hAAlM9kZq41JTT3YpfdQjX9Q1ZfSK//S
         cO9qdhUTutPeNgKClpvh7GBvsuaPbX7z/5ZMmRNCreTLqI1MTbYKzktVnYkaxvRRzpOB
         fns7bgY0Log1r9m0UUE22jWxqEzO+RKuZBDz1GrphkJa03TIzDwJQQ77dasiwv4haJzd
         p9lOVDPlrH4I34qr+U6pB25UKdF9zhauWYirq48+3FR1nmZsDz2OpbkGCXynehEGMBUD
         V20xXv4FC/h10uASjWfJnb9sMWFDRxSPrOrR/tOVCuadKR16yD/6T/uygRMYNKJ3ndZK
         MaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=33ugh1JWMcgP8/UF4U5Kxe1xOXj+ElXNCs++vic4Ae8=;
        fh=QdDW/L3A0yzYAP+QWstebcG72S0XHV1KOuoW4LdSaR8=;
        b=svCgASpeS1wldHHsGkyB/Y9zLdaMAIhO1Cb1jYyoUV5d6/AMbaGSVI+IWzZWaJWz6a
         8/QJX97OEfkNnVSx3xTFZOC25p3WL6MGVi3Ezh1W1qUKefnOVgPeDdheGsVVuumGFQyX
         IGD91Uvukil5F+viSH+ZbLFsVadlbMct2epJIjqW5e4zQuawVGh9TbSbE0aE9FTcujYG
         vMt5aKB1cLVPytO8Igjjr+waySqxCiT9UuEiArtUcaNjZdY8tnRqKQCCocqueJHCC+tB
         LSdANsvq3/dtlbSM/NaIOEdwTy+vE//JblQY/qzumsvtRj52Yj6shozpN6ZJgoo6sfK4
         Ywew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790869199; x=1791473999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33ugh1JWMcgP8/UF4U5Kxe1xOXj+ElXNCs++vic4Ae8=;
        b=e++i91J+kInEZzmEkNLQXvTEQ6++rUf4VUYKeE4u1eJKnnny2HcLTsVS1x2/aYkWoc
         /2LIbBnIyltg+LYmPB7I8X5LykPp/0cZoZKzzQ5Q+WJOPBp3aReL43E8oxTFm/NbmLF4
         qwNv3ot4Lxpk+U7ZFzwfplMUqlf0QOu0UTzks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869199; x=1791473999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33ugh1JWMcgP8/UF4U5Kxe1xOXj+ElXNCs++vic4Ae8=;
        b=jSWzZcd6FtYoqui+oEOfGpN9rRYVLmjpu2rM+hvAnAALxPBmB6/bEJgEd3M5G0H8vt
         /ruIsrB6Kn9NpF3DyW3h3HQ5YFsWrd0XbkRIfM2fWqmDxsk9tph1CQk1aD3F9EUrBqBd
         80LhiQBRSwNrsMNRcy80+0ajRAN9tqwYKlr7FCTOqwatoVC2X1V059cCPWuptHEn9Fww
         Yj/YFhiVFFC9sGRSEYo7y5MbWhwDWL/1FdLYko4/yQQ1fRd3WidgTkATuQGRkBIImxw7
         gBM2Erf/MsW4G3FnkwRZFbgt2NsW8CEwYegOdFC7wbJA7T7y/yoopSh6KSENQWDnZjYX
         AJMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU/3EOGzAMYnaGJsoeQsrj56xcFnURU0rn8ew8ZR6NLbGm40YR33u86YbnGYGlnN9QIaHx02yRtb6r1TI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/FwK4vO3fph7+t2mEJqVdLnaiVG4mDJdWoecqtiawVk/sthT/
	G/qMnVjUHmeSy67Ag8Lq2wi6OkbgR5QW6JqGJy6HAJaX5mDbG7Qg34C0GLnrNKpx4AoL31Qh++n
	7ylsaUx/SEMture3mlzyikiXjtReuFSBkxS1AtGmCKv9EWC0OXLcAjzae
X-Gm-Gg: AYBFou34MF85LqhV7VsSctIBndNS3gy2nwxp9hCYzSTBMaC6E0HCAljPaC9RyuHscT+
	dHzJ8UB0MIZFBbaL390m8QrBNDgHiHG75tHyeFRbiip17e3iCmNeIFhsQ053K+8n0ouK4gir32I
	eqlLADdzGsmCq7lrTPI2AHXBt+hakHUy2o8bX7rNtTOxqUjPyWK4oKGPs02JO8yZz32ooV0sDIH
	T6pdgeb783Rh8njVV8q5GmVmBLEKnCmuLWUvV0s71rAf5H6e+bV87di2AFo8m4z9EjF9uAdhDWb
	HvwujA/GSRDFjLcWMJZcbuLzfRks3M5VUW7S426uC5PAj1yu1n1o0DEpfWHFz79u9FuNypT04uY
	9T1jXkJg=
X-Received: by 2002:a17:90b:518e:b0:3a4:a619:9e6a with SMTP id
 98e67ed59e1d1-3a4d1b25bd7mr4253895a91.41.1790869198610; Thu, 01 Oct 2026
 08:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001085714.1086242-1-bszpila@google.com>
In-Reply-To: <20261001085714.1086242-1-bszpila@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 1 Oct 2026 15:39:46 +0000
X-Gm-Features: AclHuK_GQBP6uCoRCCq5xQM-LAx3aYxUTtCIoJedsD2JaykZ72mP6quteNaD6bE
Message-ID: <CAMMMRMcaceQ6YTaARYYYKbB0xvTMr4bW8gbF0Y4-EihrwCNXDA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Validate SVID and mode
 counts in discovery data
To: Bartosz Szpila <bszpila@google.com>
Cc: tzungbi@kernel.org, bleung@chromium.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 8:58=E2=80=AFAM Bartosz Szpila <bszpila@google.com> =
wrote:
>
> cros_typec_register_altmodes() iterates over sop_disc->svid_count and
> sop_disc->svids[i].mode_count from the EC_CMD_TYPEC_DISCOVERY response
> without validating their bounds.
>
> port->disc_data is allocated as a buffer of EC_PROTO2_MAX_RESPONSE_SIZE
> bytes, and each SVID entry contains a fixed mode_vdo[6] array. If the EC
> returns an out-of-bounds svid_count or mode_count, the loops read past
> the end of the mode_vdo array or the disc_data buffer.
>
> Validate that the discovery response with svid_count entries fits within
> EC_PROTO2_MAX_RESPONSE_SIZE using struct_size(), and ensure each SVID's
> mode_count does not exceed ARRAY_SIZE(sop_disc->svids[i].mode_vdo)
> before registering altmodes.
>
> Signed-off-by: Bartosz Szpila <bszpila@google.com>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 50a68819ceb7..4427897eb3f5 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -7,8 +7,10 @@
>   */
>
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/overflow.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_device.h>
> @@ -894,7 +896,15 @@ static int cros_typec_register_altmodes(struct cros_=
typec_data *typec, int port_
>         int ret =3D 0;
>         int i, j;
>
> +       if (struct_size(sop_disc, svids, sop_disc->svid_count) > EC_PROTO=
2_MAX_RESPONSE_SIZE)
> +               return -EINVAL;
> +
>         for (i =3D 0; i < sop_disc->svid_count; i++) {
> +               if (sop_disc->svids[i].mode_count > ARRAY_SIZE(sop_disc->=
svids[i].mode_vdo)) {
> +                       ret =3D -EINVAL;
> +                       goto err_cleanup;
> +               }
> +
>                 for (j =3D 0; j < sop_disc->svids[i].mode_count; j++) {
>                         memset(&desc, 0, sizeof(desc));
>                         desc.svid =3D sop_disc->svids[i].svid;
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>
