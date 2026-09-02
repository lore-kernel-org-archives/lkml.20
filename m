Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12264AA011
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369039; cv=pass; b=ruo2n3tlMJoQ9YVLiD0QDEzKByAMHC8y+nOC9NTYCns2hrQKqOnZRqX56jDGkjHG+N69MCLbvT5/r6yO9daO7OvzJmyWbJXxhzdvCUksRROeOAzUC6/09RERqpIi5T9ps4E3gBE1T+yHMXZgLwR4fJJ78fVaFWD+Uqdwr8kEacE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369039; c=relaxed/simple;
	bh=mTnQX3Mp7xcXwmjhHicO/NT4zipxlJZDBHdnZk6kKHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmwBW8ObyorP3FLJjAbny5RFNBLx8nJ26z1MAIXeEX3BLZdOpm0LhLXC/VVtoN3hmfnWfy+Ndhvtdd0J9QeTkxS+y7BmPEuttGSPoz5OL8fIet/LcLPSP/ZOFKWFh9lDgv7Um1fWPw1kiDNRimqhcxU9JJhvqBtTEiG2QRFYFFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FG8KjALi; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FG8KjALi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-484415c8bf2so1045296f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369036; cv=none;
        d=google.com; s=arc-20260327;
        b=brok+TNqGOwK5/oPhbaOgM2+rhXdS/8517oOQA7QJFOWoVnO2TMZrnhAknkchepgHs
         3FvR7LO1ME/qtUu4tw+I5Elz9EmyIGtzBkxiv/aMalCunFxjDO6gTKgJ+7rusIpHMIy5
         cyA3YKjdC7QE3iqhFwDrAre66dDnuOlJO5W1d2IHWwG3tUDcUS/vCLuIhPwy8JQtbLGC
         VYPSPdvG//ivVV+QtgnbsqYQKSGrYdXZ5mOCt6hCQ2bPzHXXvGkGf66oREMbZhCsF3Qo
         Hpq1DXid/gaRrC7wojI6DyxFJIQMawv+iWMynE0bPa0Eez6LkyYkdrK10gtnAPAykXJm
         Cpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        fh=Zd5YRN1yTBc44ew9S3g/ivfbep+DAWJn+sPRFHkBms0=;
        b=Lw28AVOWrLweJJHssVl0cJEdoKognxHTKS0alRLh41DC3auSpbB7XZxQpCziICw1s0
         yYX2CMejaZBSua/vKDpivcfZnwYy9OXRwgw76U5JiImfrhAzSW+9tbXRJ2+HWpD+earK
         /6ca9L823eGjyAIfw+UQz43tyER9iAUcrpvPXDBzESiwia1YpT7V/2vWPpfyAxoJIDBL
         36j0DFhofY5ed5N00XgYmIzUYZPT7H/wtpVb2dC08E1peXF/yxVn+G7jDvW9uFFM8INd
         GEEblux3Xdi6mHI4ih1spd5oNMtAEJ75dcbpTqXeoGEVujRf8rNH0T5VNefdFtqMbEjO
         vbug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369036; x=1788973836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=FG8KjALitVD7ogJ+gNph6ib75C3ShEpptnXdQ97uExvnSkawuF2lax0fpp9Hq96oVX
         5NaLiYbPBqwwR21QTDosm9S1tzfhQlQevnIhklwegKDlo4kPcThH0Smtf9LF61UBRZfv
         geTdAq6BLL+2KZ33Ld+Vf8VnCYgJ1J92g5y0DaLUvRTA4INQSv05oC8JgcFXyXQn6TPY
         qruN/qiUHz044cZrtF8tWVDFLGn2rcrZrvqRsEtWt/xdDyfpvA/0wPnJc3UQkPm96wc0
         cHWslo/5AkIUznz/O1ULgWvoGdPnVirQ0lxU5xlOPaz7H9zZzwjxdiX/EDYVYU4k9NZc
         OGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369036; x=1788973836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ols0WNB2AMfbKxMdXMytoV45ljZKuMGIe/f4CAtUcyk=;
        b=CsKeNZ4KEHgCiqd0l9b337si0T7IYLtM+BZcWHIUEQKTaUOx05pqQGqvA2UiOQX9Kw
         YZwSHHwrV8pqHnZ8/Z5S8u7j4a6vV/zJdliOtMvKAzZpGzXSk6dSN/akOBN+73tS54kj
         B1LUju3J28ZlDSdh+tl6PfqoF8lqdPqKsVVE9Ol3duPwagopyHI/Y/0TTmyf+Mr3Smgt
         ktiouDwx5YER9WfB+bNS3gWfEvRbPRL5/x17uO/3hxlVFFud4/9FS/ZjkKmWNmacPB4J
         5F/hrZW1LiDo2Rx8Bf9FUa2qZeZzv0gbLrjkjMAmZOzvAW5fCgO308kC4Oc5RX21XcZf
         iXVA==
X-Forwarded-Encrypted: i=1; AKwUvBwNFNFCTRhk+bUbLQO1qCAa0dC3Pju2dsAi7LIfUSTrYRNofik3GK6Nya7pwkb9vxYKlUypdzxYkt5x3yI=@vger.kernel.org
X-Gm-Message-State: AFuF++k+3cBapxVfYQeu5ew9UEMhh4HwqY1kJOmQy7iAABDLow8hteG0
	CrObcSmMBJfebMvH4T1e2m6EXPtaDZhBb7PC4DoKuluFa3ATNuX6nC/rpIRyrWNenrxmT/rvFVU
	7KwCKQhXvOgayrwPMp0wW0QOM1/xk6hQp8ZsYqjrq
X-Gm-Gg: AYBFou0pMRVj81OheWSQU4uxS0TAvxgSgDWDgTdBmNG/AOEDni/XxkkLR/A9VFcLNFV
	gyfb0W074Q908QGgzb1w/h2nxrOD9QgQEKrXj/6x8iWf4m/uggoBMwQ4QWWrQEm8Lg7TSQ0hgOz
	mjCgNeY0va8A5CyMvprN86T6DKIMjEB1J0PEGtVj+btubCQvEZxJ4KOr8ZgeOUhT/gdN8kBcg7c
	HAaPkiw+uMoMOjMMltFjWrZv3hUrmjKlyGYV3aTmzD6pTRVJ1X82CfjxDq/2T2FYpF7SGsMOGdJ
	9ejI7Amg/L4Ka2zcw/CmSdauSTv3/+N1pFPIy4PRME84/nFn+idlgoS8sdIgX8SWSv646ru6XZz
	BgNfIk3/QIEDlblDUr5hkeUW8WSAFmZtpVvBSVCfUPaiVC7SICi9W/d0=
X-Received: by 2002:a05:6000:4817:b0:484:40b0:ef30 with SMTP id
 ffacd0b85a97d-48488deded3mr13204952f8f.6.1788369035314; Wed, 02 Sep 2026
 10:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com> <aphSYUS7xGJjj2gT@SMW015318>
In-Reply-To: <aphSYUS7xGJjj2gT@SMW015318>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:10:23 -0700
X-Gm-Features: AcwNN1XAESqNH6wBokuk-x9G05tfeqXIGUNdG4bw9ZYytsqReJ2H5J3a05HeJ1A
Message-ID: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Frank Li <Frank.li@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> Nick Desaulniers:
>
>         Is this patch good to pickup?

Yes.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

It does depend on
https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/
though, so you might need to coordinate your PRs to Linus with Nathan.
Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-er=
ror-v1-1-b27015390901@kernel.org/
going via kbuild tree or what?

--=20
Thanks,
~Nick Desaulniers
