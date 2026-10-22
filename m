Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697804;
	b=YkcReKgGucUHr0FgsGSskYwwTYXpL2Iw2RLbaX6eXDApzS5u/T9kXVjzTVw2LqH1Z7qF
	 iI+DkRKr1rep9MzDDvRshtkrpP+VrYrFy+VRlzwCeps7Magi8cyLmJdGf1hKHQWrQHrBr
	 9R7Lvyp3HEHkCOD8wA40iE2ku45fRWwA6DeBWIVqYn+LPVs+SGJMJFJqyvvD6NQ8hZ1Ti
	 0NDH5nfvp+2ShYnNQobLo35HbYkGsgjjj2qOX8Ct/Pe4CR74uH/LI/IMDLIYcXguWYPQ5
	 dTS3xI3zyKvo9qYrSg6rRbM+dgmMYaZeFiUriZVBuywo8eHH6zEv2YC4oJxkj6yKF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
	b=qj3z3mwefQHbZnzfTyHMplv/Bw/g7+97W5zu0g2Xlk/+qi1Fojgu3GE2r6HjIM0zm5D/
	 fnM+qrnNszOpzvZu9eEDI+EiJCF8iwDxEfRKOLDONk/07yDlKpZHodHQKk+DqubrE0tHV
	 mVfOXlHoFcsCZDWV9CjOHTDiYPs6H9T8ncZg6VK+jjoI+lZeCoKwBrg2huR8QhUyIc9NB
	 kMIVOHltU2nPGJHqaYTo+c7qWqnRWCItcqTMTacM+M16iu8sRCmDb8/2OBIkjZgJUIUss
	 F23cJN1bMWSMkv8uRATgWcEsFOBXoOOlzH8+6ArFG+UHC+bFh0X/luKFf3megfg3F9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aux0XHRy;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69231606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69231606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aux0XHRy
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3fd91337baso24942666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697803; x=1793302603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
        b=aux0XHRy9keUSnl9ec248N3wTjgf+6vJY7w6kgBPN5l50LjSLm7+/XsAJiL2CUKTxT
         GiBpbm03ztMLKK68x9VGwy2yy0EnOJS5JEW31xXsDPNyMhrfdMiqtVe6xJHmFdKxKsI9
         qAw0hOmL7iXRDT+y4K82k0+Vfb4E/bY58CYnrHSNSYx8tmsxoEw34S9VLwp1GaLjY/x3
         TfUlTrkkagRbZr7Jq6ABqsY0iwdlcp46LEDG4mUImr5/kHBQKQKjKuEZrJc/as6WNHlJ
         VyhxtAZ6iHkgAt1tM6A6+4Z9cuhk9cf2Py/iFFtcLxLP8Dor+dDfGjpQO1Q8fjqlylZd
         t4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697803; x=1793302603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
        b=f0ziYp0YQYWoVjoHXmuCrFMhUSuOARRzyghStVMYN+TVDAPqeS39AwuMKCz6Dm1HQw
         oj6CaoVo1mt0XDPIsRqKDs3rafYHSOxVK54nvuy5URJSf445gnoImXEvUlbmr7t3qfJb
         jCozEDir/h0NZPab6t3+Q6r76fWT7y5K7SZEiznXiI0i+TjU3b2uifj/t7Rh/nViHxLC
         13/ivU643cqHb8iCXusSyvjvhC4w0V6zgk2l5KNXCTTQtaQAwHftFZUAgEtJj2kUZ7nC
         0Xwcfj+2F0iQypHhg5gF2+X32K2tU9KZNX4xwo41sgeSrUUyJODIWQ7ieGdRxUyH1Qr/
         zoJA==
X-Forwarded-Encrypted: i=1; AKwUvBzMSN656jnVO4aBW0xVRa25Mezryj+yuDqFcvbHf/waOVWGrbF5zVglDLono/+Ql5ll1Omud6P/9XuOqa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLXajrazO5KtP7uTF44/aSOJq8KLSRMMZdOnJIYF+8knLerUg9
	JpKgWsUYpYWzgGIVpawzh4WjoLKZCxPGSyh7w1aC4eYfLwttgXjQYSnx
X-Gm-Gg: AYBFou2DCw0XYjXURSpKJRkwtvlq4OzBolacE8J+5P65LriT4CkmzPiEMGadW5N9SBc
	kBzxNBEZRloLQNqCSSkXY52s8TBsPd+RofQVGvv+/ReIpS9dJx34UG9escKkGNJe6er62MA23tG
	2y6/wigGMNZe0wtLDBsUg17v9HBaUg3HqFIpYsFsIsGRd6WUwLMzQQQaOxML93Kv0Xrg8/Rgk9n
	rg1Uw3y8sFZ9EnDOAoR4R8TRiNIGsqThCT07l+Es7Aawe6QUZYLPcxo3I8bCMCsIh68i0ngSKY3
	XV65rfws5SePp+YHvVtRk32CAMXRJR7juv+KSh25U8kAWMT/ZWWk8CDACCwSMAmVRgMd9z0VPDz
	waa0pPq2o6rWNY+bXe3skOB+S2LHRMwNQ4hljIoCdIQHsgCOySItxPmqCsT1A6FC7cEoHUa1EzP
	PfTeMV2Mh/exzmIVH9YD/uYOJ5smuWZcStygtPkBX/UmMURd6sauitBTw59IqV6ECs3fSNfjbPV
	wIqCuXN+ADPi+kYvpC3l09c8wbr9IlbwtyaBPTkpuVfIPFIFA==
X-Received: by 2002:a17:907:dac:b0:c3f:98d4:dfe2 with SMTP id a640c23a62f3a-c46a908932cmr24015266b.18.1792697802406;
        Thu, 22 Oct 2026 12:36:42 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4f::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ca4fa2sm22651766b.49.2026.10.22.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:36:41 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Jinqian Yang <yangjinqian1@huawei.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Andrew Preece <apreece@meta.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Enable dynamic MSI-X allocation
Date: Thu, 22 Oct 2026 12:36:20 -0700
Message-ID: <20261022193620.2152038-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715035437.700601-1-yangjinqian1@huawei.com>
References: <20260715035437.700601-1-yangjinqian1@huawei.com>
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

Hi,

Commit 0d6a7c417983 ("irqchip/gic-v3-its: Enable dynamic MSI-X
allocation"), merged for v7.3-rc1, breaks bnxt_en on our loving Grace
machines. Reverting it fixes the problem on current mainline.

Hardware:
  - NVIDIA Grace (Neoverse V2), ACPI, GICv3 + ITS
  - Broadcom BCM57508 (BCM957508-N1200FJ), FW 230.0.165.3, bnxt_en
  - The same platform with a Mellanox NIC (mlx5) is not affected

The trigger is a ring resize: a boot-time udev .link file with
RxBufferSize=max, i.e. "ethtool -G eth0 rx 4095 tx 4095". The close
path never gets the HWRM_RING_FREE completions, then TX times out and
the machine hangs:

  [   58.221] bnxt_en 0002:01:00.0 eth0: Resp cmpl intr err msg: 0x51
  [   58.221] bnxt_en 0002:01:00.0 eth0: hwrm_ring_free type 1 failed. rc:fffffff0 err:0
  ... (repeats every ~3.7s for every ring)
  [  215.539] bnxt_en 0002:01:00.0 eth0: NETDEV WATCHDOG: CPU: 69: transmit queue 18 timed out 5118 ms
  [  215.539] bnxt_en 0002:01:00.0 eth0: TX timeout detected, starting reset task!

Bisecting v7.2..v7.3-rc3 on this machine points at the irq-drivers
merge (8b5d31123f41), and within it:

  good: 9023960b74ab ("irqchip: Remove redundant dev_err()/dev_err_probe()")
  bad:  0d6a7c417983 ("irqchip/gic-v3-its: Enable dynamic MSI-X allocation")

On current mainline (f47d223627f8) the same machine fails at ~55s;
with the commit reverted it runs cleanly.

So far it only reproduces with our debug config (KASAN, lockdep,
DEBUG_PAGEALLOC, DMA_API_DEBUG, CPUMASK_OFFSTACK, ...), not with our
production config. I haven't narrowed down which option matters.

My guess is that with pci_msix_can_alloc_dyn() now true behind the ITS,
bnxt switches to dynamic MSI-X allocation and something on that path
loses the completion interrupts, but I haven't root-caused it.

Happy to test patches or collect more data.

Reported-by: Andrew Preece <apreece@meta.com>

#regzbot introduced: 0d6a7c417983b

Thanks,
Vlad
