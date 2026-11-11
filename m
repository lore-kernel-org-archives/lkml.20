Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419756;
	b=QnHc9uPHcbcxNbfs5xJuHJt/igAdmoVT/k/VzkFzDjNWJp/LvWuaC2tgMo0+Tm/6KakM
	 6v7EVqrj+G7bSLZHLuIu+4WmkWVwMU3lm3W++VBZfRVhRSoSG5+/mwd3I9hOLopRuSGAe
	 1GmkYGCEtMEZt7rK3wGx2GqNsPqFWXLfCHs4IYSsZgXpeS3Snvb5KABimnZtlLc+5BXXX
	 NA+iYeJlrCLJZ7hGVoaTbsw3cKadH9774NY/CFq7ZBdj8xIBRYmCXHG7VLBXiQo0M3Pjb
	 pBpCCDs/hUqoummfbExQYef1907gfqPAizoe0pEIOMyHTdbCs5kSy+5OV+dijNa9mdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LvmOJZQBB7IFXQ4rWiGOm3EqZVi1Citt+WxZ2aQ6a20=;
	b=AM/DP152lOoU6naT2OWWu9VNkSDB+klHieGoytWJAPPrDqXKbbKNaSYZWjOUhRLTPKlM
	 W7pP4vIldhzsJ8aL/33mJ9qsdkae3M3/O8iMh8EEJr1Y56wC48V2GFETCHZyQBrUc6a4f
	 YeJ8dClUrg8ugtmCTDnfaKOrfr2weF5ZJiokmWUdzejyXzgujP1elr2ZFcRkU4JfWBUE8
	 ffuEqr7oRIF66IfL05I1X+tZ2qLmixEiziKctk8nFvwo2xPfH9tePgSN/LfgixnDODzOF
	 KIJAXY75b9pNT8xWNAkzNEyn/KI3RSTUAT7EIlO8ViQFjnSReMixq23bjFFKDFRYIOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=T4qiOUVq;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=aI7PgHm0;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B00606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B00606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=T4qiOUVq;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=aI7PgHm0
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHYPjj1914948
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=LvmOJZQBB7IFXQ4rWiGOm3EqZV
	i1Citt+WxZ2aQ6a20=; b=T4qiOUVqH14cGGbnsTSJxS4tbddUBrhFmsLiPt+sYy
	eveWAhH+ZZRt1Zc9U4VkkGjt6JD8dbgQOWe7txZfaxAXGCvp4IWTVZEtjY2ui5QV
	Cz7apLFSbuqpYm86l8jC5gXpWWByv3rzgpnr2yodcXTs5QVg3EurmndxGMjGlRXm
	2vzYejk2gq6udQbxeQ1DdosGkSb96Xj1Bj7TvpIITitTAwk+GS2AY/+8CLPAVF4R
	i7lfZpPSkWWKD1wKguwZZfdKclL2xEVnsb2a5IpgvFoWinZfHUVHyqK/8W1Rx8/X
	s8GXFaM10U23XqBjlfPO6Suyg4yxF4X9cQZ08RvcfSjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hvvaqgh77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:55:54 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e8badc80fso47795476d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794419753; x=1795024553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LvmOJZQBB7IFXQ4rWiGOm3EqZVi1Citt+WxZ2aQ6a20=;
        b=aI7PgHm0IokjHh6Z+g2Uj2knHds2GhQyGwztHl2yV2eLv9YqUxkiO8RDLEMaQ4j4p5
         YUTDksyIH2vfPk5eGbVKSJQl/CeT2pRCWhecXJzQEqHxokaG0WiPnrU4Z1XAJEJ/+rLh
         yxpWk7i3D1XlcuAsna5JQ2vrEmgOsHGUBbNI3xaboV/PHPOMfIjFFHdl41d5o8zy8Zs3
         8999FVj7QzlIyZAdfxv2TWZM7Ei+OAHJXxfErh41wkwVFVvNoXvm59+jrAGVcJ0V/5DF
         YdKS86nwf1Y6Bmm+tdrKW4+maCEPr3lPrrWlX7tDCxicIZstQeL1zjNkae4Sqk5I+J2U
         Wgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419753; x=1795024553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LvmOJZQBB7IFXQ4rWiGOm3EqZVi1Citt+WxZ2aQ6a20=;
        b=ZV+L1b9wbiwnt0pvL9IHCV+uCJon9s9MTNdK/K+2LAfWWN/bublRhogo7b2iXCOOgj
         yBq1zkDqOjDXSECxJMIp2M9+14Ta57vKFE5jPqkmn+HBeSjfrGlHCJ0JXTpmCS1Z+hp4
         NSXRPY6s9OUPvcxTvk4q1Vh98SlX5aJFVBRmJbvRpL10+W6rEfBJz+n/3fDaKE3tnKGa
         MJXMg3ys01OPKaGkhvsaKSKzW1z63P1+g4MCuBCowfwyDA3AnBnLSJv+FTciKwSz8Bkc
         WySJ+KA+eS/UNLw+fOCc2wGCzg0F/FqErMm0bjraf3TtXVMKnix4+DHT8alNT+Istds8
         zU4g==
X-Forwarded-Encrypted: i=1; AL+hErH5XebL/XMRyRCo5r8GfXVJskVS/bplboOjPaauIOt6gqLHpaWTWaGANe97Snfd051QjSQxSIEoK+80zec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WhFWYuhupFR5iIlzK/g9Iy+C2f3UmWKxQcZY/90nicOhWw3dB
	jjXmm04niGFiojHGz+B4Q5zghdOj4m1yYYyNKWo1+j/htUhu+h1ko595Rw/0hkCoGdFUE58ulmE
	kpcnGgozi122e82q0AxB6EDWuihGhp56+o2OwB3ZCR63lFZsO3AUYrvTFnxRdJA==
X-Gm-Gg: AYBFou1pSa03rdMwBw0dFSY3KPMmyEpXLtbvZpB9rpF0Z5+zKYGUQHnzwNk13DZkntm
	7rGMSneFFmG1sbXdZD7Y9bviRJqXYhDP36qjxxOr+IUrC3f2rgRHwgC+k6akij6wgMCu6y5X2X2
	yPG8713aI7qJgKEvDg5QBtkuNwMezdI1AKlesLeUnSBRJ4NsD804D2gZyqpyXdQ0wQ84GP4wX5V
	7+2kjyypY7HuAdgq9rFhfEhBw4i30Kt6Rbiza533N1Proh7BRCH0OwZo2y5Vhx1LP6hDLWENnRR
	X8kojgmoOieftyLmY2Db9RNl2qHUMvaKoYObGf2EKhiUWn5MAPhIidcChIIbDUCxIE5YC3Y2NIF
	4zKJSoZC89KjJguFM1McuYQho1wsP4iuzhiQTUrdCXBvulLwCuuv/xQKtHbyW837UeqTCSmGYD/
	RBV2hDzdzgs6F8m9fV1Q==
X-Received: by 2002:ac8:5f4f:0:b0:536:6856:f590 with SMTP id d75a77b69052e-556bfc28a79mr49069441cf.18.1794419753276;
        Wed, 11 Nov 2026 09:55:53 -0800 (PST)
X-Received: by 2002:ac8:5f4f:0:b0:536:6856:f590 with SMTP id d75a77b69052e-556bfc28a79mr49069031cf.18.1794419752787;
        Wed, 11 Nov 2026 09:55:52 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm54974231cf.16.2026.11.11.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:55:52 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 00/12] userfaultfd: assorted fixes (part 1)
Date: Wed, 11 Nov 2026 12:55:08 -0500
Message-Id: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAPyr9GoC/yXMwQqDMBCE4VeRPXfBDUWkryI9RDPR7UFLNhZBf
 PdGPX4M/+xkSAqjV7VTwk9Nl7lAHhUNk59HsIZicrVrROqG1xgDW/YZHHWDcXAiAuf78GypZN+
 EayhV975ta//BkM8fOo4/Jw+9OHQAAAA=
X-Change-ID: 20261106-uffd-state-fixes-d2111e2abd48
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
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794419750; l=3924;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=cHZMnkuvxuVsum5IPSVBD2Hn2T2KOpeSqPFMnmKTxDE=;
 b=PkxX+j2NoQYADfdFn1SMpbWDsHba3k2jAxsod8ceDHDYyebLuzyuWYyJoweea/Y/WhGIgizjc
 tc/IiVb91ndBzMIK+oPCx5sSZLBqMlOolvppMeZlGQp/vadBlj2yIzh
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=FraQbGrq c=1 sm=1 tr=0 ts=6af4ac2a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=ctVpGLEqiRcwzRHSUTwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfXy6jzK2faIfk6
 iY1hsoOvCqI+VZa1BysjiREk3OSqOhikePX4iwBKe5BtLBTrM/AJ9DkRaHyMGViQw7E9hu+0t6r
 FBTmeEdQ0iRzVawctV+wcCcjmRWzcpRdN8jHyovfG9sYFHiHGcPlI0pEGiiSgBwIUunXkq0TTdg
 19KngwKx1DYzfJ3RWw2Kw98/ZzhUFI9JAG5TOlcy62mSbOcfgswvJIhaK13+Rhw4xEok/rZP5NJ
 JsVAzPCo1xgNh2EoK2bRmjXwx7gxsGKYX5eLo66l64RHdBdx+DM8H6i+wuqJtLD6VCMbBW3OSVp
 0VZOori8Msd/eHa4dxHyUQoqvnHSYUC49CleZj3AVV/4+FnwCLGc5CLbvVV0MPMP+Zu0Co+WYyH
 ShRYEyN9P19IF9KZpt9FO7A7tBvq06cuhhKzQYnNAMPedDem1sz9OgDRXmVoxsaQPSMUlcRd0Fn
 e0mp2Cx6MFAnapysoeA==
X-Proofpoint-ORIG-GUID: fFM3DGtdB9j1qPsXKrgjuTn-jwAZo0gM
X-Proofpoint-GUID: fFM3DGtdB9j1qPsXKrgjuTn-jwAZo0gM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX4o2x/nUVni5g
 WMk5pDQEgyAtfpuXmf9Ac2xdYvwQyPYspAurpjeXS5NZ3I5leMu/ZqHnKQNZ4/Ovs87P3xtJZiN
 tIk72mbp+efxHPfr/cuC06V1Gw85WHkymWWSkY8Dmj19ybhbrXYn
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11963
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10
 clxscore=1015 priorityscore=1501 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110071

This is a first batch of userfaultfd fixes, with more to come.

These were found by a mix of regular old LLM review and by having an LLM
write a TLA+ model of uffd interactions with PTE bits and other state
and seeing what issues fell out.

Most of these fix places where mm code loses uffd-wp or RWP protection
while moving, migrating or zapping an entry. Userspace then either
misses writes and accesses, or gets pages reported that nobody touched.
There are also two hangs (UFFDIO_MOVE and MADV_GUARD_INSTALL), and
UFFDIO_ZEROPAGE modifying a file through a private mapping.

Patches 1-2:   UFFDIO_ZEROPAGE and UFFDIO_MOVE fixes, cc stable
Patches 3-5:   PAGEMAP_SCAN write-protect vs. migration and
               device-private entries
Patch 6:       UFFDIO_MOVE of the huge zero page from an RWP source
Patch 7:       mremap() losing uffd state when a move fails halfway
Patch 8:       migrate_vma replacing a uffd-protected zero page
Patches 9-11:  guard regions vs. uffd-wp
Patch 12:      UFFDIO_UNREGISTER with a misaligned hugetlb end

A few of the fixes change what userspace sees:

 - UFFDIO_ZEROPAGE on a private file mapping no longer fails with
   -EEXIST where the file already has a page, on an mm that cannot use
   the zero page (patch 1)
 - UFFDIO_MOVE returns -EEXIST for any huge destination PMD, not only
   for a present THP (patch 2)
 - MADV_GUARD_INSTALL sends UFFD_EVENT_REMOVE, and can return -ENOMEM
   or -EINVAL if the VMA goes away or changes while the lock is dropped
   (patch 11)
 - UFFDIO_UNREGISTER with a misaligned hugetlb end fails before
   unregistering anything (patch 12)

Patch 6 has little user impact on its own. It is included because,
together with patch 7, it allows removing clear_uffd_wp_pmd().

Patch 7 adds spurious minor faults on shmem and hugetlb after mremap():
when dropping uffd protection there, change_protection() makes writable
pages that were never protected read-only. UFFDIO_UNREGISTER and
UFFDIO_WRITEPROTECT already behave this way and lead to the same
spurious faults. This will be fixed in change_protection() in a separate
series.

Based on mm-new.

---
Tal Zussman (12):
      userfaultfd: use anonymous memory for UFFDIO_ZEROPAGE on private file mappings
      userfaultfd: refuse UFFDIO_MOVE into a non-present huge destination PMD
      fs/proc/task_mmu: downgrade writable migration entries in PAGEMAP_SCAN write-protect
      mm/migrate: keep the uffd bit when restoring a writable migration entry
      fs/proc/task_mmu: write-protect device-private THPs in PAGEMAP_SCAN
      mm/huge_memory: build the moved huge zero PMD from the destination VMA
      mm/mremap: resolve uffd state when the context is dropped, not during the move
      mm/migrate_device: do not migrate a uffd-protected zero page
      mm/madvise: let a guard marker carry the uffd-wp bit
      mm: set the uffd-wp bit on a guard marker when write-protecting
      mm/madvise: send UFFD_EVENT_REMOVE when installing guard regions
      mm/userfaultfd: check hugetlb end alignment in UFFDIO_UNREGISTER pre-scan

 fs/proc/task_mmu.c      | 64 +++++++++++++++++++++++++++++++++++++++++---
 include/linux/leafops.h | 18 +++++++++++++
 mm/huge_memory.c        | 31 +++-------------------
 mm/hugetlb.c            | 27 +------------------
 mm/madvise.c            | 62 +++++++++++++++++++++++++++++++++++--------
 mm/migrate.c            |  2 +-
 mm/migrate_device.c     | 23 ++++++++++++++--
 mm/mprotect.c           | 26 ++++++++++++++++--
 mm/mremap.c             | 46 +-------------------------------
 mm/userfaultfd.c        | 70 ++++++++++++++++++++++++-------------------------
 10 files changed, 215 insertions(+), 154 deletions(-)
---
base-commit: 2dc0136b1fdac153434ab02778fcdb32db5d0dae
change-id: 20261106-uffd-state-fixes-d2111e2abd48

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

