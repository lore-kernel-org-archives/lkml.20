Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705774;
	b=4OgcXWYbmMtjoJmf4QEABNhXr/7/CQB/4ywY6AiniFO2GxLv4+IyBY3KrQiPGbO+p9l4
	 Y0jalGXCrFfmV35gogmcMz2j6mynLrySnvGruD9APoWo3WtA5PxSBXR87krrsTa3kYdl7
	 Vyv9Nn+CekDhX0xOqMw1busreZa54dCaeccT5tlDIbSlcWN4ASB4uBL+x8htcmb7OUmwZ
	 ecqIySpjUm2mK21bRartMQe96qVKew0pYk86PeNGIqieWvhcIbBodsWS5CGq3525lvf3F
	 Ke6r/bhGWRJeVCoEP7ozSp6T2j486dSC3LZLAErzK3d5cg/GXo6jPSv7597QWpry/LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
	b=yJnVspF2/+lwOuLw4C2wyZiLxHJ/XnkJwANOaD8SeF53dBjJFS8K7uGsWqmxx5TmUK1X
	 +r+qxUkup9H++7GMuKp9bGSfiPxI1lEAFHeLZNXLTmDIpxcMzK9GdKHvBrrDuNQCuzZp9
	 BrfICuIXoeNwCrpekCNtPBp/RkKJlx3PwIIrHyBROC2mlpJGotXYAf1ITfraGQ9Zd2flz
	 rsm/sLWPEHFNWFNemdIePo+VaQteDd2wIrRsd2YWr2+a5gjhBDvV3ttYvmSMuPxz/yK2o
	 OUur9JWzTRHO1Q13+OBuB5BYd5qriTr/sHbR6H9WlE7sjxiyCoYHBD909P81JwwAK5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D44606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D44606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so3899617a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705771; x=1795310571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=JXvE48TKiy91S9dvEv9At4IP8YWrv9G85CuWVftuPW0Nm42VDo9KFgSl0Wt6vcS56X
         H/qmdvNli+F431Mg85skwEVk3uZHmXjh03Qi1nriXU+eIVvL33jxebJhCOEYHkhdTzpe
         qqZmE/91d+DfQD6wRraqOOfh+6h/j5NhZExktRhovVugD8/uWjdRZ5edtEdRvQKSbyzS
         f2JkGxlgs18vVYYXWbHFihlv83Ce+ekiPSYHXuNjHYNdv4NqwZegVHcEX7C9VocMT2zZ
         HChWwWqXQwoRrokeuXsOueXT9eKfEoso4m9TOGVYvUa0b1HSABp4Vy3dHtUYsJRq4o7h
         Ty0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705771; x=1795310571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=1yqbiBwN8rqnkxAvAJrStAwOlT4h/xxZibnlZRY+99zXOYuLmBZJsOaTLGsgrkow+k
         gXBbBeiH21D00+NlZ/klM41+bLMrGO9jht0dxp/H9Qnybniz0a7RTAKPzbBj63NUIsY3
         z/N6rPxB0QIyngIIwOFogm2p7fCBkV8y4OFkgye3jsOebei0zMYCYz0AP5BuOOVrEJUo
         6bnq2NraigCxUgYiZy2esDdLJEl7+OOWrq21xwZVeRV3VjfognQilWFgpCf78/lWU0j6
         QlWVeLcEk19bLHmPcNoe+M7Ev/voKQ5algoGVoWLekPnHjqFemDmFJmdm8LSFq8LcpxV
         dvdg==
X-Forwarded-Encrypted: i=1; AL+hErGeLtGmrM2NrMECTDQBJp5EQsTXFpe2NKvtSt6MufTqFXGRDl5IuPpemTyOmvguCdZWCvdLdxcNcU3uhow=@vger.kernel.org
X-Gm-Message-State: APuU4Z82YkFyiFOKlQku5GfKBZMFb36PPMDBCxlUQaL7csgqWZizye3N
	lGwZm6rUQ7Uoc6EF8vn/FnrZOeIu0OAbWZqdmkkNLf07FKhD8oNaQuE=
X-Gm-Gg: AYBFou2I/N1r8ojneR3sk9NYVfj7a7PLTqqJYrRwl72SN1zyTQ7baKs8vRnDtQgkV1P
	59aoaegtjb6s2P5bxDDBOsC8zfWRB3R7KsKdpSls3E4YemIcZa5F/0Y/V1CT+Tib/LCL4kXLs5Y
	ScmJ2KMMHbrOO45hg7etbj4eYsWDkyfD1rCycwPmyi3heuxjvkFH7p8TbVb+mA8BYKU9mrVD4cS
	0iYlcIIBL+1mQDA7BsE8WHxfddjHwA6g0EWULKU39NXLIhK3TtGYJEx5ecaQ8yCw5TCIQ6XqJA5
	7dGBb+y7Ljz3bQiWJetN6MXTtaUK+JJGVtP96WYOt6xd2auNwkUEdaprvn76P2nQ6886dSQp+Ej
	x6ze0oR8/AyqQLFyfpw4ueX+AXH8SSOr8+GYMn9VcZBAWKExwFkY576NqDOVjKjo+OQ0a3UJjHK
	z6FkLKQBxW8bnGw41xG+Rd1lE2dtJ+O3z9TvqBAedwF+o1eNBaRG9uSTi9rOBqRlp+1iw4nQ9oo
	UH2JohrD4ViTRWF47xYFo7cpC6ILO0kDkkVssED8xfPf1Vuv9xMrrPzZUUYgj2Er/7znDpjn50I
	QBL8YqKJZs2OJyBKapg8UaG3mExNuRYbOvH/57yvSfOFamHCIgcqDTCLR0vYDhLRO+8htH+iYMx
	HPrEFgASrwWT3jir6/Vtg5dzy
X-Received: by 2002:a05:6402:849:b0:6b7:c9d4:6b96 with SMTP id 4fb4d7f45d1cf-6b7c9d47044mr4130497a12.8.1794705771576;
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c6a5924bsm2636697a12.18.2026.11.14.17.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: val@packett.cool
Cc: marc.lainez@gmail.com,
	luca.weiss@fairphone.com,
	barnabas.czeman@mainlining.org,
	danila@jiaxyga.com,
	sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add driver for Qualcomm QGauge (qcom_qg) fuel gauge
Date: Sun, 15 Nov 2026 02:22:47 +0100
Message-ID: <20261115012247.621144-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Val,

On Thu, 12 Nov 2026 14:07:26 -0300, Val Packett wrote:
> This series adds a driver for the "qgauge" battery fuel gauge
> present in Qualcomm PMICs like PMI632, PM6150, PM7250B, PM2250.
> The PMI632 is used in SDM632, SM6115/SM4250, SM6125 based phones.

I tried v1 on an SM6125 phone, a Xiaomi Mi A3 (sm6125-xiaomi-laurel-sprout,
PMI632), on top of next-20261113. Board side: the node enabled with
monitored-battery (simple-battery with the OCV table from the stock
profile), io-channels = <&pmi632_adc ADC5_BAT_THERM_100K_PU> as
"batt-therm" and power-supplies = <&pmi632_typec>.

It probes without any kernel log output and reports sane values:

  capacity            66
  voltage_now         3979548   (vbat_sns from the ADC: 3.98 V)
  voltage_avg         3979937
  current_now         -72631
  temp                297       (SoC TSENS zones: 29-30 C)
  charge_full         4048000   (design 4030000, so the SDAM read works)
  health              Good
  status              Charging

Two things I noticed:

- voltage_ocv returns -ENODATA ("No data available") while capacity is
  reported at the same time. Is that intended, e.g. the PON OCV being
  used for capacity but not exposed?

- status is derived only from power_supply_am_i_supplied(), so it says
  Charging whenever USB is connected. On my phone the charger float
  voltage is limited to 3.96 V with a local patch and the battery sits at
  3.98 V, so current_now stays at about -70 mA (discharging) while status
  reads Charging. I would expect the same once a battery is full. Would
  it make sense to report Not charging / Full based on the current?

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # sm6125-xiaomi-laurel-sprout

Happy to test v2 as well.

Thanks,
Majid
