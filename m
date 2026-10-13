Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F44ADD80
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872371; cv=none; b=cp6xG7YQkRPW80yUlO0rgU2+OmeVHGnGoZ6rOHwJPQPR7d41UFv4UArempbqToHLPjMU8xe80rE5cusmgwyZuYikfOZ3cP9BzR99KAqX7QoEzR0h8yQs2kjXRFqVO/s4sFswm1/TwQ96LxUHpF6UtVAD8SvX6JnHyahGkjcqkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872371; c=relaxed/simple;
	bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kzYaXlyTK+7FH7kbovzWzCASudaezsK/HLzV9ESbs0/YAOIyR1/h6fVbr+gDFLfW6Dr5IlnG4ld2gpdnx5trcsnN3jfkfcdndVis36zqqdTDQNphOMq7y0WpHy3n+29u0Y29w0mCQJW0x51juXD6wPqUEp+vBXUbiqubs59w6gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbL1xaE0; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbL1xaE0"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a9761758adso21175821fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791872368; x=1792477168; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
        b=PbL1xaE04in7+jpadT5vv4XsPrLGsmHW6kyB9iz8PQDwf96/u/DXaJWdu29dYTlyF9
         NZbLX1dKT/x+8Ytz2pqiGgvgqgwgCjixA8l5nH765g1+LagEKlPswnlv6StrY7Okqa+3
         NJAUXZQLIVTuv1GFoyna/hDWRx8mfzCxU+C+OPWXAgO/W+ISSuKJ1eOSc6EakQKRiavk
         uL3BfSp/AzfObP+6GSbocPEpuf6l1KSCz33IM58WLFKlx6ZFBGB51xtyi6wO/N1BSKJK
         eH+agbfLM4OkLSHIkdWK2LX/WkeQX6Ap4C3ThmkylXIdRmc8ZkmiXpR0of9tyyCYmLgs
         IFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872368; x=1792477168;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
        b=kF8HRkx9NOe/NoZL6F/MpSBW6Q7DZPPXZ8/3pKvHfTTy3Wz9mjL7X/1USWBx/f5jAR
         cw07MQ6xDgLSQgsYRLNcRaAaOHjRsSrnAZrPIsvjPWPJkIugboy7xqffr0SC0iQbRyCT
         3sBnmMKILm4lY1pU/aRD+AKdpnOawYHmpYrz1+9A28vuPdW2PMiY6VDLmnK2B46saq0t
         6pmCSPXwwPMlSe3Rg9ILNGsyH8wJTXxzyueWY5/O+HZuC2fcET35V4pJnC7Skc7nVJPi
         r61aV9RoAoqAeBKszPiVTyQ3YI0mlEXgYbI/eXk7IIfd6JDYD/jEjIP3ILZYFmYqvaR4
         bbTA==
X-Forwarded-Encrypted: i=1; AKwUvByHH1kjj+mqOCg8aJHYniV8zUCgH0P/cvDYQAXyHAeFhILaqzg6ySIZ7wM1qSGXmAB2dNqeHzXUWImOh7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK902vWU8zOYDXPD3GaJL0ahNnuuONNHMMRgOtC+SGTYAuMDEa
	41b1TcSp+5lhdLSK7TpWaVBvzKG8cxDQC+Houj2MhkJ1oN+ymtn55rYd
X-Gm-Gg: AYBFou360s2GGlpYTg5FfNXfR2Nwt8bcw/p3a1hjnjV/ZZSFcBWdiXI5nEiAo3qnXrX
	XGCux1+i2bnBwZzvyYyAxvSlsZx2KbQgvcgHBCGJPCh4EYgPnQjTzVd68Ft6RI3TxODxyvicoKK
	uvHP6GaARNq2HZFOuQfiQkxuQ391PhhXnwjcr10WiaUgk0IJqG1ctiMt2/9MkY3BZhd8EDH5Ic7
	k7EWnMJr0Md0eCAaLPDqHMVQB2rEIUjwHcvicpOwfeEmgdtCPHdCzbXZHaEmxUwXpvkC+Xk1zM8
	ZlEMnYzK8Zt/HvXMjZfUyLBs7Lm/TLtAcU023XdqHDq4TrHrSutm0GJgymengWL9BJhinPt9Xtj
	87H1OTHdWuPOPAdd7mobo7yCja+3zbKdgksPawxptc9stirbq1WZtNl0/9IyzoVwAZHNs58OGfX
	SCCNnVFKMDU6kvbcf1I9xvU0V38ABGGZSJTzohzmeWtzG8rwfamylE44BFW/ry3tmrIqUNJ6UHf
	GUEmR1K7iLNZoHrXrZGHwW4sUEQXRE0+jCZ36qnhsDXjieskM2Tv+9NwA==
X-Received: by 2002:a05:651c:211b:b0:3a9:7425:7c33 with SMTP id 38308e7fff4ca-3a9c570c4a9mr29246931fa.28.1791872368005;
        Mon, 12 Oct 2026 23:19:28 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9bff8sm33912331fa.7.2026.10.12.23.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:19:27 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 10/11] ARM: multi_v7_defconfig: Enable Cortina Systems
 CS75xx GPIO, I2C and TWD watchdog
In-Reply-To: <abe6e89f-2379-4928-a77e-0baee12b23e4@kernel.org>
References: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
 <20261013-b4-cs75xx-s2-v2-10-94f8c0a90cda@gmail.com>
 <abe6e89f-2379-4928-a77e-0baee12b23e4@kernel.org>
Date: Tue, 13 Oct 2026 09:19:25 +0300
Message-ID: <179187236528.3113952.1605165361017352112@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 13/10/2026 08:13, Krzysztof Kozlowski wrote:
> On 13/10/2026 05:47, Fil Dunsky via B4 Relay wrote:
>> +CONFIG_I2C_CS75XX=y
>
> This should be module.
>
[...]
>> +CONFIG_GPIO_CS75XX=y
>
> This as well.

Will do, both become =m in the next version.

Thanks,
Fil

