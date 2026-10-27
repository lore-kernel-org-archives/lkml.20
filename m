Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793115034;
	b=0hDbxdL6jT+BlC4+X183aGbjtgcOMATaIqyrY4o1Pz8GWqM3y4gcrRMllq0tdS+6WmTq
	 /3QEUYWu05OFxccfFfpNI5USDahMLp6rc7PPL4GSq7jxRHn4eL86Wr8148Wi0YlSraeIV
	 WHG7SMoisEMjKL6s8KOrAAwWXUmWQnnpcKf0U7a+/NrI+Gmb/TXgw+7XMxkA5g1QbWePa
	 /M0Rl4kC0mDEeY+v0h930KCgW89SqCgu/LWBAHqFJhuR9dT3otPf0BHf8y8W9mGwucQvI
	 eKzPY+HW0kXqD3xda/CKgd8orpkLMuksfwHhfIFokvW7C7r2u4wkfvhKzUgrGnKQGtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
	b=nGdHyYAP87Ml2RFBgPJi7BaQcMF0iiTl1h7dg1uG1b+o6pN2RIRAYaBtFmyrMfrejRZ+
	 I90UtnNBtq5tP+0dhJs7XeJ21QNyO6tLVwtJLF1eFgO5JB956hrDiPNP16cTSyL9y5TH/
	 VJFaBdG3VRiUJM65wi05+8CO108ScWqBOfjiNEAv20drUm/dXGvhkxwb+f/sFohPC/oRz
	 jX3xpoqgQVNjywIxhi093YQomoCHa8PCg5nBdm039TbY5PAS63XDk3xVTs6uQd6oSukcA
	 d7kJVOfBFEwO0lyNYtWHjQYlG/yvjsxP/9mjBRb1pqfdbOIXqqL8t1QfFF+g2mbMqvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tENdtYBw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F7B606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F7B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tENdtYBw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a1947498bso826559eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793115033; cv=none;
        d=google.com; s=arc-20260327;
        b=cvO0Cz5c5822SyZizJsMojfGRRBYRKYk5fpukxneWheAKAQZH95Hak8tAvCX0YAStf
         /DRDnutq3piTyuGdB9HQ/cJeq87K+HTus8zbQsqpJfFK8XLaqFCvT0hnL/Gqigvu/30D
         AN818ZeO2vNbHTxSyyOfCsbjJajxJfea0FOtYAtMwwhRlxoicAJswD7b0MnbOwDQkg8U
         ZNTGVMgaLfU+VShRQ95AofdIOAw9pQa7s6EjCmoic1xIdcnQtJ7k8aA7byJy1Rif8EGz
         LO2wH6l0TCOhQg5BswxGrW2tzMBDhG6U9Z0scC99awZzMxdSh57ZJYMGJ66k9+AupbCO
         VOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
        fh=tb8hh7s/oy29PbP9z4je7Jx7WYB44caehZoRgMPUG60=;
        b=TKkO40i3wXj80XyW9TAA/rUovSC5WW3aNZmV5khfScsDO9+kflTE9DGquvoqifzuYn
         bLWBAOYJztoGjXcfPBb7ftZQ4PlSzW2p4FZWs3T0G0FWYchRVGycaIPSpKW53e88sewK
         sg/YoR2aMcd8nXkE6mFzcxEuE7aAmvdcw1FkDHS2rwxaQ+kbsKW2BWSyeGa0S6oLSDKq
         MtjpTqDV+IkHCNqlKoDL7OyAr1HBZpuq76fAAe8LNWLbZDo2DCd8cBXOGmGecUB6adHr
         AV6kTDegVONWNgcfvIXsG1Ffjwl6HduK1ci4U94IF8vK0ibnMYiRo9DmTz3avSFUHve+
         AZKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793115033; x=1793719833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
        b=tENdtYBwTDrLLm96VeGjbw3srQrKg9tCLkMK+rJI3vdDKppfXe2h6IokY4g+ASeFI1
         NrsO8M2m5xnxEFeO8rvbtHr1L9eV757DfQb2VDlXOIMseh5dj521l7iPbrTliEe1Y+ZX
         sYxMZJGVqfKLOJHjho8akmPi6k0trllSn4raxgmrGBm307DdiffRYBncn2dSvfBtltPx
         hAxa0qGrC2ksDcauqktfRyGq7D9j8YgwVvsDTVAwPwmzHzPMKIDj+YYCo1O30SOntaS3
         ZVh0zVi2nRIw+IB4vi3948c1xyb7qpaNRGYX9siQ/Kh2yRAhLTduHA5fvPq941sh0LQ3
         YMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115033; x=1793719833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoQNto8aMlxcB3SSXSPPkAQPmnjM1b+yzf4VeGep8zg=;
        b=SBisYVThF8gcFdBiE553LumBRR1cY2tnoykgHqNAAQ/QMa5nk0yD1JxpoD1RrR7K9y
         w2Ceoso4sd0bKt/Lpeo3LsfTnucHB9fSHKH88Fyu3KyaNwpR5mQi88TCeATFbA8TOXEO
         Ko933PqgIyLeBVisMJaktoWNIpzLbOnCTe7+WrcO8mzN4ylO1oGP4LRaEhHqq2L73z5R
         3o7bNLyB6qM7+rp4JXfamAYYJQ1TL6cmbqI9pmr3CgrL2477DZUDYJ5KWBWq3fsmMm1l
         OJ6oSuykzGE8X5HYXcMSGws2pWr/qvE2K8lBSvVvC7+jb5SPrxHGphusl0LA2sT0K/on
         MAIA==
X-Forwarded-Encrypted: i=1; AKwUvBzd5gLFhy7eKajBKMnZPJwYSvcLhnw94S08Eb7cbr2BIuPX0wx0KiwgRi0AJgfO4N0uPQe816EsE6/qzyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHEnjq6UznmHe3heKRHcTJIKep7agltMw1ybjHaBxWuUQsYDZd
	gU0Q9B2559Z/YVmN2zS1wdMJkQVmPmPaiJSuQi8XHq0D5mArCNnL3EIgtpBNJ62097L8f1XWF9v
	dj+Daj9umE466t8o4P5VRCeHKDGdWszQ=
X-Gm-Gg: AYBFou07NWWb4ZEZAwSHm2RPQpDnqf9tKo229IUcAAgpwzUisrT7S7r8p9kJI1DRwLQ
	6h+54HNPlQgY69mVxC3DTi447/uwbo7Bj0FtQlrfcUL7ZtvBJPP5qJXkF415wtTHWu386RFjIkV
	EgSqUTF+hinRw7Z7RXG1C5dq8Z1PsqVSvBUEsaaTsycS8Lwhtkv6cym8gCvgXzI5fBXbUPz5EgZ
	Au/V5BpU6uJlWwiJYHTk6R9xUY3Vjt/YTplAtWrOccEMM0cm6CF0Rd/VtmTd4/e4LgpAwzjDhyG
	Z+YWyJcsrCuqX+o8W55cCaRtK5c+J37Uv4UNQCeQi1cxFMxeQ8Jrc33uV3FP2G1GgY1azEsjXK0
	+H7NEssWuhZ2wRklyEfoK6vJLxyupDhzK2ldDxzRDwWzw8b1kaNMe+B269Dcjk7sqwfXAuQ==
X-Received: by 2002:a05:7301:78c:b0:36a:16f:c550 with SMTP id
 5a478bee46e88-36a016fc6b5mr8139945eec.15.1793115033016; Tue, 27 Oct 2026
 08:30:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015102320.23760-1-clamor95@gmail.com> <20261015102320.23760-3-clamor95@gmail.com>
 <179206474862.1869456.3359147212046371469@kernel.org>
In-Reply-To: <179206474862.1869456.3359147212046371469@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 17:30:21 +0200
X-Gm-Features: AclHuK8Zlu34WY5VMtUQgRpQc9IteaYIlIoPPVl1LsqWovajge3AsVoa0lEfyQI
Message-ID: <CAPVz0n3uWJQ6oMTq_0y8djfO4v=D_EDYbWfXqWhXxZJbJydTog@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mfd: tps65910: Add restart handler
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Dmitry Osipenko <digetx@gmail.com>, linux-omap@vger.kernel.org, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
1 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl: clean (0 issues) ---
>
> On Thu, 15 Oct 2026, Svyatoslav Ryhel wrote:
>
> > From: Dmitry Osipenko <digetx@gmail.com>
> >
> > Add restart handler to reset hardware properly on system reboot.
> >
> > Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201
> > Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # ASUS TF700T
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/tps65910.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >

Thank you! Your suggestions are valid and were applied in v2 here:
https://lore.kernel.org/lkml/20261027152423.194794-1-clamor95@gmail.com/T/#=
t
