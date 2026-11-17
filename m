Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794901768;
	b=Jt2x7e0u+wqp7aRWBX4c2RhTPfXrrF3DvrglHxUmQBbetxF8soqz5oOHfp75zU1Vn88X
	 8yO0uGVXzYF4Yebt70Qx/Yh4I4wwEtbttJS2Fta24lxiqrrujvTauGHE3SWtJYi9tSp/w
	 UVFOv8P3Ef+zi053S+poACvlMzOPBtVEI6wzcqUvgd8XehOtJzPIhiMNC7Xx/2pc85x/q
	 oRJlehzdIVicAtZL23KUESGMmShcfO8KWFPPWsy+QH7MvJG0dN+0bHtwX9V8CwHbgZc5R
	 8Yyi8yncR1AsxVlplz9N2B687Oy0AzYEev+LzgH/S9rXoUZ9u1ulFCBRB+rzvMfSEqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901768;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=;
	b=NQbXwVmz5YyDi+i1J56H/cpvQ8McvI7s4gRVrZwG1w3oQZHRK4fdlkxyTdUSSKVrHrOw
	 Se4SvIFqPuFxdDIVezIjL8E1RelLqePvbiFGY/5mGenpDEXYUqeMceQNgRKu9ybWvimJk
	 2Y+qPNPMroLdf2ze24FParIUL79eQC6GoHLYed0U86nfQmNLa9tCtM91ypvDDbdd0ohwH
	 NDCOOyI1w+o0G3YJ5gUe3+izd0qpfCWmJGVn3LXIEWb35jVl3if1qnUcFtVx8IUGvkL/U
	 dKW2GyTalE7962kHqTs13CsHejtO1EyDK1lRqMhWNQGl/rJg6chuwyZIstwiFbIq41Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IHpLvO2X;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V2zpJBbT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A3C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IHpLvO2X;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V2zpJBbT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794901767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=;
	b=IHpLvO2XYk8949o/h1mcnl1JBOtwpOtJDstbW6IrwPFybO5yo2amFl7UjbvvjIPWfTqWPD
	brYG+cT000W6c8Gr1tVMk1/siorpKPsGesuYF1BzrI/D58nJJAfCi0TgXtOEj2DMygAb+M
	OM//dXZ9KTue6h9CfkYil8a4Bt2bOKg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-iGVByFC-NRauQnJx29lPuA-1; Tue, 17 Nov 2026 02:49:23 -0500
X-MC-Unique: iGVByFC-NRauQnJx29lPuA-1
X-Mimecast-MFC-AGG-ID: iGVByFC-NRauQnJx29lPuA_1794901761
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3adf2609b2eso3706821fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794901761; cv=none;
        d=google.com; s=arc-20260327;
        b=WKSVSSZCLFOupoYI8oaD8eaz8y8yf19VzNFKXJJThnQgEAFe/xcmwuF7VrBvOwr5bH
         mpO9INedz01pHvgUftyaKlQMER69jzelgQU4305qMASzi5VUlO9nl/U3HmuEyC/U9xGI
         Twmc0tG8QOSr7mNWXX+CgwvjDznV9xagwlK2/lQHWU1vgrew30cj9Rz1EZuhPw6HI16O
         6pRN9aRNfc07eURrt70M8CZNFgOO32lc7pzaYMwrx+XmJ95j/ZDA9zuYLeYWKJp5QO2M
         5X7K3DEp+szqK4zhs/IJ6pQjoivoTNMsC9yw5BjfNgKzUeMiwTG6wCuxq9AD7SeKj6uE
         4GQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=;
        fh=qK5dGES4KYsqAJmUJcs/vv3vTZLmG0ky3Nb9XpQzCeY=;
        b=nBrp6hQHrmeGEqOd04Ve/KFBvLO9fTZLw74qdmdZDBkvrIUctg/7RAf3gfFBSB6SDm
         rpkw5NS6F91hOUat1GJgvNUNt/WVnO0ff3uONSXRzqQX6U/zofvUNSaU/Se1RI0kAdx0
         id4DV5xWl9CgbX0NVlidBmd8nhTdbfuAPEPqRGS4WkkUW66DRVSMHmQe3o9i3tBLFSsp
         1ozR7Ea+vU3cedI3/kKIrCRMl1TsfTUXWYFL8ONTqBBX4rOLzpPHArQvoY7hf54R2p+A
         BmBn+3mNmwbjEYhTGB71VkrBIsiGaujkHQLozbfqvQMsbvBFfKUBnz8x+bBRfZ/ra23O
         Hqgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794901761; x=1795506561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=;
        b=V2zpJBbTXxkyoGTreMuJ14euKVod122hAysL1cy2Pp7qNhi6D5bJG9decyEleDU/Aa
         58UkFi8590j2zxCjtbk9BMl1zKZzkaSYQUlRjIdSaM+BjhAYLMpT0a/2NkgHlGzcrp4f
         2Fikgu8USNCNL8lGXOZZ5Z3kW0KYd2st2+AydGRththFRS+3WhWpzoTYZz/5DlVciS5W
         WSiC3BwGDT8/wWkYUcJrG3AtcnCs6ttN2tN8aoImaoYmexbYxVL5MKExZnsmxQVCr/6B
         Qy05q7yFqoG3J5ePSrhu9PGOMsb58qWBjE/DP+hLcvT/eBuej9EES+btxked85b1cocm
         0yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901761; x=1795506561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+EOPxqwkWZ2cHqsa8jpQYbKGkkd/ZQjRhVzle3euG8=;
        b=mSgfqP/d+fsQHo13PpUkZQKoQ0fvVv399l6daKXLCnWBYPRoeVi0/lS0wlUaGdgQ3b
         Rspf3uTDOydX/m0DQi+mmyCiyiB1kayHMTAm+SBz7rIpLfwSbXjdHmyIEEZUuDMteB/h
         LRtzhP2dTLMpKzM4XUPHfetYttJE/X1KqMFPa5LtbiJFLuHI3QyA9/h5k7yL0iK7XY+Y
         lJUd5k/nOlBT3uxYrWLMlgCQGLZTPXDDqUqXGbNCs5b8ITxLZQXW3D1ofI6kotgAp2Sn
         qBTf7qWSheP/t0Llf4QkoQzu946PAV75VvEakPDFfY4NsStIIRuKeFMGQbtAlgkvYRBE
         zrXg==
X-Forwarded-Encrypted: i=1; AL+hErEGquo/cNpsmPuA4Vrhr7znuLLPXJzEBkmMZuRqJZYdKS0nRYP2UwWSUDv6OcziheOIJY0AJvsLTAglzHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z92Syab7ZMMt6fnrwoOKg+FwUJyKgKmjp7VssfPOxx7cCFQw74J
	FaV6bgHbyf6xjl9+orbqICA0GM+awHMn2vr8tMdo0SBI1fVfnIsg9PRbnVVhuNP6orQVtSzno/g
	NQQ0D1XVNzp2v8/Ikl4gKIHgJY74I5c64M1suwkGVkCTQAZWcZNAmhunVwAE0NJ1NBPzF+9sChz
	Rylj6yDaNl6nJLOLuXHFC5NwBrK+g42AjLNxr57P7q
X-Gm-Gg: AYBFou2nPC3qnOPXKgBbXgpUjXcVbZuylVuF1pRupguOYHYBD6zxpAbE3/m3JgXXGYV
	HbcQqbtQvOoZQ7fnX35ocwV7EiiES2U6xcYpaR1TZExL2n9mSnIwkQ3FQntid3UCzKhYDA+jMgq
	IGh+TB2LMQUQZTNZFpQrX1yEqB+rNQajcNBhNBdk2gE/rao726AuqaFvOW
X-Received: by 2002:a05:651c:4414:20b0:3ae:1073:570 with SMTP id 38308e7fff4ca-3ae2b38d801mr30811941fa.0.1794901761045;
        Mon, 16 Nov 2026 23:49:21 -0800 (PST)
X-Received: by 2002:a05:651c:4414:20b0:3ae:1073:570 with SMTP id
 38308e7fff4ca-3ae2b38d801mr30811681fa.0.1794901760567; Mon, 16 Nov 2026
 23:49:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-ufs-rtc-query-retry-v1-1-4de69b175e8d@redhat.com> <780f3f4ceacd7cf078542c9a8a4c8c8dba9666b0.camel@iokpp.de>
In-Reply-To: <780f3f4ceacd7cf078542c9a8a4c8c8dba9666b0.camel@iokpp.de>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 17 Nov 2026 08:49:08 +0100
X-Gm-Features: AclHuK8oY8bBLMyg0w_iWRcoEI_SclPw8SCGmbuuZYp9-Co4zfSo7Au867IO_8Y
Message-ID: <CALE0LRs_nkDT_NQfNw31F0hdnEyUko2LzmHpmM4RFh09dkysxA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Use ufshcd_query_attr_retry() for RTC update
To: Bean Huo <beanhuo@iokpp.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Mike Bi <mikebi@micron.com>, 
	Avri Altman <avri.altman@sandisk.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Luca Porzio <lporzio@micron.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 16, 2026 at 11:28=E2=80=AFPM Bean Huo <beanhuo@iokpp.de> wrote:
>
> Thanks for the patch. A few comments:
>
> On Mon, 2026-11-16 at 14:39 +0100, Enric Balletbo i Serra wrote:
> > ufshcd_update_rtc() uses ufshcd_query_attr() directly to write the
> > bSecondsPassed attribute, making it the only query attribute caller in
> > the UFS core that does not use the retry variant. All other callers use
> > ufshcd_query_attr_retry(), which retries up to three times on transient
> > failures before escalating to dev_err.
> >
> > This causes spurious error messages during boot on some platforms when
> > the write-attribute command hits a transient OCS_INVALID_COMMAND_STATUS
> > error:
> >
> >   ufs-s32n7 4ac80000.ufs: ufshcd_query_attr: opcode 0x04 for idn 15 fai=
led,
> > index 0, err =3D 15
>
> this is printed by ufshcd_query_attr() itself at dev_err level, so it wil=
l still
> show up with this patch. Could you share the log with the patch applied?
>

I assume I got confused because after applying the patch both messages
disappeared, but what you mention, and sashiko also pointed, is right,
from code I should have still see the  ufshcd_query_attr: opcode 0x04
... message

The fact that I didn't see those messages after applying the patch
likely means it showed a case where the first attempt succeeded. I
didn't perform a lot of boots.

> and err =3D 15 is OCS_INVALID_COMMAND_STATUS, the value the driver puts i=
n the
> UTRD before sending. So the request was completed but the host controller=
 did
> not update OCS. This looks like a host side problem? not a transient devi=
ce
> failure, and a retry here would only hide it. Is this SDB or MCQ? Does it=
 only
> happen on the first RTC update after probe?
>

Answering your last question, yes, it seems to happen on the first RTC
update after probe.

Larisa mentioned there is a known errata that will be documented in
the future that could be related. We should probably wait for that
errata to better understand the problem.

>
> >   ufs-s32n7 4ac80000.ufs: ufshcd_update_rtc: Failed to update rtc 15
> > Switch to ufshcd_query_attr_retry() to handle transient failures
> > gracefully, consistent with every other attribute query in the driver.
> >
>
> ufshcd_update_rtc() is not the only caller without retry. ufs-sysfs.c, uf=
s-
> hwmon.c and ufs-txeq.c also call ufshcd_query_attr() directly, so the com=
mit
> message is wrong.
>

Right, I used the wrong wording here and made the mistake of only
looking at core/ufshcd.c, not the full core files.c not the full core
files.

>
> > Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
>
> > Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
>
>
> I would like to understand the root cause first.
>

Agree, let's wait for Larisa patches.

Thanks,
  Enric

> Kind regards,
> Bean
>
>
>
>

