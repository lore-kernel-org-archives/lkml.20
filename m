Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419768;
	b=1lT9rS7i1hYSt9903Gs/b/ApO8kq3M/VN7FnJi3yUint4BkhQP4tb9Gd0VJ5Wzkcvzp3
	 DKc/9p0S7cBMPfeJTVG+HK6XZ09sgyDmpLC12vUfnJgipLLD2nBkK1uQoCECm0SnLcp+B
	 RO/aCcOjpSwMvcMHVmhT1bzX3FH5fkdC4uK4Esce0PsW/qvgS6YAXy/2jvQdlVaquK1pM
	 CGXRDv8Bhy2LIBrJZ18bDmTsq0ifxZHD8GGGNstDSDTg0nlufE86beLZuIBUXCRAzMAyq
	 cNHOtZgZuXBes6kwh1E52vF4dfcwTra3mQa1fMinuoK0vSsheBr9DJtlEW380RbMNng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xK1JRZtgXWaa2FgKeCEv1Nghpv+3jJNSaRA4T6QK0EE=;
	b=nQYx5r9/QMgAC59yPLrcRS3ATv7pNwJUcRjfQhjzk2WojePXZkFcWf+l868n7txVF5eK
	 0YbKNz+CrYND2Yetxp1VtOSMjInUnAKSwpumkuCeEIjEqVXIVK6YB5xblJ8hv4zcIyxwa
	 Fcfsw6plNP6FK00RC4PRMrb48RDAhmy/v5+PX86yLpfRJehy+dMpmZ6llQBAtM4A4+b79
	 Wn0ogmpnCGUQTSdYyOzsJ9Ap7vqJ+fOdtMFopvIURFKoUIHYZKGmE0vvO0u2JjLUQ0PIS
	 jILJnrt+xXaY9zNFxYGOZUv1yC5LPj94i8vo7dfB7iASXX/YbFOpMEkWFx0gKOE5hCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=EYfIkMhO;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="lgV/1Zzw";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806AE60A3832
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806AE60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=EYfIkMhO;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=lgV/1Zzw
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYBw41913791
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=xK1J
	RZtgXWaa2FgKeCEv1Nghpv+3jJNSaRA4T6QK0EE=; b=EYfIkMhOUzHR3RlVdqR+
	LK7AY/CQQNrJGT7M9ircFaSma9tEBP9VUpryAtXfZfhY6Sfp0zTN+4gcb7BUlgmJ
	rrsUnABiz9jHvVVnUCYGup1lWI7DO7bnTaaeniHsgr9F5CxMJwZVYCd7icZ8UF1M
	nZVtlanzV4QM0ZheH1jJIqbxZOkncduo5Kd98R+L/JiivbLec8wN4+brsNGH9lDt
	mGYyJdAeCLG6xd9v6cmtPuBdBjK3n5AKPFuJ0nhe2daxt0EbYqgDQaanAVppQmD4
	mvOOqtEjcrkXHlhxsvZztl0YF+1QgnD/mHq9L0aSbyYMtMlKmR1JrAxfZ6FAth47
	ew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvvaqghb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:06 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338c215ed2so51065021cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419765; x=1795024565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xK1JRZtgXWaa2FgKeCEv1Nghpv+3jJNSaRA4T6QK0EE=;
        b=lgV/1ZzwKpHz7pOMrm1ZdB65Z7y0M22L/tqvxYpPJvFI9j3aRa+cgJKaTjoirc9e2T
         EP1qC8A+Kz1DNtDSQX3pWGhYR+vHJd/1aQYDD5sMIoZPETpEJNppPl7qeNBlKlr0l7X6
         KPw3kcjFaqwBjkA5JEWLAg2L9mMImULcr4K6rPT7GmpT9y/X2kVHfdqxIGfUpmfBTxR3
         UjnaC8HRhhF2FutK2r1Pxl407IPah1z3p2AGI+HKC2gVBpRxF7TdjXsNu+9XFiES1IRG
         wUY0v4ta17mPUp4+fzksbg04wTwKjHWci2ONvyUG+t/0WBs9oinjppmeEEvJ4Mif/fnP
         f18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419765; x=1795024565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xK1JRZtgXWaa2FgKeCEv1Nghpv+3jJNSaRA4T6QK0EE=;
        b=0XsO5pemVOpT8KHqEDBp9HIg2uadeaGGYFESKsce5tfheqPKb6DIM3Sgujn6lZrzwF
         /+AugICSx27iy+qfIlrHFe1ikV/kA4Hk1V2CABf1dnfJy7qci4IUbbAkj/PH4W/hGY0y
         PZvHNTBGVqMLMpd6acmff6qOUNjcfiNfNeM07KQXI/bcAlAKnNjsSi9ciDlaKd1gDEK1
         vw5oXvfe28zB7Zv+ZIP3yX9CI2RuJoUzIV7PSu2mFaSxzYZp3Q8KMthfp0oJ1IfhI4i8
         re/xYHnLwiL0XWroieshGEtEuWLkw9wxmbQw6NGWHBstU77qS3P/wzQPMzkRjpvqQ6y6
         lSfQ==
X-Forwarded-Encrypted: i=1; AL+hErE7dVorFUiRJltN2o/zrphqW9xX0IQ5iox5FZTnQ4ueUpLZVCyWmvIpA4Xawz7sGLH+zW/zg+EuPoq2BgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yCu9/aJe6k0O6q6zz0x87uAVO0Ql1T42TpGB79T9m7SbavfjC
	K+m2OE4i6znJm79B97RMkUBc7O1TzTiLOEWLPj54ecJaBHUvT7bvhLYHAFTgHQAomoR36nk/sT7
	tupKBQadn53Oxx9XHSfJR1KBQ4YwW+Los77Tmp2cuzGKDM1/XB8TKctH1o9sxQg==
X-Gm-Gg: AYBFou2n5ITC/4Fb/V/GHDrPhBUO3a9ojOdKCFhNfh9ha5034iCm4ZF1tXu2+OJsmMp
	7sECZuPcj73Ll1ALXuf84RV7GCKpGJE1/LnWPHEn6E39jGaQ1mXuPHglWHcdZTKOdSaW1vMoPYj
	nJFjdV5PY43CeJfYCS7MaluOQer56AzR9JGShZN31cOOFL1Dii+X5D3mCk7pPIBBgpeyDirEipz
	nV9Mjr5rO4zIl7q7SJLNQ14E0+TmJgGAuiDFht8Qoo49McTtvinHqNVTLJRo5gLcpCN9WVP+SU5
	HbFZusMXjWwBxLQwbaan41ew2iSqgvENiW5HTJrlyU9+ZFW5yrX9gjTUUkFwoAjyCBYC2W3wcrD
	XPuQ8gQ/ETqzjJ9xAfnSZ6v8byiYUIlFqDIf5BMKAFxfhRN2jjbxDHaVUtNHxajiBkIOpjpszfd
	9JBtrzkfQbnkXzRj+8uQ==
X-Received: by 2002:a05:622a:e2c7:10b0:533:7a4c:d8ec with SMTP id d75a77b69052e-5574febf6damr27451141cf.43.1794419765303;
        Wed, 11 Nov 2026 09:56:05 -0800 (PST)
X-Received: by 2002:a05:622a:e2c7:10b0:533:7a4c:d8ec with SMTP id d75a77b69052e-5574febf6damr27450671cf.43.1794419764443;
        Wed, 11 Nov 2026 09:56:04 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:56:03 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 11 Nov 2026 12:55:16 -0500
Subject: [PATCH 08/12] mm/migrate_device: do not migrate a uffd-protected
 zero page
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
Message-Id: <20261111-uffd-state-fixes-v1-8-00713d368976@columbia.edu>
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
In-Reply-To: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Chris Down <chris@chrisdown.name>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
        Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=3818;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QD3fhak7hRiHJFtRv0X1hOI2rf0YRP0tq/Cu+tCY/Qg=;
 b=5bcXHOtBf5tgUNJ6jIVkTFe8b9rYlsTbht1Oh4swvTCyob8c77wH08VFBs9uslgFSrvMdWn1h
 Dr5xMwTt8FhDT8OTtNB6bxF5dW5590n2RAkVoPQg1c4mOnOYnzjpyXq
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=FraQbGrq c=1 sm=1 tr=0 ts=6af4ac36 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=vkV22ByPkaTMGWZSKNYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX1qO1+pbJTXz/
 Ims4tO3K6jO2v6PvnOwfm2IE07H1ADNziK7+PaIu8KKzb6AlNYMI/zkwKStiE0meq/LcDJWXur2
 L6sxfZobqTEnfNCArn3m1MuqAwCHtqlTLJ176RMODIU2kQtjj6WvQNsZh90Y6p4vus1xngJFt5J
 sBOyX8GISqCAWEYy/ljkmWlP0zXpGTL0t/M9MtYPtJtcP4F4P7lHB+JZJdZ9gh2s4u+rE1WOvPs
 zaB2iGJUS3FxgtZHhOsvXaIMP24z2mbVYVlFjp9MhI7weqLaQeS4XVU5azTpZbJzxGBT8yGos+0
 SuZQsRl2PwOkRivGz5PA+pKG2aZSrllKF1yA/v/9AlzjwWXC9RsXiFsHWq9slbhO+GzWQbL60YB
 KgJybDtDXpAtN9QsIzOJkOJqvQw2K2WxDLyK5i/f4TTha6YTMAuzGJD3EIpWEx05BoEbl0OcqM2
 fbx7sA6q85P7fqgPVXg==
X-Proofpoint-ORIG-GUID: 43WrXy8oo0M8YFO3er9ePfi6WurS-Pas
X-Proofpoint-GUID: 43WrXy8oo0M8YFO3er9ePfi6WurS-Pas
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX1Y2oap194jIv
 FBVBtgQSFJUOAFl5f8SLMgCz/nUgWKTq54tDfWnGo2L/g0lNYYdnSeg4zuxqenPHG2KDw8ZDPmw
 v+chtqryMEX+dlH+5Z07XuYjxobQmclIskZw/es+9fp9+WmqAJdv
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10
 clxscore=1015 priorityscore=1501 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110071

migrate_vma_setup() installs a migration entry for each page it
collects, which carries the uffd bit over to the new PTE. However, a PTE
that maps the zero page is left in place without a migration entry.
migrate_vma_insert_page() later overwrites it with a new PTE that is
built only from the VMA flags, so the uffd-wp bit or the RWP PAGE_NONE
protection of the old PTE is lost. The same applies to the huge zero
PMD.

Once a driver has migrated such a zero page, writes and accesses to it
no longer fault into userfaultfd, so the manager misses them. With async
tracking, PAGEMAP_SCAN unconditionally reports the page as written or
accessed.

This requires a driver that migrates memory to a device.

To fix it, do not mark a zero page for migration if its entry has the
uffd bit set in a VMA registered for WP or RWP. The driver sees an
address that was not migrated, which drivers already have to deal with.

The uffd bit can also be set after the zero page was collected, as
write-protecting only takes the mmap lock for read. So check again under
the page table lock in migrate_vma_insert_page() and
migrate_vma_insert_huge_pmd_page().

The alternative would be to carry the uffd state over in
migrate_vma_insert_page() and migrate_vma_insert_huge_pmd_page(). Not
migrating the zero page is simpler, and a zero page that is protected by
userfaultfd in a range that a driver migrates should be rare.

Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/migrate_device.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 7919e04abc1c..ace216ea834c 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -159,7 +159,16 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
+			/*
+			 * Nothing carries the uffd state of the zero page
+			 * over, so skip it if its uffd bit is set.
+			 */
+			bool protected = userfaultfd_protected(walk->vma) &&
+					 pmd_uffd(*pmdp);
+
 			spin_unlock(ptl);
+			if (protected)
+				return migrate_vma_collect_skip(start, end, walk);
 			return migrate_vma_collect_hole(start, end, -1, walk);
 		}
 		if (pmd_write(*pmdp))
@@ -337,6 +346,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn) &&
 			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
+				/* See migrate_vma_collect_huge_pmd(). */
+				if (userfaultfd_protected(vma) && pte_uffd(pte))
+					goto next;
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 				goto next;
@@ -878,10 +890,14 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 	if (userfaultfd_missing(vma))
 		goto unlock_abort;
 
-	if (is_huge_zero_pmd(*pmdp))
+	if (is_huge_zero_pmd(*pmdp)) {
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_protected(vma) && pmd_uffd(*pmdp))
+			goto unlock_abort;
 		flush = true;
-	else if (!pmd_none(*pmdp))
+	} else if (!pmd_none(*pmdp)) {
 		goto unlock_abort;
+	}
 
 	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
@@ -1081,6 +1097,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 		if (!is_zero_pfn(pfn))
 			goto unlock_abort;
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_protected(vma) && pte_uffd(orig_pte))
+			goto unlock_abort;
 		flush = true;
 	} else if (!pte_none(orig_pte))
 		goto unlock_abort;

-- 
2.39.5

