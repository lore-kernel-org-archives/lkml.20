Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752045;
	b=K6QndRj8EChVEWUNPoZurPw3k3cVYcaRIhs155NwWK35dWuIOwROOtaZYg4m/bvLLfEB
	 wuz+KyAU6QgRmyl02+4mzTKEiV+Plniwxc7F7K6l2RxEHWDRYrHx7/8LDde0NxoPTf/0S
	 h83EV12aGajlnQE7gkyexQraBDPjrwuQbk1iIPDkRf+ZQdmMMdqNYYz5KjxTmvbSyOKIq
	 taP2I35JReoq4EV4wnUsAohoYikonOBB7hBTodQqA5831atjpDqRYdQFPjuH71aqB9Wug
	 xZIqK6UzVpZT9svTIlNxjMuveVPSfKRaRIKkiWO/yX/QpS4ZkCT0sxMRM+EEd3HS/AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
	b=p0bupQbvx0ZTrsE8ACd/OgsdQ1ZkikqKIq2wp4nJxUc6CpnTo/GcQQ7pBUq7Pj81p1GX
	 0TB48Xc3Ox5U/fpvCPIDPMjh6RprvbNBkS9UhsQOtnmTzVG15cTQNgBRtZ/l6nY9xsWxY
	 kX3AkAVlv3MtuSaN3PzdWKPUEXpiYjBFPA6CmDwqm9puFVwaJPWIHZutOOTyBlI3wHTnW
	 TQCrRE+kK8xXYQAlA0u69z4xffMdrjcpZOcQFPwr/c3oTXp9+4uafDEQP4kMxpwhtXOHw
	 Y+54bmDZVzxO4p6rUlM3qW/mC+/nseTTePP8jGjh/C1WFkmYLn0hHVISMZ3CcxhmY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDHUhalw;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A5606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3A5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDHUhalw
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-98c78660542so593366241.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792752044; x=1793356844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
        b=qDHUhalwvENGkYicXhp/819z0Cb38eGLFlBd2GcJ+kd+woA2F1L8l9kYdTAygGzV41
         jjsjJKPrcmEv5ryCEEnITghJ9icCuEe79uAC2TIerrCYohBBHBLTZiMIiSOnL7RgoXOc
         q6Gpso+ZmXyHzx5yBUnX/tlI6/9r0A95XfDV3X7yX3MMwNrPcA9L+Z8BuguX0OIOAqlt
         JHwbigQt7F23Hncc/dEgAZqZdYcICFBMwluD4DA7c4nwdtfDwE9g22DxGn7k0FaCEkPY
         uTBI9O6EHgKlpntPbaAxkPlFVAJrawT3KfULj/F4BGcIPiZqEfUbhbaRfaayJgz0OljI
         ukyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752044; x=1793356844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU3pthY8C33I9auXpGTnmiUI6trGGQ/gwWp/L1g0V2U=;
        b=sqrcdj2VeFmcFUigY/q8iodXcN6tNQcj3cXwE+4//pnuEYsx9CSyE2CPQFtQUSMOaV
         LnA1u1OQM/oGRukYkb0YeDMZr+BxBFoFCoD8rcncXjxTpOiLwBEqwUrXvzhwoiV1hgde
         Eoxh5hB5tHaewI8azvGKZFgYLnBUU3b0f78HrnNJ2iUAcUlWBovgdjqVJeom4MB3EKlw
         UafJc3mJZlocDGzxGiR1ON4Beamf9zy/njzcAZK9W2FXzoj9GdPkEiRPPPx7VLv3kcPc
         Dw/NizKW2VliBDQY15FtqnKuPn+9ytWHutRIa32xw7wndHuLIlc4hwTCyL4XpvrELIxY
         dEtw==
X-Forwarded-Encrypted: i=1; AKwUvBxjauI7f2BrnQm01d5f7ry5OdmuO6MadEacZ0wrvPUhFrSJOnioqLjLQ5GKQ57Ju+53FgMqqeoMyuLfO5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLfAVe2dJOGs0wnNmW9CBLk8z/1qdsOsh4zBl6Q67F+uKTSne0
	8pJjYTBG4AQKwsu8Ay+4znh+RQ3Po/OE7T6ZP8Oz1MH3Am8dfFDuliNm
X-Gm-Gg: AYBFou2VHhLuI2Vwfq90n2gBXAqrZCLbDouzZSYDKeTZf50VyxVyiIKMROYnDLQPL9a
	hciAeNSDS76XgnHCy8KL7ly3nglqRyo7YqVOFv5KmNfAjGAlzy+eyRWZ3/16CSvWVFT8nSiuO99
	sOzThFWe8Vp7yuTQ+o7Q2Ma7P3Yyv1gzf+5iynQA7G5iAmXHN5R/kR7d76bZyc51SrnasfZkRld
	sWi9MDJk039C1pYROU1BCYqh5IXiTNkFASLEyjrEyBf+2wvwgXqdKjC7IopDBxpmd889NXGucxK
	kteaQIjxnFRiV/iuWUSU3G/x7oUYrtQzdD/vaHBdlEo/ZPfwnJR0gPP3GNyDlcw2ckVHyjeG5kP
	qn2DEOrv6uh46vnOjWTStk0ziSU3Rznn3Y2dmSdsBPJ7eC7S9sFAN2RDsBR/QuWbCb5CTWt9o/P
	tJzPrL5rCrVlhkJOP3al77CNWNHZ7YMPe4MWbVtxQqfRu/hgoBS7dLsohMfy36VLwxu1NCrvNE4
	Gxj0ntLouhQbq9qOVpWcqQQV7UkCVIeqqjIEtBnYEr0H4YZcyUoRiQCWG0ZbvLGGyosG5FJ/4Wk
	Ql2pK/dkOKawG7g9y7VcE0DTGxUdx1PrxFHCyDAm/V62zOyJDdc=
X-Received: by 2002:a05:6102:41a1:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7ccc32eac6amr858728137.13.1792752043685;
        Fri, 23 Oct 2026 03:40:43 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13deaba5sm1974736e0c.1.2026.10.23.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:40:42 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 23 Oct 2026 07:40:32 -0300
To: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 07/10] iio: frequency: ad9910: support drctl control
Message-ID: <pg7pcjaaxuu6vmi4qowgaefyo3mynrvmiu6iazzormyvc5kiat@4hiqrtwbw2gg>
References: <20261022-ad9910-backend-support-v2-0-0ff7f0bff326@analog.com>
 <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-ad9910-backend-support-v2-7-0ff7f0bff326@analog.com>

On 22/10/26 12:19, Rodrigo Alencar wrote:
> The DRCTL pin controls the slope direction of the AD9910 digital ramp
> generator (DRG). When dwell is enabled at a ramp limit, the DRG holds
> that limit until the next DRCTL transition, so the sweep pattern is
> defined by the waveform applied to that pin, which can be generated by
> a PWM.
> 
> Get the optional "drctl" PWM and expose the integration_time attribute
> in the DRG ramp up and ramp down channels, which sets the time interval
> assigned to each ramp direction while the sweep parameter is accumulating.

...

> +	st->drctl_pwm = devm_pwm_get(dev, "drctl");
> +	if (IS_ERR(st->drctl_pwm)) {
> +		ret = PTR_ERR(st->drctl_pwm);
> +		if (ret != -ENOENT && ret != -ENODEV)

Sashiko points out the problem with passing a non-nul con_id to devm_pwm_get(),
which would get us EINVAL or ENODATA from of_property_match_string(), and that
would break the intent here for an optional pwm. Similar to what we tried to
achieve with an optional IIO backend. I wonder what is the best strategy here
(ascending order of complexity):

* Use con_id = NULL as DRCTL is the only pwm signal being considered at this point.
* Local workaround by checking for EINVAL and ENODATA too
* Convert error codes from of_property_match_string() in of_pwm_get()
  implementation and create a devm_pwm_get_optional(), which would only check
  for ENODEV and ENOENT.

The pwm is optional as the digital ramp generator is one of the possible modes
to be used.

> +			return dev_err_probe(dev, PTR_ERR(st->drctl_pwm),
> +					     "failed to get drctl pwm\n");
> +		st->drctl_pwm = NULL;
> +	} else {
> +		ret = devm_add_action_or_reset(dev, ad9910_drctl_disable_action,
> +					       st->drctl_pwm);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to add drctl disable action\n");
> +	}

-- 
Kind regards,

Rodrigo Alencar
