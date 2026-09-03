Received: from odysseus.grml.info (odysseus.grml.info [136.243.234.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13E4AF9C0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.243.234.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459997; cv=none; b=TfUbYV2guf2bZJxskQzW1o2EC5a9VKd7orH1kH1ApOfQhzVhuvaD+WcfPYFznSo8eczy+vjFy+EuuDRCMiREWIUhRYYYVL8UelJZARPjBjq9i7/dhG7F+Oi5jc7buJ3tGmM1qvUiBd1zONurDAMemNP7iNUG8Ow5vNh4ubKuo4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459997; c=relaxed/simple;
	bh=V7bLju8QLtAB9iAAeasLOaAaxSOHr+NdyBPoNGgzAq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KO3f+bsnnnKZRoUhMjQv5NWjIBIK1KlfbbXaWmjRvVTVBKhgvK5VGQb+uE1B4Qp3lU8i4ZgWYXbt2qhuJdVrjpS9FLAwGUuxUmaM+yuY4HGtMZq94h614SQXTBy2RZVVQ2BxT3xu4Wrlzb7BQa27QDgCQhMBZxxaKvMWl2kVbzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grml.org; spf=pass smtp.mailfrom=michael-prokop.at; arc=none smtp.client-ip=136.243.234.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grml.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michael-prokop.at
Received: by odysseus.grml.info (Postfix, from userid 105)
	id B318140156; Thu,  3 Sep 2026 20:20:58 +0200 (CEST)
X-Spam-Level: 
X-Spam-Relay-Country: 
Received: from localhost (localhost.localdomain [127.0.0.1])
	by odysseus.grml.info (Postfix) with ESMTP id CC0C540032;
	Thu,  3 Sep 2026 20:20:51 +0200 (CEST)
From: Michael Prokop <mika@grml.org>
To: linux-kernel@vger.kernel.org
Cc: Dan Moulding <dmoulding@me.com>,
	Michael Prokop <mika@grml.org>
Subject: [PATCH 1/1] init/version.c: fix NULL pointer dereference on bare "hostname" param
Date: Thu,  3 Sep 2026 20:20:29 +0200
Message-Id: <20260903182029.3329686-1-mika@grml.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

early_hostname() passes its "arg" parameter straight to strscpy()
without checking it for NULL. As a result, a bare "hostname" (no
"=value") on the kernel command line calls early_hostname(NULL),
which dereferences a NULL pointer.

This happens during parse_early_param(), before console_init(), so the
kernel oopses with no visible output on the usual boot console and the
system fails to boot.

STR:

  make x86_64_defconfig
  ./scripts/kconfig/merge_config.sh -m .config kernel/configs/kvm_guest.config
  make olddefconfig
  make bzImage
  qemu-system-x86_64 -kernel arch/x86/boot/bzImage \
    -nographic -no-reboot -m 512M -append \
    "earlyprintk=ttyS0 earlycon=uart8250,io,0x3f8,115200n8 ignore_loglevel console=ttyS0 hostname"

Resulting in:

[    0.000000] CR2: 0000000000000000 CR3: 0000000010d82000 CR4: 00000000000000b0
[    0.000000] Call Trace:
[    0.000000] Call Trace:
[    0.000000]  <TASK>
[    0.000000]  <TASK>
[    0.000000]  ? early_hostname+0x18/0x40
[    0.000000]  ? early_hostname+0x18/0x40
[    0.000000]  ? do_early_param+0x3f/0x70
[    0.000000]  ? do_early_param+0x3f/0x70
[    0.000000]  ? parse_args+0x15d/0x3c0
[    0.000000]  ? parse_args+0x15d/0x3c0
[    0.000000]  ? __pfx_do_early_param+0x10/0x10
[    0.000000]  ? __pfx_do_early_param+0x10/0x10
[    0.000000]  ? parse_early_options+0x24/0x30
[    0.000000]  ? parse_early_options+0x24/0x30
[    0.000000]  ? __pfx_do_early_param+0x10/0x10
[    0.000000]  ? __pfx_do_early_param+0x10/0x10
[    0.000000]  ? parse_early_param+0x31/0x80
[    0.000000]  ? parse_early_param+0x31/0x80
[    0.000000]  ? setup_arch+0x46b/0xab0
[    0.000000]  ? setup_arch+0x46b/0xab0
[    0.000000]  ? _printk+0x66/0x80
[    0.000000]  ? _printk+0x66/0x80
[    0.000000]  ? start_kernel+0x58/0x780
[    0.000000]  ? start_kernel+0x58/0x780
[    0.000000]  ? x86_64_start_reservations+0x24/0x30
[    0.000000]  ? x86_64_start_reservations+0x24/0x30
[    0.000000]  ? x86_64_start_kernel+0xce/0xd0
[    0.000000]  ? x86_64_start_kernel+0xce/0xd0
[    0.000000]  ? common_startup_64+0x13e/0x158
[    0.000000]  ? common_startup_64+0x13e/0x158
[    0.000000]  </TASK>
[    0.000000]  </TASK>

Fixes: 5a704629f2c1 ("init: add "hostname" kernel parameter")
Signed-off-by: Michael Prokop <mika@grml.org>
---
 init/version.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..0bd5c45aabc4 100644
--- a/init/version.c
+++ b/init/version.c
@@ -23,6 +23,9 @@ static int __init early_hostname(char *arg)
 	size_t maxlen  = bufsize - 1;
 	ssize_t arglen;
 
+	if (!arg)
+		return -EINVAL;
+
 	arglen = strscpy(init_uts_ns.name.nodename, arg, bufsize);
 	if (arglen < 0) {
 		pr_warn("hostname parameter exceeds %zd characters and will be truncated",
-- 
2.50.1

