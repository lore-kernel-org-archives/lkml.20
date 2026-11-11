Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794377775;
	b=0rWtVUGcpd2pyI051bnByAsmnkUe3HP3ZZBCin81zkjhXDd2G7WrQk6xauP/Ebnbc82S
	 l692pGBj2kpdnHpqPzsc7DwVJDyDxKCF8pOtFJgUrzZ41hnHZip7v+cFD21KTcfFx1+iF
	 kh8L09nd0TKf1bcxh/BnQIgD9ifxFtap+vNUSWbkruz1GshD35x8hpMhgjAE6NKHmM35w
	 xNrvPt3MDIfd0t+aefg4B2WSPbfMirOK6rvQxB2hhJA2bfmjbB+jiYAiY1Lm1nID20mVM
	 P4C17qvCNsBi8zL8Y7wZWDlYolDQv4vCy9Yh38Kji+v4MiADNng7ufnt4uNsYT2MVuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p71/DW116beDMpJe07R6eFNT4MapU9JGcbN3csjU8TM=;
	b=sHDOb2nXT2fFDWm+ALutbuumJPF5XgLvEWKwik49HhnT5ZZ7wJwtd/rGSYIlPBfhoyLO
	 sWbe6QqcEpMKkMyG8fKOjb21c0CJFmAOaRFCba4w5CsxjyEDhvOSqr45RKIFyVnW1STRl
	 dcxyACQlLKuvb6vgPuAEMruYXcFK3nS1LkMQrNefpIWSQyj38gIc1xHaAFeWelsINsgi9
	 Fxnm1/kUzq+1JyON6EpATriwGSw53gJYmmCs5E2uQal4EE7Km8hl8dR6p/FbpiOgqcWPA
	 TcWrl6kGbBjcn9fQbAdjZX8jazyDEurxm8Api+0k1FLmjtQGXM3FVhGSgufwxbgxojw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xyjy86N/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9D6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xyjy86N/
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4455605a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794377773; cv=none;
        d=google.com; s=arc-20260327;
        b=BlVEQmbhzYPnCq90CvOKhNc/mH7k9UUe3RNhuom9j8TEoX6KH7/6g16xzNsaeR8hGB
         XTRAQInRHDh1G5eZq4lTDJXPhFjFoNVY3CJkc9Ck+khchkyV/Gd0vedAfu/z0l75meNR
         8flJJe0P6l6mBmNsTpGZbt+leiRoEgqlChPWPOJO3oAfBqvvXRif8gp+JGPmPn4/E21v
         uYsywxOi/1Hx/b/8/CW5NsoLJwJ1Mm2q/PK1WDnZ8p3dsQXxsmW3y9geulkx/bRvNPF7
         +17h9h4dj9YWfvTKpg5vkwkf/eCkFpMSaegZgucoCnT7BelRnqA8WlXjdjmwxmTypX1W
         EKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p71/DW116beDMpJe07R6eFNT4MapU9JGcbN3csjU8TM=;
        fh=Qnx8avY37DL3efFkftrqQbQXH43NiBbkN7+xn+wxaXs=;
        b=INccozTwbqy7CbW/tPLz9xIOAMuB1IlzChZky8UYN/OEz67x3tMVXdWQt2F2uC09AA
         1hW6cxEKu9VRSMMgCWm3oXMZNK8pAVRRCRKnT+ItR9qPXY6hWP57Yt4Sw7hC6jVESXXI
         JNZWZmGjjStwhYU0sd16t0wY4tKlefIVU5Po4i67b/S3JMJThTKLCHHYHVOliiD+l8Za
         +CRaFK6l0EkgyaeMcM++RzBP0fH1Rbn3GXbLNcAqnhMlU9CtNDuadTXzSg0UtVwczyUJ
         l7MFtF/x6PmJYufkqyISKSoteV4frONTkuLdasT4Dc859mjNQsdUM7TIFFgtM06yQnrb
         mI4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377773; x=1794982573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p71/DW116beDMpJe07R6eFNT4MapU9JGcbN3csjU8TM=;
        b=Xyjy86N/j/XiUi00tIhnJrXWrSef4DbYyMdjgPd5aWEd9ClvyySlZM/BruP6zW1NRs
         rEaf2kYHgM5SguK132jIa33Ds16HkkQlvI6WG/1wxTIEDOYftiCilZIAes8VNcuFJyy6
         FFnOxLaPAK3wCWAsLwoHR2LsDmMBtOzrTg38emkjvn7UdWWAQcSPLdEYzSJ0E2eFlXN8
         LSSAUpe4XDC7BM0lMgfYl/CPZXDUz9V393hHyNfHYshP5HwRCY4MO8GMY3Fm61ANteKp
         naCgLHKuTTX+xgZ/qF5tZtN5RfUcZPAdtm4ThrmEvNHHYEnS69pHKtyEnV+5i9rPpfuu
         Xrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377773; x=1794982573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p71/DW116beDMpJe07R6eFNT4MapU9JGcbN3csjU8TM=;
        b=eAmNEDNk9hF+1gnDiQDjStwV5yitibdidBgNkJ2mL6f2L8WXw+mKri3/o8SuiLg3Bh
         wVhLuONT9sED+jFo8cZW3sTmBULP4kYta/2HZYHNgTCs8w9VdHEjKV2X6EuFs2Fyq+27
         FbI8MgWCvI87rfYZSWEsGB6D8TOchhqNrBq9/jbtbv5JsFCrcDiuaBPyW6kDJ7Pm/6z0
         VIrNt/IONGmMTnEsMbI0KKzPJ+yggmBtcGROAzDjBV/0wXz7qA4L7RhjmtdW7e304Xtv
         uwQ9hlGknrOqfMjDxEI8xULy4kEXPJNeN2j51CR6ITx45FwJWJ7w8a3ilN0EpJ3nMhf/
         ILoA==
X-Forwarded-Encrypted: i=1; AL+hErFior2O2fTCAMpno/8NsJUJwwfycxwM4k9eYqmBip4TrIhS2kap9cc6atKqUlip2l+tLBvhhXdC0uLSSAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SSVSA2jgtZ9GUAz6phzvLVJ47PfpmcKs4Y1qaydehuXQnKQso
	IRc+Tg2i7IHL7wr5dLosRc9pvg5Lqlt/49UDwnO6FRjaZENHtb1Otwx4Mm4qOKDnxiCAKWns8Pj
	2yPicXjenK+RfG/CYQHihkeVAFYlP80U=
X-Gm-Gg: AYBFou1sFF7JpK/9wDnc0Avia7ehCfF96B01iVMbo3Gw46bojZwlOKEKwgRL8JiJBzs
	GfTutSV2Dtbeg8YD34582oHDZe+7YexwQug1PdYkNntfiQjrArJ6PKvLwxL3BivY6+UaGJRmm8H
	iMvPqfNfIBRXSM6eCa6q639ZGyOVFJurDA64kG6jFKcKSjA802xcsWO0dTcdYIGbXjvMNYkdcsi
	Z5RGaLlihtLRo2sJl6Hsr4dUdl8lNLVRyuG2Q266TTtfgIQW7wssz0j5ZcvnO9q6whHeuQfz4UB
	ToLfjkN+MkUbAVtN1WDmwlJXM5ZE1KaJeuKPcaAJ8MC/mRE8MRzO4OQDPoFxLVk40uDOwxLvgst
	34jQJWNfSlMtLOXAa0LEG2a8OsJsiVSUI9YnCNO6MeZQFIonCPjgh7U1WV2jjU2CL5OadKg==
X-Received: by 2002:aa7:d357:0:b0:6b5:9725:ff0f with SMTP id
 4fb4d7f45d1cf-6b7773e2f90mr673414a12.11.1794377772963; Tue, 10 Nov 2026
 22:16:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org> <20261109104142.c4e01c2e29ee9ead4056f354@linux-foundation.org>
In-Reply-To: <20261109104142.c4e01c2e29ee9ead4056f354@linux-foundation.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 11 Nov 2026 14:15:35 +0800
X-Gm-Features: AclHuK-fhrTrvILE4a2W2jzvXP48Kzwh2MpWzSARmUPbICPhrCm-RaiJ5eBx5hA
Message-ID: <CAMgjq7Dd6UQWfBwex4vTLdxAhHKMfpmgTG9DB3MG+4+qig0Eig@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Barry Song <baohua@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:55=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 09 Nov 2026 19:31:53 +0100 "David Hildenbrand (Arm)" <david@kerne=
l.org> wrote:
>
> > MGLRU is currently the only MM component without a dedicated component
> > maintainer. Fortunately, Kairui and Barry have been actively
> > contributing to MGLRU and have volunteered to take on more responsibili=
ty
> > by officially taking care of it.
> >
> > Given that Kairui is already an established MM component maintainer in
> > a related MM component (SWAP), add him as an MGLRU maintainer right awa=
y.
> >
> > For Barry, the idea is to transition him towards a component maintainer
> > role over the coming months, starting by moving him to the top of the
> > reviewer list.
> >
>
> Yay, thanks guys.  It's been wonderful to see the rebirth of MGLRU over
> the past ~year.
>
> When do we get to remove the legacy LRU???

That's on my radar :), though it will take some time and it's always
hard to give an exact timeline...

Items I'm aware of to sort out besides the FG series, maybe we can try
to make MGLRU the default at some point during this process:
- Refault distance, otherwise we still have a major regression in
heavily overcommitted cases, also protects cross-memcg workingset
thrashing. I also have an idea to remove memcg id and node id field
from the shadow so it will have enough space to hold both the gen
number and distance, will post that in a few weeks hopefully.
- Memcg LRU vs. iterator (Ridong once tried to unify that, and it's
good to see there have been optimizations for memcg LRU itself
recently from Max).
  I also noticed recently that the Memcg's LRU reclaim balance is
somehow a bit broken, I'm not exactly sure why, nor a very major
problem, I will look into it later.
- Isolation protection (from Hui, not a very high priority, but still
on the list, we don't want premature OOM).
- IO cost & swappiness (Barry and I are still looking into this, with
an series posted).
- Page flags usage issue (FG cuts it down by 1, though it's still tight).

We also have aging optimizations and async aging planned. I'm not sure
if we are missing anything else, but we are getting close and with a
sane todo list.

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17635,10 +17635,10 @@ K:  (?i:vmemmap)
> >
> >  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
> >  M:   Andrew Morton <akpm@linux-foundation.org>
> > -R:   Kairui Song <kasong@tencent.com>
> > +M:   Kairui Song <kasong@tencent.com>
> > +R:   Barry Song <baohua@kernel.org>
>
> Totally-Acked-by:me.

Thanks!
