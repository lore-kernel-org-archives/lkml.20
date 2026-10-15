Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75A93EBF35
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093294; cv=none; b=rqfqZdANJyuLnZ6O1XF/Bk8VY4+GZt9Dn2ugJjLz+FTVvXtPL5dOoSmnenOaPHY3YnxuL7BpuCHR0qZZNB7NqCfpYlqdyvbATKsUz1mqHk3lr0NCvjA9TwfIMxj6A7UNBWZgKGXjIPy2AHbyi5R8y5SXvMbuIzYs4VlCr/nVjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093294; c=relaxed/simple;
	bh=bZQs56rDkIWlPjcycHP2pUZxtxjL9ufLKxmX4B1ppDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxgEcTHxS7RE4b8RuCMNJOOoC3EjQv1u04PHnpTA2Urj1XFxeLI3dfCcW31xRYBRkUjt7zAZJ7cXbbOYuYI26NVUxWhrq7uzr31kESOsGfbddeOIVnpuiOI14LbMKW5KB+Gd+UvHj+H2b/JhK88YOjKAMmmsYueYiM7LpvEIndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sorqVEAJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sorqVEAJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a17baef589so22607795e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093291; x=1792698091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUm4qss7qtZF/f3JgD710pihw36IfWdD94haCCfcfwY=;
        b=sorqVEAJ7hf4HiY4znjc/6kUVuUVKISL6QqIJWXDzbdiRuZkJnHvk8289kNSPFDLAG
         mZc6XfmNN67ERPUtl8lZmLDjj3xDOr+SN1WqNEO+95PlMIFZAe0M7/ckRJ2vDQpH1Jh0
         aN1GXS6ppIQGtJ8KtoBP69zS++Z1ot/P8qV/Iz4gFLXJjY8wOYs+ramwqlVMVN/y/1K5
         viEQs0Pd9f/hwdonnF4e5ery0m3BywhGgMVbadwCv15yN2znDUzmNQp2jJxO4sV/6ItY
         VF8jZo9mp192tL0fcXk800uNKTvWsYYYRjUGSi/HsMFt3RbPD7rSV4/NnNqFDJshTUph
         79Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093291; x=1792698091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUm4qss7qtZF/f3JgD710pihw36IfWdD94haCCfcfwY=;
        b=B/TxGURkxRJoBwJy0lQBmjtcpoJKVXR3g1eiwhnRM4yqMfIvj8PORnHHWqzXsLY30J
         srpuo7oCeBWZC5KsrBwkWRB612u4NWYEH8sEfORF85Wkfcn8oenQaW1MHBSM7TV2n6AQ
         2z0Itblk3brNBR0792uDXqGuiFSLieHj/b8VD6N69Mey3Y3wF+or4pEBdSNJPEWdyp+Q
         ugkOEW27B7CYNX8+vR3pvSPA12yW8hsGY8Jp1sBMHqNrJmV6aGYORohGBRnVzC5ja6xz
         s/k/i/kfEEfAtvh7aWJiIXMw1Kk3AcCjVzyLs8RGFqhRw3YiSXUXSFMDcFc7gA+DS8JW
         p67w==
X-Forwarded-Encrypted: i=1; AKwUvBzwPuPwvdWgmKYbhiIrl5juNs3qfw+Rfh4Op/LzwSXE8YjfCNCGQ2KOjmBsDQgNTI1Qo0PMpB1N5MpnoDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYItsVsL8TJaFSvD1s/23Ls9EADCl9SpZ98W+eQbj8QzjyNMn4f4
	alaMOTsD91CsB70akNjFzO93uRP0ouegZVOkQ6o4TpJIFxOaMUSD91GF
X-Gm-Gg: AYBFou1uTRvdIhM6x1xgM8WwQ+IBg/vc1wp2gbJrz5vH3HXk+q3xmS1OhQwCjhPacsU
	ovFJSPSwyOjMaxdy8ToAKhTG1gShRQpQKqj72kwHZysOMQHW1jo7wrsZkzhRvdTiwBAdP9YZguf
	rT+jgpgvYRtRRNFgZXlN7aY0N/tx+HvLkXYurR339N52+UyPS5p99716WZBdOWDiLzqeLv2YzuK
	t2l1/VUu5PHQ0fFfpt2mwEA3j7qzuHvlIRuNAnDibZW9HlocCDtSxV2a5Cpt3/F9NyN223DEWJD
	B8/s/SFx/M77N4mYRvsVSerIgEzwv6dnxLTU/S9j2ClbQrT64jrSBCRqOe7WtbI9BDYdAnyclvX
	EolaF8KD1C+tYcimUyLM1HBWeKHDZJJ4+BsUGgZ4019qOQYB9PhEySFHD17Qcd32VpmxfsLWl4z
	DC1kH76msXq6HUatA/elanU6TlqnKAQLcaVmp1DKJoukW3SVQJSTtDvgTnJrYGUKV+KE8WRDyCB
	Pl+
X-Received: by 2002:a05:600c:699b:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a18e4af334mr434073315e9.33.1792093290939;
        Thu, 15 Oct 2026 12:41:30 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c91c68b4sm304475e9.1.2026.10.15.12.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:41:29 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] usb: gadget: u_serial: implement flush_buffer
Date: Thu, 15 Oct 2026 21:41:28 +0200
Message-ID: <20261015194128.2545029-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-173201@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The window is real, but the use-after-free in it is older than this
patch.

I reproduced it on a Verdin AM62 with 6.12.113 and KASAN, with a 3 s
delay added at the top of gs_close() to widen the window. At shutdown
systemd closes ttyGS0 while the configfs teardown unbinds the gadget
and removes the acm function:

  BUG: KASAN: slab-use-after-free in check_tty_count+0x230/0x278
  Workqueue: events do_tty_hangup
   __tty_hangup.part.0
   do_tty_hangup
  Allocated by: gserial_alloc_line_no_console <- acm_alloc_instance
  Freed by: gserial_free_port <- gserial_free_line <- acm_free_instance

In one of the runs the closing task then faulted in release_tty() ->
tty_buffer_cancel_work(). The KASAN report is the same with this patch
not applied.

gserial_free_port() frees the gs_port, and with it the embedded
tty_port, while a tty still refers to it: the tty core keeps using
tty->port until release_tty(), and u_serial has no install/cleanup pair
that holds a reference on the port meanwhile. I will send a v2 as a
series: first keep the gs_port alive through the tty_port reference
count (get in install, put in cleanup, free in the destructor), then
flush_buffer on top of it.

Greg, please drop this version.

Thanks,
Mehmet
