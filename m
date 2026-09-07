Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5025484241
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794819; cv=none; b=DYFlpqonF2cPxJCHBNC3KqFrlbsNAkoZLMDRGyREcCO3ygCItxY9sYJITwqwqqR1UjhX9ZBA+vlT/sCmk1lVFCnpYbRYDYFxWQGURYHoMn+YPEn31raa8f5n+GZmvwj5A3SHj3b4H1vpOdu7s2wJSP4aH2vhm04lfVdeXWqScNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794819; c=relaxed/simple;
	bh=sfJG45jw5W76tQOcRH7iTvkAsGP4FG7d8I2A4Io0f90=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DKR40T2QthL87/58lBwRnTAQaZhV17tuB+QMljNauJ8BxsPKaVrPwExUPfqb9wK9FEWKdYze0UbBcTlN8stIhqMB+zSNrhGMcBdvQpeOCq+SWBM91o8N6xjYQ5TGVcqLr2PBx2lG0K9hh57UECr4wda9OBsi1XS/2a+nO8ZX638=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AGplbQ3H; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AGplbQ3H"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso32881255e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794816; x=1789399616; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=AGplbQ3HR7lfQzFZVvkLntLjNTCQ5JdPIeboHWW/XDJ0GlZQVmEgILFpeCqjyHy65k
         guq9Dbobe7BtFAcQt99eZIHgKAWec1RrekK4Gq5xKJx+tHGWxgVQvXL2ft+pm1b4M93x
         kuNdTQm0cC0bqsgNkKyi77b/LdeEwSh7I6fQzZkDeiYBCX+AHOR/05Bx5rXMkBo3oxe5
         Zvyy3Qbjc0YuuEQN5I8saU8ZxpF1BKsoyd2VAnjfMDkpSFdQ+kQWI7yO4fIEtlvhSai9
         Z5pHlCGDgGsnvPD7FV3Te/4KGSBqRXHl2jMCzJB+I3O/g/UgXumppc755af2AymFPOrN
         yOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794816; x=1789399616;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9qbfEVLVVFm/uwZkCVkuCqYtCbBr9OTbyNaynVe7qY=;
        b=pcY56PbLUWoWiK1MXRFJdbPGb574z52f5hyfu0yXQhx8BUjGbTocLpkxmesHIBTOkC
         ze5J+bWkqCdPIEw17IlNuwgylCq+TKziwi7KQs0GizlqjCBo41w9DGYz+KEJkXW/0H/g
         ma/iM/cjcEFT02gGj/xErazKyBK0kM8A61xEHdB2eAAVVQsm3OlWSdTUfPYkX/UOlCvJ
         rpMdyXkhuHM5t6/xjH1qgk5CLRZkKuy3ho9Fr9v0TPVqxZw3YFLZtwHzGXUpnfNAlPsi
         yov8INrw977oVnPt8lLBXJ2VxRjLnI9xASB4jYox+OEOvmGeACwCeaDd6/ViUvH2uRnt
         77qg==
X-Forwarded-Encrypted: i=1; AKwUvBw4rZdOp8oZQ4geHSPRhwJ5uZNWVwhrmFjtx3Ke47dxTlXuVJqhzNBQ5uYcUdH68d4V3gXbtiDzlGqRk8g=@vger.kernel.org
X-Gm-Message-State: AFuF++kI7WWAZzlLNxOEFq6iPHsVekNDBPyBbpRROV2PMXNnrGMROhdt
	QEQRU1oIxbyeEV1pSO4pzuCR/uS8SoUzZJJ9YygJ6nh6pO9NtMrPGOkBnAyJTMuu+ac=
X-Gm-Gg: AYBFou36IBH4NLvnRpfQfsQE/7hiomAFGDWfhJ65mtT9h+DRKZB5Jj/i9nozLafKg/Q
	k1yPRAcguKV5wfMn4uQUBROMImJLeQt5DHUITBzGP6bCXne8G+3+UzbSXUMadJiOpLYVXchqHUr
	87q6RsA4LGmBS+2NhNXrKgYQXZVb22G25wyENZ6rDA7Gxp++FXXZb3dpCyalHoMXyQAK2DLKZLo
	VXkikYuy3gdjggWwecscinqxNYsdY2hdaAAe9Emmzr71btbOn+zUWJRSUpx7f+gnTXqWBzQfE5l
	8CKUhTmc1jevBsQ2QzdJ5Zyv+V39g7gtxRG6V4ZC7qw7Ycl3pwwWxH28cEcl65eOwVjvSM1yx9s
	LsObGQE1bwyztXzhFgp5gt7BJPtooc13Rpe4tGRlgeqTck7Kh+vUwlAa46Esgxw/Fw12R8jOb2T
	Vjwyam5mQfsE4GRadR/eTWEED6W3zG5fuy+kOTs3w3wiBI7v/XFDdBSttY5F97C6nzXypefbzAs
	vP8SzoT6nutpTCo3PIMCyk=
X-Received: by 2002:a05:600c:35c3:b0:49c:fc6c:be10 with SMTP id 5b1f17b1804b1-49cfc6cc055mr202666425e9.22.1788794815803;
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm418419925e9.6.2026.09.07.08.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 4/4] pwm: meson: Add support for Amlogic S7
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-4-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:26:52 +0200
Message-Id: <178879481206.2256446.5480566312277687897.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sfJG45jw5W76tQOcRH7iTvkAsGP4FG7d8I2A4Io0f90=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntfBlpqBiszNMgSn7O9l3ii5fmAZzp08XPZnG
 +I6/0zcor+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7XwQAKCRArRkmdfjHU
 RSSGEACrwfFz6yD1l3vhy6F9taMF3kWSM1xVK9C38V8OvRfuo795o5cb/IMYwvp0C6+MKwhPvG1
 EcrITVzONq66Ie2ZqiLhCqu5O9TrtHq7ajhU1sXK2ScEoT9XTURLcMi3qNi7TYKZvpUI68W8gsT
 bDkbraol8AGgOaCX//qsj8b+KdhbkQJnw0xyAsDPFhL0WaJXcaecJQRd4qwAFgqHdZQFf8tP4a3
 3NirS/fUbuxQizhb7mvswX2eL7jAWNzgh0MHiZoMjuF6pEKmV/DxhkKnAIQn76bZnLDd8s8pSzL
 pCJYhXO8AV97EG1G5oPvR2Bbi0fotGzWRNbEKBoBwxh/zLDVERZ/IkVCBklhGKKMod/CWtXjcDK
 9aOLNbSCrFlYbwY4uMNUddBNkAXoxb7po4O+ObGXszxbKC9ELtigt/7m52hJmqt94O6w/l48DFz
 s6OEU/1rKjzR16dL4S75Bj8QScxgAZizzNsIfihQG+P6q/CTr0THQ+oR9ZOyc7CthJO6wJUDaf6
 I6SeJkINTRwYCA9uUXoRrzRva08+URnqMttKryLsiQAxehiCYuuJNPUfWdQvP9q4KWVb/lAuITZ
 zvENNu+aiL96ohbGYXbzmMeRWnwvrjI8VWtte+G7a1qKOfvdcRIwk9JWlPvf7nepYQLdmpIKmE+
 XP9d4aPYx4YCpNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

> Add support for Amlogic S7 PWM. Amlogic S7 different from the previous
> SoCs, a controller includes one pwm, at the same time,the controller has
> only one input clock source.
> 
> Also use the kernel coding style for the empty of_device_id terminator.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
