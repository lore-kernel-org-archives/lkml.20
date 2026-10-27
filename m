Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793071389;
	b=eqnaRE3W0BFlWAyUW9NNtWqSCW2U1EZtty1Roy46B+7YEzp5VALgj+eGFE7kSlXO6JjE
	 MZdL6UM96ymsJxv46IMgbzxoZJqEGqngqhxH3RyHakonS3Mjiq/y1B3dMqdxXQ/u8JHDC
	 sJHcfJbYLd7D5vrXIjlRcmWLSpMP7pfk68Kfv8IfJMEMvFDXuau04B52tE2q42JgC6U3o
	 t8uep7347ZLNnnrRuYoh9ob9I8G5D1FeDZzmkLJrgBTNhoc3QWhMG0Jti0d1HZIzvcCvu
	 7fy26TtfaF+V1hVMwRoHv+hHYzJu17NHiMA4Q5ApHTMg+91bsd0X2ULw0kOw2IozdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4O96wME59YozreVoXYue1ZzVmrJOWE9hKphAow+pyRk=;
	b=BSXZjCojrxaCWngxnp1OfSEn4LU2fs77DNaULKDOIRpc9W/VDINCw4Oi7qat8VoBkNzv
	 3457WX6WzTg54leauJduQWDQRFmiQMgCWkgPEdwnpB5OANK8ueqQWNwX3mFO3q2Y76c1s
	 +o2m8XwDfyBqzuZdB3U+2ZgmbOyt06ZpRZFQc3mAq7WfvfTt/hiChncqNiaqyvYx46kR7
	 QxQNZhIVq2cTXnqjqYjII62/PXFAUvAMrt0Yyoji6p1b2yOUjFAfGvlIqora6cheTBuNq
	 L2WYn96O0KDLExdD7MCWm4kIiZNjolqibt4BpJKPmO8JJK82rY/HkaJPmr+NlbewkkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UH1KUtVs;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C570606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C570606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UH1KUtVs
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f33df08eso4317755eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793071388; x=1793676188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O96wME59YozreVoXYue1ZzVmrJOWE9hKphAow+pyRk=;
        b=UH1KUtVsBuToM6dN/LDpyUAsinNi/0hmw+yALJaM/xo2/H81N7kRvmc/iJy3vuXNsq
         pT1yNWLRB33XNd99y9YgGbe1PU6Kd32yNnjPS1AHUWoNn3wB/1XY0aiWs03HPEZf+mf/
         RHdeNpSya40aN1rcGaeglBgCKsMIGyVBxP62UpWYqkTG/YH2YVeyt3/ee+lC96sCniY2
         sRDkhwejK3a4llja6e0vKD15iMC9q4MugNTE16EWTbS01qc5ZV2HsM2vH0cjvsjxSkQO
         CNNcE6IENd/eih2XPZGMYt2YQrgBsolFcBxXuMTREpzTpSM22KCHvkD+rds/jKILtOhc
         Ileg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793071388; x=1793676188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4O96wME59YozreVoXYue1ZzVmrJOWE9hKphAow+pyRk=;
        b=DSun80MLKwbOQMIST/A//lhH7HeYgblzqLgI+BNYTasF5VPGpZuCgq5zNXxbwTbjlh
         +nk8Z3EIeUR1EKp1TzUXM3AZw2eadgKwKu5H5TLRX2jhb1aIeHITWiNvhdUihTfEjxUW
         3wxBam4m0bMCbqbRoIe6ZnJ+joMKm1kr9OisF/tFF0+HeFTEUrqx6x7MU6TVO7ux/E7M
         o6TntOxNLWsTuIrRsoGmaxE7Vy2lWz7YZoRU3Lx75FiydVAGbTz/duKaRt74YrFgYl13
         nFFGdeshDaaISveVfOsoO5heV23+6MwCrL1xH40hA/qsCae8PeQPRMb/dp/UtwJ7s0mZ
         +SrA==
X-Forwarded-Encrypted: i=1; AKwUvBzVKRyR9elY/O7PM1SsvK6q2oI8CMQsMOne0PKCUZvAO3C9RZVoOkxNC6hw++QgBRk/8tqpVqVl34KR6Bg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfqfY/keveiCMK6QVKIEunm0k5QpAVOumuQ4zWB7ikK4OIErln
	TSLIhAU/2OZRl7wpe38MR7F+Hlhyuko2Rjpe75CBk4Rk57CR1x0FcCQb
X-Gm-Gg: AYBFou3YBejOeTqkg8cHynGvP17Kh335qULQImu5hprAoBQwXvDg9eZERSP5l8/cV0e
	b3tNH6NL9PVJw1QRI5mDOhosF41J2Cd8bibklGWT0Zxe0hiXqnCITnRhPJKYt4pZ42JCiJK7tF6
	UqWOnj96lvE41dEIRrA78/vO+xTtQ2xzrbKaSXbwKdjOv8lBz57BX9JyYpC3xw+4sd4ywFAvZdo
	QqKDZZXJeAnIrUu7uN2H+xL7NSCNxFSAQs2m9+gaEFh7Wi152xzayL/s00d49+95O6hfP7gapB4
	m1we6xdjSwkRvejtGWqxDMT4cGkDmBibeJg5tmBcPNgwgjqYDJBEDdPRGIIHvJVj05cme+80xSO
	fYB8AFom0LxgYm5VxMHcmO3ut9U5R8gieBdJTBY6dIVnF+RHJPanl/8qFFAhZvuPHSD9noz/gy4
	smm8tS5VvjXeaaLKowS8+MBpkTHvqhd42OT7RYWIJdpra0nzQDHlQXA4H7s8uaQ/UF4Kk3B7TNk
	aABeyWI2iB83NsnIdAOEAfY8zF46WeIXsKEME7sNFddKLoDAsxKvUJeKb49
X-Received: by 2002:a05:7301:f09:b0:35f:b0f:d15c with SMTP id 5a478bee46e88-369e867f95emr11035597eec.39.1793071387520;
        Mon, 26 Oct 2026 20:23:07 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm49373826eec.25.2026.10.26.20.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:23:06 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Pavithra <pavrampu@linux.ibm.com>
Subject: [PATCH 2/2] mm/huge_memory: set the mmu_gather page size in zap_huge_pud()
Date: Tue, 27 Oct 2026 08:52:49 +0530
Message-Id: <c872f6fdbabe92c1171f3b25448e15247ec34a21.1793070429.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com>
References: <97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com>
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

Unmapping a device-dax mapping with 1G alignment on powerpc radix kernel
built with CONFIG_DEBUG_VM triggers this warning on every munmap:

    WARNING: mm/mmu_gather.c:176 at __tlb_remove_folio_pages_size+0x38/0x230
    NIP [c00000000063d508] __tlb_remove_folio_pages_size+0x38/0x230
    LR [c0000000006fb688] zap_huge_pud+0x1b8/0x2d0
    Call Trace:
     zap_huge_pud+0x170/0x2d0 (unreliable)
     __zap_vma_range+0x1604/0x1e20
     unmap_vmas+0xa0/0x1f0
     unmap_region+0xb0/0x130
     vms_complete_munmap_vmas+0x120/0x310
     do_vmi_align_munmap+0x1ec/0x240
     __vm_munmap+0x148/0x220
     sys_munmap+0x28/0x40

To trigger this - it is enough to mmap() /dev/dax0.0, touch the first
byte so that the whole 1G is mapped by a single PUD and then munmap()
it.

PowerPC needs MMU_GATHER_PAGE_SIZE in which mmu_gather needs to record
the page size for which tlb flush is needed. zap_huge_pmd(),
zap_pte_range(), change_huge_pud() etc all do this already. However,
since commit:
  dbe54153296d ("mm/huge_memory: add vmf_insert_folio_pud()")

a device-dax PUD maps a real folio and zap_huge_pud() now hands it to
tlb_remove_page_size(tlb, page, HPAGE_PUD_SIZE). At that point
tlb->page_size is still whatever the previous user left behind, which is
0 for the fresh gather set up by munmap() and so the check fires.

Fix this in the same way like how other similar paths does.

Fixes: dbe54153296d0 ("mm/huge_memory: add vmf_insert_folio_pud()")
Reported-by: Pavithra <pavrampu@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 mm/huge_memory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bd44d58e8684..7e589a2fb02d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3040,6 +3040,8 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	spinlock_t *ptl;
 	pud_t orig_pud;

+	tlb_change_page_size(tlb, HPAGE_PUD_SIZE);
+
 	ptl = __pud_trans_huge_lock(pud, vma);
 	if (!ptl)
 		return 0;
--
2.39.5

