Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92381ADFE4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789954232; cv=none; b=GGnqE6U+VqE4Z+uaw5yDse7lcmMn0CbNo7Bbt43AqHvLlA8kdo1pLiNakWqx9hu3f0O+IHXZHuGtV8LSPWn1d4szvn09LLn41LjVFDHJLl+Zs6HngK71HD/aCFCZZA6GzKrxP0vDlwL7MeDxS9CHIRGhiTpFRT5OXVLBYWiNMvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789954232; c=relaxed/simple;
	bh=BfHDrPzIQAQhJMIJzafnc+6Jyl6mkYuD2YaWxyH9SUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlAK8m6Us421VXtgiWFrT/bQMCcvvgpCDLE5X8aWiwW021t3z+uSIGJXstFGX4lzwl3bJEJuKisefdACxI85Gg3k7eGZwH7EgREEaiPzIFZmt9Pq2S/XRaDjuphb1B4SQOTQ4pTpTUYOm1u603u4buT7r2kTu+l+aytWOYNc6y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEKAzgWv; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEKAzgWv"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so1141140a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789954230; x=1790559030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyQ6KZnDsPL7Ni/aKvg7jNnj395nLO83FPzJNN2YGBM=;
        b=rEKAzgWvaHNxi5wqbaxBCcR5I8y5hlOUC5EV/0kcLugOfSyCFseFXjFlHe7JczOlJf
         TQtzkLAExakl/A89uIg98+Jg0CI84OellIAnyrIgJHX5JpXYix59r+OxAVy8DBfeax84
         Ja1CjtfN1UYuULvc+479wnt5KIbYaAKMPOGZkTZkof+g+QPAOZ0sN+koEqkemR/Pjvhk
         DwjAskwFoQbaetr35acf1jzOwIb1ywQBO0Lyqir6goyue/BYl8lPInP/fPIrvs1YTXnK
         J3tHAm2pYGqdRTFMpHNdyuEMPB88g3qLp+YA+SX6GYHoT9RkemoZKg2cW1JOzqlR8e+G
         5Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789954230; x=1790559030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyQ6KZnDsPL7Ni/aKvg7jNnj395nLO83FPzJNN2YGBM=;
        b=ejbaSgKE1FxMSyOw1oPXZYX0yx206uREBysw5B3kzha3ee7QUfHq8eJCGQQAxeEA7n
         lA/rpzKGJrQjPWREqE2zh41GsuH43jPu9YM6qHzte9QOgAA6lwcbu3lQ/P6splJkju4G
         OhZqN5vcckqomQBy8+6CrWcFlTPVweFQqkH4FgooPlDfp/EjZypCTd5b3F58I1QfiU29
         RMvKqWwtL47obuTr5CSEPT9yVkSqMcghNThGdn7roDFf4DdC4tFN+GFehBFBM7cQ8J6f
         nKIFAevJFLOC4019yVN7V7XBL15df79EesFGvb3HTNOX5Bb5o8eZDpwQeMUK1Fichm48
         adiw==
X-Forwarded-Encrypted: i=1; AKwUvBzBIB4CMGxgOcLMuxstMzhlEt3DSIhLvEiCgtZIfiDHfni5Dt5CUm0VuAeZ50Lyl8IPDoNdC40XWAUZqx8=@vger.kernel.org
X-Gm-Message-State: AFuF++kjG+5BGxsrk+j2mHFR/gQbU6dEm/KXG9+ta46yq6rWt2BrwdD8
	jY9EKoldAewt+ovGuzlmJt2GpQdCJUYkRVup2SvRUPo9F5MR6tUgSl5D
X-Gm-Gg: AYBFou2QXCdStVBXe8BhbIvXfikm+j3cYcK4RQYdpOJjcYMxtpXuVv1xV+uDSeMzXs8
	PUDrCyurLvOhGzGEA0d1QPSbUT1N2Va1HE++6OtKRT2DcsB0fqL4tPBOpFDrfzfqJCcKsWYqgiZ
	t4T0hGeB9RvkDnKEPfs+pPyNOz0Wa3mbE7kbx+OkFrLdfDqX5recUDKi4ooXVjvxBMs5LIApOF1
	rGcu1/RwolqfWOXE2a1JO5NG243P5Ds86uad8ni1ShSACiZxfBwfZwrhLaxvQWoVTFCXj45GSca
	VUBwVzwWbA5ibvNjW6qVAf12kZNprQqfApTJBOh07E44HIexfUaPZm0h0CI3abWBV5mpP8Sl1jJ
	C3BWs843NwKPnTvSJWQl9tZJwUeEAW/QH3Na3Ol+mawdAaoV2un2mStmBkM6fiJqKp1hf/XuAyR
	PEl9EiXZSpwkLJSR+bQ3MnH0Bvy9uXGx35bhKE3r+tBQQYC+gMkkvR1moxzxvGXFayWdT+Aj+Kn
	P/OqtBN8eogBOBU/frt2/qLYVpEqzxD1pdHIEPaxp7uqXkTif1ky2U2296uV5sHI4tDDWDd7Hfl
	yeCPJFnnaQ==
X-Received: by 2002:a17:90b:3fcc:b0:39e:4c81:6c61 with SMTP id 98e67ed59e1d1-39e54d54a6amr15587389a91.28.1789954229870;
        Sun, 20 Sep 2026 18:30:29 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm11291460a91.4.2026.09.20.18.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:30:29 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>
Cc: Hui Peng <benquike@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] serial: 8250: hold hash_mutex across IRQ chain linking in serial_link_irq_chain()
Date: Mon, 21 Sep 2026 01:30:25 +0000
Message-ID: <20260921013027.659965-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919222627.3797854-1-benquike@gmail.com>
References: <20260919222627.3797854-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In serial_link_irq_chain(), serial_get_or_create_irq_info() acquires and
releases hash_mutex before returning struct irq_info *i to the caller.
Before serial_link_irq_chain() links the port into i->head, a concurrent
serial_unlink_irq_chain() on the same shared IRQ line can observe a
single-port i->head under hash_mutex, remove i from irq_lists, and
kfree(i), causing a use-after-free when serial_link_irq_chain() accesses
i->lock and i->head. In addition, if request_irq() fails at the end of
serial_link_irq_chain(), serial_do_unlink(i, up) calls hlist_del(&i->node)
and kfree(i) without holding hash_mutex.

Move guard(mutex)(&hash_mutex) from serial_get_or_create_irq_info() to its
sole caller serial_link_irq_chain() so that hash_mutex is held across the
lookup/allocation of struct irq_info, the insertion into i->head, and any
error-path serial_do_unlink() cleanup.

Tested in QEMU against Linux 7.3.0-rc3 by configuring /dev/ttyS1 and
/dev/ttyS2 to share IRQ 3 with ASYNC_SHARE_IRQ via TIOCSSERIAL and
concurrently opening and closing both ports from two threads in a tight
loop with KASAN enabled, verifying 0 KASAN faults or warnings.

Fixes: 25db8ad5c567 ("serial, 8250: remove NR_IRQ usage")
Fixes: 99fc860fae83 ("serial: 8250: extract serial_get_or_create_irq_info()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the 8250_core.c and serial_core.c fixes into a 3-patch series,
  add Cc: stable@vger.kernel.org, and document how the patch was tested,
  as requested by Greg Kroah-Hartman.

 drivers/tty/serial/8250/8250_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index b875d394796f..0bc810f285a4 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -134,8 +134,6 @@ static struct irq_info *serial_get_or_create_irq_info(const struct uart_8250_por
 {
 	struct irq_info *i;
 
-	guard(mutex)(&hash_mutex);
-
 	hash_for_each_possible(irq_lists, i, node, up->port.irq)
 		if (i->irq == up->port.irq)
 			return i;
@@ -156,6 +154,8 @@ static int serial_link_irq_chain(struct uart_8250_port *up)
 	struct irq_info *i;
 	int ret;
 
+	guard(mutex)(&hash_mutex);
+
 	i = serial_get_or_create_irq_info(up);
 	if (IS_ERR(i))
 		return PTR_ERR(i);
-- 
2.49.0
