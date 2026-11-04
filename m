Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798779;
	b=sWpdM4xlb2M88yksfVYI2DxII9/DTnaT1hjCnpjYOF/ieCZyaWVYliZTiH9thvfecVxi
	 vVZOsVcR8JOwNAOOqokslYLu2SZYcRDDoBlResJHfTPA+kBvUBiD9SX/7+3uXUXPBfUbG
	 hxSlcPecSsT8JpQSGc/ZajkBlYcmWnfgI3MG8Nne7tx7JFlHiv6gL/WEgit0DWEdkMz1B
	 CSK5o7ySo2N69yaGz3o6X9vH6o4MHeHR7E1FM6EKAxddGXLfGzz4znzpR2HKjNFUnpHwZ
	 XQn7DjQo/c2idvnuR85q0VjKfshJqvTh2S4GOF2hwo6hFnGqeLXMjOuI2fFC2VM5MHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798779;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TP+uy8U+BoHk6m91wbN8oDBqNKswR9Rez4P1JHA2FlE=;
	b=vhq4RF9m6eQEHe4b3Z2l07+wUcNrZAmUTRTx7yNKfnx1NmPGDG7uvBxFqTAQTDH0sRR/
	 t1G3X5SLz9Jck7yH8g7KNrhNX/UjnphFHSk3gX4OCG67Vq623ufdGcNrMSVmOkDQdFdj7
	 J5Al56RGiYzGfTUCL0CuWvPQt1NbsI9LvS7/6CaJ4Kh3cfS5be/TzvnI6UJs3l2lnAj8i
	 1bthdpLDmT2UFQmMrjYFOlEapBhaUlrl2oVWWC7oRzjUtwLfmj3eVVx6JKdfZDKs2xOA9
	 w7b++N1eEj5KWhIWTWFte8bjI0qwTHR7cGmoVJZJpuYBLpkWI2oMAczYkc4V0pW71Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXKUXtV+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE87606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXKUXtV+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993EA1F00A17
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798778;
	bh=TP+uy8U+BoHk6m91wbN8oDBqNKswR9Rez4P1JHA2FlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MXKUXtV+2kBALAGhXjlScCQ7lz12DrKspvJFN4o0JSebDs3WhkLqjSO6R4I5Xn8Md
	 aTvkYUcBklFsUF9tL5HjPVhynLtMaNDp4xDmIPC1djTftgpqevJOx5Igz5XdHl5ry2
	 /RYB2a/2OcAmBxQwC3B69yhB68l6dgzBjC0xLv+pRkTNCx90rUNTIqa9PVXz14xIDJ
	 YfYPimPNAJl/xG8COmq4aqEW7DDjJ2YHrDpJWxxZkjUZ57lghXX0YZhMEsOG5rt25F
	 TCUj10k+WpidXyjNIrgcFLPn6nrFqlHtYhAv46HGkVuki2Zw7ZN/7l0R5aW1KYEM0v
	 tB67QcxWKLqXQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso417695e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy6ZEF8ajHVOrqx+uTiSMMI4Kw2qzGSElxB5ij3lND5UDRVmCWsCpX/CwTefC/RMMhNQJii1/zP5q5PoAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YciqEcrzMSplz1n6bX1Y0RLsYWwLLAb+n+nvqisJMXDrZNd+o
	uP2pPA7uvkRCVzvjQfhKwsfYvCJCuVj5Cf944WsFgt0jmbf40BU7eKJo4hSalkzsVWwSDKwEhbM
	Gzw1ViB/tNTfDEpTnfkvmqy4+leSC2L4=
X-Received: by 2002:ac2:4e11:0:b0:5bf:b952:e57f with SMTP id
 2adb3069b0e04-5bfd9576f92mr5749815e87.59.1793798777361; Wed, 04 Nov 2026
 05:26:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023115652.700765-1-ansuelsmth@gmail.com> <20261023115652.700765-2-ansuelsmth@gmail.com>
In-Reply-To: <20261023115652.700765-2-ansuelsmth@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:26:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmZHskQet0TtY=zp993B-z2bnQubCHXsMNk6d-AUZbUEA@mail.gmail.com>
X-Gm-Features: AclHuK92QR6RS6JYlLXEO0knuwKdn91VeGZ-EOJ44t8yL3U3eoA4ndZiquqIhz8
Message-ID: <CAD++jLmZHskQet0TtY=zp993B-z2bnQubCHXsMNk6d-AUZbUEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: 74x164: add support for 74lv164 shift register variant
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:57=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:

> Add compatible and spi define to support 74lv164 shift register variant.
> These work the same way as the 59x chip family with the only difference o=
f
> not having a "storage" feature by directly changing the outputs as bits a=
re
> shifted in without having to toggle extra pins.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
