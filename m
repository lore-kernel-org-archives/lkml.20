Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419760;
	b=Qrm6QlgUC+hPpKXk1JQmheTJrkgKVesIreUGLb6MnTj4Xvdvq/GTldtbyVeVHUgXaxiw
	 7b35PEgTDJ6QssVxx82+EQa109ojwvmezUzjWfaacrNMokCeJCSzbhUdDmA+A86JunRD6
	 G+nfo1NkafVV/GcNe3DdsuDYGvcoZOWEZs3gU8dqmZCzYOuzaLQEZQoFhyA/C1w3eIQe4
	 De92gf7sUE0H3CbRiFMYcP3aFwWPLB8iRARU2hJqnGPBSjwgdkjP7hv3Huk1dwRwVzcEf
	 hoK22XKtRSd2PviAZ+w4UqT4RiZR2My26Hr+s0StX8VIOTOVt9/MqZLSieyD39sYJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A7PIp2Su3GVSOwbPaxAMtmcR8wjprP5YambQK0BRZCI=;
	b=R4YwQ96drXkqc462LRPxSYGwahGY9dw9YyrJ/IbdNuJiDVirS2d4Bzpk0sN1CZwwSvbP
	 kkrrPaNnTOeWxdkOKh+8dDg5FtnqvemvMH08lec6skn1DvdhJXBlOUfwZGEoDESzbOszI
	 crD3QmPYxYyEbYhRxkYiKVYz0t6hCvKT9sd71IEuAzXrh3+nkOezuLRAucM0UPjBq4iSX
	 CClaCM4IhAfwkdsCZBDtM3BPzsjr3N7dzj0ckPCg/ABfWrKkbo8WHxXeOsojfXADwI9R6
	 ck8IcHEwNaJfCNwrRYmEyqZRPTFPjJHuHwAOd1nYS6zLRxuGjRfuJsTvIvUECZVovQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=SxdzbLS4;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OJqG8WyL;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC7606A8A8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BC7606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=SxdzbLS4;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OJqG8WyL
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYCxM1158017
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=A7PI
	p2Su3GVSOwbPaxAMtmcR8wjprP5YambQK0BRZCI=; b=SxdzbLS4pNUW/TTa4eJm
	dvNUC1nq0hG8ZW6AdBLvA9HLGsvEggmNCU2pwQ4ac/YyjGbN86KE5KPqFqiFdrdj
	ZV69lvwigClyapAsoae1GW4D9k8iQqMwxMoO4FTIZnWuuqpUEIbSwCv3z8HM3QAp
	RPnbN95u8IU4jxPeQyl4g060zeT5TAKcTq3JJxWaabdmn2smv6PtAY1PpxqLhm26
	bU6tdELtcs4DSzS3OMj3jUl0uVFle9qq99mEHFJF7mvUOaOEEeYLDP3f6AJDFH9X
	C75LewDiwRU7EKuBSTVNNnQQ+BZnJzbKnD/214HJfjFSWMWTzB1AivEbf/EEre/V
	Yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvhnsc4a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:55:58 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536347602faso69758071cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419758; x=1795024558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7PIp2Su3GVSOwbPaxAMtmcR8wjprP5YambQK0BRZCI=;
        b=OJqG8WyLdOVwG1++GidWfK0iinUsTQ4lz801duSZc2v4HFeB3SSEW86N5AVVqwtQ3k
         ZRP1912llVlCgyrqUdsszf6fVAWmliLVVDd/DUz0xmRXjKF3NTRDArmlXl/jrUClxbr/
         g/Lu99QNzWTlwtwb5rf1xQ4rULG2Y2P1GhOyZq/Eyb/Q5fxsAulGrxYCbLkULZ2y9jF8
         EVPgOKYke3Oyx0zo69cC1osz4vtUo54dY8m112NgbYd0WX3zHyVEcxeiHf311q+VBywE
         lPObiOi7yhAY5oIjJTOitFNIVXL7D+4MYLiAaG7IiI3pY2SZW3E2LXhhFYGyC7K58cnX
         hEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419758; x=1795024558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7PIp2Su3GVSOwbPaxAMtmcR8wjprP5YambQK0BRZCI=;
        b=Ir0Bn6ld2spjVQwc/72cW97b15ikF/oUWiSxEEAVYJlgTIKEQHLpJT86KTqd4VHHFp
         +CpYzUVjGo1DLiuvvHHgxfx6gSDMhuPrWdQfb1+EbjGIAvlRg36f5s2DhY/jLfR+6MXI
         5Edpy5NlQrc/YjJm2pN3Rk+m9WVeZleDU9McyRQBttzY9N9jlx0n6Mx0hVh23qs3WJRN
         t6Vh9ZGwLtbpmBQm/CUkN16ELyDSHWZ4La2sw7/7UdBmQtFOy2Ns0ziKOmo5kgBPyY6r
         fGI3jagENUdb0a2zNuvooH/qOBQcZhMwyQzhntd7yj+exgH5w/3Zv6HuZQBZT2KSbLQj
         GwDg==
X-Forwarded-Encrypted: i=1; AL+hErFJpJxP80yTKOSct0aMR9GfKZwe23oHK7YrzxQmhmiKla8YzvVjl1kICqFggKOYAy6iVx3pQgRZRf0hmco=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fyIsf683vhXfZOiUl2hsZ2WsWfYsemyDHJ9LUUjnpQa+pD2Kc
	SZWwHZG/SGurxjljbLTUT/JI1MR+7RXQP2JHAZdVyrwWUSWlR787wsnDuXf/b6yHWrUkHJNfFKA
	af/HPZyyb795yFLSR+rbgG7hMeoUV1bdOvaujYpz7df/4DfkPwHQrPaTmnEPbWA==
X-Gm-Gg: AYBFou2PnYqaSenLqj+0aE2WwGMtlEsNqcesT08Wq1bu24BYOB0ptilKKYNWIJ51iKM
	fBDmJPX/wL1rWMRxqqUr+VD/vA3F8cTzpqv1nAEMff2E0sDpCwft31E1YAnsGxCFDrgzVC+KOkW
	jR4c79vlYh20Rfp0cSfkb1l9/rBR0ZzPTu3bsorUcu0TIcoUGe6agZ38PgJ9pozRmdp17B1Oj9m
	ilUY0YPxagkD8fs895krxa+GBCcjaisrinx1DrNIz9ezHoi3heuTfXxDI7KqlI9UnkcOpsf451d
	rlCJ5xva6DQIc3fcyFME96IyNxc/9kQ+9wzync+MuP9Bho2tCh+9fKYWh7OR+4Ynkdlz3T/I5dO
	AepVLxUK7DShvMe6SPDuWl3pMGTOhTWiZxBLMddLwE72dl4CaszAxicblzlcDHPRh/VpiCus30J
	npaOFGgVTUPn+kFroNEw==
X-Received: by 2002:a05:622a:5592:b0:536:7c84:be60 with SMTP id d75a77b69052e-556c177114emr47916981cf.65.1794419757849;
        Wed, 11 Nov 2026 09:55:57 -0800 (PST)
X-Received: by 2002:a05:622a:5592:b0:536:7c84:be60 with SMTP id d75a77b69052e-556c177114emr47916261cf.65.1794419757226;
        Wed, 11 Nov 2026 09:55:57 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:55:56 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 11 Nov 2026 12:55:11 -0500
Subject: [PATCH 03/12] fs/proc/task_mmu: downgrade writable migration
 entries in PAGEMAP_SCAN write-protect
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
Message-Id: <20261111-uffd-state-fixes-v1-3-00713d368976@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=4502;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=CmziNLSgpRPr6xpV0ob+23DUmSuzGkcGrlWyUdxd3eQ=;
 b=Rni1CSCL/up+hUsSi3ClQqRFM7waADYPJyNCw/C6x1CM2LwrTPTaPEjbnEPjHgq8p8ijn+k1m
 PXpu1mmb3KZAfplhneYwAK5yNeUMY86/01Y3PQNM5QX7QhS0VKP/iJl
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=S9lMU4sP c=1 sm=1 tr=0 ts=6af4ac2e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=V3FC_PkR7xI6twvvc-cA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LJBD1jb9mX0Uga6HndPv6q7u3zQ38FOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX6RhioA9xcc/3
 ss2K63z0CvDUkDsjFcx2OBCRMbncM9EMcO23sN3a5AKB83SoavSI2mVIFw3HUjjpsEzZDZtkRoL
 PAMYtm1gQ+ptnj3heU7b2BONncZG60HeGVEUH9IbhVHkbRuIYOm+gxuawPFpN23Oajo42TyMsw8
 167IdV9zaZhxG7T8xTWYZOeLUlFcteYySev5qiKgnXloq5K4At7+6vllLY3f0qifHyFLZ9T9+b3
 C+fcoSfqjnQE9YJtdMDhlMGu+6oTlpmkzbrMr2IO8wsnbOTCPjavypnbnmOUagpAgqkhhPGFA3t
 wylnWq26T/Z1t65Bhq3CWvLUtnc/usce2go1SnrijleRpjVUEcdO0V819S2PgMV3nABDQM1qvZP
 qpru1BglMLYPYiB+ShEOrn0vSdQBIJGnZK3wQaVS6IyqCMoCP8DHUSOXbICUIMSoNGCGTsWBxBc
 zi6TWUEBlDuL81HAZ/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX/2JwaZHWpMP1
 X3l48oIpOydXArVDXfGOLx5iedBOluW8NA1apOuwEzhBd3jKKTMtqfd5vdKg9UMlJHFHJxIAE2a
 ezP3m3NSzsoM2SUXyW0Q4lQWj5Qrut8f0tn3QhqtMvFzaPrv/7aG
X-Proofpoint-ORIG-GUID: LJBD1jb9mX0Uga6HndPv6q7u3zQ38FOZ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=10 adultscore=0
 bulkscore=10 phishscore=0 malwarescore=0 impostorscore=10 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110071

PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects pages in a VMA
registered for async uffd-wp, and sets the uffd bit on non-present
entries as they are. An entry with the uffd bit set must not be
writable, so that the page is write-protected once it is mapped again.
change_protection() therefore downgrades writable migration and
device-private entries to readable ones first, but PAGEMAP_SCAN does
not.

For a writable migration entry at the PTE level,
remove_migration_pte() restores a writable PTE without the uffd bit. So
if a page is under migration while PAGEMAP_SCAN write-protects it, the
write protection is lost. A user tracking writes with async uffd-wp
sees the page reported as written on the next scan although nothing
wrote to it.

With CONFIG_PAGE_TABLE_CHECK, setting the uffd bit on a writable
non-present PTE or PMD also triggers a warning.

To fix it, downgrade writable migration and device-private entries
before setting the uffd bit, as change_protection() does, at the PTE,
PMD, and hugetlb levels.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/proc/task_mmu.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 22361607020d..53780a454432 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2395,6 +2395,38 @@ static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
 	return categories;
 }
 
+/* Downgrade a writable migration or device-private entry to a readable one. */
+static softleaf_t make_readable_softleaf(softleaf_t entry)
+{
+	if (softleaf_is_device_private_write(entry))
+		return make_readable_device_private_entry(swp_offset(entry));
+	if (!softleaf_is_migration_write(entry))
+		return entry;
+	if (folio_test_anon(softleaf_to_folio(entry)))
+		return make_readable_exclusive_migration_entry(swp_offset(entry));
+	return make_readable_migration_entry(swp_offset(entry));
+}
+
+/*
+ * An armed entry must not come back writable, so downgrade a writable
+ * migration or device-private entry before giving it the bit, as
+ * change_softleaf_pte() does.
+ */
+static pte_t set_uffd_wp_swp_pte(pte_t pte)
+{
+	softleaf_t entry = softleaf_from_pte(pte);
+	pte_t newpte;
+
+	if (!softleaf_is_migration_write(entry) &&
+	    !softleaf_is_device_private_write(entry))
+		return pte_swp_mkuffd(pte);
+
+	newpte = softleaf_to_pte(make_readable_softleaf(entry));
+	if (pte_swp_soft_dirty(pte))
+		newpte = pte_swp_mksoft_dirty(newpte);
+	return pte_swp_mkuffd(newpte);
+}
+
 static void make_uffd_wp_pte(struct vm_area_struct *vma,
 			     unsigned long addr, pte_t *pte, pte_t ptent)
 {
@@ -2408,7 +2440,7 @@ static void make_uffd_wp_pte(struct vm_area_struct *vma,
 		set_pte_at(vma->vm_mm, addr, pte,
 			   make_pte_marker(PTE_MARKER_UFFD_WP));
 	} else {
-		ptent = pte_swp_mkuffd(ptent);
+		ptent = set_uffd_wp_swp_pte(ptent);
 		set_pte_at(vma->vm_mm, addr, pte, ptent);
 	}
 }
@@ -2467,6 +2499,22 @@ static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
 	return categories;
 }
 
+/* Same as set_uffd_wp_swp_pte(), for a non-present PMD. */
+static pmd_t set_uffd_wp_swp_pmd(pmd_t pmd)
+{
+	softleaf_t entry = softleaf_from_pmd(pmd);
+	pmd_t newpmd;
+
+	if (!softleaf_is_migration_write(entry) &&
+	    !softleaf_is_device_private_write(entry))
+		return pmd_swp_mkuffd(pmd);
+
+	newpmd = softleaf_to_pmd(make_readable_softleaf(entry));
+	if (pmd_swp_soft_dirty(pmd))
+		newpmd = pmd_swp_mksoft_dirty(newpmd);
+	return pmd_swp_mkuffd(newpmd);
+}
+
 static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 			     unsigned long addr, pmd_t *pmdp)
 {
@@ -2477,7 +2525,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	} else if (pmd_is_migration_entry(pmd)) {
-		pmd = pmd_swp_mkuffd(pmd);
+		pmd = set_uffd_wp_swp_pmd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
 }
@@ -2547,7 +2595,7 @@ static void make_uffd_wp_huge_pte(struct vm_area_struct *vma,
 
 	if (softleaf_is_migration(entry)) {
 		set_huge_pte_at(vma->vm_mm, addr, ptep,
-				pte_swp_mkuffd(ptent), psize);
+				set_uffd_wp_swp_pte(ptent), psize);
 	} else {
 		pte_t old_pte, new_pte;
 

-- 
2.39.5

