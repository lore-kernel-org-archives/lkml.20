Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494504;
	b=D2ObW/3oVTXIhupUaIgsbLmBOcV0Mg5Mktket8xqCX7lLIzffBbnQvX5MRSigjh+bbJs
	 ELwIsXPcFefkZlDN41vuS8dRII4ZgyPfzGxyqtFYmT7pgilBEunDLau29pCgfxaq9Flo/
	 aCSvdWJ+Ku2CLyKBgNFVWYPdgQKgV9d15OUqqGZqBlV1aL3tG0j3c+Y1cKMozEfoTkHmm
	 49x4hVzQqc/ZOsmVePsk6Tl2zoViz8A8TMszxJnPe3dyCnFiZP4a+xg39/TcRTJ7ffOL2
	 +kaZSLFy3129WeT1JW1REvVn7L/3V8xhCtXHv/kKirYe5IqHS4An6eQPURFwNNaCAww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494504;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=bOAvUVQJjxk6pZZQVpeKthI9Jctl5WJbGGXL3unzYIk=;
	b=UTCHLwSgia4/nkrm49rH1h5dOGlLFdWEP+0s5hlF+OqM1AQ9ymSm7dUbpnji6cwjLv8i
	 QnERskuw8S3YJ3ilfGTZgBHw60D3nMZ1BNqBD/QshcndP2ZEt/zy2MlPkoqgOZLNexXvk
	 Ai9lVL11q0Ter1fDBY6hfev0Uqdyh4AdVSwpSp8r+GiSodH6M881QkarWYZRcn/bbREXj
	 R2tkmZFn75r9VblmmZHLTXS3FiKmIe379OMUdwwTx9y2VNfuwxXutUdA+TahjDYYp2Zp3
	 cm/onIp6pYvPTzdncOqICS0txguJa5RdSLakcneHpqYPPTmtIMhaBhlyMtDoXjocvdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HTvAwsxx;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E060A2605
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2E060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HTvAwsxx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bO
	AvUVQJjxk6pZZQVpeKthI9Jctl5WJbGGXL3unzYIk=; b=HTvAwsxxKszlhPB3Hk
	XW4tobwBF5Cu8v0mS6S/6A7X8yV8vAdZT5gBQuBy6Q2hjxL+6iTeKmxoO4mTm006
	k2XxcovJGOKKdv6BjgaemQpqr+w2PhmVDVRgIbsEkfVVKh6u93o126Zxw1a91U6C
	+KayN28ns/CfEbcytFYQbo97s=
Received: from shaos.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHuqGPS9dq_PjsAw--.59886S2;
	Tue, 20 Oct 2026 19:07:59 +0800 (CST)
From: shaos <shawnq1@163.com>
To: akpm@linux-foundation.org
Cc: Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] mm: userfaultfd RWP drops a populated shmem PMD
Date: Tue, 20 Oct 2026 11:07:59 +0000
Message-Id: <20261020110759.960089-1-shawnq1@163.com>
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
X-CM-TRANSID:QCgvCgAHuqGPS9dq_PjsAw--.59886S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrWkArW8Ww1xZr1xAFWxtFb_yoW8KF45pr
	Za9w13K3Z7XF18J395tF40q3Wruwn3Gw4UJ3Z5Gwn5Zan8Kr1vkr4xK342g3WxAr1vkFWF
	va1Yva4DCa9rt3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbCzw+GlGrXS49JmgAA34

Hello,

UFFDIO_RWPROTECT_MODE_RWP can return success for a present shmem THP mapping while dropping the PMD mapping instead of leaving the populated page resident and write-protected. The next read refaults the page and completes without a UFFD_PAGEFAULT_FLAG_RWP event.

The PoC verifies ShmemPmdMapped=2048 kB immediately before the ioctl. After the successful ioctl, smaps reports Rss=0 and ShmemPmdMapped=0; the read completes with the original byte and no event. Re-arming the refaulted PTE and a separate 4 KiB shmem control both produce the expected RWP event. The observed issue is loss of the mapping and protection tracking, not corruption of the file contents.

The source path splits and clears the non-anonymous PMD for MM_CP_UFFD_RWP, but the retry does not repopulate a PTE table because pgtable_populate_needed() only recognizes MM_CP_UFFD_WP. The ioctl nevertheless returns success.

HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
source version: Linux 7.3.0-rc7
architecture:   x86-64
compiler:       gcc 11.4.0, GNU ld 2.38
QEMU:           6.2.0

console output: https://gist.githubusercontent.com/shaos26/3c336ea98e1e8fe09b5270c3a82ca268/raw/da13df3db0c05df09952f74bedb457f57c53b78b/console-output.txt
kernel config: https://gist.githubusercontent.com/shaos26/3c336ea98e1e8fe09b5270c3a82ca268/raw/baa5ee61ce748667104c480560ab5116a100e3fd/kernel-config.txt
reproducer: https://gist.githubusercontent.com/shaos26/3c336ea98e1e8fe09b5270c3a82ca268/raw/420975783e9d5dd88bc4a69190d8ef194faf5fdc/poc.c

Build the kernel from the revision above with the attached config. Build the static PoC and initramfs from poc.c; the program is /init and creates the shmem mapping itself. A fresh-boot run used:

    timeout 300 qemu-system-x86_64 -m 2G -smp 2 \
        -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
        -append "console=ttyS0 panic=1 oops=panic loglevel=7 kfence.sample_interval=0" \
        -nographic -no-reboot -monitor none

Two fresh boots reported RESULT=RWP_SHMEM_PMD_BYPASS_CONFIRMED and exited cleanly. The affected code appears unchanged in upstream master f47d223627f8; I have only reproduced it on v7.3-rc7. No privilege escalation, memory corruption, or guest escape is claimed.

Thanks,

shaos

