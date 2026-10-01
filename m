Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609083E7160
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897452; cv=none; b=trGET1568vqPELFE9n+00gHqhCSgHEoGfKDKfOlSYJwLCF0JDNafK7TBMJkGwW2JctPZJNZD07qYcUkOIP+xjonC2HsyDc1Nj8FW3753GLecqkH5h/JXPrrJp1oj16xT8L4KV2W3LGwJYR7t6pLYG1APnp1jV+Zcw7mcKRHi+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897452; c=relaxed/simple;
	bh=WQqvvD/sQatAVKeDt7OzSCnSoyrrtfFbAK2i7nM2NgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK4CsRjHbrYJ62XXSoAlV0Xm9sqZUPyID6dZsxHF9SmA0YkAZApwzqwLGwk9/uUsUcuyJUW8JRF1mb6oMwctokuOXz9iQkjbSmqv1ZJuHC7pss1JjD5X7xks92mwSnk3DP5xpUxagtkXF4MdUCa7Udf8xp9AgH7KHVKE9C2Hqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+RKq1TF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+RKq1TF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so39760925e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790897449; x=1791502249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMTt9X+tMN/0URvJisKt8BWrlZlLlxVbSwTrZVovw7s=;
        b=U+RKq1TFEccUu2VyRUAOyCu9xPrXC0uBIhgO5ZIiSiQ/MSF2z6VmUP5SRw2gstarWz
         1NI83Qkz9tDXHEDTk67oOUFp5bCASW4QsllcMAnvhjEgMppYrJqMx1pZ+ltRe3bzV2qh
         TKN4bGbf2LiAiwWiyeeNwPuJ32OP7QQsFvegOOLqPWg2oWtGkAS8ideA0NDTeTFAAJvZ
         jeHavgpurXxyPkaZD3fpbgcnlYTmpmm93G0AOmT44pIdPPxB3aK7+wPtGj7c03Nk1oiV
         2wcsePHywtb+63SXWHtQKtslB06SKmxcO85WNn1yPxWer3hCXSyUQ0zI44XOu8ncGjGb
         YXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897449; x=1791502249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMTt9X+tMN/0URvJisKt8BWrlZlLlxVbSwTrZVovw7s=;
        b=Q6W2XjO/P7tXERQr2XNj2xTSSpzEjhTUcwqOndHR8dccQL4ngdMi/+gh84SI9Q9KjU
         LkJZAW85P6wOkdIxTQOef2yo3CThYFDU5XxmrzlpYqtDR28jdyNiNGDAHs9Fq17U7QHo
         I/urGMv2ghL5+5N0Cc8JSc4KS4IBWmFXus6yHgLUIGyQodFYaLtLY/gv2nP/z/+/UfyC
         21DW0hIpuQ5Vlv62wHffL1y2LBFTa2uTK1ChWQwedR1o9ZWmwludMlR37Bc2y7+V2NAg
         yaa60yBvYkNzHZymtzY24CNvlmP+3r9ii5JUzfTJd+HK9Ou6rVqHAYvwf/sGNddGUhkX
         uUkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1JamVXnZJA8fDIv5Z7ZqPgJeehCnioxFMqGQAsGvBKMNiEkNsusYGLWSlXr5b+HhE+5vKD+YFMGpwNCI=@vger.kernel.org
X-Gm-Message-State: AFuF++mimSEGNLD1IW5gCNb8VFGg068xafMiSNykuuXc5dMnwCx94+3k
	jxhvNClVtDqmUCMaRTopBtIOb1qK1MDDq2C2nMFVxTTNHk1nVY5/U+6u
X-Gm-Gg: AYBFou2ElXCfmjJKMPy7590Mki+TaczYjW28j+DQDFWFUh+Z0FeW+YkqjdZknGvwHSz
	YSQUAT+8llCKFMgfuuKkWfbIKJguY+B0em7dhTr+dCu/eDbEVnkp9b74crDnlAc+qUqzpshoZjA
	ARA+5b3tVSFt2YW5UJ7RDiCSKiTuZm52nbfk9i5Hg3zJ91KLCSMGUb8kCg3NReptwu2kG1ZVMRY
	nljQkRfF5t32JUolGWZkAZtF1G4/XyX69ja4wQNthDRSJ7/mNgUToIk7ExWfkFgfnvMLWH4rseu
	xrO+uzeWtSz+oY9wRvUzTj7tiUREbqtZXgFB5shxSqK7LAtvaMOhbF73qAcAJOIB8UXNFrMj9Mz
	++ZQGIqtA6OHjyhV2Dw2+BKC2orVYNSsXXzhz1dPagFFcVebKS87NpLiiCnG9Ln4psQCJ8mbbmh
	qwfc2w0qYGVqN0JdFukjqAa6ozGgIUIi+EdLztpbv3jVgZkei13K+Ao4XDzVq4gNoqkH1106W5m
	i98IRRTWqBxVQ5ER+tFWjo8g7rpsgFAutdi6kb6G/Qj2nVIki47HC9mkkFSjmds7xxOaxMEMymg
	WSoI73ZJ8HmPJDmzM8zqGsHPCraTDmo26mh2cHLqTUoqUl51Oo/6l+JXv0YVNFeabXfWHHpD1H2
	QrgrXS1gdeI0=
X-Received: by 2002:a05:600c:3501:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a02757ab71mr17738425e9.14.1790897448522;
        Thu, 01 Oct 2026 16:30:48 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b3ca-3a01-3deb-81e4-0dc4-fbe8.310.pool.telefonica.de. [2a02:3100:b3ca:3a01:3deb:81e4:dc4:fbe8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm11717875e9.4.2026.10.01.16.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:30:47 -0700 (PDT)
Date: Fri, 2 Oct 2026 01:30:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] netpoll: use a raw lock for the deferred
 transmit queue
Message-ID: <ar7sTVun7mF-4nl6@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
 <20260930192103.62973-2-kmehltretter@gmail.com>
 <20261001074819.gQ3w8q6P@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001074819.gQ3w8q6P@linutronix.de>

On Thu, Oct 01, 2026 at 09:48:19AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-09-30 21:21:02 [+0200], Karl Mehltretter wrote:
> > netpoll_send_skb() calls __netpoll_send_skb() with hard interrupts
> > disabled. When direct transmission cannot complete, the latter queues
> > the skb with skb_queue_tail(). The sk_buff_head lock may sleep on
> > PREEMPT_RT:
> > 
> >   BUG: sleeping function called from invalid context
> >   in_atomic(): 0, irqs_disabled(): 1, non_block: 0
> >   rt_spin_lock
> >   skb_queue_tail
> >   netpoll_send_skb
> 
> How is this possible? netpoll is only used by netconsole right? And this
> is CON_NBCON so it only prints threaded. What is the missing piece?
> 

The call is from the NBCON printer thread, but netpoll_send_skb()
explicitly disables hard interrupts around __netpoll_send_skb():

        local_irq_save(flags);
        ret = __netpoll_send_skb(np, skb);
        local_irq_restore(flags);

When direct transmission cannot complete, __netpoll_send_skb() calls
skb_queue_tail() before interrupts are restored. Its spinlock can sleep
on PREEMPT_RT despite the caller being a thread.

The deferred skb is later handled by queue_process(), a workqueue
callback. Its requeue path has the same IRQ-disabled locking:

        local_irq_save(flags);
        [...]
        HARD_TX_LOCK(dev, txq, smp_processor_id());
        if (netif_xmit_frozen_or_stopped(txq) ||
            !dev_xmit_complete(netpoll_start_xmit(skb, dev, txq))) {
                skb_queue_head(&npinfo->txq, skb);
                HARD_TX_UNLOCK(dev, txq);
                local_irq_restore(flags);
                [...]
        }

Thanks,
Karl
