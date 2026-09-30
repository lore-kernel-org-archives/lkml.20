Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607D03F23BB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785610; cv=pass; b=qhB95rdgl7QBQX2abKN1aNOc5QRmNCz8g9cktvMw+K/7phjelB5Dp+5TJ/jvszflTmtF4KumFwsSkfUdixTD4Ja225Bl708HPnccLV+CEA6vWh0laQJp4sD0PqTYfl3eg1bkRL62LEyrdBOo226YPyQvcxf6OlHYC5ra+LnCOJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785610; c=relaxed/simple;
	bh=WK/XpWKPIWOEnWF+g+kKFp9YCg+P+PyUPeF7SMSzQdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDw282q2BhCawJOijpFhc6u7kuG9iO/QcO1rgiAw+B6LzsxOKkVVDhILmBepZim6ANH8PqgfpUoenV1018HkPk2UkGjGm0rq26QBwORc6VbiAbfCnzy32ezgqGxRhnAGV7MfV0/FL3LiTl5N+LJcxNpqcwa8mPvAURL9zla57nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhyXr3yw; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhyXr3yw"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab4620ecf9so16891397b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785592; cv=none;
        d=google.com; s=arc-20260327;
        b=hKp25W7FgU9M+0L/gO42WCqxWZi0+iMV0jXx2TS/WvqVTcVI4qQlZLlvZcNxWh8WEO
         pr70LNBIiBcgAh9GQCAuqeKX3/iqOlaka9y3z+14cg4jGLPRZmAOdGcSO3DOgC0ZtfDb
         TUSPvgcgXji3FmnES93pz8P1rhuwDut5g4ElyvEMxFxkGgis69diAYF0WpHGxFBaXUYo
         R2CFnnClg6gU2vppA92ykDdWBfc7TSWR4j1J4bhH1rTK36xHBWrVaFuZUnBw02p3Yx9o
         faFCfWrvkbKjEH1DxTmi8C8tptEga1eM9nYdhQ8DqtJiXz5obn9r8XQ0XmOn53+vmpBn
         auzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        fh=LNeFu8n1Tu6N3FrlRkpHj1Hm5vseUYPj5FachIIAdEk=;
        b=pAA2m40pcHgTgMe+J+sMAWk2b3Q8v4m1xvK5T+eU+hy2VxZOHzuIyC1fXqiLtyrcNZ
         V7ae5MB7eJwl/tuPAIvia1O5nrvQaG4JTRq+aFH6v9JbTdt9YZZ1dhcH6Fmclor1R6C1
         8ZubDGacWpsy22SdxPx0U9u4IbhJuVaajFl1QTyLBKsXNlQJjBGcpsvkrc6SF/kG9ACg
         8A9xea4eT5fLlb1WMUrhV5s6SOMlEjgd47Z4gpNDjOF8QMHFY1KKt97XAnIcz59FmJsc
         PtFo8ew/a+ye/BSiQAmWpCw5aLqG0kNQOFWPDKWr4IlXFdWvAzy+4u+511pzhifl8VPG
         Nmsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790785592; x=1791390392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        b=ZhyXr3yw98Rkn00AbBd+D7MOSoewuPpH0kd6CtJU/EoO5pRm6gY9oCO1yePWqVz5ot
         gO8UhHkm3nh1Pn8OMQkQPWFUpDPCwfSe4LZ7hgWlpxDFDRr11RtEYcz5FWmdP2wcMRNP
         wxr+3+6c72g8BDjFhewiz1VxxIxofV7Rt/A4STV9SWFTA2MdCaPvUiqNLM16mWKXyf11
         62i5FfpBHZu7gnW5FRZNwnHES1gbpU6ZmIJ94FgsRjzJ8KMT0A0A/3JrR1e3Vtfzm80/
         kW2TL3No5jON6hHxU3M+KEJVSDshDO2kqT7zG51IW2ARvjWrP8oDXbmON0HrkJKEwcAO
         0+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785592; x=1791390392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        b=j22d3uW8s0nGx9TlYj3uv88euRtxZBC4+LOAFDDytAolSFPF7FKtzo+MgU1l5sPjLf
         erGYOvOjDS3PWQr1wso9pBw8dTYldRXFudMJbnf0qVMb/9l/BAY53s8tEx7NuYIgnk1I
         5hMp/Btfx5MOkBIkUi6BnUvz75ZcYwkOFw+kpah753B7OP9C8O/rbReCn+EE7kB4xYzc
         ZLz9iymdYk+9Yo4mGMKyRxHvbyjEmUvNwtO7ZbogIiMlbNkehIqzU63OEZ8DHwpBcwAo
         IUSjrkYuTG6Ht/GjzJ5Uy/GtKkU999t4ScwPxyPW0Dy5pSvvEQvz6iY6SlNl3n64rR4H
         F48Q==
X-Forwarded-Encrypted: i=1; AKwUvByluB9bFNisdlNOG+0i9p0EEj2DnHPud95awNB6bGA8IcbBuTQpYZdqWMEMyKsKYIEXZzoy08cAqq281Zk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx8fy8tEUx72O72HDfJ0X5SX92BOcwuMMIpvcDFABsW2eyrI56
	WFIQ0R5lB5A/MgX/JaGFIFpBQT0z8XehDP4o/GJjFu1ZICfO9z7Ql1yvEe47uu/e040iKc67YkZ
	t0eVg+zJiNaot5rjadriAktGFMpmOmaeRFikMoataqw==
X-Gm-Gg: AYBFou0PEi5ig3IO00DXCTMnEb5BpnQnZ87GXFm4y+AiC/gggQ+px/MIwSGe8ZJimSC
	BzH4zQTCYfhByW6TN+EpDkg+WZmrmNKcZR5Ev54NnJ8DPrfsdyGwnoBu5y4FKSppb3YOJJSAxgg
	SZDo7cGFfZW4pi6xqvyp5wzTB+kgbRiALZ3OlkCQ22G0f4nCUmRu+wKfskNdecDzIlLzhSHnil8
	bmtfc+mNvmm2Op0ZehUEdqBGv9p7aLdGg9mpviC+jYNrU85fUbwBt7fopP6YM0bCSviyRT7rCG0
	XKH22SWqRhhXRsRY43X0RmYGglBqT2r8+S7L1b1gFSCya883PKKhTF7K/dGqZ/aM
X-Received: by 2002:a05:690c:e205:10b0:8a8:8945:c3ce with SMTP id
 00721157ae682-8ac92d31f55mr6394247b3.63.1790785591578; Wed, 30 Sep 2026
 09:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll> <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org> <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
In-Reply-To: <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 1 Oct 2026 00:26:19 +0800
X-Gm-Features: AclHuK8qxVxvhel2lglijF9Rc5ozZymwHXuo3kOm52fjKYrNUnWjF5DWZXE12Tg
Message-ID: <CABymUCP0Wk+wogyj=8CJJ5qrGtw6qe_FihB5vuSxBc1wVd37sA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel support
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=B8=89 15:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Sep 29, 2026 at 3:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>
> > This entire binding seems like stitching two devices together, which
> > might be fine (I don't even remember this stuff... two months old) or
> > might be artificial grouping of separate devices.
>
> I think that's a good point and fair pushback.
>
> Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> https://www.youtube.com/watch?v=3D6tNGW8PoSzw
>
> The current binding does not reflect the physical topology of the
> actual device, and the bindings need improvements. I have a feeling
> there is one display controller with two physical panels.

Sorry to confuse you. There are 2 r63455 DSI controllers for 2 physical
panels. This patch set aims to hide 2 set of DSI host/device and
associated backlight/power/reset handling in a single panel driver. So
that it is much simpler for DRM CRTC/connector and compositor to
handle 2 physical panels, just as they handle a single panel. No change
is expected at all.

>
> In that case I think it's better if we do:
>
> panel: panel@0 {
>     /* This is the two-panel package with one display controller */
>     compatible =3D "sharp,ls026b3sa06", "synaptics,r63455";
>     reg =3D <0>;
>     #address-cells =3D <1>;
>     #size-cells =3D <0>;
>
>     panel@0 {
>         reset-gpios =3D <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>;
>         reg =3D <0>;
>          ....
>     };
>
>     panel@1 {
>         reset-gpios =3D <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
>         reg =3D <1>;
>         ....
>     };
>
> ...
> };
>
>
> Yours,
> Linus Walleij
