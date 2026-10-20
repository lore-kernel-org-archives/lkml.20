Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494501;
	b=ytOXLT88YL8vGyEbvioa7yWorPK5Mq40R7O6P7GLWHfESuKdXjTfqwOyI5khO1bKgz2e
	 arjN7E+yRLHrgDnAvKAzb60Aenkq2H1vFqvPp8MNUmlXKLuT0RIbQY8XBwMzPXRSpdJGH
	 OXDTQ5bfx079T7/1bmHAG3LXZ6ioJF8DD1Fegl7j9r70MXz1tI28y9z5Oy9fHTtNL1WT4
	 q2y11Z32mNdLfpUPIgzGPiytnfV2LG0AxgsoHOAhrbwjZe0TdcyLtimdKCyxglUnaQ7eH
	 pz5ewwLyZmnvIqDwL9J5EuwHYRzI18otdZa5qhjIssE+qfkhJvSh3wJlEo360EBC1oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494501;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ywrnWoxIOGF6M2OKCJynf2tZcjMgeFa7DuGTFYZmyBw=;
	b=GhWUou1Dht2m1CwHQwr6YuoX4r9JQjtrYNpTMHszetMjV/mHngt9PeGymvVt2UllEREJ
	 3Tz/Ax1/vv2mIwZhgdFepD1j1MZrGkJbRzOeSbdTh4B3/1I3WhbVax9SuscstJTYtFhdZ
	 4Nwqy6sYR0BlIbsRipVmkjVrXYWv7BEVCf/UPivoPC2bGLSgQgClqjxU+OMcupNDFQ8P9
	 RhC67f88dpp42jHqeD0sYpWyEh3bGV2sWNqNHLA4qZinnglCHOOAPDyR5u6id6h0V7bIE
	 rBOTGod3rSuLts/0N3Ye0r5SzLfkc9G+EyRsQUqB6R1eRLdpDc8hjMUv74qRRqCtNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=abcUOXL+;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C58606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C58606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=abcUOXL+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yw
	rnWoxIOGF6M2OKCJynf2tZcjMgeFa7DuGTFYZmyBw=; b=abcUOXL+oEpOIwnJqe
	DgoqpDDVP99Qs+yNkvgQGkNlTDTNFe1tW6J8L4PNpcqiOKv7HhXeGCgt5p2euH2r
	5nQU5wY5FKONfxmmNUx4YgfF6YL+j0EJUVSEAJdUHwOjIO9b0tCN/zuzTi3TA/Lr
	LLwI6D4vhwFQ2XuIZ0vQMqUt4=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F3yOS9dq_hrHBA--.7622S2;
	Tue, 20 Oct 2026 19:07:58 +0800 (CST)
From: shaos <shawnq1@163.com>
To: akpm@linux-foundation.org
Cc: David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] mm/ksm: KSM merge clears soft-dirty tracking
Date: Tue, 20 Oct 2026 11:07:58 +0000
Message-Id: <20261020110758.960048-1-shawnq1@163.com>
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
X-CM-TRANSID:_____wD3F3yOS9dq_hrHBA--.7622S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxury5XrWxtr1rtF1rtw48Xrb_yoW5Xry3pa
	yqy3Z0g3Wq9ayDJ393ZF1qva40vwnay3yUJa98Jw1fAFZxKa10yF1rt34Y93WqqrykWayY
	vr4jgFyqqw4v9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4c_hUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC0A6GlGrXS45BowAA3W

Hello,

KSM can clear the soft-dirty state of a page when it replaces a PTE with a shared KSM page. After clearing soft-dirty state through /proc/self/clear_refs and writing to two identical MADV_MERGEABLE pages, both pagemap entries show bit 55 set. Once KSM merges them and their PFNs become equal, one entry has bit 55 cleared even though that mapping was written since the last clear_refs operation.

replace_page() builds the new PTE with mk_pte(kpage, vma->vm_page_prot) and does not preserve pte_soft_dirty(orig_pte). The marker loss can make userspace dirty-page trackers miss a page modified since their last checkpoint. The PoC makes both pages dirty before merging, so the result does not depend on which page KSM keeps as the stable page.

The same replacement path also loses userfaultfd RWP markers; that separate observable is documented at https://gist.github.com/shaos26/e887665d7868dc323d73a1d678cacd3d. This report focuses on soft-dirty tracking.

HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
source version: Linux 7.3.0-rc7
architecture:   x86-64
compiler:       gcc 11.4.0, GNU ld 2.38
QEMU:           6.2.0

console output: https://gist.githubusercontent.com/shaos26/9db36768f01eb83c6aa14ee9fc057388/raw/59077135f035791493d6d487c9e619c16380518f/console-output.txt
kernel config: https://gist.githubusercontent.com/shaos26/9db36768f01eb83c6aa14ee9fc057388/raw/baa5ee61ce748667104c480560ab5116a100e3fd/kernel-config.txt
reproducer: https://gist.githubusercontent.com/shaos26/9db36768f01eb83c6aa14ee9fc057388/raw/06005564982eab5cbcec26c5d62ad86c7261a155/poc.c

Build the kernel from the revision above with the attached config. Build the static PoC with:

    gcc -static -O2 -Wall -Wextra -Werror -o poc poc.c

Place it at /init in an initramfs and boot a fresh QEMU guest:

    timeout 300 qemu-system-x86_64 -machine pc -cpu max -smp 1 -m 2048 \
        -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
        -append "console=ttyS0,115200 rdinit=/init panic=-1 oops=panic loglevel=7 vivid.n_devs=1 dummy_hcd.num=1 netrom.nr_ndevs=1 rose.rose_ndevs=1 max_loop=1 comedi.comedi_num_legacy_minors=0" \
        -display none -serial stdio -monitor none -no-reboot

Two positive boots reported RESULT=KSM_SOFTDIRTY_LOSS_CONFIRMED with equal PFNs and one soft-dirty bit cleared. The non-merging control kept distinct PFNs and both bits set. No privilege escalation or memory corruption is claimed. The affected KSM replacement logic appears unchanged in upstream master f47d223627f8; runtime validation was on v7.3-rc7.

Thanks,

shaos

