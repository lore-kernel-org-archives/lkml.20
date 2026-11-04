Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793754949;
	b=toSAw22o8S2x2f7ji6JynXQDYpcmtUZ9S3Odqxv5JFxE5d752vqhYwexMh2uek7kbBLk
	 ramxprKPaNz8+/8A8nX9+zjQdFvWdcdbsQzguy202RTXtJvCbuxIHQuObZa3+Z0klysdS
	 kIVFhPZdtA1AvxNFaHNzq2kFRsoG6T1RBwbgERBBzs/zsnDusEOxlbMmtCvylMU4nVTyH
	 VCOKuFmHTn6AvEjrzQFct80F0b5KfZKILG88bhEEqNOBP/2hvqK7HmUDhYE1kWyH0kiOm
	 uGIZ/WBYRCWxEH7QsV+bOO5F5ltFG06qtTuRjNza30TRp11cBevJCk4n5HamvkziNjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
	b=Pt/3ky+0mkB3XWqffZAQqlLthixWmP8cqAUnV43VhoYVil0CGhnWktmJTmNSA/y+xhDA
	 BAauZKGmC6r2ODSUm2+Y30s+ZUPIbU7WeiMBHnVPe33I/DMgvJ1lXlzVLPbEeoy6FUf8n
	 XV0PkiXJ8uZgAA5YuqzbiWqTLttKjMfEitDVbcvdW/pgeOAOSa84NomilhueX/neaTCyc
	 D1XKjZScvMX8sKZ0YlnAlTZeGkaSgnKMga6GqJmfuQOTRaDlXGzDDcJ4LnR4b4oEH+lmW
	 6b/cndTcujA7DYhcfhpi+PuG9dM+7qU7qKnQEfCdgbidyzXXxQOBxGn1I1B6k4z1Hww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fh1ATudx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD251606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD251606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fh1ATudx
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535f598d126so71911cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754948; cv=none;
        d=google.com; s=arc-20260327;
        b=smJMIpjhSsxHk6U0XsMLDq0r7sSieGEqdYN6D4W6xa9McTbmc218UO7iFE4HH5ypUg
         1LvrAwQkea/4Ul5r2etJ8uoa391l3t5hA09bBy1srQ6oddPSR0s896b5k7UZl2Xb6Nn7
         kUNRK2M0lDymb9lztD6KQrXTzO3y0+D7KB2mGY5oZFuFqk8UMTMwOM6OvnT/F74Dnu2B
         gvqyKhaFdYoXqcL/FWeXoDMsxC+qpQ7PDfPH1Kjxlx9fz3sCJ4GUhbDy1zP82abrkeTh
         1mfva47k2wEz95H/vCwW6gdfq1hkigtBjRSUyKwXH14jXq0RRoMExUFWWG0mDJYRzUc4
         PnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
        fh=1Sb0k5jdp8HuWCQ3KXk/BdkKVUkljNzNTD8HTSUJEpw=;
        b=f/Q6/PHGZEBjjrIt67Z9XC0270FiswTorilV7a0pxwk4MIMFbEQstY9Ex8w85zyRG+
         S59AbHuCpoZ2+vCGld4Qw7f/dIMCm62IoeLAudyfiXnOdw5fy8dyRRPdshrAokQOJLHf
         TJja8s9TUNAyacmeVZ+h0RDqIVWPI/ALuYIFBJCex6h5pnfs7ZclFZAg1Lv9uICFzcTu
         Hsco+Hc+oVW6cdiKEXthnpwC389UkNTs30vhML6G7GgDxDGVauPx/gGp83bpCz3qBQ8+
         MeVLMM5osHAyHd4pfgfxojjXNHhYfBk94BJZzL7uXKNBCKQXErpsq3Q/zPAD0Yeuz7WG
         zV5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754948; x=1794359748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
        b=fh1ATudxsNsOAGegFAZcVmUP1Fx3EtQxgH/v2zX3vUX1pLcyXXfOakpCIo0oL/ab2x
         NhI0elE7uDCVKO9qo0DY84PwQHCTByhQByacDemYfZ2S5V9Sj+xxZLXQPvGFxzUFPTGO
         ztXT82ygM1b13WnZ0h3TXIraK5tkzzgmeDzzOuedGhx7/5/ecOutiMerdEDZvgblzT2d
         ec56WOviDFzZT7PQaHCtKzkHHkimEFdm08rCSlnQXbyeRMbFeGpVjKgF0akSLCVDErHI
         lr9e0HUfDDhccT85Zre2RWRgLH2ZamIM8SVSzJLoEep/bXAJStkSaH+H+H/xMMEfAS1+
         vt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754948; x=1794359748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHfpgenBkiZZTG6G9AXsdWAKG/dzpqqNAWD+meV026A=;
        b=ek3jnF0B48y6IQn21rNwRs1p+WCOuFCfDB5H93poWoYsgom/pS1GoSktohzkvu5tLm
         jwadd98LCFyKQO+qWiFlyz3clakcGdvBuu+DESzKmcZSSfZxRVbLB/YaPOMEDwa50pQJ
         gztI0Xhq72+hx063FE/hqPRr8omd2M7XAvzFW1CpYbsEhIxdshS8SL/hE5eG7mwOUeTT
         pPX/Yd0D8e1tV/PNOyxI+bXKzjP1ogFC4POt2tuS/qIIo8K69LRFSPOoUS+ddQvalSnf
         Vi2kH9UEBS0O5tU1ZJdHFppcBebkRawJL9dGRvZqhH+5BIZJTf8cO84DF8qa3Xb44J0l
         jqpw==
X-Forwarded-Encrypted: i=1; AKwUvByGD8+c7X2JG6Zccf4p7SjonG5NrRlIkbmfSylmqLEVU609UoiR+Goq5n+9W3wlvozDUk4NbCztrCjW9dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+unoZl2MKtREw36JBZFfpHpTre9sqElxV2utVGaQ20EhaUZHLn
	38APQSDYsy82rMFUjumXEKou+XVWEicnxn5VuV2F9SXDyEjQ+1B+d/5/HqrQRaou9DUvdTXEkzZ
	T92BvHcbPu5G+l7wwnPEz95DtJeWD4VQccgCHZKry
X-Gm-Gg: AYBFou0l56mQcLVtRkCJrfc6VluwG+dQ4MIhXMzo+rvlDkT6PkcLrc9rs5HzciE6+db
	mu2yLq6KiGn5Q0u76CGotG5uqEuUw9ZYDppVXnWouyM/rp2PqhWeijXgU9H6XEC33/v1I5pIgma
	RQW2L8syACekQK7wwQNsfwE0yP9StPNOCWrzWsB3+PxRcmKDqH9SWvkMyUsKCQfvblAGNetB13u
	8bdzYujYI+aXKSU9RZ8i98F1sVzCBpKBnBKmY2PbmOhGNFUHOt/2kO2AbwRqb/YsxXo06yTIS0I
	MPaWMvczvAkyjXV6vJc3rIqWKPUCeLYPBlTgHkBWKFWAKnEjkvGflnhYNr4NrH0BDwsm1vePSCC
	ubxHAbXnffrxV9c3ngZ2uzpjI6govdXluAFc=
X-Received: by 2002:a05:622a:250e:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-54b5a3083a5mr1086781cf.0.1793754946755; Tue, 03 Nov 2026
 17:15:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155454.534649-1-sashal@kernel.org> <d3c8baa0-3ed9-4f3c-805d-86c98a6bdfe7@linux.dev>
In-Reply-To: <d3c8baa0-3ed9-4f3c-805d-86c98a6bdfe7@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Nov 2026 17:15:35 -0800
X-Gm-Features: AclHuK9K5AyCjIDUUWGXTgKHl6lHpNmZBhcxz9wcjVeAYMDz_SXNrtQhBbk_zso
Message-ID: <CAJuCfpHZEgGwogySAbUOWxb152sDhMrbRO3gMteCRt0VGLc+aA@mail.gmail.com>
Subject: Re: [PATCH] kselftest: alloc_tag: use the ll64 types on powerpc64
To: Hao Ge <hao.ge@linux.dev>
Cc: Sasha Levin <sashal@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:09=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
>
>
> On 2026/11/3 23:54, Sasha Levin wrote:
> > On powerpc64 __u64 is an unsigned long unless __SANE_USERSPACE_TYPES__
> > is defined, so printing and scanning the __u64 fields with %llu warns:
> >
> >   allocinfo_ioctl_test.c:93:73: warning: format '%llu' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'lo=
ng unsigned int'} [-Wformat=3D]
> >
> > Define __SANE_USERSPACE_TYPES__, as other selftests do.
> >
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> Acked-by: Hao Ge <hao.ge@linux.dev>

Acked-by: Suren Baghdasaryan <surenb@google.com>

>
> > ---
> > KernelCI's powerpc kselftest builds show this. The define makes the sam=
e
> > change on alpha and mips64 and none on the other architectures; the
> > x86_64 and 32-bit builds don't change.
> >
> >  tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b=
/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > index 74fd64b2370cc..18c761fecfde0 100644
> > --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > @@ -1,4 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> > +#define __SANE_USERSPACE_TYPES__
> >
> >  /* kselftest for allocinfo ioctl
> >   * allocinfo ioctl retrieves allocinfo data through ioctl
