Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1948D4E06E8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839301; cv=none; b=E0B7zIudUzTdjy8c+Zp3isI2x/UmMDDyNLTYB44OfTME/v2PVzqskmMfLDai6rL7+fTJhVJP/DJdpn6WAgTMrMcm11h/HCg0TM3hAe7si9HtDnYSFschtOqyKDeMb8vPGhJRRs9updVH8d297Xly4S1Ro4cExywmfUmdsAY9M9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839301; c=relaxed/simple;
	bh=BODH/PDG1/mEjAzfIXwGyZaoRCgBSiqwtAvUwN/rUG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uug+y5wLAfE8ebzAgoBxu/DTtSVrR6xUni9t6x1HU3ar7FIOck7UfBfIBxz7xUK8MMEf7x559aTy0z/apxERTwwSt37vUK9zCteu1u3XW9UCjdyI+oO2Mb3m3/JLEPWVGYYWjiKZg0QYZSC9E1KVvMRoaMG2qd7VDyf5N5FwI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/jFpb3h; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/jFpb3h"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bccc96684dso450889e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839298; x=1792444098; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BODH/PDG1/mEjAzfIXwGyZaoRCgBSiqwtAvUwN/rUG4=;
        b=O/jFpb3hEmI7g6+aWcDqLODjJ7Uq+dg6o1uB9dW/FalkBqXvQAEyb+pYrIiA4thBIV
         qgFRduez5CeXwhz0mCKb9NHORTWyCoF8xnM8UbG9hdaOdN+DgBAukNasTPs+PixDvv+X
         8UEszMsbNhvpFFtssYJIFQTIDwFyE6x8z0saEuDRgFP7pQ/rFdVyVqfnqap/tRD+pFNf
         2FNwKshkB1aex1FWLykegfvigibAZlnXe+ZkmeU9D3J7PVIycRBnhqmfQxCj59ARk3mi
         fM6LJvBDY9mbQ5gUtgt1GzUa8NGD56xvcTVkd5dcyt2CptDsIMESdOOU+UKlfOJCtavs
         2BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839298; x=1792444098;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BODH/PDG1/mEjAzfIXwGyZaoRCgBSiqwtAvUwN/rUG4=;
        b=dH0ImKcoZv2ru/uj9VJCJ6jMMK/D1niHdsuWSLvl42H/lwbYe5p99jiRyNqn9ANk4A
         An8/7oU544aE68moKQ5HS7Ve6dQAmUW0g3U8ebKkqCwB5lwxKnixKiFczjxK6yw1I4j6
         BmBMkZUtNyn+lqUlotWc2syfd8QGIo1TH33rkAWUVj60cvXWnPdd+JJ8BfpC6vyBx5Vw
         +BSyUfAnfhcqTKbMHpW9xjDlvFA25h3nt8hn/agfHCQv8riWfHz9WhC544npZuBgqXyY
         eLievJIlhd9iG5oniz9guTBtduuW9M5kR8Mr/pREdANKWbLtWbNVB+CDBDmQUdbpsvlO
         VB2Q==
X-Forwarded-Encrypted: i=1; AKwUvBworLCijwmIT/SiKKwB2n4GtNRY2lyWELTtb5G7tk2A2qC/MUQi9e/ZrUoB5Jphrs29GIoadj9upN6aeo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7B/yqYxkkaty7InePJE9hGUubSNDor0Nt0QlQaUltyDp86T+d
	tqfq+m9O9vWpznS84LTiQ/+Z5g1N/bGB3h/FMm1QsNR5PZD9JphoF/ua
X-Gm-Gg: AYBFou3iWGO5CcHhWWh1/9ZZ8itwLMq1QpJ+9zyuBJs21s6Mfpb0nqPDYYTX6NF5oZ9
	SXn/gFmZ8GExzVSbGkVAYaSmDxoYFWdcZxN/sFQb3FwXDSKut1ICYnOkF4Y09yu66glqfPYvY5C
	6Rc97RDBZf6W/914GZv8nVYlkaQ1L1GDq2edS2lj6si5GvCxbGkYF66OrUmyZIE8MRnnArEatFu
	6mU6+pMjLOH0NXMht49i3ubXMr5KJgTbTwoWSwf0lnuJw34DtiP1ejlf2Xym3gOYq5VclVjZ8wI
	ZfR717JqAzIPl7AvA0V+JwPLpvs0I19yMHmL0SFt/tShjHlDTuqN/0nrJI/tKR0nfJdNEmXr/xR
	DAmMBMt8tnX38b7kIsBN6N7Wds829gZ6J9LdYT9XZof6z6mix2d4Iay2efnWS7BHQbHncqN7GwB
	+yf7+eGh7hJgjP2my32/G2TFV7n08EPjnTTn7GecjVsmjQJc7MkGoRHEucwusCXUeIQrQbaP6n3
	CLMf+aNP8bXWP1xP9rQmo2Mw3mdUoat97QOrD5FoT6wSNEjLGX4jcdI
X-Received: by 2002:a05:6512:3e20:b0:5bc:ddab:b793 with SMTP id 2adb3069b0e04-5bcde8cb6d0mr3744622e87.53.1791839297959;
        Mon, 12 Oct 2026 14:08:17 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddecc3d7sm3083561e87.81.2026.10.12.14.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:08:17 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 04/11] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <as1Dl08DwxOu-boF@monoceros>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-b4-cs75xx-s2-v1-4-8a7641b7b79c@gmail.com>
 <as1Dl08DwxOu-boF@monoceros>
Date: Mon, 12 Oct 2026 23:57:33 +0300
Message-ID: <179183865387.2445720.12278001692808149938@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hello Uwe,

On Mon, Oct 12, 2026 at 10:32:58PM +0200, Uwe Kleine-König wrote:
> On Mon, Oct 12, 2026 at 08:32:59PM +0300, Fil Dunsky wrote:
> > +#include <linux/mod_devicetable.h>
>
> Please don't include this file. It contains a plethora of defines for
> subsystems not in use here.
>
> > [...]
> > +#include <linux/platform_device.h>
>
> You can rely on <linux/platform_device.h> to yield definitions for
> of_device_id and so drop <linux/mod_devicetable.h> without a
> replacement.
>
> The same applies to patches 6 and 7.

Thanks, dropped from the GPIO, I2C and watchdog drivers for v2.

Best regards,
Fil

