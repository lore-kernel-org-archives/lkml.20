Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456626;
	b=qJI+pw82PG2EFcVRzSTULNknrUaiwVhhferOz7w35p4+fI68l4jtwtjcmnE3QdAAvb6E
	 i8pA5pZyzVaOYHWRcCjGCA7YADweyDge+m5rStDFlvM9nZITqPYRVoqq+liZNBvHBvnuU
	 c+a4r34KrUlNJOvt085TN3Bu2ky75J+17pjCrtH/wJI43tHt+SsULNMYgBLwuxIRCpKxl
	 y2pQ65lvhfl+QVnImMtrICV0Ai2T0L7+9upOD3HwM/quTTzXamqREV7fDpSKPk6S8fxoT
	 EOrjKsc1Ywni7qIr4AZxqXOxT4R7qD4yrolgtPIb0yTj/VZEzE4gpcrd3nqxPgSwfug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456626;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ff/6rcWCZ7J0WwRFerwLHBmUW/zOpnAz33rL1YX7OI0=;
	b=oY62x2J3vjmQxtNIZswBqGH2ZYrxyB9JgaizHgXHjFxMbiP8VVoC8+k7bR2MJFRi9Vna
	 /eC9EJdAJNPMOgopAdyuQtPmqP4YbJpoK5E30JXjRg2pBrAsRuQlcXmhi+rwszY4v5IYw
	 xhP0ZWEk5eqavCEgBqIo7OSjzDFy6ghLGw/sW2lTbp1CuRgfX8MYj9VLYavHpcIAfa3UP
	 ogFWmiQYNgL4Rhwik1y98zf4hHHD8v88HriuyS5d/xpfU7GDgnW297LjhBslUPAtDKj1J
	 egk8SKeJHrtPtIdiXST6+FMAoRO9MFiash3Hqo/Y0p0okMeVmCHqmK7CROcBMLQfrtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IzKIAkI2;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBC1606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBC1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=IzKIAkI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ff
	/6rcWCZ7J0WwRFerwLHBmUW/zOpnAz33rL1YX7OI0=; b=IzKIAkI2B7f0uwfWSw
	cvJpfV+gCumiVOwuLpGUrZKtfT7vAuZAvksN/EFwcLCOlRNF5zKuCMlVCfg63bHy
	bc2/FR6ZYuGJI2mZIjeSoW2wgNeoJbprY/vJ7vidQQEFXY+ec0JZ1uuc2Bv9t/q1
	zJEGs/kr4aHq1qec1SwZ3be7c=
Received: from shaos.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCn6hmat9ZqaiNXAw--.37946S2;
	Tue, 20 Oct 2026 08:36:42 +0800 (CST)
From: shaos <shawnq1@163.com>
To: jstultz@google.com
Cc: Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [BUG] timekeeping: unprivileged clock_settime can change an enabled auxiliary clock
Date: Tue, 20 Oct 2026 00:36:41 +0000
Message-Id: <20261020003641.1012025-1-shawnq1@163.com>
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
X-CM-TRANSID:PSgvCgCn6hmat9ZqaiNXAw--.37946S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFyxArW3WF4DXryDAw4xWFg_yoW5GF45pr
	Wvk3y5Kr4vqa18J3yvkF4rXryYgwnrG343JFn8Grn7ua9xAw1DAry8try2qa9rArs5u39I
	vayrXasrJayru3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWyIUUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbCzxpkcmrWt5rx8QAA3S

Hello,

aux_clock_set() validates the requested timespec and clock state but performs no permission check.  After an administrator enables CLOCK_AUX0, a process with no capabilities can set the system-wide auxiliary clock with clock_settime().  The same clock's adjtime path and CLOCK_REALTIME setter both reject the same caller.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/189eb1fec9f2b4e69e979642496f5c54/raw/75acb2f68b89a64dd4719f2493e4c2a161e38cb1/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/189eb1fec9f2b4e69e979642496f5c54/raw/01c9b3f973d527975537280bd7631127537531e0/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/189eb1fec9f2b4e69e979642496f5c54/raw/003a5649dccbd0218da367d906093594ddf3c8c9/poc.c

Build the kernel from HEAD with the attached reproduction config.  The PoC acts as /init, mounts proc and sysfs, runs the test in a child, then powers off the disposable VM.

    mkdir -p build rootfs
    cp kernel-config.txt build/.config
    make O=build olddefconfig
    make O=build -j"$(nproc)" bzImage
    gcc -O2 -static -Wall -Wextra -o poc poc.c
    cp poc rootfs/init
    (cd rootfs && find init | cpio -o -H newc --owner=0:0) | gzip -9 > initramfs.cpio.gz
    timeout 120 qemu-system-x86_64 -kernel build/arch/x86/boot/bzImage \
        -initrd initramfs.cpio.gz -append "console=ttyS0 rdinit=/init panic=-1 loglevel=4 nokaslr" \
        -nographic -m 1024 -smp 1 -accel tcg -no-reboot 2>&1 | tee run.log

Two fresh minimal-kernel boots returned success for clock_settime(CLOCK_AUX0) and read back the injected value.  CLOCK_REALTIME settime and CLOCK_AUX0 adjtime returned EPERM; disabled CLOCK_AUX1 returned ENODEV.

Impact and prerequisites:
A local unprivileged process can alter a globally visible auxiliary time domain after an administrator enables it.  This can disrupt consumers of that clock.  It does not change CLOCK_REALTIME, CLOCK_MONOTONIC, or the core timekeeper, and no memory corruption or privilege escalation is demonstrated.

Validation: Two fresh positive boots returned success for the unprivileged CLOCK_AUX0 set and read back the injected value.  CLOCK_REALTIME and CLOCK_AUX0 adjtime returned EPERM; disabled CLOCK_AUX1 returned ENODEV.

Thanks,

shaos

