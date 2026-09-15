Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E8332601
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459513; cv=none; b=XXvnDtGrnoDCFqCrDKflEBRLQmnx2g2ZMnyuij7cGo2eZGXp7njdRhq8a3E9IyMwOw9Z09znlaPi9TCA5Z7txx7zPtWnNkeR1f0leRkIkp0yPxKRx+IrwPj0OD6IuNX9eODL3tdQFfZ9ljteB1nxUzb/QRnupN2OX1MNCfiZcig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459513; c=relaxed/simple;
	bh=jPCS3jau8LEmDTrYHNirj4CmDgyzg7ELGoC7TYTJC8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aca18O7kOHr23OSmThinUWV33n7ZTx8W7198WlxaZ6CRrfYHCAwjx/b9Nwn3oZyBAm7jCHcWnLvjCBi7r7kmsvHuYpiMCfDJ/nbHKUr81URVzcZAl+3viJiSOEKBVGsmZ7BWMnmS8vDjsbrw6QeaGTpGuj0GjCm8Qs3Cf5YyryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6uXx3cM; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6uXx3cM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so2352113f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459505; x=1790064305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=q6uXx3cMnb1Ovbmg3f95ZqdbuIwZN3p7tKyp9YF0OB2S3WOzoN8awK1xzun4ckWAmC
         BSS5UV4/yUz1vDV6P6J4zj/6ps4kUrvMboNxwVwAbqVGR+ZI1dw30IazEOgQ2891telv
         igqpz/8EycMqaoJlJCFBT6Z2Flv21ipyT0vX3S8FQiFl23par0IvYLdr53rvPp2E4SY9
         1DA6dcKeWqtMT03iqSCe6Uu7iydXvkSMzbj2IGuOrIVeaZVKjduVfT/uEhcR5m+WwOiV
         R9vtcbC1xPf9pNeedsrUNap3aWWD7w00OmQW3okYKMjE9MOt72roEO/EXLVOn+4qKIzf
         1G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459505; x=1790064305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=kzsem9Cuf1Hf0KakBqfZFDF6zd7WXo2VX3HpGWsyuNeNOirbEJamyo41Y/pFnkJ0D2
         8MyuA88t9VubEpRB900ZJLGLqJL4skIfSmDOo0ped6oZg0XlQELrcw0eT4VeQanZuXbQ
         orFvCE3dJS1einVMRQ1i7i6Gm6l5Iko8xOUKAXpoFcRg6zZ0rW1Nfd0FzBcf/mOxrASm
         JuS7wDO7IQAmO1E2BZtuthqx/5pssNhJzzBAhAbjil+LtIqqaS0eSKrUcH27GLFxKZUN
         kfFCd+Ph26mM10DY0ZNv998zYtYldZqxI2auyK6E8blvsWS7WzHpbFdC7JBppoiN598F
         4VKw==
X-Forwarded-Encrypted: i=1; AKwUvBwotSig9RMc0hvh9KD8F7CJ1XBnZOcg4nlBa8O8hAo18O9duDbvPHyITdygPeyMeXttgsU3JfKygfRUGZw=@vger.kernel.org
X-Gm-Message-State: AFuF++ny1WoLiHSAMFOzaxAKtF7pJ+eXaF3tJBNucklD8bS6j9DyYsrl
	5WRSotRSCIQ4dx7MTmkwOrBLuVbahSK86Q/1SkubVe8bX8TX1mUyMrTw
X-Gm-Gg: AYBFou0nfx6Z2Jp49Y2B21roGB4w9FyE/SMhjAGrc14ipovWmfaAqwB5NH6pxnHak97
	pBQQc5qhNzFVZbbz5zQ9Gha81S4iRjNmoOaGT4o9uxbvOUpf6T85wKAR7OOONt4uznG+6Ir7dvt
	RwuJWhVN/3ApJweBxRbtPTck5Fq66rixIIa8fH/ew0Uz0zXP0I5fgUPpK9O7BW97Ap3CYWB5UyW
	8s6rFwZi6eSw5qJWLr5saHp4GY2Tdbc3AkN7VQMfSqkrAD9hYf7RaHiT//sX5/gorMex9E4Kz67
	Op+wEKJzghcTTDFH5WDoTC/zzA8DRHhSO8VWgim9eUmO0uwjPStPBEhYsN6WE56VDP7dg5a8D5G
	8mUugmoFBzvf7IlaNcRjSuBHj8nWh6QnUZU9jOxSFHXSdRgLJ58JlBZHWALefRDxpHlX5hfK27t
	wOaElGggCfOrbvHQgQvPtALc1Lmlu53M5+Tcb2TE1SnoC9LFHfmJSr+TIM+7MhwpwhsDYiYba7a
	YGzLPQVEtHyGWY=
X-Received: by 2002:a05:600c:1909:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49e7a677ab1mr118558985e9.12.1789459504354;
        Tue, 15 Sep 2026 01:05:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v6 1/4] pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
Date: Tue, 15 Sep 2026 10:04:58 +0200
Message-ID: <20260915080501.329424-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

With CONFIG_PINCTRL=n, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config() are stubs that return 0. The getter reports
success without touching the config it was asked to fill, so a caller
reads the packed parameter it passed in back as if it were the pin's
state; the setter reports success for a configuration nobody applied.

With CONFIG_PINCTRL=y the same callers already get -ENOTSUPP from
gpiochip_generic_config() and gpiochip_generic_get_config() for a chip
without pin ranges, and gpiolib treats that value as "the backend cannot
do this" and carries on. Return it from the stubs too, so a kernel
without pinctrl behaves like a chip without pin ranges instead of
claiming success.

Suggested-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 include/linux/pinctrl/consumer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 11b8f0b8da0c..7be49d447426 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -107,14 +107,14 @@ static inline int
 pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
 			unsigned long *config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline struct pinctrl * __must_check pinctrl_get(struct device *dev)

base-commit: 7257c35db0fdb4fb02d857a8197a16afa84d92c0
-- 
2.55.0

