Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794186516;
	b=h0ZIsbQvpEIskO008Sv773ioG4JZU+7Uan+depAn0zR6I2elsHwng0SghDtVR7PKQXzW
	 uyrCZuRA+cFK1DBOswbqsuQnyP43YEcyzY3UtXig76ELDMo+XYJaEyDJsyY0taaZPp6zH
	 DWhZEi6t96+61fgJhptsybqAiE3S0fPdKt9uxOf93Vn4exr5c91fSznIyC4oMnf2iasAH
	 Xz9nEEI2qVdI0giHze7gyjqhy6cUlWKjwc89nGz9IAw6u4pwU8c9y+i5phTDLoi7znels
	 B486ahQtBzWrNHUx15glhzTbhfn7HPKTvEe3DKnJQYlA3mTb3VM1s8W7LLLKrDs8QfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794186516;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=144nZo3uJLZwW70nsT1o/W6WX1xIsN36CKzc59My6Ew=;
	b=GCc9apcuQWgLwTEGPm5pD0v8C14pBNBvo7iEyMJGIAgdNfdiM6jnM+MkLKf9XyMgXVLP
	 6qB2N2vzwEOcnzrMqOkHMA0nKnNvkpVydsKj2iBW5RBubeQohIg/H/oj2go+KOLvHnfEb
	 tloAVetrt23X7kEkhVsQDG2RHbUTjXtnbQo1uVZNr4HXeMkX6uGfworpoMyZ69QKholJw
	 H58K5a103b+4USaxR9PjAQmPVDGXYTIRoVbCnGoXGHK6yHc4eYWtr5xOO5zX+6RXR0E0x
	 bKdPCA8M7Ep3OvVE21AOm9rQgg9ZL+tfrcBWTWnxTGzVPdzyGEZ3NmTukN8OvQT2oPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=eXKwqpUy;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB947606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB947606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=eXKwqpUy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794186512; x=1794445712;
	bh=144nZo3uJLZwW70nsT1o/W6WX1xIsN36CKzc59My6Ew=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eXKwqpUybCHTrWpi/boGR7AxzhXhe7TAh1kdKsCOr0g5kHytQAv6AoG3xb+cdWV8V
	 SneeNivMRfnPw2gmIdfLABTxbKzB2jjiv2f9UHP6wvYnJk0jHJB0ZmRLL7vi2KOCpV
	 pkXkD0Axqpm8kcopLPAPlXNS+0HTnBF6pUiaGu3GK6yoDDneWD6AFVgO0qar+xAnKn
	 eaMYzLGuTTYpuKZaXhtwsxGulHDkp6Urst+0qTk1JjYtIv4cR2uB6IaaYNvIK18eIp
	 OoX9d8LJ52UaX/dlMZ4SGjWklIoOdCKU2N06/QzsO8Id1ISeSoqLwEPU15vZDD/zNU
	 yukmLPvnA7qXA==
Date: Mon, 09 Nov 2026 01:08:28 +0000
To: Qing Ming <a0yami@mailbox.org>, Corey Minyard <corey@minyard.net>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Asmaa Mnebhi <Asmaa@mellanox.com>, vadimp@mellanox.com, openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ipmi: ipmb: keep device alive across remove
Message-ID: <20261109010821.4172679-2-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: fcada103e9d882073758e56eb51586214354106f
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
> Allocate ipmb_dev explicitly and hold a reference for each open file. Mar=
k
> the device dead before deregistering the miscdevice, wake blocked readers=
,
> report a hangup to poll, and reject writes after removal.

Tested on mainline d48723711bae (v7.4-rc1-672), where this still applies,
in QEMU with KASAN, lockdep and kmemleak. There is no IPMB hardware
involved: a test-only I2C adapter module with target support binds the
driver and injects requests.

Without the patch, sysfs unbind, delete_device or removing the adapter
with /dev/ipmb-1 open gives slab-use-after-free reports on the next
poll(), read() and write(), and a read() or poll() blocked across an
unbind or delete_device is not woken.

With the patch there are no KASAN, lockdep or kmemleak reports. After
each of the three removals, poll() returns POLLERR|POLLHUP, write()
returns -ENODEV, read() with no requests queued returns -ENODEV, and a
blocked read() or poll() wakes up.

A blocking read() and poll() are still woken by a new request, the
request arrives intact, and an SMBus write completes. These also ran
clean: a write in flight across an unbind (the unbind waits for it, now
on file_mutex rather than the adapter bus lock, and the next write got
-ENODEV), an unbind and bind with the old file still open, closing with
three unread requests queued, probe failures from target registration
and from misc_register(), and 200 unbind/bind cycles against six
processes opening, polling, reading and writing while requests are
injected. The same stress run on the unpatched kernel produces KASAN
reports.

One side effect showed up in testing. ipmb_write() now holds file_mutex
across the transfer, and ipmb_open() takes file_mutex while misc_open()
holds misc_mtx, so a second open of the node during a slow transfer
stalls every misc device open in the system. With a 2 s transfer in the
stub, an open of /dev/cpu_dma_latency took about 1.6 s, against 0.00 s
without the patch. misc_deregister() also takes misc_mtx, and remove()
drops its reference after that, so for lifetime ipmb_open() seems not to
need file_mutex. An open racing removal could then still succeed, and
that file sees the same results as one opened just before removal. With
file_mutex replaced by READ_ONCE(ipmb_dev->dead) the open of
/dev/cpu_dma_latency took 0.00 s and the rest of the tests above stayed
clean. From reading the code only, poll() on the node also waits on
file_mutex during a transfer.

Not tested: real hardware, the i2c-protocol write path (only the SMBus
one ran), adapter removal with a write in flight, read() after removal
with requests still queued (from the code, these are still returned
while poll() reports only POLLERR|POLLHUP), and module unload (the
driver was built in).

The harness and this report were produced with an AI assistant (Claude
Opus 5.5), which also did the earlier runs, including the unpatched and
READ_ONCE() comparisons. I ran the final version on the patched kernel
myself and got the same results. The harness is available on request.

Tested-by: Chad Aldreda <ca@modelmiser.com>

