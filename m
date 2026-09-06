Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365A3655C3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725771; cv=none; b=XcJLuvxgBmjhbhgPyEfqSvgPhmKnxUmWoJKBAmt/Z3DeByMMcDR7pXaGwmYdnOTTvhNBsis/K7EAl/+MWy0GaZJePf6hDhB1nTUSsyA536K9pwP3eAaOb7tpkiSSi6aWu2BbIu8geDkQP+YlqICSnTf3u0379IfDDzmX0cK8E50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725771; c=relaxed/simple;
	bh=fO5Lwg7bVKd3xWFVdpuMa1iIDalrBwPzFNje6U0hlhY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=FZ8+484yeZv78Bevc+Unv+NA/b5GdExb2H+WDxyd+Ct6qu+gmGL3m73i3HqQnXg1um3/3ndJ6zsiqKuyZPcNVUOwjkZ0sH+E+fUFz1uydNAjeyYMcH3u1DmcMaheXl5TsNTyvlFfg4J60Ll7eL3EZFMqD7goYEf+YOEZGCZjkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=my1G1fBx; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="my1G1fBx"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c67175d176so1254850e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725769; x=1789330569; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2LTI3znDIwovyervFr5DAc883+eC41JzvRn5/loQas=;
        b=my1G1fBx9KNjMqwZZ0Zw7kTohIIN9ia5e1dKoUkzIk8UC6UcxKfQU0PSiJ5gGmNtG9
         cGfmBqgpjNSahdQvtbgU4IcIqjBwKsbKQlBao/ZrpRGtmxTfWK8Cz/ta1IHq0J7DyHdw
         QC2HAL6BuZdHcDX1wtMYen+KgAtXkx0iQTBAHS7vdek48jew2EY/dGPfy0ZCie5MKwUJ
         0+N4Adi561hjPjDET8NtUQIX4v+Bu5p4AFGRb/4tT7ROZ0LvjaJ1xFLZKIOf+UWgHYM8
         0lZgnwocjVBquXo2GR81Ca/37TbHCoMFS/tdlLsJYLDRbFvGanUwXwtTbLA4GzE0h/3/
         La7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725769; x=1789330569;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2LTI3znDIwovyervFr5DAc883+eC41JzvRn5/loQas=;
        b=cMq6nZkV4n0eqP4aAPz74sw8KrHkbs6lnQ9Xhk5wbh86vIV6K1UGRoPxwKNz91l8vZ
         M03RlJhYmonj7o5vJpIgeIQ+ONc2CJTfFLsgLX6ZpFkgBBcbqK9zqN4DN9ciGP+JnnR+
         wH8/S8KlXU8NJDCdOOyIMKxnJf2y4bodnHNCDcGhG6SULJLZg3CaSBNoEgiBoPG24vCr
         fcChmY1KdX76yVBKaOJWLT7JkGjtZiUW+PelhSWVyGBPLxT3Khpv6uHAhXjMWfl4jjOZ
         S3AVKKXWbB4PeQU6EnfPwRHbJfJYti2IVbTTomEXnvWjv+DuE6XCIxBrDiw4Rav8hDHG
         J1rw==
X-Forwarded-Encrypted: i=1; AKwUvBzl9GqE2TUbaN0kOP+4ZZ/bLdwaVPacmqt5RMZWuVeF643CbgEX9NFk3jfp79EOLHN7mojgVwdGxvNuLmw=@vger.kernel.org
X-Gm-Message-State: AFuF++l/2XN3OC0ctqjxwjw+cJgoqytpamkFWeBeYP+Z4xX9dn2nJF/J
	DKtBpaR9v6F31asB9xQi9sJkMfVTvwn/KEy/SkE8Eq/oyMVZQQ6RzIGB
X-Gm-Gg: AYBFou0rrj7b1uV9uW5NR9YUWh2Flai/BMTSXcnZiE07vgXRbYN5tnqcN/i/tWu3/hP
	9COjfnKMsGSDnMtjj1auPi91CaGRBeRWKBGZOTIB/Vs398Cy1Cdr3MnBSSt4qvGZK6OZ3/fQps5
	8VHpq8HqrbPiF0kOLH6j67pnfLTUPOLuPUHWSQ8VqSbURzaHfwOliDycfcXjI9liIR7kC6liWbz
	0Tny2DAa83kZoGCqerKPt0jAKLE2GwR1YWZWa9J6Si3A04kZPHoIU807Zu55MUDXvVbawKrvyhn
	s/wecrWwyqjrnviJ9+JzcVhUvySHh3VvM+GNDBamQiJVJD2cvOa+OAtRlc3dXOTI+b/TEvRXCWg
	EBXo4HGB+0lN2hsrQnDzghj+Ek9WtGCuC1wE2M9016geKZQFoPK7iH42PrV26CLn09/X3N9JVO2
	YQ2Q0oPfQNhEi2qTZ3aHiu2H37vca8yVNNQjsyq9nuqgNAbSb/+g==
X-Received: by 2002:a05:6123:2c8:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5c7ed3e2247mr8141061e0c.6.1788725769334;
        Sun, 06 Sep 2026 13:16:09 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm6411242e0c.9.2026.09.06.13.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:16:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:16:04 -0300
Message-Id: <DL8ID3WRU6QA.2KWPJIFB134MH@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/10] iio: adc: ti-ads1262: support per-channel
 sampling frequency
From: "Kurt Borja" <kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-4-1dc27e9c0260@gmail.com>
 <20260830023619.654d1bbe@jic23-huawei>
In-Reply-To: <20260830023619.654d1bbe@jic23-huawei>

On Sat Aug 29, 2026 at 10:36 PM -03, Jonathan Cameron wrote:
> On Fri, 28 Aug 2026 01:38:19 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add per-channel sampling frequency support. The "available" attribute is
>> assigned per-channel too, in order to eventually support per-filter
>> availability.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> A build issue below.
>
>>  };
>> =20
>> +static const struct ads1262_channel ads1262_default_channel =3D {
>> +	.data_rate =3D ADS1262_DR_20_SPS,
>> +	.filter =3D ADS1262_FILTER_FIR,
>> +};
>
> See below - this probably wants to be a slightly more complex define.
>
>
>
>> @@ -763,8 +970,15 @@ static int ads1262_parse_channels(struct iio_dev *i=
ndio_dev)
>>  	if (!chan_specs)
>>  		return -ENOMEM;
>> =20
>> +	st->num_channels =3D num_fw_channels + ADS1262_MON_CHANNEL_COUNT;
>> +	st->channels =3D devm_kcalloc(dev, st->num_channels, sizeof(*st->chann=
els),
>> +				    GFP_KERNEL);
>> +	if (!st->channels)
>> +		return -ENOMEM;
>> +
>>  	device_for_each_named_child_node_scoped(dev, node, "channel") {
>>  		struct iio_chan_spec *spec =3D &chan_specs[i];
>> +		struct ads1262_channel *chan =3D &st->channels[i];
>> =20
>>  		ret =3D fwnode_property_read_u32(node, "reg", &reg);
>>  		if (ret)
>> @@ -772,6 +986,8 @@ static int ads1262_parse_channels(struct iio_dev *in=
dio_dev)
>>  		if (reg >=3D ADS1262_MONITOR_ADDR_OFFSET)
>>  			return dev_err_probe(dev, -EINVAL, "%pfwP: reg out of range\n", node=
);
>> =20
>> +		*chan =3D (struct ads1262_channel)ads1262_default_channel;
>
> This is giving me a build warning:
>
> drivers/iio/adc/ti-ads1262.c:1913:26: warning: cast to non-scalar
> drivers/iio/adc/ti-ads1262.c:1913:26: warning: cast from non-scalar
>
> So we can't do this... Hmm. It's pretty simply. Use a define for
> the default channel with the (struct adds1262_channel)
> and that should work for us.

Thanks, I'll go for that.

...

--=20
Thanks,
 ~ Kurt
