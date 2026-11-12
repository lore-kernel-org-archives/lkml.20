Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448609;
	b=bI59p9DJUA97cGcS/PUlw5tof2WO/yLQPNk7ZUNfIrG57IrHq2UEN43jmIrooS9xhsj0
	 1pZ9+/3jrPhP+KMTN/1OtVu/LYChdBK5mT3+FfVoFSyT5uD0tJVhGymVwQ/KETEXpNSBQ
	 D/uWrQVIQjJLC2aJnDsCPI2s6XcIoHYLEXOlPRrbgTFrLXMp1vi/g2EEysri461nAu+Vn
	 mnd3gmVeAyeQn5nXNfSfG8JqnFylpneTdGJi2dshQl6epWyitqNBmsoEUiR8BErd8XAPV
	 y9aT0lx4MhiFPu35X7WdC60z1NAd8R/CjiJflHpbXgC8TninUkFE/nf1ccqGV8nfWUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gPT6TS9j605VglnGPiOuyPIG9vvgHc+cnJP2+2bHGmo=;
	b=Uqta1PJvdypdqoLVxwmwe/hB7q7dqWJ1KMiOuAHolX00KmnzcDWt0nQEVQqVZueks6dO
	 eEJaYs6spNj6qFnpFKoBxqUY+EmQE8U0siwof6pURalgdcFmEJzNvAT9S2hEKF42rX/Yk
	 Z4WxWjMSAY0U7Uz0zRigcZd0z9jBuOUnTIeQBZ+ThUtfH8NHDIHsu8AQY5ND1dq4bEF3F
	 smi2VwYMlEHjJmdfFG80NxDVf/u+8qpPwiSXpVYXQ4OoXpIktssls2sK5VGUZkOX94vkq
	 i8tuTTUYX0ci74eAtWNaj0DbUs5USvUvAD6IICG63juKnek4bTKI6Hnvc1i7QPTS5Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a58PRzpa;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79F606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E79F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a58PRzpa
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37600b0db49so359885eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448608; x=1795053408; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPT6TS9j605VglnGPiOuyPIG9vvgHc+cnJP2+2bHGmo=;
        b=a58PRzpahy8j9d1V9rko3LsARltx5Z7rj9JFjoNVm9dMGHRHjmNvF+YTZHf7EO5hfN
         uGQqY3W8u+Nb0OpnFdml/NsYlSG+IJi0G7W3+H91dsBUVQKcOr8bcGHGgiUCrgDUTpXq
         qsdiXL4+/vccbduOm+TahFvS/+e0qvusP8WpCjes98GyQkt6NPE/HbeOpD4f0JRfLC+8
         Yv//zMPFAx0PH0LHGVYQnMclpGmXUwD5oOoh2QPxpfF9RnB6OI/MlJ5omrICa4tEC0Kk
         5Ot7HAY5pNonp6oXTy6UrYRqctzK810u7R51Feu2ODIVCa9GxByGCSubTjDKsOMtbFo9
         qEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448608; x=1795053408;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPT6TS9j605VglnGPiOuyPIG9vvgHc+cnJP2+2bHGmo=;
        b=1foEq36YwTde5tqzr2H3Iy6JsWlwFO2TLvVCGydBv9cHCCVQQqQ5rb06c0IS/wGFWl
         G+bsbKEtSL8T5kkeAK+pD06bg2YqD4eJji+CqUQHtb0zKp4uP1DcMbmQNQ0MQD9FE3HU
         HuGBaHDUj7J9pLOATuXIchidZSCh+CyjE7273PZThSYKktn159mPu6w2ixFo+9wEDw++
         0UjrWogiD0gx2MPY/+7vN6v5gmyFf0VThp+hgEYw/9GwcS0ZZc2CcM8NScadtmMhatXz
         zNt40xRlhUSP56iYx948JuG6cHlxJ9W0G8yWOBbz0O8XCgi4ic3XpBY+xfg54ChVEWHm
         AZqg==
X-Forwarded-Encrypted: i=1; AL+hErESC5Gm8ErSAP1ivonvQBLPvMQ2cEj+V9A6NZ0ZpU+MnRXNwXmmw4eeE8Z+gntnenAOW/FQx8Sx8zWgeyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hxn0DzLGquPjyzy0UJnEqZkzrPOaAk0lgvGylv7/9WErH5HEW
	mn2jgu/hSU/NxuIM4dM3v6tNOR1z3z3II8/isQaHCybOdMnukHkeNRKB
X-Gm-Gg: AYBFou3uFj72go0FJdW9NRYPkm5vNLR84uX+aijXyjhXPG4z7m0e976vczZQDjcdwyb
	5RMr34sOzSJiwCVLSdlvNosLX4D1I50MnK6uiHgWFfSDlwxXz0lv9cy0IALsNJ7zfwNfyEAnFCK
	jqaQ21EITAcWTokq9elmNShoVH2MmeIZ24lHWmrzl0IdZ6sJxNM/yo4Khjyf5q2M8uf4duoIJC8
	gpDzm2b8fAOpg98NAE/PEr3wjyIx/ziIT85nDDFLmPRroOSZunYNSrDYA0IgXNjQB3C+qTLEjOV
	V8CIaG7/0jozwHHao4flp2XEXEsmlPAvebXQ7wTjb4xQ8nLxPGaHw/8eELKH7urH/JaHbg05A5F
	Z04Uintmsgk004nHbXus1VpevJBNl+lRIZNK4p4cJ6w6srYOkVSGxgvQTfMxHcZxhanJxuY/gVb
	wxocxqMZKONi7Al71jwnFSdkImaUuru9ZGgjAKWVwzneBrxqrU6lfDWRNmz4c+BtR2p9zxpLjoR
	XRkEjtSzQsaOp8OA8TSjSJAyH8FVUoj1EYQBQyHylOSb21dovdqpgLEkPEjSkHsVuniGumFrFKM
	//hvyd+IG5UWBfrtDasCGwKDnQS41Bufecyteltxt/wsvZ0SF/22GLEV9zgk2lP7JkAWaa9HrF3
	5pfnSu1sS3pY49De71xF4/8hVYaahXC/T218QQlvVJa0a8w==
X-Received: by 2002:a05:701b:4194:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1b4f5eb005cmr1104575c88.17.1794448608114;
        Wed, 11 Nov 2026 17:56:48 -0800 (PST)
Received: from [127.0.1.1] ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm21032435c88.9.2026.11.11.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:56:47 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: sebastian.reichel@collabora.com
Cc: johannes.goede@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] power: supply: bq24190: stop IRQ and work before supply removal
Date: Thu, 12 Nov 2026 09:56:38 +0800
Message-ID: <20261112020000.1002.yaohan@gmail.com>
In-Reply-To: <avEajWe1iAH-Trhr@venus>
References:
 <179378567491.72692.9015711605062239156@gmail.com> <avEajWe1iAH-Trhr@venus>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Sebastian,

Thanks for the suggestion. I see what you mean about fixing the resource life=
time from the probe side rather than manually freeing the managed IRQ in remo=
ve.

I'll rework the power supply registration and runtime PM cleanup so the resou=
rces are released in the right order. I'll also check the delayed work path a=
nd the probe error cases before posting v2.

Thanks,
Yaohan
