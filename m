Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773973;
	b=T02qDyOhdKaLwJ0PzoGPMFtrUjwSFc7JgpDDqQdayb0aexTBOaTP7kVd7ZDKRPOnMEEG
	 CenWqSpGP+6mXmY2urm/VJgprYoiMRLPqF0EeOMDgJv6q4/KQEutzQvocWIrcpKnQbZD+
	 gU/h00R8JIiggwZB3M3cBgn+4iDSHayF+8/a+4Vv6bKS5R0xMj/J4Z5k5EGP5o1QobOXk
	 OGUuGXKfO2Qho26Ex2vICV9CBzqFfUrGIQ1E82PcLVfdMSdImcwg08vse+Z1yWGS5IwJp
	 ZpuJe50VGjIU6LeQcq4z6BgVVFJ1pjGPUrg6Ja6QX+Rc7X1NJYa+KhA1q2RKeqwfC5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7MtaSYtpxrVvV9gqHJYiTe5lCnL/PoZDYLQmPOd8KEc=;
	b=UiLZjIXtm+aXX+GVJ/pKefu5Fcv3wqo+ylPWx59UTJSKa63qFLIvvuJhDLfqRGaY9t+x
	 LpyerbH62G03YZeUQva1Exh4V/QsLRruZxIjOkQgGYcBy0ORHHRWycMAf6xl1sYrPXXQr
	 yLs6v1YGXfP/bojE5d3DMoTn+7F51LgNw8+f99QfehZVXN1ihzfNIXoopMAMe6iIklQuT
	 fkVGv8n/zbULs8jXFCCvbwGS+wXq3vpHLZhMNdHFC4QTRF5Ao3ZEb2LjQHThlvRSTsJQg
	 rxEtlzmeX1BjpGI01fKx64yw90al4HOtg2M+lPNW6A+RLSHWqaxgZm9zowo5OElqRmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPSXT4GV;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B79606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B79606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPSXT4GV
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso187142a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773973; x=1794378773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MtaSYtpxrVvV9gqHJYiTe5lCnL/PoZDYLQmPOd8KEc=;
        b=DPSXT4GV1NiparnT2PqogtJHUluR1tECN4Xh4xI6p3LagzYXqMm7E1CFgfuF7n0HRE
         mW11plmlvV/enopMNFu3SnMkWhTWRoHH6bOiksfb/LnOJAiO+JvA/TtpqnyfbHt62HW0
         R8XLZUCVQiWo5uhHXBG615QyXjhcchQlFHHai9Crz1le5OcD5iBhVOF9anpal2tfW6HX
         HFEvvwwZRBHYthaJT+MxYT2y0e/gNBtr8YIv5iBVdX9ymDWycr+N+OCWJk9NAP/kOMJ2
         Sq2BhKN9WAXEKRSdDTXHUOtWOSmj4MbBKTKv4ThTA7dqiX8T13RX80oz/bGyBUH2YIXY
         vwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773973; x=1794378773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MtaSYtpxrVvV9gqHJYiTe5lCnL/PoZDYLQmPOd8KEc=;
        b=hAYUaG5+GuxF8p4s4l1xsukAFn9qU8Au7ZBRjHTTFB5lKLw41kQSz0tQb6yOMU2+n9
         Ixik2YSXOw8JCr6DJcN0ZowyjYgdIzz7yFnIx6IS15INoGmDwm2Q376ReHN+dxO6MN6m
         OqRege1YCWqQX6MdEUGSsfIfvWpWtF7G4x8Fn5hv46CrbDtukbR0h02c/5BD5UI/DX8P
         /m2DhgUOJOLjbmu2PmLpZplDksJ25Rvq5J0pHUUBS/3cSSVPUwtGY4cH4U9ZtDX5vvG6
         su7n65AL0v8PYtJ3gFzeIJvEisGZgwKc+UohRDW6V1aPuMqOSeDzrWhIo+FQ7CzoqU0q
         gxRg==
X-Forwarded-Encrypted: i=1; AKwUvBwwe9kTy9uebgmSCz7bLDpGTybHQ5GszMwZI6opuohdcCgUABilbWD+yIWXcqFqsokTtMGx7zB6jwKQvIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iHtsWkdskfdyahFcXU+jf5C02VSiLA3zca+wCNiPzgSNd5A10
	Sf1e6eS0s3a0d8MzCF5g088pCXd4Nm1zpsAhB0kSqXLtjWuYMdTavDrU
X-Gm-Gg: AYBFou3QaRpJGbH7Va75LmBw84P06j9n7EcxHqV5mhu4TR0opIyAeJp90LGRN2pCCHE
	+xKzl+HdlahIcuCOPK/fQ0HU7NkZA7/cD18vpPp5o0XBCSbhmTot25fdOPhGffLABxpvOjuuJvA
	PQUgiRTj3iiiONoQ7je7TDvVYOUKUDNJmPUMtg8z+xr3/220B421NqAdEMKgq+b2728kbeeA1Gg
	wymt9/rblCRscbKX6wVLMgydRTTFHHvmH2UwsRnbSOXRrbTt5nbC883ruWgjGcUeNA5UP0IVsGz
	paFyzP2rylVisLrwuv4hEdHs+RyKQ1ldoEBAf1vNiX9itvZ2vGx+GZtQ/iiYtbG9E8mIec1oCjn
	LiJIBzEaSl1yZzE0deowN/hzTFmE/f6TlHNrJj69nd5+xcw1qYZEKPeKFjcq/FEq6LfX51+H1pP
	Rx6QJqKusROB6vQdXw9bJXxhSyxMgOFRiMBFvjisQEvaXxtvb0KyDzDmw60RnXUJOTDZntiNXtN
	R5Rh+tbHChzDCgndL5vUKgeb0K2wlL/70e7TSClKtH+I8gYj5L7DSHejLxk5koFENKXYknGK5AV
	xyFaNVypnHQaAlARo0B9Gy3lQAPctgdlXus=
X-Received: by 2002:a17:90b:44:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ae896f8546mr13356308a91.13.1793773972828;
        Tue, 03 Nov 2026 22:32:52 -0800 (PST)
Received: from ubuntu24.localdomain ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0945104dasm2583207a91.17.2026.11.03.22.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:32:52 -0800 (PST)
From: BeaCox <0xbeac@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/3] net: ethernet: disable async work before teardown
Date: Wed,  4 Nov 2026 14:32:42 +0800
Message-ID: <20261104063245.23402-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Three Ethernet drivers free the netdev while an asynchronously queued
work item can still dereference it.  The queue sites and the handlers
differ, but the lifetime rule is the same: stop the producer, drain the
work, then free the object.

Patch 1 fixes atl1.  reset_dev_task is queued from the interrupt handler
for link-down and DMA errors and from ndo_tx_timeout(); link_chg_task is
queued from the interrupt handler when ISR_GPHY reports a link event.
Both works are disabled and the PHY configuration timer is deleted
before unregister_netdev().

Patch 2 fixes enc28j60.  tx_work is queued from ndo_start_xmit(),
setrx_work from ndo_set_rx_mode(), and restart_work from ndo_tx_timeout().
The interface is unregistered first, then the three works are disabled
before free_irq() and free_netdev().

Patch 3 fixes xgmac.  tx_timeout_work is queued from ndo_tx_timeout()
and from the DMA error interrupt.  The work starts disabled in probe,
is enabled by xgmac_open()/xgmac_resume(), disabled in xgmac_stop()
before the DMA rings are freed and in xgmac_suspend() before NAPI and
interrupts are torn down, and disabled in xgmac_remove() before the
IRQs and MMIO are released.  The patch does not reorder the existing
free_irq()/unregister_netdev() calls in xgmac_remove().

The works are disabled with disable_work_sync() rather than cancelled:
it drains a pending or running instance and also rejects later
queue_work() calls from interrupts or timers that are still in flight.
This API was added in v6.10, so the stable tag is 6.10+; older trees
need the cancel_work_sync() form of the same change.

The three patches are independent and can be applied separately.  They
are grouped only because they fix the same teardown pattern.

Testing: the in-tree driver code was run under KASAN on QEMU/KVM (x86-64,
2 vCPUs).  A SCHED_FIFO task on one CPU queues the work and keeps the
per-CPU system workqueue from running while a second CPU unbinds the
device; the vulnerable kernels report a slab-use-after-free in
assign_work() and the fixed kernels complete with the work still
pending at remove entry.  The three patched drivers also build as
modules with W=1.  There is no physical hardware in the test setup: the
platform/SPI teardown paths are exercised with test devices, and the
atl1 probe path is not exercised.

BeaCox (3):
  net: atl1: disable work before freeing the netdev
  net: enc28j60: disable work before freeing the netdev
  net: xgmac: disable timeout work before teardown

 drivers/net/ethernet/atheros/atlx/atl1.c  | 12 +++++++++
 drivers/net/ethernet/calxeda/xgmac.c      | 30 +++++++++++++++++++++++
 drivers/net/ethernet/microchip/enc28j60.c |  9 +++++++
 3 files changed, 51 insertions(+)

-- 
2.43.0
