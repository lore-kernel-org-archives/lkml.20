Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682424;
	b=PnOfIW8oX6sklMKu+BDskvZAqoVhGZ5/JIzkqZo8QqCGphlBr9kwiHnHA1c9RVXTEKY+
	 uilWb9QGECqa2mN90KCRi0yVuEu56Hv2djw1uh//k7vxFNLH9glypQoo4CuHx9uelPSnI
	 hXw0m+NFzu0hLbf2Mx30ZZyYi5BYBJ7tB1T1i6kQE943QLAqNo9Af31LNrDSXWzTcTXJP
	 5+Hw7SJpRs/5S9h6aeK2xH3dMBSNv6NVs3fW7elOqEmK21uVBlSkGE/DYG7WEufQaWhKF
	 EMCrQIqQv+w+LsIzljb1RFyIuLN0/E1eGXy4vJNhntvm9IW3CbWWSD+OkLmi6/r2xTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/Yjxm7TUyycCxYJzOeG3LypMZa+FBaFAcTqh5upg5fY=;
	b=4wevOGZAI62yiVmdanbbPkV5pDcssLoKxGK4bPTfQsB5iek8163LSzm1BB5TyDEccIsU
	 zlGmPeHLlhZzinAQd6MyTlQeazpCB/0UXzyzDzGbQphYEYACtE4LAcVe95mD4j9sRZo9M
	 1uVJDGb74jAA3D03h+CBD+Q8TMS+XVbZelIT5FryAXDwg5KZBtRqFymMO67zvhshKXLYt
	 ejLwKNAwM6obkYfQ6k/8tSXHnrJ5yC5fS6iBJt5ADrWLVielp5tYQ9TijaNkazMgesXaa
	 kRgtoN7ALhfG+2ROR279Y9ImtcdnNr7BUERcKxhLV9l7JDjQSv8nAgJGJTyz4ZsuVSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=esxspwzg;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B0606ACC1
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252B0606ACC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=esxspwzg
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-823e4047037so1530595a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792682423; x=1793287223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Yjxm7TUyycCxYJzOeG3LypMZa+FBaFAcTqh5upg5fY=;
        b=esxspwzg5+cw3iujF3wXlxh/HkuOiS/kpx/u4TtdrQbZxVizlgXcZxPpZzmMO0HsST
         K713kHPHdKGIy57DPkbBP36iqGwAS3j/QqT9eR2OrddB3D6aDDJ0EXobVk9bXLK3F3Pi
         rCZ25GIRQ+h4vr14A7jwCkMZU5NdRMhHU58JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682423; x=1793287223;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Yjxm7TUyycCxYJzOeG3LypMZa+FBaFAcTqh5upg5fY=;
        b=tSs///LRLheEkQ4uC9KbcMV2exjrnr7LKMo63whXUrGn7cshM0NMY7nz07Hymqd3ja
         Wuc9APatIo0U1mRhcrwCb0i/2X+zkFaxbnXzQ4P9j7pVAN8uxTz6kfF39ZTMRxxBJ1D7
         Vrs/U0J3myQ+EbKPpLZgQLeSiturr14ZaG0bbQHAYAkbcRY5M+5KYEhEfHPsO7PhRSp6
         sulOCNXok/DT0g0WRf0Wxg8SBOSThugNNj/2Jrjsjn3vW2ZUYWzgsqeHMcsVQIFJfKBw
         tZOzJOgoJE9H0BNALXqpENJP8RwS+CXliEdtqWnaPWVJeCsamoaL8R/LhBfOYAo1c3CE
         8BAw==
X-Forwarded-Encrypted: i=1; AKwUvBw6CzCmA8oCc8rQ6I3rCoiXclsQ/PcJTM6UUvaiN/RpJ9NSGWHL8KLNQQ5VZ0/b5eCwz4YnMAtetmtS+IA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWOLEnPvdylQQPIgnlS6qJPbmYECZbDdmQjqiSwrv6OKL8fBQ4
	kVOD/fV663+qsfFbXaeP8KcG81R7QzrhOSttc6HBheLZ/IkScWiygUp0ycxARMrbSQ==
X-Gm-Gg: AYBFou25DY4T8z/6mk4YLoNSIUWj+/6Uz34YGefN8tWoHfUz0MY4JS/mGX0k3oBBPZI
	L2hS8JvAunJkC8PuunJuvNnbmoodvIKMLV99ANw808qRToi3M5toLVqrpL3AAGuyjf+3kLSKN4h
	gOS1QWGe/lrHupo8w5soRF27i5MvOo2ED+l+YfR3FeKZ1Sx6ovUjtzEi7VHqh8862gmfMA5kwQt
	yWjAmsdgtejOPVvkHjYBDSBD0yjyMMnfOqVUpIt3YAltl2sPeNKfbqAArs/+pQ1VoGKZgoQKLTZ
	nIbLnxs8eWlrRH11MId1fnjJhCAnZm2W4LcMrFGgIgNlbwPmdYCHkXSdXIZagREwKnF3aSNkGaS
	tdAa4hfvq/nZqEIWwC0cUrPHY8n0KYpECU+QH7Zi1vlL4erM4MbPAKFEjzwbUBys0FvshMV8YHe
	flYicUwOlfpNxVdv6ykPnzgdHsiuVlSWqGhpbcpjLwbekBtfb+/VPQi6VPTednAJucO0lexUZKd
	vYnqhyV9zkV6RDu3U5HEhkxFnr3uRGyrzAQKFdVTKwrVkBGBiu170wb3ZssUuRdp0hqMS/2p0Le
	y6uRlZYE2k/toaBlAXQ3FFls4Gfn365o2YSTG3caiUMf
X-Received: by 2002:a05:6830:3d8f:b0:816:a9dc:6d0f with SMTP id 46e09a7af769-84d0950af48mr4559702a34.20.1792682422984;
        Thu, 22 Oct 2026 08:20:22 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f774321d6sm4814a34.9.2026.10.22.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:20:22 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?UTF-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/2] serial: 8250: drain canceled TX DMA before reusing its buffer
Date: Thu, 22 Oct 2026 09:20:18 -0600
Message-ID: <20261022152019.1621716-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021-submit-serial-8250-dma-cancel-v1-v1-1-efe2b89f2303@gmail.com>
References: <20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com> <20261021-submit-serial-8250-dma-cancel-v1-v1-1-efe2b89f2303@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi James,

Thanks for looking into the asynchronous termination race with xmit_fifo
reuse. A few issues with this patch:

> +static void serial8250_tx_dma_flush_work(struct work_struct *work)
> +{
> +	struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma,
> +						 tx_flush_work);
> +	struct uart_8250_port *p = dma->port;
> +
> +	dmaengine_synchronize(dma->txchan);
> +
> +	guard(uart_port_lock_irqsave)(&p->port);
> +	dma->tx_terminating = false;
> +	if (!dma->shutting_down)
> +		dma->tx_complete(p);
> +}

1. Missing runtime PM reference in process context:
   `serial8250_tx_dma_flush_work()` runs asynchronously on `system_wq` and
   calls `dma->tx_complete(p)` (`serial8250_tx_dma_complete()` or
   `omap_8250_tx_dma_complete()`), which accesses UART registers
   (`UART_IER`, `RZN1_UART_TDMACR`, `UART_TX`, `omap8250_restore_regs()`)
   without calling `serial8250_rpm_get(p)` / `serial8250_rpm_put(p)`. If the
   port autosuspended before the work item ran, this will access unclocked
   registers. Also, on `UART_CAP_RPM` ports (such as `8250_omap`), if
   `dma->shutting_down` is true here, `dma->tx_complete(p)` is skipped and
   `serial8250_rpm_put_tx(p)` is never called, leaking `rpm_tx_active`.

2. `dmaengine_synchronize()` is a no-op on several 8250 DMA providers:
   `dmaengine_synchronize()` only waits if the provider implements
   `.device_synchronize`. Several DMA controllers used with 8250 — including
   `drivers/dma/sun6i-dma.c` (Allwinner H616, mentioned in your commit
   message), `drivers/dma/dw/core.c` (`dw_dmac`), `drivers/dma/pl330.c`, and
   `drivers/dma/mediatek/mtk-uart-apdma.c` — schedule callbacks from a
   tasklet (`virt-dma` `vc.task` or driver tasklet) but do not wire up
   `.device_synchronize`. On those controllers, `dmaengine_synchronize()`
   returns immediately while a completion tasklet from the old transfer can
   still be scheduled, so clearing `dma->tx_terminating = false` and starting
   a new transfer re-exposes the stale-callback race.

> +void serial8250_tx_dma_flush(struct uart_8250_port *p)
> +{
...
>  	dma->tx_size = 0;
> +	dma->tx_terminating = true;
> +	ret = dmaengine_terminate_async(dma->txchan);
> +	if (ret) {
> +		/* Keep the buffer owned by the transfer until its callback runs. */
> +		dma->tx_terminating = false;
> +		return;
> +	}

3. Zeroing `dma->tx_size = 0` before `dmaengine_terminate_async()`:
   If `dmaengine_terminate_async()` fails (`ret != 0`), the transfer
   continues to completion, but `dma->tx_size` has already been zeroed so
   `uart_xmit_advance()` in `tx_complete()` will not account for the
   transmitted bytes in `icount.tx`.

> +void serial8250_tx_dma_prepare_buffer(struct uart_8250_port *p,
> +				     struct scatterlist *sgl, unsigned int nents)
> +{
> +	struct uart_8250_dma *dma = p->dma;
> +	struct scatterlist *sg;
> +	unsigned int i;
> +
> +	for_each_sg(sgl, sg, nents, i) {
> +		size_t offset = sg_dma_address(sg) - dma->tx_addr;
> +
> +		memcpy(dma->tx_buf + offset,
> +		       p->port.state->port.xmit_buf + offset, sg_dma_len(sg));
> +	}
> +	dma_sync_single_for_device(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
> +				   UART_XMIT_SIZE, DMA_TO_DEVICE);
> +}

4. Bounce buffer layout and DMA sync:
   - Both `serial8250_tx_dma()` and `omap_8250_tx_dma()` call
     `dmaengine_prep_slave_sg()` *before* `serial8250_tx_dma_prepare_buffer()`
     copies the bytes and calls `dma_sync_single_for_device()`. The copy and
     DMA sync should happen before preparing the descriptor.
   - Syncing the full `UART_XMIT_SIZE` (4 KB) on every transfer (even 1 byte)
     is unnecessary overhead, especially with swiotlb or non-coherent DMA.
   - If we are copying out of `xmit_fifo` into a dedicated `dma->tx_buf`
     anyway, why preserve the `kfifo` ring offsets (`sgl[2]`) instead of
     copying contiguously to `dma->tx_buf` at offset 0 and syncing only
     `dma->tx_size` bytes?

5. Please also consider splitting the Renesas RZ/N1 `serial8250_do_prepare_tx_dma()`
   `tx_size` ordering fix (`Fixes: 16b539ffb574`) and the `8250_omap`
   completion refactoring into separate preparatory patches rather than
   bundling them into a single `Fixes:` commit.

Thanks,
Raul
