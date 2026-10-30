Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382814;
	b=MXldp7NWgrTrdJIL5D9wFeB8xLIWnvdnD9RMtnXJ+pqjZ3mfHyvF1yNThQTjiHKv36G6
	 7ip/TagY8xvrCFBMqgOtV99s1o5vFr9bTWdDjQh0JbWl+DrpmhwDqfUXUrCQTPFuMz29c
	 TzGSI6m1weg+/sAVV9LG7XDg1SQPjvH9TpQNtmn45mEoPuazBhOAGPaNjeFYP5YbONfgL
	 kawBltl3Pent4JTuHljVFHFyWUiR5kX51bZ3fOmLaHySN4rC3F6L2KAxLtP53XAc7asVG
	 LXJpXBTCzHuTDH6qtB22GeIXwCyIYmUH6U/iW2NJerxDmthR4GMpWdVfBOETN1VIGCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
	b=pZWeLMiIN8qpZeWZEHDIeMpMybXQXfHSw8usunj1KEChUvyvtyw1uGJkA0RbFsEyaVSB
	 7mM7rAYPWQ/ncSgxHh9pntHvoxbnHkAd0OOREDq4/88CLjK1HMNb6SMZDfnGAsLFm8f1a
	 ENp5o/bHJuz0GIIVSpOUrhGgddCFuaxX8+TjLUfeHX2KU23fVVZP1nzCTQqZVlIXwoqj6
	 gbuatPzq+f+aCU+jdx1MDR/6nt+2nNfv2F2E75xact7v8Y3zR+0xWrBKegF8WSYj4OFmV
	 MXNndT0ABeRSzFvaWxctGVxsYwyiz/WP/Ex6IVx9Fps19NLDdvbYigLxtlAROO9H+yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wzDp6GPN;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459F606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2459F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wzDp6GPN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso476123f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793382811; x=1793987611; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
        b=wzDp6GPNHiLA6U2AH7HioFjN2adLnu/BusziS8Vf6kSlEHrhwbvIemMzm0kKiPFGxP
         YKOpjEJ3iWcJcPtubYdNW1O3CYCqd/LJtpY+4jp8NNRln9L2oqAvBOiyWk/4CkW2cD2t
         W0t3wWXlDxm3rVFCyE+mvdlvUJpOV9Ybunxa7T4X37OPTVbA9GcrFaWGquoXTGeK9ApI
         KZGUh+ZPjF13ywQjmcPJ1iOKoMJDyp9/+MjhR3O5AcSLFM9VnRXeiOv1blbszTC5krR4
         OUzaC7FiON6YhQ/+mcI7jQF+UdLxVU2+wHT22EyImkj/X1CRTYtdxEaGOJDenZJBXAWE
         MO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382811; x=1793987611;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1PVTEPEeT+k0NIsjo13PPlcE4G2CKOtf71KBMqhCMg=;
        b=uIe+axoJV8fYB8MBwbcEUvUG2k43nEikd26tBEARZrB04R8z72wAVfhDaYZlAonOxN
         7n18gSANVfsMZkd6nBkdMSmA0ZB2jaULqGCLyjWk0B8+Voaiyqotk2UWyhmHhpTClcl4
         kzw3KfLzt+07Xz8vLjBBfvDbsitT+VF1M+8dFQx2yPx9fzC6tdkpJ+7Cld/3ZZCI2OXD
         gs1xSn5Nfy2N6F1zKh6c/8eR2oY1q6kj6ILWxDadXMCpIDBDLnvUEGaw3xf2DanyANHd
         i02JD/Z3Ucw54vuwFY8Mc50FP0WH7ad01AzJUXJOdxETw3UNq5IghkkzVPrvGjUIujul
         G9iA==
X-Forwarded-Encrypted: i=1; AKwUvBx09cpEDtcItHzAKu/+wKiM5oo3AGbl/mQAUQyQfprLdup2oRAn9nP2R/dTVUG/FJEOObEZctQV9i/uNdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlnF8AyTZ6dpEEFfyiv+mvhA076iclym0qfPLw8phQ+UkJyHog
	FwWXVkeF3Ie2nxfDkfcOpdmV+BCtHSbGIODjQu4/6LBxNF2Xw99NEJQ6O+o0Le7NHqQ=
X-Gm-Gg: AYBFou1OBcZhf/Zy6qIcWIQupb3EgNdcqZITZ4B0Oj7pENTcKxJEOmw7dvjCAhQXnA3
	HSUSd6fq0WrgrHW9g0q/mfZ8cOw7vh/r8iFeWtkMi5VqWW4SvgXyxkegepdw7gEgFeVU2LcxFcO
	53SERLXMa/EM2y8Thk+tDGLSOf8cQqURjFM94mRJB/W2ddLRnyxJp1sU0xTOmZac/3YDq/8vVSF
	6VYMDdgjYFDIKPYtkr25VcWkpwm4pXAkCSt167N5d0+WqIAo9eR1Tc9mkEj7rUhNB/u5mnsRQJ5
	oqXwF9YSRbm9ue1hQLr7plloqfFAwZnde3Jw8juLw7lTyxh+HF3yKrPKC5A9Vgq0o3ybEoZXq3Z
	ojawRgRObwwYNywuBL7VhVXwmzw/Zxwo22Rn28iGjNPVlNa8XSe+iQH9DnnS+p8M0NhdU3vbZzy
	1BHu3rhlqhleWVzqT39BZDeAwPx0vqInX2GbKaHxWyiGnrAI+fpLvYFbyhaRgZyOJIJ6aEsVTBg
	4m4imx6N6lejVh9+hVKjaSKbNytUsr7SOvNUk0hLKRC5GsWjRLv41kWDdb6eZwE1tFSZVc2Tjtf
	t+m4rfnZQTW+CQ8x1dCxu+eezboF23oh/Z5ICUgczn4FIVfQLYvIVFssw7IEsommoCyB9wFgunR
	UGy9jNRH3s5FRdvXfXJDh
X-Received: by 2002:a5d:4e05:0:b0:48e:21f7:79ff with SMTP id ffacd0b85a97d-48e6e50575emr5450463f8f.33.1793382811276;
        Fri, 30 Oct 2026 10:53:31 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm4656186f8f.30.2026.10.30.10.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:53:30 -0700 (PDT)
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
Date: Fri, 30 Oct 2026 18:53:29 +0100
Message-Id: <DMID5D64EBS2.3IDHDRJOWK3W1@linaro.org>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Christopher Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Russell
 King" <linux@armlinux.org.uk>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: omap: dm816x: refactor and align MMC
 node
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
 <20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
 <20261030113032.51b92b19@kemnade.info>
In-Reply-To: <20261030113032.51b92b19@kemnade.info>

Hi Andreas,

On Fri Oct 30, 2026 at 11:30 AM CET, Andreas Kemnade wrote:
> On Wed, 28 Oct 2026 17:06:05 +0100
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>=20
>> Update the MMC node in the TI Sitara DM816x device tree to align with
>> the structure used in other similar SoCs. The changes include
>> refactoring the node to better describe the target module and its
>> sub-nodes.
>>=20
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++-=
-----
>>  1 file changed, 27 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/t=
i/omap/dm816x.dtsi
>> index fc124f9ecfa1..e3d49651b44e 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>> @@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
>>  				    "tx2", "rx2", "tx3", "rx3";
>>  		};
>> =20
>> -		mmc1: mmc@48060000 {
>> -			compatible =3D "ti,omap4-hsmmc";
>> -			reg =3D <0x48060000 0x11000>;
>> +		mmc1_target: target-module@48060000 {
>> +			compatible =3D "ti,sysc-omap2", "ti,sysc";
>>  			ti,hwmods =3D "mmc1";
>
> do we still need this?

No, we don't. I'll remove that in v3.=20

As per the comment for patch 7 (USB node update), I'll send two separate
patches, one for DTS and one for the hwmod removal, making sure the
hwmod removal is applied last.

Thanks for your review,
Ettore
