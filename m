Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793448997;
	b=x6KAflxXtzMY4RHz5jNKLGQmmTnwfk+kc0MoDoWVBLffgS3cdvqCLkf8oW4IeQoSmZpu
	 TZ5Dk+LvQ4dl56jLixNJV3glG180DZVUmVj1fmWyuthou0PYkWjGz9fsbWkSPj4uZ5oAB
	 OzNRMgPwaQjxZC/dLPW9jRq/CFR82keuwzTcT+BqyiN4v4a3hLVKf9fM74clcZYzdPjqv
	 N1A6wsk27qMy2QMaYTAMWIOmmkVp4WPEmnXrOgDKr9yEckkbpNvKxBk3nc2HL7Q1uGrOE
	 rdVAAtYbtLUWKG5dglDz6hlsvdYampGzyqA7EDRv4tgMqkxOxYjybG8S1xd3Vp9QTog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DoH9E1vvOY+ET2DD3YGUjhLHHj/QLL7DcDot0+tLbpY=;
	b=P4xzEIr6JMvjvsQcrnJGNF7YftrBKmKCPRpg9wZcY/duVcpAqIg7jshHIcYaHF5ElmJM
	 iANLw2WCM/m0VgnoXaf8tbgY2nk9HHByFuLhifA4q3M7jA0IDEUeHyPQbOMawt8HCflHX
	 J2hnm4YrQS9xvgV0niZz1xCHT4/cSeairEeqZC5HhH1xFoh0srM8CNpbFlF1dQeK3+omL
	 2Lfm6PgLoE7QJ36dTcc8X3jnKqM+PwDdX67QvsiZ4yZIx9v2GaOjniLSbqqsqeePgU+LX
	 qmz5yl19AUIBtspU5o4b+wQNmFF319yz9GTEBLtYK9Z1NcS/HDoaoFCHJTIPTQVjZqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3xVpNPm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA73606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA73606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3xVpNPm
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1931ff67a29so1500037c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793448995; cv=none;
        d=google.com; s=arc-20260327;
        b=U8dacQmpnquOkuyBCgm0e6eThDY57ODxWuqfgDPtJKvIz7PJb3MO4KQ8N+48Dprv0h
         EU2usiDfHxjgDmkFTpSpuqryfSqf1fen79EeQo+Df7QqFEKGJWAVSB9TxisRxQGhuKEV
         UtgZwKinPtO4XB2yWB3T5wbUv49a1A9hSrOCyxShk3GWPBvuEPpr9Tai+cbqmz68X8Sl
         7UaLsatTaJ21f681Jr0WcmVVk+kGp+DK5Fnh2qPSFpYZosDVVKBeuHr5gsJpavgbyF2G
         0xQEcyXxhKogisZdHs7MKXNman0SmEBrujIDfTSSyjoahzNOdtdK2FcaC2/mHmv/lTtf
         5e7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DoH9E1vvOY+ET2DD3YGUjhLHHj/QLL7DcDot0+tLbpY=;
        fh=IkY2evtnESAyX2sNjm/EMZyWp50f0Ckh1aQPVOR1jm4=;
        b=SVq70xVGBXBSMqQ9DWycj967oR5kiudAJa6D2sq/r1BYn4Jmv7D057MPK2ZR6FtaAZ
         QFuT4QliIIkJlCXHkTtOtoTd+3wWNAQkjExSyG/Sfna6vvwKXgDyOUVCubpz3KqdQ3f/
         qtN8KQD7xutPAXXplRVGTPxre6chwv1uB4zuzS6Ga/0HtX5t0Z74OyC4r+ca+NjYeJ0w
         p4zrCtzC2GWRLxpmQ72fXwEpJPk9Ne40Vg1HnkyzF0xLzfN37o14R/JbujW6tsRgnB5T
         1px962n+7s/ufQ/1+gSINMejECpJCn8tvLS2wS8wUF//hwrUGGuMN+cncGGDq4sxrnqC
         vx8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793448995; x=1794053795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DoH9E1vvOY+ET2DD3YGUjhLHHj/QLL7DcDot0+tLbpY=;
        b=l3xVpNPmNMWRSl9KafuM4h1YbTn55Ai22RYCmQPJwKQDU9qlbwQZWNQX9MUm0wZfHq
         4wgtmq9gSy6f2SWqA11sDP2gYPpGY2G4CaZomG7RPh/ykx9nepQPcVss8SuI/Lq2jyrL
         SAV6tnxnAIvuJMBgfF64bXvPWDk+ERZmuaUwvBfjCVAT9D93ehVFUjP6eLs+tvpnvK0+
         HqT+7Gkvb0d9ChutkZf+/mfiH0xwP01QwX7RcZJXTxHmR08JCwxG83k7cBJssLceggs4
         CwCZvy1PqavIFNSJ8s6658GjYz6gcsOgoDaxI+W0FThaUlpW5FweYWINQ8FsU9sf5LLa
         5d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793448995; x=1794053795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoH9E1vvOY+ET2DD3YGUjhLHHj/QLL7DcDot0+tLbpY=;
        b=ndlk6pYjLqc3Hc8dqpWfgcLk+5jTtrsCSLXCDCCVQhps/MMwFRkPuZTnE3UNFTsWyS
         LYkzzBz/rOpJUOWAD8vqtjqBSgIoFKf1howOvk4TPb+90zNMDyYigQdCiGohEADLeN0j
         o6NfR6XKVGJcY7mvnIN/n4ADbL1IwsG+QT6NK8kT3UWUtPwy0KFPNTwWKzbqDAdQykaN
         QwAmfhmGhfN0pwuOz5LiiW8z2TsLFwohi+ogoaeSVAeFoo2kam1TZWhDFYHgIRvAe4Kb
         lRw5/h+iXkQqiyWrV0B+LoDzkTHj/7bN24zDYpHjxwLnACwZSSJ7qn4oMM4/cpE/gddi
         NSoA==
X-Forwarded-Encrypted: i=1; AKwUvBwmMJEzk3gmljq4/aTPfL/bS66h+k1K8299c/RdCCDynEtDhlct/fXHbWPL85CmID5Qw120bjL4h8iIz1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSwA+spLNcD/O6u04pDUJajnOXtaX7Ot9oeivI3NVMVinOg7mY
	aPoxAEItpkJSGFN1gFdLsQUEswg58A1J8000qk7Py+AiZ5f72cY/GTGxIwvylIpU1/NHeOqggLY
	JZFObbhyT3XzrF6atX+HK95Mi/WVZ3Lo=
X-Gm-Gg: AYBFou0ZxtF4BKvEV50PwhtUoXq37x7NgJiKdpwrUHhTkxy0iBhVA9SPbTz7EyntdWY
	au13xVkHDR9pJs/E3QFr/PESx7NuSttHPpDXOldenuWyiPCTPm8iWl6+btUKKwoiIq/xBekkzBy
	jUUm0Kpc4rmk6bhxLI/gzTAW6DOilNg3BwlFP3ZWCX7zepsZCpv872Qe5nU7+lq2w1NbAe0iZa5
	mE80L0M4UfxYP4SxAn5SBYnzQqyvsLYo5t+lZHRhAvyqwyJ/lySIOA3M2VjX5QU8YkoKshavlc2
	ZqqYCrnMy3Rg6MemCKvLniqm6lrwgSfkS5QPAWmcyi7riXJkFoWVjNfHbTCm5qXD8ofKhGM7SRl
	G8aM3PW2KoizQeEKc+bdvcSXkzLunfw4iiDn3ziYr0Eoygt8GFs9BngI93xnUksrRvTIFChkUNy
	/ud5u3CeyGGphp5dOB
X-Received: by 2002:a05:7022:ea5c:b0:1af:d88f:fc51 with SMTP id
 a92af1059eb24-1afd88ffd37mr870703c88.30.1793448995539; Sat, 31 Oct 2026
 05:16:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CABD5TJy-sp0knXTpaBhJ4+zvc42jaDFggX7jKpqUvz6tTVhoTA@mail.gmail.com>
 <CABD5TJyqC846A1=dL2F540X2rs-t2Xv=uT2SzLLtCnczCYHqeA@mail.gmail.com>
 <CABD5TJxfTaNfLvPEjyGwrTb9Jn-bqq0mjXjUn7Vv7dCeLD_6pQ@mail.gmail.com> <CABD5TJzXM+XCM0fhkRCaKdr9wQcgCTvH0RhhUpfaR1X2=z9VBw@mail.gmail.com>
In-Reply-To: <CABD5TJzXM+XCM0fhkRCaKdr9wQcgCTvH0RhhUpfaR1X2=z9VBw@mail.gmail.com>
From: Anup Keshwani <keshwani.anup@gmail.com>
Date: Sat, 31 Oct 2026 17:46:23 +0530
X-Gm-Features: AclHuK-BZ9ANLyVjPpfyrqH4yaBlGhNbuKeVDyGHNBpXBFEvP4qz1GRx0Jp1Zhs
Message-ID: <CABD5TJyT4VBrmGkx64_VGc9n4hSDw0ZHLpvLFdXKGHaKywXXFg@mail.gmail.com>
Subject: Re: Subject: [PATCH] ACPI: video: Add backlight=native quirk for Dell
 OptiPlex AIO 7410 35W
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, johannes.goede@oss.qualcomm.com
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I also realized that johannes.goede@oss.qualcomm.com isn't updated in
the get_maintainer.pl script. Perhaps that could be updated.

Thanks,
Anup

On Sat, Oct 31, 2026 at 5:43=E2=80=AFPM Anup Keshwani <keshwani.anup@gmail.=
com> wrote:
>
> Dear Maintainers,
>
> I noticed that the following patch
> https://patchwork.kernel.org/project/linux-acpi/patch/20261010124830.1167=
50-1-chitranshmandhaniya@gmail.com/
> was recently accepted. I actually submitted the identical fix a few
> months ago here:
> https://patchwork.kernel.org/project/linux-acpi/patch/CABD5TJy-sp0knXTpaB=
hJ4+zvc42jaDFggX7jKpqUvz6tTVhoTA@mail.gmail.com/
>
> I just wanted to point this out so that we can ensure the history
> reflects the original implementation, or perhaps I could be added as a
> co-developer or 'reported by contributor'.
>
> Thanks,
> Anup
>
> On Tue, Aug 4, 2026 at 11:21=E2=80=AFPM Anup Keshwani <keshwani.anup@gmai=
l.com> wrote:
> >
> > Hi Rafael, len, and Hans,
> >
> > Resending this reminder to Hans' updated kernel.org address (apologies
> > for the bounce).
> > Just a gentle ping on this backlight quirk patch when you have a moment=
.
> >
> > Please let me know if any changes are needed.
> >
> > Thanks,
> > Anup
> >
> > On Tue, Aug 4, 2026 at 11:10=E2=80=AFPM Anup Keshwani <keshwani.anup@gm=
ail.com> wrote:
> > >
> > > Hi Rafael, Len, and Hans,
> > >
> > > Just a gentle ping on this backlight quirk patch when you have a mome=
nt.
> > >
> > > Please let me know if any changes are needed.
> > >
> > > Thanks,
> > > Anup
> > >
> > > On Tue, Jun 16, 2026 at 12:29=E2=80=AFAM Anup Keshwani <keshwani.anup=
@gmail.com> wrote:
> > > >
> > > > From b289e63d7f44500517dc94b7028b707616fd1dd1 Mon Sep 17 00:00:00 2=
001
> > > > From: Anup Keshwani <anup.keshwani@dell.com>
> > > > Date: Tue, 16 Jun 2026 02:57:11 +0530
> > > > Subject: [PATCH] ACPI: video: Add backlight=3Dnative quirk for Dell=
 OptiPlex AIO
> > > >  7410 35W
> > > >
> > > > Dell All In One (AIO) models released after 2017 may use a backligh=
t
> > > > controller board connected to a UART.
> > > >
> > > > In DSDT this uart port will be defined as:
> > > >
> > > > Name (_HID, "DELL0501")
> > > > Name (_CID, EisaId ("PNP0501")
> > > >
> > > > Signed-off-by: Anup Keshwani <anup.keshwani@dell.com>
> > > > ---
> > > >  drivers/acpi/video_detect.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detec=
t.c
> > > > index 458efa4fe..10e3c1657 100644
> > > > --- a/drivers/acpi/video_detect.c
> > > > +++ b/drivers/acpi/video_detect.c
> > > > @@ -886,6 +886,14 @@ static const struct dmi_system_id
> > > > video_detect_dmi_table[] =3D {
> > > >   DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7770 AIO"),
> > > >   },
> > > >   },
> > > > + {
> > > > + .callback =3D video_detect_force_native,
> > > > + /* Dell OptiPlex AIO 7410 35W */
> > > > + .matches =3D {
> > > > + DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > > > + DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex AIO 7410 35W"),
> > > > + },
> > > > + },
> > > >
> > > >   /*
> > > >   * Models which have nvidia-ec-wmi support, but should not use it.
> > > > --
> > > > 2.43.0
