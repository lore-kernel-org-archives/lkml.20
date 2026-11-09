Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247218;
	b=PVsm88czc2xROs401hzcBZlxKscngT2O5XTcpv7Whdr1bbov0sW7PwaeI6BpIrx997fz
	 TaGI1fYxUHua4UrlXl140czdllUr3aRyHztEfwTHxwAYaOBoK7w7CBBNlMnzgDIeKAR0Q
	 ue8dkvoDjJfgvRRQUPzphBpe6FVPAC/umD5edfqJmpvrzWqhKuX0mm4IMQAQ9K3ix4ZUP
	 LduE23Q8eDwE7zM0NAQu64STeTJerTXMWD8qoR7pyKXHd5CQdb4JP2T54MDKaglOW34tL
	 v/BHCqQb4i16eeoX2XEAatP7tYzVRC/f8GkWgMfsVFSlQw87Pe0WbyFqNZvS8+zhUHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247218;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3xK7L4/JaYx0EL19I/D7/R7R2oh/67eUA0pLpz/4Vyg=;
	b=M+7agcWX1SlR0XDCWq948Kq5Z2g9YvQZU8PA33GsB/vlcooG13QZD8WdzaKrYcrWXqcB
	 PynamZj5zZPk27hdFORHkt7ozQWNvQbPGWktDNn27Ig1Xqq50TQwdes6EOOqBR3nxwTNH
	 /6i8d3g6hLcwYSlKrIRT5tvv5MGhppuybEazHLG5s5T8g3bHZok85knfts5DbY997s8uN
	 5CU9TbVNFm7PGsnVGBpUoGvQfAKswK7TCj2pADBfiFug8zK8wHuRXEnslNtebvKT4v03F
	 EnN5zdnvTSyxButHskmKTkDMthposwyxxBVKs5N5Qkcrk7H2w0mCUGlaNXpeTah3t2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hj+qJx5a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86922606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hj+qJx5a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376BB1F0089F;
	Mon,  9 Nov 2026 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247218;
	bh=3xK7L4/JaYx0EL19I/D7/R7R2oh/67eUA0pLpz/4Vyg=;
	h=From:Date:Subject:To:Cc;
	b=Hj+qJx5aYVz8wK7JQmQamBE+WqPvz9takatG7seQvX/+mEnAjhg5HqjTgUO9AgK1p
	 7JQccuZtWODOtPoz0vz5gKnYz3cLFdcB6eWIIcHQmjWUFFxq0t1m90MpHowj4bdhAd
	 ZYrqYFD70FTKY3KcwFLPH//jbT98bTNV+7hZD2jbtduxZcFpnLUKbtgKG+X2ot0LDw
	 skhG2yTcYv5/2l22SKOPOUFyeWchNU4zu2SZJoGyPtTDjPBkBcgT3X01HPzT6uRdQH
	 j9pZWXIJopS1wbHocqT4MJs1YLXq6zdZf9NEgRVUqytdkt0bi8CKVo5Jd2B4+4V70k
	 77LvMITkLKnSw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 09 Nov 2026 13:00:12 -0500
Subject: [PATCH] powerpc/smp: Handle of_property_count_u32_elems() error in
 parse_thread_groups()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-powerpc-smp-handle-count-err-v1-1-e777fde7f71a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBBA0auUWTuQFCnGq4gLk0x0RJMw09ZC6
 d0bdfng81dQEiaFc7eC0MzKJTfYQwfhcct3Qo7N0Jt+sNY4rOVDUgPqu2IL4oswlCmPSCLojyf
 vUooDOQNtUYUSL7/95fq3Tv5JYfw+Ydt2RwA6oYAAAAA=
X-Change-ID: 20261109-powerpc-smp-handle-count-err-b48b9ffd6e90
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Kees Cook <kees@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255; i=nathan@kernel.org;
 h=from:subject:message-id; bh=57alKDJGvf9NrPNQP0TZ4PGabY5w76Ut3KmDPbLom1M=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmfuHRzNF12rtI6FLD2qMrtB3cCrwkJL511bZZJz8qQt
 3rTIjSKO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE3oUx/E/TmHWsXZ5dp8Y6
 ceG8v27fjN8+3RA1J8js9YYiw9MHt8xiZNh5WVpB4Kltw8T7ScptjjeqTp79siaO69qGabfb3r9
 e1cEOAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 0af298e62e5c ("treewide: refresh kmalloc_obj()
conversions"), there is a warning on boot for several PowerPC
configurations in QEMU:

  WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x174/0x1b0, CPU#0: swapper/0/1
  Modules linked in:
  CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.4.0-rc1-00262-g0af298e62e5c #1 PREEMPT(lazy)
  NIP [c0000000006074e4] ___kmalloc_large_node+0x174/0x1b0
  LR [c00000000060782c] __kmalloc_large_node_noprof+0x3c/0x150
  Call Trace:
  ...
  [c00000000369fb60] [c000000000614ff0] __kmalloc_noprof+0x490/0x690
  [c00000000369fbe0] [c000000000051308] _kzalloc_noprof.constprop.0+0x1c/0x74
  [c00000000369fc00] [c00000000200b450] init_thread_group_cache_map+0xc0/0x2c4
  ...

In this case, of_property_count_u32_elems() returns -EINVAL because
there is no "ibm,thread-groups" property. When kcalloc() was used to
allocate thread_group_array, the multiplication overflow check in
_kmalloc_array_noprof() caught that a really large allocation was
requested (as -EINVAL was converted to size_t) and returned NULL.
kzalloc_objs() has no such check, so the large allocation check in
__kmalloc_large_noprof() triggers the visible warning above.

Check if of_property_count_u32_elems() has returned an error and bail
out if so, clearing up the warning.

Fixes: 790a1662d3a2 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7a25eaa59e62..58824f5f4c80 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -824,6 +824,8 @@ static int parse_thread_groups(struct device_node *dn,
 	int i = 0;
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
+	if (count < 0)
+		return count;
 	thread_group_array = kzalloc_objs(u32, count);
 	if (!thread_group_array)
 		return -ENOMEM;

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261109-powerpc-smp-handle-count-err-b48b9ffd6e90

Best regards,
--  
Cheers,
Nathan

