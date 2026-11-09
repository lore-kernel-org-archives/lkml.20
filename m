Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239104;
	b=2/jfFBzSE8BW9h4s2pqTjYKhf9gfBQO654mKtjDM273jCDeuHGkgvMWL7eKcCpU2/18X
	 BnYH6sL2DNs3d1CA0T3z09LRRxePWvio0Zxqz8Y1J4gUJe+3Q/07pHWB1ErNL1tMZCE0I
	 p6eFsuSJnVyWlIMqPdIQFjy0pyyp2JVMKEdKez/BgtayVpCxEgxHjELCEvgJ6/8speAXr
	 Bz4JUhvZTE2pvHe1WrRwmVPz5WXSTGBBrRlNgul/ixxfNeqr4voksMH4SfUkNZtBn9RNH
	 12qmNti4U6a6LF8mFUw0DebEBzEyD/ydoysxdnSIaTFI0NmZxAGgKnXDq3xV3EDBXMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
	b=5ZNKovGj068U2TyffgLzpFHYKFxdsihj9qFS7H+m6raPuZ/5iKZYDUl1G0+7cjAkPOOB
	 eyAonKL+rdqeOZDxlAGRCEZPZ5izx5LsuSAD8QKs/OXno0k4IutT644PzGncp94LqLH1g
	 BXRXbNhp6dSmdn1B2lTPpAbJAnA14jZ8A18AMy6tv/QNT0mMMoUk5PKXA6/5oYLLKZK/H
	 hcvnLnwSZOg7wPVS8jey8MMa/3TXkfKEt+NGLf7TfSsJdDpvWb3f85PnNm2GFw4V2IRuP
	 JZvv4eR6BO+zAplOugi5Y/l2l9b35Zz2tpAnna9LskJ43yanmKTJoiqjKwzQq/KXozw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVg0Psww;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26628606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26628606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVg0Psww
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-372bdb942dbso1411230eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239103; cv=none;
        d=google.com; s=arc-20260327;
        b=fbvkzob80RbujO+80bFG8EBh7AAMYTFXt1HXQdZTPwMG7KHl/vZSBMWqBMU/Rj0myz
         pPgJjg2FYny7Fr+5rPomouK8LfU1uWIrt0fP32B1qdeOMnGwjK2dPPzwv7TaS6mN/FnU
         TLsYtZ9QuUIrGMCknk3QZ3hw4WQbyywED5XaAKTXfdK1RNBw0RN1DK2/RUx7hcSp1H+U
         DvA2FY10aJn93R9EgtbpGybUJlvR1eb2GdN/SrO4+Hk6a+5lpQVRZBBCZfwGNfTar310
         0odSDZtYSq7O32hxqQWz3ucV345CbQG7oGhLdfWaT4qRZCwG4MQCIsjsHsq/bDxWzqVe
         9KaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        fh=Zx1sz5ZptJ8WzkUy2yNlk+gCpHxxHmM++5GD2fgxBhY=;
        b=FHbER21RMEChJKxB2mYMaVgXzM5gSRH9R6E84mMILgLzld4uIt0tXHlR0nCtoWVou0
         4RFhl7feig96mWxQN/i49yLFA6K9StVq66aDH1fVyB3KXYBGZutcHUSqknIrQzc4g9cd
         q3yhJ0hGtNAqRQxyqwmP0Riyloh4lRMAjvptehk3t5jRfDCp3Ywsz4FUh08+NMALvyNu
         mIFIpFHovvWEaSb3C8mmSdkGYU9NZaOv0YoEitdlJpY/DSWgkoawV4UVLYRUg92Ib0qv
         O+0NmBTZseg+WwdDTf7YU6ItjRi6MDQg3IlC1wUv8lEPLAc8SL9SxE9nSghYmEGwpr1a
         K8Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239103; x=1794843903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        b=aVg0PswwY53Y1ZbhOKWKHq6I+XVXF2v0WHXI2GLYAInyhgZSnU8LjDtFdZ0fwFLG2O
         BbTWxNf9swnT9aecxdK4u+PqIeiGLDSG9E0ZsabQa6sVoxE/Yq1Wk8+VQHrZjpWX5yRD
         kDTz47x/FAWWGk0lAw1jS3oxEXLYN7G6kB6JBR9SLxByxp2HIbvjOnLzR9mGs8M45TIz
         qw5xrve968WQEkpFD8sR7lCRvqGmOy+7njy2OWI+YuM3P854nmGS3/GSrO0jglZMCQKq
         uyfN+ExQWiOS3NN0qPVvh2PcqOEIE6LVw3qm6wy5oHPpwNOhE5teY005tZFWTdeO+Wpz
         j4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239103; x=1794843903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        b=bW8QhL67ZYUsfubL8XeGSrmyspXqnM+F+CmNwvcPipDkmGr5pEa6E65h6Qr3TemjAp
         27S8M6if7ceo/PW0mHC/IT6MAJGNnUCAOMHJvLHo0VgtDzy6YsFehkfPkdO8SqB0Cznr
         A4m8cWgLrl8kKwYbDj+Q253Egh60Utty8hfxtc2uTbndVbRaGphrk3+Cdv/0NcQl+5N8
         fga61oX2+194LKoeDgwYFIezCVucZmjiXAlTOupHGawtKA1Ai2av+ZN7riXijyfj//cw
         L7RcOHeFjBUdrhxFN1CO0KX45JYEn51b+J5X3sgh+U2VrxpdD6Xs/bwiaKogfxL2MiXw
         BH4A==
X-Forwarded-Encrypted: i=1; AL+hErE0FVjh0dcjOSRggPSX6t24KGXqzE1fVoA+i8UayQ3eFPHetSMMATODKF1EEow6oCrTGwSKqYgnob69jeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JhvQiKrLOxWU2Lyd6p/zfjIGNL4J89W+cEjFg6+63GSwLD0pv
	qxZxZw9GuqYfHw4I+akweiFxXb03trwqg0ZfycHdSpHR/y1wzgU+Km4FPEfGQ4gubRUOq097pfk
	np2nHXK26J3QbZy5oQc2fzHXZHkkPf88=
X-Gm-Gg: AYBFou2kMPK8mNvYVE0wHLFRxJqUIAyOzNPIAM0bpWBHA+V1Jnl9abLNDbCdKnG40XR
	tmo9o3y/FDiSTL7v1+l4jLEnBpguvphFVGmVpAriASEGU8Zb6W8LoJMeB+8BHC2/RKJhKK/QzE7
	hYjlh7NMkg1rPnj7/Y9JOZczd8PMpP5ahRzfrUBS5QzAn2Lx19ksJ55tCd7tkZ/au6TWtMMlmLy
	WyslpE0muLJ/Pa+WEn3LhvCWOuzEDyPAo33qaY4mgaSGnAT7s4DPmzgEEXh7k0+KzXe4zVnSii2
	Qyy3gU/zbXQsuV4LlI1xymRRk/LoIVyVyUMqWMJk2ilzYo4OyYmg/tRunE0s5lsXQbBXKcI/hNl
	3GByBY+aGMP6voBs7ysvL8Ii7swowDMEvEoHwfQ==
X-Received: by 2002:a05:7301:7004:b0:36c:9b35:5d46 with SMTP id
 5a478bee46e88-372571d9ac9mr8099191eec.26.1794239102976; Mon, 09 Nov 2026
 07:45:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108212826.15890-1-oo.hehir@gmail.com> <20261108212826.15890-3-oo.hehir@gmail.com>
 <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
In-Reply-To: <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Mon, 9 Nov 2026 15:44:25 +0000
X-Gm-Features: AclHuK-AhO-ARD3koIln2PIQIf1KmWM7RSd3LNIFnaM6Tz5301_ColSop3oW-YQ
Message-ID: <CALp3LZ61ZYcWz8CPQZJbJSDfAt7cgyyqA_bp+Gwhyr2peBVwKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rtc: Add StarFive JH7110 RTC driver
To: E Shattow <e@freeshell.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi E,

Thanks for the review.

> Is this copyrighted work from previous year 2021 being imported without
> modification?
>
> If there is modification then I would assume it needs appended your
> authorship and the current year 2026.

It is modified, so v3 adds my copyright line below StarFive's.

> Align 8-char tab stops per Linux coding style, and then tidy up the
> extra junk clearspace on some of the defines

The values line up in the file; in the patch the leading '+' pushes a
few of them (TIME, DATE, CFG_HOUR_24H, SW_CAL_VALUE, EVENT_UPDATE) one
tab out. The extra space before some names marks them as bit fields of
the register above; as it reads as noise, v3 drops it.

> I note that JH7100 does not mention RTC in its datasheet. Does JH7110
> RTC have any commonality with JHB100 and if so then would rtc-starfive
> be a more suitable name for the code filename and module?

The JHB100 clock and reset bindings do name an RTC clock and reset,
under its Peripheral-2 clock and reset generator alongside CAN and
GMAC, whose inputs include no 32 kHz clock; the JH7110 RTC is in the
always-on domain. I searched for JHB100 documentation but found nothing
on its RTC beyond those names, so I cannot say whether the block is the
same. I would keep the jh7110 name, after the first SoC supported; if
the JHB100 turns out to use the same block, it can reuse the driver with
its own compatible. That is what the pending JHB100 TRNG series does
with jh7110-trng.c. I would appreciate advice from Hal or anyone who
knows whether the JHB100 RTC is the same IP.

> Review use of authorship macros as appropriate. This may be okay as-is.

The driver is derived from the StarFive one, so I kept its authors and
will leave these as they are.


Owen
