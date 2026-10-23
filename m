Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795272;
	b=TtwPKNOkZxy2+Ay7YGYuOFZ66UeDadz2MtpX+/Ye9K41XlN+dAxGzgN5udXBL8TBWMz9
	 PaoMGkVSpQlmFYpUJPR6sm7Cb1vrgoncXUDmrpRPERqHrIIDQh7y5PD28UDjoBQbXdW3Y
	 9gFnt5bU8Mk4qaErfwgb4B7G6EiEvVfyx666htpHFpVsm+F8ndO9AnOZ9Sy9rfegEDvwl
	 0vd994cOB/PWwKSPoSrjMNfcoNnIwX6SiOIQO/QxRBLkS1MTJgz86t4ZFp9wJEhBTGype
	 2wRv55DpfvbNKK6Du+aDwCNveQ6s9+7DOCzlezl3fKDFEqT8EO4/9cU8HEQY9wH0XwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=3ZmjHc8LWZOqpEKUT8YLPYhGwLnhwt2x+wmqgW3E3+KwI3CBQ8TG/PWelrF3YLTC7R/G
	 wB8kW2G26pmVwSK9TtjcTdP2gItMnGJQYhsGnwQnIHgVkBPy1rWlaJNvDBPxYaThUyG8x
	 /iGicAIo1LpoSLQuK4zyB2MI7liEEH1ZH9ELzVpQMdhTRUiTpNWzthqJGK9AKvqPrzi+W
	 d58264UhztiiC4L+FVR8qiavcc8pAqjUXpdZlbJuCCJBupK4EBiu4wBXkzwqlshN0Qo/j
	 K/5HYpHx66RmXMzvg0ObEgPh7Aaj8d5/9hXuPinLINVvM0rSO4mPujQmY9TKUMmcvaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FV7ECvTa;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8577B606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8577B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FV7ECvTa
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a76f63b243so1783803fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792795271; x=1793400071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=FV7ECvTaiVixQztjBBpuZXi5gImCogaIy6DJ5ak5iOSVc/NuVq3Nfk9DRBYBPkeIeK
         FklJFz4xWAsLbAkMxSFQG6nUKB2wITk9sgeGz4Q3vAMT+IaFZuYeH5+sypXfpYwGbMnJ
         7M0rQEuT6v7SxgvS16QqffhCR4WfkbGLW8pxz8aTGYuTPQo4zOu1xgB/mywaZJIOo0p1
         6uRQZO0t2PsOffzeCVvC8dGJNinqhvPLK1L4bIxAQmKHoarmcO0iDRq0XL5ZtojvpYdC
         Uqgn1Ev40EpOXz+l4RcyrOqgZkJ4RLIcQmofrftoHbD03cjYoaHig7DAzZKdnFFk3KTf
         0nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795271; x=1793400071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=q8yYbv1pTF+5l6t6gZ+XuldE8j0Qwm2JuL8POMhdl/mu4V7Z+vMlusYCc8uNbB/xgJ
         20XBQTwsauyOT97Wge/tkbmutbzMA6xbH9fYfwdQuTe7L7rG8c3U1mIlIED88TpDuY9b
         73Psk2kBfYLMCkknw+/3h8l/9ldj0G0ymEyxyUgTfmA5CxdnJD6X0B7qw+EdjJKUELoD
         OpKf/67wB6TPtJ1bXt9QHbIIkmgGwwlVlf9Sz2F8nSC3u+mCdQ8CbwI0sZyqDNDhisfU
         AxEbwXJMqf9cMjnD7WuEqyvSXPU67bF/lCZRa9nBEwfTax+vYbNH5VRWKQaRmJvafomj
         xPjA==
X-Gm-Message-State: AFq9FYKJvTpAG5lNg3y/L5bSLQ/PZ9kzYidXPLQo8+QmT+iijfEn4KuH
	PlY8cv8OERo4W0A4/Rl9n+4/j9xVfTUoVhZdC/WFJ2reMHV3OWfy2rmY
X-Gm-Gg: AYBFou0imIKqd31wkxFIazB64LFOaqC6oj3/FsU9dO393XB2AecBiv6167nmQ8tWhb0
	DhsiWK2kG3ACrkCsWM0Nf6/FUtpILINz1CXrYOkp9reHeQgUF6w9SXiaF2pp8G86M+qpd1/Cs00
	l8MH5k1WGjxyaFcZcg/iSfwamGKNfdE37SF26ouCCu1qS31aPXejhM+w/HbSgH42b7Uef40KxJE
	XhrHA0BX/ALjWQfDCD3C47K9EWBOnQPvxAm94ijoNh5KwW2qF6A2xLhyAgcOV1OKo00ebUTdsR3
	YI1OJrjt2iyBkSdcLtBADDUw/a4tLBt6zJKuf4LRMbQ2RzIytnxxUgTnslVc3nZ6qUH/y/vW98E
	2ujlicaN4u7gzh+qujDihlYC7UPkyylcVEstTZFAjCkrtiiR4HUHNKc4SqrrFt6xyCXWCHm21AF
	WrkDomRqSfRYvXq42gcDtmd0WHu1vbneF4weIJ2yShZCtmz9xSfZP+P2FbsowGm32mnwyN1QIcm
	KBMZ0h4ERk7cuKvFRWmsw+kYjqbi11y3W2cZACbuPci1JjVmne6PBBijJMyAQ/OeFds9k0Fc6mN
	+Iytq02X6OaffsoJZj5GpdeUKQNbyI3vO1T/GuLx6wa6aldYd3O+72weYNkjie47X2Y29Aro+df
	ZdaQvv4O4nrskesX+8M2P5L9G2VtxD5wYFkS1K42AOg5Fbm4pQJPhgnBBIL/jCuLjMGMdKI9Uq9
	dVtMs=
X-Received: by 2002:a05:6871:d3:b0:48f:e0f6:bfec with SMTP id 586e51a60fabf-4a83fa4192bmr357118fac.24.1792795271013;
        Fri, 23 Oct 2026 15:41:11 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c012esm226213fac.11.2026.10.23.15.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:41:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 16:41:06 -0600
Subject: [PATCH v4 1/4] serial: 8250_omap: separate locked TX DMA
 completion processing
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
Message-Id: <20261023-submit-serial-8250-dma-cancel-v1-v4-1-e759de1839de@gmail.com>
References: <20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com>
In-Reply-To: <20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 4805b644ccb1..b6f108d34854 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1080,18 +1080,13 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 
 static int omap_8250_tx_dma(struct uart_8250_port *p);
 
-static void omap_8250_dma_tx_complete(void *param)
+static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tport = &p->port.state->port;
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
-	guard(uart_port_lock_irqsave)(&p->port);
-	if (dma->shutting_down)
-		return;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
@@ -1123,6 +1118,18 @@ static void omap_8250_dma_tx_complete(void *param)
 	}
 }
 
+static void omap_8250_dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (dma->shutting_down)
+		return;
+	omap_8250_tx_dma_complete(p);
+}
+
 static int omap_8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;

-- 
2.53.0

