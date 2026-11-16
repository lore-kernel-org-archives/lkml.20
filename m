Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811328;
	b=f2UtoRcFoXGE+TK4tE+asAmgNl6WfUfrtsB+bhDK4NnLg8YRXChOdyVloU1kt4LdVRVn
	 GaVqDSCqFFUkAXmoTFAVInQSrP4m7WsSrs1dBZfl4injJVvfgsYaLoo2If/nHviW/hyve
	 r/ji/z/98SXlJ/U3hpxxr8jfXywySYDlyFKZQtj1JFAh5/D3MxsyFfSNsprvKUlHd9pg3
	 phSBs8o9VQuPDLaoKzOm7KBanqXJHxS8srCU2j2RUgDDQ0i/wLRUBLbb8+EilbW8bwGl5
	 u1aPf4oTdmQrUeWZ9/KDM3ADhCuY+W8e4pgVcV3V/VXn9F7AOgeAW9HBISPqndng9gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wRWcbRGa0lw5+zrHUwoAEHoN60ejoMH5x9ja73muYZA=;
	b=roskXRza+VM/34Yq1TktCMlOQd+TwIIOyPajSOspZR1MtL6eu/QJIZG7NiZZLQHwdT4T
	 SmFI+Ek3FS3cgXdAFz/kqv6nB+LFCpymIDWGipN9yqH+a4AXijnwfuPFjKsKCAoCAU6Mj
	 OHmBu8LlwifIvNjg8tj+vbFrdEF2m7L0hhB/0wFOI04fw95nqWFt0Rvvy5rwbjFail1TU
	 2DaswvEgMn9Wa1FCT+Gi0NpyMdaH1m0JDDouAqgnO5bI6BfIbTr+dI6wSI6LYArlpi7YT
	 SascL8dIQu1Ao355VfgQd1mOK6xYq9E1ke7VGfusHIS4ZutGNpXpxNJKA142Prg4z4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifZf+Fwd;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4949B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifZf+Fwd
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1371781a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794811327; x=1795416127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wRWcbRGa0lw5+zrHUwoAEHoN60ejoMH5x9ja73muYZA=;
        b=ifZf+FwdSDqg952lqdRo/+g480XgHdVYCnHVDpT/TyiaidyOuqYX8xE8J0JJguMUZo
         uKqHgl1Thu1cLd6z6/nqK+p8Y9+rRhdgTQb83+trn98vVrQ+vYgXI1eNxgEpif/R1V25
         f32rYfrseR+mgJltUArzqJlHFUNNzxVt/c9fzCoK2gPkMJkk33qyzsV6LinbqoWzN6fN
         70xcz3xTSeN0u8Ozxq/NdqqY8gNaTm2f4lBIx0q+JCPrIAfAZ0AeS80QgQRCCfoFJJ0p
         eM76MzSbQfcDm/rG7f69Lv3FIxV8cg5HYnWBBcs/CyZX2IkWDp98l2FYJTmOA7RfGs/G
         iKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811327; x=1795416127;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRWcbRGa0lw5+zrHUwoAEHoN60ejoMH5x9ja73muYZA=;
        b=kefzqQ0ySeaWCcWc8yQ6ZI352c27KXsOv7XykLTLU2yvTEfuigc1ehCwOqjkU0TeQw
         FNHmWnBcmedSs42r7vPRVomVpSuPO26Et9fNxL0EAs1E7qLzgXmHyiknKrHlbM+bvDCG
         1hnmgLk0KeB4tNWKrCLJeH6TzF+MXBhr2qGO1FY7kbVk08GVzbdn3Z4cnPIbfUz6MZ6G
         BAposKTPqn894AnkNJ+39qvETVg8fswivjtFbNnvNon4wz1kO4V9+NPbYMh8Nq5fwBhC
         AmsVQfKzmUwcDUckTbslznyztPsqQ4cZ8arEX3Jm9cZtRVhQ0j1wNLSeRPJBDQthQ9R0
         95MA==
X-Forwarded-Encrypted: i=1; AL+hErEm8GCrwu1KkF4m5G9k4d00JreTg7rJrpcT3cjPrN5r/rLrYqkp5AbW6nlYsXFnhqI94EI/n7BW8YzHlfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wgUhxzSl3otdvS3xQxbjeVlhLss/sqDorAYfPnrMvVL/5vsHO
	n/AUF7ri25rjEpmqIL5iujBljjDTMnVj6txyWQ7CfWeS2ta5pMr5iWqa
X-Gm-Gg: AZFdTZeZZA7QNDuM86kw2w8B/UEcwx04K1eQhvsDLi2HmIQruEh3tIxDhHuuysxrCpi
	uNmRxCpa2MEh5bSPZHXIShVO/nz4uqhvJdi8RGTjRFU5vRNqsbACatbWoivqAgVoSLYGXGu84Ag
	hHyA/X9p84PgrVa+rv11j8AjAeEy02qVgagA89U7Vae510R+la4rzZii2b8+EfH4YyRSr3O0rXR
	n5iCdzn7NhxxY4/+w4wmajoclmOSToeRJUjnhnQyur/1cFfX0JKjFpZMyBAhwOhhfus4kzvRlU/
	YSXG7IcIWc/waa2tGYg9JFsGFak/BfJS9DWLxgVIWQtCniZbw2btLKEx9JYvbEaZITweT2gVJBJ
	oHxTVFx59rkRzbhT2K4wIS5T3Zfr+vRCfEwbAQE6anc9RyrlfrrcA4MSusEgR/AlBE6O5uNI6b5
	Aw2w9mstyDjm8UCQhSritmR4ScRipeqIKnpEt5G6EQxmPnxCxbtm+uJas11w8pxpxgKnyzME2js
	4/xlzrdBhMkG1x9ZzUe6ZLxg/oa4SHXkmjljJj3hO3LCMTRfmnn88z2YSj6ag/ocNpwKySKlSvZ
	2rd7y6OnHGdv9IbI2bC4EQelDjgMDqQPCB4RDowMMKsMpj+XIIsgtk0ylVEZ9tt6A9tM6mqQYUc
	=
X-Received: by 2002:a17:90a:908a:b0:3b1:bee2:223d with SMTP id 98e67ed59e1d1-3b1bee22478mr5477449a91.53.1794811327578;
        Sun, 15 Nov 2026 22:42:07 -0800 (PST)
Received: from ehlo.thunderbird.net ([2401:4900:8fc5:1e29:1b2c:eea1:7fdd:964b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm14960106a91.10.2026.11.15.22.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:42:07 -0800 (PST)
Date: Mon, 16 Nov 2026 12:12:02 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Joshua Crofts <crofts@kernel.org>,
 Sanjay Chitroda via B4 Relay <devnull+sanjayembeddedse.gmail.com@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/5=5D_iio=3A_Remove_redundant_pr?=
 =?US-ASCII?Q?obe_error_messages_for_HID_device_drivers?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261105165254.00000896@kernel.org>
References: <20261105-19-oct-hid-iio-unified-print-framework-v1-0-0b360d9552d9@gmail.com> <20261105-19-oct-hid-iio-unified-print-framework-v1-1-0b360d9552d9@gmail.com> <20261105144036.00002e1e@kernel.org> <20261105165254.00000896@kernel.org>
Message-ID: <0CDD7FDE-6E03-473F-8910-2C33973F23E0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 5 November 2026 9:22:54=E2=80=AFpm IST, Joshua Crofts <crofts@kernel=2E=
org> wrote:
>On Thu, 5 Nov 2026 14:40:36 +0100
>Joshua Crofts <crofts@kernel=2Eorg> wrote:
>
>> On Thu, 05 Nov 2026 18:11:43 +0530
>> Sanjay Chitroda via B4 Relay <devnull+sanjayembeddedse=2Egmail=2Ecom@ke=
rnel=2Eorg> wrote:
>>=20
>> =2E=2E=2E
>>=20
>> > @@ -377,20 +377,16 @@ static int hid_accel_3d_probe(struct platform_d=
evice *pdev)
>> > =20
>> >  	ret =3D devm_hid_sensor_setup_trigger(dev, indio_dev, name,
>> >  					    &accel_state->common_attributes);
>> > -	if (ret < 0) {
>> > -		dev_err(&pdev->dev, "trigger setup failed\n");
>> > +	if (ret < 0)
>>=20
>> You could also remove the comparison and just change the checks to `if =
(ret)`,
>> as devm_hid_sensor_setup_trigger() always returns zero on success=2E
>
>I suppose you could also add a precursor patch that changes `return ret` =
to
>`return 0` in devm_hid_sensor_setup_trigger() on success=2E
Hi Joshua,

Thank you the review and input=2E

I agree with your point to replace (ret < 0) with (ret) as devm API return=
s zero on success=2E

Do we find value to add new check and have `return 0` ?
devm_add_action_or_reset() is last operation in devm_hid_sensor_setup_trig=
ger() API which makes direct return as simple to follow=2E

Based on your suggestion will send v2 with additional changes as trailing =
in the series=2E
>
