Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005046;
	b=BiqYeEQccBek9mJtirZwxmGP43ARDc1Mg7lFWZlzulHux0YdbGsX2+mnl63PYyI+4Kl7
	 aQIGCoZKXlnmihf+l5D8lr+/cJfinWH9l/4awvmsH9SJCQOQtG/cqBP6mqoIsfmd5WxY6
	 PW84I2vl4fOUchL4bW5+ZvIpyD0Gqd3ZlSg7eDnPNKQuh30mG/KMdENduUpM3wP08ASzM
	 PU7xv+EeEKa2c2zCGk8tUL8AmOqnxvojYmUiwNXz6bvANCHFM/bqGOllzB1rKU0Y324mG
	 RybOIKmZ3nJDJp7wgGQo49+ggWaCcC1tmd7Xx/7hdPsVUU0Ht5Z62aWL5oD+P/tt7Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
	b=4Fwndh4rr5A9T4sa/cRcUlKxNRiUqX4eOqbz0pHza9HoujDJ58HEN7HxnNybcLk7vSuI
	 3qs25qBwKDhNioLLmudzEmQKzKDAHTV6+Fu06IlCZBV5XqSMsCu8xXpnfIlndxciD70HK
	 mkThcE4eh+NdJcR/9OVxZjrCvDXtklqfjMZxekn/x1QVxfnTg/hsvomZIrFX1kM6L/mBD
	 uU+gdUJ4Az+3ilCqrtoAfw96Bu0D0owgVlPRHAsftcpM08c4EpUJmsP5rKVqVgp3q0Ohc
	 BeGxW/cKnZJsScyqE43Aqs+Ur39iF1EcgZtfOxrVcsQ1AKl2+iGtsuEFQOKp2yXCuzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nBILM34N;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nBILM34N
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso20665075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793005043; x=1793609843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=nBILM34N+DQmcQaiOwhhjAIBvLE1X8GiwMvy8mC6GThNPWRS1nnLAFrtY3hnyPSVNE
         Iw1wUC/FrAKhdk2E9Rv+/IZ3Uc/lKsrmo5Mo8o81Pcp3wYgTBWsY/iK1KyOY8+ku68Gr
         tlMyY4cGuHGGSdUUxuJ7RZ3eZanC3KZDVNtmShz+O6nzvpD7y+1eqGYHNXl0RPRK9FO5
         U1h5UehATB6b4SpLQbkpIAIfNmrGn2Y81XswDvMZerQClesyMtP3EptTEVYYe/0a2oLo
         PM/pYmxmaKVN2IGHCumdecvCMaF1hsrQQpghaWKBGPX5Aozb9IqHi1j1Ihl8WKCh6LDx
         cEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005043; x=1793609843;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=fnqpHde++5dvYjhYf+f5szIgYI1Zvi/p2eEGsm9YZ9G69yGpPVQyS40oz+8TXI36h5
         ctzlB2Ftg8NKHSmJWW2eDpn/LS6OIG5tZuMZ7q7DQhKgEWiVs0BPFOBlL2xbZNrtSeBG
         A6XZNGLqFOX2bx3LFAPBvyHHyANXt+2Q7yGMuvieQKA86PTOdKJ02jihSBOA+/yBNia0
         ymMznOpXhg76vfmqeGW54fJqbWEvi5sX2OjTxvhGmOJrd39GWphX0gKB6JPxr5tJIIx/
         WYcc24KFzlA6dPVVzhQF4RL8eReShVMTgZ8rjAlos912P4rCVdujOtT4eYaMEH1TctNh
         JWdw==
X-Forwarded-Encrypted: i=1; AKwUvBx2PXuDgi5C9fy2RgzTBhwJWO5tBLzkV/uQwcf5cOXZTyLcZ7ee25XQk+RFg4Y/T/oLz1kAV7Gz9kmm9UA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVJe/ToLH/J3jteQVRxExP516zSUuv/DBliMxvkk9XKfYAMB/K
	7HSl5ckXbBco8Uj/XIp4WveFjCuzJAUmxbtUGaQXjc5ZUSc5juYCwNbjHR5coZ1vdN4=
X-Gm-Gg: AYBFou2JLCMKqp8ciuOICkwVAuE2y/X2gnMdEpEIAFRJYjVvQCSZJruc9AsZb9u8HfT
	HHmRdSENTgH6hizrhlHPbsX354RrveWpl3dQhmZFhuNzOmeb65VOSjScKlz8ppxmgdLaI54Zh/L
	l60GPPLRWXuy9WpZXDGCHtJdBBfMWleIi1KpGlrQS7hQ27rQ00fUB/H3uIsvBXL8hEsohS+ORCv
	j05QHflyxAE+7xoT956cYQzjoUiMDYmh50HS43/xXEYchihXGjfZ3wbh7zx+N9fwNeorKAgOBPN
	goqpawVqZqcB3EdRH0tgIvWOmB/BR3jHOjrr/uuiD04Utgu+jy9vGPw97h3b6wJQhCa7Z+8+fQV
	wpHLNzz82oKqid/s5NVqr+2g4qPhx6AuAMQZiBQIPl1mWYd2GH1O75zRXjBk451hi9tDBjzi3+X
	BDgf0+K7EGQz+RHkp5cKi72+XYQV+FzqKEtCm4HHVTb8XNJhgoPi/DOzCMfcgbJwIc6SpMsQFvX
	xU7/HMZWCmjBiqtsf4LQKfNjMROFtmfDb9TBPqyaiFO+GwFPYG4VV3IHM3I0vctc3LlWFwMmgE=
X-Received: by 2002:a05:600c:3b25:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a35ac9f1ecmr118305925e9.19.1793005043279;
        Mon, 26 Oct 2026 01:57:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm187484365e9.15.2026.10.26.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:57:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4?=
 =?utf-8?B?bA==?=
 <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
Date: Mon, 26 Oct 2026 09:57:22 +0100
Message-ID: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
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
Content-Transfer-Encoding: quoted-printable

On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
>> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>>=20
>> Every S4 speed bin runs the same CPU frequencies but needs its own
>> voltage curve, and the bin can only be read through the secure monitor.
>>=20
>> Read the bin from the firmware, select the matching
>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
>> on the SoC compatible and needs no node of its own, and S4 is added to
>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
>> the bin has been applied.
>>=20
>> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.d=
e>
>> ---
>>  MAINTAINERS                          |   1 +
>>  drivers/cpufreq/Kconfig.arm          |  14 ++
>>  drivers/cpufreq/Makefile             |   1 +
>>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>  5 files changed, 202 insertions(+)
>>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>
> Is it safe to apply just this one ? I can take this via the PM tree then.

I would advise to wait a little for Amlogic to chime in.

Patch 2 is something I already rejected back when S4 support was
initially introduced. I suppose AI just unearthed it and did not bother
to mention it.

Amlogic was supposed to migrate to SCMI at that point, and possibly
handle CPU frequency scaling through the secure fw entirely.

They did on later SoCs, I don't know where their FW stands on the S4.

>
> --=20
> viresh

--=20
Jerome
