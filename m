Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019388;
	b=SbbCtq06WI34vA31sHJOSpHFx1RxkCygkRwJhXh7lMpJvET10jS6QxQagnKNQkkQ/BHL
	 FixsB+zjnzW4h0T8wK+E+j9VuVezcMComrj+x7abhXLHaaI1z8byMA7FcUwYHrgJi7qVQ
	 2SlT/4YIyUySdo5EbAGIrxbIOE1NtjxJkPKleHYJqiybFoq7pvd1gFAo67IuqTzXi8oBt
	 dPf6UIissBdwjparaFMRtwgky4+qrgbh9eweO16+EHCZB96JsunVN3i1wLVe31fjWPSBc
	 +L1cxfWfDLiPVJUV0Jids7i90npW8ue7jxq0Ke7ArwgyFfbk8MMi2EbuuVqmOb3L9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
	b=D3j1KoQdORraI/LMIHywBfYpzncuCz5aNDCujWHlD2rTQEaM2bDJlRlrTLJi9x2fkfvP
	 noXd98esmDfnz7zCdiTAOLzU+s69NrduHXzxzJIBM/9Pd67/U7rueLXgic8heBU7BGo7/
	 T0IadZQfYTLMvoRrra+1FHl8OAs/E5fOO+26KvgdR348CLPo4b6tGBUQ4x8HI9nYU8QTS
	 WdQSQc7JKM3IPeNgWx2l1zmnLoX+KxBHNigBY0oWJp/S7bymjmgbfF7RIEtXcscINsAu8
	 vydgPHqoU8e2sTwFEd3ago/4juDDCxXXhl9sBxYQMXz3a2+dc2UjYTK1lUPbCjGPCDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QB7ANS40;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50599606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50599606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QB7ANS40
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1530382a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019387; x=1794624187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
        b=QB7ANS40XjkxLJ5esABr/BeIYWIir6c5esuMIAw+Nquh0tqcp5ch27MMscizwEk/Wa
         zzeor0ag4ZwDWB0rilycj/pbL2hldKKTc7t2P4MWjjq1aaSBPFIjEJsUdwfEW+U5KYjm
         /yzHVwLhYabpR+6Z4oZI6BY2kOAGbVrF2dYlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019387; x=1794624187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
        b=P+6BkGx027O9hUeyaOvfdVwxesE5CvMcQN/fQ5WTujlWpVg65ou9GE4i6qfFhxZ/xl
         nys8lAQHrsVg4XLFFJUIziCn/x+n3zOI5kgLH5tj8N7Mb/BMHIK4/z8+tKzutH5xh+uG
         zsbpzAFHkcqKaPviG6su93uh1ndIoJ/rzb43YVTSI+8tS8pVjqRbOSCfO85Z9KxgQs3I
         b7Y5ho4LASKhucah2GUEasOTADZuDUPKYAjRG8f5Cbf1oRUL0x6BRNRrcUFh8WUe+At7
         hz/ytqoADo4mg+r+jE30wGE0jcHFc2eo5WWVybDZNJt+gTUU+J9U06qHL+5mVpRMZzUM
         jXLQ==
X-Forwarded-Encrypted: i=1; AL+hErFNAzeEUVGU7zZVAbOW+7BYcsKI53xO+SKDxTJG09x8hI6nPX4rwZz/DYcdyTRL9wSGKHecJhs5eMmiYY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rF+BvVNixnOmpfZvwLZolGD9S6f8WgD+9uD6SZHbWvvqt3iyw
	4ugDy1nudrFpLx6mOZZwkjLJcXh088RLdapjhIsJAhVrr9U1nMY0ufnyPzWCW9s+ICMPufJMdih
	SgqvLRh+r
X-Gm-Gg: AYBFou3+cQmKB4nK0QEF973wQvHlEsJVncL0b/WMqE1WJ7TwmIsOhZoF40kDYudMUC1
	eXsWGqbP09TY3BR9yHX5AX0vbxkqPli5h/XjV70X9MLZT6IDE6POwjtF1zCX5oLHtKKjt7OkoEo
	KxE03I+NvbTe5yz/GbHFbXGsWpGOYo+csTIIeLGYEZuZ60GDggCCBWeXpqb0WRsMG/tEbE85eTX
	rOibgM/VJ1w/hAqS7cFC8dJRFVSDDGpLjCDZtjjie9slg2LzV573XBEiphPGAKEtyR1mPEfol0g
	OFhmq6wdvJ4Gw+QD4ihDilDHxanvNa7J2mhOgLt7sMKlK9D859i0hub0fOjaH2pxuhx3lZ+XJlZ
	QqaHCe2QpiNZt7NKBHZKc91cJwVt8rlJtgUqcqRtw56ekeZ0K+Q83OH2WVsTTwnvgiPML/4FCSX
	+nznTMFOzsduZ2skliSbQ9Qxd4srjOiQOdj4iyXL53VML0JNcMkoOCW7Gb0D1YHiITVnpxIDCD4
	TlUPCCuAwxKBOprHS9Irg4DR8omlqGj1s/i9PeFACX8gaITjGzd2gvEywOyEviyCQd5Czfdnate
	KIJVJX/z4DaoyrEGkfW2cyHU72KqQQuMqC4zYp+RrpsM/MOeAFmXEX2ZrqiXHK5cL5c=
X-Received: by 2002:a05:6402:1f11:b0:6b5:9150:edf3 with SMTP id 4fb4d7f45d1cf-6b597a41f7emr2978481a12.43.1794019386697;
        Fri, 06 Nov 2026 18:43:06 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664afe545sm1274417a12.23.2026.11.06.18.43.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:05 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso8716295e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:43:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy0O5jCHZU7OafgXKO2sZRm8mRgteQdCGN4xtCPRc543JssjvjlDU/tiAbwVjkX8KMpFjsqqt+d7PcIq1A=@vger.kernel.org
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id
 5b1f17b1804b1-4b6dfba8628mr66208895e9.30.1794019381760; Fri, 06 Nov 2026
 18:43:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org> <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
In-Reply-To: <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:42:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vw4HA9e4222Lz9zqqTAj=qtM6hxm9V92kYSKLrORQekw@mail.gmail.com>
X-Gm-Features: AclHuK-C8ZGba_taYSlSltFRRFmvJecYKz0U6LcbuvJ6muIhoF5x8g5ctxikpQA
Message-ID: <CAD=FV=Vw4HA9e4222Lz9zqqTAj=qtM6hxm9V92kYSKLrORQekw@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Wed, Nov 4, 2026 at 7:14=E2=80=AFAM Simon Glass <sjg@chromium.org> wrote=
:
>
> Hi Doug,
>
> On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
>
> > Before introducing `fdtfactor` itself, the series starts with a few
> > preparatory patches: adding a `DeviceTree` live-tree abstraction in
> > `devicetree.py`, and teaching `libfdt`'s `fdt_overlay_apply()` to updat=
e
> > `/__local_fixups__` on the base tree so overlays can be applied in
> > multiple stages.
>
> Just to check, is this still the motivation? Stacked overlays work
> without it, since fdt_overlay_apply() does not read the base tree's
> /__local_fixups__ when resolving an overlay, and the stacked_overlay
> tests pass in a -Doverlay-local-fixups=3D0 build. The commit message
> gives a different reason (keeping phandle metadata in merged trees).

That phrasing in the cover letter was a leftover from earlier versions.
I've updated the cover letter in my draft v4 so it matches the commit
message motivation:

    Before introducing `fdtfactor` itself, the series starts with a few
    preparatory patches: adding a `DeviceTree` live-tree abstraction in
    `pylibfdt/devicetree.py` (with supporting `Property` and `FdtSw`
    enhancements), and teaching `libfdt`'s `fdt_overlay_apply()` to update
    `/__local_fixups__` on the base tree so merged trees retain complete an=
d
    accurate phandle location metadata (for runtime consumers, composite
    `.dtb`s built by `fdtoverlay` that are later fed into `fdtfactor`, and
    round-trip verification against `dtc -L`).


-Doug
