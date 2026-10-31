Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460430;
	b=0OK2JGjbF5vNfUmnJcqy57sIqLGEF7ZE94flaoXgA65hQ2PNZEI85oqPBBqzVVarHS2U
	 j2a2S3QGSnS36ziFWSN0w/XisV2YuflSVGn/1wul6bGE0J3y2jNxYOnoOH2dvxm33hNN8
	 ZMfvAMcXRmDIrnyhdhK1B26uFJyzfkT4Y87OaXCnrtTkm72PFS0PppQbJEYCrS7VfUZZB
	 6kvetX84uIXEOOg0QSWCG4kZBN7hlHT4ATIQWenIEMDNJednxEYVhvMQCfIJTk/K7g5rG
	 HBCZNsentJiDgKDecdH/Vfx+eW3oAsgwXiO/Gg25hnA6m+9tjVlJeMOIF+tnnWfSifQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
	b=I8HU1+POcv+ZTvJlWZgMuonR87xoL1YzQPvLlvZ3OBrfLLjXijVbCrVN8ytDe/Er3iNu
	 mvgwr+IX+hdvqRQ9CQvORtGduedghUYW5rKdNIkVHHKyW5bX0XE7A0fevjZUGzWOluxUM
	 ejHelJ7etDRGRmLu6UnbxEzjR+oNGwFh32jsvJUQ1gLrRELa/JYOoj029OOzlRdbtwzEs
	 gzlcvkls86Enos6RceQxzA5BaL/KDi8IX+MJDMXZv8yMm4fnmbqfkZJqncdyRJhaYxQug
	 IaPEVCOpdEz6d7AcTc4U/U+QOrPP6bdGhYi38ic3x2UTY3xSFsheyQWZbARSlFhBAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWXe8N0b;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462BF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 462BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWXe8N0b
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso1116432a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793460429; x=1794065229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
        b=MWXe8N0belkFGCTDLmOtDYvkv4S5/Wrr/o60zDaIZySzJ1rJDRGKyDGHnlV+YuzkO9
         8MY0JGsKKU7OR+YS/ayGOWtwIEox80KCmdXVLwJ18DDr+2G2Yujl7RaKIFQcNGGv07j7
         KhGerTpoHppHec6Y8JtjBGFq8ZyS3k+fmg1DoZNI8c2pf0uV0LJfTRl8pqiS9jJXqRw3
         x2Dlb9eijfKxvTcVrkcnIxlzpasIjll7zmtHdQc5p1UWltlzG34tILMiiPAdz7Y8joTk
         GT2OkvdpcYj9p1+a/pejwMlSt+Lx7dP7nwZG2X6oc+D/LJPasTi9tVys7w8JgJXEf5Mm
         gkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460429; x=1794065229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xTNa3CisyEifdpOcMGd1ZFRXYvZSpSVI/VVxCfsYBaI=;
        b=MTOocFnj8zMlDzAB8NdpnCjsilapPVCWoaNAnmcIEYS06dno+1mm/+TlBJSBMhp77/
         Nj5qRylOXpK8uS/dVUVR1ZsOmIRQo6JGYVZGXaA7wJxRXJC+JhHV/1dcxe4yJWXVH/3H
         zO5nnijpt7wL92VOTScFvqHdfrMjDmOXrncPMcwjCHU7o4kDR04+3yXOLDysciILHtal
         kyfXoZ9OAVGZw+trE2Ag+v+nrI6U5ZbePG7rie2LTSAexoocfgAdEzkMNkpXMMKXLPEK
         yGMw8K+o6EMadhu9kaBMTvP3X5EEs1nJhEOrIY013vyE5UGB8kOCkJmojzlE8XEvO4LC
         7maw==
X-Forwarded-Encrypted: i=1; AKwUvByP/G9c6+enQCWZ/oDNk9/gbNsXizsyF9td7hxe0n5usBSnD2CI4dyjWZvWRAQl4X8uMIyNEe1S8XHHF4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYITEYOkZOEICzixTxLvxLNs9pUBrm2hhMAtFCSpYpHwXYm305GE
	SfKmw0Q+oDdILrINMqjVQ3QNJc9M+qp181rsqkU9joRovN0tCuwmDgDK
X-Gm-Gg: AYBFou1nX42SDLZjGDNnWrIo0G/vD7BVk0mpqK8vqVjGfSx0NH4jnj/e2hra4c5zbMm
	6jW6shOBshGKLt2aua5Yy1Gr0YAt/brfPDpcPR/BZfLp2RITdtpEZWGhCQXo9O1Kh4KugqEyO3V
	CFVU+GvfJtXrVOSl/qBL9xgF+F45xIhu0ZQiAYY0tvYl9IxP55fAiUG6RQeBKVemEt79fjG+0fw
	OmqNBW+NVraxu+JVF+twEVGXed8gokN7TZzssLoVFoPA3CNTmkh8N43Th05pI+OfzDPwBQWKL96
	id7VrItfblx456CMLReSF7GFqAHMKg5P/0I/wbJWpMaQq8+iftdSPQdXxYjPC7N8iNhDqwPzHRU
	736Rh1NrT7yljpI5d5QscN3ZbdYLOlYzlQpN62Ka/auyUuNFxolPqvWpo6n8jctkNM4wMdKZgmK
	x2cTS6c9/5bVI9G22O39YggIho3NmYVhwZR3Uj1KQyMQ02UZQRDqShNUB9mWMlets1axBTDh47F
	/5DSvbXvhFkAJOxj6E+amBHeEJpvDLBnTg6MJXx+8pyFNB9XJUJ8DjbqT7X0/9VpUbNyJKaZ8sq
	sNJHDzX0NrOl2+iQnXDT+U7yf/wU2rKrSlx2xcIoJ15Gcx8N153e
X-Received: by 2002:a17:90b:534b:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ae898127f4mr4404747a91.24.1793460428503;
        Sat, 31 Oct 2026 08:27:08 -0700 (PDT)
Received: from kei ([222.141.54.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09615125sm1731025a12.1.2026.10.31.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:27:07 -0700 (PDT)
From: tianci xie <xiex16070@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Samarth Narang <samarth.colleges@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tianci xie <xiex16070@gmail.com>
Subject: [PATCH 0/1] tty: serial: samsung: fix TX fifo underflow on flush race
Date: Sat, 31 Oct 2026 23:26:55 +0800
Message-ID: <20261031152656.1422-1-xiex16070@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <2026103122-repurpose-cost-2da7@gregkh>
References: <2026103122-repurpose-cost-2da7@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 31, 2026 at 09:54:55AM +0100, Greg Kroah-Hartman wrote:
> Always just send us patches, after testing them, you never need to ask
> if you should do so.

Understood.  Here is the samsung_tty part of the report; the other four
drivers are separate and I have not touched them.

The analysis holds up against mainline.  Neither s3c64xx_serial_ops nor
apple_s5l_serial_ops has a ->flush_buffer() callback, and
s3c24xx_serial_tx_dma_complete() samples tx_bytes_requested before it
takes the port lock.  A completion that raced with uart_flush_buffer()
therefore advances the freshly reset kfifo by the byte count of the
discarded transfer, and since kfifo_skip_count() does not clamp, ->out
passes ->in and kfifo_len() wraps.

One detail worth adding to the report.  In 29bef7990845, where TX DMA was
introduced, the callback advanced the buffer with

	xmit->tail = (xmit->tail + count) & (UART_XMIT_SIZE - 1);

so an over-advance was masked away and could not wrap.  The wrap only
became possible once the driver moved to the kfifo helpers, which drop
the mask.  That is probably why this never showed up on the older code.

The patch follows the 8250 fix in 9e512eaaf8f4, with one addition.  The
8250 changelog says that clearing the outstanding byte count under the
port lock is sufficient "since the port lock is held when the kfifo is
reset in uart_flush_buffer() and in __dma_tx_complete()".  That holds for
8250 because __dma_tx_complete() reads tx_size inside the lock.  Here the
count is read before the lock, so clearing alone would not help; the
patch also moves the sample under the lock.  The same gap applies to
serial-tegra as reported.

Testing so far:

  - BUILD_RESULT: builds cleanly with gcc 12.3 on x86_64 (COMPILE_TEST,
    CONFIG_SERIAL_SAMSUNG=m, W=1) and with aarch64-linux-gcc 13.3.0 on
    arm64 (arm64 defconfig, which enables ARCH_EXYNOS, ARCH_APPLE and
    SERIAL_SAMSUNG_CONSOLE); no warnings from the new code.
  - BOOT_OR_RUNTIME_RESULT: not booted; I have no Exynos or Apple board.
    Runtime behaviour is covered by the exhaustive interleaving model.
  - the patch applies to mainline at 83f32c773255 with git am;
  - a model of the two actors, with the kfifo semantics taken from
    include/linux/kfifo.h, exhausts every interleaving under the port
    lock: the unpatched callback wraps kfifo_len() in all four flush
    scenarios, the patched one in none, and both agree when no flush
    happens.

I do not have a Linux machine of my own.  The x86_64 build above was run
on a rented Linux server, and the arm64 build was cross-compiled there
with a no-libc aarch64 toolchain; that is as far as I can take testing
without hardware.  There is no Exynos or Apple board available to me, so
the model is what stands in for a runtime reproduction.  If you would
rather have the flush modelled as a KUnit test in the tree, say so and I
will send that instead.

Thanks,
tianci xie


tianci xie (1):
  tty: serial: samsung: fix TX fifo underflow on flush race

 drivers/tty/serial/samsung_tty.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

