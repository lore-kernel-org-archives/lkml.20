Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B86032D0F5
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792223130; cv=none; b=Tq53g0AMX883g+8WCL9ZVEmCWrbGp3ffo3w9Nr57N1wAPNfvwhzsKgIrvYNrigJLVB/LXthQvmQngsfDW3e6Cc6GdDJ3I0du4nOZNnUC02kNAntzAXCvco+ILCnbt0u1Xxo3ruDIX+dyM3XXk8gjGsl7aZqWGwJTifjjrT3A5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792223130; c=relaxed/simple;
	bh=1Nz1FSf6mDiSJ6IT0PyLTNTKdVCW73ND9TdzajrqBVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dkJJEDNjFu7JlFSSBXOF3a7AXuogDVoZ9BDmcnTNZdIpAP9znizt1uL8LwfcNvIzFWDGdS8PKLgCXOOJ839o8Lk6lFQF7pgRgYfKi10mB/IqoE0Jtshol6wnPviqbrLLm8uTriu2KsJ/+jC2OaOuE/UoecBQbr4aafHVK1W8jIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGkb13oO; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGkb13oO"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5e94a057d9eso458583e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792223127; x=1792827927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G9gHOokB2iUNg0rcd+4gK+6dCcLdNZHPpTlIwEx+WLg=;
        b=jGkb13oO00Yrmjutcz8cpXe0kPiPEjedSAee5t3YTFyqAsHOtd/xOBl2PBC6ivjO7E
         C3iXEKg/08Vt7IBdc1adm8K7SNMindYfYwIYDir4oE8lbL4hNzak8fG5og1qDGTmbXB4
         GrGnL0lCW+T31cCBW/drs/55IOfbutMmbO2o9jJlhUHTrzEcyxFjUebbk9cp4OtLsnT0
         CN6Se4dhJgg9xP4N3dO1ptGCe4xFyfAJy0BZUQoQIkudbA0ml+lJHffDDiOsF4iOtKo+
         1yz+E6VRzKW4r4K35M4DiQ7utUzsPl0j9pqUqszvCeKrjt+9E/BoDse1bWIwIOaW4npP
         wu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792223127; x=1792827927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9gHOokB2iUNg0rcd+4gK+6dCcLdNZHPpTlIwEx+WLg=;
        b=qJ+7z9HuBvekppIzlaPkJlDZ7mq2Od50YWX2F1aHM2jvq74ypxmE+gxp43XLs7XeR7
         ijNameqR3tGHANi+2RLfLuKyXIJUgqPKOYU7jPI/GcPlR/hOadEyqKpVuh7RIOQ2WOQZ
         w8MsioJ6pVbTygBIm20XKurYjASYwHbwi8vVFFeOLzCW870HlMyfmE+TqZpgN9odc5We
         RjDdpiCapzxJgyiQ6MttDX4Vy8lEh6GOiQ1DQroOzmsGcMj4mrjNli0WTkmwtK2xWUUu
         73IY4vcPVeteYhJ/S+EFRlrWLJokjbq73uH4V9EHUR2KT0zY1qWPT/nHAtwlpe1hM/xU
         Fokg==
X-Forwarded-Encrypted: i=1; AKwUvBzZFtVI8MDawBYdTc6hZDv8RcoiC5mnEf03IKT3pQRr2QWB7fQzERMJx/L7JlpMUAFMEHLa9T2V5NK4+Us=@vger.kernel.org
X-Gm-Message-State: AFq9FYI211MD/NzfgS/jRskwHcFqcOTU15TU2al2UCU7OqyjDcDwpj5L
	OXeVU9FzU4a0lGDeXHiOLUvi3h42PA1vzysws50AB2e/+n4bWOQumSGt
X-Gm-Gg: AYBFou0AkNj7EiHNxvBYi2W5GfNPpylnQV9cfJuasv7Nr+36Bq3GzH5us8dLhVRMHA0
	YC12l88lSSjmhrzd1l2jsrGPS4+8JrRWI7eIanOM4PaP47AVeeCqjK0DdvmcmBCQdwsyPEZ4djy
	0N/8MLuZHbKTThQF2wD/xO/3bz8cr7ne9rcTD5G+a2cm8OJVHuA6hFSFrsJJ1xGt+n/+bkz8bX3
	CiByAg941ermBj+SoyY/LRznKdadWCBgB8+6flLvTH/iMMBM8pgywHq+0S+LA60wWLlcLTFLpqj
	THAcQLbgpwlbrzJT+TlLXnHysLY1pTH63RymUf8UCchta6DK32j9/DOIyaKdSrtw4yg+ro/CSLn
	62dzvblPRRGDAywwgx/+ACTkb8QimWsc+/r3XfINwtBVsE+cjZOAahEXXRbU13DH3SywjpjX4rj
	kDEdDhgxXC7/HzQnqBaYK7IPXI+Q/LG7b/prCL3uP1Zm5qFr+Qe+4ad1fZlzlgMS3LoQ0YMYING
	Nti4G4cMI1lh2/sNojoNJ2YFWP0GnfLduWKrZY9/QbAQ6ns+NtQe3f1gipH52Q=
X-Received: by 2002:a05:6122:3b8b:b0:5c9:a60b:e5a5 with SMTP id 71dfb90a1353d-5eaaa8c75e7mr970007e0c.16.1792223127505;
        Sat, 17 Oct 2026 00:45:27 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm3701836e0c.15.2026.10.17.00.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:45:25 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com
Cc: linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Alba <sebasjosue84@estudiantec.cr>
Subject: [PATCH 0/2] serial: sifive: fix two init ordering bugs in probe
Date: Sat, 17 Oct 2026 01:44:51 -0600
Message-ID: <20261017074453.62645-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sebastian Alba <sebasjosue84@estudiantec.cr>

Hi all,

I found two ordering bugs in the SiFive UART probe path while working on my
undergrad thesis project. The project uses a HiFive Unmatched board with an
FU740-C000, and I spent a lot of time reading this driver to understand how
the console comes up, which is how I ran into both of these.

Both have the same shape. A resource gets turned on before the state it
depends on is set up, so there is a window during probe where a callback can
run against a half initialized port.

Patch 1 is the one I think matters. request_irq() runs before
uart_add_one_port(), so the handler is live while ssp->port.state is still
NULL from devm_kzalloc(). If a byte arrives in that window, the handler walks
into uart_insert_char() and dereferences the NULL state pointer. The patch
moves request_irq() after uart_add_one_port(), masks the interrupt enable
register before adding the port in case the bootloader left something on, and
adds the missing error label so a failing request_irq() unwinds
uart_add_one_port().

Patch 2 registers the clock notifier before ssp->baud_rate and
ssp->port.uartclk are initialized, so a rate change in that window divides by
zero. This is worse on RISC-V than on most other arches, because the ISA does
not trap on integer division by zero. divu by zero returns all bits set, so
DIV_ROUND_UP(12000000, 0) comes back as 0xFFFFFFFFFFFFFFFF and the udelay()
in the notifier becomes a busy wait that never ends. Instead of a clean oops
you get a hung core. The patch sets up the divider before registering the
notifier and adds a cheap guard inside the notifier.

I reproduced patch 1 under QEMU. The machine is qemu-system-riscv64 -M
sifive_u, which reports itself as HiFive Unleashed A00 and models the FU540,
not the FU740 I have on my desk, but it is the same UART IP block and the
same driver. I added six lines of instrumentation right after the
request_irq() block to print port.state, unmask RXWM and hold the window open
with mdelay(), then fed bytes into the UART while it was open. With panic=-1
the kernel reboots and retries on its own.

Without the fix I got 318 windows and 318 NULL dereferences, so every single
attempt crashed, and port.state printed as 0000000000000000 every time. The
trace is always the same.

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
  epc : uart_insert_char+0x66/0x154
   ra : sifive_serial_irq+0x94/0x1f0

With the fix, same instrumentation at the same point and same input, I got 18
windows and 0 NULL dereferences, and port.state printed as (____ptrval____)
every time. That is what vsprintf prints for a real pointer before the RNG is
ready, since ptr_to_id() special cases NULL and prints the literal value
instead.

One honest note on those numbers. The window counts are not equal, because
without the fix the kernel crashes early and panic=-1 restarts it right away,
so many short cycles fit into the same 180 seconds, while with the fix nothing
crashes and every window burns its full mdelay. The count is not the argument.
With a 100 percent baseline failure rate, 0 out of 18 is not luck, and the non
NULL pointer is the cause while the crash is only the symptom.

I did not reproduce patch 2 the same way. It needs a clock rate change inside
a very narrow window and I could not drive one reliably under QEMU, so that
one comes from reading the code. Happy to be corrected on it.

Both were pointed at during review of the off by one fix back in August, but
as far as I can tell nobody sent patches, and both are still in master today.

This is my first series to this subsystem, so please tell me if I got the
format or the split wrong.

Thanks,
Sebastian


Sebastian Alba (2):
  serial: sifive: fix NULL pointer dereference in probe IRQ window
  serial: sifive: avoid division by zero in the clock notifier

 drivers/tty/serial/sifive.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

-- 
2.43.0

