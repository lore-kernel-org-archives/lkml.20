Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89748125C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962012; cv=none; b=BEoO531BIUtVk86RYfBD1p59jFszvlsGfRzXPL2bPnhp5qS5IU0p0IylKsG52hA2UutLzayB/Quez5vlisy19ymmG60aKs5FC5n/I5aHDBA6UZj3Ffku4rhyqSmqUDzwDqbgCPjaJJr2Dql4odXSbWKJYgN8a2d5oL1/FC5VohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962012; c=relaxed/simple;
	bh=9mrSsHPa4bXpKYKfhljS6kvWhI06svtBMx4uFYIpfjk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=arp4wWEjfmbwrwnYeRFD83SesbQECKYB26zgLFnsxyO6lLoqRMDwyiRVd7Yhyab+Vug+vT6stzVjFHmjJSXkKmNQ1DUbOJoZflP0Kq05SWJjKCknoVF13sVKQRrK8BJNzDwumX09osR/YyiOvtclgItKr+/+3jJ6AshoBVt0hZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p2VCxDwt; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p2VCxDwt"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e36c3478aso95873666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791962006; x=1792566806; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjC7NwRckRsBLSkDSstLxhiqg8sLruOR8jtJeu7RHHA=;
        b=p2VCxDwtL4cRd0Mklx5vTAWIWN0lL6qyf/uwatMmb1Ft6tpb0LWvc1tqF9hzUUMj5f
         psHSrVTE5dYHj6A4n1hPI0geeq9pShLwBaG1yq/gjQsZsMRD3WBo7sUSyWpKqyb4+QPf
         kv5TMdbqYQatnOdRW6Scvu7KR7r4xTYEP2DwX2SNl22wtLzMzBfAuaU5iDZhl5sYqvfS
         4LcZI9/4WuorKbwbL13cfy+pz3FKlcl0BcMIb57Uc4bTaCvpAfZ0QdbDq7QN4cl4zXI8
         UHHsWjhTnGeNJ2WkGE/ZogpHU6CkCpdTdnOoBzmSWVWx+36Ccp8hg9J5MRTSJMY6giSI
         aOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962006; x=1792566806;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjC7NwRckRsBLSkDSstLxhiqg8sLruOR8jtJeu7RHHA=;
        b=yPlrLT7usBAqn+1gpTynjzPmOXtpcSYVrbxA5DZOoLkgXtJiwRyBGYUsHZawA03H+i
         I2wIeLJD1H+pkkp9EcvzX+j45DXZfOIdokl4tcPyhl05tH5wPUxCrW6oMH4TyXvPnQSe
         j8DBIprmKUtm449Cd12iMcNI0ZVpyIJ9OGfnrbxlSBBiuFubz6NCk451HsGa0QW4PNHX
         dglTyOF7nfeeIkkCXe6yJdhZXtHe5wLqFMNO8Fl8uKMdlTTGJ/ouPeXYgJmorVsGP3YT
         Jrx3cq7oU/9WM8IuNtXlqz0LHIkzp3z9XZcf0oI7QeDI8t3Al+EoH+SeRs9xyRw2eSq+
         Kofw==
X-Forwarded-Encrypted: i=1; AKwUvBwRtFwg/FWeR7op5n1RuSRCZXyzh1M8cV/leZOuB85frT/G1KaEDYhG1utZho57aqJ0qgFtkbJyVHsd6io=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvPfsEb4p1kOIYQS6VsVzcPNxyHMsGawESTVf9IpeO844gFKY5
	oBLCw494o4sJeUqOP1IHNTtTWqyuV9MNMD6JsAZHv6O5fO8Cf9wzp3jS6hx3bulk2l4=
X-Gm-Gg: AYBFou0eRvqMU6p7npDI5PB0k2EePoMUBmBbJGqHBiBJXiXt6y6oSn0AGgD5xnbvW+B
	kL2BrBzx0AH657RFMSs+KLoOPM+nICHIiEs0GxObLRKIfz/J+pn9vWDO0qGiyyJmrb4s1yvLjv0
	hSmp9KbjXuJKcmDYUTIIsa7FC2SuGbwZW1ZbyY+DVmhpj1zqQrGnj2xsDLI1in+gX/9brmNUbQf
	S3NFepf2zryphRtWoBFfLyJKCwneh4pI12UlKZZ4bR7ix/5rBitTBNzMHMnXagkXWRB7rz+jCuX
	jxNwnOv8Nv+kzhKwqlayQy9H0cWNBLYhTnKJ2+GB0mBVltA8XXb749wiMZJ9d2SLRjF6SGiBlrG
	FTT/EJ3zzt+gdGSo39RVzXQhmeQjd+QZecJZQsOapDJYHbgEZ7AS6oitXL6weZAC8Wxrc3TMo2y
	/5YgZrjhbKuh4vXp9E4AUVdUTb3Bb3s92CARPkxv7eapFOLxd7/CMLPsTQyZ1lqN4/m4xTzS1uX
	y/7KI6DHkajbq4sG9EGSbjR+sSNr6ZNAB9PsN4WczU=
X-Received: by 2002:a17:907:3d0f:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c31a9ff4c22mr1294994966b.9.1791962005877;
        Wed, 14 Oct 2026 00:13:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34adc25c89sm346173466b.45.2026.10.14.00.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 09:13:23 +0200
Message-Id: <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Douglas Anderson"
 <dianders@chromium.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
In-Reply-To: <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>

On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>> > On 10/12/26 8:11 PM, Luca Weiss wrote:
>> >> From: Jasper Korten <jja2000@gmail.com>
>> >
>> > [...]
>> >
>> >> Signed-off-by: Jasper Korten <jja2000@gmail.com>
>> >> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
>> >> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
>> >> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
>> >> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >
>> > Good to see the Lucas are in agreement ;)
>>=20
>> :)
>>=20
>> >
>> > [...]
>> >
>> >> +&usb_1 {
>> >> +	dr_mode =3D "host";
>> >
>> > Does OTG not "just work"?
>>=20
>> Is this a feature one would want on a laptop? On a phone for sure, but I
>> don't quite see the use case for the laptop to be a peripheral? But I
>> didn't try it, the USB basic setup was done by Jasper
>
> Why not? It's more or less the same set of usecases: USB gadget device
> (which can be a networking gadget, serial, etc).

I can give it a try!

>
>>=20
>> >
>> > I'm assuming there's no pmic-glink on this device?
>>=20
>> I'm not quite sure yet how the USB stuff works. For sure from
>> observation, USB-C only works when stuff was plugged-in at boot time
>> (UEFI?), and charger also only supplies any power (but not actually
>> charging) when plugged in at boot time.
>
> This means that something is not 100% correct, for example, missing EC
> support.

For sure some bits are missing. This laptop doesn't have an EC per-se,
it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
of drivers handling EC-like functionality.

So e.g. already for battery, we just talk with the sbs-battery directly.
I assume this will be the case for the other components on this laptop
as well.

Regards
Luca
