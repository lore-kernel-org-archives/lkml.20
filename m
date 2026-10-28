Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224688;
	b=EVdXdrqPYN0OYojHoDdnQEOubPJd6bEq+tjHMFtl3bE+/8IfvtJqKsDDyIgOvD+QlEPE
	 UUHQib5CX/YeIUdJZzsjZmPwWanOduLRl/JNKi3E8hK+ySjkw0cm3VLC/CrVCKy8nhZuR
	 KiDdvDQ+FOeNQxxQLhuyvcaTB396lqc9sOOcsScEZpX028Kt8tvMpiV4bhqVC9AGm3Ss5
	 r+DZIDPbT9OfTnpMH37diJrOFLPPciUg1r9WCQzs7Fmu1Yd5KejUL2/bJ5BUusDck7sw7
	 ZN5WG5eJvHBsGUluoLs0kM3tWyfhUrz3PuVTc+jP1+0bRcx0yWw9txJRx6//BMRGwpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
	b=ocP+FvZhldYVFNEa/Bg214B4NMT27DaGtiHgF2QHLhbS/ZlX8J1oa64p9iQqvNr03zru
	 hYfDAy3Tdxx6etlLiFQUbUoIKLr/S4MJSpWsub27rSahEXAr2ap5enCnsZzmeYpWJc2BP
	 UY4HoscVmOjpTjbItCqI1W7Hnrw/kEhV/EithVr6OwAcO6B4WdLf2xMfyvqyaxyXKrRNO
	 oJ09w77FxhHVQzL0C/D31RkSBr1Ni6a4D8Rw20Q7H9IT8xIrhcMi6mWlKlIq3j7Efl8fX
	 bXmu2nro6+d4XXB1iXdNnglN76b2VDkgkOUwdYn5SPif0MxBlpS7zhzBuW6hDFuKUFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eCNLRTbZ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD92606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDD92606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eCNLRTbZ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso226815266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224686; x=1793829486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
        b=eCNLRTbZil5w3Uhe5puWr5VAcexNSEXs4jXOlgU3qyf62YNlXFtKuiK3wWQkdZDkzZ
         TqpuprVDdKDcRa/1PSG0toXVXRjIMOJMGUg04R9plJ/m667thibbIFlOlcsm9UDw9QOw
         7BpGS/K/QuQ2d9ga+c2Wn2dO1T27en2u0S5nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224686; x=1793829486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
        b=IeX69IYrNTav0i/M1Lz/2a3tXi6Hu47/BvQ0nFvMTZOAga7QJVbgKYtRc5KG1AicRG
         XhInkmeSmHNXwT5S94Tk32gra8SBC6vDHYzaYQ6J5xxCiLdvz86iNht/hjHkjJ1T8nP0
         fGUFzpUCZqvpNl+roxYrM9RjoayRwt41/x2gm3PC+8gVumtUKgQsh9QhTWm6swK7bxXx
         70VW2HWlbgvXCe0BXt7aMFyy1YBYiwM07Iq0bz6yfzFIylcCQlcXjCck2RwmPs17unxp
         rJrvKdBnWvQ2hsfeENgl2MBkX34xB8wwxzVnpbY4U3LDkp6+9zqxekKRVOy7HG4emV1F
         MS4g==
X-Forwarded-Encrypted: i=1; AKwUvBwRKmtLnotW2OHuNtYNmLNG4X/6fy7ud+8LzhwwmkwsIHSnPxNpxEiSaLJeQzAezN5KCWIYr93qkYnjvFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkbVyr4e+0XmwNxq+cmHraYYptOxcOC+x1ezsZ5fgs3KeuyYze
	FRaRtss2Akt0v1Aqb2F12g2bcci44BwxCIIbJDHuldSARJGFan/s5/tRxEGZip0ILUd8QXZJOGo
	d0I5g1xU4
X-Gm-Gg: AYBFou2zQg7CAn3QChXL7h6t5q7+WecVRPKCOYxvqhFS3i/XjdbOUZpR9luWe7cgr5d
	ymuZwSczbEBGR3ROafEfB1rooujyxKD+u06CigKtWUdCKdwaLlCHXcNcfGY4HfcRWMiDR/XUDzM
	BPL33tKrx+cD+IKyQhJTnHu9nCQkEs6xa1QVVrcbggVBjI6fANIhqM7qk9YC3eeqUqMG2OT5WMO
	dITucTLqcuTBKY4PKp0xgNw3dC1dnvd1sCT9pLjnImR6E67xsaJ1A+3nKt2szP9TTN8UShG/TZQ
	W0PLfH2QARJUE8TrkGYUlJlUQqsiYgTVuTwyLZiKA2LMAmS39Jejx8qvnQ4IeovHZN1RDI438mQ
	84iQWHqe4bVLFhTB0uTR7+282DxopO8WXO26X66ehVwPXSDtY3kwaaaZXxrWhOGVTk+3Nm0iBce
	pE/6H9TR2hLAv9HoCJSL7hVdOR285iRwVnnhqDFOZFD/r29X4uvOs9Tj7P60HXa0y/HwJ4thZf/
	Y2vqcCQPI6MvQEJ59ZdgJKhOzlqUaIhdEEUBtk8LhDCNDCOrnctYjjVi+m1jUR1YdpTzqiqy0hE
	pnm5nL53YDCCIZ3+qIUXRQKsGBrJA57nsFUAAWo1Bicv+EMx/R/nVe8YeTwBXkf7GTGL
X-Received: by 2002:a17:907:9405:b0:c49:8d28:73ad with SMTP id a640c23a62f3a-c49be020e3dmr296849066b.49.1793224686414;
        Wed, 28 Oct 2026 14:58:06 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm652884466b.87.2026.10.28.14.58.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:58:05 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so909345f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAu0JJM9aNxSMpY3amvAVGhn5BbNs5z0rAKDJwbf9u+cVoeNohh33fOywQIiukVjxhCB+XWl0aLaC+Jfs=@vger.kernel.org
X-Received: by 2002:a05:6000:4912:b0:48e:c0:9441 with SMTP id
 ffacd0b85a97d-48e5d5988bemr9046706f8f.29.1793224683163; Wed, 28 Oct 2026
 14:58:03 -0700 (PDT)
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
 <20261015182221.2931742-4-dianders@chromium.org> <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
In-Reply-To: <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vroh_fcqxaOi2s8mBS7Ki2fQ79iagnLkTK_FxUFk1bWQ@mail.gmail.com>
X-Gm-Features: AclHuK9avb8muZ-xZs_aIYuQFeaeI3fXfNjJMJPbBXHmJks29iEzgyPnCpdYzXk
Message-ID: <CAD=FV=Vroh_fcqxaOi2s8mBS7Ki2fQ79iagnLkTK_FxUFk1bWQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
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
> > +LZ4_MAGIC =3D b'\x04\x22\x4d\x18'
> > +LZ4_LEGACY_MAGIC =3D b'\x02\x21\x4c\x18'
>
> Legacy lz4 input is detected here, but compress_blob() always runs
> 'lz4 -12 -z', which writes the frame format. So a legacy-format
> board.dtb.lz4 comes out as a frame-format board.dtbo.lz4. I checked:
> 'lz4 -l -9' output starts with 02 21 4c 18, while the compress_blob()
> command gives 04 22 4d 18. The kernel's cmd_lz4 uses 'lz4 -l', and
> lib/decompress_unlz4.c only accepts the legacy format. So a consumer
> that handles only one of the two formats cannot read the result. This
> doesn't match 'Preserve the input compression format' in the commit
> message. Please can you track legacy as its own compression type (and
> pass -l when compressing), or else reject legacy input?

Done.


> > +def decompress_blob(raw_bytes, filename=3D'', comp=3DNone):
> ...
> > +    if comp =3D=3D 'lz4':
> > +        try:
> > +            res =3D subprocess.run(
> > +                ['lz4', '-d', '-q', '-c'],
> > +                input=3Draw_bytes,
> > +                capture_output=3DTrue,
> > +                check=3DFalse,
> > +            )
> > +        except FileNotFoundError as exc:
> > +            raise RuntimeError(
> > +                'lz4 command not found; install lz4 to process .lz4 fi=
les'
> > +            ) from exc
>
> compress_blob() repeats this block almost exactly, so it should be in
> a helper. If the helper takes the filename, compression errors can
> also say which file failed.

Done.
