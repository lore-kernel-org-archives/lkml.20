Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699650;
	b=QvAlsyUgMEil2wga5IbpCXVGDD2rWkevoqcRnfJ3zPHgt059SEuzqpenBRqvzuIzoS9W
	 ecukD8IaiO5rvtwxbZCimb9GyW+Y6gKTt3l72oCFC/7VPqs+23cS4GrhJpZ87mWwu1EtY
	 YEIOLr/lgAvyMITe5beRNZSGZh3e8iZZd8Xbgpcq4j9F5nGcvT/+Dd5dMX2Yl94XKLtAA
	 Wuabqbdb/3F09EGEkTTiC7ZRWeHMiy2Lb+UlfKCOVnV4SvZtYX9q1rKdGVNM6pnLbSyyW
	 qrWwcdsCjP5wIJQNWDOyPLxG1IKwHmV9LcREwvC6hhTgptakI2FwTuHcmyVwZ4s17LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
	b=WX5qi6eleMktspasdOyJMwTEffmpZaWaAbuYbbtt/x9F40JyAg/blR/JeL4AoPBS1d50
	 mtLMy3oYTft4QhDsxms2bR3B4vkbQHaRVfSXevPZhsTTmJdNi8644wXUQqhfffnZmW9m4
	 waaWPSK83MG4ipR6iJZvaYss7/aI++IKoo6fE9qHOmjIyvJtHg3dqD8T48cOy5li7dqbN
	 LRzRxO+cUHPo5JAM/ge43cuFg1Ly1NU6l6fSaksJqgfTeRPvROZ3/U9eW7ByRsN8+xVth
	 Hh2G0pySKk1GtIycH0Z7G74+4tOQ7URJdE/06pgWEwWBTkfIhoCkpYnjDXNJ+rK1OMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jZJT+PdP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51613608361F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51613608361F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jZJT+PdP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so43882655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699649; x=1794304449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=jZJT+PdPgVwRinT+CDR0jIBGc3lqnX1N4Uc9p3VDByFhs6i1o9TT7sl73//ryHHMTI
         kabTaPqWzXXh8q589otNlLe5IMBgqetkU7ggfbAvreO7iujd8TSkOUTf/uFm5kNQoWRg
         YyKrZYonvpffja9IG56eSVfBTBBD9LKP3VPW9RIq5VejTAGCWp3f4KZ0eY+8wpvDM89b
         vFoivhiiS67bre6dajMFVH0nMg3xPPhiAEbmJRWRytdoPxTPWKypBfH/l/usHejD+XTf
         jC+TUWHJ0qi7aq6n+2jxe1+SMFUrlQj2ylD6hIgE6ZQQCB0LajDEraJ+tr0iRN6uaTiN
         hb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699649; x=1794304449;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=vqDlrrQFFZOQ5lM+BWPTSKZ6VVDg/NMmaakn/zMS0B/cBm5mhfovaGW6TBE7HB0pTS
         iy6MqbFJ6gfiUeWa3SEAbCR0jGuhH3OxBkUe98rwQWJUFYF3zUA0c10P0UQaCkFcBtMf
         H2Wv7cTjv7hOlKTMHYtQbc5h0hrLTZFBRl+PSON6DEB5cH9j5r0QiJFV09bYNtOpcB7s
         wgW8qeWL0J0tikiRPKNKd6szuJrnqM1X/JevA7SI9LB+Sh0eV4WL003yTzczJRY7knUm
         ZKjeS1jfC3ieq5PvsL3FlZvCUK2p6kzAfUh4/MdX87j2AkPCjOGVWJqNQGb5vT2gBMBW
         b3KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbZx11/+DpSDU7A0a3GH1n0ulLKtqY6/Rh811NCSg4FQSjHttvt8q0VzpR5aJDI4yx+C+i+IywyboTnhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z++EO6bk9Pl8XEiAYtgNp63xq9RKTvVYJ2raWINuxrGkkNEMaUw
	beqdKZo9HC1IEOnmgz8DIGuLvGU9Ripl97BB9B3bycdcSo0XAsLpiY4jEEQ+WhWXQ54=
X-Gm-Gg: AYBFou2hJPFhHGPAl81okmwlBxie04WFIra4X2jLBeiuztmqXkvckHIOAOyKv6YZcfP
	Tfb1RBnbF9vluzCDv4mmyw16fDuwEhbLQFkteifMhWWiSAnFIRwUtruP/OmbAtCdQ6suj7A+Nzz
	+8Dd6ujKhH4mmJiW/al6EPVnOIKoLCwsyhhhUxMsvCDxIpGQ0n9L/o7H+pe2L9CydswIsYlNCu9
	2JQJsB9OVe6SGG2tMooWh0UOwFwtjJ37sAzcFSRNs31f+HsJoQc73fjvFWswXHSjOhx0iRDgpcf
	ao9IRksBjU5Q6f7+XkWta1kxRl9vPJyEwQpWoTnG7uAWiTJB9WQgunahV3IIAx1NrajBI3phlDm
	ZTO/0lkCuzT1Ua2rZhihY2vx4FwNy1lFomWsZfMcwEyXyu8PPwdgwvVO3Ck3OtNJXmrBRrzstns
	O83mhLeZBpT5BfxXfFXUbJKRNO1ZdxG9g1hYTrAJhDOtvID59Y492z2OhPTvGLOODVPZB4FVhc6
	DUwE80RVLX32sM3Bi4XvNGHDodcVMW3wMTBdwNjfuZKgErAS/eoD5oZoJBG9KOdVEzSXWdazBzT
	zWp251btc/5ow3m+BUgpQxf/LxN8PTpTQBo+VbYLuWNjKpvx+JA=
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr276506235e9.28.1793699648696;
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the
 fan tachometer
Message-Id: <179369964799.2330120.9043967618143448654.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Tue, 06 Oct 2026 19:36:17 +0300, Igor Velkov wrote:
> The fan connector routes the fan's tachometer output to GPIOX_7, but
> the fan node does not describe it. pwm-fan therefore registers no
> fan1_input, and the fan speed cannot be read.
> 
> Describe the line as the fan's interrupt, and mux the pin as a GPIO
> input without bias: R109 on the board pulls the line up to VDDAO_3V3
> (schematic rev1.0, sheet 31).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/1] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
      https://git.kernel.org/amlogic/c/81e55899e134541583a4e611ff750e1868671c67

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

