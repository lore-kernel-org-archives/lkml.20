Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657096;
	b=CcUeJbT/H+qV6+4ID6arD5v5wFLhvhmZnDQvEj03E4kQ/DMKIKvVzHrQHPAvs0A263tW
	 ROWkYN1ox7pPNnDCOiKBVywp+hemLIgHvoRTR7c88GN905EfvmCWHJ8Ap2FDMNL3pieV0
	 zZFWs6iw2oCJFIOVqZnv1OfIT2A0iF9gSe1NsV8J/m73fBDk9gj8T2Ng9wG65/3I0v0cL
	 9wC2PfogJlweIa5DJFpBn8BD0nE6e676kYhOQGkelRqBSVpL0U7EvbUQ001GQEihhKpie
	 7uq8Fz9ieT/5I4fEp+g0sMuxbXHe+8SJFfYLPAG8PpTmePuIRSWs/cq9hUFEp6AHuRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657096;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rUheGWlZY0Fw99KiB4LeUAfu/tl33Y1wkijZEqrb6QE=;
	b=j2zYXOKyLetAyLOQYvspgBPUCzaAgFE41xlzVT8qOspScVgZfYSZKx5nKl/Afn98AETP
	 mZLpf6mzQ2okIjphieDhC/5+9zWAkn4pbV/mObInXMh06XdKoP/LDJs538X0kW1rD0qIk
	 wFcKMDidc2VK6cMpFad7HDupdM23eXnKryZj3YROoxyHeKfxkxNtqGcXv3Ff2Em559T7o
	 hpbt37qLSjIS6UhUHLL/Aj+QI3s2gGjQMaT+RetR3wBcvEYUrFXge/iYHq6WegSE0mi9Y
	 HgX/1AljVB0saheXHcW5Qks0qdjyqxc68Jh1kJvk36tSTEQrI24OFfOgTWe+dIlS5oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=GF0+vU36;
	arc=none smtp.remote-ip=109.224.244.28
Received: from mail-24428.protonmail.ch (mail-24428.protonmail.ch [109.224.244.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E8606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=GF0+vU36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793657093; x=1793916293;
	bh=rUheGWlZY0Fw99KiB4LeUAfu/tl33Y1wkijZEqrb6QE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GF0+vU36Cy5INsapQ9jEPsZ+LKrAn+Dljr84EryO7IzlckW6ZbUcTr304IS2Switg
	 qJ2yex/DQ6gdEMX2QcwX2GU1dj4G2xMBsRjQbc7YloQDlQ6bPSDX4ARf4+LKSOdN2A
	 OUwROGQxWeqrEfBOlG0VvMJLOvHZBPOPEI15KkYKTtWXN88Gs9ZtRZIjnL11KXwWQG
	 uTJmZ9vQHVqbYIlftPZRe7p2Hku7tLt/+Lffe2DiOc01qlDyt2+a6N6kazgLr4uKR4
	 clv7GX0bToQQxlYXsQ4GZ8+8RTo6DSM4AYR9Dslpip7VAVzqNuvP7tMujmBiG4FhRy
	 pP20K++uMRriA==
Date: Mon, 02 Nov 2026 22:04:48 +0000
To: armandas.kvietkus@proton.me
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] media: i2c: Samsung S5K3T2 image sensor
Message-ID: <XCb3u-2QvpbqsiIpiU4KXIVLSRrhUMk66AuWzyq-g_87b4PYck2zK1bM_jV0Jk3j2qVqbLqsnmXoSv1pWZ-eA3vC1sX87APNMyZoC2xS_vM=@proton.me>
In-Reply-To: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
References: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: d7cdf3858a387bc88c297cd533e2a85d5c875641
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

Hi Sakari,

Gentle ping on this series now that v7.4-rc1 is out.

v4 has all your v3 comments and Elgin's. The binding has Conor's ack.

One question from v3 is still open. Should LINK_FREQ stay read only
and follow the mode, like imx258 and ov08x40, or should it be writable
with the modes filtered per frequency, like ov64a40? v4 keeps it read
only. I can change it in v5 if you want the other way.

Thanks,
Armandas

