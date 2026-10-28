Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224680;
	b=47VapSP7/0/z3/Vv7yWYr1zdzbhShYP1TqsLZToiVk+dfD0d3h9xNl/u4iAPbOjitKIA
	 QEGmszwKsumW62U/DijXp1nmuVlKUU9MlEY/ZRCkghu5MTICkEV/L3henOQh+t9WtGhc7
	 MeMXrD6jkTym5JG7SG8I8Ayt5ls48QJxCUhHqRJcPm3zWKOchL/OGUtI1yalWXj43Mj4T
	 516zQhNjYx3n7VXtutMPRKUJXeQM/JdiWeGQo4EiXdaer++3ABca2r52TAS+Wm+f5wtRz
	 YePUZ9Pjz7GcrTvbvSXj9T4zLzSxZGaLKF/+ipkLCzmh3V/NjnziwBRFKIQXZLwWwrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
	b=I0Tk91OfPriyjq+92rcOQhcNB5Zr3bTAkastrSNmSiAr2vuuxdZw9+TbyFthPcy4AAih
	 /w1qJsb7Smd+mx4SPy6JltI9F/r5bGFVXBVlmLgNnqMr9aGoMsqw1wuOBr0eT5xvbG+rq
	 5R/bWluTCyWJwu3T1cVX6sml3Psz0APA3DGLZ7B0RVzylP9pkgrEGQVXNcm06S0Qam6VJ
	 FNItgy1AV7GGykkinmFkplNAUzooB4sPxCmXz/OlxodiEsDvsbY1VFPu9dXf9fVXMktTJ
	 83Ggo9GN4lAWvkqJJ9gX92jPrCE45HFYtGIrtUZMCjQeBMWHBmIVl8oWcGeIxlDNH3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PgVYYCqP;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0BF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PgVYYCqP
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4301e334ceso123922866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224679; x=1793829479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
        b=PgVYYCqPX41UhG5Bl+yQEoaG657LgkHS90fou1MBBl6weorRrt9LkRa4gQ4D2Zn0Ef
         MORN67DBQmJBY+OO8Hvmp2O/djvTPs49ITA5YJ7C6nHRZZ6kzwLv1lbr8r0ySAMZartm
         7WrYQmlgc9m4G0YP6pMBZzdKZIqt78yjqnffs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224679; x=1793829479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=legyr4eReh00y7yB0m88WdLEBCW7tMuEVnlufYw/5eE=;
        b=qW9pTzlXkFbt2ygos7YShqOQAZdbxjtxopRXYvNrhZraWiPB6WhkknTZC3yy1SIGC4
         3oR7IDzgprc8olFopB6TSet8teLxYGqmxcOnxYWOT7JjMW++uLkzlxdzUt9kz26a3Jt8
         dxa2cTS0Jcn+yB7RvDVX94YBhAvAnB32/h/KtRZ+Wo+mExBsG/TlCxJkZ/ymqfa67H1p
         R3EteG7NJFjZqQNvVvDnZt9nXv50BOvXm6SdB3ChNQVmQzHZsGTG0+6i0/7nrQUibet9
         7axj/m9ciUgUOFsXa8BVZkyz8MJsfEfZWV7W+4vaGH8divcRNChbBPH3FUbBS/gifQDA
         Wf4Q==
X-Forwarded-Encrypted: i=1; AKwUvByBqk8FkaSlvr/1rLOnKu1JuLaIsXdQKC0ejPNW32HPmy529hEkAPp65MCXQ0J+NGiRb6qsztO5o5JfU5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRFDeB8TrVblf94OFznE9scxzVqEVrE6QvTU0TYIyECqP6HcW3
	P9bw8HqAAoxI1+EpGOf0YGLHdZ6Ynz/LNZLgNuNI5TBh/x6TTrj2piw0hrkX7y/pi7SRgVeI3Zr
	dt41xRswo
X-Gm-Gg: AYBFou1PxowzHuaaFaJahGO2KWh3RwnDQWheo7E5xqyF795dcmyAiYI2fEKbRKBhWo+
	8RH9kBhadMqLliYiclFmR2MxHic4C4haIITVZ20n2QhnEhS8juJPaj8W54wzFmU6FiJvdn/TcdD
	89t8qit8i9sD+R6XSj8j2uTdLLDaQMqVCy0Fd57GHwF881N6wGe+y2MqajayifsxG8SpezTKJGL
	P3a7rNuWd5XDZHrKvUtQN/LCDmnqCkkX0XsuCfQrpUeWxHPoe+3jS+sD48hOMAo+Ak3XwtSPuXb
	GAFAmohWy0sRb/Axls1LvV4MqTzY/uFcbnTXS8zw+vNkZuK6911nuwBLIEue3De1S70EA5hpy5e
	oYaMvPg15BCFc3lVgRB7uSMD7vfRMvKKO2ufPQ7umoDrwQ0cVfop6L7wZSky71X148NZBX+bmvX
	uziYXz8wpT5PLqu4QU7VbrmYwbc1oheqp9FjomZYsRH54WWowvQou6pRqG3mWqJTrFtnG59mhY6
	88P/SrMsI5OFFH73QNSoS4CuypSr0AfwqJu45Pfh3FpmauWkIvW6E6GW8vvAreJNljkricD3RUF
	uh13rjihrDL31ZrROmpufqmkWH4JuCE2vejvio88UAIBo7isbjdHq65IjwB1jVdP3CjcBpbTkQB
	Qc/2+wjEx7pEFNw==
X-Received: by 2002:a17:907:cb88:b0:c40:80eb:c544 with SMTP id a640c23a62f3a-c49bdda7123mr324046966b.4.1793224678733;
        Wed, 28 Oct 2026 14:57:58 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964484d7sm1896206a12.32.2026.10.28.14.57.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:57 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1218489f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWk2QcOaj/VvJXnOJuKpAJ/TG7Rc37+LiizkdKDibtfXBV5LLjKl/yub8Nff3uFGAJfQI0dLyMETgpVn0=@vger.kernel.org
X-Received: by 2002:a05:6000:438a:b0:48e:5d63:a4e5 with SMTP id
 ffacd0b85a97d-48e5d63a673mr7516209f8f.0.1793224674740; Wed, 28 Oct 2026
 14:57:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org> <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
In-Reply-To: <CAFLszTiCTnpbmcGcjE2oWsY1UpyXd=8QFm+uuVBQTLw3-u_pFQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQcsTe1jS4FakyFGwPLpxXxwXbNzsHxOsZqHOa_HqwPQ@mail.gmail.com>
X-Gm-Features: AclHuK9SPdgtx9SZKlcuIND28eXBX-71-arKGnifL9h09UJM3B-5CnKYQnrW6-4
Message-ID: <CAD=FV=XQcsTe1jS4FakyFGwPLpxXxwXbNzsHxOsZqHOa_HqwPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB and overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -11,31 +11,195 @@ original device tree.
> > +    if comp =3D=3D 'xz':
> > +        return lzma.compress(raw_bytes, format=3Dlzma.FORMAT_XZ)
>
> Python's default integrity check for FORMAT_XZ is CRC64, but embedded
> xz decoders often support only CRC32. The kernel's lib/xz is one of
> them, which is why scripts/xz_wrap.sh passes --check=3Dcrc32 to xz. So a
> firmware-friendly .dtb.xz input could produce a .dtbo.xz that the same
> firmware cannot read. Please can you pass check=3Dlzma.CHECK_CRC32 here?

Done. compress_blob() now passes check=3Dlzma.CHECK_CRC32 for FORMAT_XZ.


> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1167,20 +1349,24 @@ def factor_dtb_files(args):
> >                  d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
> >              )
> >
> > +    base_dtb_file_bytes =3D compress_blob(base_dtb_blob, base_dtb_comp=
)
>
> If you keep --verify in the tool (David suggests it belongs in the
> test suite), it would be worth running the compressed bytes back
> through decompress_blob() and comparing them, since at present only
> the uncompressed blobs are checked. That is cheap and would catch a
> problem with the lz4 command or the compression options.

I removed the --verify and made sure things were well-tested in
the test suites.


> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > @@ -1147,6 +1147,36 @@ fdtoverlay_tests() {
> > +         run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
> > +             -b "fdtfactor_base.test.dtb.$ext" \
>
> In these tests the base output always uses the same compression as the
> inputs, and the input extension always matches the file contents. Two
> extra cases would be good, perhaps as a follow-up: a compressed blob
> in a plain '.dtb' file (to exercise the magic-byte detection) and, if
> -b stays, an uncompressed -b alongside compressed inputs.

Done. Added a test case in tests/run_tests.sh that passes a gzip-compressed
blob with a plain '.dtb' extension alongside '.dtb.gz' inputs and writes an
uncompressed '-b' output (plus another test exercising --base-compression).
