Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456503;
	b=3Cfd8S4J08FEo8zB37ghqFXbbN1R6upYSmBnw2orZTLNi6UNqf3tdjInXMMRPVt109o5
	 m4JfxfTWjLGDAXxFMYBMDA4SHgZqVnj9Y/AEA0Nm7pSDHPkAcAAZw5IGTQ2foTgxgFgnO
	 lzBYMVC9CyMUqOhSughoTsSXFfeC/nYwExpxteikQ2X3MiB8dwTSL3MTbVjA+93oxMMK/
	 /Dqr238Aq2QVfgmL6dUzmJIw1vWzjXNU6QnpKLQP9Hn+mUnoYxooYP6L9pJ7A8TUKIQ1Q
	 S0WODd/yjfh8rjgchwgDXR++7r41AAgM9cWbqwl7t8DfQHvKvTEbTht5lTBs75dyUxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456503;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=OBz0ZWTSJo6VaFHPQJeL7weuIDpkBIRGsLQFEK0yJPs=;
	b=UKZzaLvubFW+wzFVqjO/6x4zca4kHALAn5vXjs06zJNFMEXjpAb4BLKyqZe4nfD1MoSA
	 u9ggU6payL/p4QI9MHib9KCO9vhUxdBK8XSLNWpzBnMANNh44XvUHHf55CHItl0ObfFpc
	 VsN3HOuDosaEvnWoTXbLzR/RGq/q6s4IKjOXZdig/2rcA8k3iEibhxrcTlf92KMba0Ocq
	 M+MDSfjsJgC8fT9/DD5R0OY7OVqSXVH0Fu+ytJxkL+9Txsrvvq0jmoP7AC2TSpOCBqvbY
	 rh/DNuStVaiLlV49zbHEhaMsaaCucJszbqrev0JYfWsc1TRO3Y7DqoSWda7EKPVUx4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=V6e5n5Zk;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E854606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E854606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=V6e5n5Zk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OB
	z0ZWTSJo6VaFHPQJeL7weuIDpkBIRGsLQFEK0yJPs=; b=V6e5n5Zkei/cx90LVf
	sR4bFWeAr0uywpDF48XmJHX5VUscxSqd86tTNSX0aQK5AVjjTnVy2vxGgcih+7/N
	lcywyLiIZyKpKOHa0GJ7HsoheotF9LkdJgBI6XRbE0hjrgMUSf6G1S4GmmE15xw9
	zERT/9DLyAMZ0ZkGGA9w1GC8g=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDn92YVt9ZqVYMqBA--.11309S2;
	Tue, 20 Oct 2026 08:34:30 +0800 (CST)
From: shaos <shawnq1@163.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fuse: copy_file_range exposes stale EOF data when extending a file
Date: Tue, 20 Oct 2026 00:34:29 +0000
Message-Id: <20261020003429.1009226-1-shawnq1@163.com>
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
X-CM-TRANSID:_____wDn92YVt9ZqVYMqBA--.11309S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trW7XF47JF43tr1kAryrWFg_yoW8tF1Upr
	WqqFWftr1vqr47tF93CFW8Xr10gws7Aa13JFyqq3yxuws8Jw17tFWak3yj9a48JFn3WryI
	vw4jga4xXws8XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Upv3nUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8RZDUWrWtxY7wQAA3S

Hello,

On a cached non-writeback FUSE mount, __fuse_copy_file_range() truncates cache pages covered by the copy, then publishes the larger file size.  If the destination had a partial old EOF page and the copy starts beyond that page, bytes dirtied past the old EOF remain in cache and become readable after extension.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/b7d8226d784c14ce316263de1779bd94/raw/59a9f0c87769dae27cff05ace7e808daa10ad2f5/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/b7d8226d784c14ce316263de1779bd94/raw/441739e20934d6b36aabbbbfe5153d11b70dfd34/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/b7d8226d784c14ce316263de1779bd94/raw/6ffd0112d0654714a15618f2877d9ddd1a9723f1/poc.c

Build the standalone PoC and run it on a host or guest where FUSE mounts are allowed:

    cc -static -O2 -Wall -pthread -o fuse_eof_copy poc.c
    ./fuse_eof_copy --mode=copy

The program creates its own cached non-writeback FUSE server and client mount, dirties the old EOF page tail, performs copy_file_range() to extend the destination, then reads the newly in-range bytes and checks server writeback.  The retained QEMU run used the same PoC in the copy-mode initramfs.

Three fresh QEMU boots read back 3072 bytes of 0xee from the newly in-range old EOF tail and recorded a server-side stale write.  A same-path no-pollution control and a write-based extension control returned zeroed bytes.

Impact and prerequisites:
This is a data-integrity and stale page-cache exposure bug for cached non-writeback FUSE files.  The demonstrated read is within the same process's file; no cross-process leak, memory corruption, or privilege escalation is claimed.

Validation: Three fresh positive boots exposed the stale tail.  The same-path no-pollution and write-extension controls returned zeroed bytes.

Thanks,

shaos

