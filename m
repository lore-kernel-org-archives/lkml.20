Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630412;
	b=hM2nrYq+3rJoIFZforuHtJpMLSryFlpkHIrvw6aHwGFp9fKt+mefonRhaTP22fPkCZU8
	 /xbnRz9KtAqljF4FbBkOp8qQ35RvamSbgDF7D0FBCN/hPgNTGEBuqNNYBB+EBCC3WnyQR
	 tuQPpwPaHhGq1kInb/wR8d4exHtgCM35vV5PaJkZz0Pi8O2hS9fz9Z3ThbylN1248ThBE
	 rLEHVwDSQYNiWUdLsmRMQ2NkuzKZHPy5eTAEC1kyoVQWWTY2EOGQJNSxwgwE4fJqBlhuF
	 K9eeHBfdLpOFkNJVY0RX5nDGujVg5GXbT+2W7brruhU5OVbSMmSFlq0kQUv2HKgT4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630412;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7uBd/GYdLFQ0CEP19uKqZRzW2Hvnv/oll3HrweZMRic=;
	b=pdVj9NPF4FKLBlx1kF6KiY/FnPGjeFI+B8+VtzP2LYq0DosMOT8yIjXbIXkFWupEJeTb
	 fp4flj55UEmSxIqTMfe0ICuddXNythRK97VBRI7hqGmEtp0BnaKfN2q7Foe/qWXMqcxDm
	 E/+/d+tsNkuU2g+6peuXurSM0fDaO0XvuKbshfStVR1d6NE0zTDVinKZSwsXvsPg+KzUN
	 dTCSVasX68/KYNMK4gLBxsANRXXBMKaqcTzpBg9ZweBSTnmzPvfopUr4JhyIVYx26U4T1
	 Nxhr7l4+Tg9CWv+eUAFIGkvZGPG7PZkpyGeDA3BzJe4g1I/G23LlOoP8yS8SRw2YXDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kFwramWH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3494606A5B7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kFwramWH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE481F00A18;
	Mon,  2 Nov 2026 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630411;
	bh=7uBd/GYdLFQ0CEP19uKqZRzW2Hvnv/oll3HrweZMRic=;
	h=From:To:Cc:Subject:Date;
	b=kFwramWH3q4LZc+EHXFHRLFBAhkDXk0ds79o9DIP5wQN4NwSbgtXXToP+FRQduDsl
	 NZPIFyYENNvV3IPRbBjyXVBbqQtS2PX9SuUNS4KlYAa5SfRQoE/bRjltg/VInj4gvS
	 OS+wnlLaGS5dtengjzg8olxodvsZmViJyByxE+wQwpAzzX/FaoymsmhFUYID1J3nb/
	 3E1OXtVzFaPy2HPAZ4BJIyfdFd48VEUWAY8vnb7gMOrdd2UfCDEvlp7Uf9IIJFHKey
	 +le8m4qjGlvGlDUXa+mN26n9AEmlwK71vosxZAPFbg151Gknea+Ko7uY2JwljZ9bfd
	 sgyRdCWIfERig==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0131C198003A;
	Mon,  2 Nov 2026 09:40:05 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 02 Nov 2026 09:40:07 -0500
X-ME-Sender: <xms:xaDoauklxqV1yISoZqqEQU_O12C2OvXDrHdnAKnCXr4dmAtjl82_kQ>
    <xme:xaDoaqttip7xUEQsOQUwEuaSyDpuGxcNAhaugKpLieqWMdWw9fzTKZAOoWokQ5mhE
    aymJJGAAXf4ajDSxzuQws668XviMG9XAqV_IS-kNDJccmicTrMvt6A>
X-ME-Received: <xmr:xaDoaqNkSJsJX4r5BiqWIK0-Vf8AKYffKcIfsh5tpXSuXGpO2OyQLLy4GNc>
X-ME-Proxy-Cause: dmFkZTFdGgpaIcHDSt9rb+8IuNb3XchGCgRezkU06/yEz0iVsG1TMMSUAk/+GfmBxks4K8
    jFRMZmXeelIVSiBTsFCeiZJVt0z0zLHpGDb4C0V2NnoSkOxMFGfNVqerfEkjUkJKd1VV2h
    kO7NVTN/EhLXLaf/EY00K5nGNiZaNIwXPGwaYET1jLLMtNBqhaTSxTfItiHiSJ+/mOpD4+
    xaQttZpmC9nTB4Yi9Wmc7Oc8KjmmOfoNyMP13iL1JRLlHC+y39ThwVZ6e0+IEwJW1t5SMD
    q0m388e4DIvw45gQq6g+YY3MpabW2e7aMawsd0p0suzj7F3qXeAft9JyuT+CKFMqK6MlnK
    AYxx1EJZoIiEHZ3XzTTjysAzKIOfs0cQMved6hhrqYDxFMatKj1rwF28cn8FPY9wcYzyOs
    lqudGPuOcTr3yVQJKb35jwTQV781eN9//bRIfMtnFSlVxwdknqoLeVkLdHLcY0fVhl2owN
    M4/c+RtL5maQC6piHNk7lUhH4tgIakeeZhjp6EDRFmT8PB/JxeKp6FXKGiTBVuDiLnnjv1
    x+nVI61iNL+KK8XUkYDy/UD606in8J28r2juARf1BQ4v4LK+NqEMzjWfwBpq4NaeqTkoRJ
    rjFyt67k7QMwyzSpYHQwz+/Q2eUZKNgGQEa4K/S9dlXvqUakrhq/HFXYwy7A
X-ME-Proxy: <xmx:xaDoakobJFUxokww3o_y1DgKovXny917N_V76sNsxVAvoOIMs5q-rQ>
    <xmx:xaDoar9zZKG7W_jDwYReXFL9raCAUIXZjqFNVkScluqwhZFrAs2ZUw>
    <xmx:xaDoaropARx5eyQQiVnl3gIv_ZkqXdpdHuTWV2XkdYmfDjf5sGcicQ>
    <xmx:xaDoahggMQRTyuay3-E-7b-jut25ytordexdkN17zGvppmRMbAOF3A>
    <xmx:xaDoahBLvMMtOFS1KIWLK3RRg3PVxs2rlfM5FQTKS3ef_eYOk1NNwmva>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 09:40:04 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Xu <peterx@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>,
	Rohan McLure <rmclure@linux.ibm.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] x86/mm: Define the zapped-entry checks only with CONFIG_DEBUG_VM
Date: Mon,  2 Nov 2026 14:39:59 +0000
Message-ID: <20261102144001.342837-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
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

Zapping a range calls arch_check_zapped_pte() for every batch of PTEs,
which is every page for small folios, and arch_check_zapped_pmd() or
arch_check_zapped_pud() for every huge leaf. On x86 these are out-of-line
functions whose only content is a VM_WARN_ON_ONCE(), so without
CONFIG_DEBUG_VM they are empty, but the call remains. With the SRSO "Safe
RET" mitigation the return of every such call mispredicts.

Declare and define the checks only with CONFIG_DEBUG_VM. Otherwise the
empty inlines from <linux/pgtable.h> apply, as on every other
architecture. They cannot be inlines in <asm/pgtable.h>: VM_SHADOW_STACK
is defined in <linux/mm.h> after it includes <linux/pgtable.h>.

In a KVM guest on Zen 4 with Safe RET, zapping 4K pages takes one branch
miss per page fewer. MADV_DONTNEED of 1 GiB gets 6% faster on anonymous
memory and 8% on shmem, munmap() 5%. THP is unchanged.

Fixes: e5136e876581 ("mm: Warn on shadow stack memory in wrong vma")
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 arch/x86/include/asm/pgtable.h | 2 ++
 arch/x86/mm/pgtable.c          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 000fc6c1ca37..9b03a316fb75 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1666,6 +1666,7 @@ static inline bool arch_has_pfn_modify_check(void)
 	return boot_cpu_has_bug(X86_BUG_L1TF);
 }
 
+#ifdef CONFIG_DEBUG_VM
 #define arch_check_zapped_pte arch_check_zapped_pte
 void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte);
 
@@ -1674,6 +1675,7 @@ void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd);
 
 #define arch_check_zapped_pud arch_check_zapped_pud
 void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud);
+#endif
 
 #ifdef CONFIG_XEN_PV
 #define arch_has_hw_nonleaf_pmd_young arch_has_hw_nonleaf_pmd_young
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 4a105f283cfb..3352bc6904f3 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -798,6 +798,7 @@ pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
 	return pmd_clear_saveddirty(pmd);
 }
 
+#ifdef CONFIG_DEBUG_VM
 void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte)
 {
 	/*
@@ -823,3 +824,4 @@ void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
 	/* See note in arch_check_zapped_pte() */
 	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) && pud_shstk(pud));
 }
+#endif
-- 
2.54.0

