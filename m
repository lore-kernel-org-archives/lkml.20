Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442932;
	b=0nlWt/T1rYloW9BlBIUBDFVK0CxmUXoMyaLYAR3QCAFABKCphLWyXwGWjh53SAixItNv
	 p4uH9n5LYSUudkk3oPotQ7+bqz9HAlKl3MyB6AtwRoNZ0PL51j+NK2FUkuOjGqvGfP0/2
	 l6EeOxp7iDND/1hhuqC5ueeFUJYVYMUsTtKdnqBhlh34zpHeV+lELoKZX1MvkEQax2wkU
	 kKAeP4oTH32ya+3PqL5HFEspmPQTlnm0Gk3i2pjr8ESNKmj9riGdS3dXpk3w2BZJWR8mA
	 Iamp97YtQjgBV6i+St1BwCxVOBJMcbMXFkAeIh76PHjIeteTIs4t/NylfCh6lBDofyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442932;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=QM+jLmU1TXXXeV05MNbrRo4VfZ263cK7rXlJYxa7fzo=;
	b=AcihyIVmWoPP6dRor9bX5uqEFm7tS+WgSbly9k7zvcqQH4YLefpMi5L48WCgvPE2BfDe
	 ajwE9Kc11HuQ0ckV7gWtBL2KnOf2OKl06EjTCLFArGpzTND1MEBxGBj6uEwQ1iLRmLEdg
	 eVHj+wtDssvudhAWdt/m0fFOJ6U7k/VYzKS8uR1T3AflYvEg+ASaA26XlIC0cHwFn5eKL
	 L4YAPbKJpYQ1wp34lk3+gxWq71vNA8jT/bn19/aKO5CxzI6H0PJNsoIaJyst/uxkLBIpv
	 dsFj2+VVLHxLqqLlrzkeUvB8zQRaMktSuD/F/I7eOA0r0uCHfxQmgFFgRqUm4t9Ru9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=PKmEKf6k;
	arc=none smtp.remote-ip=57.103.79.23
Received: from outbound.st.icloud.com (st-2005b-snip4-11.eps.apple.com [57.103.79.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80579606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80579606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=PKmEKf6k
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id B2E23180029E;
	Sat, 31 Oct 2026 10:35:25 +0000 (UTC)
X-ICL-RepId: 01a19187-4c19-7fe4-a57f-623863489c35
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQtJCkMGXwFeCEADQwZbC1BcHA4XXhtCFUsVXANcDkswUBtfAkIPHBNWFRMLU1ZbE1UXRgkZCF0dGQpQUAZcEhhcFFxQWB5GElYNXQkZGEZeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04CXQRaHxJYDFAFGh9eEhQeXxhEAx8GD1UCQAZSAkUKQQteDg5XE3kMVgNUDlwEFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793442930; x=1824978930; bh=QM+jLmU1TXXXeV05MNbrRo4VfZ263cK7rXlJYxa7fzo=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=PKmEKf6kZLCCLiZqc70Tc9ZJfOJtkwkYM4iEswCgAuhCIyX1j86gcnITmdItxOOQZM7kSeUKKpOiiO0A/nmy3xiuiIP1vmh+AA3x4nrkS+i+1P/0t+IzPav85YdsotbUXO/S009FSOVWXSCT8k56v1RjIMNQf0UtDK2xcbxBQrOVZCsw54BdDYy3EIxZPYTi/byQDtBo099F0WYVEv0sasuuhVIgscAGnXNORGWZJpQW/ZABl+sg1ks4Vx/a/nO/00gH/ieM6rnCYEu0ZpJjHe05OdfUAJFW+O4wSHDkfK5QWxT4kqzgqS1CQJtZZP3FbeT5cYaUAlX2vx2izRXqNw==
Received: from [192.168.5.15] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id 0BBD81800344;
	Sat, 31 Oct 2026 10:35:17 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
Date: Sat, 31 Oct 2026 18:35:08 +0800
Subject: [PATCH v6 1/5] mm/vmscan: introduce folio_activate_locked() helper
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
Message-Id: <20261031-batch-tlb-flush-v6-1-190539839eec@tencent.com>
References: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
In-Reply-To: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zhang Peng <bruzzhang@tencent.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0MiBTYWx0ZWRfX8mYasr9KAWLJ
 V8d2VvTGOx9DlifFp6fHHxixCEQFOdgglKmJzj09zO1z0Ow4MRwGP9jCSpXG1b+iGeQ63QWya0T
 I775V3sj91jyWMGSE+PCK/rp2kR2lcnwCqAz2mp5bDKAM8mIuo98k3cbDYO9qJw59C91prEoR5a
 mQPhlgGt0rOsapZFMSS5N9PPGqHpAuUWNVpvKG8eUEcPXp/jFQPALobMviOMk/kRyjz1r4jp9+t
 gnw6LuKIJi80qUZkg+pkwupzg+hjiE8QTnkgG8ldZuY62dZNDqy6A5N92E8PoOAm0R4pWoJ62OP
 9gd6pIxaF5/a4VOrE+rZIeBdXfIf6b8x3qCIY1mk3mn5sKHbZ6WC+fkU6us5lA=
X-Authority-Info-Out: v=2.4 cv=e74LiKp/ c=1 sm=1 tr=0 ts=6ae5c470
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GvQkQWPkAAAA:8 a=VwQbUJbxAAAA:8 a=SVDCxekAgo2Xo8Fb88MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: C6dZN2IwETpoDkRQO5cHXGBuFJNXMSc0
X-Proofpoint-ORIG-GUID: C6dZN2IwETpoDkRQO5cHXGBuFJNXMSc0
X-JNJ: AAAAAAABfsFAKmuRBLed/+ov4tC5LBUIvKKpZVubtD9IDhzyAXDN1P5hNi+Bi5atzou4Vg
 rkqJaoeCXN3h9iJvYgcYS+4NlsbwX+3m6Q29hNiFvjmvbZgXhcR1Ydhcq2eKrZL7BteXN1
 fIrLsolRT0FyIY32CM0Jaybnxltnlcoveh4nXKbgJs27e7S0SzVOdchWjSAaO/5XXFC3AM
 uzyz+nA8vEtAOdHjt2MnrnIgcg4BowrCCXbPsHfHiImqaVCliaHVHRmau59l8qFJ5G4bL8
 phprEP0/WD36kNuT6mpkaBuqbbmKaWt2JCySOohNM26P/1mHDp1AQVvWikmP2crhc2BfmR
 MTd57Ui6hMuPyNOi22hMm2I5/gjim4C7zlN2ZCxFuPbMMR1ih5vMpPyd32MWMACG1A6g/a
 o+TBR6pD72ki+gnu1wHNDPrH8kWspCXaSKB0m6aiux1XqdeL+9Hetr2nY3rjg4Cb7z7KwY
 9RQJqgxXaZ0n1wczp7+98SyZiwus9xzh3wALKi+dwxvvgJmF0DWXK977ftzcdShO9fh4jk
 EUSLwn52uNkwWi8vZiwNY1cr2vXQTUeTqhi0unxva/E5fH76339PvgyM7xLNHbelrkgrQa
 qrcrM77TWQNx+KK/8mVAssyYRFRnZnqoEdNx9jsFnwCOarDFAPbpd/2PIE73ILGXX+3Wha
 YCL7nEPirRTGd7kz61+EoGOIasedvzjfFSDSMhcRiGksFeU8nJipEOWsdUR+4hE6H/oi4s
 X5V5jS/vYGwjfI3iZ2ZwiuWd8hK90KfbyW/bmxFZ+WXzeHRbnu+5rhvX03TlJs+Q7oI7Yj
 SsfP2TwQb8zrcfuI82VnLFu24Qgakuye3TSuCmP/9W95BDcDs4kG7oYwBPr30nLS432sIS
 izkZXyJoKaBmkfAPPoPlcOkRcm2Plkl76iWsqQPrC/VT3vQsmGVW3L0AUhB8702XVpPeYr
 xdvzqO5y

From: Zhang Peng <bruzzhang@tencent.com>

The activate_locked label in shrink_folio_list() reclaims swap cache
when needed, marks the folio active, and updates activation statistics.
Extract this block into folio_activate_locked() so it can be reused.

Replace the active-folio BUG with a warning so a bad caller is reported
without taking down the system. Otherwise, there is no functional change.

Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
---
 mm/vmscan.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index fb9f8f020f63..54f6a9e62715 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1155,6 +1155,28 @@ static bool may_enter_fs(struct folio *folio, gfp_t gfp_mask)
 	return false;
 }
 
+/* Activate an isolated, locked folio and account the activation. */
+static void folio_activate_locked(struct folio *folio,
+		struct reclaim_stat *stat)
+{
+	unsigned int nr_pages = folio_nr_pages(folio);
+
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
+
+	/* Not a candidate for swapping, so reclaim swap space. */
+	if (folio_test_swapcache(folio) &&
+	    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
+		folio_free_swap(folio);
+	if (!folio_test_mlocked(folio)) {
+		int type = folio_is_file_lru(folio);
+
+		folio_set_active(folio);
+		stat->nr_activate[type] += nr_pages;
+		count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
+	}
+}
+
 /*
  * shrink_folio_list() returns the number of reclaimed pages
  */
@@ -1623,24 +1645,12 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 activate_locked_split:
 		/*
 		 * The tail pages that are failed to add into swap cache
-		 * reach here.  Fixup nr_scanned and nr_pages.
+		 * reach here.  Fixup nr_scanned.
 		 */
-		if (nr_pages > 1) {
+		if (nr_pages > 1)
 			sc->nr_scanned -= (nr_pages - 1);
-			nr_pages = 1;
-		}
 activate_locked:
-		/* Not a candidate for swapping, so reclaim swap space. */
-		if (folio_test_swapcache(folio) &&
-		    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
-			folio_free_swap(folio);
-		VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
-		if (!folio_test_mlocked(folio)) {
-			int type = folio_is_file_lru(folio);
-			folio_set_active(folio);
-			stat->nr_activate[type] += nr_pages;
-			count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
-		}
+		folio_activate_locked(folio, stat);
 keep_locked:
 		folio_unlock(folio);
 keep:

-- 
2.56.0

