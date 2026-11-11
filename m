Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419770;
	b=PExN1kBmu3C+pTWsOkITh7vJcwY2d8OvLcXIjhWvi/cBZ+uxgFiom3+gfbRSXkWIy59d
	 H+sRP8ufzoUeIe/KjpN7B8aY+gAvHmGP/ys9tWhsi+oQsqZpZn7klA1eyETOPBkazuPZX
	 ZNqBV/ZOLBPLy7EcguwCTHT7q5OagJoLwQ3Od9fUvPmRzwmZ6ndh5UPpggPTagFA6suHK
	 Elqso18bWBec7dVuFlLZnIekmQr/PqhEEsBsaRS7MFOVEKxWl2EO2rId3/s4hqSn9IDFr
	 0Hys8jiODDxR7Sr6h6av2qzd5lhbIOYYOVFqqQPuk86oVx51mJ+P9KRH4W1Gc9Kj5Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BBlMDdhjzTQo0mVweCvphKP4StdkmuGlmZUd2y9c2JY=;
	b=uJzHn5aQ2CZtsSSBBNNQM174Nm3QtOzv1X3ZSL07dMpEJjxRk5Xk3wF90LLPVO4ALWnj
	 je0xpWUmfjSOnxABhi94sPN2VIEVWr8vLBTM4EHP+QPV/mXKTkDrYaeTmN3aobgtMTu4U
	 hUvzi7CpduSkPhTqc+6rG/FKcHSEyHggIFK2sM+czKU1LVQtwnf/S+MQsmHpKLfdChE6b
	 N1QclvfNBA9Ircg4HyOXXAPFbwCoK5qP6xo6qhxFP3b+UuuuFg+IhthKjLCry0f8anfdz
	 jqAL1Ru92o6DD5Wav7yt8Hiwb9Eh06Nlbx9OXSafOVE9Jb2UfQ3F6P5gcx3xS7+fBMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Hh7sd9pL;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="Xqdzm/mk";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E28F60A5BE2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E28F60A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Hh7sd9pL;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Xqdzm/mk
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYeOZ1159072
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=BBlM
	DdhjzTQo0mVweCvphKP4StdkmuGlmZUd2y9c2JY=; b=Hh7sd9pLX35u6rtxYlZD
	dOxs6AXrfDKYFU3/qNuaqZzFICWetMLouHi567NphQxkL0icIcLmzP+l8kVtqnLK
	EJ4h3S3xmxzrH1Ed/xY0Kg/wU3P1QXtWAT8zKvcfGt9iqsO+k5ygY8cqTipWQB70
	EbuBHeXykU2+jWv9NhaFE50/yEg6CvkI9A5kq4jZvS9UIT9G7SpHZao4BLi48sK2
	WoLN+xd78SbCFK5hFQ5sjUhorjsqLHHO3XV0ljVCpJLlr9nivITzDw9Ar6WUVaES
	U4+lkxX9MBi+E46Y+xpNva3RXBJLwbkkQGH46akYRZe5D4KMgpE610DCQedVFH1m
	Gw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvhnsc4bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:08 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54af6c38092so50692111cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419768; x=1795024568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBlMDdhjzTQo0mVweCvphKP4StdkmuGlmZUd2y9c2JY=;
        b=Xqdzm/mkbvJuyD2peNgtHEnY3yBXQRevuL8CgdBbAquA3dj83PGt7f2DVO+QTnDbH2
         PGZZ89/juRCMvhN1KBHF8Y/Nc9rO3tj+Pl+rSptymX9o5cljftsVZ0/OXD8wxyh/j1MF
         xh5YtevoYeqfBcmb/NXDIZxcej55g6pqYSUOwYWf++sB4S9MbMwOEs+ZSIwLLU7oBEej
         tYBZEaii+R/1sw8NF7fOSM4XSIdQFHraXdPhwoxDgNxl3qrne1pFvQinZLC2VxvKXgA/
         Q0SWKnZTdjcPF0wHfsAXKNiQBj4h2GxovmuCGr50QjArldhGSdsNqV+KWZa5iCKLTzmP
         s7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419768; x=1795024568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBlMDdhjzTQo0mVweCvphKP4StdkmuGlmZUd2y9c2JY=;
        b=T9wPAYTDqF/OWGaW4Ul/F2vJifhikLdp2D3x0DMyzJLaIbYLCdT19lNu1GFZp1PDr9
         mbA+PAZFFQNpM9mcvd+KJBLIXoK2tfmCeM0ZzLtTFKpl725qpTjIn1hW3CA2MTLVD+kt
         OXBHFsMQBp8lSY5DtEsjz7zWPQfcK7EV+o33ENWytca5uiNxJxBiWPQ7US3fM17fmL8G
         K/+BMI5ENgt5T+ZKvEmCGwA1Ow2naymgSzUpjTlX6QdekeSC8I+51rTYOsn339m5cHNQ
         vbw14nIoFLjKTuO+vBTJPmuyqwWEwwlPfkzG86Ln8m3dn5Qx8GloY64qqFhijR7Bg2nM
         72TQ==
X-Forwarded-Encrypted: i=1; AL+hErHhqXZ5+Xbh2YTA2eIpzSxTH0gI+E55KeEFhCzpgVzs1a0mJlRtWbELH44qgJ0sPJIky/PZOLf5Ta5Tids=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+NsSxC362f2JG2gCe2HdMyOgsxWOkD9EP4S+Tk81ViGrPewrG
	KlnHJj24k96km/h2vdLFhtnpsocVGOgwsKaDv1qIXgdImJAJuhehofFnmXfgHZyZdfDpdTb7/m1
	u8ECI/JUAsnNVeccWRZ6qIn8EKSDkxxkU1lgBBS6ptmj4SKYpI+SUMXqwyOemLQ==
X-Gm-Gg: AYBFou1IKmAnzZvnGntJNtq3sSkFLH7RoQ/oUlP865NrA0IUrLHxvS9NjS1tNVBA42e
	koG9h2Xw4iNg6I1QCPYTUqP8cC9l972wArr1uTSEWbux6rp2zJ6U74/QaV7aPZggMuidUL4T3RQ
	bekvcuPu0lwXpPj3O2Nkx7hccuz3yGVIpBP3ntejeGT8d+m8r9mNhLBejkzQNep0NUTCq9LQBED
	2TqKkNhPWTaYF4wuiQWMDov2upxq/vXunbV1/nlh/yiZybCjWtP8tGvOQBd2oRtwc+U8JOPVyZ3
	XuXC79YYuL1Scr6j72rHrNvIkqpoHepJFXNxf0wQXeolAjXBioz2LuBgU/DE3Jo7egdNXBgxv/X
	12QGgYc1RIRhG5C1PljRbJb+kUr3jaKk/LACwG3o0jg20CZ9huW41uQTNYIoWAgpjtMGj1tp6Ig
	IdofwdpjZ5DWSbg/1n9A==
X-Received: by 2002:ac8:5a0e:0:b0:536:79aa:de1f with SMTP id d75a77b69052e-556c1197894mr48425151cf.59.1794419768079;
        Wed, 11 Nov 2026 09:56:08 -0800 (PST)
X-Received: by 2002:ac8:5a0e:0:b0:536:79aa:de1f with SMTP id d75a77b69052e-556c1197894mr48424651cf.59.1794419767488;
        Wed, 11 Nov 2026 09:56:07 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:56:07 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 11 Nov 2026 12:55:18 -0500
Subject: [PATCH 10/12] mm: set the uffd-wp bit on a guard marker when
 write-protecting
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
Message-Id: <20261111-uffd-state-fixes-v1-10-00713d368976@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=4747;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=ul44rnbOIwU4lu3lsdNUVT1/DDeRuHSjTUnRw0a9WDU=;
 b=fQsTj/i4UDq/yryVbSh4wKtMJl71uW3GYCH+sFLo7nbH9QwIF3IoGj2UFmj9P90rfaHOlmBJe
 gd1PEh3ydhsDVrHDCabHuLuuuSUCXXz5rWvEfQeIz3wqKs2J9YDY4iH
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=S9lMU4sP c=1 sm=1 tr=0 ts=6af4ac38 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=A3l_acRxY7KWR7xJ1gsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lnQFve0oS_kv_I9qyH-6Kf9NOPaBdLJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX3YgAEkvUjGwa
 nDP1APlv0lu1r659Y+e8NWGbmynlmQQr9WB+In4nw1IyJnbBBuDTFpsa9hj3tz27aCVQY8GW1f+
 hbEyabsXC9xqCbAvohc/l4F+aAxosKh7vf1YNDNFk1vUkfTLb1cE8Vf4U9D3MFkrDiE8sqLuutx
 N8WpE5kmhPkADrVQE0ueFRZKfe2ZB7J0srq2ZGSTj07GRhoVI2LUUjQeS2xsmH/TPwvuTUlRZUX
 cnh8qjWdNCyEmCzavDvoWxlfO+5pMb0RLhW6oSb0VsR6WOM6vjhh79RKzMJ3+GsIHWFppxIHRkC
 8jaE0d7r24Hn6vGxl1DwzpR6r53Rd2Lk3ij67fmDZqZJk392GEdl1ypx5zBZaWPFS8ZTBKgoUSv
 ++pzhGZtsEvS8kpblPVQxIJJm2tt+5H5/shCRDoc6EVJK5Hait0sXqnc6TP8oJ4socrKLBeWW2m
 bGmVHMiASNnY0D2XtAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX6ROm9YK2xTHC
 WutKpicNYrtaYq31DQUlLZA4nPt6aRJS3Zy0UUfJmZSMYcmYgHPZWHU6mn+iMoOyo4fXD5qNrHG
 6iO1bv/BX1SXgUDkipBa3X/7JVqUzesJBSj4HO2tqIn+OlRHwN+h
X-Proofpoint-ORIG-GUID: lnQFve0oS_kv_I9qyH-6Kf9NOPaBdLJO
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=10 adultscore=0
 bulkscore=10 phishscore=0 malwarescore=0 impostorscore=10 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110071

UFFDIO_WRITEPROTECT and PAGEMAP_SCAN with PM_SCAN_WP_MATCHING do not
write-protect an entry that holds a guard marker. change_softleaf_pte()
ignores guard markers, and make_uffd_wp_pte() only sets the swap uffd
bit on the marker PTE, which guard removal clears along with the marker.

On a file-backed VMA, the page is still in the page cache once the guard
is removed. It faults back in writable, and writes to it are not
reported.

To fix it, set the uffd-wp bit on a guard marker of a file-backed VMA in
both paths. A guard marker can carry that bit, and guard removal then
keeps the write protection by leaving a uffd-wp marker in its place.

Move is_guard_pte_marker() to leafops.h as pte_is_guard_marker(), next
to pte_is_uffd_wp_marker(), so that make_uffd_wp_pte() can use it.

A page that is write-protected while a guard is in place is now still
write-protected after the guard is removed.

Anonymous memory is left as it is. With UFFD_FEATURE_WP_UNPOPULATED, an
entry that is write-protected while a guard is in place is still
unprotected after the guard is removed.

Fixes: f807123d578d ("mm: allow guard regions in file-backed and read-only mappings")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/proc/task_mmu.c      |  7 +++++++
 include/linux/leafops.h | 14 ++++++++++++++
 mm/madvise.c            | 11 ++---------
 mm/mprotect.c           |  5 ++++-
 4 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 752f1b13d47a..7b1c843a4fd0 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2439,6 +2439,13 @@ static void make_uffd_wp_pte(struct vm_area_struct *vma,
 	} else if (pte_none(ptent)) {
 		set_pte_at(vma->vm_mm, addr, pte,
 			   make_pte_marker(PTE_MARKER_UFFD_WP));
+	} else if (!vma_is_anonymous(vma) && pte_is_guard_marker(ptent)) {
+		/* Keep the protection in the marker, as mprotect does. */
+		const softleaf_t entry = softleaf_from_pte(ptent);
+
+		set_pte_at(vma->vm_mm, addr, pte,
+			   make_pte_marker(softleaf_to_marker(entry) |
+					   PTE_MARKER_UFFD_WP));
 	} else {
 		ptent = set_uffd_wp_swp_pte(ptent);
 		set_pte_at(vma->vm_mm, addr, pte, ptent);
diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index add4968ded44..831b85a184c4 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -547,6 +547,20 @@ static inline bool pte_is_marker(pte_t pte)
 	return softleaf_is_marker(softleaf_from_pte(pte));
 }
 
+/**
+ * pte_is_guard_marker() - Does this PTE entry encode a guard region marker
+ * leaf entry?
+ * @pte: PTE entry.
+ *
+ * Returns: true if this PTE is a guard marker leaf entry, otherwise false.
+ */
+static inline bool pte_is_guard_marker(pte_t pte)
+{
+	const softleaf_t entry = softleaf_from_pte(pte);
+
+	return softleaf_is_guard_marker(entry);
+}
+
 /**
  * pte_is_uffd_wp_marker() - Does this PTE entry encode a userfaultfd write
  * protect marker leaf entry?
diff --git a/mm/madvise.c b/mm/madvise.c
index e2c6b0f26672..e8b05dc899f1 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1085,13 +1085,6 @@ static bool is_valid_guard_vma(const struct vm_area_struct *vma,
 	return true;
 }
 
-static bool is_guard_pte_marker(pte_t ptent)
-{
-	const softleaf_t entry = softleaf_from_pte(ptent);
-
-	return softleaf_is_guard_marker(entry);
-}
-
 static int guard_install_pud_entry(pud_t *pud, unsigned long addr,
 				   unsigned long next, struct mm_walk *walk)
 {
@@ -1117,7 +1110,7 @@ static int guard_install_pte_entry(pte_t *pte, unsigned long addr,
 	unsigned long *nr_pages = (unsigned long *)walk->private;
 
 	/* If there is already a guard page marker, we have nothing to do. */
-	if (is_guard_pte_marker(pteval)) {
+	if (pte_is_guard_marker(pteval)) {
 		(*nr_pages)++;
 
 		return 0;
@@ -1275,7 +1268,7 @@ static int guard_remove_pte_entry(pte_t *pte, unsigned long addr,
 {
 	pte_t ptent = ptep_get(pte);
 
-	if (is_guard_pte_marker(ptent)) {
+	if (pte_is_guard_marker(ptent)) {
 		const softleaf_t entry = softleaf_from_pte(ptent);
 		const pte_marker marker = softleaf_to_marker(entry) &
 					  ~PTE_MARKER_GUARD;
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 6cc5b99b4185..3f2d6e3aca93 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -261,7 +261,10 @@ static long change_softleaf_pte(struct vm_area_struct *vma,
 			const pte_marker old = softleaf_to_marker(entry);
 			pte_marker marker = old;
 
-			if (uffd_prot_resolve)
+			if ((cp_flags & MM_CP_UFFD_WP) &&
+			    !vma_is_anonymous(vma))
+				marker |= PTE_MARKER_UFFD_WP;
+			else if (uffd_prot_resolve)
 				marker &= ~PTE_MARKER_UFFD_WP;
 
 			if (marker == old)

-- 
2.39.5

