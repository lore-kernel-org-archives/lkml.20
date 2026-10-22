Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792636000;
	b=ln9ULGJ8DPyrEySrU6MfQALIejL7moc5+Thki3TnfbMNWc3KKPkijpi2umbS75HBVODR
	 w8WCAg0S9Knlyr1GCt8UDPGNVG8OYJX+PRPKDvMe+afiDK2PkF1qL2yBfIOigcXIuk7+y
	 /ji2mXfD6+0Ua8v6MhqSUX0atKfCBcypJWtp61+k493HgZ9sSatYO0TFGcX2rGxm5CUIG
	 Wb4WmrghvPbucVsJtufB0rYMZlKE74oiGTNkKShT1DhI2u5tNRkYdOh7A+hHI9zXCYPBJ
	 Cvt8LdXlIA/8xBsEGwpNliH2BHj3EOvMqPX+0H56ix8sErHwFdtZOGGe3w9MJ8lBtsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RkEzU0XAuh1vSOwF/onrhvMr4uvIUAAzgM9QJxDqjro=;
	b=AxRU9s0AOvwmHa6zloB1pMAtigang8rahUukT071LSMNAuPI/8f0/HSn+L+Pbb0nElAV
	 sdIiUI+2WxCHfF0gGzdKeie8h7alL21D9i5a6Hb3vUR9sisHxpj28V+RU9mzlOGZF/z5I
	 EtSA+SMdnWa3/MMkpEtJ8IJug1OUiFwyl56NFx1uaMjMuY5tso9kxfsrFBtF+SCntRfvy
	 w8vr0lfj8n9PgLt48xCnE38aR2mXnb6IbbNu8hV4sJ+DNo2bjVJEiCuyZ4f6KrYcCwb+1
	 5BkeXjEn1iPel30Ib3L+fMnWg6KpqEymvQks+yKvof4iuNRxEwVVJXfHfU57bQmubDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nq1uL+F9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C4606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nq1uL+F9
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a6bb779d13so646171fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792635999; cv=none;
        d=google.com; s=arc-20260327;
        b=iIyQCb42KBnVfACwCmL49RhiL4lqDhVuUaULEOtiv7MH57yD+NWkEMpEbCxAYUx5zT
         A3USGjGNhDI6B8H4eBVIVaAvJnkqBJiuZbw8t7D+rgaFPdJfVU2LL+UsPfyHZ7F2gwS1
         3q7FrQpq3kUQjZ9Cwz6YigAs92+e/1TzLS0hdTavmqKwVZW2lldUukHANcd/hxXojgnB
         W/fWF736NFXcTgQ6z+h1rngK7iYInd6Xt0EaClkYAxTuVK35E8EWMOpsSHQ9fbaidauz
         e46Rg8DzIx8YJSkgf6Y7FhOBPkYIkceUhBK5ncsfr/tqp2RyfGakItulDlMQ1HBbFufa
         kdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RkEzU0XAuh1vSOwF/onrhvMr4uvIUAAzgM9QJxDqjro=;
        fh=Y6SvP7gOFBWfU7uAGXlNmPG4WRj24U/O6AgVhkjSrz4=;
        b=rbhm5cizlpY3rktnsedMIuhOR/MMKl4k3ANgDJ7fUc60WFOzV6bG7X6qUhdsnPBFtM
         zx12t0QEIpAaPyFzuNJltVcUVB/9sYVTTahWG303B5kNTnQosB24aVqX8Yl0cedYNzfZ
         Yp9xdN2zC0Fw3UeWMFoToPXHvbsSCphOCo87wEjKDfWhNXRH/v+hOoNjSll/V/gS1Tab
         e90jyMXPTGGz1SY+4XPOuch0lNTuvVOQKS9Xk03kAn/qaSydMdLRWEJA3ZHu6pCjuaxM
         gUynDy1QaMap2tL7oZHgFf0/aySrmn2CDYf7EAnqUodCaXYG9ZOB7Go+CISBpUWuyhV0
         33YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635999; x=1793240799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RkEzU0XAuh1vSOwF/onrhvMr4uvIUAAzgM9QJxDqjro=;
        b=nq1uL+F9Okn1CXc8t4yx1SbF4+JT8PrpTHkqnecA4IjbVzJJj409gqdQ+Khkji8m7N
         xXD7luovmX1tTZG92UrAOK+L3HkBnaCzTrcZJCykO/IBNse0Xpw19j5HCgj8Eoilsu1o
         FNJv0z+XYe9XXz9v3dFsZXcfiCxwf8nXiDT9hPPxJxRRsxx1NDkrvhY0wQnZR9jmTq+i
         C+yNT5smNGpJ0ivjw3ZyqmafevZBSN+9E3EoGCHqq/O3eOS7t1cfk8U+dgJPNPMBSjeG
         kZmhoUH1/30oPxszThf2xVtrA6WRUfKekQyNll14BiL9vLNiUVLio1JGM7Xtut0U5hpf
         3Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635999; x=1793240799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RkEzU0XAuh1vSOwF/onrhvMr4uvIUAAzgM9QJxDqjro=;
        b=eDAm4AshDKaI7K7JC3NEDZ09TnI6XycDI5+oj0lcGePHk34Tu/Uq0Wu3iH85VDVmk0
         EdV3ZF1IuymZq5PgXp76ST+K3Dahn8LIjnLzOmVVZCf108FNofcbf93sd2cUp27oK0Or
         d51191GgWD1Bxnm2T7YQ9AWggpPxb6d/P8P7lo6Kuqa/zaKMhSt1Wo6oXGqzsapEV0lX
         AlB6T5HGUAge2opZH6W239PAd3/Hid81dfcxhhf0npvhyJiQ8Zv+B+9GVIG2gid4tYIT
         btOp/rxH5oHwxmR0guuOMXIfmFztJkr61qepGEo1djiKArsi7nZjpVD3HrlYKtaBZYpG
         3Mrg==
X-Forwarded-Encrypted: i=1; AKwUvBx8YSEiQAVR/qkZuOB7vgRww+EP0WC/FzBPPrQEtlMUkrg5Zp+Xuf1oTOEXMwfeAj1yd2kRKt/LpsOR/78=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFprJxYrjweDdoImpiaAJwRBKXmP4iqdBQ3p3N9EmvcJbbg1L5
	2qKCS5RS8i1zqYnnGIwUTSGgD1AgOHdLAEWGC7Us9uJ09StZ0j3L3OFAj9lLafOskt8rzx2zaGH
	db2m61woyFNH+vuWZMs1u1scGeIYFHyZSMWpH
X-Gm-Gg: AYBFou1ZsOqsxA6BvyG/6Z2DL9A5m1CY6bcIsM5UNhXGQuxmtmC1D4DEpxWp++pIZqL
	ncXsufZ6HxQ2wk8fsz5USrLhQzehhkcbXeNfrCSK5JUTlRJQo9X1/g+MdjssEaqZYf5plEd0Sel
	tXdMngrdVVwb1sz8jWnQWeuCu6gVNueWgKaw6VwSdk4qWxhu/+7lVCX6kbuNIdrYaVAaM47oSWI
	on5sTyj5U57O8KqhDJNRGua+ysSPw8xt1DkVl3Z9HSA6ACzHVCfDx9y1Am4cpceDXLrIm06GFOC
	Kf2iwJ85AiE97dsUCDXWsFh2X9kVZpASD997J67Oom91iRTCX/kOCY+Brn0KrpqN6GMvc02blHE
	KSAWB3J/2zp6Zc2VOVhUhY4C63dl4BlYKCDnf
X-Received: by 2002:a05:6871:714:b0:49d:c9c2:b770 with SMTP id
 586e51a60fabf-4a7dc1b09cdmr2662108fac.18.1792635998696; Wed, 21 Oct 2026
 19:26:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016141530.2795073-1-yaojiale02@163.com>
In-Reply-To: <20261016141530.2795073-1-yaojiale02@163.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 21 Oct 2026 21:26:27 -0500
X-Gm-Features: AclHuK-jXqJkBjkEEmv9deo3rIxZRsdXYZM_Ept_W2pqwSlhYahgFGW5jEMZIdc
Message-ID: <CABb+yY0s=eHDyW-=5++9zetFid_oVGCQkhqSWBQs+ty4Bnb-EA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: pcc: validate PCCT subspaces before parsing
To: Jiale Yao <yaojiale02@163.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 9:15=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:
>
> The PCC mailbox probe walks PCCT entries by their declared lengths
> without checking that each entry is contained in the table. It also
> passes generic headers to type-specific parsers without establishing the
> required record size. Malformed firmware can therefore move the cursor
> outside the PCCT or cause out-of-bounds field reads.
>
> Validate the table header, each subspace range, and the minimum size for
> supported subspace types during both the counting and probe passes.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/mailbox/pcc.c | 53 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 9888dab64639..37b2ddb44bda 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -553,6 +553,42 @@ static const struct mbox_chan_ops pcc_chan_ops =3D {
>         .last_tx_done =3D pcc_last_tx_done,
>  };
>
> +static bool pcc_subspace_is_valid(struct acpi_subtable_header *entry,
> +                                 unsigned long end)
> +{
> +       unsigned long start =3D (unsigned long)entry;
> +       size_t length, min_length;
> +
> +       if (start >=3D end || end - start < sizeof(*entry))
> +               return false;

(end - start < sizeof(*entry)) is implied by the two length  checks
below, so only "start >=3D end" is needed here.

> +       length =3D entry->length;
> +       if (length < sizeof(*entry) || length > end - start)
> +               return false;
> +
> +       switch (entry->type) {
> +       case ACPI_PCCT_TYPE_GENERIC_SUBSPACE:
> +               min_length =3D sizeof(struct acpi_pcct_subspace);
> +               break;
> +       case ACPI_PCCT_TYPE_HW_REDUCED_SUBSPACE:
> +               min_length =3D sizeof(struct acpi_pcct_hw_reduced);
> +               break;
> +       case ACPI_PCCT_TYPE_HW_REDUCED_SUBSPACE_TYPE2:
> +               min_length =3D sizeof(struct acpi_pcct_hw_reduced_type2);
> +               break;
> +       case ACPI_PCCT_TYPE_EXT_PCC_MASTER_SUBSPACE:
> +               min_length =3D sizeof(struct acpi_pcct_ext_pcc_master);
> +               break;
> +       case ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE:
> +               min_length =3D sizeof(struct acpi_pcct_ext_pcc_slave);
> +               break;
> +       default:
> +               return false;
> +       }
> +
> +       return length >=3D min_length;

How about something like

static const u16 pcc_subspace_min_len[ACPI_PCCT_TYPE_RESERVED] =3D {
    [ACPI_PCCT_TYPE_GENERIC_SUBSPACE] =3D
    sizeof(struct acpi_pcct_subspace),
    [ACPI_PCCT_TYPE_HW_REDUCED_SUBSPACE] =3D
    sizeof(struct acpi_pcct_hw_reduced),
    [ACPI_PCCT_TYPE_HW_REDUCED_SUBSPACE_TYPE2] =3D
    sizeof(struct acpi_pcct_hw_reduced_type2),
    [ACPI_PCCT_TYPE_EXT_PCC_MASTER_SUBSPACE] =3D
    sizeof(struct acpi_pcct_ext_pcc_master),
    [ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE] =3D
    sizeof(struct acpi_pcct_ext_pcc_slave),
};

return entry->length >=3D pcc_subspace_min_len[entry->type];

Cheers
Jassi
