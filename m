Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8229E386552
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778599; cv=none; b=IKjqgjk3gfnF25GmGv5lk7L83BcNsN2990pMd4n9tlIv9MbYkAetHexGyUoEp7YY6axR8+czdSHnSRvVTkC1d6ILNO1B7vr7latatKZ2Ju61+iZQG7VT0zawkm/PVv+sjD6b2WQL8oxNcjItKJ9jTt+0yETCVLve8KOgaZ59BGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778599; c=relaxed/simple;
	bh=YQaGRylIUdDFcPUitGbK2CzCGwIGvThJblHLN5RMhBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFYWUQH3eM15Snf/ZAMxzpOCrY+cM38ZyQ4LShS6yfgkZjQPS9b4vCBCqbtC08FiOJfjyZY7rHFxC52CgymwWCVbmysuqLuuXn+iX4kjtb7nssCYJvZhyYWZQhN7bhSI26b+FIIsxXDbSyevcRSwP9sjpziUcWcgbdJVIiMubpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=H8SmtG0U; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="H8SmtG0U"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so7660515ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791778596; x=1792383396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92mwmyUTtXBrrkUU1Kt+mlj6dDxLQ8K0k1LROD62i4E=;
        b=H8SmtG0UiKktKj4B45uJukiKVqdRyUgwcAHQEy8ZP4uhwBa3ymS2RAilbXfriPHtlI
         imAMPcsCszH+NnuP5GYQB52Q0j3tzQAKHsHbl0GUjOWcuzOggQaRSmoecD3eVuVIk+2P
         A6VjSA7QdmU9az5nbBKzrGtX70VHH9YF4I+0vR8FJCA4pt34MnWQJ4mAbis0X1FMy+y/
         orLQMUFx6AhZeIM1+lPqnZt3a/EFdW1W47Xe6mP75+LZo0hn2TZ5nribE8SJSSIbFYrP
         QzP753PZoBwm32fQrbqh3gK41oaEWxK7L6N3lkbRACK3RaYGfh2dVVPKklyJR3O/JOZK
         7bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791778596; x=1792383396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92mwmyUTtXBrrkUU1Kt+mlj6dDxLQ8K0k1LROD62i4E=;
        b=Rrnd3ZvhjGrG7Lk702O9U8gmYC0wuMQwdXqKl71Wp3yGFtSug7ANrXpJiE49XO2PzZ
         q/pOqzfAClwEq1p59vfslbcpHF64crLmlN8k6eddvu0E1gjVoDw+Kq/xhr/+uL7Ty10C
         57KyDtbYrnJKz7s9Pr2ME48XoI6RoSwXf78oauWP05UT/IzpBdZipOHSrnDEW5HI2zNa
         iAEIY0YqUBTSmE64Drz1aFSVyou4An4QpFLqVhceuvXqcr96R6nBtrLfqa0TO078ojPu
         daf5RRmaA5mXRS/QKnZjoijg3ahcie7uJxiuDUnxw+hsB4AFNeSlrm4ZrvwpCHkFm4xF
         RH8A==
X-Forwarded-Encrypted: i=1; AKwUvBziGRY8B8eLoi4yB/Ihql48CnNL2ewG2K3P3tm+e+eQreuBKLel7Dbsy8938bzug9Iz25Fsqh7uoh46JDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4mXUu6E5stC7KdybDeefjT1nuPAyIOXKYlkzXPIgqGt3AieVA
	/Nru4w8EgxkeXsoSs6gST4KLHBOxWin8uYkXdlCuQrHoe4fksXJ0DFFLT39YTPYlJmo=
X-Gm-Gg: AYBFou2QyopVTz9FCBc1VxLrR5QJ0CkLqdHFDXnLDgACqK6OcC7KIZ3jjNVfgU4KYYj
	NIKXkEvmAXARGwB3mOrcQLQtqvbq4BeBBfkFrmefg+80SBTJySAr61kwX4a4vmtWNn8ei8tbq/G
	jhmpFDAmo8knYS/HpplgtTuHad44mmKUNhF+jz/egL5+3C0NtJ2tGL0c40kP6jgtf13m5p0N6l2
	lvziQe6C2UgCOTaUaR2MA+5UfkRntob36TS4ouZallmJCEGquCqIgXcSLE8tF+pMMamrVLhC7mt
	ke6b8TUTbCKk6VHz5A58tZNzYJuW3rfgFs/3QC959F/C3KqC1xa8XBU8FGn713Zepz3nE9iH+X/
	5z2qskQ99hONqX0/2RfHLVIQrM0k00eCjHZz1Rm5UsTjFPkbeOJAivdf9/O+Wdsy3bOOXmbyFPS
	O5TCjlfC6KypNLNcYIjr3o3upfwTKj3T+DN5tAvZ8KwQA/K6o0rgRYXlQ0bFQCFyowkxDwa33nX
	m7LTSkG7zg1Bcf5
X-Received: by 2002:a17:903:8c3:b0:2e4:a338:3658 with SMTP id d9443c01a7336-2e842bbf5bamr75162065ad.42.1791778595822;
        Sun, 11 Oct 2026 21:16:35 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421af46asm38240025ad.39.2026.10.11.21.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:16:35 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH net v3 3/5] eth: fbnic: return a pending Rx packet before reusing its buffer
Date: Mon, 12 Oct 2026 13:15:58 +0900
Message-ID: <dc2fd0f8b4ff068c3919444d7b4a88ad55e5831f.1791775409.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791775409.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791775409.git.yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fbnic_pkt_prepare() starts a new packet on each header completion and so
far only warned when pkt->buff was still populated from a previous header
that no META completion had finished. The stale buffer, and any fragments
attached to it, were then overwritten and leaked.

Return the pending buffer to the page pool before starting over and clear
data_hard_start, so the META drop path does not release it a second time.
This leaks memory rather than crashing, so there is no oops to show.

Fixes: a29b8eb6e533 ("eth: fbnic: Add basic Rx handling")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 62 +++++++++++---------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 7dda59bba14ee..47ded7a9e0a81 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -1014,6 +1014,33 @@ static unsigned int fbnic_hdr_pg_end(unsigned int pg_off, unsigned int len)
 	return ALIGN(pg_off, 128) - FBNIC_RX_HROOM;
 }
 
+static void fbnic_put_pkt_buff(struct fbnic_q_triad *qt,
+			       struct fbnic_pkt_buff *pkt, int budget)
+{
+	struct page *page;
+
+	if (!pkt->buff.data_hard_start)
+		return;
+
+	if (xdp_buff_has_frags(&pkt->buff)) {
+		struct skb_shared_info *shinfo;
+		netmem_ref netmem;
+		int nr_frags;
+
+		shinfo = xdp_get_shared_info_from_buff(&pkt->buff);
+		nr_frags = shinfo->nr_frags;
+
+		while (nr_frags--) {
+			netmem = skb_frag_netmem(&shinfo->frags[nr_frags]);
+			page_pool_put_full_netmem(qt->sub1.page_pool, netmem,
+						  !!budget);
+		}
+	}
+
+	page = virt_to_page(pkt->buff.data_hard_start);
+	page_pool_put_full_page(qt->sub0.page_pool, page, !!budget);
+}
+
 static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
 			      struct fbnic_pkt_buff *pkt,
 			      struct fbnic_q_triad *qt)
@@ -1025,8 +1052,12 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
 	unsigned char *hdr_start;
 	struct page *page;
 
-	/* data_hard_start should always be NULL when this is called */
-	WARN_ON_ONCE(pkt->buff.data_hard_start);
+	/* a new header while one is pending: release the old one */
+	if (unlikely(pkt->buff.data_hard_start)) {
+		WARN_ON_ONCE(1);
+		fbnic_put_pkt_buff(qt, pkt, 1);
+		pkt->buff.data_hard_start = NULL;
+	}
 
 	/* A buffer ID we never posted cannot name a buffer we own, so drop
 	 * the packet instead of running off the end of rx_buf[] or picking
@@ -1146,33 +1177,6 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
 	}
 }
 
-static void fbnic_put_pkt_buff(struct fbnic_q_triad *qt,
-			       struct fbnic_pkt_buff *pkt, int budget)
-{
-	struct page *page;
-
-	if (!pkt->buff.data_hard_start)
-		return;
-
-	if (xdp_buff_has_frags(&pkt->buff)) {
-		struct skb_shared_info *shinfo;
-		netmem_ref netmem;
-		int nr_frags;
-
-		shinfo = xdp_get_shared_info_from_buff(&pkt->buff);
-		nr_frags = shinfo->nr_frags;
-
-		while (nr_frags--) {
-			netmem = skb_frag_netmem(&shinfo->frags[nr_frags]);
-			page_pool_put_full_netmem(qt->sub1.page_pool, netmem,
-						  !!budget);
-		}
-	}
-
-	page = virt_to_page(pkt->buff.data_hard_start);
-	page_pool_put_full_page(qt->sub0.page_pool, page, !!budget);
-}
-
 static struct sk_buff *fbnic_build_skb(struct fbnic_napi_vector *nv,
 				       struct fbnic_pkt_buff *pkt)
 {
-- 
2.43.0

