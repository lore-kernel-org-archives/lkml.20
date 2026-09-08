Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626963D8133
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859577; cv=pass; b=JDlZj17La3UUSCiIOHnAubPjBT0GT6HLtoUmUypkTCO4Ucn6LzEqdapiXrq9g3vBfjnKdrKPMQ2PjOm7WUtkXykXPUFsdSZzq5gFtRR0Na/qmW42EKGYdW5ZRajpSwBXRsQbzhYB2q8Yely9xGY5q9GfuUhIH+VriYUQuriGK7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859577; c=relaxed/simple;
	bh=WTKWD3m/ofQrn2mdzKEMgcB+HsCn/djytq4O85Ygfn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUw4Hn4QEz2QmhIqkB1rbMNW/HYJev6H/SyryTV2wZRCgE+QATEkMdIMtCanmGbKDmMxCnknE7k2xnNeoSE9K23mAQrFkRHopTm0W3yEmHGkw2tIa4igjmOUsAIe/RV8LQXxllwlBzUifFWl/YG5gK4JPHiZmgv/3YMQ0StRXM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gdNse7+U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NuANI/qQ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gdNse7+U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NuANI/qQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788859575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTKWD3m/ofQrn2mdzKEMgcB+HsCn/djytq4O85Ygfn0=;
	b=gdNse7+UziCq64UqFK+tgdLk2KgH0dfJOKWBqOSUSzFLTAjciW3DshZyIiZi+CGmncINr0
	Q9B3HEjxJxGMKq791MuvBbcOwubNRxd8dl/9n9sijXMYJ8mbuwv2U6P0bhmIPTNwl/hlzv
	O6KXYzMUWTFwvGKqV9zTw2aXQk79YEk=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-dHv9GFsVMmO6gd7rbwpTWA-1; Tue, 08 Sep 2026 05:26:14 -0400
X-MC-Unique: dHv9GFsVMmO6gd7rbwpTWA-1
X-Mimecast-MFC-AGG-ID: dHv9GFsVMmO6gd7rbwpTWA_1788859573
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44aeefa1c36so2622617fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859573; cv=none;
        d=google.com; s=arc-20260327;
        b=TVa8CKV7eoE7MWDr7b0av9tRgIOu5jQJMSbigRAqnTQfoOur9Px9M2XCfwNQ1eKXAv
         N9q/7mqL0Omog0mTddqyVeRnfLs+nohSYmSr5PU7wWWHPBLr5AtqMpXJ2+i5Lc1Bg4nF
         2PU13fDmyhmlIvxcoYgAoMdjQ55lyPzot9YKGTgqSPFEF+pRouzNTNmZ1RaggHhZ2eXl
         CzWhUp4ly9fnYoBY4eBDZkb9No3JKBjMkGwJmYSUXKPxdGRX+1D2GLbHTYaGWJQumTJD
         OETwBdYjS9vu4tLbL+TyFGEoME4InzR6rF6WVr/OXM+kGaNtmJvhwK1xAcoeuJ0XjEGl
         OIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTKWD3m/ofQrn2mdzKEMgcB+HsCn/djytq4O85Ygfn0=;
        fh=BcoS5h0bqCCtk+Kc3afmIqaX9n93ojj/oGzDqNz2azY=;
        b=T+KmKB7Zw0b69uK4Mp6Dv0hX0kTl6pSesDN7bAgKb3ZnCXgC+coQG35NCz3C4dzFnT
         zy0YfN6ulFPEdx3NXKnGQhOs7jBeCHN0USZ04gzJJ6AjS8u2bMgnDIhG8857sbpHBaYM
         IXjV2uj5WdYwvKRTIp1KvuyYnfR4M2IYzAh7pXWWnS06S24/38cb0XHecM2mAlWP8oSe
         dLsxkVWq9CAQ7Ckp2o0X8noZUIxGvnnWjjtTTz2cVic69AeYxMAt1EWYw5ltXeYj/Zyf
         wYutMP85AQHuxDifRZbMn2gDxqu9zzcOFt/tsTZEqf889wfuWkBGq1Ivt3gLmlx+4+oe
         dzwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788859573; x=1789464373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WTKWD3m/ofQrn2mdzKEMgcB+HsCn/djytq4O85Ygfn0=;
        b=NuANI/qQzqR76JMTkS0Yym5hsVgftiY1q2c7YwBHWcRV+AOxwm9cQgoVe+BbGrO5pI
         uU7LRhy3Kw0+X2nKY3nZ+F9/PE7dF6+5K29TQOrHmYw6L6/vJfgOjAzhWzweCQKs4Hiw
         Y5u7Bs0bd0ljoJdIITCgaY2/7F40Aar6ASKebTeNNidb/uCcvJ6oIBqbRqlmW0AYM3PP
         t+Ts+eD4ZSD3WWoK7H+Zr1PyDZgyFm0/mPbeFbvhTqATUo5EMOVO4wopa24EHxR/0Pv5
         Y9eYO/Y3ldVYFaDf9tdLZWmwnv1u2ymJ6aIrbf1AYJs9HNIMMySYKiezmAGcP30M8FKE
         Iv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859573; x=1789464373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTKWD3m/ofQrn2mdzKEMgcB+HsCn/djytq4O85Ygfn0=;
        b=H4q+Qm1MKde3vTWrIvbod1xg1ZrUrYDsWGjw4rQvvLn+0+sfzBDdiAJPg4lDrg0c9L
         Rqh8YMQTxYyqcet1Znr3k1P5toAehq6pJcdOHB6DfCdpinMTs7kQgK04SMMmbXfA/Qki
         rTuFsIpAlfXUA5btBudsJzUKRZ3BpNSutj91x2JPoWLAI0yDbilc1v2uwoyHH7IZWfiE
         l8ciRyu2qok8Ygcgg3uF2mhv5Bwu0eKpO+kpmqKOoV293GDn78n08HWaJ0BKHJAgZ7gB
         RqArjjyWxCRmstMvOdB9wbX3rOJ4SpciEiRaFfFy/OpJfmfSIvmdNsrVEPKokPnt3t3j
         yPUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/Yh8HQR6K3epRhuIdw8QnIf+Bi442w1F8IQs20alSvipZdsRkraJIIHTDEUCYEZ6E/Ez8aeU/S/bt4Mc=@vger.kernel.org
X-Gm-Message-State: AFuF++mvpjGh7FXChV4FoOvwL5MNsHMVDGI/ml79e5Ckm1NAaftJJ5n+
	XALhMbcu+1KzulqEhNibhRJh8gChFQJVruO9UU0oGoiLSxf9VQMIaly/n1RJQXZugVi4m1suUkO
	CxzuSHMmXaFdU2nvm+v6jSYSGl9YkDaIhq1FJZb+6HxGI+zsDQ+g9yszGPqIY3qeMg5OLLfkdjn
	aNl9S0O/sTyy+IXz8UDEGgk5LTH3v+X/6iWiC3XLba
X-Gm-Gg: AYBFou3FNluZfjavGQOIlSEJbeyTJ9+pilauX6IxlXr7oG9tlaAC5dOPy3mJMvEvdB0
	rng8Qr5VkbBd504e8HXg+Yz8V5gm9wet9Cx+RNqhVDumzqIiBvikqmAOC8cwsOK5NmU8WQBniSh
	ErlQCkOPPoxui59GQbTj2C3IvaguWk17IL+zywowDxHCDyJmWQZTdNW86g
X-Received: by 2002:a05:6870:21ce:b0:475:a112:1279 with SMTP id 586e51a60fabf-475a1124c2emr15051755fac.38.1788859573175;
        Tue, 08 Sep 2026 02:26:13 -0700 (PDT)
X-Received: by 2002:a05:6870:21ce:b0:475:a112:1279 with SMTP id
 586e51a60fabf-475a1124c2emr15051740fac.38.1788859572713; Tue, 08 Sep 2026
 02:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ede568ada4304d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu>
 <CAEth8oF0__WNz9_gsSnrycP2SYcs_-G06r6TCPCFK2g1N=jbJA@mail.gmail.com> <20260905171140.81619-1-christian@themurphys.eu>
In-Reply-To: <20260905171140.81619-1-christian@themurphys.eu>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 8 Sep 2026 17:26:01 +0800
X-Gm-Features: AcwNN1VMJe3-AENuKA1Yc7GEDYl-Du0WnXCYbS-fow5ZbUKvz_0gtAhw9etlGbw
Message-ID: <CAEth8oHj1Jon9m_4aFzRGoKcdopUMym+MyV0JxTo6F+AUFOLoQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: imx471: Fix pixel rate and line length
To: Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, tarang.raval@siliconsignals.io, 
	jai.luthra@ideasonboard.com, linux-kernel@vger.kernel.org, 
	antti.laakso@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thank you for your patches.

On Sun, Sep 6, 2026 at 1:12=E2=80=AFAM Christian Murphy <christian@themurph=
ys.eu> wrote:
>
> Hi Kate,
>
> Thanks for the series.
>
> On Fri, Sep 4, 2026 at 04:59:58PM +0800, Kate Hsuan wrote:
> > According to the datasheet, since this sensor runs in PLL dual mode so
> > the PLL configurations in the op domain are used to calculate the data
> > rate and pixel rate.
>
> The OP PLL clocks the CSI-2 output. PIXEL_RATE is the pixel array rate
> (ext-ctrls-image-process.rst), set by the VT PLL. Your 159.36 MHz is
> close to the output-derived 160 MHz the driver has.
>
> LINE_LENGTH_PCK reads back 5120 and a frame at FLL 1308 takes
> 17.296 ms, so 387.2 MHz. At 159.36 MHz it would take 42 ms.

I went to the VT domain at the beginning, but after reading the
datasheet, it mentioned, "IOPSYCK determines the pixel rate". I
switched to the OP domain. Perhpas, the datasheet and MIPI datasheet
confused me.

>
> I tried writing 2560 while streaming: at FLL 1308, 6.61 us lines,
> 115.6 fps, frames intact, no drops or ISYS errors during the test.
> With .llp still 2328 and your pixel rate, libcamera would calculate
> 14.6 us lines and 52 fps. The measured stream carries 2.4 Gbps of

That is why I try to set it to the original value 2560 for line length PCK.
Idealy, the sensor supports 2328x1304 @150fps (binning mode)
based on the new value 0x0a00 (2560) (ipu6-drivers), libcamera reports
115.63 fps on my X9-15.

> RAW10, above the 1.6 Gbps a 200 MHz link carries on four lanes, so the
> 200 MHz in the driver and ipu-bridge is understated, a separate fix.
>
> Writing 2328 gives 6.01 us lines, but the IPU gets 474 rows of
> black and flags every frame BAD_FRAME_DIM. Stepping down from 2560,
> 2544 still gives an image, 2536 down does not, and 2416 down arrives
> truncated, so 2560 sits just above the working limit here. The
> 12.05 us bound I gave Sakari was wrong, but 2328 does not work either.


>
> Using 2560 to raise the frame rate makes sense. With your planned
> HBLANK write, .llp needs to be 2560 too, with PIXEL_RATE at 387.2 MHz.
> My patch uses 5120 because that is what the sensor currently runs at.
> Could we combine the pixel-rate correction with your HBLANK change
> and use .llp =3D 2560 consistently? Happy to test.
It's ok. sure

for the line length PCK part, I try to propose a variable setting like
what mt9m114 did.
Line length PCK can be changed along with HBLANK control. This may
allow hblank to be configured and fps to be changed.

Compare to your pixel rate equation with the equation mentioned in the
MIPI datasheet + PLL tree in the imx471 datasheet.

imx471 signal processing rate is determined by ext freq,
VT_PREPLLCK_DIV, VT_PLL_MPY, and VT_SYCK_DIV * VT_PXCK_DIV.
so it may look like
signal processing rate =3D (ext freq * VT_PLL_MPY) / (VT_PREPLLCK_DIV *
VT_SYCK_DIV * VT_PXCK_DIV).
(I think this is per lane)

and
MIPI spec mentions the pixel speed is:
ext_vt_pixel_clk_freq_MHz =3D (ext_clk_freq_MHz * vt_pll_multiplier *
num_of_vt_lanes) / (vt_pre_pll_clk_div * vt_sys_clk_div *
vt_pixel_clk_div)
(19200000 * 121 * 4) / (2 * 2 * 6) =3D 387200000

The result is the same as your pixel rate 387.2Mhz. Could you consider
this approach?

>
> Kind regards,
>
> Christian
>


--
BR,
Kate

