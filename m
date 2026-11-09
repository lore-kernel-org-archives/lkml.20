Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236752;
	b=2Qp2sXrf6PSYPJRGlX1jBXMsXMEh7WMUXxv03NxHApAcM4A2fzvpOuS+tezRvwvM49sg
	 IQHK0HjaetvEIiLcYrGM7tRnnbFz4M8g6jacOWsgVkQbUxPPbVogXcCoq1g6NQzv/4wOa
	 GYNuv9ukboqXOum+n9fqf2wf5yynud8Z/1sRboVcbd1Hbk+sSM4/ekn+rydklRGfLxnEM
	 yLDQ0tNmgxDrEuMUhjoCdm5/8jsQXn9EnigNZ0lqxeCddhxFY4MKEZzrBO9UF+0alV1YA
	 kiNWgBzAeZGhgxgEFxFeX95oB3KZw00+wulWqeaXjSdHYfODXDUFYIgPNOpuXfr13Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236752;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rERndQDfKiohKyWa7y65yonoeFOIaOT1RbP8CpxHb0A=;
	b=FSSryFybDf3pT2ukqhwkKRpgjwv+Nd2ii7voazmeS/geIvMuNi6/xULmC5reMrJ6adBG
	 qoVGYxCz1EFAuNGaJzibqmd8MGm0GRHxW4qEQxaqtpxHbaqb7yk1Gc59V3PaKYFFY/CJK
	 5WZmm0nf/8kMAZX/Jaxf7L6EG9ICUjBSnq32/avOsYg7rOfPZ+/einKEfMVgJJGyVOgeB
	 wSY2G+qeheZAAqwS5egap7tLgf8LHwDtsmubnAd9QoMCO1jH0OBt7MV3KenirV3qJVt+s
	 wFqR8cbf8krGDHsShAS56oYozdyZoHZJ7OLzS0ktEWz8DmW1qcybSmLsxFWwS0BfXcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b="b/gk7pit";
	arc=none smtp.remote-ip=185.70.43.18
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38715606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38715606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=b/gk7pit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794236748; x=1794495948;
	bh=rERndQDfKiohKyWa7y65yonoeFOIaOT1RbP8CpxHb0A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b/gk7pitifmhc4R3swQ71HJWstmXcjRA9sBF/LQCyWlx4NNVfVZi4fhauFwAuMGPB
	 l9YKFvE6mdQwoZKFVddVBlCtHc8VbSttb6SyY0ar4ljq1RbZBn5GogtDjkXdbHf942
	 QJQQgzv9wJCwoOTFVdhCKJGP8evkdy4UxlC2xbtsPLxxk36ZvqpNv6nf2vxpk7Qg9a
	 21jbg1AxlRDZhPgjWTdyuLWXjTyXkTcnCGbIjtR0l1bJDXdZpTnyuJJ0d59H2B3f+Z
	 cdv9HvTMyLjoFVxjR9ZhAiwhsD8ycQBxiMb8gV6w5PF5f+stuilEIryb8w0ZNp3kjQ
	 tD22w3TP8TwIQ==
Date: Mon, 09 Nov 2026 15:05:41 +0000
To: Qing Ming <a0yami@mailbox.org>, Corey Minyard <corey@minyard.net>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Quan Nguyen <quan@os.amperecomputing.com>, Jian Zhang <zhangjian.3032@bytedance.com>, openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ipmi: ssif_bmc: keep device alive across remove
Message-ID: <20261109150533.567948-2-ca@modelmiser.com>
In-Reply-To: <20260805123304.12652-1-a0yami@mailbox.org>
References: <20260805123304.12652-1-a0yami@mailbox.org>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 390abb098eee50e48cbe1821197cf19e23e4811d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Aug 2026, Qing Ming wrote:
> Allocate ssif_bmc_ctx explicitly and hold a reference for each successful
> open. Mark the device dead before deregistering the miscdevice, wake
> blocked operations, report a hangup to poll, and make empty reads and new
> writes return -ENODEV after removal.

Tested on mainline d48723711bae (v7.4-rc1-672), where this still applies,
in QEMU with KASAN, lockdep, kmemleak and DEBUG_OBJECTS_TIMERS. There is
no SSIF hardware involved: a test-only I2C adapter module with target
support binds the driver, sends single-part write requests and reads
back the responses the way a host would.

Without the patch, sysfs unbind, delete_device or removing the adapter
with /dev/ipmi-ssif-host open gives slab-use-after-free reports in
ssif_bmc_poll(), ssif_bmc_read(), ssif_bmc_write() and
ssif_bmc_release(). A read(), poll() or write() blocked across the
removal is not woken, and hits freed memory when it is signalled.

With the patch there are no KASAN, lockdep or kmemleak reports. After
each of the three removals, poll() returns POLLERR|POLLHUP, and read()
and write() return -ENODEV. Operations blocked across each removal wake
up: read(), and a write() blocked behind an unsent response, return
-ENODEV, and poll() returns POLLERR|POLLHUP.

Normal use still works: a second open gets -EBUSY, a blocking read() and
poll() are woken by a new request, the request arrives intact, and the
host reads back a response of the length written to the node (the stub
checks the length, not the bytes). These also ran clean:
an unbind with the response timer armed, an unbind and bind with the old
file still open (the old file gets -ENODEV and the new one works),
closing with an unread request, probe failures from target registration
and from misc_register(), and 200 unbind/bind cycles against six
processes opening, polling, reading and writing while requests are sent
and responses read. The same stress run on the unpatched kernel produces
KASAN reports.

Separate from this patch, and the same with or without it: removing the
device before any request has arrived gives a debugobjects WARN,
"ODEBUG: assert_init not available ... object type: timer_list".
remove() calls timer_delete_sync() on response_timer, which is only
set up in handle_request(); the call came in with 7fc3e2546cf3 ("ipmi:
ssif_bmc: cancel response timer on remove"). There is no KASAN report.
From reading the code, setting the timer up in probe would avoid it; I
have not tried that.

Not tested: real hardware (the stub delivers target events from
process context, not an interrupt), multi-part requests and responses,
PEC, epoll, the driver's KUnit tests, and module unload (the driver was
built in). The stress run used non-blocking file operations only.

The harness and this report were produced with an AI assistant (Claude
Opus 5.5), which also did the earlier runs, including the unpatched
comparison. I ran the final version on the patched kernel myself and
got the same results. The harness is available on request.

Tested-by: Chad Aldreda <ca@modelmiser.com>

