Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30010EEB3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791764537; cv=pass; b=e8GCokUsFtRTUnIKqpVrepneo6D5pZLT9SDuIfWoQpTVjjP3gRpdx6217JQnZmtgv9pONgJqsuhlooQhBkiF7fC3H6ZWgliaz3JdabZ4+/9WkcqsJn02tqBYxhSekiq6ZJQ7jPr7V2aNF+rn4mxs3b/jDxL77DfT/uRTwMRr3BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791764537; c=relaxed/simple;
	bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRdfABlqBnA+QnT7/D63WhITQayy2BlepGiI5ZS//1zCt5Q7cwixmTB3SJWK3hs+Es6cgiplKSXtDnPRwkxl7Fa02+CTqhpKPlJO0pKiHUagiDOAKcdPUFzEmOTqAr6G+Yi2SAvLEPcRRJ2hPxfKPn9yARiO6aI3la19lRdLPis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWQMGmPP; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWQMGmPP"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4949f037131so757824fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791764535; cv=none;
        d=google.com; s=arc-20260327;
        b=khf5Tkv23FBWwmMZ9nkufodycvGmVPQq48AkFFrOCIqCk0f+3o0/O145q9fn7IQuO4
         NAAOEe2gVIy/gY173WIWC8xr3UZraIB7GgV5vLbKpMnA3XjP34JOWVc1SMnV6vh+wMMV
         SbmzxV1xgNojjOLnT2YQyIBeTHP0SVUXU0UYJ0Pu0ATgdUdcjAPaiVcnUxgCXEIieAyQ
         AsF2+MQ6YHEnwatM/wTOZFfuuqHNzCgHod6AZd4eVsoMjT0kt9MJg3ZH2Hr7WV1Yl/oW
         t48SS5+hL6fxi3HB5onDSJZBTynCl/tPz2Yc3BQ8nGmJLfO/+uNLFJ8qRN4iIuqnlY/D
         42Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        fh=EscQ7nN7INcDfbugUITi3TE9f1fZlP/Wm2vRYEAOdUc=;
        b=laIrFgpH8feCw+OugFuOpXnFZXyQb1QwX0XtVR1v/A8r9cw1uwaIuTRI39J3oJ4Aba
         4S/bh5qmC6D+Sn7YHJrtQDX+ByqdinN8mgvEYvnjMMbyTZ5YxUJZNq9JUI6DBcO+UpEo
         oUBvNdYW+aTAiktHG6Bt4gu3fJSRTcjNJPoZfRP4S3xbTFnpCkuaKAnhUBdv0hOvmUvP
         8JbVgRKTy41koRkuTUX+2ZnoI4osaQEVQPCAQFBXFrjNaSeyPDp6VOvcuo4VsgmwZTWa
         QsYuMDtXfd9mVV3C3YRBH1TkRy2AvpUI4SoG3nA+uMA3roqosS4vYhMeRip+CsYP3Y09
         Qj4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791764535; x=1792369335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        b=DWQMGmPP41YpckfCmNzbj2dc4kzFvxEd/CD+AH0bUt9W6lIf6fnkZ9PoVspLNpYcMG
         k4Ug7DS056vqK5/jEIZjyxDoXQlBFSl4Iek3xqfkDJIXGMi5ezqLAFsFgVBBHrXG5eur
         rkd/HMUz886WJLQ62ZplZA2B6pAAfOoGdzaf6o4Xp02ZgQkyb6vCQQWlCLGy0zxxxAnH
         t0UEpGqBH3wQBY/lbEkuSiIYz//6HgGxRQ1hCilavWT7mkf50z6QNFeSd+TGcqNolz2d
         3zOXXgbbFvZp/BKN6zUkgd/8gAsVCOvs2HLUhCLTg2yzi4aNVoS/E65u8GAg/JDuFXim
         kuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791764535; x=1792369335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        b=T//1FJ2e+fU5bBNpwogxcFIDT8mlOZ3aF61EQdFXIOjeYHu9vYJF66IU/wWOhFV/Wu
         KZ1lRsCkkCnSAKaWhgeIMYOV2GCcTuVDokDELxJmgYurOg8BUaqOPcSRNdtP3wBINtri
         dvw80hPkk4+5TUnBIsRZsbuqjAvThd/4SStjb0NpS22nIX8YU7/K8K76Gs83YBxQJ6w3
         DZKQPh/YGIi5ioZIXn8GK09rj3QGMn+Y+0kNT9xsz+JAwbrkRDsukrPbEA/eYae7JVh7
         ISD6uwqeMtlWBe1m5FPa84/W4fLXq6eol43v7HKoVDLuFpPpeVqbnzXsV+5nmXOPQoEr
         59Pg==
X-Forwarded-Encrypted: i=1; AKwUvBywmWcMhjPsaYxhtJRGAkMEmg1cJWf/4glriQZ2/leN1ubdz2NWjnblI4yGykgU7pfvruh4MrZXj3szzJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL51d6HLbEnHYYw2SEh8epnU4bM0EEFw/YrUr0Va/u46KXRRZIu
	083S7kU6w9j1uEfJJKjPQxDC2rWBRzRENDxUncJ4i4bZLKbYTd1dfY4/JCN4TNvp2d54F2KfMml
	PxwAApUdVnGCIVfAYiB4xHkNRR6Q0Nbg=
X-Gm-Gg: AYBFou19y+7k3x63E0MFefgxFRc0YoF5/QDTuVnalsTmzMJB/exlIdmr5bxih9U6Fqk
	0+aKISK+ZYPAG3STBMQPnLzX5C0LhZ1ZhSx3jeSVhEm9WVrJJcrvaSB5f0mmXmnoqEqJEanos4X
	S3O3EjYekxmMJ0/TSdy1lubReECWhWm264PtUp0nLhArx/fm5qxeOz7YxC6m41ipXLOUjqCGWWJ
	qOPGo46kRdGinFys6vmGyb7jQ1zir12vHyR+R2rOWww4qbRsGrK65VbEBDCyrk4CTact/EtAfOP
	5CbCsulIwHnpRR6r/oBguWzp2GYrM1GF0OmkDrWHrcQVqnsC+mduebw=
X-Received: by 2002:a05:6870:810d:b0:485:d1ab:793b with SMTP id
 586e51a60fabf-4a2a8865dfdmr6554627fac.28.1791764534961; Sun, 11 Oct 2026
 17:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com> <20260930150213.799245-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260930150213.799245-4-anup.patel@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 19:22:03 -0500
X-Gm-Features: AclHuK9MkudB1B-eUbBN_UM98-qj6k_wTx4wpH_rFnm3lLlunJHjpC-2zIymSsM
Message-ID: <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.qualcom=
m.com> wrote:
>
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>
> Some mailbox controllers can complete a transaction entirely within
> the calling context, without going through the queued TX state
> machine or a TX-done interrupt. Add a synchronous send path so their
> clients can request one and wait for the result directly.
>
> Controllers advertise support via the new send_data_sync() op and
> clients opt in by setting tx_sync when requesting the channel.
>
> Channels bound this way must not call mbox_chan_txdone() or
> mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> reject them, since only mbox_send_message_sync() is a valid
> transmit path. The client remains responsible for serializing calls
> to mbox_send_message_sync() against mbox_free_channel().
>
Seems like you want to use mbox_client.tx_block.

Regards,
Jassi
