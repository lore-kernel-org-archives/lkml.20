Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375920;
	b=mQBlR+gaVMVfpLDHGES2pxc3XjGc9D8COZaur7SaxBmtQZuy+jVHI9pfj1jPOJjL6BV+
	 yUwf4Rc2CcMSwfep9ro3TAkSor3OkP/10bxU6lMmXIGw1U1Ew55Be53xErJMwPhX0alUB
	 FwLPH78aVZEulCjlFZNp5ibtl6iTWmlxHeEIK/Kl0Jcykfp+CUO9CSCkStW94qi+HuRyU
	 htw6+AHNizDO4WSwg/JPcLbN5vvnlTCyPRufJlZXUNgivndSFVyiig6rBl8Qqo0GOotbo
	 0ahWQ7o+AnKXXojhuadePzBczfe5W5Wm4svMwKu2nrF6f9Gkd1AHJW6caXkrpTQ5R+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
	b=Ojz/+5qhbVC7j97gUZ6wyiHe3fzjb+wploZyjvHZRMMalGfy/OjvhaKq7esTnV0l0uns
	 3frXh5zHceK0VhZh5t3uwn0wLDHGjZlvcXQUwMXEpUr3CQcOlPOQEosqAs521ZF5PCEnC
	 Y/PTFdfr/t+Z/uoWdfa3UIfedQTQFmBsKkJ6GVdJz5si27RD2ZEfDPAg83gWMhtr+hJr5
	 ZiFLKuhcCnkojdnG5tkuYO7O04l/8TMjpL/o8sLuVD3etM/fWkxHgCuBnHD686OK97Gfk
	 RLm6PY8WrPCMMMPpBISmFb5LN+/jKM246LJLcq8tQJN5M5YOnBBdIVgR5kZ09h9EZnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHKc6JGE;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19326606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19326606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHKc6JGE
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so5352705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=jHKc6JGEZVWZTPtTYYYbeWeH2YF1NuhdK4SJtLGDhA3i7MhWpq/5IDywla/yY/QQz7
         6jdVRkfBC7JjD7XbtNTHO/JTeElQjtOl4wdxSBFr4BWzeua+R8VoxnvAadd+FdVKLOC/
         kKGoQpuWkOP9UgDLhwnXfMl5omPFkIBb4NaxBIQcdMUU+0HOszP5sm9ve6dgoj54ESkr
         z3JLgB/DRvf9cVQjWY7PheQsKoMEzk7MMxx+l3jNFuN7lDOj7lxq9pRbPmfdJor11ZZh
         EtnXnEbXUs5lD+Icn/rZpel19qqba8ZSpr+ruhBpi+E9HYMWZgxAsKBdOYBMG2lGDgl/
         Q0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+BZy4a1iXe5tg87aPX5GiRafzkK009ivcKtPmGh6AA=;
        b=dPDT+MnIJdE+n7cO/59ZSnbivcdql0b3BbUrcMH4vhABqfOkzMi7dL4SZPuC6WRt1u
         77XxVAb7r1g5HczgVMEN6F/piWRfMs/YnLRcI9wmZbtZfU2Xa7PW+2YDRhgoo8Tm7xR/
         P91tL65jZnus8LwjSfIIbKXffiNWId/R6Sj18CIot+O7/qS4ScsRy7wWp5KQlZq5+zUm
         nTeUkx52fYyJRMApWM5R2xNUMOhmBc96IL2X+Dpq+uE/epUk7xfjSr2N8tO0Qi0bTLv7
         QdIUjU9qaIgA9boOLuCLNwiUgG9M1FuRv6FKsUPD/u1I2xihGLQJznrrUzeSTG3TPmaL
         RbxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2bmRPr+E28MA0FslcSsgXCj9CNcBL/4gd/iv5xI1aA0i68UZIPy3e+gk/fApLf3CLwucaTdl5LB5ZGuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVMqC+W78RWnAElQfY6bU6omcVSDXEMUKuq5Pl1d8L2Ic/IWpB
	BpkM7f+9qOVL5qiMWhAMSCRESETjELYBgmYdR0RSWSQG4AeujIZWmFCI5Pe5VoNJPXI=
X-Gm-Gg: AYBFou3mqf/5Et+OSZXC0RtUOMfbcE1OLgL4EF5MOjPkvoAP2QiLLDeiUruoE+DBA7N
	dlcJfYcFXxap0i0xjTT6Giwcp4fgRSicroSwaf4uKCzVwxLKevOfxlK52/NDOkFiEvWEI4Pbt1P
	Z69vLlgZm3XW8FzOxdQbJ9aeA6Al0eYv0xtE9ZLODdibTYNYzqFQ5Oqi12nnSS4VqmUaCWCbkFj
	Ny5+BxlKgrjvJcCIO3KrDbEmlPdub1/vBgK66fwCP1MZI7RPDrMcmvfznVxHb4B8+E8HdkkA2se
	597YwO7cW0QyKurR0BAtavZG0BHzUYSJCcSM5tOCSgtVDkpC4xwA8OI0g80OP1+68hRPwhTOkwG
	VyzDEuB1qttdzqC3GQw5Nl4zAH6LlsWzjb46QJRIFH2TM8BiVqUhUioX026AGzVoEd28bofVeoH
	R0KthpIAqCoWA+YZ2smF4NrHk1G0K4+arAROXpH7aJmJj/vlSxfN6Oz4Itnl3+m9oXGGSG/9QWs
	nV/2Z/t5W3zkBCZlDm/u+78H5WBd83wCTD0q6XD4U0y494kjhDOmHdJ1ngfJgRPXB0N+m7rrV79
	BkLR9Bkk6PDKy7lJ3kkrs7+5nNUdpgLTIvtT31/hWy2kcOjhXdyyKrpt4DnaZuOuhT/F9DSq
X-Received: by 2002:a05:600c:e543:b0:4ac:ab43:b50b with SMTP id 5b1f17b1804b1-4acab43b5f3mr32931495e9.26.1793375917487;
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm40803375e9.3.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:37 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:33 +0100
Subject: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to its
 SCMI type
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
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
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6bc94c68e89a..5de47e060e8c 100644
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
2.56.0

