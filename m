Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497537;
	b=C1nbblKSffJ95rv85j4HWkl6P9N3V21O61mfJED8brG7QNHT8HRBp9XFllFgaAibql/+
	 WL9BHx6sv1/LBc7AtH/WdUClkzkSsS2GkzHKhYivqOv2S2lBKN12dRbvEyOoe2YYb+SQ8
	 iqH86ebSrQdsmbY0iRs07349xcxFBnBU8l6ePd7JdLoCSUPKR3tsE9eiF2WihcN/HodZi
	 TdGUiCtuIfn78JoMWGiq1IvvIWENUsGwD2uzNZejc0aa5qSCbFRlfbbCGToauyp6u/e9H
	 eZAwrj5n8YuTgbmA9LDX/kv/QzJs0IlExhyyBQ6fB4bWRleT2dBF7kibR+sENwtzhQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dTNbLYZNYoZPK2Bg8RLgUq3mJiYqux3Sp5looZ8MiV0=;
	b=0uumRL7hbBcYS903dqEVjgw8DbZDLRqDqtdDmsBnpadi847rfjxiCqAMgjM1ROloLxU8
	 KErwHROCO0GAWd8pPMUoMUTYm95U4cBT5vAkJg8cGTQF/qxAAKBb5z6wyUDOjPeRrjxRp
	 x0uurwLGVCn4O9oe+Eqzw2uIZ81xdyx810McHL+k0JAggY4pbnfefnmLxLuT3l31I3lPR
	 kvyREjGDDlczTgehCbLCfyXyCo7986dLWI8/D07Chu2OfyPJz9e2mc/ZuiVzf8kIR4khv
	 4nNviPNz4uoIGaU1CV5N1zf6/Bc7LHDuqvCnfrugCO5MfGJ4rMbCq0NSxQWLpmrQ0gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=NNA954+Y;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212960A3801
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C212960A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=NNA954+Y
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1514147a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497536; x=1793102336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTNbLYZNYoZPK2Bg8RLgUq3mJiYqux3Sp5looZ8MiV0=;
        b=NNA954+Y5SvaZLXGhiF6EsoTjcGgkiYFmqroLfWUj+l+5qgEFb2zI2sApo+iWMF6do
         rDimu2Fkxcn7ZNsCTFwv4hPoOZwg648yB2gUnpQtj/27Rw87z6dLWGyJoqTQY9azD8iQ
         yR64kOKWN5hN+epuLLiUbdNZ1X46m3hcnPNmSH8uaCqGUFrf7vMvpNau5jUKjdq+k3r1
         5Q0ECkvZICyRq9jWQ+BAwC7lodc7DCfhMlVlb6C5yrbq6hk0U02fRy+B49YFoRPi0dVO
         BO7cgONd0GmH1Er5vgczWzDLjilk6czTWcVno4atW2BPiRJDV1Wtzs5cWZF4DFGjzUvb
         kq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497536; x=1793102336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTNbLYZNYoZPK2Bg8RLgUq3mJiYqux3Sp5looZ8MiV0=;
        b=xGhhVicZKlmI6wPsLUyASk/k85eqMBqbqy72gBRHWOWSp/lpRng7zrB40Z4+3dR9go
         ycb/dzsWaR30u9buNN7mZ+qkn6H/J3pBEcEsqYv30IKn/Tsww972/TSlsLjFX3kq2E0p
         dTeXWE83YBLSgrZcsNX4tGrwxZVjgRHTQgOqHz9QrdhY/4O5A9hF0SoI0KfABlHAhwAl
         ukjj3Z47FGEY6NhUf5V/OBzdUY6uLFd7n/dRE3Gj+9DQIn2b8uerNNF/PhUv4a7ir2Gi
         6QlSNeL7hB7DzvLvbovUx/YqefVfleVdi7b8zp2xEX53N446xIL/tUKxCFP3MmiAHt8S
         yfGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXmILTgreyX+zNkeL80iy+UsgAtrt1VnHhBpFovRdnXXsCgw13iXTCnh5mgr6TwQxBs9WjAT2KffNmQmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKL7XBguyolzb99W8gLxNptASa6Qc/+lg46poD7fUHLyyM0szS
	w5FGSVkBcRrHrvtvCyneOiyfyPRR2Wq3ojm468QyroHBOjquSERLjAKQgN9njn9s4jg=
X-Gm-Gg: AYBFou1A5nn/D2ldGhFXmpy03ZOaLm7yBzFehLPLFRf3TR/w0ZEBoG4QuSQseg5Ayf4
	rsHn4Lo3AI5X3EdXA1vrVObZeAKxbUPgX1EquBx4EKYu7JyNvN+E9r4xyafviigWVD6B37A32Ws
	Br+o5+ZFaj/5XmoIdUkWQkY9ax6AzSFfuRJo5cKqTpQoCLGxCi7tEeUZ4dVZSE18bw11h6xYXwQ
	FSEFotL80bqjVJKqP1Zw91A0vfiwxnEEwS4hFhOICz8s1t4CN2uesHmcDdw4f6sCD6sqV3Tcpf9
	/HId1NP0aTPaOci0z0K5OoCjr+ReMjEIbQ1pF9PnbImFXU9dAAWC8Ald4FxWfwI3OZcK7ovROF+
	/fePdneBhWWMQIXu7gzXLM5kCgx0eNvclGO6miY2QzJOTJM566Zujm8h9MuF2sBe2cyitIPUrF8
	t7xc6/VcIVZeak8AxJkZJ02JTzBUq/KvTOPGmgCB8wnduFRIKj1m4PfU4HQY3XfNisZTGvPvM8y
	gKnED9G4XG5BVA7ChqYmeBbFFTcRAGYyXmWln7eARc0UZ7LFRdw9b6oE42JyjusxW1remrD9pug
	7Q==
X-Received: by 2002:a17:90b:4a03:b0:3ac:6e91:3f14 with SMTP id 98e67ed59e1d1-3acef134d44mr10171363a91.22.1792497536105;
        Tue, 20 Oct 2026 04:58:56 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:55 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 08/12] mm: hugetlb_vmemmap: move alloc_vmemmap_page_list() next to its free helper
Date: Tue, 20 Oct 2026 19:58:20 +0800
Message-ID: <20261020115824.823278-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
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

Keep alloc_vmemmap_page_list() together with
free_vmemmap_page_list(). This also allows the folio-oriented
optimization helper introduced in a subsequent change to reuse the
allocator without a forward declaration.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8fac61b7d74a..89f000227d4b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -197,6 +197,27 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
+static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages,
+				   int nid)
+{
+	LIST_HEAD(local);
+	struct page *page;
+
+	for (unsigned int i = 0; i < nr_pages; i++) {
+		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
+		if (!page) {
+			memmap_pages_add(i);
+			free_vmemmap_page_list(&local);
+			return -ENOMEM;
+		}
+		list_add(&page->lru, &local);
+	}
+	list_splice(&local, head);
+	memmap_pages_add(nr_pages);
+
+	return 0;
+}
+
 static struct page *vmemmap_dup_page_from_list(const struct page *src,
 					       struct list_head *vmemmap_pages)
 {
@@ -323,27 +344,6 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 	return ret;
 }
 
-static int alloc_vmemmap_page_list(struct list_head *head, unsigned int nr_pages,
-				   int nid)
-{
-	LIST_HEAD(local);
-	struct page *page;
-
-	for (unsigned int i = 0; i < nr_pages; i++) {
-		page = alloc_pages_node(nid, GFP_KERNEL | __GFP_RETRY_MAYFAIL, 0);
-		if (!page) {
-			memmap_pages_add(i);
-			free_vmemmap_page_list(&local);
-			return -ENOMEM;
-		}
-		list_add(&page->lru, &local);
-	}
-	list_splice(&local, head);
-	memmap_pages_add(nr_pages);
-
-	return 0;
-}
-
 /**
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
-- 
2.54.0

