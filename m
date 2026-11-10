Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794335954;
	b=rVD3rUZFtxhs7WSCjKV0O4smehW2/bLWWNB031oeDZOwBswRSeImeWqMFV6Q9KWZtg7p
	 KUBdJ83jhj4rqhZ7loyNBD9bae3RQ+V2HHRQseE/2UveggSo35132p/y8t4BL2xZ4al6p
	 M6SziG1yhrXzJO1Rx8tuLq9M13YfCwRzsh01WkkQ67ojkXs5va1gT2tllkdieDegblGWu
	 NbaMWb9VE5j0vBeQSBTL7j2D4ZCWU3CX6rAfv1C9LPvQhbeY/D6y+6Varo+0YBKj53xNd
	 SQTaxoaSvfd6MVRcDHUU1foJDsTB0abs7JiBXFsg7bRM4ibgO8LB76RdiR0BvFJ58Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
	b=NNVZ2TWrKtN7ehbPF9cD2gAqNxMyzaaSkfMeEAC0zJ/fzl5nwXipry/vG49Htij+8LGt
	 ud9I+B09Hm0drYVYWFnb93jBbLp/d7Am78sCjTgg/vkZXKfpznFOTNDcEPge/m4ZJ02Yo
	 cHd6WTa0nKF+mwWpKrGlRZYSYBfjTm9u19UfTw2viH866xoeXBAtnE8wE+dYbnc1OuVBF
	 XQS8ypuDSMtsfZLYSKRP/k0eItXApdUqO2m6gsLD+467/M9iWzfg6lRSWeNJWk4XwGeS8
	 Z/ZJ+1loYuXtOdVeYLxBKwc6/VA8g2aXyyDkZC2rAmwjrat/FMyExJgqjWJHcP3FLAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZK+++rZl;
	arc=fail smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCFD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZK+++rZl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso22984351fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335952; cv=none;
        d=google.com; s=arc-20260327;
        b=Wbkw+aXcCBbZiIkJ5dTZ/WPU7vv+wJUTFUjhNgb0IAYgJnYPYZEAIWmb3sUsJWEmfT
         dF1E7zCyyRAlsIwrtDqTPgG4FSQ0iykppHL9utkFaJHy0y4wvWpjpk+r+E5+wSdBj4Gi
         ZPmigijTWjMXEan8ZlrWDGkKRuM9HelTSMjIrnzm9EiqeOqtCyVxx9RRklDmnmADepbB
         gObci+4S57Q9sovGy96heUooPCXj0hcGvHwbJVLXcWKSWnr7IrSmwqBRiBuXtyhy4d90
         dAAYYAH7h3raPtvcLlejh2/6syd8KkoV+C/3+549ydhpfqxGfy1l/Vrq+DBADvIJC00Y
         7brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        fh=cKvNz6kqgTJTV6ZEh+tU7OzgKj8rWaPtzbkcWYqZK1Y=;
        b=CKxqZBS+TpnMwYWYzW+QeCbZ+Oz1l+RuqUuuTQVn8rdxGl47LcBMELHLuTlGvZH3Cw
         OGd/8kJOgJUoLrvMEguihKXbhevfGoK+DOnyD5+M8NYrAM/AfJkNnJqRcUZw/1ztlD/Z
         oWQuDtRqnTLDub6SlUmTkR8ZSf+J3QDsKRNPChnDyyTd14iu4LVQYsOztD9OQ/Le82dk
         AIH3vyqvbPlv+scnha0+0gJUuHs2fegDNvhrmFeXPHD4cLGvH54TeqKNpKLKQP2wIIp5
         eDmilZFxCyLefmokzFgRw46U5w4NO45F9nulUa56HB6L1eitLRYDhXvjTWWjcBIXvvrB
         EcAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335952; x=1794940752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=ZK+++rZlDpL8nJx/vrqs2LmHOH1By/P/mzHLEUh8O8wjnJtLXEQtQuZj3zWwE6PclG
         4lIV/AOheJPvT2VHdGF7q+mpTiZoI222lEGXjhUZOe8i6dT9dMM16YILK8zSaNgeeQPZ
         AtOYN+PMz/1lSc5iHIL+Y2xi1aM+dM4BqDjlsXcBbVxgvJPIiBkMCOtFTaxirllohYVq
         jaKz7qIHYnqKLY2Rx11Diq7ErC+TxqMHCE91QeWGT7UayAN49ON1zol4e8fZlANsQNhn
         DcM41EUnh17e0HEEgIeRacLpvhJuBsWV05JodBw276Y1m/40YIKW2nBKpF26Vj02DXId
         /b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335952; x=1794940752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmEY1Uike6JX8cO3a6s3fXhYo6n5w8yRovxQQfIWojQ=;
        b=Mx0kxlocTvvY6/AckLY5nZVRGqMkATzYAXqWZGZDW9zL3dmXJRMULEddfEaMNQaAyv
         qY3aFOMlzvuISoeThTpzeHp/Vy6KvbHjV6vGfcariemrrp83cwES4kjtPmHK6Qdaf1aj
         7NAaiQz/6OynUePfQSKzfnlNq9Yag97YmBVpK6Q5xbStDRAcaHduNosBR9sKjRnrbjrc
         1YWvrsIrLffzWjO81OWP5D6xZ+WL9LiIYAlAJYcrKv2YYUFTFxI6XE/c3vTwOb0OVl11
         qc2p3E//ogdlNXplygV/H4bES81sFrJS7KwRhgODyuhcnX72pLOKH7YD2MjF2x+JtgnZ
         vKbA==
X-Forwarded-Encrypted: i=1; AL+hErGklSav4rqXGEXUozV6WLpUxEwoeIn23n2IcXehZbu6isUrtpEYV4XZ/nFKHiPHnM7Sk+BZjNH8Xjcg3NY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PiFK+iSeDni0dQnj2Om7fznFJDxIMBC0+oWpzDxGGGq0Q8Uon
	A3ZHGiz6LsGuahvvoBDqUszDXMcODlUO1I5vxLJqjG5lhZsbdM81gdIFg39PmsgzVNAxFYMo4pK
	8zVK0E/apFsK7q0b8RRy9GtIxV9NVh5w=
X-Gm-Gg: AYBFou0WbkbmR+zbSE/b/nWI5pWqZYrYfX2nesT5TWMfn9o2p4qBxo7Die7QSwNhAMe
	RpDvHfmkYn9+ArLoM8tDQz3QDzK/uqdOwhuyoDPeDE+O+2oK31HSdjsmH+KIB30HuEukLcFO+op
	OhaWRdlyno/UY0y9PkrLLk6gjiUplBDi3BPzyDfXrMy8x0v2cgT4Zlt6vpuEPBA2vFeoflZMWjM
	+1LrQHOnafwsU9JBMOHYUSZCC4+e7l18+DDmkALPKI5vWPf4RH2XIeS//qvaEMsCO4PRaWaLVl+
	7FIda75QM5ezKY1m6dZY/KZTdrCAO0gQK098qUFa+/GRmbf0VERF/jjoOYAaHUorEJHBYGC5REL
	Tl2HwRY2KhJ+pEBUrwk9r8G2gmbHH8GCDayqg+WuUw3nhqWZThXT6yzMASLNc7QHASddnkndB2f
	UVCRIxjlgejOCuSCB9GGneHqe5l1bWgmxu3Hjbj2wBQR0dhQ38
X-Received: by 2002:a05:651c:b12:b0:3ad:de02:e9a8 with SMTP id
 38308e7fff4ca-3ae0967065cmr7621621fa.18.1794335952183; Tue, 10 Nov 2026
 10:39:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794334398.git.stefano.r@variscite.com> <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
In-Reply-To: <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:39:00 -0300
X-Gm-Features: AclHuK-Z_-LDXVn1T9DAos8gp7iZX9KtLfARNWk7UgbNlE7ndGND8A4QqRcbfD0
Message-ID: <CAOMZO5AuK9coQ5m3h7s3teW-jrX6a268aLSsgVbt2cbndGVSbA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8mp-var-smarc: Add support for
 Variscite Echo board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Tue, Nov 10, 2026 at 3:21=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       ft5x06_ts: touchscreen@38 {

The ft5x06_ts label is unused. Should it be removed?

> +/* Header */
> +&uart1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_uart1>;

Shouldn't you pass uart-has-rtscts, as both RTS and CTS lines are
described in pinctrl_uart1?
