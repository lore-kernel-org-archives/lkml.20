Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494482;
	b=nxfV9SODOzLdHPow74S0e713KTi7h5e8xWNSyqfa4t9qg2g0ly/n2bHrlx8pipae/vXl
	 /Dq0tV8x5vi3BpQSMioxAun2bWWXpMrrCH4nlPvlRLy+idWXSE7sbzUJLIeBOkcPEfki+
	 KARsdv6o0u0DYPOEAN/bn/Tr3loLWCPpJe7ypbVgyWSUjF4rtHXngu2jDi466Xw0cBlTH
	 5Sewcmmg5+fJPO+0vz/Jda1qJJxL4ybzkbBFsX/EPqpIxgmnfMY60JW9Kh7irnLpVabY1
	 rzGzxjnY4K7z7T5VaVCpo4GSbfuzKNTkbwM3hCiIN+5kZfkntgJrpS0qLOhXBz9pa4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494482;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=swzxuzAAPk1vAzSfjUBi6A+yIRFDCeelp/hZ1PU1LeU=;
	b=X1oT6RzggGqppSUVlEwKGjiOmUqOLaQZra8p77XXEjAlH706dQND0XFoggJRVi8HOlIx
	 UrRJhMeCowCemn826X7EunasJPgf2d1DRbcyQSiLcmXhrz8y6c4eke1uiH+utPBGTPRJC
	 xb2eJRhC/RdqgOXrFgZjbYbl0jk1PvSwtRJUX0/DfDnXx+0XmDqnRXF5yYC//+4Usu4+q
	 zjnUCL4gUHNPSQqkgYYmjOjfTf/OdKQ4ukGrbqV8n5q6rsTLtOh91hrRlFlbjJ2t9VESX
	 pGrhdnmurSdCudKg/+Vnpyfi6N4jnAWerTsk/T4UwAXgMKxe1APEKkLc+Eh0f4O2/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SsD3UHBa;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE360A2601
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FE360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SsD3UHBa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sw
	zxuzAAPk1vAzSfjUBi6A+yIRFDCeelp/hZ1PU1LeU=; b=SsD3UHBaamws0R8h3b
	HGF5RaGnEOeIJ8UHYd6YxuZp1kGUjDJVs2XcHVaQ30A/WQ1rcn+N2rTSSpXWQ9A7
	1zf9XsF9iCPJi6jaMU4642ecTTng7wtEqV1bc23PfUnllJqwy4u5pMxhFCQ2F5L2
	nN6LUeipFl+xvkIijnVEnUzos=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3_xOCS9dqKN5BBg--.52199S2;
	Tue, 20 Oct 2026 19:07:46 +0800 (CST)
From: shaos <shawnq1@163.com>
To: brauner@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [BUG] kernel/nstree: listns stops at an inactive cursor entry
Date: Tue, 20 Oct 2026 11:07:46 +0000
Message-Id: <20261020110746.959806-1-shawnq1@163.com>
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
X-CM-TRANSID:_____wD3_xOCS9dqKN5BBg--.52199S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryfGr17Kw1DJrWkZr4DCFg_yoW8KF1kpF
	ZYy393K3W7KF1xJrs2vr18X3WrCr97Ja1UJF95uw4IyF4DCr1vyr1xu34YkFsrJry8Ga4Y
	qa1Uta1DJa1kuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UfUUUUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8gODkWrXS4OgnAAA3q

Hello,

The cursor-based listns() path can return ENOENT at an inactive namespace even when a later active namespace is still visible and listable. A caller continuing pagination can therefore stop early and miss later namespaces.

The PoC creates a user namespace and pins it in the namespace tree with a memfd passed to a surviving process. After the creator exits, the namespace becomes inactive but remains the first tree entry after the cursor. A later active user namespace is present. Plain listns(0) omits the inactive ID and includes the later ID, while listns(cursor=inactive_id-1) returns ENOENT; advancing the cursor to inactive_id returns the later namespace.

The normal list iteration skips inactive entries, but lookup_ns_id_at()/lookup_ns_owner_at() apply ns_get_unless_inactive() to only the first cursor match, and the syscall treats NULL as end-of-list.

HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
source version: Linux 7.3.0-rc7
architecture:   x86-64
compiler:       gcc 11.4.0, GNU ld 2.38
QEMU:           6.2.0

console output: https://gist.githubusercontent.com/shaos26/7832f4370119799cac6c493e6984e107/raw/41d7d989d2b28afa92d6a11989e218224e175647/console-output.txt
kernel config: https://gist.githubusercontent.com/shaos26/7832f4370119799cac6c493e6984e107/raw/3cd943ba8c6026b43ef016a37d07efd2533a317a/kernel-config.txt
reproducer: https://gist.githubusercontent.com/shaos26/7832f4370119799cac6c493e6984e107/raw/7cb61c70f803fcf46edb4ec185a5c526553b9c6b/poc.c

Build the kernel from the revision above with the attached config. Build poc.c as a static init program, place it at /init in an initramfs, and boot a fresh guest with:

    timeout 120 qemu-system-x86_64 -m 2G -smp 2 -machine q35 \
        -kernel artifacts/bzImage -initrd artifacts/probe-initramfs.cpio.gz \
        -append "console=ttyS0 rdinit=/init panic=-1 oops=panic nokaslr loglevel=6 probe=listns" \
        -nographic -no-reboot

Two fresh positive replays and an active-cursor control produced the expected results. This is an enumeration correctness issue; the PoC does not demonstrate a namespace permission bypass or escape. The affected lookup logic is unchanged in upstream master f47d223627f8; runtime validation was on v7.3-rc7.

Thanks,

shaos

