Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494501;
	b=iggjj91TvdukSozfH+QpdCjgZbbzt3oKwreTwXA8TBQYaD+ZEUT7LTjSVR4X+bUTYl4N
	 b6JbyObsN0kBnds+gcbe/K5TNw6Kq7+lX5yuFb1VsqF6XRrcwM+FpQ1mJnlJpekH0Q3UQ
	 diwQnxLpctK2KKukFSXOTUfpSZiILgrQ7RFHQSFwwCx9KdPIOdubXWpj4/rhf5PYChruu
	 6MBB/OnDdLkShS+8TSO7HwoTsNq6AJ/+03H01+1N0FYyI+Ul2PbWDiPJ9Nwp21ucs1JeI
	 oCQ8oRCuRh9LbxF9bCMPhmEZW2b80sZu9TCPJhaHaYH9U0UalKwzmCiyLTDqqUoCByg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494501;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ZVhamrUSjCR8huBFZ4vUL9+JmmauW+0214OfHZAjl4U=;
	b=uCXug271jkziLAqtiNqiVgN5oYULdEUuayA3IOGKoVgURbX9virFloeBtP//XIctWtqk
	 IRbhRKBPs/Ien3I5WcCIwQzcWncOJWG7WA140W2k3MIE8rfl0/ghrAySJSouR4XYMtbWf
	 ZuynxYh0+5ObZVTebAIoq2uwSsLVbp/wh0R3/yPVcVBOjAl4eORayLQMACxFdvSxM7Jly
	 lbP7Gf+BrHlgs1EijqdSwp19uIjPuXpL4TMpRbev7uOL4TMZzF6j7QfKw82IdVS4N6Xq7
	 NSv4vcA5vkJ+Da9O03qvZaAd6wfK3oF3sB4epD5xVX0TvnZVl/4Gc2yk1zYunxt2CnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WuakJbWY;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E38606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E38606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WuakJbWY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ZV
	hamrUSjCR8huBFZ4vUL9+JmmauW+0214OfHZAjl4U=; b=WuakJbWYaczrZxPmp/
	MM6Q4d2Jogy9crmRuVCMbCtgWjAdeXWiX7FKmna2O9YfrlMpEv9KTW/W7foLiSVw
	2szh3RZBmHXLEv0xk8I00a0fDarQG1TtTduVMgXS5rgYQD659BDPmJDMPuVQY3CE
	RnHO6QnJad2lEfIz+PiNSwddQ=
Received: from shaos.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnzI2NS9dqEL_0Aw--.56621S2;
	Tue, 20 Oct 2026 19:07:57 +0800 (CST)
From: shaos <shawnq1@163.com>
To: akpm@linux-foundation.org
Cc: David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] mm/ksm: KSM merge drops userfaultfd RWP markers
Date: Tue, 20 Oct 2026 11:07:57 +0000
Message-Id: <20261020110757.960025-1-shawnq1@163.com>
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
X-CM-TRANSID:PygvCgDnzI2NS9dqEL_0Aw--.56621S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr4rGF47CF4fZF1xCFWUCFg_yoW5GF1kpF
	Wvvw1agrn0gF1xJan7tFy0g3Wj9wn3G3yUJFn5Jw1ruayDGw1jyFW0ya4Y9F17Zr95C3yF
	yw4jva4DJa95t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U47K3UUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC0A2GlGrXS41BkgAA3n

Hello,

KSM can merge anonymous pages in a VMA registered for userfaultfd write-protect (RWP), then replace an armed PTE with an ordinary accessible PTE. The VMA remains registered, but a read of the replaced page completes without the expected UFFD_PAGEFAULT_FLAG_RWP event.

The RWP PTE is represented by PAGE_NONE plus the architecture's _PAGE_UFFD marker. In replace_page(), KSM creates the replacement with mk_pte(kpage, vma->vm_page_prot) and does not preserve that state from orig_pte. The PoC observes pages_sharing increase, reads the replaced page without an event, then re-arms it and receives the RWP event again. A non-merging control keeps the marker and continues to fault.

The same replacement path also loses soft-dirty state; that separate observable is documented at https://gist.github.com/shaos26/9db36768f01eb83c6aa14ee9fc057388. This report focuses on userfaultfd RWP tracking.

HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
source version: Linux 7.3.0-rc7
architecture:   x86-64
compiler:       gcc 11.4.0, GNU ld 2.38
QEMU:           6.2.0

console output: https://gist.githubusercontent.com/shaos26/e887665d7868dc323d73a1d678cacd3d/raw/e3e39212903e5bd5ba12f55a94ba7ae5b25bb238/console-output.txt
kernel config: https://gist.githubusercontent.com/shaos26/e887665d7868dc323d73a1d678cacd3d/raw/3cd943ba8c6026b43ef016a37d07efd2533a317a/kernel-config.txt
reproducer: https://gist.githubusercontent.com/shaos26/e887665d7868dc323d73a1d678cacd3d/raw/7fc8685bb0cc01fca488fc096d4859b8b70af3fc/poc.c

Build the kernel from the revision above with the attached config. Build the static PoC with:

    gcc -static -O2 -pthread -Wall -Wextra -o poc poc.c

The program is intended to run as /init in a disposable initramfs and mounts procfs and sysfs itself. Boot it with:

    qemu-system-x86_64 -m 1G -smp 2 -machine q35 -nographic -no-reboot \
        -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
        -append "console=ttyS0 rdinit=/init panic=-1 oops=panic loglevel=6"

Two fresh positive boots reported RESULT=KSM_RWP_MARKER_LOSS_CONFIRMED; the close non-merging control reported RESULT=KSM_CONTROL_TRAPS_PRESERVED. No privilege escalation, memory corruption, or cross-process access is claimed; the defect is loss of the caller's RWP access tracking. I checked the affected code against upstream master f47d223627f8; this source path appears unchanged there, but I have only reproduced the behavior on v7.3-rc7.

Thanks,

shaos

