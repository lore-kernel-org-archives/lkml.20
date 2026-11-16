Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814315;
	b=WQO02kaAzjwBH89hGQjvfNzQYdXA8ai4SdAZcsSkkKVy2Hjne2U//X3TF1h//j/sH22b
	 kOG2ypvTHVg7JP+nsyy34h5TJQoLG7SmubofyrFchzqMIeaP4W5E38lawa5eKYgCEzJSJ
	 DbgpqBzqVZawgX5b8bmXzLVYXICjUbq4frW1/W1HaXLRY5UvpyC7oteHsjxhMhey8zBsx
	 cQs28OjjOZvbG73AuaUWmMCcn2axaQNh2TVdDlFSyIl6OUYePBTXli9yIFcXvHV2oWk3K
	 69mDaixiNZC89Rs+YwgzF4KHNzHW9ZL34xZ+JfUt26DKVhdH7YKKimZep/ndLiJmq4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814315;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=mmct4hLjqfM6P4J4rNlaQewbZx02Ku0ihgJPS4dJhPg=;
	b=btssTj5g1Hj/gIsDlJIvQykp84xyR0qbagHP5q/EuKFE359lYai74dUNMHqPXvsY2Yqb
	 ZDudW0EMxt2yrTzUe50BtGWq+cF/OMsq2hgd2JspzoUUXtb5E2X3TEocv9LOi90AGPcVY
	 5KdCRWVlV8SM+suOzUfm7DIulw/5b0WELcbzPM3P1qjC6KMQY8dkeQb6xk4TY1ZrhdgwL
	 IoZhpILLnaAoagyEDUhXgQIGV2MsXUbrzEwGJS6rKY40ydChTHonyqnBz4SazdZaoxRXR
	 lq46+JZ/fIWfYJKzWP4oq61mlU6oQOMqa6r1V7MtDBPDst4cl6nVNL5wsAHHRPOm3ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=h5+Yz6Gc;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BC2606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=h5+Yz6Gc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mm
	ct4hLjqfM6P4J4rNlaQewbZx02Ku0ihgJPS4dJhPg=; b=h5+Yz6GcEpigF0B5Vd
	6x3tXEpypfpKY3dRM9/+exVLNXNMWj00su59AjJWnILUAtqzfpNiOyR69WLHSG5Q
	TTeyrbsa1peSOvC8I4A5tQVctwNy8vzhmPGxKQD+mJaAGrC3R63THx9isd05pCqD
	wVziw8zjNvKz6I2Eh69QukQkE=
Received: from mm (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnB4dFsfpqIKNJFg--.7882S2;
	Mon, 16 Nov 2026 15:31:19 +0800 (CST)
From: Qi Xi <xiqi5703@163.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Niu <benniu@meta.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com,
	xiqi2@huawei.com
Subject: [PATCH v4 0/2] arm64: speed up __arch_copy_from_user() for large copies
Date: Mon, 16 Nov 2026 15:25:10 +0800
Message-ID: <20261116072512.1323883-1-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:PCgvCgDnB4dFsfpqIKNJFg--.7882S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW3ZFW5KF13WF1UAw4fKrg_yoW5Ar18p3
	yjywsxKrs5Wr1xAa93Z3W8X3yFvan7GryUWFn7Gr4YvFWagryjyryfGwnY9a17Cr1xG34S
	ya1DtF9rCwnYva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5eOJUUUUU=
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7QnXDmr6sUm9bQAA3F

From: Qi Xi <xiqi2@huawei.com>

Based on Ben Niu's "Faster Arm64 __arch_copy_from_user and
__arch_copy_to_user" work [1], this series continues the optimization
for __arch_copy_from_user() only, following Catalin's review of v3 [2].

For copies of 4096 bytes or more, __arch_copy_from_user() uses
privileged LDP instead of LDTR and toggles PSTATE.PAN for the duration
of the copy, together with an offset-addressed 64-byte loop added to
copy_template.S.  Smaller copies keep the original code.

copy_to_user() is deliberately left alone.  Clearing PAN and using
privileged STP there puts the PAN update in the middle of the user
store stream, which breaks hardware write streaming; on Kunpeng 920
the resulting regression outweighs the gain from paired stores.

Performance improvements measured on Kunpeng 920:

The ku_copy microbenchmark [3] (a kernel module that measures
copy_from_user throughput across various sizes by copying 1GB of
data in each test):
copy_from_user throughput change (positive = improvement):
8B-2048B: ~0% (not covered by this optimization, no regression)
4KB: +2.0%   8KB: +19.1%  16KB: +29.8%  32KB: +36.5%
64KB: +38.0%  128KB: +57.9%  256KB: +71.2%

Real-world workloads:
- iperf3 over virtio-net/tap in a two-level PVM stack
(L1 send to KVM L2 guest):
Throughput improved from 38.5 to 50.1 Gbps (+30%).
copy_from_user hotspot in the QEMU main-loop thread reduced
from 68% to 55%.
- meshproxy:
256KB request latency reduced from 0.91 ms to 0.78 ms (-14%)
at 16 connections / 16k QPS.

Changes since v3:
 - No global PAN disabling.  PAN is toggled only around the
   new fast path, so LDTR/STTR remain the default for every
   other copy and keep protecting against user-controlled kernel
   accesses, as Catalin pointed out.
 - Fault semantics fixed: every load in the 64-byte loop has its own
   exception table entry, and the fixup advances dst by the number of
   16-byte blocks that were actually stored.  A fault in the middle of
   the loop now returns the number of bytes really not copied instead.
 - A 4096-byte threshold is added; from there on the new path is
   used, since toggling PAN also has a cost.
 - copy_to_user() is deliberately left alone.

[1] https://lore.kernel.org/all/20251018052237.1368504-2-benniu@meta.com/
[2] https://lore.kernel.org/all/20260316123100.82932-1-xiqi2@huawei.com/
[3] https://github.com/mcfi/benchmark/tree/main/ku_copy

Qi Xi (2):
  arm64: copy_template: add an offset-addressed 64-byte loop
  arm64: copy_from_user: use privileged LDP/STP for large copies

 arch/arm64/lib/Makefile             |   2 +-
 arch/arm64/lib/copy_from_user.S     |   8 ++
 arch/arm64/lib/copy_from_user_opt.S | 114 ++++++++++++++++++++++++++++
 arch/arm64/lib/copy_template.S      |  35 +++++++++
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/lib/copy_from_user_opt.S

-- 
2.53.0

