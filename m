Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500203;
	b=Ru7J1P4B+Wt0+m7Kroo3TPYK5cNduYI+LVwt6vji/xcor0QC/gn4Tp1K2+Zem6z/GVpR
	 EOMeuCwvCZdN0k62phQNywDpR43yyB8GlrGGvsQOMbcs08nLSkqmUt3rAKGzYObZk9TbH
	 4+lqnZ+4mb3tMclAcxXujxcjhBJTsxB5jmCNGxJgpghHoOx0sPwGs7OoG35WBLOe1UoC7
	 f8ZNsPk19va55rN1JtbYwAQklkNpBVf5QWEh9QLFcqUH55Htk10XdqwU3eb38Tko+Rwcs
	 ZdWqiDO8hkS+fkjgUiA+3LclOXJFeM2s0N9EpSeH9E04/fVBpscW4tyg02NIsz8xbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ADOCDelITMEX4p4h4TfmU1ayoJRVyWEUw/EIxGZkeis=;
	b=u1biYY7ICB2/zLGxAf6YR/quHPZkMXViZzVREAxEmUK7KlZ3MuwBvaSl870a4C17Qlvw
	 uRF2AlWhlnHVqLpBG0z/6Kvc1ioNQJcDbNFXBL7UxsQt6FLkLE1BljCtvg0ISgQ9I/pdE
	 Ravri3/UBygO6W/kxrze0ZVEPvtun2nRqo57xwR2g50gRWxzQKHcKC02Ph7Qn3SAGVW87
	 jbfv0DzH7JEC31GsRhoEhj+uIxhjMWW4VBeC1/rLEfDLONqGO0lLs6YSaBidJEq4s8Qln
	 0Rxvh6dCRzYAbw7V3UA1JwXrfbS3YAZwk7+46V4d8nZ4U01h1AIN2MIerguUGpSGsBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iBE7MP4L;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336F160A2600
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336F160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iBE7MP4L
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so587433eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500202; x=1793105002; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADOCDelITMEX4p4h4TfmU1ayoJRVyWEUw/EIxGZkeis=;
        b=iBE7MP4LiiXqwWMF8SJq2RfYIZ2T7MJv8zOoaiOFkLAV1WuVTpqMVKlupysFYR9agD
         JoIUmQsM2Wd+Jr1zPqhHEqXgvd8LIP0lBJOxxr0v3fo3flQ7529Ib/Xi4OR89hlo8lqf
         Dxd3GUFj1P5Ej+lsMC82WQKoc+HsZxvIpghogS7SsPkwm06fuPr5T8/Gm/N7/u4H8qCu
         qahCwD73SDmXZB+GPZ2IKk2ROTHCQL0k+Pyw+T3Mwnb3VB1aVYDmNAH1yAE2PBU7au5L
         ywiezeq5X35K+GTEhYn4Q+rUR8qPttM0Gogem86PxNmwgMQksM51g2JBijd5II/rMhB0
         edxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500202; x=1793105002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ADOCDelITMEX4p4h4TfmU1ayoJRVyWEUw/EIxGZkeis=;
        b=svCQLzd7R/RYL0dpd8/Gf0ILjeQul9xABvNDHl6/UBmqeJrTX/yqqDTcSCI+28Q6E0
         jYuPPxluZF/kQw3BiqGsDdtJFJwUho3rxru3kxbi5kw6d0Ufjn2bC/dQv0MCaETEYrCz
         BnBOlTB7xxrOdS8DJ5IFNk5D5eXS4jWUlNheu0jswghBF3cnCGpeLzD4kCmkOalgNp8W
         nt9SRmLC0vBQvfDxNI9FwCwD0jxu9HUvPqYQV91CpvnlwoxWWC1lkuyc58WzqmTqlYx3
         1EgBCAqDonscw4uBq+yjGh1Z4xjaG1CR7yppDs+PeUg9Ij4KFi1tItkrBWFQulRlSsbu
         at5w==
X-Forwarded-Encrypted: i=1; AKwUvBx9v/rSWAWSbnUHCJwis/Z4cCviXC/8uPzFgsKZkYDVLRVy/Fl1AWWEPD4D0ncxCo1p1cUXg8P/f3f/DNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaiNuzNuJDsxJGtHqahMkgUyvIh6zrZbNjnVr6n8/UDJvJ1Moi
	QbBF99ZGK3XtGkKNv8Z7yOjmnm0F37Z38gfrxW0poJ0IjfqAo8zKcyT6
X-Gm-Gg: AYBFou3tAqYCb/6xDnX+AmceT4Q9DXvy6KP145K5YLyz0jLJ7Fhu1a5W5H9P0RAUYqZ
	Qjh1s5PZoLZiVVN8CWqMxJt01RDxjnThGtBqiVa5YpggknrPpdC7VvmDJuC7WIVn8croH5qhsj/
	gqrKU7inqhXLSa5fmKmR/Gde2N0IO8CrrgRR1xRVj/YE8Wsy+y3sWSf9u/yfvSD2Prb+oCcBrLU
	WEDt+fyuvoAPa4y1cCdLn0n5B/tSRa2aQnpLBs+D7/avUjLituY8cig9OXrqIiYG69nyuvhsld2
	rLqAKN7tssOTTJ1cVpedmn9ajZX34Cjazw3eO1BqCRuiUd/ZMHVnUNMQ5U8isYLH0ZLP+X1FFK2
	hIT7buyTALIwORcqeeXDGixyTwTjlFZV+XcMfXpIllGpnCvdhgBFtUX0JGW11i36mtS+40Shqrg
	xUqYXJAwp4/xsYrj0JY0GJU8wHU1gvN39awKTiFmBJEwVHTHGMemPyAoxf9Wa/EKtSfcYF37Y9D
	ysQ4KMgJ3U3QAXNWl8zF+nb5K1Q855jpd4dFAZ/nDZ4dHSqlzZ1vijnwSA4pN31YzoXscT8cIc2
	bw7n
X-Received: by 2002:a05:7300:de49:b0:35a:7020:c08a with SMTP id 5a478bee46e88-361a186094cmr14849051eec.19.1792500202072;
        Tue, 20 Oct 2026 05:43:22 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.31.netskope-rdns.com. [158.95.44.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm40204577eec.18.2026.10.20.05.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:43:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Tue, 20 Oct 2026 09:43:07 -0300
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 07/10] iio: frequency: ad9910: support drctl control
Message-ID: <v5meo6y3jn6vcmv7kqtbqqv3bq36xb6pk2kysdwpwkfvixtqzl@rojpaxrte4sw>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-7-3c21648c8e26@analog.com>
 <atdcOsaDbtaQJd-9@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atdcOsaDbtaQJd-9@monoceros>

On 20/10/26 14:23, Uwe Kleine-König wrote:
> On Thu, Oct 15, 2026 at 01:49:47PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > +static int ad9910_drctl_sync(struct ad9910_state *st)
> > +{
> > +	struct pwm_state state;
> > +	bool ndh, ndl;
> > +	int ret;
> > +
> > +	if (!st->drctl_pwm)
> > +		return 0;
> > +
> > +	ndh = FIELD_GET(AD9910_CFR2_DRG_NO_DWELL_HIGH_MSK,
> > +			st->reg[AD9910_REG_CFR2].val32);
> > +	ndl = FIELD_GET(AD9910_CFR2_DRG_NO_DWELL_LOW_MSK,
> > +			st->reg[AD9910_REG_CFR2].val32);
> > +
> > +	pwm_init_state(st->drctl_pwm, &state);
> > +
> > +	if (!ndh && ndl) {
> > +		state.duty_cycle = st->ramp_down_time_ns / 2;
> > +		state.period = st->ramp_down_time_ns;
> > +		state.polarity = PWM_POLARITY_INVERSED;
> > +	} else if (ndh && !ndl) {
> > +		state.duty_cycle = st->ramp_up_time_ns / 2;
> > +		state.period = st->ramp_up_time_ns;
> > +		state.polarity = PWM_POLARITY_NORMAL;
> > +	} else if (!ndh && !ndl) {
> > +		state.duty_cycle = st->ramp_up_time_ns;
> > +		state.period = st->ramp_up_time_ns + st->ramp_down_time_ns;
> > +		state.polarity = PWM_POLARITY_NORMAL;
> > +	} else {
> > +		state.duty_cycle = 0;
> > +		state.period = st->ramp_up_time_ns + st->ramp_down_time_ns;
> > +		state.polarity = PWM_POLARITY_NORMAL;
> > +	}
> > +
> > +	if (!state.period) {
> > +		pwm_disable(st->drctl_pwm);
> > +		return 0;
> > +	}
> > +
> > +	state.enabled = true;
> > +	ret = pwm_apply_might_sleep(st->drctl_pwm, &state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = pwm_get_state_hw(st->drctl_pwm, &state);
> > +	if (ret)
> > +		return ret;
> 
> Does enabling the PWM have any side effects? Are you doing that only to
> be able to call pwm_get_state_hw() and thus find out what the resulting
> output looks like? In that case, pwm_round_waveform_might_sleep() might
> be your friend.

Thanks for pointing this out, will look into that.

> 
> > +
> > +	if (!ndh && ndl) {
> > +		st->ramp_down_time_ns = state.period;
> > +	} else if (ndh && !ndl) {
> > +		st->ramp_up_time_ns = state.period;
> > +	} else if (!ndh && !ndl) {
> > +		st->ramp_up_time_ns = state.duty_cycle;
> > +		st->ramp_down_time_ns = state.period - st->ramp_up_time_ns;
> > +	}
> 
> So the configuration depends on the previous state of the
> AD9910_REG_CFR2 register? That's a recipe for surprises?!

Expect not surprises. It depends on the current state of the
no-dwell modes, which defines bidirectional, ramp-up or
ramp-down behavior.

That is documented in a later patch. ad9910_drctl_sync() is
called when dwell_en or integration_time attributes are changed.

-- 
Kind regards,

Rodrigo Alencar
