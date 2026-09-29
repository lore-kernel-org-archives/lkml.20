Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09333C8C62
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660041; cv=none; b=Nl4pNvIJdOZamqxvCHwrMoYMH0nQACodP+r/ZiDyn7NZVBGzzfxBH/QFeFhLxXDnG3/noD8i0b8v3Rim/+UtNWIm91uWoMR9/xWC1z00H2V3Mug0VnkHNwn0dZJkHF0RRzqnKG9jDC4YjiztDtwkXzHLWVgYU9alAxWsN0T+WQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660041; c=relaxed/simple;
	bh=4tjin2arzBxb0No8jiATaHD+mvUM2mFdrrpGQDcez+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4Xg320dFHCKQWoej9DGYgXfKZVkmQOMAmDHf5vHmAUzpuvKDFdewBBsPDPWIVzXQGGYlLfmklyDTNrRZVwm5XO8SvfMBxLFQD68GDZNjyPdk+4oxnEvAg6k/iSfjGyRhOkEkf3Nmjmzk6+fjc56O4pApnCywNI0PBSk5FZwsAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VNDMWM+s; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VNDMWM+s"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso15954085ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790660039; x=1791264839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIKIMkYuFOTq61i+iCqWLdJrE5c2b5L+SL6VyhrzHK0=;
        b=VNDMWM+s5gBo4GKR+m0hXZ8y0SB+VRPQa0woVHBGtCQSWJcnsDrzRtnJiaOjGoMFzp
         KQ0EsuBZp5TTstDWemrePbwZSg4XAxSZwihFRVqNq/GMGlqb7U5t6xCLkV9H/eAHZDXX
         MdbM7sA8rSNi2CQ6SD0HEMkHnaXnYRu8MCGw9TNWkvuNYugysuSm+sH5oo8qaiAB041m
         zWzGmvMm3/LkzdZ8L5JFMBm9DvTvVu/yESJhmv24otn9w4rDTjIvfptRcaS1RHE+EnPk
         qVangFI5gsmAEdcV7cBSdu7FAVgBWHbWNdbqaO98yMH/Z/1m10OXYYZMAmC//vy9U3ZO
         Dpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660039; x=1791264839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIKIMkYuFOTq61i+iCqWLdJrE5c2b5L+SL6VyhrzHK0=;
        b=Pb2C8946Rt48AXx7LXufpYoEeobHPRPAM78DcajAnKsMuxpFrLjBwc68gq3F1/H+CZ
         SLkuWz4eN3m5u5K9bImZ/hNDAXURJ6r1DMxSvi2TczzBujDinN3EZf2ufg5c1+h0S+DU
         034Q6cigq27z3oCCFQGFCqWr45Dp6czw4G5JQTf9HNVN8309lYGuocQGeZm1hLY73duw
         wfEKtTo1uf8L1GXl3JF4pHhTSaqjl6sYqCVzY1dMQrk9V6dPUPkHU7KOAUndkgNkntVm
         OMdEXN4ozgI7wwvZtPJ3ClZ4w4j4JpcgPGJWtM40zExVwu5AdlhoLhiG6XGdTtterK+0
         wkuw==
X-Forwarded-Encrypted: i=1; AKwUvBwXvkujlQSlSC7r3upXoAmvZ/7r/GqIZwIyThWTcI6v4ncru6qRZRVw6PamX8hBkl0A1HTalti+/mzX/fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIgBZmjoYkuIsGUzsMiWhdIszglmCHMxHyuHyvzHsSnbnHx3xw
	BumXv/Q2PoBAs3+C9CwjKCkKBi7019qDt0M9XDuwMqJ/6YGRtixXF7QWJZS9eHzFjiM=
X-Gm-Gg: AYBFou3dueA1IpFf4IWGZT0srWP/ilutjdU2MAmEu9yvxFf1vxH2izK4pLewb6dKG7N
	shlXEg6dPrv8bK7NA5pMTiCzcgOKTtA2mb7880U/gPe0vXn3xSGAv0a9NqRIciwINv7TKUKPpBG
	wH/mBgoOTIBartfFAof3VQqbLEV9/Y+SvqX6GL084elwNZyaCffC3bkn88V/P3UNWulti0Ltkt3
	l4cNoTOc6MJJtV3nMAqOrPkZg2wY0LhYZAcpZU3eycglqCtBD/HDYxoacu/v55AA10EqgiOTmT3
	gBj0/yeBQC1Trz56k4s23sq/Qdwk9skCRAEID62xgbpJyiY+L8MNL9MKMMSCOeOMkedOb72KAyK
	cOlV28MDPMhhoKGW6iGw+Hl24xWVYjwntQuiRB32iZ5UR4e4BfbahRnf5N+LTCqdqT3RXTlekIx
	6WJBNUaXB/9Fm49mCkvlcak6tLsJXEfk0Yv0RewF1DyESxrkXNE4nPsFwsujAMDPUmHFbZeWdEs
	CGHlS7H3P2kG0++/gHsCLE+Tlv4mQ==
X-Received: by 2002:a17:902:f710:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2e2c937e018mr7110035ad.0.1790660039331;
        Mon, 28 Sep 2026 22:33:59 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm49251765ad.51.2026.09.28.22.33.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:33:58 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page init
Date: Tue, 29 Sep 2026 13:32:31 +0800
Message-ID: <20260929053231.66085-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929053231.66085-1-songmuchun@bytedance.com>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For vmemmap-optimized sections, tail struct pages may be backed by
shared vmemmap pages. Those shared pages must carry the same page zone
ID as the struct pages initialized for the section.

Warn in __init_single_page() if the shared tail page has a different
page_zone_id(), which would indicate inconsistent initialization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng

v2:
- New patch.
---
 mm/mm_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1650d6bc1211..bd02e8d06965 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	if (!is_highmem_idx(zone))
 		set_page_address(page, __va(pfn << PAGE_SHIFT));
 #endif
+	VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
+			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
+			page_zone_id(page));
 }
 
 #ifdef CONFIG_NUMA
-- 
2.54.0

