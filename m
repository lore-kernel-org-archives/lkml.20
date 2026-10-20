Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792531231;
	b=IHvS46g/zlzMn/VjkjnmdQM4dDWEcp/pYSnFv85D+qWOnWuxoDfLRP2E3NdOebecGRvO
	 hP8V6XX7/ZKUSIA2VfFIN6ppK5FTEdQxIyNGRQLMe20FH9YM/90r1ZjyTAd1t/oxRRfpU
	 7a1maoyzqy99ADwxpQ/jw39TnKLsSCNbmctkEt/ccy5Lr5g0Omg3u8gV0I/NaV+SgBIbP
	 e0Jx6KWZoICBqqRxnbL2/+oYx3OBUZFfFOJ2d78EDKvFLh806ezCAyp6VFn8dP/lEBs4M
	 J8w23/LNE9kqebXGsN86Wc4n5K89x24muuSoc8C0EfJpXMHN8oSlJgyb8PKkxdjiL6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ke4Bp1uq0aLEbcX2egfOr2CbakS7xm41rD4rPHzU2KE=;
	b=oQxCbVvwaNKG0tsaALuG4aGg7Xn6F2Mp96uL1feIqLCwmKODe7Q5+/AlyyNd+Su88aSN
	 l7KbAMm6yr11qP6YJAWE5wHRPawdEZrypZKTvX5tCPuNiZTFOxpmL1wzn6wzFRP+Pdk93
	 53lZhQ79esb2gXuDRCkDiged96KxH4JgmKgpA5JWTLGcDfxV6UhK14WcjLfB4YpVvWG12
	 31a2LHPZci0BFWuD7I2h0Tj2A3qYbVER6nhjp4nGojB+ZZoqeGL6LW+X3OnXVOxwX05L6
	 Y5tYK4OjSSmpmXM02Uez6ygJkGPaEUAUJIMqwoE/a44DgLSxGP0HYMkRYQoBkZf8XzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nof0WhBK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBBB606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CBBB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nof0WhBK
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-675617e81f9so39267d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792531230; cv=none;
        d=google.com; s=arc-20260327;
        b=V3/R/MKy3Px1JUJxlWBa/2fIknwe48cZu28U5AJ+2cTPbUXbV4hnNan3zzIL7u8CEe
         VbB0XJEHEC0ivIOZMD+uBiqr8VJ2riZv7MVQv97+tXkVSNPyYWaxrONmdrBiIgPk3U2o
         CnW3zMlORAXbu0d2iSUulXWh7pRtCznGvGFoznyaiEDCnyxkulsTsRAOyIGsE3YpGVvB
         75lanU2q37ontwz63S/3nY9zG66xIUryvEUuDybosVxYBHxnPKIC6JeaoeKDbRh0LXe5
         qTtXfinRXfX1ZjcYwn914eWG08Y2/5XEq9vCvOUynK7KteAdvYhratgagsYUrhUtLgRC
         Xz0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ke4Bp1uq0aLEbcX2egfOr2CbakS7xm41rD4rPHzU2KE=;
        fh=HzWqJmUPJkSfYY1SOw86zx+bZ0rYez/kfI4eA2mC3a4=;
        b=iKk+PgN9xp7YBuB44/3ramdNBHxeyCGur3wSd3XdFixnlnYKx79aFv7A4UswNJCNxz
         Jw9leAjFqOQkIaM3TvzV09WnZC21kDAAtkb9fgJPW+/0kJu03ropiovL1pFEw9xlvML7
         WzvDOnu7EyjVXqkaw4VKUSBOqbDMy2bw8iYVN11IiXVmTW7nXnEDQzjz64PbJwgAeUb4
         vobXmoJ1L8L8mxmhh80g+WDQ9F9RerPkX0MQtRf6u1tN7w7U2Aqdc19SGnzKOeB3jyxQ
         3LKGVeb6+s4pkQy+P4MIZkkPgDpM46GsZHbRsNn4rDhBCQYlhzxbrwso+GTYZAsco8IA
         plvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792531230; x=1793136030; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke4Bp1uq0aLEbcX2egfOr2CbakS7xm41rD4rPHzU2KE=;
        b=nof0WhBKmNRkVH4Kks93Z+i4KGNUZZ5QuzCvl7f3OWL3sRevUyZAYi2Xucrm9/Vu3R
         5yxlRMmNbbAaD4da7NJbZtejjoesKqeXymVo5pSSv7Wk/4HD28U1eDNWHwU2jCJi+n3G
         PlTbqjJs21axO6AtsVmwqmyFeexDu3zJb+yRLWdvWXdQ7AMJ5oMAfL+wbvLfeReUeBpF
         afmAtBJUU5ehrm1Ymzhn+4HhGJrndLHiL3H5Wr6pexy/4ro0/VOpNIH9oWh85TuAM4iN
         MsNy+NIR9tRmDh8zQgti/PpB3EsaPU0X3ZDlnKjEfrvZ0JrjFH1ZEg2yTgnxQnbpOP9C
         Jf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531230; x=1793136030;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ke4Bp1uq0aLEbcX2egfOr2CbakS7xm41rD4rPHzU2KE=;
        b=M7WIFJ4KP1LFkSo9HDwfIvI02oZMTNLLeG7p/sXEBg9hQcBxson+Iertl0NCG+iXB0
         siGg8BXhiEc0g2EHd5w9FG+jNxM7f5md4RwTfzkJOymMwVdtH8JsiiMi1VHECRUVCJQD
         8e7GyB5u55ocJb8WwryCvWlj8bB0d8Y3zLZ3ZkzH1HfWj3Gh3uIubyv4rHcZfdxN9iA+
         /mOda/YCy20Hy1JE0Ou8S5nKlwJeSyU83PZvDiWlMO1Fs/x6hG4q95Y2UYs6Zg+egEMa
         W+j79tv2LOGURy8or+77qZb162EQr/1s0vLWSfVBmc/EDY/cFYhTDqmrW9WZKcMxTywb
         Az4w==
X-Forwarded-Encrypted: i=1; AKwUvBx/MlMBxVSHwtPg7j+UhHWQv+cK5uF8zHw05VY9VbeSqGkVXawnWsUQEhlUEWk5Il9W+Zl4BZA41Cp8Rp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY6UiPnDHlQfZnC7IN8nP+rHKXbREusEIszu2GAlWRP4ySU8cX
	h2gUdzy4BEld0fvIDxPlhFdplPbS5cAUd232+UsmYAmlrrm1rblZGFnwooaXkhz79UlR5fUV+2R
	wgyEBxAD10WF3wwU/+wmO9fZJCtktm107svuOvAn/
X-Gm-Gg: AYBFou1tMqwup2PDNv/tOmhce0SWJoFo4kB899gF+CQCt5vGQz+uZTZy2cRtPCKYOjf
	3f2YucD5XR+mrp5xWdn+J2qYEPQ7qE6o8cYAaGE4OruGI7NsS0yEweXQG61h+zZd5Xa3Sd6/aus
	RAeWE2LCdzQxTrPkioP8vses9YQwY/B2oYYBIgsKABzHIutQ2dXb5gS0yVF90Myuuq2SlOC0p2o
	DQlGZXbGdtSurT97srAxOBCM/XeBP+sRdRX6O+J5TlORtoEI7qQecdnvBje5rQMZ3Jm2z7TLdZ8
	RE/yJ0XDv01pCTPTcazXIS6ijySTumVzrnaMqI0NhBu3SOTBIpVHmHiL9wn0J5teu1k4Y8rfBnL
	akhC5Y2Ur7w==
X-Received: by 2002:a05:690e:2061:b0:677:d67d:39b9 with SMTP id
 956f58d0204a3-67a0e57e12dmr152508d50.85.1792531229423; Tue, 20 Oct 2026
 14:20:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
In-Reply-To: <atXnS1ZKGVfHDNEK@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 20 Oct 2026 14:20:16 -0700
X-Gm-Features: AclHuK9mNBazNNzNkA6MDDLvZ748rY_1SqbdAqI4AW1arCcvEA7ytz5DfLIBttg
Message-ID: <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Did I miss this in the initial explanation? If not, please add it next time.

That is just how the existing I3C core enumerates targets during DAA,
not something added by this series. I will add a sentence to the
cover letter and Patch 4 commit message in v6 contrasting it with
i2c-dev to make that context clear.

> Do we have such use cases IRL? Do we have tooling support (at least pending)
> somewhere? Why does it require user space interaction in _this_ way (meaning
> IOCTL and /dev node)?

Yes, this is used in real systems today:

1. Tooling & production users:

- i3ctransfer (Patch 5/5 of this series, and carried out-of-tree in
AspeedTech-BMC/i3c-tools and vendor OpenBMC BSPs for several
years).

- OCP Secure Firmware Recovery (DCR 0xBD) [1] and Caliptra Root-of-Trust
recovery agents on OpenBMC/gBMC platforms (e.g., AST2700 / Caliptra
MCU recovery tooling and BMC recovery daemons). Because Vitor's
original i3cdev series was not merged in 2019, multiple silicon
vendors and OpenBMC trees have been carrying out-of-tree forks of i3cdev;
upstreaming consolidates those diverging implementations.

2. Why an ioctl is required over a read and write:

- In the OCP Secure Firmware Recovery v1.1 specification (Section
8.4, "Recovery I3C Interface Block Read via Private Write and
Private Read"), every recovery command read is a combined transaction
consisting of a Private Write with no STOP, followed by a Repeated START,
followed by a Private Read, and finally a STOP.

- Because write() and read() only submit a single transfer at a time
(nxfers = 1), the controller emits a STOP condition on the wire
at the end of write() and drops the bus lock. Submitting multiple
i3c_ioc_xfer descriptors in a single I3C_IOC_XFER(N) ioctl is
required so i3c_device_do_xfers() queues them together under one
bus lock acquisition and the controller emits a Repeated START
between messages (as well as passing HDR mode/cmd parameters).

[1] https://www.opencompute.org/documents/ocp-recovery-document-1p1-final-pdf

> So, imagine that someone submits a kernel driver for a simple device, while
> another person already uses the driver for multi-functional device where the
> former one is driving only part of it. Strictly speaking the kernel driver
> submission becomes a user space regression. Which effectively means that whenever
> you open i3cdev, no other kernel drivers may appear. Yes, I understand that
> a poor victim of such an unlikely course of events may recompile the kernel,
> disable driver, et cetera, but this still raises the same question, why do
> we do that to the mere users?

Note that a user does not need to recompile the kernel if a kernel
driver binds to a device they wish to access via i3cdev. Because i3cdev
handles BUS_NOTIFY_UNBOUND_DRIVER, unbinding the kernel driver at
runtime via sysfs:

echo <dev> > /sys/bus/i3c/devices/<dev>/driver/unbind

automatically triggers i3cdev_attach() and exposes /dev/bus/i3c/<dev>
without rebuilding the kernel. Also, I3C drivers match against a
target's MIPI-assigned DCR or 48-bit PID (Manufacturer ID + Part ID),
so a driver for a simple device will not accidentally match a different
chip's PID or a dedicated DCR like 0xBD.

> P.S> Still not convinced, that this has to be an ABI. For debugfs and something
> like this, no objections, but ABI.

Production BMC recovery daemons cannot rely on debugfs, which is
optional and restricted or unmounted on production builds. A character
device in /dev/bus/i3c/* provides the stable ioctl those tools need and
integrates with udev so non-root daemons can be granted access to
specific target nodes (e.g. matching on DCR 0xBD), similar to spidev
and hidraw.


> Forgot to ask, but do they interfere?

Is this in reference to i2c devices on the i3c bus? No, I3C transfers
and legacy
I2C transfers on a mixed-mode bus do not interfere:

1. Both i3c_device_do_xfers() and i3c_master_i2c_adapter_xfer() acquire
i3c_bus_normaluse_lock(&master->bus), so I3C and I2C transactions on
the same bus are serialized by the I3C core.

2. Attached I2C client addresses are marked as I3C_ADDR_SLOT_I2C_DEV in
the bus address slot table, preventing DAA from assigning an I2C
device's address to an I3C target.

Thanks,
Sam
