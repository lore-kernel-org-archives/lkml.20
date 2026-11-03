Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723442;
	b=yqPEHbdDJcmE8Eopr4is7xn+6BkMSrb1mFer7iHGLr2wSRowz0sOc+30SjQC95kmBeN+
	 gQW3dld3hYsnWEZdolWsu5x4g6FxRbVN7dExo9m9ihD40FJn4VVgHRTx5cv/9FKtQ0siS
	 eKoDEPoXDHbQw3jEeqwi6jyA+tl8iWGtsrXR/ZnGE8DeIUjbCowBI2CCyIrCWdU55zRVs
	 w8aLKjM9Mj1P7vpVw1ka2LmpYhTwZJC+5XCNLAcEDU+Jfmful+SLckwldUwk38loLi6Y/
	 yclnlKa2nZJCdR+pT2gLI+fUXxOuFc6n3bgyBwkjmrrrDpv90e4jHj8DJDqQfTbld2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723442;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QIKLXmDhQNqLB4Y+YR2V9D04+lvxRqYL6EpEyVAWUjQ=;
	b=meHtBLnNTfKAJF9h9cxXNROWAeA8bX6Odbw9uXLAHnkLjEmpGI8VonWa9K+d5W2B8uCN
	 doVz1a7yAWkBCHL8emgSIYvi+ShpzAX4r6Vgl/L0yWSuQs2zraYC8XFiXElv5SGe3MZLT
	 lS+BDQOmHhFhI6oEkslrWsl4M1zN2LfrMCvldA+U+emid/Q7d8Zml8Vykk5+jSTqo4oRU
	 7S/3ZgwjcoiovGRohWpb75k7W0pK5RO8gkAG7VLyzCIcg4as+Jm23FqVFVmzIIEEb2tQZ
	 ySPgUelOKpsui0tJfn05CFJKJ3GzFEb042712Yufucr90ywPEGIYALU86XjNUNcv5yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2F606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C2F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b06c0794cfso40633027b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723441; x=1794328241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIKLXmDhQNqLB4Y+YR2V9D04+lvxRqYL6EpEyVAWUjQ=;
        b=NMxz5nT8j/27WNGBiDwAl1YGZAWu0kWFru49cJU7Sar9zS+Emix7+PFSNHYN42SNIH
         0IXQRntYOV/InWvzj0MhyG1FVyMTPHkMY6UOoZlvFlQ/Cq0MiHdSvp3/LahNGHYwBsaW
         Dk5QA69wUuKCYHTUXSrHkc+DLCFBuvcnVlFmrTFdnFJ3X+iBAz2J5yrX7or5tywKhdkw
         1/tmyHZmVEjjiFWHFoyzggEmJ8FLgFUaxUEyVqRoX8Yr+HtnW+2654tu7Uefpb3YDn1R
         LQ8Yty/GUBrMo7n/wy7VpX/B/7VIQS0c9ZOrjznKp5aBH1WKPftgFVk4HtOyd8LMFPbc
         q13g==
X-Forwarded-Encrypted: i=1; AKwUvByBTzt3U99Gkif9M/sd8umDssiulQt8jgzppQnCfG00dK9a1vIQ5MH6RYB0DJbgLLqTKQF55vcIJeJJ2KY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QxOpHE+mKRMx+JxAruMgWGWUaHiiM05MGdrfLPxpYK1Rd7St2
	g0hnE0pko7cmcVy9Wpt5PDi+qie0IPu0yQu18myQwhlDVVK85uWIjtVVhM0onIVyayI=
X-Gm-Gg: AYBFou0etVEHZIZlukcbZK/tBAOUlSbRWN2RLmRHc7am/MOUhQ/N9nIDLjB7hoPVvig
	PG6pUYvN484bgZN2+VeL4WlYincdz23Ia7doSNrIaxjVYP69D/vdrIA7q2zG6TSacUKLT2XrZdM
	ungdm/7CQN0JTPZicA6nb0QoZPlQLnTbnDlCkgeNTpZceVd5CpgmqtooR2T3qOayCQ72WEKXQQD
	lW45zODCiodn1gM5MNNIoFSlricqXFakd92PA0BW1L7Zx9xwl2t99nlFR21W7n9fE0uc9MA3FXs
	fm9cxo3AhqwABA70QSLiAZNdkpj7FZFSnAFMYGmatC0iYbKAsjX1u6gCpIHrmaTQSLneYG3dqHv
	IeeOAmbJ5UCpbSwMG1S91KmDFhTbmCYF+ThnimJB/SKL8R7aHoi6Yqmn/e5yNMT7eS4BhygoDcm
	X7PHgJQ27xPRv6LakaRTwRtrxBiqgKiSFBm7X6Hqy30zEZtERp2xwnBNqAwB1HY8RpWlRImHmNu
	rCyVdUDrjXscN66dY9h5qSFkU9L/3wNmwdNBj68/itlRIpo5Eokllxokf8iwR9Avf5S6b6nVkTi
	Mcl3iXdLYlEFYEGf4YeaWf+YshDPLFivmhsoW2+kDQvAkh5ExS5+7sKzNApNlGvBOMjI+1PEb6b
	LQATT1GZ+9gqKYjjYwAEMNQ==
X-Received: by 2002:a05:690c:e28b:20b0:8b0:de8c:a3a3 with SMTP id 00721157ae682-8b2b67d7546mr73839537b3.69.1793723441162;
        Tue, 03 Nov 2026 08:30:41 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c27c3sm176357b3.9.2026.11.03.08.30.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:30:39 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b06c0794cfso40632407b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByWHM0K5x6s+FIZae7cb0BzX8ORLegwXdAK27e1zizzTqTUfbxMX4meTY8ihPuoyIlHm2F+7TV8IOL8pOA=@vger.kernel.org
X-Received: by 2002:a05:690c:91:b0:8b3:2b8:856 with SMTP id
 00721157ae682-8b302b80a2emr8226867b3.68.1793723438403; Tue, 03 Nov 2026
 08:30:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-4-tanure@linux.com>
 <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
In-Reply-To: <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:30:27 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
X-Gm-Features: AclHuK--tXPcmW4jBK-98mKvizjMAJUNc7lOR6WXsrVb58UVKvwxXzerIoleZek
Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:57=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Without that gate the controller cannot do DMA at all, so it is
> > required rather than optional: a clear probe failure beats an
> > undiagnosable hang later.
>
> Does the DT binding mark it as required?
Yes. The T7 block in patch 2 lists the five clocks as an "items" list
without minItems, so all five, pipeline included, are required.
>
>      Andrew
