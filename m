Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814315;
	b=2PFryUnfATPzfmGmd0TGxE7/nhEVb0J4F98+Y+5qZFxbDDEyS7MtahiFSQ7PvyGxoRNL
	 rhgiVjF7BrAEpqZLOm5H2VwI8cZ3a5c/nS8VUHy/3BNFC1wdhBmnUYwUS7uvgOjoukGO7
	 4EZCoIcnO+8Lbrhgngr8RNEOc6YaeLgyN3ta/GdLQBtc70WwxtT8Ivwcq8cz5K8pegIks
	 MlSEYePlHBohbKOvZED+5Q0Ydmz+HlxjkIokYbEFsd46WjEn/rJG/KJmGOvvd2CaUaz/G
	 qcRE1Ii4udGpBWbIpfjZ9GvlU42126HV8hnt7PFx4gCNSvj52Z4dgbieB0Zk/n7D0zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814315;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Xu2+ZqWLiH8ac/CHEFRlUaMcIRQgTHmvl2/TbWN1jDE=;
	b=WJdIFVnpBAzXHW+HPNwdfsmKnzcW2atn6yq/U8HtlCx5Ka27j00kpBAqMrAgG302uRcz
	 LHbH8pvz9FaJeZ0rGUEYk3Oe551UDkuuF1Qj/I3LOJJntyvv2MzEwVsKwwKF1YhDbLl/Y
	 ssCNhfcl28niCCulOwkMDlkz/IfbyzfHf/dU9Jnncq+R1qsNuhPCs6dZOSh7Sqo7xh17h
	 +LiBL/hTHSk4c5csTnUMYjzgEazQBNidMW8nq+q1Y1+tZN9m7eNiWQo0N9alYCOdIowrS
	 W4WM5vcKvQn4pomZdjOnJOJhEuMf8xrAqjHpZO2hfb6E/OCImZIvhb8mMbQzYSaZezw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m99FfT49;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C789B606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C789B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m99FfT49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xu
	2+ZqWLiH8ac/CHEFRlUaMcIRQgTHmvl2/TbWN1jDE=; b=m99FfT49cAacTyHuKC
	ZVlrc/ddyosRz6FdT5OMNPUKS80vN/Zx7yTwkCJebC8IoVumS/Rse8b+ZTC14Bzn
	mGcQFH5F9R5QQ0ae2l3+QsANZwRqgXtidwYsX3CSCTtcMzpHNdNDDAp1hh7b2sD3
	XneAEZi1KkV2IYvdhw8VekmBg=
Received: from mm (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnB4dFsfpqIKNJFg--.7882S3;
	Mon, 16 Nov 2026 15:31:21 +0800 (CST)
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
Subject: [PATCH v4 1/2] arm64: copy_template: add an offset-addressed 64-byte loop
Date: Mon, 16 Nov 2026 15:25:11 +0800
Message-ID: <20261116072512.1323883-2-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116072512.1323883-1-xiqi5703@163.com>
References: <20261116072512.1323883-1-xiqi5703@163.com>
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
X-CM-TRANSID:PCgvCgDnB4dFsfpqIKNJFg--.7882S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF17JF4fuF47trW3uF43Awb_yoW8KFWDpw
	1xWrW3Kas8GwnrA3yfX3Z7CrWakan3JFyfWFZ7KFn7tw1jqa4Yqw43Gw1F9FWUJ39ay348
	CF9YyF1DGas0gFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsuc_UUUUU=
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7QnXDmr6sUm9jQAA3l

From: Qi Xi <xiqi2@huawei.com>

copy_template.S is shared by copy_from_user.S and copy_to_user.S.  In
its 64-byte loop every load and store is post-indexed, which on the
user side means two LDTR/STTR accesses followed by an address update.

Add a COPY_TEMPLATE_PAIRS variant of the loop that uses offset
addressing and advances src and dst once per iteration.  Without
per-access writeback, the loads and stores of an iteration can overlap
rather than serialise on the base register.

Defining COPY_TEMPLATE_PAIRS before including copy_template.S selects
the variant.

Co-developed-by: Ben Niu <benniu@meta.com>
Signed-off-by: Ben Niu <benniu@meta.com>
Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
Signed-off-by: Qi Xi <xiqi2@huawei.com>
---
 arch/arm64/lib/copy_template.S | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
index 7f2f5a0e2fb9..12ab3bc8afa3 100644
--- a/arch/arm64/lib/copy_template.S
+++ b/arch/arm64/lib/copy_template.S
@@ -161,6 +161,40 @@ alternative_else_nop_endif
 	*/
 	.p2align	L1_CACHE_SHIFT
 .Lcpy_body_large:
+#ifdef COPY_TEMPLATE_PAIRS
+	/* pre-get 64 bytes data. */
+	ldp2	A_l, A_h, src, #0, 9997f
+	ldp2	B_l, B_h, src, #16, 9997f
+	ldp2	C_l, C_h, src, #32, 9997f
+	ldp2	D_l, D_h, src, #48, 9997f
+	add	src, src, #64
+1:
+	/*
+	* interlace the load of next 64 bytes data block with store of the last
+	* loaded 64 bytes data.
+	*
+	* The loads can fault on user memory.  Since dst is not advanced
+	* per access, each fault is fixed up to account for the 16-byte
+	* blocks already stored.
+	*/
+	stp2	A_l, A_h, dst, #0
+	ldp2	A_l, A_h, src, #0, .Lcopy_opt_fixup16
+	stp2	B_l, B_h, dst, #16
+	ldp2	B_l, B_h, src, #16, .Lcopy_opt_fixup32
+	stp2	C_l, C_h, dst, #32
+	ldp2	C_l, C_h, src, #32, .Lcopy_opt_fixup48
+	stp2	D_l, D_h, dst, #48
+	ldp2	D_l, D_h, src, #48, .Lcopy_opt_fixup64
+	add	dst, dst, #64
+	add	src, src, #64
+	subs	count, count, #64
+	b.ge	1b
+	stp2	A_l, A_h, dst, #0
+	stp2	B_l, B_h, dst, #16
+	stp2	C_l, C_h, dst, #32
+	stp2	D_l, D_h, dst, #48
+	add	dst, dst, #64
+#else
 	/* pre-get 64 bytes data. */
 	ldp1	A_l, A_h, src, #16
 	ldp1	B_l, B_h, src, #16
@@ -185,6 +219,7 @@ alternative_else_nop_endif
 	stp1	B_l, B_h, dst, #16
 	stp1	C_l, C_h, dst, #16
 	stp1	D_l, D_h, dst, #16
+#endif
 
 	tst	count, #0x3f
 	b.ne	.Ltail63
-- 
2.53.0

