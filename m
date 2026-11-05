Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871388;
	b=nEtXeC6PeTBXG1HX7hB+M8k/7FmbVQvu8IXlnrA9JtVUQCCi4XAC19nNmwfof+XU+9NB
	 S1PnKvzVNiB/dw4BYOJvlk93RvAYfCmIMf3D9E7sugFBj2oN+Ud2Aa33X2FqtkJ/Cqm8Z
	 KpKIfKHlMDJ2EhiYPeFzWZljhHka1mXfiyMdDE6768VA7TbQJr6eUVK8XycbuSHfxFThe
	 Rwcpbq8dxJyQoriguIDN8CfcRanOpbuYeouBhQ81oaO+kcLxKV1AZwuAnFRlaxCjOargl
	 fhoNaghUhNInRaGCamsgAVL38OBiWB/phy7gtFHwTGYZOJIvwx08ayCqa7QTZqCzUgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4KJTaDWQfowBpNKiHyeX0a8ZzSqnSx/3I5gx7OWVH6c=;
	b=W6wGqsdsZ2sACBOcbTnf47eGfdccm2xB8EvJBDd7g38Q4EbZGl8Uc7oXwAncfbdKF6Lq
	 7BLUoHXSsgyBOQPnPxfrCXFUXldssrWqjVLiyQDA/1BOXw9s4UUWUcWyO4H+ojY0b3n9+
	 ESRvVFiP/dy2sLX/6Bdvri0bRNETVMJITEbTH0dLI2Wx/+pz19gj20xAoApAtXsaM888x
	 dnQiU9n0P3gW8hVe8Ip7XqQa0CNzYnIv3UurdwcSE8v/uepm07/zs+bDEctIo6rmUTW/Q
	 Zd0WHTuL0eroOvDjhPaJXYXnbMgmKzrR98ZGe1JmZstM369lqut2lqG7o7QL9imRgEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LmVv2yz/";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E950606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E950606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmVv2yz/
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so2987511eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871387; x=1794476187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KJTaDWQfowBpNKiHyeX0a8ZzSqnSx/3I5gx7OWVH6c=;
        b=LmVv2yz/U/iitjqnf0ntZaDdx06FFYpU8E1jMWKq10rTidJKkCLK6H7bE4C/XedCrq
         mRULmcrGzO01O1k5eFACyPIXa6VLNeCpdSVE95gJ03MrnhC41SiD+AIK2CUUmYNOSGFI
         K4aSlS8kMkhPd1ISnkWAsh645+jowTpn6xOmDWagAeCfdVswZkvzhbsfrPDAaGnNj2ue
         7qxTXvFfcvZe9BZS7L/6Erk9nnWgFa2l71JbKKVTsK/b7OU/75n76zTMklm752TWzsic
         J39gBMxk0qRIuRKd96qTvuWwpd4DEKqt4MOOD3EVmAQPs/fQRdtgJp3fbIr6T4gHpiui
         B4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871387; x=1794476187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KJTaDWQfowBpNKiHyeX0a8ZzSqnSx/3I5gx7OWVH6c=;
        b=U9G1m25kyOK55IYFGEEJSp0FdfG3CShT7tBwbG5iQdFfQVLg44BA4uYWfyFlkHNOUD
         FfxXN6uE2U9x16W9YzUHYdttlWn4vwZ0j4ovPVQzg4pu6sCQE5FNC7xwr/FWjtAq+YUt
         F6tSvt5Ak3QUpdpelqb4yZOqjuFiqyryOj3mMxRLO9VWNWbq0zJp5mA0vtAhlJ4NOvK0
         9ozyLH37C1tL4Tf60uK3ZvOBd8Tsp8kJdBOX/dMsMCHvYUW0HeVoOW37FdkG7kgd52iG
         D7MOgI73DYWepHN1zqV9oO9whNtOf/16Vzg2aePsc/uD0RAhD8iTTTWBYp02Q1k0K3Oe
         w4OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT9DTktBSX3HT6OE58ahMJhqMCs/KMl5jQ6PHFLQxon9z1v/IQaGXHwCVTu6NDeNX0OChl3fUyxeZnGRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bbu6z/O8qxTx7ST9kJ5BdJI54mSf5kPeKtPZam/O/mHwTJnqa
	nJvVjmgVgGkB8D+0eUYkwZSjOwCnQbyqanRVdWaHeVbXk7C2yLhsrLM4
X-Gm-Gg: AYBFou3YTB0s90i3DqOJGuc12Y/A9oL29wyeYWFpo6Bs4XjLeBgxxQQoVOLU1fGI5W5
	jQYkq+gFXMkzA6sCkItuMVrip0nMfwmHToowY3nwdB/XHnqbeVMJIfX5NIGKfwmYGt28MX9yHXh
	gfY5CcGv+pFNjhjoEbwIK82Ix0fRMSPp/HaPtLjEU2Rl+7xh5bTCslXI/4VELuwK0G/aMCnuSOn
	/zgO/lbADmEpJO0hYIv3+VtDmrc8HqmT7/laUC6714WyErlEoSvXucmJ6HlnzRiaq+HCQ7LzvzZ
	yW8D8r83/aoSROST0TnqT/ysfkQYqrpV6//epzwbM/hZSIxWQBsd/6dwRIQrnO5jKeWFav1I3gl
	8k51OmEMN2+t0gPRWxVGN8cu8rkn+JEyqsrHJ0+BNiLc7RWchC/Dp272s5kp9FzHLRQU1mW6Bh9
	RmhWk7w5vYQ86HANn6wpYs1SV2jqB2mZmHQZdtjQV4yR/r0oA3G9r0rSrvyJVtO+i25RUSUIHtA
	b+LZUGofE2CkTAswdAiJVmA3WcHvsAG1MXjlUeGoa2DI28pWguiOQDEobgHtVw1BdDPK9HURufc
	Pp+mKzapg70MWRTEgns+YxqT
X-Received: by 2002:a05:7301:160d:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-36ddd5a4f34mr3326051eec.7.1793871386171;
        Thu, 05 Nov 2026 01:36:26 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17363207eec.16.2026.11.05.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:36:25 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 05 Nov 2026 04:36:14 -0500
Subject: [PATCH v2 1/2] mm/ksm: align smart scan skips with the scan number
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
Message-Id: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-1-8a9780b6844e@gmail.com>
References: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
In-Reply-To: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Smart scan skips pages that KSM has failed to de-duplicate for a while.
Once a page is three scans old, its rmap_item counts down its own number
of scans to skip, 1, 2, 4 and then 8 as it ages, so an old page is looked
at every ninth scan.

The unstable tree is rebuilt on every scan, so two identical pages that
are not in the stable tree yet can only be merged in a scan that looks
at both. Each countdown runs from when its own page became mergeable, so
two pages that became mergeable at different times end up on different
phases and, once both are old, may never be looked at in the same scan
again. They then stay unmerged for as long as they live. Making a page
mergeable, waiting for 0 to 20 full scans before doing the same with an
identical page, 20 times for each wait, and checking the pair after
another 64 full scans shows this, on two boots per kernel:

                                before            after
  pairs merged (of 420)         329 / 317         420 / 420
  64M of unique pages skipped   89.0% / 89.1%     87.5% / 87.5%
  ksmd CPU time per scan        6.25 / 6.25 ms    6.88 / 7.03 ms

Pick the skipped scans by the global scan number instead, with periods
of 2, 4 and 8 scans. The periods being powers of two, every old page is
looked at on each scan that is a multiple of 8, whatever its age, so any
two pages meet at least every eighth scan. The longest period goes from
nine scans to eight, which costs 10-12% more ksmd time on memory that
never merges.

Fixes: 5e924ff54d08 ("mm/ksm: add "smart" page scanning mode")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/ksm.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index dbfb8f98b1892..a97d7563c2124 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -196,7 +196,6 @@ struct ksm_stable_node {
  * @head: pointer to stable_node heading this list in the stable tree
  * @hlist: link into hlist of rmap_items hanging off that stable_node
  * @age: number of scan iterations since creation (unstable node)
- * @remaining_skips: how many scans to skip (unstable node)
  * @linear_page_index: the original page's index before merged by KSM (stable node)
  */
 struct ksm_rmap_item {
@@ -213,7 +212,6 @@ struct ksm_rmap_item {
 		struct {
 			unsigned int oldchecksum;
 			rmap_age_t age;
-			rmap_age_t remaining_skips;
 		};			/* when unstable */
 		unsigned long linear_page_index;    /* for reverse mapping, when stable */
 	};
@@ -2446,16 +2444,14 @@ static struct ksm_rmap_item *get_next_rmap_item(struct ksm_mm_slot *mm_slot,
 }
 
 /*
- * Calculate skip age for the ksm page age. The age determines how often
- * de-duplicating has already been tried unsuccessfully. If the age is
- * smaller, the scanning of this page is skipped for less scans.
+ * Calculate how often a page of the given ksm page age is scanned. The age
+ * determines how often de-duplicating has already been tried
+ * unsuccessfully. The older the page, the fewer scans look at it.
  *
  * @age: rmap_item age of page
  */
-static unsigned int skip_age(rmap_age_t age)
+static unsigned int scan_period(rmap_age_t age)
 {
-	if (age <= 3)
-		return 1;
 	if (age <= 5)
 		return 2;
 	if (age <= 8)
@@ -2505,17 +2501,17 @@ static bool should_skip_rmap_item(struct folio *folio,
 		return false;
 
 	/*
-	 * Are we still allowed to skip? If not, then don't skip it
-	 * and determine how much more often we are allowed to skip next.
+	 * The unstable tree is rebuilt on every scan, so two identical pages
+	 * can only be merged if both are looked at in the same scan. Pick the
+	 * scans by the global scan number rather than per page: the periods
+	 * are powers of two, so pages of any age meet on every scan that is a
+	 * multiple of the longest one.
 	 */
-	if (!rmap_item->remaining_skips) {
-		rmap_item->remaining_skips = skip_age(age);
+	if (!(ksm_scan.seqnr & (scan_period(age) - 1)))
 		return false;
-	}
 
 	/* Skip this page */
 	ksm_pages_skipped++;
-	rmap_item->remaining_skips--;
 	remove_rmap_item_from_tree(rmap_item);
 	return true;
 }

-- 
2.43.0

