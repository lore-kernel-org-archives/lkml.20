Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567963;
	b=fgxEQKUk4466c69bF2b73OCtSSZvIhQDikUimfJeMhJSywOWfS68BhfxBeQQ3yGV5nYz
	 3kNLx9T9ylsfS/qwSaWWfQm+f0Vy92In4UaPrG2kvIxWQ8UONNaK7uL15I4f3tTyGL5NP
	 uRr/+ci3r8hWMnnBlVju88mNhUOr4JCsQIqTvOcfB+EW5q69z6MZ+9SjiBsbwNpm1lKno
	 7Rn9886niOe/pKbZ1KjcsHxYDL05WVfFiwwOU/N7kWo5DC/4RteayRS891MAMtt58yNwQ
	 3+QBeJLUsimadv1joM8d/cn9MtUIqhqK8ondQM/rnXAZYRcIIOY5q4MhqfBZkmonfyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
	b=Z8H7buwj2M8hCr6SXjt2NyLIq5ebTAILBHUHO4LukMxTOOHa0mv2Nn26xYbVJiXjiu37
	 uQVgcARNJQ+kM+WXDK4RCMc829stk8UIrvaQe1TiBxoPJoAourcJ8mJiTOp8HTW5jYH9+
	 uQ/+H4JLqHJ9lBQR8bbjSV9WsANQC5swKLBA7EWTVcfl+VtTan3tdi7K62C32b+K+gUHM
	 WwHJZUSIeb9IfEFD4H27tiD/Zm36oHycsDQbs1wVivAxDvPPx12EoufAy5Sp3wK/a7Jhe
	 Ex4+rPsrPklqL73pBjhJ803bRlNVlsPZ15KeR9KBVxS525OBZz9wybhiInH6bSZsdww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bD5rIA6W;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8655F606A896
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8655F606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bD5rIA6W
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so5789755e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567962; x=1795172762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=bD5rIA6WLcIQpx8DTYeXxEY3FOwPzZOkYVEms9yqlDmrAm3UraDvLisHOLTtIZbore
         wH6mPfa+PbaEbEOUHJW4hq/ZgdqU1Exx+1/hKgzBlNFzV/BR3JWXKsIELtm1LW6pRyTc
         8LaH3ZkFXZVUtvkEZziZqfJcz4qX5A7oBCZCD2+LjDVVOOCDQbG7DqoMwDeCmSeTYB2p
         hVSx4dq8z/HlWUwt9jOabLRgWmoSbZqrk/88G4ZF5BqDL7RDf/+6Wa0kPnP8/5rurOqi
         YiM2PlMsNoqg1zCERHGN4BojmJG8f6j+y8fm+7p96aLjPDyp9VDo6Nd6KvKDQY9wPQeS
         +h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567962; x=1795172762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=OJWKaHWzFOfyv8Wl5wHFUv0t5GovYL5oWCZeGS8vHbiF9yH9iS1rGOdVB6vChVnsfq
         +s/2PZGonDbRoenpFISnlnbAQTQXsWPffaot6kAcGoY2B3/PB9oHHGlfDiQ5GjQIO6T2
         pUCp4QLsODX405iID8LNhXaJ6Kn8kZBVyz/SfMpcA+gDKe7wOpRvI0kXwe+MUJ2c0Gex
         I01m5o79cuGIpdWD+o/O8fq8zo47UEbWHjOzXeQSsR/WCz0we9VXq+ZwRr6br4YYv1Y1
         xM/YEsKvmmnkkG0uNpvi9JaFwuub0kYdhnuqpmTScXhu6vufWBQO14egi4YH7K+3v0ZL
         ZG4g==
X-Forwarded-Encrypted: i=1; AL+hErGktPqwOlbKwGyAHuI1AY9e5BzIaHBWXBOYD6fFpg5jQcUoiS8xMMhB4TWKApZihdLRs36psWaYBjp3KCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x8VWHj58rtSQPqqbGOaCj3BgrGvxk57kuMWtKi5U5HyCzvfsu
	OBQwYX2Cn0Z1+FYHB6fjVD2/xyYz2nOWFRRjfvPtE8CXK0CMi4H2bSqYzWXQrEk6mkE=
X-Gm-Gg: AYBFou1r9LoujCHbvmSQpFvSd99kQ0/dWqKSmr2MRfNT0iMtisaRzGpet7Bn4dFbRK4
	knm55xD/ymrd2yvDUEQCTCj3WkZ6NyNBXJwjmNH1uyPwhFy92RMggLsMn3E2fJ63NUXhAtOkyZB
	NXidUm4UqPdo5BmUVxgt/tI9/GmmpfnSdtiBCALGBgBsGtmGBDRx+jB6mepRyIvS+qpRyaKk2Is
	gdBsny2xZo4qkSnx5oAxubvO/HQHJjYds8jybd8Noq4L0gvuD1qPPKDKLMbzIHo0aQjgRA0xrIA
	5xNa+NBf6eqDNqbGv9bM61fbxQSSTjddJps6Bi2F8XrrR4RREF2YOinQakIwfqwGfefdIHawZ6R
	uja7rkM6KyL+TlvDSJD+nZ7LXcSCqWnNVGdQsN+G6QSdF8Oa8O425hFrcDK3dXGXeXBAcZgvGeR
	Iq9wa5ZeHiA6qZopnHw6rEG8695197Wmsxu6KQQzWde/yqsUFj0TW0r0ut2zdRuvIPYOE6BzTNk
	s7A0fdOMBBYscIz+2rpSOvGJxf25AonLte/oYmVX85bGkGceLFRZqpTW1OATNS4iLAEoEHClony
	hsbspKFevAtbeQyio2y1PkmGfaaXQ5iD77Vvs300OK5UYarbYpo=
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr28918645e9.8.1794567961834;
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm399461f8f.50.2026.11.13.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:28 +0100
Subject: [PATCH v2 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-2-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
INPUT_SCHMITT and refuse the threshold, the protocol has no type for
it.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af33ddd4056b..cbe4f3b6368f 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
-	case PIN_CONFIG_INPUT_SCHMITT:
-		*type = SCMI_PIN_INPUT_SCHMITT;
-		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		*type = SCMI_PIN_INPUT_MODE;
+		*type = SCMI_PIN_INPUT_SCHMITT;
 		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;

-- 
2.56.1

