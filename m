Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751995;
	b=FLfcmjM1kiPts+XHDWERs4bVX316TSTgPYFJS8DB4+4pldTNdboGbysR1ScIB+r+ga/j
	 vMcdKzEjaafVW9/C0JoOR2wUqyuby1qF2f0IofaKWJVsN+hbWs5kFM3QMzBwRSzHbF0cR
	 xofYnjDN3DQqZwHGmqvZTeGfznyKURq0wgBfoQSWtkDXrJvc0Sl53H1fhHQ9tp6itFp/6
	 8vqRtFcKdcf4a+34l0vOuMZvsu4/MxpbC/Pyw1tlq6CdJHT1JOzee0JlPNr8sLNOr508p
	 F4lb/MEoLvYPnbpoRiyiWhVEidvoImdSPVhmUtI9z7bHbirbsbPBDZQHwl/ul0XRH7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Organization:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
	b=aKdANuo055rjJrP3IkXNJuz6k9pwbZyERZ5N/ldXWh8QQlQ8c01H4MXpJsD2YAZSRP02
	 Epvq82vwdxa5IerylNM5A9fBhYQMh4P6mcVScpVgUTuqE0F88YfngPffA2OFuGI9oxL1K
	 4bJj8TdRK/tsmFMgN4cUX9d5mqo9R3owMPB4q6BRlOp4qReHw/jzNIYyqAIGYQJmzw0Zv
	 Lix5dNtN8zdOcrasvo+xsM6JkSouvbh0Pk7AOzbJVcw4VCx/9tXcfBmjpI0Ng3FCZ/cCW
	 isKUZS8TKBLVPRIXvERqf8lA22PCtoy+xThFmZkD+3EoqA57rp/VaHhKTKgt6CdTcOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrhlYS9J;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE11606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE11606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrhlYS9J
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e011d370dso581398f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751994; x=1793356794; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
        b=QrhlYS9JPq7JnApjBXfRmjqqe4dNo2BW1dKZxKhsHlgdnG8+5QiIsK+sTo8d5NTrR3
         uWL3U+s6CEPmNkiIqq8g2iq94WIayXCdetnfnmIzsQJ6Fb0WzeJ88NN4n7lAwX5pKl1C
         YZCnwU82I/rXc5kk9r85ZYypjhDys7+VJfnim8KgFjDHVq/tDqBu6h+JiplR2skAxuPU
         EyxVXPRizn3ISu46j7omzgg8DbvKCwxcC30/pjVcFjQ9HkAGMWBAN/xAJ5yu0MIi1o3K
         VhhP/x12m9ZrTl6La3MGoRKwN+cZDV/qqKuKyENAmh6vD6S5wXAZEVaGJiAq8ERCgAXX
         8zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751994; x=1793356794;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
        b=KT1QuBIoaD8vlbIiiYjGrlkLYqiWaAJeYwrJSUcbTjHL6EAUrFMn6Ffcg1S7/mdP+q
         /KNR12sOR/vXvba1cg1jiE+ABxxnXG0vdbv4l1p7Wpk5kDwdnKMbyer4y1hXYv4eqgD6
         UkIfhmI7LqIA30xSHZfO4ARNHHCyUFFob0CscQqur26kD5G5LAssp62J3bpUzEkjhYgH
         gcXbI3PbQrLmiZPP5FUR5b9wypxy9uya6cMqU1acLp6odBRAjwk64+QQ8f/cRZSw/4B6
         9ZB6cw6beNf+iuzQvLck9fO1aEcviQs5+Dq+QMETOBt3+qRxO61PjBQ9EYFAnQWhL/zG
         pfUg==
X-Forwarded-Encrypted: i=1; AKwUvBz7les27kdrFIKGnp4N0NIcrUGguQtRaM4egBgdVCxLElVYjG9NinfTIO1J9LViomCneWnsoUJ2HlLKcJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrkwdXmdkv/eypr4K6S61sFFkopTGLoxOEfwhuTbtplUah1PF3
	ebcNXgKuRCX2lFrJWip5sb07dO8frCJNY7saivqdBV9DCQplEbiKLox7ZD2CuaWmTD4=
X-Gm-Gg: AYBFou0RITSWbWl2ZlBwuXL/iouBA5HLAZOM57em8kB2Hc2x57bO3mB5mlspFsRE4aX
	CefSRjgFvE1pPb2rfV42wXv15SJopSP4BvJsww0B1bnHZJlFWZhwEksdFrbyxkoWIVNAf6gp1kA
	yxk4WtOtWPfGGUeaO3WsRJv5j1Bzu1BnrDXM81t0iyOJ52zwRtg/weT3ywdXYbOgcBP9Miv/qcI
	tSTQkggI3IAKlVgGGqxn26f5FmGw6Wc9aZmcI+5JMNYJFjXl9Hqu52nZ3XGjufV+CQN+Ke57uhj
	qPhBKqL0Y4a3wFAnFTaPPEX7fKclm3XAomyroD9UUJLb1jzpsw7GveKvLEJunYQz1hNnKrSX1nE
	DQHy8DlfygS2esRTqMCZnwidasx++M49x1rycbkehCnH6894C/bbZLesI9o26LjFYsEjBQ59vOf
	BrVGURrRRJnKvL5UB5/X4QjihK3HCRcoJMBfHtoBHJ9/5UlCPle6+gXDa5cM/7UNFb+qZ+aS5/f
	xdUWz0VFlfOnNoMvgvE2FSRPtS03A5mtk+lacSGeOawNgVZDCOVOKzaF5SCXJZ7+xJ0uRXdGcJW
	aJAKUXQO75Q6G8wHTgqG
X-Received: by 2002:a05:6000:186c:b0:48c:6cdd:ba89 with SMTP id ffacd0b85a97d-48e385bdfeemr2784852f8f.36.1792751993862;
        Fri, 23 Oct 2026 03:39:53 -0700 (PDT)
Received: from ?IPv6:2a0e:439:c2d1:0:bce8:4acb:ee53:8d19? ([2a0e:439:c2d1:0:bce8:4acb:ee53:8d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce4fsm4566663f8f.6.2026.10.23.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:39:53 -0700 (PDT)
Message-ID: <0bb53b3f00e9a1a834e32979bd1e08ecc4517411.camel@baylibre.com>
Subject: Re: [PATCH v2 1/2 RESEND] usb: gadget: u_audio: pass channel counts
 explicitly
From: Francesco Lavra <flavra@baylibre.com>
To: Kyle Farrell <kaf@nwlink.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Fri, 23 Oct 2026 12:39:51 +0200
In-Reply-To: <20261016162534.384844-2-kaf@nwlink.com>
References: <20261016162534.384844-1-kaf@nwlink.com>
	 <20261016162534.384844-2-kaf@nwlink.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-16 at 09:25 -0700, Kyle Farrell wrote:
> u_audio currently derives the channel count from the channel mask in
> struct uac_params in several places.=C2=A0 Instead, pass the resolved cou=
nt
> explicitly, so the shared audio implementation does not depend on how
> an individual USB audio function represents its channel configuration.
>=20
> Initialize the new channel count fields from the existing channel masks.
> This preserves generated descriptors and makes no change to user-visible
> behavior.
>=20
> Assisted-by: LLM
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>
> ---
...
> diff --git a/drivers/usb/gadget/function/u_audio.h
> b/drivers/usb/gadget/function/u_audio.h
> index 9512b8fccfaa..46e1d6b5ca4e 100644
> --- a/drivers/usb/gadget/function/u_audio.h
> +++ b/drivers/usb/gadget/function/u_audio.h
> @@ -41,12 +41,14 @@ struct uac_fu_params {
> =C2=A0struct uac_params {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* playback */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_chmask;=C2=A0=C2=A0=
=C2=A0/* channel mask */

With these changes, the channel masks are no longer used in u_audio.c, so
we can remove them.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int p_channels;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* resolved number of channels */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_srate;=C2=A0=C2=A0=
=C2=A0=C2=A0/* rate in Hz */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_ssize;=C2=A0=C2=A0=
=C2=A0=C2=A0/* sample size */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct uac_fu_params p_fu=
;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Feature Unit parameters */
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* capture */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_chmask;=C2=A0=C2=A0=
=C2=A0/* channel mask */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int c_channels;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* resolved number of channels */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_srate;=C2=A0=C2=A0=
=C2=A0=C2=A0/* rate in Hz */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_ssize;=C2=A0=C2=A0=
=C2=A0=C2=A0/* sample size */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct uac_fu_params c_fu=
;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Feature Unit parameters */

