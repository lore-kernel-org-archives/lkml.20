Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69B4E56C8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534635; cv=none; b=mWde+im5ARCRPp3SHr88Q6w2BOXGVCpH/0O+bPlyjKF66dBwNUzY2gIpvpU8FKG3i38mQFHf4D8LoazfNoGxFYDMVqDNSKLvPQtwHd65kHQJTz3etA9azeBzrejW4h/u+lSpyt8ynrEiB2KwppvhLNTVnRzP3nqt2eF97ry2fyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534635; c=relaxed/simple;
	bh=DV43FZGIbSPlphinx7+Q4+0ApcdEK/kWt0TA3LKgMGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1skRc+F8m97vu4Lemp+vdyRDacX+R//z5mVxvCs3ATUkxM/SXn5y3PRA7tXyXgvOZWf4wPq4A7dbEsUFfM5FNlZn3ENR78fQ7/9CEObFHtZtEwPWn7Ykf+VhrAGfGzf1ICHdBXIk0GaYGQ7G9q1i5ATC3dVBdNdcPW8RuJfLkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=QuXF294A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S/TZ0Oq8; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="QuXF294A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S/TZ0Oq8"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 18492EC00D1;
	Fri,  4 Sep 2026 11:10:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 04 Sep 2026 11:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534632; x=
	1788621032; bh=C3vy3fSlXRoSP/bUwTQaq1sU+R07aCpj0vZUm+2kQF8=; b=Q
	uXF294AYI6HgdOVTi+0SXzP7FxYI8kwK/qKnYVmzqF9onqaZLKP2h+w6iVfYEjxg
	mj0Iv36T4NH/woorV3EvLIPRp0+tqL8CxizFiVr0ed+8SCmtn285eowLuS7mennZ
	avl+UMO4wS16rxUGxkDQZYaRq8fwsPhEG8OChARpkKrNNiDIi16+qQc3tAhyp2c1
	F64eqtA2S99GsbmCNGJEAyf9/GJHvJQt6FF/OUw2pf22UHjhmCkB9JCShidDNiPc
	mQQodiW9mO+zXuH+uyEsZlI4YKxL/rLCz+Jasi7wgO1q30L73C4SnB9Z07ddJvuc
	kpzJdLW5hIbgb+helDTLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534632; x=1788621032; bh=C
	3vy3fSlXRoSP/bUwTQaq1sU+R07aCpj0vZUm+2kQF8=; b=S/TZ0Oq8tXHI29LV9
	KmdOux2c6cOZTioUS397dqp7YOKaO65dtIPmGmW6F7lI6QBOJNOwo4VlP7tq0QwX
	YRMrjTh1UrPR5s6UrTPU4lySmK8yFPKqaWWEzgxNlNt5MWZy4CoKyEnX8J+m/Hig
	ZptmSG6AX0M1QPGJXKZw1evw8lzDKy7CnjqVTT6n2IIRx/Dgq5G76Wkqs7JFeISb
	YF52Go48ysGkK7grkANFBWiiVbDFDhXida0buGv+4YCDT+spxf9kuCj61tsSl2VM
	hb9al5mtCML5QJSXAZ1TZsaeqTxRbCJjzT+JhMhOPhdXS+SQUTrSxx7L8PbzTTVk
	/hPJQ==
X-ME-Sender: <xms:Z9-aaqikfFbDQwG2M6DMdqg2B63AOZp_wdHSrXCYR-W7gSqLx5804Q>
    <xme:Z9-aam_KJZNIHq8eQ50DRYtHI0jEempFq5l-SwibfPSJv25jQJOyEVLBV04KIOHSI
    JaGjTNvmUw5E6FMD7i3uepsklECs1PPYs36pk5K0hItAPPpHM3ijErWGw>
X-ME-Received: <xmr:Z9-aaoOHLD7eyKJw2ixd9YMRNdR1zMcShV3fawTndvQsJGLAklfYJZCpd5s>
X-ME-Proxy-Cause: dmFkZTFdOocfRN4jOpcQf0AqfSai/YCGo+xlO94MLvzn7lqitof50EENUNEgJzLPt2H+RQ
    DWgrwJL5dg2BaLkWQfjz0w8mX09EzID7A24sM1R0CcrzJ0aCsxP+pgO1accdG5RnvXKoNP
    Qi2+ranCgsFBQlrx3RUM64Xgm9l9zr2TPWbzFNtan3mUwkVlJ/gBEGXolzLuuMZ3CJ6e8L
    gmzum6oDDF3av5ecJE/wINba64+XlYa/U9oL8c0Dkr16eu3wp8w8wOsHTRTsCgO4oV0meO
    0fb7rtZliPO8XPlA3k/rGcTv+01JWMnSe6fG3OACTE4UctUjoP9cM2YnBbUckeF0hhckij
    NOPFSUiZtbWGWwIaoa72i4eX2MNwTMmQMx1JJKB0oGx212Jn/3PmqqYSFnTW53IcV3p0vH
    NELpSMfP2Z6zjqkZ/tEiPBrUvz4BT4nMxYpIRTGKvlH2jencFZjJb++8kiwDeJqEUfh9Yl
    EQE2A7nt8xhteP9AZZOdyf4kp9m6aRLFjbBdIdcb2ZBxL7yuIn2fG7q6mssAIMYyV5HiSJ
    k/3VzUcClTcA/1nmaBr2Uwzq82jgLagZaIDFssmgoDl8IGnQ+pwmdJPCLoCpoUmy9OBDpM
    8u0pkgSoDulr8fg8y6EFVhqgeMChQB4PJLZO2pmG8gfRsiQnGFn/nhHensIg
X-ME-Proxy: <xmx:Z9-aapo9HyRIt7fN9Sr0pbcL2znDgHp3vdnrXCnWXrwUImMo7z8AHA>
    <xmx:Z9-aal5JXdVMugAItbVcciHAZ_DFz_DQP7ritmiLwFKeXQYFDL_3aw>
    <xmx:Z9-aarpMc2x07vzSoHlA6uKFMJ2tGL1yiBiyTLAEmjRPt1tFF0zQdw>
    <xmx:Z9-aarLmHRYc1BXMcBYAV2chcrIn_xeOo4pYHoYiXl-q7S9zrGPdXQ>
    <xmx:aN-aatm7hVSX3M86MfEmnHisHdkZ5Dnfg-ou2_e389edxB0UNEvrefU7>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:31 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 01/12] mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
Date: Fri,  4 Sep 2026 16:10:15 +0100
Message-ID: <1ff754df1d57154e01356f35d72b1cb06c0f8664.1788533997.git.kas@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788533997.git.kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

madvise_collapse() holds an mmgrab() reference across its work. It is
redundant. Every caller already holds mm_users:

 - madvise(2) works on current->mm, which lives as long as the task is in
   the syscall;
 - process_madvise(2) reaches a remote mm through mm_access(), which takes
   an mm_users reference and holds it until the syscall returns;
 - io_uring passes current->mm;
 - DAMON takes one with get_task_mm() and drops it after the call.

Drop the mmgrab()/mmdrop() pair.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f49a6710933b..f1f8d4375e96 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3236,7 +3236,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	cc->is_khugepaged = false;
 	cc->progress = 0;
 
-	mmgrab(mm);
 	lru_add_drain_all();
 
 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
@@ -3292,7 +3291,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	}
 out_nolock:
 	mmap_assert_locked(mm);
-	mmdrop(mm);
 	kfree(cc);
 
 	return thps == ((hend - hstart) >> HPAGE_PMD_SHIFT) ? 0
-- 
2.54.0

