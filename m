Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BB3562609
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972625; cv=pass; b=ExgpfastH39fJWKNmM+GrfJu1ZA6AoHmSwtROHMPBqbsfh6JwRd7QrB+jhkcBGrwzOcnrrSomVFMv6Ench9sr0OhLM9HEOtZjIlkhfS//uf+pY4tWbAvXL+w5HZZ7SmeQ6sOx8Qes0CtyVCK1Vo1P4gFmdL9UFQDjG4Q+mDC14Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972625; c=relaxed/simple;
	bh=pX375j8sh6vF6kmJpBXuTbigJC1Pj462kQb14+L3SCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIAA4N29uXIQwSUJeHq1R2s0gZgntwCC3IwWQcCSl9VmOmDpK2C6WvL1mfSeMzfKiaf/NxdKWL/qErY+UfGsD10piBWCToAicArf3jR8obGz1J/zNgN1IWxPPRvVdAORQ3HjCaBcfexzzRTyBPK6o2qXxGnXV9VZLD8LpNXRsqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXtHoX1R; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXtHoX1R"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso40107566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788972622; cv=none;
        d=google.com; s=arc-20260327;
        b=oSkViwFJNsqkF/1yo52ry05WXOtV5tmEDcwbnZH5uqc3vjbI26/W5V9rivvnE3y9Li
         H5jWy8AIkqdyglHHAFQ0Zip7wd4cBQEAdfnobv6vnDzlaX2/mlFSs4yrDYwA1EJW06M4
         RTM3XfoVhTXjbkrHtBbZRnZHQPjvtts+NzWUzyifDW0BA0B7AH7a/Nh96d9m+NMpY+RK
         n0qVQqsFb9s8ufJkgaUPVZ4EmJoo+NE0ih9kIUfug4RHQqRjUDtHAq2+QL9Nfa7JGbiy
         IPI9rbPkVrSZLK62QnTyCmfIqhXJU8IkA+Ka1bVeEswZCfuiEGs/vdsl8T6r44tBYuBR
         Ccrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaSEqqQVvbHkTy3GU8KhCzhbcZLDrCGnsQ+LbvJQKCs=;
        fh=SOQ1E/NOvd5sLA2AlJ87YhNXV8sWie+VrJkSutumr08=;
        b=LFdjDqm/2xdZDcpaTm6Vjwe0FIFVUnvnkwlD6HsjC58ZL1cu9iW0xUY0+CEm30DbKJ
         SkAjJOUa6up7SEpPLFCXmRiCnEOBaoQs1B4DRedM11uR7eBHMCB2Lg/toPYxdfSBbt13
         VX+p2xhlJEt6YF19kQnaf1l27wQX+KA9a73ibFy6aQKOah0uObBxlTdTY8Cd1hLXW8cv
         u/AoZDf5DMrtByVSc2/CEfSm9U303Tf8WHoMG5PqjFkZ6F4H/T1ejZSIensR1zDFY4JB
         GIkDDwv+djQsbByLVvtKzH8BvNvFFWmWhew7r2B29nRwOJ6wYqNyqYFOelY6mYFh+VSY
         xGkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788972622; x=1789577422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gaSEqqQVvbHkTy3GU8KhCzhbcZLDrCGnsQ+LbvJQKCs=;
        b=KXtHoX1RgVfyJA9D65VNk/HYAg7ljx3xsnUMz8Bb7uyXKf2uXltc0NnoZrPS6Oz1by
         JSMN+yPJhhNnz476yizNxCiRoUXtajwDeHlL6yfdEYPcmxIwZ0pQJMvVB9KbTX5f8a+3
         KK8VGGeDK7LvoZb1QqPOVZHXwbYrH4AYO1ElPtT5xMnhNckqEtVKz4YdNccuFlxD6ve6
         j/bV6z/sm6zPyWBpbjLO4P3ODVW6mRyTXVsAMz4UoYPqq+rIWpvrk10/IlqHKmSHnR6b
         Zk1Eq0wKvZ3JmUt10MbBj7xGSJcCiLWmDCy4GvOHs2VQOHh24/lT/oS2OV0vEPyoOTUW
         tYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788972622; x=1789577422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaSEqqQVvbHkTy3GU8KhCzhbcZLDrCGnsQ+LbvJQKCs=;
        b=oZtpSP3wokMrprUiGH4qx4HraKOjG8I/Hv4M/6cAzIf11u65qkvDWcFJHLLmanqYCT
         hPpBq+F2Alg9W6Bp7/62xVm1GoZtRdNTCk6Y73i5ibc5L44A7gVogxN4IZlFg156OMya
         z+UXZtcqMiUQgOQeF/Kwlgf8Vgy8jUOPSw47JFIShBuHPqwBp1Sc6sHvNEBjbEBM2Deg
         qHypbZTrFX0Apkzbl2Fd2DYLi5rzibOy95hwZaVevUKvl5N8Fj/7uR+VRE2wi+HBCSAo
         WViTO6aQMVsFxgvuQQPzAmt4e5XlIbLEWeaj1KA3jEGQitKk7bjoDPDPW/p2OkurJ1d9
         KiqA==
X-Forwarded-Encrypted: i=1; AKwUvBzGzUO8xbx+HRj7pawSKFy+zm9B6mB4URJdhXZtpyFcA+jOLhDA6SsN35gpXzclQXc0Qz29DGBfkKmECXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nQbJp7xeG6uSHpmi8Tn3T8XyaIsY+u9CKkp5GXZEzCniM2wwpl
	CrgU8Fq1MiTJindyKNMYTIwB14pibUcpwYwcxCbKQPzkLWbY3F4g1qQOI3XTv7WSVEH+QmRmJ7M
	7ZrWM/1e2XsfKOx8AQMvSIfw7zl0FtUE=
X-Gm-Gg: AYBFou3KqygMsn5bUjv/muhbP27k9SxEqM4R2zcS9xS5JtY4cR+iYEBvUrbUE1Ban7d
	CmkzALJtCM8mm9kqdCcbIYByUzJlL9+vLlrCi0vQHnXuTaPEh32WwfT/CKHx0RPeEjo1c8xiGMb
	rJDLo/XcLFUEBO+UUwoQFu0lZ7C3VUbXu4Av7Z2da7A9PRxNFN295fITrLePfhiINuU/UOLR/uW
	MhCm2VsrgMcsRa2Ky3KIh0fI8rIT+di98/SvfR+qDyoT/ne0K9/I6G0GzSy9yZMn4NVzhwyVCKY
	rFk9LrG1eRO3cShhjXHwU6jyHSLDk9U8v6Em6WbBHElQTNxkxb10H3QMO8Sgs2PSTx9Y2YluAIm
	YL6o6O1GlQXx/4xf6jPFjyMM=
X-Received: by 2002:a17:907:da1:b0:c26:1648:a069 with SMTP id
 a640c23a62f3a-c2941b50c5emr98787066b.36.1788972621568; Wed, 09 Sep 2026
 09:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com> <20260721095654.429346-2-clamor95@gmail.com>
 <178463529533.2776661.17291216407355479584.robh@kernel.org> <20260909162654.GK2133376@google.com>
In-Reply-To: <20260909162654.GK2133376@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 9 Sep 2026 19:50:08 +0300
X-Gm-Features: AcwNN1XKwhxknUsv6HKXytCI9drSinxM2O3i8RIi3hHlsgo01tXMW3-PL-0Uk58
Message-ID: <CAPVz0n2zLd2SPrHGb5vSX3AvRrofbA7Q54YFpmcPP6032MUw+Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
To: Lee Jones <lee@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 9 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:27 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 21 Jul 2026, Rob Herring (Arm) wrote:
>
> >
> > On Tue, 21 Jul 2026 12:56:48 +0300, Svyatoslav Ryhel wrote:
> > > Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT =
to
> > > YAML format. This patch does not change any functionality; the bindin=
gs
> > > remain the same.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
> > >  .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++=
++
> > >  2 files changed, 42 insertions(+), 29 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap=
.txt
> > >  create mode 100644 Documentation/devicetree/bindings/leds/motorola,c=
pcap-leds.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> >
> >
> > doc reference errors (make refcheckdocs):
> > Warning: Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yam=
l references a file that doesn't exist: Documentation/devicetree/bindings/m=
fd/motorola,cpcap.yaml
> > Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt refer=
ences a file that doesn't exist: Documentation/devicetree/bindings/leds/led=
s-cpcap.txt
> > Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml: Docume=
ntation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentation=
/devicetree/bindings/leds/leds-cpcap.txt
> >
> > See https://patchwork.kernel.org/project/devicetree/patch/2026072109565=
4.429346-2-clamor95@gmail.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checkin=
g
> > your schema. However, it must be unset to test all examples with your s=
chema.
>
> This one.
>

As you can see only complain is that reference in the leds yaml to
Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml does not
exist. All cpcap cell bindings were converted one by one as separate
commits, so this is natural since motorola,cpcap.yaml will be
converted last and patch doing this is included in the series. It does
not bring any regressions in yaml and dt schema checks.

> --
> Lee Jones
