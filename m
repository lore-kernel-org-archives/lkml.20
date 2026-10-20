Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456669;
	b=JUf6FCAbKoAzythqkzUXN6u80899ZFpo/uSIfTJmFl9K6IV6JdDnvfXIMpHqZyUv4JYm
	 JCLgjKlOa38wKDdJmKepAWyl/IcOZeLUTiqCitd0982KpT179i2Pg5c5s9mp1tJ8yeAHd
	 lY6B1JEDUTHlNymOpedzdyC3T3pmOc3UnYNIKPeRoJMoY1Wbj+IIPdbqeXs9NTsV88XAX
	 f4MsFXvNgs/IcME74sF1/0NYABzoq7/kaowSQPJigvXdykDk0b5Xo59nNiHX3z6C0fI5c
	 ZXA/jmVWLiT9va8T/K85UsV0V7qGZqEij+Eq3PgnjcghVSkTef1lvd6TSIE4JYueW/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456669;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=+BKhvu0tdKm2NsKePavezGnNiQSRYlDZdddnl+kRROc=;
	b=itLK276DLWX70xywAzGJE6+k+4PH9190opfHwzh2PUMNh9jK7TuNYJmqT/eXC1OLrkUo
	 mZ9GHNCFU7xct1a60J1jzh8Nj+Z2OpChKfI45vk1F8rVgw8oht29ZbX8BPBZVwkLFtSQ1
	 SPVMt9Az6ZlIeFkotMkgl6o1tiHLOXMJejrRMYvIiXmct1UBravic68x79eKmknKJZ7JF
	 YysqMW+z7PM9EYns/BrkUZOqtvJUZx1NaK3Jf3khc4ohPjm3ZFO5fBtV2iEafpHE+/Ukw
	 znCq9j6GIvWJB5TPoRT7RHEpnQs1n9NVlsI8B0P0B34BqwPPjCZBEZzzPB9hqahiP6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PzI4C5iA;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C721F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PzI4C5iA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=+BKhvu0tdKm2NsKePavezGnNiQSRYlDZdddnl+kRROc=;
	b=PzI4C5iA9v9MMQMqar8ku5ldJpVBiM4lyIJ25Ndxv9wO57hfEv4UsROW3Gpu+S
	gzCgeN8zlqvBDHs89pBDNa2ezhc6rurkqsVljFqZTZ43mEg3HPUX1NNk/lhJegJJ
	TKbWxiTYQZt3IjLJcAU/66EpHRnPTMgxesm4EFBxn5/54=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnzwWwt9ZqlsuYBQ--.53305S2;
	Tue, 20 Oct 2026 08:37:04 +0800 (CST)
From: shaos <shawnq1@163.com>
To: mhiramat@kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] uprobes/x86: uprobe syscall accepts forged trampoline frames
Date: Tue, 20 Oct 2026 00:37:04 +0000
Message-Id: <20261020003704.1012276-1-shawnq1@163.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnzwWwt9ZqlsuYBQ--.53305S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr13Ww47Ww48XFyrXF17trb_yoW5Zr1fpa
	yrKw13tr1DXFWUKry8C3WkXFyFgrn3Cry5Ga4DJ34ruay5AryjyrWI9a45Za4xCrs5t343
	tws0v34xGayxZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7zVbUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8hBqeGrWt7BKEAAA3R

Hello,

The x86 uprobe syscall checks only that regs->ip lies somewhere in the caller's executable [uprobes-trampoline] VMA, then trusts ax, r11, cx and retaddr copied from the user stack.  A process can jump into that VMA with a fabricated frame and make an enabled uprobe report a hit at a site it never executed, with caller-chosen register values.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/9eb4cfbf7c87bf4b06cd6138775a13814ded54c6/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/b1d9a09b984075b425aab4875117a6766a795110/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/b7e400345a004b4a4c340eccad862ac1f569aaee/poc.c

Build the PoC and run it in a disposable VM with tracefs mounted.  First print the file offsets for site1 and site2, then register and enable a uprobe event at each offset.  The forge mode executes site1 once to map the trampoline, then makes the forged syscall from a uid 65534 child:

    cc -static -no-pie -O1 -fno-ipa-icf -fno-stack-protector -o forge poc.c
    mount -t tracefs tracefs /sys/kernel/tracing
    cp forge /forge
    /forge offsets
    echo "p:uprobes/site1 /forge:OFFSET1" > /sys/kernel/tracing/uprobe_events
    echo "p:uprobes/site2 /forge:OFFSET2" >> /sys/kernel/tracing/uprobe_events
    echo 1 > /sys/kernel/tracing/events/uprobes/site1/enable
    echo 1 > /sys/kernel/tracing/events/uprobes/site2/enable
    echo > /sys/kernel/tracing/trace
    /forge forge
    cat /sys/kernel/tracing/trace

Replace OFFSET1 and OFFSET2 with the file_off1 and file_off2 values printed by /forge offsets.  Run as root for tracefs setup; the PoC drops its forged child to uid 65534.  

Two fresh boots emitted a trace event for registered site2, which was never executed, and reported attacker-chosen ax/r11/cx values.  Legitimate execution produced only site1; an unregistered offset produced no site2 event; calling uprobe without the trampoline returned EPROTO.

Impact and prerequisites:
This falsifies tracing and profiling data for an enabled uprobe in the caller’s address space.  The evidence demonstrates event and register-value forgery, not kernel memory corruption, cross-process data disclosure, or privilege escalation.

A fix needs to authenticate the probe context before dispatching consumers.  Checking only the trampoline address is insufficient because that mapping is user-executable.

Validation: Two independent boots emitted a trace event for registered site2, which was never executed, with attacker-chosen register values.  Legitimate site1 execution, an unregistered offset, and a direct syscall without a mapped trampoline served as controls.

Thanks,

shaos

