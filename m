Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101108;
	b=z1GPh2i6IWcyp06BE4sHUadzlobfDqb45z5UhAeNQBqjUTR9kjuWRkdsezN8Wazv5Obc
	 P/CHR8jiHRnmTF3gN9W22pZB6PuAkN4Xyq77PtdQLaDI/LWu1ZD8xaYB8LLJEEmUN75WV
	 MxWffY06XloJvYz1NJVxxgX7FtSs8xc+jMJWDuf67QJn9oJAEjapm2QqjXyYKl3cDxS+U
	 HMBPDrCd67WLdJcTajGXOQBW/3bOvAVYdREVByZLr7dYR5KMzOVoZAGFhjJVS0AekXZYv
	 Vw3sQire6LkdjYoVkvwZ1HMr+OUuQIyrKrHjpxUMjU6f/lEaLoWbE1t30tSYCaTiINA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1D2kUawMq1dXWdSc2yAkzGxoxbmuMLiDkZI38kTQA1c=;
	b=jXBi0b1AySZ4MR8xfKrQDccsQNIFMNu5bhJ/KMiJyTIWlkIGFPDqGOV3w1gIt/8UjmKd
	 sBW5fd7kFKHzMXm5Ibr8WVQpvDG/eoAwa/HGnzxNkedw/fu1vkmgTrZsAsKVFDdLyfpDk
	 Ecib9gmYH0h3FLAmHH65FrNEwHorGFTlvFzplFFgEwu9lWNklkWiLdYKuolBdHfB+UOm/
	 aa8ry1RDVFLiVIcw2LR5fimE0M2tHX0RZhzqWxmTBnExwethYqbaLMFlFDlTfV/mEeM99
	 XQxL558bgLcyBtRVECinhVr1hify+qNijEUnppC/B2dUCYLIfSSGKRx4gnpq8uvEexw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YHLGqST5;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E9F60A2611
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E9F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YHLGqST5
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c322cbc998so597673137.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101107; x=1793705907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1D2kUawMq1dXWdSc2yAkzGxoxbmuMLiDkZI38kTQA1c=;
        b=YHLGqST5CTNXY2BkaTYOs+DimOFOK+jWDx1cA60ab1C6Q9cnqywdqLllXSZQTwmIjM
         dVQTEIJy/Vod84g03fuWXV5XzIyhLVMcl1WLTXUr1u+iwKPF0afhKCMtKooHvTjlBZpB
         RL+pQSPbLTzJzh9UQGjjN+LBTQKukC6z/Gpa6ORO76TdzoGl54Qlchp5v9tudyuWNmcQ
         h4yE8jSwAgJ9ivN4IW6WPapQuFOH+m3TMhyyAZdznEkk5+lWDSrA6On9lpnu+VrH07tR
         k7EuHSt5hCuj6CH92iJXoDV+8DkO1FV0sgcjNbXp4qVYygVtEYBh29HRUaNZAf7ihrOZ
         X0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101107; x=1793705907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1D2kUawMq1dXWdSc2yAkzGxoxbmuMLiDkZI38kTQA1c=;
        b=mdaxA4hz7J6UoW1F8tEb2uXYzGOnYTwhS+sbUxsU3GOTw0+MuadpBsW1Ew/lwFpubQ
         MP5m8HyjOqG20k8GzLMxFd0AErBMfgrBcHenpwnp2Xr46Y8dc/vsgRJkeaC/XNwLYpTz
         S/h2dCIqlCWm511gNG1Cu3YBJjsgyRCS+CXaGfTJLWEhyskjSi42m5YvL1hOeWpCiHPv
         1Hdfmwe2OQCrrlnkUWaeXhrH9TEtDxnVKSQBzcOgFFyzBZWymqkgYHOkpQDZNxs0g7Ed
         DZSrV4wqeF+jkWGJBc7S4HJr5P/xDM+AH1RoiTL+dvEfoimSY1kOrzzbgvQA8ckLnqS9
         Yaig==
X-Forwarded-Encrypted: i=1; AKwUvBwqAFTCs96inBPXpSRMlAtt7gQvmAj60okjXmS5Dr8qV1eBLw+1lmSngmWpL4PeFMMP06IR3iIcC8fLKsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL69ni5A9MjGWwRy7Ik10Avzgco0cBf9zyANCyXctq4aDcXeKOK
	cBBSaZIlmcLpjObKvc1iaUT3lwTqsNPz8flu8Phe8gFsfxz2B451+/i/
X-Gm-Gg: AYBFou0dXzQ+z1QJuLLaoRqinUZ8/FAYyiqQRLoaYGkh+AHQFbY0+vS0LfmKEe7/HZk
	5t7f4yKvEm/Mxeuu7rvFaD0DWfBaB2Pn1P208bQatz3kQEaExzYX9RaP1QjteQ6shSxX69NZpm4
	JAMNgTgbmiBk/kNb9Rt9pvOkug3OpfvgdDEJx59NPvCDw6q3PpvsC8I9ITDQgBFY9qeTzI3mBqe
	MYgyA1xTm2qPsSNXHYCHuOUvcXLhEtLOijJ1B1wUu3auhvPFHn/KKe+D5smE/p7zA2iz2+RZlBH
	iukZfoqGzyomoU9sh6E5h+2WlNR+BKi+v3If9RbiKAWhfw4wDtDUzykyyfYBBIGrJswR5pedl50
	TI6KAYUdiSbjoJxpcw7FHuV17Drvl4aet/vWPEU+tlTbTQSxCWEQNw+Iez/D14niN1GTjo8mnYd
	8sYHDEwLmXSxogbxvG7ZBa7RL/lCHbwwBINFqvnPkUeyxPKFATUU2ZnNB5mKILviycAiw2lImW3
	PMzeyNJIH2X0dNqkEOzSgZDelbYRHEx+ILc6MSHEwCajI6J859xNYsdgyQf2cAa2Uh9MtcBeCG2
	wvANLTik81tykdypf0nrGu1mhMdCyZdLgw==
X-Received: by 2002:a05:6102:689b:b0:7cc:21cd:9b68 with SMTP id ada2fe7eead31-7ce5cd17515mr3402829137.15.1793101106726;
        Tue, 27 Oct 2026 04:38:26 -0700 (PDT)
Received: from fedora ([187.120.134.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea367d328sm2234678137.0.2026.10.27.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:38:26 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: [PATCH] mm: clear pmd in pmdp_invalidate()
Date: Tue, 27 Oct 2026 08:38:13 -0300
Message-ID: <20261027113813.1332096-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
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

when attempt to do a madvise in a chunk of memory allocated by mmap, the
folio_split is called to split a portion of memory, and despite the path
leads to pmd_mkinvalid() they do not clear the pmd and clearer wording,
leading to a BUG_ON inside page_table_check_set() because the map count
is more than 1.

Call the page_table_check_pmd_clear() inside pmdp_invalidate() generic
function to ensure that the pmd will have they map count decrement.

Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 mm/pgtable-generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..7fa5351c75a0 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -203,6 +203,7 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 {
 	VM_WARN_ON_ONCE(!pmd_present(*pmdp));
 	pmd_t old = pmdp_establish(vma, address, pmdp, pmd_mkinvalid(*pmdp));
+	page_table_check_pmd_clear(vma->vm_mm, address, old);
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
 	return old;
 }
-- 
2.52.0

