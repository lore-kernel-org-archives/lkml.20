Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118324;
	b=2Jdyan8UGUILDXJefZHqdnK/X6aYN2HQ0pE2jZVXZdUkduWBbmsdOskf/7BKKwFllua8
	 Qq8VBJU8F4m7UBuPscdyv+jt9chleT2n9S00xox71bB7L1cTWG5OFvHgKmm755rir9jme
	 1jpUgA+rmW4xUaewKbOaSJC8M6yTSC1UVKjAtjuhgvER+NSze5GErxTQz66OLDp6bPCcK
	 Emn4zAQlHINEu6UJM892DTr7zyEI1VTPE/1/lHsjxLQTkf6GEeeUwcfH5h+iGxucemZHB
	 UB9cMunIgTfSZEQwLGczi6bOPy4QQCpGJIHDPlHoD6+0/+rohGnbmPKxGh2nrJkzTdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
	b=tHG0Hcnrn18WIx2JoqJ63LpwwOCdPgaJ50J4fwz3B76Hzs25/UumzCNyI+ADTA451fvs
	 kmVPK9mWvgUvdZcDJpyHy6SPcJHbzek8ZjYLgTB02ihTWQC3ghzRWPtPTdT5oEY1Njn1Z
	 1GfVC1zx67PVNr+3d/5fhei0TP8NOoTBMCT4jVEeWUE6hnfiAVJy5lVvXipX2p6SNJVad
	 J+CqqbUc/nfIH0NhmOYvq3auvFPIfb46LWNI46KKpZRMb99qQRhSnEeEstEadDHJ25B2s
	 F/eAxKr7audNW7uXDiD3l676QhYIomOx2QiATP/H4ZAcRDvOXIucrUxxO3YnMe0t3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xkNG1gDk;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AB9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xkNG1gDk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so403515e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793118322; x=1793723122; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
        b=xkNG1gDkHvSeaYokYpCIMabsoJLB2gKcRtGLwY0v1E5SdrTFQ2jsMcEI6hye4sIZ1k
         CwMn8il+i0oHtEIf56W0WaHs/1MQG0TV6ii9yRa4CHLkjoOGGiAn21PBz1ndNpIwtNYu
         92oTZkFxvnwsifI5TsEfN5KN0dLhddDbhQQwr6ltLY37olNHbYRt6cEKetlNy0m7huwG
         Jjb4fEZ/usyu8Y7kZlccK+8S2Z+CMuLHdQUWD3/lSAOBwELvcBde33jNzBFJWQy3jhze
         i39PMlQKSEL67fJg2t8SB/E3hdBkDrEYy35ahMLsiS01nvk+9vxhEl3sFm6xAs1Z0JEi
         cRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118322; x=1793723122;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
        b=K8BkUPDMEm6sqE5rp4h4j/oe7uwPkTRD5cw9CD8aLuHjpOrULu8nEWp9GfYNpidyVb
         7ViqH7OXq3pCV6Q4BW/1M2qhbN6MiNbs0sEBGa3e3bTUVCMz8xnZ+w+X/V1VZoD9nZOS
         bD8rw4LujZeJuWOLbwTsoPmeySYpnw9ZTwWDMfmVXzQIfhpugE5jWuqXF8DyACFMuUFx
         cyu3SVUUIosNZ6C6qbEz5g7Dym6dJgB+W2WreWaa1pFCloH7Hu2b+3LWHqDsmA0kIulj
         +zvjAXQM9TGBr/kto+yuUTYu14ReWyXHb4N711f5r+vzMHsmxE/LnKPEj6FUuJCZH0/Z
         zF7w==
X-Forwarded-Encrypted: i=1; AKwUvBz6Ec5SREpK+xflfNi0lWP25kVhfg47QhZ0HtzTsHk/5XGPqKY7xLlg4wiEd2hQTDzSPkBklvyX4noE0tQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Iqg9vcWPD57buX3fUUQkT2Ssx6QtxKCTGNk9cVlDwhfzKU42
	JRicYnOV1vme3JZMjdUSTi6ySpJNJr2LTTIY61geDwbYj4fjNXr6vqM57lW0DIsxT20=
X-Gm-Gg: AYBFou1Hp9rxzi/5TybJxtKCOkdXg9egajLVR/REha9bxCiN7v5raECpd86u8rI2Ry7
	BTobbQHM5EZcnX99vhAtVUDYNpNj3a2dbU/A4DENB6EnzwGwLwPeEAeNqFcSRLP4CgWDqUraJnO
	iNEACURFyxjKd1K/eX9r9uBefVTs3hHvFl9/SFYzMwlgLRIb7HphoZpiEG8juO+9dwqkBKawPZc
	TD8egtHZhwVDiBK2axRTtJIpAjUTJdm5gw7ls4LoUjZvrmiw4gH7J2GCIiBvfQzDtVkfcYSg2bM
	wx9TrRAaVx5BDSR5EwIw3jHJ0hum4pbcYA/oG/guiRRLRlNgjSJICg9OPyqxOi7SJv5dk3UUEcS
	CbcJhlxEAwfbf0qFA3YNCG1Nyh92p1eaOishugm8gfv90o7KI/olqJnYT/Sl2DO0/fhtdUp4M6q
	Z5PMoRx0QcHVirsfAWppMFAO5/L0Bj68Lf66NGRGz/nsAhnsZLhbo+sBWFmHSuGxMknIHLRh9mD
	Q9hJhQHUEQcwoZgGWrH3quq8CB0uUy+CLNb0rSSqYUFHN/otqXTwaaYmKdJ6NvGyxxQ1LW0Iri7
	qKgBrcYEoE4Toa8YF9AbatJUFLriRCuC7Ye02PZrAhFoe/ySFhJfa5wdrcXh0hLEZ4ei
X-Received: by 2002:a05:600c:1909:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a35ac95fa0mr188333205e9.16.1793118322543;
        Tue, 27 Oct 2026 09:25:22 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a931232e6esm80005e9.13.2026.10.27.09.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:25:21 -0700 (PDT)
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
Date: Tue, 27 Oct 2026 17:25:21 +0100
Message-Id: <DMFRE8PRV4MD.3DSSCQVOLZTIP@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1:
 Add PWM backlight
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: =?utf-8?q?S=C3=A9rgio_Ferreira?= <ferreira@se-rg.io>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linux Arm Msm"
 <linux-arm-msm@vger.kernel.org>, "Devicetree" <devicetree@vger.kernel.org>,
 "Linux Kernel" <linux-kernel@vger.kernel.org>, "Georg Gottleuber"
 <ggo@tuxedocomputers.com>, "Ettore Chimenti" <ek5.chimenti@gmail.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io> <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org> <P4tSXlD--F-9@se-rg.io>
In-Reply-To: <P4tSXlD--F-9@se-rg.io>

Hi S=C3=A9rgio,

On Mon Oct 26, 2026 at 7:26 PM CET, S=C3=A9rgio Ferreira wrote:
> Hi Ettore,
>
> thanks for testing.
>
> No, i can not reproduce the value inversion. A brightness of 1 equals ver=
y dark while 4095 is maximum brightness. 0 is turning the screen off as exp=
ected.
>
> Here is my edid:
>
> ```
> edid-decode /sys/class/drm/card1-eDP-1/edid
> edid-decode (hex):
> ```
[...]

I have the same EDID so the panel is the same. I guess my unit has a
different circuit revision.=20

>
> I can confirm the PWM period value mapping is a bit off for the top-end v=
alues, though I haven't noticed that in day-to-day use.

I agree, not a big deal indeed, I see other laptops (e.g.
x1p42100-lenovo-thinkbook-16.dts) using the same range.

Tested-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Thanks,
Ettore
