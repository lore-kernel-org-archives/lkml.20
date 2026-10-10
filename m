Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B79400987
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633337; cv=none; b=g42+SzzOD9N+5CNqs8Gp30Yh+1kz+7TdIEOs+wlMYTMiqDjH5slsfFmHdczSAZaemgAIO9oBSb/klEnkiXLPJIuuU+21C6JF3vN8puCpb+b6lunoq5NfAvBgrrbYKZKl6yog8LH9R7Nh2IDQdftfAorP9W8BLH+457bXnjWT2J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633337; c=relaxed/simple;
	bh=CgJGi+r8Zn0HQlnLBTlYbEY/OQ+fmOiyZD0n0A4qbSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9CcdVqqYrhE2oYtoNe8u5WfiyqkrSdLAcih7xaKBNq++z+9ULWYP6byoa1xngrFITFAyuKbKTqctKSi0FiSKcaNDay9oup1ihtyRyo6jqTM5XQAWmZBPQKspJCYzT1bKVKpRaAZAnBNohpqzqGHFu9vOZyK9mNOYdbNExu4DpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OQRv2ISS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OQRv2ISS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so275388a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791633335; x=1792238135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4UPkDBQVV7L4PDyWtNF9o8eWvpDhSzjJx3UHj11yEY=;
        b=OQRv2ISS0T3VhyDweao/jQBg1AswtaeHxNdpWqLLZzWALFU9G9gBrGnFipN/YMybif
         HgpCKFC1oPGUua+DN9fgOqtug+vaRtA6/sGrAQvL+U8RJPho70GLpVftt8EEhf11ZZp7
         kot7QjadjCtdOJhu83XUr10mOE5OFEFLc9s+lMeAhqrqENa3czoNNaFIalb49XXSF0FF
         ZVHUtnLzWIWiqZ4DPFmA+eYemUhwgwXpgJxssj1F5ZWqHV2mVcEYMMvqdL6Op3L2vwZE
         vR1y4kvfrw0BNhujxBPnJaB8HbC/b+WhQNc54R74VD6m4dTDCedx7yFw9jF3EF+EE+N3
         yfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633335; x=1792238135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4UPkDBQVV7L4PDyWtNF9o8eWvpDhSzjJx3UHj11yEY=;
        b=kjTx5SwiI8LCYj3y8Z+Jqmppv7vtBQVjbyeNYYz8SIObtZbBevl00mLMqYi5qLRMgG
         xhJBRHews6erxBTqDkjBKpmP0pKJhCuFGVtyZcTnKSLjG8YTFhzTKvyJ8uwHkKuW4gya
         K7eWIyOIL34KCZDNnyK7IfV1GK9WGgr+NXc8Q5T74ceX4FS7UGG8YfHQ3AIf6TaXoh6u
         SwvSSI4PAm/RB2zvhiogCUJVYwQIaWfqdqKZ5MZPzCQ/M4RVZClRpxwdrxEnhfcAM4BT
         gg9LoDvmuFTA7ZHdWiLP4JnqSNxQ3HOU+m81I8Fh3gkS/09CPbHGR+hDgEFYPReUIlrj
         tZCA==
X-Forwarded-Encrypted: i=1; AKwUvBxPshjZ6DyeapN3ktNPd5Rdkx9G9HLaAjZmgxirMhgPGAZrbm4masT7RdNtOtCyYNLIQNqv8ytiNBr4AIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh/7aajGVugeLrCdhVgEBTvUq7wU1fO3fzJ8ttY0v3kJBo2WFa
	ReIkt6Wy/JQz9IIYiDFOk7qwUVJoXJVy09pZi4/5Tjrq0kK+I+zP+iGvYl3Hn2l836Y=
X-Gm-Gg: AYBFou1Ye40BaGO2Ek3KDVjZs4cGb9Cya9skJoTPagsh6d7Xo5KRLBrsV00bLfhGrg+
	l6q8taSsJtIDQtJ8Uq2wUWK7yQm/dsBR63MPWE43aqsl5E1PCQfkcIFnkITHul7J3fTvLKGFWCP
	IwWiOwcr9N7i3b607jytw8b4Qtl3gZ7KbKbaUkOgIYtfrxjhiHdEaNwRMlnStsY7BasD76fApmQ
	EkuDxMDnaayFN2/0q4AGwoTQWoY1fkIu9bP133yg4iQd0M23CQ7tMmi/eeIF+vKedgDsjZ0Eh47
	etvcpwnMHBNCE3DzdKTs34YPDUCq5EW3sdnRHQ3Wm9LD6V0HilEJ1drun3mOuh01JonZEyl4SkE
	94O/ohic4/7NrwJK9ouK4xMN2FLF1DwR7jy3PoNkaq38wbKR2pAk+wJNBRozNL8We9ylx1kBMXK
	QoCb6U/6marulupZu5jMbnk4wG9AfSW1qeUCywOPvlzaN05NvpqzZwXx/8H9tzSR8eDfjYQzX60
	B7LSe64bQE10upnOZ5M
X-Received: by 2002:a17:90b:2d06:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3ab3ad0e976mr2419519a91.43.1791633334534;
        Sat, 10 Oct 2026 04:55:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm9813293a91.6.2026.10.10.04.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:55:33 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH] fixup! mm/mm_init: add zone mismatch warning during page init
Date: Sat, 10 Oct 2026 19:55:23 +0800
Message-ID: <20261010115523.4005071-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010075755.83339-7-songmuchun@bytedance.com>
References: <20261010075755.83339-7-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ordering of shared and retained struct page initialization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 6deae33db882..4c17a892924d 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -618,6 +618,10 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	if (!is_highmem_idx(zone))
 		set_page_address(page, __va(pfn << PAGE_SHIFT));
 #endif
+	/*
+	 * Shared tail struct pages are initialized during vmemmap population,
+	 * before retained struct pages reach here.
+	 */
 	vmemmap_optimization_verify_zone(page);
 }
 
-- 
2.54.0

