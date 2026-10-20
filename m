Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524415;
	b=0h5fKcgHsQGfz+966kzHrp1iZ9D+5apLiGfUePPt+X4fQ/i4ltZ0IlVrLFiV35o6tsL2
	 Rc0u7RhLo+roXVJniTLuc4tOcorMkLal8cJGfzJuCsWBjMOeWUhwgkVnvPJKx7Ti91Flu
	 vWztdvZ9a8NnGfp1sJM8ZpCwdJAQWyOFrQgn4SCKExO69c7YBmiaoNnlrwcsC5MK9xiz5
	 6ghoyxuCAsqXh9OTsWoXH9+Qkw09M/7cSB1DJJqG41Vgjc/RpqfLWgqMPSqaOEIAjmQnq
	 s+9rifGrV/JjwOz4qalbcKzW3C7h0CsIaOnoqAI+N9u9pFmPy5cg6u2h60yd1J9U6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
	b=4/exxnFoMHXVNQr/plzE/yiPOBQGKRYIDgQ9LenoTt3YpbBO658kmgfCMd2r5Ch/c+TC
	 EeJBWoXZOWoiexYw5m3fAtUNi8/HczeMxt+9Fcc/E5YH3I8ySUFfOwMNGrljE1T69/jHz
	 Vud+cUBjKK4nQXpIYKJbUDcz1Z5OwgWvASxQtdE+JEFAdvWPKsL2gTxylDZ6znsmFKiVb
	 mOQwQ6ig9a6h39z2XcvJFPtFvnjtYO2eJdkWN7njjh8QCv6R/1mKrofLy1K5jfITVq+Pt
	 XJVFkMQqutrdQvKlaZNmLiF4NI2kIbS/muLhejWzveAbUpxsyKzJsxodN9mjQeOQlaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso35885265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792524402; x=1793129202; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=Jl3W+NiVjzOLdc1yjvnMCh9KK49lWbGu6oFGzqG7xriQpMgUNfgDnSELLjjnSsld+Q
         2nr2+cxfgJdMkbp1xdfIDSUoNLkZFWsVkf9QmImgUZuCfto2aPOm3W+w6HldIJjHopuS
         kJHW0wzuahUKrihedWLGnL/YeixpC19vTRpVes7GFZO7yP9/Y1EaUK0NnJuWBkeXgUTu
         qhyEaCyP+UTryz51Af2O+HRdCKl6ZP2e6HzN00CnWbUJToTzorJGY8BDwh6X8Ewx0Xsd
         +9fcrNUTZxOxQSjihUYqcWPrYO5+Vwhx8L9WNh4eqevucoJ2I/14iEPBdVP7ywLdTPP0
         8nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524402; x=1793129202;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=wJPyFPg+7EHoWHr1QmTHnBbvPenYhz3msxFBSXx4DNCsi/9/OPN3ivh7zTDQ9Iubd1
         sFIh0nKk61bRXj0smxa9FwzAvkCavd2flOOFstQWAJjmY4hywUIaExLzPc9bK2z8IqOC
         C0xbaPVD2pCdHn5SsHHAYfjGfi3Cuvr9B73ngtJpfzTLCeK8l8ZBuo8RmVFUdqS8IBuD
         9vQANEbyE3CsH1ndTp5DaDEThRDpZlhVofz8+onkRNVncwkAi4nInRzwXOjdUeP4xsNe
         C3ayaiuZThz6TniAdlkYMpYhre96wVexIhxnNF1A9o8nuBYoIakXl9hs5F4L04CGf32s
         cOHg==
X-Forwarded-Encrypted: i=1; AKwUvByquEFQrqwriFzOgrdRYSDY8+V8M2lG3IIO29K05mjWhmjsVEI5I+cWa4/c/vd6yNyLkTIgPe171Fhps+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1TdaTaM7YTjAJxfOATq3nzG26JpupAVg/CRZnnk0ojGePuXRu
	9AgcNNuukx5RuXAgynwJ0eKlGQIY2Bvh8ywENuZhPHjrOjfOIGO5Br7+uQVXxCRGTus=
X-Gm-Gg: AYBFou0e64omx0c6ZTBMo8vCyZAeb2sMwwjr6DfnsyOJKvufb/DtpC+dKpR/rOLATUE
	yQRNNN7bKMZHhRd1hTNyXrwI0IIrBEyFnB/13CXwGPLXnQep29gCc/f5TJku6mLSjQrVPv7Jexs
	6IJgLhl9T3nn/MjPir089LIx19eq7zisLjGVNcIMR9FMjgTdbyCY95qB1uOqKAQZj9quKFkjZoI
	Y/blwPeANDuzkWH4pjyPZUiy97/BLgck2HP6BVeJVHSl7IpHspqFklh16pozHVhahOKe42qqM/f
	aYRJPJ8c8Yn5H6ALa/Hdwm+7KOQ6SHmdXIZhaGQxFwwUKyMoTIm9DP1S3BcsPr2GKo5djtxvNt6
	nUpjHBx5zcV8A+tcANtlEZspFdb3SHqLtCrrq/8VhiPkh1Giet4B1nydxWDx1QolAfAHPbpngxf
	4HyFRitsChBMe4JIqzHfdwh/JBsxJdpW8VR1OCnSkuZ6aAudpm0pA5/KroiPqKzXe+qi7ZIszgx
	tdzfE6RbBtqxCeWjP8JYw==
X-Received: by 2002:a05:600c:c119:b0:4a1:dbdc:b2f1 with SMTP id 5b1f17b1804b1-4a1dbdcb405mr180375035e9.14.1792524401827;
        Tue, 20 Oct 2026 12:26:41 -0700 (PDT)
Received: from localhost ([103.239.146.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm846135c88.5.2026.10.20.12.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:26:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:56:30 +0530
Message-Id: <DM9WV4TQ3JAM.2KC03GKSF297S@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
In-Reply-To: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>

On Tue Oct 20, 2026 at 1:03 PM IST, Konrad Dybcio wrote:
> On 10/13/26 12:17 PM, Luca Weiss wrote:
>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>>> Drop the output-low, the consumers already take care of the state
>>=20
>> For both enable and pwm?
>
> Yeah

That seems to work totally fine. Will include those changes in v2 then.

Regards
Luca

>
> Konrad


