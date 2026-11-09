Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243403;
	b=X5aUi2HwlzoAH9n5EN6TISu3vqe6CEj4Wm7MWzHsbgvthFaNT6Qh0Dtvr6zE0Pj8KPOc
	 dXOgnMj2xctbto8BmSggb7/Dq+6n+WCKXGvV31vxtGE9plk4gY+AJsyxZ5CzPiAzmRLbP
	 SR1qlTGNY3RJl6Pl2a7nJBxC5dc2+95tV8p9EXbnf+BHk+WPgug4mqcD31np7xC2vd4IL
	 5+WpE6je277sr1aDuLcW6JHniuaJeGhwT+1syGD/JSbSFISkvSlRfCUE2fpBCSYrFOpDn
	 xDeX4REOwkWbTSVxCngMHTPutvc1YJ4Z3SKmXlpINBCq3UxvC6y61b7kHdUrVBkUnZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yauKVO7Mcq33xvKK2XhuFeMRUndl36W/Mc6U35zgzp4=;
	b=bhziy+nwYhg3GyfUQA/uH2490XNidgmTEQLT0fgIXO7r8Q3NEWBpoRaywrqKz+iPh1o8
	 eEUNYNy92eAigPFnyQm17pjGdSLBgXFwTjf6gS5o+K/GrWRFrx/EcL73My5J1qy0m3oLG
	 Ybmcm1Fi3AAKqcvf0W6B3XT97NBV5a4LM7rDLHc2SOID18J49O9PcVWKXi54uQhz//9KI
	 swso12bpkfngN5UCOPR7C661p3aqgUfeKvrg2s1AA5W9E7K95F2C8c3RBeTeuainQXxwK
	 3L4ni7UscGCqlQhBn0uFMIxwIwbp3maj1r71HiKX+tac11Lqc1FYI2F05sPYRM5h80g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QiJBIw2O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT4z5lWm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22F2606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22F2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QiJBIw2O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT4z5lWm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF17I334745
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 16:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yauKVO7Mcq33xvKK2XhuFeMRUndl36W/Mc6U35zgzp4=; b=QiJBIw2OU6JQAqiU
	IMu7SnKDA3OftsxroKU651JnYMXGvtAhKqm8lUqV0hVVp2hmPU+q3i7f4whlRUOI
	YvXg0QOnXhc1K0yOU9bv/Nf4HdUaNhfkLLHcPby1SbLnuhDDmiI5pVL5PyTUeasK
	FW7r1WYSgOdB4oWTkMkr2hIhZAwpll5EwmvR5vAMR2HzXJVtRPlp4cpKjYfo6J8r
	R0qGYD2TqVshl+5jyoMe+i6MDxYo90oARsbOFp1m9Uct8s+ME+zWk93rZbrKOB4S
	saWCw/K9sLLsdDIYM/6lYwQeSQlLG/qAOFQoYh0pZjZpRXYo2P/6Qk/MCB+QCONL
	qOYkwA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf595vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:56:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so712937a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794243401; x=1794848201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yauKVO7Mcq33xvKK2XhuFeMRUndl36W/Mc6U35zgzp4=;
        b=MT4z5lWmR0DsHtst152koLdxtSSi3Sn1/hxACAwZIt4vqcahn/YmTL2Uh+qj13SBQW
         Q+7G/MFlpMZRikj4yFrdRO8SXgoBeCjNJ+2xibL6xCKX3joQW4EtPoUD6FINndrHISXd
         6p0z8Oyh/tPRa/OAaB8vCEYLiagtCaEqx/OF3ouYDPM87xXVVSke49vo0KmAKtw6Qyxa
         AIylDNwBNYyne5eXuLnGQj/axsi2Fi1goj4nFVAsyrd1hep4KlzYXYT96vs9qHR3gles
         kd+pBiJUyQ7U0tMG0BOU7Ib19n4+xkIUyipvghNMCKTWsWy3TTm78HW6AJ9ixwILeF7v
         C87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243401; x=1794848201;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yauKVO7Mcq33xvKK2XhuFeMRUndl36W/Mc6U35zgzp4=;
        b=PvV+SNU0VSGT2yyVTRUjVaSCdBa4DQsYjGb6BBv0+xADm/QRfV0m7XKAJOsG/0acWq
         zzwYUN5CdSDVoZ3gTZoUdNIWgt0HqxX7VFTk6zrIXpD5OO2bRFPYJjPjltlml/Njk7rs
         z1ivMe651Ri0dduMoBXzeuIsCrTLaQ7MycePoAfwUjqjixodDpYmH1l4STD0P3MVOVk+
         d2to4ueLTvv/ot8b3kZOKyJXYFAvjvIxSxq3AI0k8TRtVnkNvbjl6f8+sfRERKQet/Ji
         eDEscqvoD9349gHvqSfiq/5KZhz7AOjI1z7mhJfNr1R3FB8kWI3eaPo5JHrha/GloOMZ
         Xb9g==
X-Forwarded-Encrypted: i=1; AL+hErGhYV6RZsyas74xGyKkny+1QYSMrSMRWrWbgdKViu30Ei/51Z8xJaiKDJNoqB+kIjz95gpD00WV445X7gI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jGkClH/4omlaqGzX5AAG3rC/8JCfcWHX+5biEABx/3cyy1VM5
	D2CcAw64b9Hi2qnnp9iqPlQjcXu+Z42o/cKGdh/7cCfo2CabErnXWOpMj7BOswXlKFqCPcjipRa
	44QjV+kj4haVfK5MhJxJK/S/Z1syMRyjZNYiLBRGwuR//NtHNOJWhE4Tbai4IYTl1zjU=
X-Gm-Gg: AYBFou22ewQZLaOjC7Ugj3+xY3lRdMVQvfcSGJdhuq2qIlDu0DpNmlvtbEYw6AMMEzj
	X0Zb45m+L/OPWn6T8y4jIFvrbgl4bif1+a+mxT2hWFyECfwO3x6jr84R3mREUh9sHm7JTrhCtsB
	WhIGMnk34zFv5+Rivg9o0upJYVLOP7q/pDNLturXpDYR5DYWL9QGLFTY2rNQP67quio/C3KMeE1
	Ygh4fa6RtC01xZ/9hi+FOzftpw2nODp5q57a9GNjXgCDlrfSVYXdnUg2lSEE6DmFW2Up6FneiY8
	cdhQxzygKiIvOC3B9sDXi42oVvLCT7RsEv1EhaEU2gFHxgCkqgsvYJXFPyhImh+U96h2V0n/vc0
	LenQ88uXyppuhHm4HIVEgqWyEoHsgbfxCF6RGiFkKB9u3Wts9HAHKTpixT0uAaZ9ZtZoqHv3EvN
	YwkrkPA4d9cBLAzbWVclskWmxmSg==
X-Received: by 2002:a05:6a21:908f:b0:3eb:a104:f30a with SMTP id adf61e73a8af0-3eed202212cmr5000503637.12.1794243400716;
        Mon, 09 Nov 2026 08:56:40 -0800 (PST)
X-Received: by 2002:a05:6a21:908f:b0:3eb:a104:f30a with SMTP id adf61e73a8af0-3eed202212cmr5000479637.12.1794243400209;
        Mon, 09 Nov 2026 08:56:40 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64933fa2bsm1688177b3a.21.2026.11.09.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:56:39 -0800 (PST)
Date: Mon, 9 Nov 2026 08:56:31 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Per-Daniel Olsson <perdaniel.olsson@axis.com>,
        Kurt Borja
 <kuurtb@gmail.com>, David Lechner <dlechner@baylibre.com>,
        Andy Shevchenko
 <andy@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] iio: light: opt4060: fix inverted own trigger check
Message-ID: <20261109085631.00007485@oss.qualcomm.com>
In-Reply-To: <avHsKUE4xJ0vdu6P@nsa>
References: <20261109024746.1253593-1-jic23@kernel.org>
	<avHsKUE4xJ0vdu6P@nsa>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: S6sIGBYGCRlwfs5H_H8fASnHAyjHFqC6
X-Proofpoint-GUID: S6sIGBYGCRlwfs5H_H8fASnHAyjHFqC6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NyBTYWx0ZWRfXyuCfW75C1AnX
 PiouCWqf+isZF4h2A0D7PpvqPdh+65Oemj6oUL7pB9/lV8AF1sYvFKz2gvAJjXTzKtuRgCWWmfW
 dvED9PhmGZB9l6+4cZit3pg7MXxzjec=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1fb49 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gAnH3GRIAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Yv6QgJ3ExnuNNy9BQ7QA:9
 a=wPNLvfGTeEIA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NyBTYWx0ZWRfX4YOnFMoQIE10
 yJ25ru27bT7sCjsorlXXjWhkrZDUVHPFs9NbpKAwbi3KxJYRYZJqMs3KDbg8n+UxhGgwKcC7tOB
 BW/bio06yOH0k2FQL6d4LSEJtdaEtYrLm2XFKgF5ch4NPdMf7K/pmVCLhZJuRkSZVJdVTMrGK60
 RKg2qMDqM+S8I03E2UcRsz9RaL4GAB7pn8kGovQTW9dx1VFD6CVKryP6wV5OybvbySiwq7UCQWr
 gjdOir03ZaX0idpQbgQTXazinOyM4bHYbzH8ITT7DLZf3IxblC1dxAlB8a6ikUYyJePiVtia7vL
 K11w8PMtl4xOrxaLAFweSGjvu6hLoSsN8ZJ/go/jD7kv/m1vLidsQDBID2oetLFe04Mqyv/Rs56
 DVsJ0lxwZ10cLUQMCBe66u8Q8bY0YYf4GxECxkapBbMMJLD/3hn5QddOVulVShmINvCgitvGSbR
 kktPytAJaM4Ji2s33KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090067

On Mon, 9 Nov 2026 15:52:31 +0000
Nuno S=E1 <nuno.sa@analog.com> wrote:

> On Mon, Nov 09, 2026 at 02:47:45AM +0000, Jonathan Cameron wrote:
> > From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> >=20
> > opt4060_set_driver_state() is meant to keep sampling and the interrupt
> > on every conversion enabled while the buffer is in use with the
> > driver's own trigger, as that interrupt is what fires the trigger.
> >=20
> > When converted to use IIO_DEV_GUARD_CURRENT_MODE() the negation of
> > iio_trigger_validate_own_device(), which returns 0 for the device's own
> > trigger, was lost. As a result, with the driver's own trigger in use,
> > enabling or disabling a threshold event switches the interrupt to
> > thresholds only and buffered capture stops. With another trigger in
> > use, the one shot conversions requested by opt4060_trigger_new_samples()
> > are instead forced to continuous mode.
> >=20
> > Restore the negation so the code matches the comment above it.
> >=20
> > Fixes: 8284a4985416 ("iio: light: opt4060: Use IIO cleanup helpers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > ---
> > This was found by an LLM whilst doing a refactor of related code.
> > Indeed seems there was a change of behavior in the sited patch that
> > wasn't as intended.
> > --- =20
>=20
> Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>

Fixed the linux-iio address.  I'll probably post a v2 so I can pick these up
as normal though.=20

Thanks for the review Nuno,

J

>=20
> >  drivers/iio/light/opt4060.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
> > index 8253a6a8bee4..1a7d429453be 100644
> > --- a/drivers/iio/light/opt4060.c
> > +++ b/drivers/iio/light/opt4060.c
> > @@ -310,7 +310,7 @@ static int opt4060_set_driver_state(struct iio_dev =
*indio_dev,
> >  	 * IRQ and sampling must go to or remain continuous.
> >  	 */
> >  	if (iio_buffer_enabled(indio_dev) &&
> > -	    iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
> > +	    !iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
> >  		return opt4060_set_state_common(chip, true, true);
> > =20
> >  	/*
> > --=20
> > 2.56.0
> >  =20

