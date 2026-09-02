Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543783A7193
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331940; cv=none; b=V9hpM+vnk8CgAWkJpGlqP1kZBSeFZBrDc7gS/k3L4bbqBpZOCVU62paG3VGowC21K+EvtbxllSZAPtgkokyy0lvgAHIl7E4Xmn1rXA62pkBG3cNtFcwXZ74ylxSLbVWNCYiIDvFvcSjRMkobPrlkQGgQYyzaj5RrbuuyKuc2BLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331940; c=relaxed/simple;
	bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mx3uNIdnC53xlVHBCFXhJ9WKN6iLU04hiRsLXa3/OryCe1WsqmJkM8UT/5TyrYgFhUlREPkxW4TrdMsm09Uq0bZCuxRpITBtkCPrtULgUJ/i8cr4FmUMmiP7VVPtoagF2/1mXN9qm2Th++5FEc8XlhHxRflQZ+E8TnOOST/6AfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV1AcgQ3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV1AcgQ3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7322185e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331922; x=1788936722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=cV1AcgQ3KKgFFxP6oEB99W4bpfGZ/11jPEQuwK/SIwFutunZDAdR1MXod/yd7tePSE
         /4aTArgSQaXaD27GpTEB27KPke2NUJLY8KvAX16BdnTR5n00kXTGU6+w0NkqyADIR8gd
         bwtGyit/8jHoI5jjycoX7Wilh8Jr6+hZ9iJEWe5rd+L+QKbodCynA61LMftCmoorsqLl
         f5OEp4IoirZODndw5kjpK7pTZaWQgX+7xHKciTqOlxS4diUAznmQe0ZGbjXHbUE+cHjm
         k27i+xpTxn9Mb4n42YU/wpZNmxJKLb++OeyqW3wbfhB6q1PiLZjsYNJGPes3DjqmAKrE
         eyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331922; x=1788936722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=ce5TVBN46HSstyt9Om1wVHdyM7PwN6C3OLYfhDmTnFGZjBfj8SzUfrx5K2hBQ7bYwU
         2MOAplrQ6WmjfmR6U66KtkrBQdistlNzGiVL++4nZQq3NRGANbF4YCwThLPr/OfjUf8r
         fCt6lECJmOFzFPTJiG4jjUK3LAQNhpyue8SO/x4oNmpQpxoKJGLCG67WwvkzzGwydXdD
         6tWSgX3TpLeFwOmNZGlRcEEYrKS0zm7EZx2XhWKYnqtdeAntu1BhEUnMszyqaN7Id18o
         WY2VY/+ZO3/lFh9Fn8gGk00ZgcQAsG1NvHxb1djKMtOGr+AbNgxRNZVvvlnrlfMd6nSJ
         3afw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1YNRmxYKmw89tLGF8L9cTb15080XaA/sBKX9k+iFUcTr8Aa1f2ym/AKTEGQdDiuFzPPHG2lo5OWL5Lc0=@vger.kernel.org
X-Gm-Message-State: AFuF++lhHySMMq9q5BxUA0KH8SH366er4SeT5AUOplrrZoCdep1ETQXR
	orb0UudUTArnEadAhXQKBCzyhIeqt/0IRiY9j3xa/I9wMybYAP1seKmR
X-Gm-Gg: AR+sD122a0WyPhK8ldwsWeoA+zADheuqKh1KFlr6J26VczJTl83y0FpuVAA+YcK+0vS
	Aw3tDU90fAhrC065wSUuq319QnoaH9uOpGGoFjQtEEfDSjxz4L5TEg2DOs/QGBigZrAEPluy35I
	29Hg54SbrF/iSW9w2+L0dt5xWKDCyt/Xxs5QYpjAUssIcINL8Jlkm/6o+6i7Gvx1r8TYx4uRshM
	qppIWcnTj/vR++KmyEmTA9ZmIP4ZhBynsKRO8TAWdvFMWBJLbF3q4CIwJr4/5SDNdpaCKu6ZYbu
	kGm7hv9+eJB8l1z98RKP6976PEW9m5gsjQiu9BEhcker95HNnR7cOXiVyKhsCNANo++ek2ojKc9
	jSWGaIclxaSqi3L9lhApqB+neh9v1Q4BTykqkOw6qQrjFbb1/2HRFXqdUvA24pThR/t0m7wkdUO
	awwYuJrsFj7ICf6M6f/LiVF/MrcU7U0lKYtt6cUxojQjkVaHeD1DjO1F3kX6zeveH9XA==
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr39966725e9.16.1788331921667;
        Tue, 01 Sep 2026 23:52:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
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
Subject: Re: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:51:58 +0200
Message-ID: <20260902065158.3617522-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902064045.60F621F000E9@smtp.kernel.org>
References: <20260902064045.60F621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> Can assigning this callback cause a scheduling-while-atomic bug?
>
> Generic MMIO GPIO chips are initialized with gc->can_sleep set to false.
>
> When an interrupt is activated, gpiochip_lock_as_irq() executes with the
> IRQ descriptor's raw spinlock held. Since it sees the chip is non-sleeping,
> it invokes this new get_direction callback directly in atomic context:

This one is real and the most important of the three: irq_activate()
runs inside the desc->lock region of __setup_irq(), reaches
gpiochip_lock_as_irq() through gpiochip_irq_domain_activate(), and for a
!can_sleep chip that calls get_direction(), so the pinctrl mutex would be
taken with interrupts off. My test kernel had DEBUG_ATOMIC_SLEEP off, the
uncontended mutex fastpath hid it.

So the callback cannot ask pinctrl. v2 changes the approach: the chip
keeps the direction in its existing shadow (sdir, under the chip's raw
spinlock), the direction setters update it, and get_direction() only
reads the shadow. The pad is asked once, in process context, from the
request() callback: gpiolib calls request() right before it calls
get_direction() for a newly requested line, so the shadow is seeded from
PIN_CONFIG_OUTPUT_ENABLE there and the line reports what the pad says.

> [Severity: High]
> Does returning these pinctrl errors break interrupt setup for valid GPIOs?

With the shadow, get_direction() never fails: a line pinctrl cannot
answer for keeps the input default, which is exactly what gpiolib
assumed before this patch, so gpiochip_lock_as_irq() behaves as it did.

> [Severity: Medium]
> Will this early exit prevent the patch from determining the initial line state?

Yes, the initial scan in gpiochip_add_data_with_key() runs before the
pin ranges exist, so nothing can be read from pinctrl at that point.
The v2 commit message will drop that claim; what the series fixes is the
WARN and the direction reported for requested lines.

Thanks,
Mehmet
