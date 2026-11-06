Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976211;
	b=P9348o/Ha3GtrcMkaZEnceUVKGidMDfe5bB/6mSm81/wTpLa88aJEShzkUdr/62HmFQF
	 cxRDg33M5AS9DoIjrQcIpeLcm3afcYGqOQaH3m4prP4s1TT2wp4NKnntV3iEuBbMRwxPf
	 Am/emZmWPf53EtJRkWXUOfToH4HWubii/+B/d3SnL7c0ubdsViAD28dXjgoN3EaRxf4Dr
	 10eoAWfSLNNqUgtW4W6a1ndFcm4zPP/7hZs2e8ty3SfuryAjP7p6g3vuwVZGW7BV9lDUE
	 kHh4fH6pPPzJSV9UgkGEOhMyi8nbkVwocE8bcBlPLMrcF1BUnHZd98h5snB5Nc+Lisw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976211;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4JlsES4uLUIYYaP/yiOT2rHyGIzTwamik4bNttM7hYs=;
	b=4dow5wZZeSLZ6wSCgm83KPb+gvBpsp5iJFTXq7JM2lQRxPMNsVaA3wLqSZJRsDBVWnSf
	 Qaf1KgzKRW6TWkD2EeR+TgRZ7z5S/DxDgqTqmESqrkVAjVcQua/2999nq0kyG5KM1hLyS
	 WqSKeMGay7WOlxM6bz5FhFmFKaK0iyaA0iM+iPUwrilVfK9ucKY836t063FHlx8kQLCPH
	 yw1cXhONIThzpRzDoIFTsuFQDQmi+dVylZ5YKovNO7dIR28n7ENdI6JKR+WKbw68sI3L3
	 IaIDjVwhpadU2vnyUOJbAu1hNjl64NqOXfG2CMXAyCN69qCntBD0wC0aftGCfh4IY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=U1cM4ow4;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yflA69rW;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCD3606EE88
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCD3606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=U1cM4ow4;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yflA69rW
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 0B628EC01D2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:43:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 06 Nov 2026 09:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1793976208; x=1794062608; bh=4JlsES4uLU
	IYYaP/yiOT2rHyGIzTwamik4bNttM7hYs=; b=U1cM4ow4O99BMT/eebmQYjkJXf
	rhloLJOiicazLExlaBKmr9yIpUt1f9P7fbJCD+uieTEvtdxjnLcGrM6EAXcz8mEU
	OVtZgS46JzxKoSX45oFIaMFbMpgEspcYJzwz7cHzob9X2YgJMorIHGmdRkbvLRAS
	Lcyf4A27WfYmzmwB0eF1eMtVJxNy9AeA0ll5A1KGSieFZ26Hb6KR+kA7ErWy+biK
	CNGbOeKYZXILLSzdIXTIokIBI9bMYlVS7GBZ/Dt1AwMqG/i+pAOXoUgZqQLXFaYa
	c4mXFi4Al0vUjyhTTvMiCHaKLN1Pqr+qODC3z2OnLLiSaDtLInibi1k3MwCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793976208; x=1794062608; bh=4JlsES4uLUIYYaP/yiOT2rHyGIzTwamik4b
	NttM7hYs=; b=yflA69rWK8GuffmyMc8r1ksMTIyLbmLQGCCGCrF+p8NoEdQcHuU
	uPY1pDlXoEQ1JCuvBjcyPSUt/ytfHhmpR4PjuhuFKRQF1W3BxnajNSCibOdLG4Ww
	IGo3BFEtzzwSDyB26M25me9XFEEK1yLe6oJ+tOXYETpWwdUWrZPBhaqL7Ka4ujwN
	XP2azL9qaLI8+qFl27xOcNRafnlFLct/Ops5ovUB8nBS9vYrn7QP8xQZbTajp/zW
	HZzntYNFdASRKEfEGCf5xAHJQR9lPGOiaB/h9eC/X9gZhkFQdPjG+tftGFhI8Rfu
	237vSZXjfKayxE+0R7k4SMTWcL3mnI7lHBA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793976208; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:PPtsvNGdNW2owf4VbSqtdW3Z6lR15sfD9ApoHnp/DByMY9N
	3pnaINH7z4myrhqrurye3ascmN0oUfLfwGoxrPaw4qAhKXlk/S3TyUd8ANPBrFK/
	261DobXKTcRMy1xIvf9mXGZ6EklbOkzCWsvIhSJt8uWy/OVLqmcfEvo4m2TL82OW
	1bgHfaRVYi3OE+LC9mqEzbqYKxXtyB82tuTsQ78ESdwuIkYa55i+mAi3z+c+7E7l
	TwPmlWtczLDgpHW7M9ymyzzHDG+uw/VDzvbbvGbMQ37MCsKU43p7GTVH/Rl9kQBK
	nlfa7CgFrOHE2h1z9MxAubiJ4886YuXwHF9/igA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:mAhdeZutzgxel4LfCIR4P0qGCtKeD7cSodqPFkRXA1A=:gcQGkw5DvWGcUvkEFyLdo943AU6EZF7qgzUb0avWdSM=;
X-ME-Sender: <xms:kOftamgWQduRzFONPFTcWIos3i3HPa-lIEPFUG1wg93apomkVlxuGQ>
    <xme:kOftandtYuCNjAq_gmRq6H-ZQhxzTOQt4QKT_UUlyW79K_88VpOEpiFNBSoFohIEj
    hZb5xEH8GaO4tYwBCJ-m9026RFYE8nplPWnFql4-u_ymcJmHn5iAOER>
X-ME-Received: <xmr:kOftat312HR9KcYnj1ohQT3PifXe-3GPCgaYzqbmPh_L5AyFWl18ledqD4Q>
X-ME-Proxy-Cause: dmFkZTEVyi++14NxNXhrhQvWfvjlAPlwXEA1wBKBvLE0AxcstoZuNgjT8CEJY3+Dpk8v4o
    3zadRI7ItJ0yvlmlUXvyighpPOjkwnnJ1aCWXF9uPXp3YsZjLZ7JHNPRPt7LBo3ZqxDQhu
    RYF61EmzuRQ5IiIBv/fonHwsAvacjt08M10KWOmuhlizcdpqtxR1hAJbku1N9QaybuWg70
    y3X4jHPSfETDmAdoEKlnQtvk8LsNFq2v+rmWQa8HQfi/z0u0UyT3A0VhsmGKVoTnMlII7u
    0HpGg4SiOpQa5vo24Ox6FgZcOb1jj0DOSDQO8pT9sMRmU4n72a+nYSLdaMGbgB7YtD3ER/
    c89GwVaOUugTIbweoqtmNrbobf7u8j0HKUO93+OtuRmfYjhmct+E5vPwVY8lUqSWY633lm
    u4APdjacP8VDb6UP9h1bH1wzNv0in2FYQLoXnNQE1GG6Mk2NURyIE8FqjrVrmYUD3wJBJs
    BsqpApVEBWHY9hKJ3xYZEdmKyBvYbdpI3XQW6IfWpixnZQIu4UbuiCavvDaHVTafeCrTRT
    nNjJWoO5ZfYk6fb7cwWPB0vKUd3icxxSwASEqLZkt33FwpSu0QtDccIXvDnYg4emEf/4XG
    60FDjuYkMhtpM1UcbbAZbqDqgrzkFvRSmz5pPylqNm1LlhkIXhthSx6aclwQ
X-ME-Proxy: <xmx:kOftaroMk1EM42H6nDaEHzD_VIFPD6wf2TkTgBC7T1hE4XktrcusYQ>
    <xmx:kOftatiRLvs1M1abJ36jKUx1x2GnhEHQpT-t_QAeqUTrl_0Xc2KBEQ>
    <xmx:kOftanmIr0Bl6pcDvQommBy8iSjyEajTFxDrLzG-xIkAjpDsNcfMXw>
    <xmx:kOftampZNxFKMugkdOp9rs0pgOWWrZj_KmNHQ4SaBeRCJeAFR96ZVg>
    <xmx:kOftar0XkI40B59ajnM3xulM6jTa4rcK44UiXxyToiYwqMGS8YtGNLL->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 09:43:28 -0500 (EST)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Mason <mason@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] mm/memory: refuse to map page cache folios that are not uptodate
Date: Fri,  6 Nov 2026 14:43:21 +0000
Message-ID: <20261106144323.3634477-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.56.0
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

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

A page cache folio that is not uptodate holds data that was never read
in or cleared. shmem fallocate(2), for one, adds such folios and clears
them only on first use. Mapping one hands userspace whatever the memory
held before.

Each path that maps page cache checks for this itself: fault-around in
next_uptodate_folio(), a fault in filemap_fault() or shmem_get_folio().
Nothing in the mapping code does, so a caller that misses the check
leaks stale memory silently. MADV_COLLAPSE did exactly that with
fallocated shmem THPs until recently.

Warn and refuse the mapping in finish_fault() and do_set_pmd().
finish_fault() checks the folio ->fault() returned rather than the one
it maps: for CoW, do_cow_fault() copies the page cache folio and maps
the copy. do_set_pmd() covers MADV_COLLAPSE, which maps without a
fault.

The fault gets SIGBUS, as for a folio that fails to read in.
MADV_COLLAPSE fails and leaves the range to be faulted in.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/memory.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 6fe0b7dab927..ff2f2deff761 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5674,6 +5674,22 @@ static vm_fault_t __do_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+/*
+ * A page cache folio that is not uptodate holds data that was never read in
+ * or cleared, and mapping it leaks stale memory to userspace. The callers are
+ * expected to check, so treat a hit as a kernel bug and refuse the mapping.
+ */
+static bool file_folio_not_uptodate(struct folio *folio)
+{
+	if (likely(folio_test_uptodate(folio)))
+		return false;
+	/* Driver pages from ->fault() never get PG_uptodate */
+	if (folio_test_anon(folio) || !folio->mapping)
+		return false;
+	WARN_ONCE(1, "refusing to map a page cache folio that is not uptodate\n");
+	return true;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void deposit_prealloc_pte(struct vm_fault *vmf)
 {
@@ -5714,6 +5730,9 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *pa
 		return ret;
 	page = &folio->page;
 
+	if (file_folio_not_uptodate(folio))
+		return VM_FAULT_SIGBUS;
+
 	/*
 	 * Just backoff if any subpage of a THP is corrupted otherwise
 	 * the corrupted page may mapped by PMD silently to escape the
@@ -5849,6 +5868,16 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 	unsigned long addr;
 	bool needs_fallback = false;
 
+	/*
+	 * Check the folio ->fault() returned. For CoW that is the source of the
+	 * copy; DAX CoW has none.
+	 */
+	if (vmf->page) {
+		folio = page_folio(vmf->page);
+		if (file_folio_not_uptodate(folio))
+			return VM_FAULT_SIGBUS;
+	}
+
 fallback:
 	addr = vmf->address;
 

base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263
-- 
2.54.0

