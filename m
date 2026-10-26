Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034522;
	b=jzcOCXOkI4lNdhOSlpGNufifTRRsIK6GGCfxc7Q3AopTKraxoYX3Yu2giO10g0x0WHt+
	 O/sBla6G5X+cZcVbYBGYhqEbkfMucL0pRkswhYH7m+1CRDmcxJq8Ct8mV3A1GhWi9ZQlG
	 ANwnu2z8ZIF9sA3atdM7YoUPNArWwdCQ76C0caxrZc7sDWli8vAe8kW9+IUF1kCZsXTgi
	 M9vrykVwdfUBFbeqCwvreQD4KPlNSj/QW53uk4EHfIiTZOmcMPTV5hqEV6wYHcN4fO4VN
	 /QxsJrve0DSEtf4ITrXIiUol6wSsItj2+7cDR9GAY1N9XhchgHh5aD5XsSVzWw6d6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
	b=VpwcuxVhmHItQe3jk+JPVnJfG327wirj7yznrfX8s7oewxV1L0bpM2rfd25Npdl92kwV
	 yq80nGjKkC4lcjDzfKA9US8LEKU6/ky6OesUAbTSYgUsYuOzKQwBcUKU3yuNgzP9FZcji
	 RQzZRoxLhPkpjWTUiULmN5dONRoP7M0ldusMSuUNu06XQY8rjuuTD1sh5j8wlrkKkOehC
	 YuDD8C0Y76BJAYT8EKvXD2DEE1IEcJqX4QrQ6P3sVuuHE0agC4k3n9qlBy6UkqrGbXWJA
	 Ml4JnNCZKgRBPCACP6fJOT5nlKHnxfVZsSlHoUwfyZ/zDwbUxVXVIL2QmKsAlq7m8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Imn2WVeJ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A26606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A26606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Imn2WVeJ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so24928305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793034520; x=1793639320; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
        b=Imn2WVeJmrsTcniPIqa5MczKk/j0HQLC5R50ZsdY0tt/KPGgosIRsrOYx5CjSAKpCg
         sUBCaMHuKHtTEabCxW/nZHVbwkoUsi7CiUzDGWAppSDFZW/Rqi/35XGKmoO4C22uCRTs
         dNOmXiy12f46t/57YuL9TTcLH4h1BJnkQMeMp6zIdvLE2Vh3uwvwI2GxuU6YRQzem5TN
         Bxk/CojGBw8QhkB0nnalb+Fn8e3oifdszHpxNFWH7CoOgjH8lS1TQDpYKy8b2F4aypXO
         aRWt0jL6SoxN0Wn78lEPFZmBCaMtN11bbCphCxe0QfWvSKr3kuYrD6VvG5GifU/KGxvh
         0Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034520; x=1793639320;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUq0YtB31WFdvPytox1Nrwa4F7PRUF5WI/cc8sTZd0Y=;
        b=whfMYohssypYLe7RT+sDy//7EowPeZSKIt3wrvQV+Qv102m3yvVx/SqOnLwkP+IC/y
         rXAXup1mbsXgPB2xsJ+bHGK+USVHCrKS+xnJedVxHwOYAqPxDdSlDykpbgmqNg7mEthE
         VD2Vtzio7IOG9B4Gh2Gj730SIM4b+5FydCiGdx3Cn2zGaEb4RASd4icmoG2NckXluzLq
         iNqiyKO1OWmk1jNic+7GRLKQNJ/7FbSOeGKwvp1XMoPg8op+zmhy8CBt+dTqv23I3+VP
         hOwSKndDZcj1LRQwqYd/PIPGxgHfgtp6g93cMxX3RENwnVVarkvvcTtODveQasEAQpkm
         0X6g==
X-Forwarded-Encrypted: i=1; AKwUvBwhIu6NfS625b8N3UnqD5JA1/5w0828zR1L7wr2o1UvlpicNYhrUzMMnegbA5oB1veAlyuEdc9PanBsDEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYILGdLyK8BhnmPksZhPgWvw0O8O+eXnkB97efU9Hg+ufvXA/LGo
	LioS/53Fqx6cL+zH2ld/ArTIaqZeWFTLwYJ5IGyNCn/9uMP7MCG0PZ9BAGNW6zXM3PY=
X-Gm-Gg: AYBFou3v9yPUhBWzHVh6aliv/DzWPT/3Fslttsbv/9YwD3p3irCHn/PTLh8lk8WPxTR
	hrVYMYO8IDsbLPsiHTcosVaRSnw45xJ/3sv+PRz0EDbBjund+YIjl7rPBurKhLQg0R1HKaInhVm
	rMH7JtbfxSb8xRUo3vU3C9CjTjycXsbGEmTrv/k7trPJogg9aCw5hvhaqqvqGDT9+MTUk3g9JR9
	xvry9nZbeA+cq0WdaHpUuywpc6G+5GAWxkv1wwBl21PmOtW/7xqmSkWQ/qYIr+YBVNhuiPEBAq7
	zRe9fVBDAnV9ZGeHLTvMIHlCbMftxDNSUib6lwahiO7qeb5wbqAEPUDjThoSlHd4UI4NrJzwKPS
	pj2v2B/q3V490CaMT256JJ6VYygtBFJC64KfoIwq/JnEfRLBFsFYL9jBn08VJBE1oijVRYqRzJd
	OCmV62uvuHBHgqoC+oWndS8oxC626Bu3STJqt6GQlmOe6feg/VUl/g/RZ5OI9yNWojNOdKnvAzU
	PQmRPaw9d6bLiSCg0deS1RsgUu3rMLiwE4XuVh7bQBux91r52bE1asyN0P1cy7kL7wUXYOf1nxL
	zm3VoNzya6lvrJtRZWLN67Z0njU+1gQqzEx7mAS1xlkTur5p
X-Received: by 2002:a05:600c:3f07:b0:4a3:5a91:5f64 with SMTP id 5b1f17b1804b1-4a35acb3e77mr124957225e9.27.1793034520264;
        Mon, 26 Oct 2026 10:08:40 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm17070976f8f.2.2026.10.26.10.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:08:39 -0700 (PDT)
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
Date: Mon, 26 Oct 2026 18:08:38 +0100
Message-Id: <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1:
 Add PWM backlight
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: <ferreira@se-rg.io>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Georg Gottleuber"
 <ggo@tuxedocomputers.com>, "Ettore Chimenti" <ek5.chimenti@gmail.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>
In-Reply-To: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io>

Hi S=C3=A9rgio,

On Sun Oct 25, 2026 at 8:51 AM CET, S=C3=A9rgio Ferreira via B4 Relay wrote=
:
> From: S=C3=A9rgio Ferreira <ferreira@se-rg.io>
>
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.
>
> Brightness is driven by PWM instead. UEFI leaves PM8550 LPG channel 3
> running and the PWM output configured on PM8550 GPIO 8, and drives
> PMC8380_3 GPIO 4 high as the backlight enable:
>
>   pm8550 gpio8 : out low func1 vin-0 no pull push-pull medium
>   pmc8380_3 gpio4 : out  high normal  vin-1 pull-down push-pull medium
>
> The panel configuration in the Windows ACPI tables confirmed this.
> (PMIC-controlled PWM, PMIC 1, bank 3, 9-bit, 2 kHz).
>
> Describe this with a pwm-backlight node: enable pm8550_pwm, add pinctrl
> states for the enable GPIO and for gpio8 func1, and attach the
> backlight to the panel.
>
> Tested on a Medion SPRCHRGD 14 S1 (X1E78100): brightness control over
> the full range, brightness keys, suspend/resume and restore after
> reboot.
>
> Assisted-by: LLM
> Signed-off-by: S=C3=A9rgio Ferreira <ferreira@se-rg.io>
> ---

I tested this on a Medion SPRCHRGD 14 S1, but the controls are inverted.
When increasing the backlight lightness it actually decreases it, and
vice versa.

```
% cat /sys/class/backlight/backlight/max_brightness
4095

% echo 1 | sudo tee /sys/class/backlight/backlight/brightness
1 # BRIGHT

% echo 2000 | sudo tee /sys/class/backlight/backlight/brightness
2000 # LESS BRIGHT

% echo 4095 | sudo tee /sys/class/backlight/backlight/brightness
4095 # OFF

% echo 0 | sudo tee /sys/class/backlight/backlight/brightness
0 # OFF
```

Moreover, I see that from `/sys/kernel/debug/pwm` the period
request differs from the actual:

```
 pwm-3   (backlight           ): requested
    requested configuration:  enabled, 498418/500000 ns, normal polarity
    # with brightness set at 4090:
    actual configuration:     enabled, 425834/425834 ns, normal polarity
    # with brightness set at 2:
                                            0/425834 ns, normal polarity
```

This probably causes the top 250 values to be all at the same
brightness. Not a big deal probably.

Do you have the same behavior? Can you send the EDID of your panel?=20

Thanks,
Ettore
