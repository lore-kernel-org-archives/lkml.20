Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408307;
	b=4IbK1hLkawJcUoeZEul15coSDX4wr36VgmTe3bSbzi+Bo3IumdCsGCPVmpXtjllDZnj+
	 d9rK9mc/j1obEwtd+ZAl5Lpsk7iVgkPC3ybKQTxVsW3wL2BhHEThUoKNAJUPEkObONLIE
	 wNx5GUoEofBp7nOlb3Y/gG+GJyPpkI9qLIlfczULix7Kkv0SW5R0wBtrERevjwjI4+Mze
	 yOt5EIzRS/B7ZOgDhRXM0EgJF2YF6FWjf3AdR43Ah0o1ARmYw+LkRc9Au6T51nP4C0tIa
	 0xBD1eMJIl28F0XxgkrX5JsEyIIB+Vjr9QZgmr0yLB6fnIj6l3tIroUf6KswUBGd0ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zW5UvcivH6E7BIbJRCa4jWGgQMxs7esFMSqsxUz89DA=;
	b=rTpEXadW0F/D0OT3r4P9Ik52amTyKJILRUP+ugnZ+e/RAQbjZBv6QpKsyFGwCruZcYbB
	 rBu4rDwFiTVBogIViPjkycC8pV8+xllXJUZF/kf11TGNopzs1ULAs4YL5gQqjm07RHAfY
	 MMELhO4D2tfasBrrpdo39P8CFOnLaMurpMRVteVgTBMcqnz24ouW6uUaEvSX7w11ETycy
	 Gw4+TDhS0JUFtgkwg5gervqF9PTjST2qc+1LDrAaKilff1KTG3MyTGnueBwDq8RHd3d9q
	 G24hZrd0ou0ye49BXVwz6ZCbKpJovGQIevLiJ0vrrMVRthZhIw6p74ibJaVwSOEeyaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEPUfn5Q;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEPUfn5Q
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35b2c599f43so521970eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793408306; x=1794013106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW5UvcivH6E7BIbJRCa4jWGgQMxs7esFMSqsxUz89DA=;
        b=rEPUfn5QmD5IGvy6JDCcv65UrQ3AIzRqq+JBlnuAB4gSyrvMqONNeVFhN/n6TSr8IH
         ArXmDatgYTnyKWKJcCSSHb3T0WCuQHqgbU0V9jQb8xIicT6cru/o/QFl6v7WZieYAbF8
         6Ndq28PUTsCisA/XDR7QJWeoeGpqBSCpjvQrgyXhW0OMl/1iIA6WWzbOK9CEN0+nCxvW
         wOD6mlHul1q04YEBDowxEYB0xDPtkkamjIw2CVBwn8pT6oNKOmTkrwYdCwceQKVNweL1
         JyPqDYPF0Dm/bIleQqcRU3BsUYXV7hImQNfsjSfTvmgwYAw7tMhnCNwu6RbO7CVr3XmB
         BpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408306; x=1794013106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW5UvcivH6E7BIbJRCa4jWGgQMxs7esFMSqsxUz89DA=;
        b=OsoMLEMu6KGN4GdXDj/t6+HeOQ2O9CtXQc+SvCmB7RPs3zZNaiTXlzSxhauoDZLKZZ
         tFUmmjm4nV9k2oqVGwZaqeDdmDj9HOOWezUfCGdiaIdN421ndGfSyY4mzFyNUz3mBNLX
         of4ghDHdb9Qd2p0UaPWMq0vnljTb0y2Vi+Adcgezr0wlPzONWfIN5Uvt8kESZ+WVmNiZ
         RxYQZ10AAuD2b/2rG/h6n6BxhtUGL+EJcmSJe6J3+EzYAbo2XAkLrlnyE4vlqFqKMcyl
         ZERfh9v4R5dwQ0hILKC/JjY8Ujz5S6HDrcBX4jFiDnkTevCPNqZqch5UO72lU8GW9asF
         cxog==
X-Forwarded-Encrypted: i=1; AKwUvBx69t/LhdsccRM4Z3MpWII9AwJMaJZVBh7x7aAEF1WnYAY9IqBwp5S8zzMjAc5chHdq5muLDL1C9TaMBPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtBXyBXjuRJ7aMeC/MvdmasiJHs3kjSZODUdmY4APUU/Fi7G8u
	/bgH0y8YnoV2+Qg3zkphXSe3pP+kGEh3u2NAKJoESPds3ETj8ldXVEaK
X-Gm-Gg: AYBFou1d5gdfoiuP+u6NxEe67+H1VE/rsVijBr2Jf2gW/rOaaA9638Z013/YF7hNi5h
	38CRRHupYBCNOGdzfj8SfWCRGX2jDXlLVWTe/ShXZ79PHK9VuCgrzxgIyERH3Z519/HR0xhnLrP
	YfWKW0SS2zEQF6ZkCm2wIOUI3KLzizq4UgOB5SyajhzhGdByru1yYbAp1nWoc+nHJ3x51825Rhh
	gISKFS7Hwbcb9yXZlSUZORrMyV5BAApzN5G2kZsSPeCjGKK6VqjfYJzCCFMNuck8E2piBrvN2g5
	TH7JSjqsjJ5QEHdXfuau1zmz7SWVkRJSyK6vieDnNitaactbv9ywZKhXC91trmkE7TlkcmSTUp2
	MZsCYZ1I5ufnXO/DAAxBfZcyVK/TO6sEnhYahG8T2bgMLXJyBlVmchKZmVrKMJYBDB35+fFRgcP
	StrRuPHvnwDQabWUnbIvwZFdcH/aE16aUSjeYjZtWqnk1o2wl5TM5joqTqN6WgikO74SGzVb9Sp
	3p1lK2Cmt3NhhDFKeuL+tyYimAUc01ste3Nkeea8rBaOXdsnKzVE61r+ijygu6oowkRh81S7G4S
	7ClufxeFkIR7CIkzwp2Xn5gUe4SAieSMnhAN7cOvO9fqIWbYWPrbQnpAZcMNWRkJ5AbClfIyeSv
	dYb/A+OkUR7h6d6ABDoBmsgelHjzhV1IoB+FP3D6t4s4ZSgfBKxwXK/RKGstLLu7css0hqlcWGh
	uhJoXvcSN5Yx4s7g==
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr6672963eec.16.1793408305799;
        Fri, 30 Oct 2026 17:58:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm13094902eec.2.2026.10.30.17.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:58:25 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Frank Li <Frank.Li@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: dmaengine: pl330: no device_synchronize -- does terminate_sync guarantee the transfer stopped?
Date: Sat, 31 Oct 2026 00:58:20 +0000
Message-Id: <20261031005820.3354888-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hello,

I'm trying to clarify the termination guarantees provided by the PL330
DMAengine driver.

PL330 does not implement device_synchronize. Consequently, for PL330
channels, dmaengine_terminate_sync() calls pl330_terminate_all() without
any additional provider-specific synchronization.

pl330_terminate_all() requests termination through _stop(), which issues
DMAKILL using the controller's debug interface. However, I could not
establish from the driver code that this operation waits for the channel
thread to reach STOPPED or guarantees that all outstanding bus writes
have completed before returning.

There is a separate callback concern: PL330 uses a per-channel
completion tasklet, but pl330_terminate_all() does not explicitly
synchronize or kill that tasklet. The tasklet is killed in
pl330_free_chan_resources().

DMAengine clients rely on dmaengine_terminate_sync(), or
dmaengine_terminate_async() followed by dmaengine_synchronize(), to
establish that the DMA operation and its callbacks have completed before
unmapping or freeing buffers, as described in
Documentation/driver-api/dmaengine/client.rst.

One relevant client is Samsung UART on Exynos. Its release_dma() path
has a proposed change to use dmaengine_terminate_sync() before unmapping
and freeing the RX buffer [1]. The safety of that ordering depends on
the guarantees provided by PL330.

I have two questions:

Hardware completion: Does DMAKILL guarantee that all outstanding DMA bus
transactions have completed before the command finishes, or is an
additional wait for the channel to reach STOPPED required?

Callback synchronization: Can a PL330 completion tasklet still be
running or become scheduled after pl330_terminate_all() returns? If so,
would implementing device_synchronize to wait for the appropriate
hardware retirement condition and synchronize the tasklet be the
preferred approach?

I'm particularly interested in whether PL330 currently satisfies the
DMAengine synchronous-termination contract, or whether an additional
synchronization mechanism is needed.

This question arose from a research static analyzer for DMA lifecycle
ordering and a subsequent source review.

[1] https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com

Thanks,
Samarth
