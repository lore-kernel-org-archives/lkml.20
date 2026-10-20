Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494505;
	b=imynJjGjl5Hc4QXRgjZnWu0Cwcy5OyxhgtQjT7FUkzeOkuyONWtwd6JJm78g2x/1/pR1
	 LxBvOOaHHZ/h9b1ChDBU7uOAeTEO3ZyDx/vInyk3PUoFtT+rf0uXkd79nMmJwG17f+BVm
	 CPBvi+5RI9ILj5LcNUhy5lda2A1yV1zHfdG92J9tTlhMbHvI4uml5F4sH91OPkw36wLzp
	 r3oM2YKKTs0CuFAosdwPWf14aVLvLSASsggfzJO5lEXgBK7y/2mVvrbXVY+jIlqX3vQKZ
	 6fEEq+uNR8Db9KybSbZjLW1S+EY7tUCgqmosqxDfB8eJx8zGX/0son6iOBNdBjh3ipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494505;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=K7fwwiQB/zWnok5poPdrINg9tw/c644NfMqHbW+4WN4=;
	b=uwc76lYwwl3WFWCVsyzHG8QMOmzVvEVdHNwexXi0kF8vlFQ0n0BvCaLV7NKpVMFO1Ysl
	 hMEkHr1G96fadG6Orhl8few6ZUqDh4JKk/TxCK6eyzqpOyWiwc+YhduNCbXCfBSEvOxJS
	 8QEa63iMLBy/I1oVnbrFC++3vRoHv6RJ156HcOo0yXfy2O27g3QpFJ7eec84v6lrkbZGF
	 1zhVhr6b2cIB4OwC7zo2ygWbET0wIA06R34V4Bs1bd3po3Fa16obOqsp6BD41/GTYkcZr
	 6yry4CjVMu7kcyToid7jwvs09qaPsG2m0+A+RspkBEVpXnmd0VcSiyRFZnRZNWJ6reQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YdxpoT1C;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94918606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94918606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YdxpoT1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=K7
	fwwiQB/zWnok5poPdrINg9tw/c644NfMqHbW+4WN4=; b=YdxpoT1CyvCeMSv+jB
	cZycIkvJMGE4BE+0PM+3oBZy+Jupg/gibadotxbUltpkbdUWuuL0T6R7RywnIJTN
	kAqKxh+42X9qe3mCHEhenk4yl37lICoBsaZ541QgYTDjVkNg9EkpymAMlkfO98j4
	+YXgKh4ulF8/ezCGGUC0B0zBc=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD393GES9dqIxTHBA--.10263S2;
	Tue, 20 Oct 2026 19:07:49 +0800 (CST)
From: shaos <shawnq1@163.com>
To: akpm@linux-foundation.org
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Liam Howlett <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] mm: mremap merge clears RWP state from an untouched neighbor
Date: Tue, 20 Oct 2026 11:07:48 +0000
Message-Id: <20261020110748.959870-1-shawnq1@163.com>
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
X-CM-TRANSID:_____wD393GES9dqIxTHBA--.10263S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF45ur48Xr4kuFWfGryrtFb_yoW8KF4Dp3
	92y3yY9asFva15tasava18Z34F93Z5Jw17Xas8Xr48ZrW3Kw1jyryfKa4jkFy3ZFs7uFWr
	twn8JFn7XFn0qF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYzuAUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8QWEkmrXS4WdhAAA3I

Hello,

An adjacent mremap() can remove userfaultfd RWP handling from a neighboring VMA that was not moved. The moved VMA and the existing neighbor use the same userfaultfd context, and UFFD_FEATURE_EVENT_REMAP is not negotiated. When the destination merges into the neighbor, mremap_userfaultfd_prep() resets the context on the expanded VMA, including the neighbor.

The neighbor's PTE remains PAGE_NONE with _PAGE_UFFD, but the VMA loses VM_UFFD_RWP. A read that delivered UFFD_PAGEFAULT_FLAG_RWP before the move then completes without an event. The same-mm PoC reproduces this on two fresh boots. No-move and nonadjacent-move controls retain the RWP event.

HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
source version: Linux 7.3.0-rc7
architecture:   x86-64
compiler:       gcc 11.4.0, GNU ld 2.38
QEMU:           6.2.0

console output: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/368568c2dd47417b54a957c8d9cc09f77f28b236/console-output.txt
kernel config: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/4989bc843fa61b5eaaaa53422238ec39e4356b70/kernel-config.txt
reproducer: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/109dc86c28debcaca07aedb2d450ed1e95ae5edf/poc.c

Build the kernel from the revision above with the attached config. Build poc.c statically with pthread support and place it at /init in a minimal initramfs. The positive run and controls use:

    timeout 180 qemu-system-x86_64 -accel tcg,thread=multi -cpu max \
        -m 1024 -smp 2 -machine q35 -nodefaults \
        -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
        -append "console=ttyS0 panic=-1 oops=panic loglevel=7 rwp.mode=positive" \
        -display none -serial stdio -monitor none -no-reboot

Use rwp.mode=no_move and rwp.mode=nonadjacent for the controls. The positive oracle is PRECHECK fault flags=0x8 followed by POST no_event value=0x41 and RESULT=RWP_NEIGHBOR_ESCAPE_CONFIRMED. This is a userfaultfd tracking defect; no privilege escalation or cross-process access is demonstrated. I checked upstream master f47d223627f8; the relevant mremap/userfaultfd logic is unchanged there, but runtime validation was on v7.3-rc7.

Thanks,

shaos

