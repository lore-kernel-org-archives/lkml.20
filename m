Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859478;
	b=i0gJ4PiQbhqx7+FZ4Gu7Q6I9+S6uUEw08anYp0BtSMAjeus0y1svK8Pt93fgwvLoRf0Q
	 4pZVuIOcdKB97xcrV64wb2dM8RCASntUj7O8nKOGMm1gZPmxLVsEWjKdYVrElVR6rP36a
	 LUas2OWKVrOvzOzieqV9wJ2hi7/C8f4yWeGdvh2S7NltVJgHFonkriR99oFmEQQFZmE6m
	 uUzCeUyvhFIBIUeqrP7m8I6OEL5qmm9osPayXZWL5L0wKLn5xyWXuL0xc9NDWkOv5PTn/
	 DoFnQafgThuyVZ9FjldhYIBEnpmmd9ndEIseQ0QTwwnFFvmUFVVWEqteNFzRlwiCuOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T0fzsGxlT4q3HpaE4QZIOM3hFczkgekbU9Rdi2JFm50=;
	b=uuwI/tNTkEkim8Z5EJocPS2RMHGq4g2q8JydgNTMteT/MlPXI85Ui//MKTvMvFQCT7oE
	 Wgi4Y9u+Jp7PAO2Eeku83fniEiHUeDqIBzFCEoXi6Vum5YC+toQRuo/k2TfTtEaEeleU8
	 DHc8hJEzZyV6+SMobK7TKZmLdrQVlfnLHaoQ5LmCLB/EGkXhwX5RvNseWFKkbmDGVySxi
	 fFXcsa4dupd2iO+Ins7u+QfsvNty5jwfWVhsKbjEwTRvL5xMnBrzwl7bY3RIuE9CvedVn
	 fgbXEe6lzy8nmrmv/1bZjFuglImzrd5TgbInvJf1HwY18h9Of5++JI2hSconO3H8TyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="jhx/gmZZ";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=d12Wanmc;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0E606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A0E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jhx/gmZZ;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=d12Wanmc
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXJwN3638035
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=T0fz
	sGxlT4q3HpaE4QZIOM3hFczkgekbU9Rdi2JFm50=; b=jhx/gmZZMis2eLHme4pP
	oqNJ4vm94e7n5ru5EAk2U+UL8DsyQzJvWf+ChC8XN6mrCqqY67boqdXPXprBS7Qk
	trstAW/Z252gtEEvOL07aPupShrfGXAiOkseYxYbuuRsEcJV4NimkqrjEgjwGBAZ
	J5glBWtHlaCxVx0nUsxEpWExuqt1xX338Yhh1oydK7F0ujH2NprZdJd2Pr4Ouldp
	ZmYh8Z9jm+TsCrUVOMKcC87xdyCKAw22lwOdh036fxohi54CCT7j/HIxEBqPV1iY
	lQB8j+Le5P3ZyRX8+FaGDHPN9Xulwe2hJRa5sOEljXPywLzBOcwNfZ/Vkts5QESB
	4Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059cj32p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:36 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920f9885cb1so6143686d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859475; x=1795464275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0fzsGxlT4q3HpaE4QZIOM3hFczkgekbU9Rdi2JFm50=;
        b=d12WanmcgdP4vF3d52BoAX3S43rbVZJleJFw0ATv/PWNRO2IMG+lgZWDKoxXT3L1at
         2emW8H3z0wyrmGtn15hA7/+I4ZftCcLYDiSuz66ovIihVJBVoS/lG/M3M/VC4mE1js29
         gEh0CeysTuMi3vLaNwPjEY5oP5dyor3DkrjeydgXysOZwVxMQmykT8tX1L+Cmc8bn/Nb
         KEX2gJiqj4lt8wmssOSSR8q5vFD0Rl+qkJUE8myKBqCs+LZf2aPCmEuK6u630mX8lO9U
         /S1ZkDaT8btrKebztFFzRvBXh93UzJlKA0rTe4KT/u60ScHrmQefaWvM7u+Ark429T5W
         gC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859475; x=1795464275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0fzsGxlT4q3HpaE4QZIOM3hFczkgekbU9Rdi2JFm50=;
        b=XsaaRx0UWhTj8jFh1vvlCY93pXd03bpVixFRfzLRTc/pamXsHRv8EKfWtvTpREplmm
         y+V5Hm4lyujFY8LLpxyHbADcfL6D7vUkOWoNULmCWnZzas+N0cUlvgZKMGyZglNV6vxX
         0G4tahIaWuPQwPBLlefr0D6oDllKZiHl75ERQKfY0/vP9cFVkUiM1SF/v1p4WfvVcO8H
         TjcPXO1nMf/o99FPc0mVI5u6F6TuUaeHdD0mVGeKfRYCDCiL+QhEyY/11pt2CtAQi3WE
         s1/0HRTV/Fp3r7cr4IjfvFkVy7e5g43dhERCeDE0soEQpwBujIitAwFxfeyuiUmjEZUg
         +DBA==
X-Forwarded-Encrypted: i=1; AL+hErHKYQo/fdza91tzOmQsmQ2fQPR0bSJw8Z6pXO2O5NM3p1KvoU8jBC9XC4KvTNXsEt8CeRXzwc3IQ5uHx1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e6DEy8BXnhWdy3ht1E5wis+31bKvWXRu/4Zeo+Qs0i5pfJc05
	3t96tIV20rEGY8PM/SrIayHfR2Lm987FXWTKFyfJTaqjxMPagsuW1oWfWsvbZ/YeN542OCUGW/H
	f0y1JbnBR72kNIj1DUNo8Wwns09UDc3NO+DCsSQcV2RJG/ydWunvLqrSIM+CpZw==
X-Gm-Gg: AYBFou1Yer4LNtgCkCJtV0j94m0fZsdTebejnX0TvgvWiPCrcCTY7Uy1T1eeife0cqP
	YFKb9T/1CvX+FXfiGmT5GF3PakOzxSvk2hHwMpytvRad45y4k0bvFyEtuZa4PPakHo0s5emfuf7
	/biMoYjjiHerzsBXm+dbHDAh0oVjy0EJ9R620MBh5+Q64C2FTiSkZHCFj7c/VcEqOgk5JYXBmTK
	Dav2++yTC2JgrWmBvof24eF3Hv5cCUZBgLnsF2lQX6WO+zMcMSRwW/qdfZT+AYTPgyom7lrCV+q
	czOihXU+lMPDNR7kZ2esvJ9kP2/yTrfqh8Zs2yT/jDONDwJTy+2dVkmfmqpJQ7W+z2COsOsbBxu
	0g8tn18EALE4k0Z87sYWkaitM2OOnREvkjUNC6osavDd8EitQmJQu1VGMPCmIVVK6iQGOqPi1up
	eBErgy0TZ0qtlvYl2ZhHNa
X-Received: by 2002:a05:622a:4d46:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-55ac7266e55mr188486721cf.20.1794859474309;
        Mon, 16 Nov 2026 12:04:34 -0800 (PST)
X-Received: by 2002:a05:622a:4d46:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-55ac7266e55mr188485541cf.20.1794859473592;
        Mon, 16 Nov 2026 12:04:33 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:33 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:49 -0500
Subject: [PATCH v2 7/9] mm/mremap: resolve uffd state when the context is
 dropped, not during the move
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
Message-Id: <20261116-uffd-state-fixes-v2-7-4397a0196479@columbia.edu>
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
In-Reply-To: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=8555;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Pw3aT4XYGUKtZXK9Y9SabvgsNMzWI/bDdIAFeBvZ9bc=;
 b=1KBkbR/5ZTJejegNiXTYgbIoFhfrtUnq5/BvJ66hqlnGtUxOw+hPSr50QgyONd5bfxVibjP02
 IQTIOjB0hFpBb3AzSDPIl0aMcz/F/Drsn7kdqmyBGNB3Wn3ql25BuCM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX6+94W5lGx3eB
 WMYoDUxJaDISos1Gdmn2dJIcu7eTOcjQfZJC7sdS5MR4ZvedcDw+yoAKNcwiluFMJcJMvizGTV3
 JnBi8nppRo0lQFY6vsjZ6d3znatMKtnxeXCAKgZwGXQuKt3Op7Wm
X-Authority-Analysis: v=2.4 cv=MsPHeGae c=1 sm=1 tr=0 ts=6afb61d4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=VwQbUJbxAAAA:8 a=tHa68p0SAAAA:8 a=FFitksWucw0zMzmll4cA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-GUID: uqwsG6q12Uir3hN9s6ACKgATtMLm1u59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX0/4wHNMNOFmO
 G7iDolFLA6PQSI8AixMzCjRkxQM1gbaslyQdzgJF9Y+0yh9UVyiFSn1YwagwZMoFhgtEPhDLWLX
 DJg0PzOxCPqzARVHoIB3ZNBUd6+v41nYA++wsJVgPLlsxmQd2DsOewzwFx8e+hz3O4KpLN39xch
 REa2Q6gje0+jWMAWL8FpjB02PgvLBhU1f7hvgi1LhT6ihZoKgS0Zh/QG7Lr+Ohgbpiyl5ppjy65
 fLN2WfNnjKzzy+R8OVptKQIvtTXQZSkbGAWwJe1tT0p890lYheOrOY/IkMYV286GncA8Os3LjYF
 NlF1TdxzcRhy5Ee4RdB/c0iMhNQjP5wJNjFvV4EjI6V24LNEq4MvKCTbvkYWKgdq9lzFsAoDT81
 XaEhQOsac0lqpPrOHfZOcMSjWR4qPUa6Y2SEawPD0rRVdv0kZF9vkd06Vr1kZsjFKW8JfcPH//b
 eWAVOLQy16VJNHkx0jQ==
X-Proofpoint-ORIG-GUID: uqwsG6q12Uir3hN9s6ACKgATtMLm1u59
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=10 clxscore=1015 impostorscore=10
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160080

Without UFFD_FEATURE_EVENT_REMAP, the new VMA of an mremap() is not
registered with userfaultfd, so the uffd state of its entries is cleared
while they are moved. If the move fails halfway, the entries are moved
back into the old VMA, which is still registered, without their uffd
state. Writes and accesses to them are then no longer reported.

To fix it, leave the entries alone during the move and clear the uffd
state of the new VMA in mremap_userfaultfd_prep(), right before dropping
the context, like unregistering does. This walks the page tables of the
new VMA a second time.

This is done with userfaultfd_clear_ptes(), which also makes the PTEs
writable again where that is safe. That removes a spurious write fault
per protected page on private anonymous memory, but adds spurious write
faults on shmem and hugetlb, as change_protection() makes writable pages
that were never protected read-only. UFFDIO_UNREGISTER and
UFFDIO_WRITEPROTECT already behave this way. This will be fixed in
change_protection() separately.

The entries no longer need per-entry handling during the move, so drop
uffd_supports_page_table_move() and clear_uffd_wp_pmd(). Whole page
tables of these VMAs can be moved again.

Fixes: 0cef0bb836e3 ("mm: clear uffd-wp PTE/PMD state on mremap()")
Fixes: 763f43865fc4 ("mm: preserve RWP marker across PTE rewrites")
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 25 -------------------------
 mm/hugetlb.c     | 27 +--------------------------
 mm/mremap.c      | 46 +---------------------------------------------
 mm/userfaultfd.c |  1 +
 4 files changed, 3 insertions(+), 96 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a2b1ac11e7dd..e994ca58cc70 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2638,18 +2638,6 @@ static pmd_t move_soft_dirty_pmd(pmd_t pmd)
 	return pmd;
 }
 
-static pmd_t clear_uffd_wp_pmd(pmd_t pmd)
-{
-	if (pmd_none(pmd))
-		return pmd;
-	if (pmd_present(pmd))
-		pmd = pmd_clear_uffd(pmd);
-	else
-		pmd = pmd_swp_clear_uffd(pmd);
-
-	return pmd;
-}
-
 bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
 {
@@ -2685,19 +2673,6 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
 		}
 		pmd = move_soft_dirty_pmd(pmd);
-		if (vma_has_uffd_without_event_remap(vma)) {
-			/*
-			 * See __copy_present_ptes(): normalise the RWP marker
-			 * so the destination starts accessible instead of
-			 * taking a numa-hinting fault on first access. Only the
-			 * marker (protnone + uffd) needs it; leave other present
-			 * PMDs in the VMA untouched.
-			 */
-			if (pmd_present(pmd) && userfaultfd_rwp(vma) &&
-			    pmd_uffd(pmd))
-				pmd = pmd_modify(pmd, vma->vm_page_prot);
-			pmd = clear_uffd_wp_pmd(pmd);
-		}
 		set_pmd_at(mm, new_addr, new_pmd, pmd);
 		if (force_flush)
 			flush_pmd_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 88c9aa700533..b491742702f3 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5195,7 +5195,6 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 			  unsigned long new_addr, pte_t *src_pte, pte_t *dst_pte,
 			  unsigned long sz)
 {
-	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct hstate *h = hstate_vma(vma);
 	struct mm_struct *mm = vma->vm_mm;
 	spinlock_t *src_ptl, *dst_ptl;
@@ -5206,31 +5205,7 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 	double_pt_lock(dst_ptl, src_ptl);
 
 	pte = huge_ptep_get_and_clear(mm, old_addr, src_pte, sz);
-
-	if (need_clear_uffd_wp && pte_is_uffd_wp_marker(pte)) {
-		huge_pte_clear(mm, new_addr, dst_pte, sz);
-	} else {
-		if (need_clear_uffd_wp) {
-			if (pte_present(pte)) {
-				/*
-				 * See __copy_present_ptes(): normalise the RWP
-				 * marker so the destination starts accessible
-				 * instead of taking a numa-hinting fault on
-				 * first access. Only the marker (protnone + uffd)
-				 * needs it; leave other present PTEs untouched.
-				 */
-				if (userfaultfd_rwp(vma) && huge_pte_uffd(pte)) {
-					pte = huge_pte_modify(pte, vma->vm_page_prot);
-					pte = arch_make_huge_pte(pte, huge_page_shift(h),
-								 vma->vm_flags);
-				}
-				pte = huge_pte_clear_uffd(pte);
-			} else {
-				pte = pte_swp_clear_uffd(pte);
-			}
-		}
-		set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);
-	}
+	set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);
 
 	double_pt_unlock(dst_ptl, src_ptl);
 }
diff --git a/mm/mremap.c b/mm/mremap.c
index fff0465f5e06..4564416a6994 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -198,7 +198,6 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
 {
 	struct vm_area_struct *vma = pmc->old;
-	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t *old_ptep, *new_ptep;
 	pte_t old_pte, pte;
@@ -290,27 +289,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		pte = get_and_clear_ptes(mm, old_addr, old_ptep, nr_ptes);
 		pte = move_pte(pte, old_addr, new_addr);
 		pte = move_soft_dirty_pte(pte);
-
-		if (need_clear_uffd_wp && pte_is_uffd_wp_marker(pte))
-			pte_clear(mm, new_addr, new_ptep);
-		else {
-			if (need_clear_uffd_wp) {
-				if (pte_present(pte)) {
-					/*
-					 * See __copy_present_ptes(): normalise
-					 * RWP PTEs so the destination starts
-					 * accessible instead of taking a
-					 * numa-hinting fault on first access.
-					 */
-					if (userfaultfd_rwp(vma) && pte_uffd(pte))
-						pte = pte_modify(pte, vma->vm_page_prot);
-					pte = pte_clear_uffd(pte);
-				} else {
-					pte = pte_swp_clear_uffd(pte);
-				}
-			}
-			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
-		}
+		set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
 	}
 
 	lazy_mmu_mode_disable();
@@ -334,25 +313,6 @@ static inline bool arch_supports_page_table_move(void)
 }
 #endif
 
-static inline bool uffd_supports_page_table_move(struct pagetable_move_control *pmc)
-{
-	/*
-	 * If we are moving a VMA that has uffd-wp registered but with
-	 * remap events disabled (new VMA will not be registered with uffd), we
-	 * need to ensure that the uffd-wp state is cleared from all pgtables.
-	 * This means recursing into lower page tables in move_page_tables().
-	 *
-	 * We might get called with VMAs reversed when recovering from a
-	 * failed page table move. In that case, the
-	 * "old"-but-actually-"originally new" VMA during recovery will not have
-	 * a uffd context. Recursing into lower page tables during the original
-	 * move but not during the recovery move will cause trouble, because we
-	 * run into already-existing page tables. So check both VMAs.
-	 */
-	return !vma_has_uffd_without_event_remap(pmc->old) &&
-	       !vma_has_uffd_without_event_remap(pmc->new);
-}
-
 #ifdef CONFIG_HAVE_MOVE_PMD
 static bool move_normal_pmd(struct pagetable_move_control *pmc,
 			pmd_t *old_pmd, pmd_t *new_pmd)
@@ -365,8 +325,6 @@ static bool move_normal_pmd(struct pagetable_move_control *pmc,
 
 	if (!arch_supports_page_table_move())
 		return false;
-	if (!uffd_supports_page_table_move(pmc))
-		return false;
 	/*
 	 * The destination pmd shouldn't be established, free_pgtables()
 	 * should have released it.
@@ -434,8 +392,6 @@ static bool move_normal_pud(struct pagetable_move_control *pmc,
 
 	if (!arch_supports_page_table_move())
 		return false;
-	if (!uffd_supports_page_table_move(pmc))
-		return false;
 	/*
 	 * The destination pud shouldn't be established, free_pgtables()
 	 * should have released it.
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index ad9d243dc64b..bf42fabb5afd 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -3161,6 +3161,7 @@ void mremap_userfaultfd_prep(struct vm_area_struct *vma,
 		up_write(&ctx->map_changing_lock);
 	} else {
 		/* Drop uffd context if remap feature not enabled */
+		userfaultfd_clear_ptes(vma, vma->vm_start, vma->vm_end);
 		userfaultfd_reset_ctx(vma);
 	}
 }

-- 
2.39.5

