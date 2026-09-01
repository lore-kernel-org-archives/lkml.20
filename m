Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E147669D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258486; cv=pass; b=RltuXpab7KSflFwr77G3o7bJpOrOtPXW2hlpFTk5ZZryUc4J/bAgcCSs0ViZiU6M0Feg8WfvvI9de+4+L19ZwvDNACy3FWqHi3GnkOQxUs2Z2AcNwMaJ4W6PBmuF67Zj+BYI60YYrT8XmOTKSLKjAZVE4OIU4ONzcKRffX1sIUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258486; c=relaxed/simple;
	bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yn6JQpKhujZbwtMiF0nBAHN1OyqenGrBS/O6iAmsISayuP56OukIZM3vYuUmSynQx02Js9o3G+Lbp2BHr/cFA6AWyosbyjqG90RwQN7wG/sVB0kPySf8Kuw3UHPBJ2quLVwHpF8NwFmtIdNEm45de4Q0dkku7hxv+8hLjaGiLHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD4naID+; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD4naID+"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39f20d19895so31880071fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258482; cv=none;
        d=google.com; s=arc-20260327;
        b=GCfFvatyBk6d7cnOLVN3Fqg1fYsiD5gqkr7ThgsAo3bJerj7q8554qG3DEamm4PIvQ
         Z2uhOGWHSNGoNZno17cDxCQXXM3o+OQFIA4PCACFdZyfSj0lkCbjaAWC/ebtMxYpsmfb
         qCycDP+zSZwtfJierUuXty8aOvXBGhNM4KL/mH+qtqyJw1CVxjXFApV4yPxclcXGFDAo
         A0uoL1f9wHFbRTYcJFespyXgSnDYieWM+nNAmlojfrrtPJ9hsoyMIJOo8J3K3N6JyP/i
         kgOnTx/W/dIqwS7EozV90qhXZTX1TXKllU1P0Gxz4xOh1SDEaHx1JQqYlwTNjnDkH+xv
         pNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
        fh=QX3f3npJRRahOo9R2QF5oo630VsQhBMV3F6A3SNk2qE=;
        b=sxNlLEXAoD+LG3H7YWuNmzHpNjz7afvNvEU3kw3gRHX3+PM2b8zu67fqQWLUL5kNkd
         qTYSL3RZ0ZnXKTG/U46pYFj4mr0Dd3MzLiYzqQFKOuFI21XqmUqQFF/Y43ceZrXoe1MO
         d6aqmuJT4cAjPBBJoTSe/6j3XTvFkwov29BtpyfgsSe/XfDmRkWL1fmc58AqRqxk+Rcs
         KsP8utrjRVlwZom+7msw1WxMqcvcOuWKmT77zAcJ9VoRTAidHxVZ/CdLURsfoCVVBlws
         KSMaV9B9b3NsPAgakZxkrhJAI+XCnA0SCFUbhq3W6DX/gPRlcyB/H8gdzenu+ORgwED7
         npug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788258482; x=1788863282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
        b=GD4naID+2f9Pu4Z8SJDMTTggRM0sjj79qe7A4adyIqCQuJ/f7Ww8erv9ztOGA3RnFG
         6eq01YttuFogZWLdxfF+2rOqbTchpuxywNCY+jo2tJ1DGuTE8UjACeeOJSodo0sqe9SA
         vwq31V+3H4It1x9JSGDutVUMZ4q9aRuLVZ83ABvZ0/TW6LNVDh4XcVKclALTbMn+sQFO
         LMIB0y6LFrGinvc85MhS7KSi0CZCO2uxhq+uxnjL/9xXKCYtrM8tjbBtqtHYM10QrJiN
         7chSK87bYl1TQZsDOI77b5wh0QAyJFtzXxdJqxJvWny34tBch1dmV94x5W5jczOCGDjM
         MDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258482; x=1788863282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RhSTE7NXQuuRFzzEOBXrTTWdZIlYAoUG2HnFqGjzaQ=;
        b=iXbpS8k3S35qw769mjg2Ich31H89aLdh6L9Yl2nGjYMZVNw6vP+Ln6lW3qx/r/68+P
         vo0w7n98ZJxzQob/ojNM8mucsHVgwtA/LzO8fPhycrOgH0x+DGGpWMBln2awR71oh1gx
         xyX3eX5Wxujd/Tb5wfiPcYFjE3k7cmkbj/Y9aXP8ttmO0+oYz4NRgUjJZP1LLHbFkPRl
         qTrqWW7evKMV3g2ZHDJ4OSuYYrn2NM02LxCPg/2ENkuIydFgxbviH+LyZbFif8brveNB
         0K99EXPfP0+c1JZlfDsPJXN6/jhn7255nZ9YMAnzIQMdVupUP8bRAoLvSEy+ErcCMgyr
         c5rA==
X-Forwarded-Encrypted: i=1; AKwUvByaiv8yFM152ezsd+zEEfSMP7Cqku2uYoQIFiblHU+uJyit0q0UhnMLPcAtGZgn4ud5M/7zp4XUKkuLLX4=@vger.kernel.org
X-Gm-Message-State: AFuF++ngYOTlLRssnU9qLONQUTLLE3m5M2Ujh00zUXbiqiQs4DgaRkov
	TWdDBcWst19d/E2CA8Q9/ph8L3QnM9jmCG96Unnu38kwPKrMLhpgA400QsLLXd+2FAITp/x2Z2Q
	KD9hkl9BuraX0+5Q0ILByfWkKqaIF8SU=
X-Gm-Gg: AYBFou1nYCgB+xwjojtg0XBm7TBoVhk8faOIOu0xp8MtTbhPFWFlYQWqTdnZVzGp2wF
	kqSS32ksPbmZu/rFe3W3mPN1AmLgae4SunIKOiZ3PEVNIbAz9Atn192HJg9iKQqazcef9NS/rbl
	OTCF6tYU6wuWAsr1BKp89jAUEd2NclDyPkS2r+xcuV117G8XgKnRGI65I0gjB2BtT+vAnRql1DP
	wVwn2XYYVoO8MhIMkbKl9hOlbWFSbJI+iK2GZitnAb9xiQXHMFtuJfayj+PL9Z3ARPIOcvfbYmb
	/CKi4WdqAgFdHkCmRKhJLYmw6qB/SelfqcXPuJFA0813Nr6i6IFjwQNQ3FIRRisNhYCrQoQlzEt
	8dvYGEOD2HseCpi+qzq1jFIa5LKxQShu+nvFL5ieTVSS+2UqS4syT0AGWY8tlzmFOu9UZzSjy4b
	nOm2wROYlu+9RYSi+ZnRTn5ltyMyj9Jw==
X-Received: by 2002:a2e:bc1a:0:b0:3a1:7f22:93ec with SMTP id
 38308e7fff4ca-3a301ac17femr70548301fa.7.1788258480982; Tue, 01 Sep 2026
 03:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
 <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com> <20260901102428.GH106095@black.igk.intel.com>
In-Reply-To: <20260901102428.GH106095@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Sep 2026 13:27:24 +0300
X-Gm-Features: AcwNN1WgC1bCIJ_reqGXE4PLxo0exnyYPD5oOf4cmGwFgaL2WmrJZYZHO1OB9ZM
Message-ID: <CAHp75Vd0weJnX2yb4XY8br6xD4gUA0dogzyg7-KNuynOtXnziw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Try to retrieve driver data for
 pure platform drivers
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?B?UmFkZWsgVsOhbGtv?= <rvalko@lipicko.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:24=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Aug 31, 2026 at 04:25:47PM +0200, Andy Shevchenko wrote:
> > The Denverton pinctrl device can be instantiated by the Intel LPC
> > driver as an MFD platform device named "denverton-pinctrl".

...

> > +static const struct intel_pinctrl_soc_data *
> > +intel_pinctrl_get_soc_data_by_hid(struct platform_device *pdev)
>
> pdev can be const, no?

Yes, but it will require also to change the existing prototype for
_uid case. After I get a confirmation the fix works I will issue a v2
with an additional patch included.

--=20
With Best Regards,
Andy Shevchenko
