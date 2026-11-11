Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419761;
	b=CT6NxFRROuR3+kDR8XMQQyFP0d9ppppQLLaDo1EfnHteDxU3K7+ViQ3CfpRf+BejB/q4
	 f/e5gN6kb6k6R5I230znTlkEZKU3Ufjww+ugkNdByzNqb+jjvkHn2cS1crmBk6+TQ/cPn
	 UGuDpdkopBmRAXYmhpDkGIAQ7RN5BCiOaAzSD4Zd7U3+A8l0dBHKfSGLE2aAh/Qpj+c41
	 ipWWow1mKt3qGFmMc8LmN5tmOc/WX4GSPwvvCiI5famVqirA7NAZGCuIzAO4uW9oD67+4
	 FcrmIFb87UiYz+5b9QB3SsjihauDSK+J3vyiix7BTj8pZIxZZCysyW2F1DfqlpHFsmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O4/i2EgwZRht7H/ivL+S2kGFMBILOdVUz3uGWsdouUQ=;
	b=KRkvYhfbqrLQxNZ4rmB2QTYWpDit6kmPq7r9XX2WTFZMxWD3RgTq3rg6gka48Ozk+yBq
	 IyBlpXWBkkgyfewVDxq6k1MuwNDX7A5wTlzbUENivi515+PssP//i+NsJsC0JRag++CVp
	 7Fzjz1I65Kyoa/uQiWkhyJkVQ/LBOfcMGKz9w+clA6fZLvf3/xnp1WCM9eLQQzJDLRpLn
	 c5s0o/I4CdZRqtCvgwV6lULqxJQdDpR9Vd2vAZHBTqXQrYfzZumbmPAbchseWS249byvL
	 YRAYV+0m8l8sWkwOQL5QnEzVWTUVkqXusoOUl59La4hssAfdCEKEm7IWxm7wfIeNx6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=L+q+MG2X;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5kaLyikh;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30193606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30193606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=L+q+MG2X;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5kaLyikh
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYDDi1914216
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=O4/i
	2EgwZRht7H/ivL+S2kGFMBILOdVUz3uGWsdouUQ=; b=L+q+MG2XoNuKY/IZsad6
	soELIyEKZKjBGQipZvfNqhhUz0I5GLTo8piQ08fVpEzhXaEXUfvriTC3aJmovqL/
	tKrgq+kR8i7QkCh8Hd0lZK3DNR/9BWJngEgeAN3glgzDEP4wzkgwc1JJT4+27etQ
	kHR2cU0TN2ymHOLKFMEVqWtRzVGfUYiA0lW1kaPXF+b8+aXp6O7/qdIAfzyJONxW
	YfQvpcCKW1ZMgv3IJ/XfdvWY/AfkyV2NE2R6nyp1TtqlunHxUEKa5X6G88mLAx7Z
	gWKST56SjdGAabyk50imTHP6tZs13oxohjvTNVsyZghslaLZeJWsaYqp36risHdJ
	fw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvvaqgh93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:00 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5358515b4easo60203941cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419759; x=1795024559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4/i2EgwZRht7H/ivL+S2kGFMBILOdVUz3uGWsdouUQ=;
        b=5kaLyikh/syxovB1ZSt0qATKwrZoAUymxSuj0MjO9YQ+XSTUvoam/CaB35CI9jHytt
         LKqAkVJDyipgYEVYRbdE2lxye+mxWB/y7GvicMRX8K+uKPq5pQyfhtnWGo6nApNMSqVj
         H/1Gj3JulEy4YSO6/uho/IfqXJVuRfIXDMffuVJ4ICvD9CPloDUXyKDy5Fli35R8fLkN
         61qk6BIZeS/q6AQDVD1Jyav2+b+Xu5z2EzyUEBXZajT5vCsyYjb/QwRasBrBOgDbBdia
         htOHzu7P+yYEizLyqdth9EmMPaQ36YW7SqX3pRvktZSlwCpxWxWY9WDZwcKA6tk1YDba
         I8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419759; x=1795024559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4/i2EgwZRht7H/ivL+S2kGFMBILOdVUz3uGWsdouUQ=;
        b=2WNPoZMV16SzFm6YURXgIYTYsjgNcQsay4pzG5w1KaiqkfcxpMnbI9kQNr47gMFkRE
         +vlJS+hc9AUVmzaGO6yUDC3zHSr2x+EWIvRNfZQ2OP093xWYX2DuViO053yGQ1j4XY9Z
         Wslu2tT4kn+Th8nV3yRI7mwpzF6UiverLpHzqHuM2ay28IooncNAMnZDeiekbrbj0Nqv
         PunTsHLjmKExKGvtLYrAzfzwUyE0FSPsgSaviTusnExR1AfKteIlH79kC89UTbcRYi5o
         JRkUp89BrRJPfHACtarMVxJWy8mQwMBQHjUQmvUb5f2HZp3dKqljSkT/5aNswfDOumHB
         Vq9A==
X-Forwarded-Encrypted: i=1; AL+hErHNtLjnNtYs0RiMMYKoT6dswBSIcxxHz10g+UoqgiaOkR9c8UsKKwphqVAlVa036mPhEEuO2V71u2BJ66M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IBmXvGEUyMQyoRKzKB2NrT++REN7vHNOf8x8j2/G0aJbdeo1u
	uf6B21tdNUFe2QQqifCbC3O0nk7pdVGBGHKh1NIhDf0a+IGGLt/Ng+d0bKjceQKfNpEAyDyw05w
	iFCsRJNnLZ6lwMbPrdgl+xe/TTd3OgUjGYcbPtp1JjSzXgsLTTzbx1StDv989JQ==
X-Gm-Gg: AYBFou26Ee19hw0OW2Em1PeeKjlNEwbFiWVfJSvPgKgD3xYTXSbtyAQ/v4vpTBm+dUn
	srGp0UyfqUsWWxeSCAatyfU6lpAk3l0aGyPE+JiPRtZKrb18eJRq8uGLN7ifLJeJWk7ZWl5SIgF
	E9RWl/ifRB+VmTceb3KVXYJXqs+P6PX/bYuVE21ujD3ZqQ9U3iIvRHrzEyDaSjXuryzMx8nuWSJ
	dAm2JvuPnG5ff4My0Nscy97Cdx5QXq8sYeVCFuj4AasyQ1f+ziRG+J1PxiVqMcxMQRjMj1R31U9
	NYrs7ONYdvksy1X+oTBGMyUy4QOYi/QabEQGXYAznpJvxdERd/YjuaBE0QRUL5KW0sqLwpUGFLR
	0leVr62OPa1eSBAWtleDKjonR9kqS1pse4hTbuB1lqKwhVncdJfBBno9xnNtY92YZpmbw7to+Se
	/kllIWBqCuLHe7/obYwg==
X-Received: by 2002:ac8:5713:0:b0:545:c5ec:fa3f with SMTP id d75a77b69052e-556c04f0896mr48125991cf.45.1794419759301;
        Wed, 11 Nov 2026 09:55:59 -0800 (PST)
X-Received: by 2002:ac8:5713:0:b0:545:c5ec:fa3f with SMTP id d75a77b69052e-556c04f0896mr48125181cf.45.1794419758662;
        Wed, 11 Nov 2026 09:55:58 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:55:58 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 11 Nov 2026 12:55:12 -0500
Subject: [PATCH 04/12] mm/migrate: keep the uffd bit when restoring a
 writable migration entry
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
Message-Id: <20261111-uffd-state-fixes-v1-4-00713d368976@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=1718;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=oJnm9FzYnu6qaz/PaR7bVgjlC0D/81eFAkcgURIt440=;
 b=bFUiMWTquKqFKlwBKZ89sJhyun4AHiRJEsk78WWUx1+sVlv6Qb4KBgPb6/z8x1kgBoXAvmIo6
 hJJcR37k5fyDamaO2atD6gtZHwsAKPDUG6Z4UbgtfLNFpXNaY3rhISm
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=FraQbGrq c=1 sm=1 tr=0 ts=6af4ac30 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=7D-TeM2RRefI-p9tlh8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX1KHXW/dwMEZx
 6TrVx4ldbwXdjDse6CzuS/CiH79ROwApKfGKEcZor1Fozwsev7kmBcCkyrxObn2LyhdCZFW+YQn
 yEsgXD9bDJb0xK8Ecc1bbxlUwUo5qBSk5vCHqKlDxVZRPX+mxjmXJjPYPFRbYIQPw2/hNtm8cof
 BCeQ8mcfLtSH2FVsnAk8H8zgASIEPQdqcsbpG09E2XUqau6zzJfz5v+wmqmHA7+rtVI/djNrZ7v
 avvUqVr6RD3YPLvEkf6V9Oo1z2WhIItwgbu+MWoR7dBBXkfciFItVcA7et1x7PtsI1t3MIELV3Y
 nVS/4m5o0O3UDhmqUF5uU39imTnEd9O944LrR9gmo7fK815s+1VUspGN/0LTns+5O3IMZZyLIog
 zz9ucMWwaG0LYLsg4cFcVzCXOTqhuN2ZMmh4awSEkIzHYFlwjmMP/v7isi0kOdQnoVpx7Adbh4Z
 wxvkG2PX81IJ8RP83/Q==
X-Proofpoint-ORIG-GUID: DfZIcUht_GCj-AJPYAVFLsVMCDBWa8Mj
X-Proofpoint-GUID: DfZIcUht_GCj-AJPYAVFLsVMCDBWa8Mj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX8ZMvy/3TN1lE
 913sj493dVXMrW70n57blVrLdrsTaxt9EhLihhfE00OJr5bHnz4RH7VaMSisRy39lbVtm+rwNtt
 EU1VGXoCgjo8qssV3zpR1Zrg5dqLw5+9OOWCRg2/4l4cPb9o21dC
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10
 clxscore=1015 priorityscore=1501 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110071

remove_migration_pte() makes the restored PTE writable for a writable
migration entry, and only looks at the uffd bit of the entry otherwise.
A writable migration entry that has the uffd bit set is therefore
restored as a writable PTE without the uffd bit, and the page is no
longer write-protected.

An entry with the uffd bit set must be restored write-protected, whether
the entry is writable or not. remove_migration_pmd() gets this right: it
makes the PMD writable and sets the uffd bit as two independent steps,
and pmd_mkuffd() write-protects the result. To fix it, do the same at
the PTE level, where pte_mkuffd() write-protects the PTE as well.

The only known path that created such entries is PAGEMAP_SCAN. Now that
PAGEMAP_SCAN downgrades them like change_protection() does, we should no
longer see them, so this change alone should not be visible to
userspace. If another path ever creates a writable migration entry with
the uffd bit set, the page now stays write-protected instead of losing
the uffd bit.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 28a8d7734735..d200f64b5f98 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,7 +399,7 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (softleaf_is_migration_write(entry))
 			pte = pte_mkwrite(pte, vma);
-		else if (pte_swp_uffd(old_pte))
+		if (pte_swp_uffd(old_pte))
 			pte = pte_mkuffd(pte);
 
 		/* See do_swap_page(): restore PAGE_NONE for RWP */

-- 
2.39.5

