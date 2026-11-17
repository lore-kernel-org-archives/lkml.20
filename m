Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.87.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895220;
	b=X+e12CXB50NvJJqbko0eHQrHzQ8rnfkjBFgxFy+ugC7SrgbFifl+IEncnLIcHc89Nprz
	 HzS4JCPUvkS7pYzOCPqHyh162iNm6ZI/A5JJ4drsFQG7LJQ1uCPXQ8++i5FVFOcBmI4nZ
	 X8QvvnOINKtiWCditPqhaLItxUeArtz0+eKla1V9mu5D0kOJVK4iHrwUFdHhidzzsp96w
	 2cBqAxCChbU0xqfaojtkXCoSNt7WtyGFnASOpUD4cASxA0lvaUh4JQ1P8G9/6rIR0PGQO
	 rMr98RIa9cXw4B3NcCwD5zQgYoh1hGQo3FNcb4lTLp2UqJlMyhW37mNF3bZzGurLVfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895220;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:X-JNJ;
	bh=Ie9TBnSRuFvJfRJMkw1HwmXycVla5fkFGDRxPOE8hzA=;
	b=UNgu/hGyUc8kSN0eDbBrn1dunTxhd0wKbSrkK7itqT8bjUSxPbEpLeMrp0637rUtuSPO
	 uDiZo9ioHGRs2gWJQN1CUW4khpvFk5gFha9pLOfQBFm7jiRfTggW3ELzp+DgFp0m5MGFL
	 9Udsjh/vA6qnhLcRHCg0KJJ10JPJ6y9/Mo5FwjFLOH/aRB9kYS16QKPDFj11LXQ3CAOQO
	 VyBcmYRm5VcGKDeiiahH3iadQ/YvD49fHAl0qxdEq8Jv9p2CszcpG5G2s08kaJfEcl8j4
	 4Nlns9ZBBPOCU+7AOJ9/BSWYx4TidYrdMK7kiCQPWsAc9FdCMS3gegUuUgp1kWkxItQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=GWkO9RfJ;
	arc=none smtp.remote-ip=57.103.87.93
Received: from outbound.qs.icloud.com (qs-2001i-snip4-11.eps.apple.com [57.103.87.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D910F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=GWkO9RfJ
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-1 (Postfix) with ESMTPS id A1F893000167;
	Tue, 17 Nov 2026 06:00:16 +0000 (UTC)
X-ICL-RepId: 01a1e817-7fcd-7a89-85d9-392adaaf6cf8
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794895218; x=1826431218; bh=Ie9TBnSRuFvJfRJMkw1HwmXycVla5fkFGDRxPOE8hzA=; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:x-icloud-hme; b=GWkO9RfJ06BxOFbckch+rN0PvcRS7UM49skD1gP4LwkJuboXqZMbM+DO5NvYf63Os145IC5Pm2Q1M6Obtn5bjebe9eaxTp4nXHqk3sJyPXEtwpIkLtqYvF3KF5Ub9Yh7QP7NhYbtw3iYWnBRDv12li+zxZgPyw88LoFrdoc2B0RACT0sDHLWhxhw2Kp53VWRDX9bUa599itTxHffnmb/V0aZvW4YUBfHl8hOgMTs7Ln8a3BbNcb2TpUziGLGzU3/CIltT/1tDplQ+kLcIbaXuCpc8ykcQDfsNrV9NV2nzQZM/c6vj4JHRJKWvyjKET9MODNt3R/sIvhZDa/JGj0ERQ==
Received: from [100.126.217.91] (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-1 (Postfix) with ESMTPSA id CD5CA300014E;
	Tue, 17 Nov 2026 06:00:08 +0000 (UTC)
From: Muhammad Haris Awan <m.harisawan@icloud.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Liam R. Howlett <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] fork: mark memcpy() in dup_mm() with data_race()
Date: Tue, 17 Nov 2026 10:59:56 +0500
Message-ID: <179489519663.1444496.15875846661591982934@icloud.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: pUoMMQlIZVsQSMrjSPyAHBRwL_I-Pivh
X-Proofpoint-GUID: pUoMMQlIZVsQSMrjSPyAHBRwL_I-Pivh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX0DXmc8aPZLSQ
 W/B287taoyiHNjHkANbxhoqigOb7QJ/fLGALDAxlXNFRxmu5/qhRwfmTTtwGGrPjVFBKOtP1AoI
 Z3WG5+Rq4RxJ2TxOvdIt5bJFy6QnqSNN+fst9DqIZNh7kPqzHtziKjTBvFpObG23wyQ7HyIr1pn
 ZXYRNwt9weBnOHhYz6p3XlTxv3FO469PqW5iopOqXMaaZJAmFWmLpEe60863J+PwnyvCI+otvLg
 lJeRvwLRJCRnp6YBexNE9Gy9oQOMRPioRy8nogkF6S5ss+wd11iDv3hSjnQA/b+GS5UHWwIc+an
 HTVZ7O+tzFs3NGsD87lw7bugVF7NmKPU1CE+mG6/m2iDM5IJ4BEECP+qgbyzuo=
X-Authority-Info-Out: v=2.4 cv=SqCdKfO0 c=1 sm=1 tr=0 ts=6afbed72
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=2kFROKt5_e8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=v3ZZPjhaAAAA:8 a=9Li-14qwQSEJLBuQiiEA:9
 a=QEXdDO2ut3YA:10 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
X-JNJ: AAAAAAABC4lDjXeSrz98vWgaoTEW+CwIyC+MyrLWESSPjxuu4r3QE30jwIJqyeP3MNpABI
 jVClgbqV6hPK3i6zLsApEOdWWRbOTS47n9CaJimHBzh2nDwlnU5Hd4EYl2mVL8BwAcuzua
 F9i4czwAApAET2NCKe0Amr8sHE3kW/SyZMTUsPoq1X5Xq38S1lsH0E6mcKl22NKZcQm603
 Xq14eQbSdVV70mB8doJ3V6vdsFWSiT6mnYGZqHRJNrf1ltVC8NlyWSiiJEgG7FzN7LDqAW
 gmfOQLJ2IzJu6WgGZ19Y9DXO+Qr3APJBBUgbIeeMhZaADNZAT+lhtISJY8KTHRu6Khr+SO
 U3k+9n1U41NXq66N8qF7DnDYfBi2ig1dzqAGREqd8wFS+Qw6gdxrGAOIIPBdaShqPrURD4
 /NHIZRQSwn6pH4qiVzPrxtMKMSXAukjzhSOb+WijqpwxJ7+Hh4OJaq5felEY3GxcPDYzam
 PGD6JINiRUSm4BI40QKm25E8Tplm4LfBy7+ir5u4y5bP1fL/iDuGfDM47KoOiHTy4PTRhA
 pjy80ExTrMQsKcXIJEUdg0QFGi9xSwoo+13DfQruWnHMQnumS/G59pgXI8QTJSetSe/2er
 liauSbszJryBI60/bdwNysLNOkXPYhTI1t7sTL19ulMWPTeiOK+UhgtF4EblYhkviO908U
 //Y1D/+Zm+oFGVeSGopGv241sZ1Z7raS9VOmm1tgfLI0XOqL9pFPhek2Wa2w3ckOyf7M+o
 xwFbAGXPVCdJS/4HSCBIawqTnck6fTf24XA+HoMyn23rObNEzTltGWoCkWL0axg7e97Cgf
 UGKlo7QTgBm2YuJN1zR7Th4UBMFSiZ6OSQLQUM4G1Vgp78aM2BSDMPocBZMWI18q4pwSSi
 WPFg+O2YGptYiCxd+7KiAii1EZTV6r7y+A4Yf0wX9cQtu+JNtgTKva9GU3pSJUSoaYl0Gr
 3R/Q+16OeWgBsHhe5LLixDsAFy5zIEmNQ7M1o47Vgq4B8E6mrFuXTAEQZ+JCj0hq2lLZ/g
 djYxEZ8P+kmfJnw5CsYlJGxA8xC0JZrW+6Okrn8In+r3IsNJvf17aKrIQu185RuzPDuqiH
 Ee77fUEHXtXfF4TLREdgVolD2/gSZbUAkgUzhx1MKqx1Kurb+HYZZPK+V22zXaV/PRzw8f
 GtGT3yJo6NCdSOtfDNmwh69z7Zv4e7FmsI/D+rblY9dAYuY+cDQ3hnRA583ZcR1WFXqnP/
 EUPswHmeMLH/ireMq8FZ1ukdxf0rXowNhdTyT2+KXvZSzWEVCsS2AgmsDx/npCnHmxaQSE
 wdHR/4oiSSY0DeoJMzdp8vZyaK5Mw2whiLbG+gD3OKdRe8Ya0BAXRNXWcuEGv0zOz9xwyM
 JWKD9zHv05DKtaLv/Fkunof8eDtUf35SuhJQZmR2JdsQFwuRGZaV0vcZPEsmu4wgbxBSAF
 +0K/Je/odGPfxD7xyqcAlz4B5W8espUMVax2BphV/7myDdb8bJE4Ixa2m4xiV4GNI=

KCSAN reported a data race between dup_mm() copying oldmm via
memcpy(mm, oldmm, sizeof(*mm)) and lru_gen_del_mm() modifying
oldmm->lru_gen.list when an adjacent mm_struct on the shared
mm_list->fifo is removed under mm_list->lock.

oldmm->lru_gen and oldmm->mmlist are protected by mm_list->lock /
mmlist_lock (or updated locklessly via lru_gen_use_mm()), not
oldmm->mmap_lock. Because struct mm_struct uses __randomize_layout and
mm_init() immediately reinitializes these fields on the new mm, wrap
the memcpy() in data_race(), matching dup_vma() in mm/vma_init.c.

Fixes: bd74fdaea146 ("mm: multi-gen LRU: support page table walks")
Reported-by: syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c6e1b1b32ff2fc3b7d60
Signed-off-by: Muhammad Haris Awan <m.harisawan@icloud.com>
---
 kernel/fork.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 5efceb8d5..14ac9a070 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1539,7 +1539,12 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
 		goto fail_uprobe;
 	}
 
-	memcpy(mm, oldmm, sizeof(*mm));
+	/*
+	 * oldmm->lru_gen and oldmm->mmlist may be modified concurrently under
+	 * mm_list->lock / mmlist_lock or locklessly via lru_gen_use_mm(),
+	 * and mm_init() will immediately reinitialize them.
+	 */
+	data_race(memcpy(mm, oldmm, sizeof(*mm)));
 
 	if (!mm_init(mm, tsk)) {
 		mmap_write_unlock(oldmm);
-- 
2.56.0

