Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794401543;
	b=kWo4OqetDkOD7ofK/+ROK7wzX4c9GKSN4bHXUtqbEUeSLV+FSPANAz+ZSBysGR7cXryc
	 QgV2Vdg9qsQIek4bhbXBqdqNoG2umAVs6CDu1UYzq2hEkc3RKKnIdKz2ELHsaaRSIsM1J
	 5btIgQH71hPM8Sc1aQjKzaIo0Rw9ZUAOQ4pA7rDVX/Ga8fKYxU7yYMzKEwc/PtmK/+0KI
	 Gj6OLoSdM9bA2erhf/R1tsmrKjjm3x+vxxDCkOEBPsjz0n6SRJZVdXvYPA6EzpuSUGu0p
	 /7SA2eaiqJOi7ZfYyLq4FGcdwhbU+riHKX/ZPNtDbveC9JeSsBsK+4r1ukfF4OjCgpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yyF1k+Nl8WkujwkQb8UMfUacg2rnyls+UTesH4TGVLk=;
	b=vro9X3ZDdPJM2uTv0646kVd4cdZMXapKocNPPevNjhWew00ye3WtbQvzpYydWB9GDgsM
	 Z3R956nfEgNLZL0jKwcZQDRjRgdYdubg5rEMV04tBwXmwGNMoXOcqAmBepmdmO3DlsbCd
	 Yx4oKD/DVAun0gVTCHK/YauX8xllSpQPbdYSnZUxE+FLEOg5lmhn3BxqSemu+G22sl7uW
	 Rx62w2IdSoGl/YQnJ3BJjgWj8atMM46h7f+KEF4cIh/Nrwh2LD8VzP5xgmnAZ9NMYNDxn
	 hGXSuVNrIc+d33CA15ZoUMw1+ZzxIYtPqHH85GsrlAPyaiI7qZfEQ3r6qrzrPjg+gag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4i3qHDd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A30606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4i3qHDd
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso5515499a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794401541; cv=none;
        d=google.com; s=arc-20260327;
        b=r5UhrLWp6DS0e3mcejwx0d6M0har385YjZXJNlxkNQn9r5hSAGZp0s5ZmlVTb15ueg
         Qkeba9EKS4Bwd6Ipw5giYybOWgKJiHKN/yjgMuw3eTJYePF/Fy8nAStMTxdI4Fc8fPjn
         O1HeQd57mh77qLQxI8tEJbv0mUD/ZETWDIc2OBXoY7kJz7TRnl8iAAunVgyYZaaAWmhO
         vPKV6oH/tQ+SWzu9SKnzRj46rd2JrzrF9jNeaZZWx0m+CwBBnJqhxZtGdvWXf3fME09i
         VNa+D6KcSgjcvLtEP5reDnepMcS/I0bXrt6oCJnUpieeKU2alB6d74ONazOIc/KfDCRb
         pdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yyF1k+Nl8WkujwkQb8UMfUacg2rnyls+UTesH4TGVLk=;
        fh=CHBFYojddUge3e9ESVfvqjGs2JSib0mjYUviCbiwdFA=;
        b=F2XOUDzx+fE00+lPZ5y1DiqwdT1MbdwFxns3P46hi9CAhwrvar+ty+louWu+FmMGmc
         Ed0eAypuu7tuILksi48gaViyfaon7+gwkHrraXbDNMlONNH/Q56YY8y/6aThrniDDsid
         XW4PgfW9JKoEIYC/aj6XpbSu+o7w2E+LM8unykjry4EVKGTRfJQIDplgWEWI+9PqEMhe
         hPrjB5nna421v0L4Q0aoXQ3Psv/4LEF4yWbBE8K/w8zHNn6TmdpdJwhJyCxa29gEQuAh
         xF5QD1JN/bkjg41dpPtPcYRTUjRE617bLrMcYMnO9Voi13WGeEOHMmnsjgvf/csq2iuQ
         IuyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401541; x=1795006341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yyF1k+Nl8WkujwkQb8UMfUacg2rnyls+UTesH4TGVLk=;
        b=g4i3qHDdm8tOW+UktakB3jIBXjvnUY7croEIJ/nS8RxV25Re+B3cTM0wjriY/WVQYF
         GcQzq+zJYI8eZB9MX2A0R0ueBumXnpF3/98FDYzL/sYyUz3H69K9cbXkvQ+hfzG7ZNxl
         4AKyJnBVX2rzahb8UMFqFe6/C3KEr+Z97iE9qd7+lGy0w0wnycXp7FhRVtHOs/Zrplwz
         ArgV9Y3p/f25X4752UoeKq4zdxPcTvHciiwSBCRFEM9//ZpZ7ysLMSf3z+QcUVgh1ON2
         vMyzFEHoEYAE8Id6G8+qT3vn9/CQLq2EEyio9NriF/koIWzqsrABOzL4fV71z/BzV2az
         rraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401541; x=1795006341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyF1k+Nl8WkujwkQb8UMfUacg2rnyls+UTesH4TGVLk=;
        b=o9IMAMRXFFetHGg1PQxlGJwR2AnKwYmMx/w2oEYHOvz75scl48u+mDX6BIm34C/SM9
         3EuhziL8lNOJBHlwZPcZTj6ECemko+fxuNEWjYRljNHuvSPPnAQM4j4F3I1roVkVYq12
         ZyE0P8anvk9WSr8L/jkkTwJy0nzHocEUQ7QEZlToSwFljvhqnu9PClR96KIVPyAS2Rrh
         vQYbsRRxHf7WSAPIRdeKlAOvLAYnEABkrNaXKmQy1w12o9kQujkn5uFx6xSeBln6Y7XE
         UlhSeQAsaMzqXF5zg8PBB79Yz2bodBwGkvdqOgNsHbHhBUVKq03RYATBb1/XRCjAlR1c
         l+6g==
X-Forwarded-Encrypted: i=1; AL+hErGQFCS/ieAV8L9Ex1jHKdW5yHft59NW0x/6+kHWri7kqCVT6WjHZrDb/gDXthfs7XK9PaPM04haVL3PinE=@vger.kernel.org
X-Gm-Message-State: APuU4Z93PJ6ZCE5UMB1FSoAs35gU9yL9aLCShJlNegz/To8TmVVXc9Jf
	O4eWrTOjwYNM6tAIVfKVb8V8MjOT5wsOHtkR+YL0rG3KfU6t8lksiVI7QpchgQkndjwEj4AbWCq
	GeN87GHBUFC3HdwdPOp2H6+U+GcjWhoA9yVfkfaE=
X-Gm-Gg: AYBFou24M9LsWfu9Pu+zg8oQwkef/ZPoP/+esr+rvi6geJwCnQ9QeLhwqPWIxakl5fF
	4rG0R6AAk6KzaUyq++x41dK7Uv6hDIoKpLtZ5lwzjo0IYGoNAi1ABQCFgXHVhcVhVdA22GpGcul
	IF9A6C3UFA5pgxnhFGGMXLY/zO1cs9HAMXs+93jghlMBVn5bE5m9haLoql5mBDvDnvgbJAH314S
	f/qNymSRl0Miqx3RZsjTk7Xp2o9/qbkBYHypbzQ1gIDVLSr1akoCWdn/O0jxxxD9BO1TZ/SUp9C
	IgNpeTO9DL3qmCxqDjvyZY83kzYPCxg8q4ufV/etSiyS8hARWMO4jiEg+7SJ/UQwgKIm0xP/Fpq
	qmSFqm7F58Smjh7UQ2JcQqI3Tcb7g2LLvZE8JcOBZCJVtXLUmXFI96qjn1oi3KuMIwZ97Eg==
X-Received: by 2002:a05:6402:20c6:20b0:6b3:e4e8:74ba with SMTP id
 4fb4d7f45d1cf-6b757202941mr3723463a12.13.1794401541131; Wed, 11 Nov 2026
 04:52:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261110080419epcas2p24eb47374d80929645076c4d81f512c62@epcms2p6>
 <20261110-ovl-impure-stale-v1-1-1a4c2039e89d@samsung.com> <20261111045026epcms2p63d9818fa6ad5600eff4f74deca4a6e7a@epcms2p6>
In-Reply-To: <20261111045026epcms2p63d9818fa6ad5600eff4f74deca4a6e7a@epcms2p6>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 11 Nov 2026 13:52:09 +0100
X-Gm-Features: AclHuK-uEdGqwVqtGF8NVHS7HnR8ycc4aY5yKZJoiyodA8cJpAP3s_D7QBW26qk
Message-ID: <CAOQ4uxg3h4h1TnYA0xyDoOUqN-otWUn=1r0mXaaFdbj+HEkkmA@mail.gmail.com>
Subject: Re: [PATCH] ovl: skip stale entries in impure dir iteration
To: daejun7.park@samsung.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, Hungyu Lin <dennylin0707@gmail.com>, 
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:50=E2=80=AFAM Daejun Park <daejun7.park@samsung.c=
om> wrote:
>
> Your mail below did not reach my mailbox, so I could not reply to it
> directly.
>
> https://lore.kernel.org/all/CAOQ4uxgxYZqE=3Drv5ZYrbyB0cYi_qS-bv_4UCbDwGJo=
MGg1iNhQ@mail.gmail.com/
>
> On Tue, Nov 10, 2026 at 04:28:32PM +0100, Amir Goldstein wrote:
> > I am sorry, but this is way too complex to deal with a problem which
> > is not important enough IMO.
> >
> > POSIX does not define the exact behavior of readdir of a directory
> > being changed in this way and I don't think that the current behavior
> > of ext or overlayfs+ext4 is a gross violation of POSIX or that it could
> > break applications.
> >
> > I would be happy to be proven otherwise.
>
> Thanks for the review. I'll drop this patch.
>
> I looked for a program that breaks on the stale d_ino and did not find
> one. Of the d_ino users I read (find -inum, gnulib fts, glibc getcwd(),
> nfsd READDIRPLUS), none does anything wrong with an entry whose file
> is already gone.

Hi Daejun,

I think your patch triggered Sashiko to look at existing code and it
found this issue
which is a long lasting d_ino/st_ino inconsistency:

https://sashiko.dev/#/bug/linux-98f207b6-3936-48e9-a40f-88f20be4db7b

Would you like to fix it and send a test for this case?

Thanks,
Amir.
