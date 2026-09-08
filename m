Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B066576EA8;
	Tue,  8 Sep 2026 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883469; cv=none; b=Rco4XSTTPzabrkCY2QOECXRdHp+d0Ep4JxSH0Hh0LCzDxdCpTSsB1jsO/ZhmdJDT/mdQ5vkiMPL4qgtZELwC33u09Lno8WM5LYQoCHHnbwF5DPy+Q6Rr+5RRBNEUkuYs+1+jvW68rQr9G1uA3E5DCfrjfhX4BxSYjlAf/LExn4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883469; c=relaxed/simple;
	bh=ZklINIGdqQH8GrDGYUn9b0Zuk3laMH2xgV5+Sg6qzoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2/YbmWsd6lhqHXh3HnzfgmrtDogVemHXHBzuiLwtgnVT3DyK5laNMcGJKOnwOrEkxt4Lq1LnYg6KkAQftDbhD4PvvhJqyycOGiDuKVYzfP96rvnwqqfAdzVPQuujmS9Z70b7Wjjb6tDAuyJRI9bKzCax4CdjCiqqHRR60jKC6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com; spf=pass smtp.mailfrom=dawidwrobel.com; dkim=pass (2048-bit key) header.d=dawidwrobel.com header.i=@dawidwrobel.com header.b=gKmhUhza; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dawidwrobel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dawidwrobel.com header.i=@dawidwrobel.com header.b="gKmhUhza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dawidwrobel.com;
	s=protonmail2; t=1788883448; x=1789142648;
	bh=ZklINIGdqQH8GrDGYUn9b0Zuk3laMH2xgV5+Sg6qzoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gKmhUhzauMbA7JQgu27gRNlnQOeTP3+hC4OdjaAmWHh9e4RgKANgXUnjIxPEmVuFJ
	 7ij4iEldTMfDKckH4RgVoCWXGcr3m6h5uIcpPmfhuFYlJJgGSbEI/nifImuAwRDqpg
	 Tm9vOjBH3ZP8HwrTzelhE8edPefV5NByF08QDp3DhX0xgauuzsMO3/GB4tk/06dizL
	 XjBjafmsrvQe+t6zNVHJFclOM0rmiHSU9Y4oXRY/nk1shA0nukWLjydkEicMyUH6z7
	 56CAooONG53zoV2VHiMqxBYGEqpDIRfl6PZ6arfpibEgLOvkIzAy8q0lBndFrRxlxn
	 At/tmTJV5rO0Q==
Date: Tue, 08 Sep 2026 16:04:03 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Jianhua Lu <lujianhua000@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Dawid Wrobel <me@dawidwrobel.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8250: add device tree for the Xiaomi Mi Pad 5 Pro 5G
Message-ID: <dc0759da-5783-4800-bdf1-9ddca0f2c851@dawidwrobel.com>
In-Reply-To: <1cdfb3e1-8a89-4b52-a5db-0359a9f68878@oss.qualcomm.com>
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com> <20260730-sm8250-xiaomi-enuma-v1-4-ed6d8fb99668@dawidwrobel.com> <1cdfb3e1-8a89-4b52-a5db-0359a9f68878@oss.qualcomm.com>
Feedback-ID: 173987960:user:proton
X-Pm-Message-ID: d5af8631e3ab773a6de51e94154d2b5224022f93
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.08.2026 12:48, Konrad Dybcio wrote:

>> + * Copyright (c) 2025 Dawid Wr=C3=B3bel <me@dawidwrobel.com>
>=20
> Happy new year!

Hah, indeed!
>> +=09status =3D "okay";
>=20
> ultra nit: \n before status is preferred

Thank you for the review. Both fixed in v3, which I just sent out:
https://lore.kernel.org/r/20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@da=
widwrobel.com

Note that v2 had been on the list for two weeks when you reviewed this
one, so it may have slipped past you. It folds the WiFi-label patch into
this one per Krzysztof's feedback. I *did* carry your Reviewed-by onto
the v3 patch, though =E2=80=94 let me know if you'd rather take another loo=
k on
that fold.

--=20
With Kind Regards,
Dawid Wrobel


