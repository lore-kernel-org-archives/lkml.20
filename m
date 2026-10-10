Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507737DAAD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791670455; cv=pass; b=Tl6fMC3fj81om8LhSkVh8QZ5qwf9SFsjb23j9CjuREl8TlM2Gjz2Xhp3JAFqm1gsoSps8bcE3f1U6vdaB2I5MFXBIh92aQr3UjY0aw+sgiQtgRYPNIIKKDmBH2Df0Rb+parXH+qOyhmOqZp8f2XNu4p33nG43AZS5s6ErKRA/84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791670455; c=relaxed/simple;
	bh=CBxiUJ5zCN5x3bulAKsga+lnv9YLj+R4wsUCpY3zfcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5lUTp8L/n7avbIMHhModkRSxaEw+ZIC2AYpAYuP5Jzp09FkqapTnxqOcwKW1g4mwC4FxOVx58qgjTe0QM2OtJ0T1QaEU8QT2mYtJPJlxNz3BcdTtSSQL9JFlhffzOcKF2jJDUM4X5W2+aqhfI2cu2alxDkTX5IuxjCJ6k9Z3Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=LMJDMsK3; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LMJDMsK3"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-677dbe051d4so650853d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791670453; cv=none;
        d=google.com; s=arc-20260327;
        b=Ln1//Wgt+QNSLIyavr0VW0tQM5zkCteTUce19/60K9p10gefC1Xxdvdmf9oDw/1yZS
         2GQZG9wWnOr45wysddD4ID4/yEa9/9f6KowirQqj10PogWhVLoK5Hj7ukxorcxyZHdUo
         QPmcijZgROMcySJcp5SsN9NM8VOPMttKSakhHvsYZTowbE4+5j4OVO98SVtyQlBe5h5P
         8iWHyGV4JOkkpLjvqHZ8t8m1obAiehlu7+1/qB12PPwZ17ZtNU1xbD2u7WB//hdx3KIE
         zL1fgFDwKgVfQEHhgzlVYcQOU9mcGtqcTjftIC2FWVxCAf04ZQ7R7P8RN4MQr3MUvmvS
         tmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        fh=3k3lPUmX9TKDT8ldMbZWAggauuJcOv3tkJnUEF/v8M0=;
        b=GhFcjd9RE22tVRxlxLHFMbR1n5CNmAoQbwI4eBaM2ceT4wKn1anMBIX8x++rBoywVM
         VemrGwRhOardqOCmLu/hpJSmQoAFxEQDeKziIsjcTc+w160jjmdAQW7D0NK0gPjzBvuY
         chOcoyRyJCZMEZ61aZ3H70xTvLcX5T/lM1wyWnS8tVWznucxtjAqWSI7kKNb/3kblIBY
         fPZEfMwFDujFdPV8hKuxKz51G9M1RBTfut3QVbiPdpoQpvvA3kYkWOF4HtH347JJWeMP
         o+J7Qrh2UzNm3+zADdTqWSWnbt4dcu9WF+9AhU64TiyC3IV8OxGpyK2Isxmd06TcWLhV
         tGhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791670453; x=1792275253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=LMJDMsK3242JizWdooZ9/eHhzyuX3Ai2xdG4ZnIknTQuUyKJuboJyIIhzPlolYIjZm
         I0UXMG2rmCsMMMAyzXwgLbUvjuH4Ei9dUQFr7T0vdnRv2xwzZXZlw+xx0YFyYPh0iGqo
         vePTnFi++VpqeVW1y+l64pdfF4t5R/nC0Ry92eyL3BHP9ULB9hyGCCgyiwgXQm6Q9KSN
         99NgUEMW3ke8b+ZaN0apnZPoEtO3pS3VItx6Rchy4KUCD9OWO2oUduq+3OEnA1vHqFxa
         AvgDgZ9ULBHgtnB52ovIxiNuTVWfSKJ+bFeqpSmTsZqD8nyknnIcVKfzmAx3fllieLBP
         XvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791670453; x=1792275253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=q5CzngKk/QPdAU4H1TCu+PUFklPt6fmShX/7RgQg5SIikKpCJVjhHU236cHhClROkp
         2dk8Pzslwh4cpqOmAaZ21R9sH66taTcaFA7sIhBCOWUkXHAy7Nn8U9nEp6zzEL31/obK
         FbMmQe4nPPvgyO78HCT7HURM6B85buQaYNUsoEahkTJK2owLZkOJG9PFxg82fYn4jG0w
         4MM7ABua7peKogdYMB0zXTW6YW4ij7jzRYpdi2UPtYaH1XgNIIAuBJnm2BVokYpUNXUl
         ninSNK9Ua1RxjCQDDI2B1Mbdcuk0XVIPq/HAqkiQjQ6KzMNTNq1OaZmIQXWocd4kuU3O
         D8pg==
X-Forwarded-Encrypted: i=1; AKwUvBxqfeq4zaiZcjeFENfNLXBTI7C0Lh+4UOVmRyMUsz/BT2Xy1XZygpH4Nr6pCqgl2JG6Lv6WEJJAjkOAUqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAW1TLP7n9paHNZHm86SxBn6BbmzDWvfdfa8U+96372uOGDDjj
	ntLyYvv2rcno3tPKXKEQLK7KKULRDh2iksZZo1yFxmmrEG/Z/aD5RVvdxmGMb1UEGIWe0W8oEMr
	CkBlT3d2nz24jyVl5/QsHr9EkGEZhIPA=
X-Gm-Gg: AYBFou1zC8fN1mTQSP4pNteADu7bDVQzesnMh2Y9IoR5W5SWu+piCqglz+vwKFQV42c
	OxNIMFSWSdBIC/LliyhrhDZPH63kJqgiY9yyZYSrOks9XF/DOPMdXaOiG1JNofvY3ILmRLIq3X3
	DEnfaV5qkE09WMF/4VhNJbXAXZT+mIjt9Qbn94FRzELD9lwOuKlg/IsW9BNmFNmgcrE6qchoS4o
	B7TTy9yHbQOwoNuRBe48zAhl2Q0vztRypyPHdoAwFteZkTU3hlukBOoMAScNFk+XD9X0ZMuz983
	NAjepJicPTHm1RecRxLLJIJQ8HcyOlK1UT/P81ZxHZNh2YyyaS9cEdk8uumMfvDD7Cyqeh2FgcG
	qzCEQMAqfWgSD
X-Received: by 2002:a05:690e:803:20b0:676:9240:d69c with SMTP id
 956f58d0204a3-67936275489mr1125092d50.91.1791670453112; Sat, 10 Oct 2026
 15:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
In-Reply-To: <20261010105900.247342-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:14:02 +0200
X-Gm-Features: AclHuK8gB-tkTlpSxcPTOLR3EaTkCZhRdAGo-iA2p3YlqPx-9RYK-GDsrGLBxVo
Message-ID: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +        # The TX delay is a quarter of the RGMII clock period per step,
> +        # which is 2ns at 1Gbit/s.
> +        tx-internal-delay-ps:
> +          enum: [0, 2000, 4000, 6000]
> +          default: 0
Is 0 a valid value? Let's say we have:
    phy-mode =3D "rgmii-id";
    tx-internal-delay-ps =3D <0>
    rx-internal-delay-ps =3D <0>;
According to patch 8 this means: MAC is responsible for adding the
delays - but it doesn't add any delays.
I'm not sure if this patch (removing 0 from the enum) or patch 8 need updat=
ing.


Best regards,
Martin
