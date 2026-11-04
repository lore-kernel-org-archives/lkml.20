Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787983;
	b=hmxX4D44yQLHoL5kANKnG+KohOvKDcvJh0UxH8rE2ON4jPUUU8wvN08ufXLKO4hKdtAs
	 EJYk+ZzhniuocGA130P3ST2m2HRy6bu4SrgtgEtFVc43fbnlM8noiCMmYsLtahTI5Ibtr
	 K7JknQU8OJVq7qeti0YWToYGYqYHTwKl+bvUTOtGDU6KdUCyLjTWNaZcoswBiwIZfwulu
	 E/2q0aBXjQlejLbPKp10YnEFW3VkAKBzZE/eqJU36Jzsje5jZubMI1UP4Cn0VtYJggYy1
	 n5yH052rmaZ2VkzC5jmlCJFYp3cEZVHfW4EkaTi6cqBWmHD5/KlvYpH3Gz4ZcHi2F6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787983;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xpSwd7lBoXLBxqdtt9iF2X+1DgDbMbdN1MoJiHh2RAs=;
	b=JjZL42tkPiHC6/VzRvYU4/ps/FdisOiMfy5PXgzgqO2Dm3zrwgdZQyXrLtmDArZswqfL
	 4OwyctdDCi9FPx2YfCqJuS/u0LsKVYHa7CDo1MEby4vOenoLM1Zdz5E9slkQBTnFnsy8s
	 /XhupkX6u30F970S0HvZRy1utoDeeSAP5HB9NIwqC4Yvte6SoJQs/YS8iDr8nVWZ/k0+e
	 ki47mqxkC7dvYQMoBLphS5IfvPwBKAlAKc8x9u3SekIbvJw+72mJnz6iECEIED0rHpILy
	 KrB3pZ1HFD2OOaX7YBU3ROKqp9ah7jvnfyI3AAjzbfaGCSIBt/BWURPgnJLkDDGjlfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=PMEsm1KM;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=11lVuZbF;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4512606A326;
	Wed,  4 Nov 2026 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4512606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=PMEsm1KM;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=11lVuZbF
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793787955; bh=xpSwd7lBoXLBxqdtt9iF2X+
	1DgDbMbdN1MoJiHh2RAs=; b=PMEsm1KMcVDfsfg/nhESCPakorceRufKrxwclns3df8qMml355
	OoHzlr4tdT7r1vE8SC7TygMJlZ5pDX1dD4gOz5PAVFeYlE8RlRZH/xkP2xKBER8Uk/4Lt6LlZQU
	qlzxo/d5Kyw7I6dtFwqObs32wTGJoEAmpC8pc/psTcE391N9cmKmP76xWDOU0uQO3W/J9Z2Jy/k
	Wu9I1kMWvgBrCyOzl14YaVFkv0d05prpZHzuCzoKHZmFz8EDGXzUjRJ3ybIb7S1k/NhqPIqIDk/
	koeaqzVO0C0gm7LYadovsdwgf3cWVGnbnnAug2EbsrJJhCJS/FmhCjDpJrQeSUcgZKg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793787955; bh=xpSwd7lBoXLBxqdtt9iF2X+
	1DgDbMbdN1MoJiHh2RAs=; b=11lVuZbF9EgeBigKu12rDqm9KYFLqILffQGzst5tJguAK8Hjtp
	VSIvndhmD+fh+6o0fa7j3cgJ7D4n6S6l3oCQ==;
Date: Wed, 04 Nov 2026 11:25:54 +0100
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Amir Hanip <killdeath104@gmail.com>
CC: a39skl@gmail.com, abelvesa@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, killdeath104@gmail.com,
 konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
User-Agent: Thunderbird for Android
In-Reply-To: <20261104095806.18945-1-killdeath104@gmail.com>
References: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org> <20261104095806.18945-1-killdeath104@gmail.com>
Message-ID: <CAFAE0AD-E566-4725-99A0-D0BFFAAD4F56@mainlining.org>
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



On 4 November 2026 10:58:06 CET, Amir Hanip <killdeath104@gmail=2Ecom> wro=
te:
>On Mon, 02 Nov 2026 21:11:33 +0100, Barnabas Czeman wrote:
>> I have checked it seems lemon have same adsp region like citrus=2E
>> `pil_adsp_region@53800000`
>
>Thanks for checking, Barnabas=2E Where did you see it for lemon, in a
>downstream DT or in the stock firmware?
I get it from MIUI sysfs=2E

 If lemon's stock layout also
>starts at 0x53800000, the 0x53400000/0x2600000 in the lemon DTS may
>be worth rechecking=2E
>
>I will keep the ADSP carve-out per variant in v3, since I cannot test
>lemon=2E Adam, if you can try lemon with 0x53800000/0x2200000, the node
>could move to the common dtsi in a follow-up=2E
>
>Thanks,
>Amir
