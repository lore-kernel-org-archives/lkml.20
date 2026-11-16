Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843833;
	b=V/h/NpaZVeHdOAO/pexYSo03xP4+QxxaqEMcHPOkrs/RkYzN/U7q2Vy2bdtLBfnT+WLl
	 4US8P2FQFseBodyWIXYiSCb3ySPd6MDIiyAFzE+oHyPRRP6pYIObQ5kRN3Z3UFN/P2/Ia
	 g85RYNq43mcBb1eB8xVnabktcCzXGVVqMNLzt3Bm9s+SjC0vTBnMyEx74bwMgZdHu/zzN
	 KxydV2W6gRQEwD0xYI+bS+Ru6ZSSHhR/6GcZztpFGA1gE7wxIlfvzIg0wdUPeLoIDGBd1
	 4dgwm322jBMjVRfYy7HLFlu818KtNtm9gK2kxiaCfYNT17J8/i6KcOjak85HkZQAlyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
	b=kNnEcSj6slwN/6DVvtk5OVUDxzu9sJv4qirU3+BWeTWQ3WYEbblrluYurAuSZfzcITOA
	 Ven/8UVFmCoNrLaWEB0XF0aaakB7ccGYJHO2buZknejb2LC1IGWB6Rf3CpD889Y7bkVur
	 mUR7YNjoGfEMt2hcfW8B72YI6Ul9E25zQwZj83fUwH6V6LydyC15zqpozO+Z0SYn0jt4w
	 n1bBaawN8j00NTmCD704qJqKp4Nt8zBdKvo09vrZw2aFz+AJM+1TXrTDD5KvUeSTg0fry
	 gW3sFBg8piGhM58NQ7zDYNtd3pCzBP0cMIDkftJq8e9w+zhDIVlhrODQRoqwOU/UDeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D6606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650D6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4697404c2bso487079466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794843831; x=1795448631; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=l5yFnpD8es3PZ8hErhgAyB6jNHgRJQL2UrqaB+35VDA03JWtWhtFRjub4w8iKrO77e
         FcXuh9bolv6SYa88Apk3Cj+9S5ZwpsJlBdiFSEej53nktGjQ0LAsYndjgYq4DB2bD0yl
         Nyiy5scYIfhVrAS4QNSBaNJydK3icLZBN4M0F1B1L6Waj2/CbMjaV0UG6L7lgr8aVaGD
         pXTH8mr0Uek6+QgkGZxJY+7f0zkWMqOFQHSdN9vHIUiEuWSmJok/yRbEEZJRUESbTGNj
         3zjw9jYFXIMQVSV2tbewdyiO4fsAHVQXDakxoF3J1EzoW4EzlIXY/FZ/rBxt0ZFpDLkw
         9Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843831; x=1795448631;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=ZbfW4eA/FXYLrOzJErtYndpFbPOb5aEHeyJCndXu9JszxkOfH/MHtbeZHV1zIsPvK9
         1ajmGYSgo//aQdRqHrpQCYAktTcXnr8Bw24Au4BFst2IvzB1OVsu9NYfjr7j7MOadEUN
         ppK2vy2yqaZHCtN7Z9g6+2uiAXDY14e3zuAOluj9i23emH/crXKrbjYmaEvJosWOmd8b
         MAIK2lxqRS5ozdccV7lWn2NcEe3ymxOwyN2c0/5puuUdrOlZfOH6qmSWmDrFdz2lPTE4
         z0Gi2Urrm+vhHIk5F9cwLFaRNycYorTX9+0mYDAXb76CqNQXUJG8V3VS2e+tYRbi2qx9
         GPKw==
X-Forwarded-Encrypted: i=1; AL+hErHqk+x5KNHHBTWH3W5jTwt6z+lQsElteChTSjIMqMl4mO1HHk5UYyZRRBE3pDt4vkoLPHzxxwpxLH/q+o8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L1S0fxCHa/+Dwo2rHEgPY8Nvg8iu2EixXWMUWbIQQDbgV4A9P
	h1mgcO7RXDAW+uwSxNH9VEbhOqdMvQg6i9aFs5SYP4Jv3wj6uqz9W43Sqm+IAoXdbug=
X-Gm-Gg: AYBFou10JraxLrMUuxv+3DfyOqUuKgIAgkMMjT9afbqr5J0dHI7Xz8DfRFs+V5+CEhg
	S5V5x+mCV/DVH/SpTvTVLaSLvvr/W3JpB7K7pDq/slrrpLJrZimEBN2sJkDT3qhP9mFiCWaIkYt
	wJ3d+q1/jLRbD/CxuyPXcEG23I2OlPPMULXsJ+phdk/0BMQ8KRhbFJBoEdCy9QF3Rege2Qf9oFd
	VYoEE9tajKss2T/QxzwGp0toN21M0/KbBwowlIWYrQBau+Fw9+UGkW5WCMjQelVywul5wyRdQDE
	9hl5VeSJKzur5irmdQm6odK9c0Bicu82TMFV8cWPlldtcvi3gJeqCqFqJHkdxfgh/3jgM+4yPiP
	f3jA5Mei0T1pzAubMvnEXybUINglYdIdMf1OkNyHBUOYoryVLWi80alat6qSvRIDSEb+YOkNa0r
	u0+qOdZ5VCDydoMI6/Ig4+sCbS3j8JGMeGOVcrwI0kijG/W1J32OjvsljQFACvTOsgHf9x37pGA
	7sOKUPED/SZXiPAE3B4DYMzOqXp39A+1hfrCcLCbNXlU582EywvFkyM5aMk3vg3cNNw0EkJXlKM
	FwdXb2fu1eD6dVGtWSMkTTmeoOPkU9It1ldnQ3ZEQx5Hwh+F6gPpcYuLHCDwT8nyzgc2fcKQBQ=
	=
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr844840566b.16.1794843830845;
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40918sm439294866b.39.2026.11.16.07.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 16:43:49 +0100
Message-Id: <DMWR1CJJRHMF.33YRRRDXPMBDW@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Laxman Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey
 Connolly" <casey.connolly@linaro.org>, "Val Packett" <val@packett.cool>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
 <20261113-bat-temp-adc-v3-1-743979a8fd90@fairphone.com>
 <avc5rnvIAEmZbyE1@ashevche-desk.local>
In-Reply-To: <avc5rnvIAEmZbyE1@ashevche-desk.local>

Hi Andy,

On Fri Nov 13, 2026 at 5:24 PM CET, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 04:56:42PM +0100, Luca Weiss wrote:
>> Add the BAT_THERM channels with millivolt as output, which can then be
>> used along with information regarding the NTC in the battery, to get the
>> actual battery temperature.
>>=20
>> A static lookup table in the ADC driver won't work since different
>> devices have different Ohm and Beta values in their battery NTCs, for
>> example a NTC can be 10kOhm & B=3D3435K.
>
> ...
>
>> +static int qcom_vadc_scale_hw_calib_therm_volt(
>
> This is broken indentation. Was `clang-format` being used to achieve that=
?

This is how the rest of the file is formatted, I didn't deviate from
that.

>
>> +				const struct u32_fract *prescale,
>> +				const struct adc5_data *data,
>> +				u16 adc_code, int *result_uv)
>
> result_uV

As Sashiko pointed out, this is labelled wrong, the result is millivolt.

The rest of the driver consistently uses "mv" for that, should I deviate
and use result_mV?

>
>> +{
>> +	*result_uv =3D qcom_vadc_scale_code_voltage_factor(adc_code,
>> +				prescale, data, 1000);
>
> 1000 is odd, can you use something from units.h or combination of those
> to show what this multiplier is for?

This is converting microvolt to millivolt.

Shall I use "(MICRO / MILLI)" as used in plenty other drivers? Two
drivers in the tree also have "#define MILLI_TO_MICRO 1000"

Regards
Luca

>
>> +	return 0;
>> +}


