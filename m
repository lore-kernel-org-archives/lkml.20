Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117021;
	b=YJPwizbkBbKgUmsQwD2cchPhIBsop2zChOxU4EuwQg2Y54cYRMfGPtEtnwtZthhz1FEg
	 MnPsCT4yiWrCVLFK85/BZFcdZgfTdX0hCgL3VcBtGKnv0d/GoxBX76iWvGMKKPb1j5fU7
	 hN8WbhwmOaRS7TnDmkj2RtWi5Zhro2C2u/L3MXau7fJYPrNLFOecYhgN8a08PBqEHL8v6
	 h2l1YgTl9K0JjLEXM+J1rkzSpd/nVcNFHWLJM3IRJlXp2hNCWpkzZ5kwWZH31LWhVkUYz
	 6GpieIuOM47LtgmmSV6mWTykmCbPNeiWzy9B5JW4XZtJINy2n5/XvZfLRT+RYBFCrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wzW+q10RWKie6Pha9KgepWUrxRSzuZH0wvLMyxYlSms=;
	b=r9Wsj6H19r5MVmlZ+7QqEaFoDaNwQVvU1WzSwhDInTqAjGjr22VMelVRuEW7Qz2tH0Gi
	 evkrZxzrKsygdntGShOl7tmwbe8kHbbXRSWvTwCM95fGi4FBI6VdS37ULOQEt+whkfuHR
	 63kdCdXXWQpF/uZzmHYkVv6BtfcVVUJ/MGvpr3JicK/1ETyNrfkq2cYkjj9S6hAM9BC9V
	 gZFoQosJhedmKOxG2tn0a1H3osrKoyU3vpv+cvnfDOUdfR3bUmijhBHhX1gdbbdevRiRb
	 E5VAXKbeCfode0SFHOrnrI/d0Q2TU3aWucYKQ8RKYYw35Blu/I6Zf8Kp/rlq0mZTf+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhQv5itt;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692E4606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhQv5itt
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso53700a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117021; x=1793721821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzW+q10RWKie6Pha9KgepWUrxRSzuZH0wvLMyxYlSms=;
        b=WhQv5ittd0oz85RgWEF3DXu+89f2TB9Ts7u9GRywla4UEbM/JrVBwau6j1cn/IqzNT
         l1OQsifQxT3KIJjnH8wsBo6UwNfY4QIhrFsvUnLT2MZ0mD46Z6nwikD0b0WLxwaD9nG6
         ISEXCFpP6XZn+iNauWjvY5x4ctpO8xISDn77NL1aUnwAa0t00nrs6h0gdQKOoRgYlpGC
         sd/ahvYHEPTPBLRPyAGGV2gWUQauACBBVMbd1YoUV1wFKJ5uM7kiJJx9+8/ldYVcFE3o
         u0VpO+RcEyheU4oaHVpKC6rc4tX8kyppjnqzEOu7G4qWZlJlUpidXPx9bP+7TZmFD9NJ
         LiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117021; x=1793721821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzW+q10RWKie6Pha9KgepWUrxRSzuZH0wvLMyxYlSms=;
        b=Ca6fOel4vUuXzFvFlKp1yBGHhkvXtUI19fjCqQ1DB1kDxpe522MGhSACylLLxQfLVs
         4bywsH31P1XKoAhEmJh3Y/qhXUz4ICdD/tgHpt1WJQxHB38IqrgTswG8ZfKc85KmOAY1
         UCjplFDD1AAxQJu7yssEml5X9paT5GF1dX52AnCBqOa42wiXyRWRIvH/d7hqvR9kbk2m
         4Dwn7azxub6dFC4KtFvnSPMWzOnGOum1pniDMC5KXrGolh0lLGZ9jJQYdjSYzzzHgM4K
         oo0NEAOR3cWhnErsjjnmxr7MKhoMrqWwXoc1SZdQtvB/Pac1aH2uPWUJnR3y4Ox6E87P
         FEDg==
X-Gm-Message-State: AFq9FYJrsIbjm0ShcCTien1JMNIhGREwB4AyMwunbbORveBOrSY2dCvl
	3sEEYSZKOA2r3IE4hXQWJ1uYvEeeun8h5HFalHkkiIh9AKiPSRYrlMC9
X-Gm-Gg: AYBFou095MVpHvd49k3kNoghxJYETxGyB9wIfDwrGz/m3uCtfW4+Ubt3whBmQzdxuQl
	P6kV4Nn2uYHvtSV5jMgaelw1Wbg+Ju24fB2JhvUJzcm4jN64gyPqdUmucrf5fBkPSuHY6yoUZs9
	eTbTWOvC3/j5TFiJ19b+XHDiOafOwipspoqV1Un3ITY+wYsPWQdPcK2EKL2VlKU0SWSD5gqZkn/
	vEfqeOvPoUxUll58X+veT68pv4MQ42qJtTutfJTYke1r00j7iW8et3p5XJMBq18Llbs9te7jVSO
	m4BRj/poEQczkiLW/sMd8SF8NcWPkUMSf/hMG7ms6/+coZq2W7nB4+y9J95jfVEczY62Z8DM5Vc
	nGq1Ox4tymiaJ2hlSCFjwtkIbAKsexpTRhLnmWIBwSC3XzJiAk4IEKu/6pHkIT6ndjsPQ2UqfYt
	FH1D6we77oHEsjMAF+duBuoTrPD4tpYCuuyOceykv5Ost7Y8nUKe0X3s41U+4u1YMs7fLyN0kUs
	cXjP0WfQl0gpT8Gb89NLJA0mgv928NM54/zuoFFu3Dxft9C8pt7/k0crdnG9zBZowlHM0lqM9M5
	y2AH+xA2lkk51J5lvTgRmfAqcbR66PVtbHkdmGxU
X-Received: by 2002:a17:90b:2cd0:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3adea89910fmr7468966a91.15.1793117020581;
        Tue, 27 Oct 2026 09:03:40 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406519fesm4273776a91.12.2026.10.27.09.03.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:03:39 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 01/18] mm/swap: remove unused parameter for reading swap header
Date: Wed, 28 Oct 2026 00:03:17 +0800
Message-ID: <50b9084b4845d8a93bba7cecd1d65e13808e012f.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

No feature change, just a minor cleanup.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c3288910b3e3..7acb33cd8b71 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3568,9 +3568,8 @@ __weak unsigned long arch_max_swapfile_size(void)
 	return generic_max_swapfile_size();
 }
 
-static unsigned long read_swap_header(struct swap_info_struct *si,
-					union swap_header *swap_header,
-					struct inode *inode)
+static unsigned long read_swap_header(union swap_header *swap_header,
+				      struct inode *inode)
 {
 	int i;
 	unsigned long maxpages;
@@ -3801,7 +3800,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	}
 	swap_header = kmap_local_folio(folio, 0);
 
-	maxpages = read_swap_header(si, swap_header, inode);
+	maxpages = read_swap_header(swap_header, inode);
 	if (unlikely(!maxpages)) {
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
