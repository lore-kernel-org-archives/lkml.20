Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801422;
	b=bssQvk2J4iikyPK1rruZYoyYpybDklFjGpGKSLvTxNCrVlzkcq4+E5uSw8zqImCch6JH
	 FALsQv3FAMna+UdzQK/67c+TYfTKhTzVq0LEA/nuB1OXGdhT/MecuNRed3rOaxuzQsTxo
	 q2iJthXSp+cmIWF2xhz8pUraqNox7j4YRSYDFkLEAuKKD6uvS+BuSShdoo3IEUkxGgUnV
	 8fQjuCD8Ll6+xpQmK7D0Y6Ncx33pLORFAGro7O/fY2u2PDRm2ql3N02OQqfn6bMbmAf7y
	 MEJ3FGVsFHobMbdCvXNmoLzKVmBZGu1xKTcyk97IeXWOSi9XwfjZTdE4xX3K6AjI+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801422;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ONRHn8KrnSDZjpgJxYbGmgk6UH+b2w2T6gpubSrL9lY=;
	b=pumofxd+TZ5608RrnF9SUzCDTBL4gBUlz71Dop5Pix7WJ7wg5WrLN99GP9vdVsCGeYrn
	 +SgijuoQSc3Nmae2HTE/RTQ9XddZ1aDGdnIFpZTF3WBCheBWFRalLkhn0etAyD41JbZMR
	 pUMCn3YD80SmV17SuGH4MH/8QPJfQHrVA/fjQOIX9G6UgyVCqPcm2ACOTsLM72o7hJ2vq
	 k1SBAvrBD+JMX+HzYB4OY+0UaEw6ZBfs7eLmEp9UpNTLuULVS3anVr+ot05ibRwaIhbCy
	 Gf487z2ruK6Q4eQlIUBi1ebv5nHv7BCJml1+3Jg/r2IgDyBn3ixpCOMmWqBv2WkDmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=q+nzBpJV;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32890606A323;
	Mon, 16 Nov 2026 03:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32890606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=q+nzBpJV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=q+nzBpJVvf+i4X+4CS658jFqNDVV2NxH8Rz/Tj5eT+Vx0MRiIpVqpaOdJ5Jkfo5G8kqg2HIZowoSD
	 IThzpREiRCyDQk70J1UwO90b8ohs7g+I2zmPXMiYx3zzstVfbDdwhcULgfw0l0ogFT5otracktGSVL
	 iqmioPcfW5riHYVI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afa7f0c2db-9b761;
	Mon, 16 Nov 2026 11:57:00 +0800 (CST)
X-RM-TRANSID:2ee86afa7f0c2db-9b761
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[74.82.203.40])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afa7ee7fb3-7c019;
	Mon, 16 Nov 2026 11:56:59 +0800 (CST)
X-RM-TRANSID:2ee66afa7ee7fb3-7c019
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Willem de Bruijn <willemb@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Narcisa Vasile <narcisav.kernel@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] net: add a KUnit test for the alloc_skb_with_frags() tail split
Date: Mon, 16 Nov 2026 20:56:20 +0900
Message-ID: <20261116115620.18151-3-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116115620.18151-1-yanhaishuang@cmss.chinamobile.com>
References: <20261116115620.18151-1-yanhaishuang@cmss.chinamobile.com>
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

Allocate MAX_SKB_FRAGS - 2 full order-3 chunks plus a 7 page tail, which
needs one frag too many if the tail is rounded down to 4 + 2 + 1 pages.

If the allocation fails, skip the test unless MAX_SKB_FRAGS - 1 order-3
pages can be held at once, so that fragmented memory is not reported as
a failure.

Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 net/core/net_test.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 2b5080c226636..118866f3e28c3 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1721,7 +1721,58 @@ static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)
 #endif
 #endif
 
+/* Can @nr pages of @order be allocated and held at the same time? */
+static bool alloc_skb_with_frags_test_have_pages(unsigned int nr,
+						 unsigned int order)
+{
+	struct page *pages[MAX_SKB_FRAGS];
+	unsigned int i, n;
+
+	for (n = 0; n < nr; n++) {
+		pages[n] = alloc_pages(GFP_KERNEL | __GFP_NOWARN |
+				       __GFP_NORETRY, order);
+		if (!pages[n])
+			break;
+	}
+	for (i = 0; i < n; i++)
+		__free_pages(pages[i], order);
+
+	return n == nr;
+}
+
+static void alloc_skb_with_frags_test_tail(struct kunit *test)
+{
+	/* MAX_SKB_FRAGS - 2 full chunks plus a 7 page tail: rounding the
+	 * tail down to 4 + 2 + 1 pages would need one frag too many.
+	 */
+	unsigned long len = (MAX_SKB_FRAGS - 2) *
+			    (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER) +
+			    7 * PAGE_SIZE;
+	unsigned long frags_len = 0;
+	struct sk_buff *skb;
+	int err, i;
+
+	skb = alloc_skb_with_frags(0, len, PAGE_ALLOC_COSTLY_ORDER, &err,
+				   GFP_KERNEL);
+	/* The full chunks can't fall back to smaller pages here, so the
+	 * call needs up to MAX_SKB_FRAGS - 1 order-3 pages at once. Don't
+	 * report a lack of them as a failure.
+	 */
+	if (!skb && !alloc_skb_with_frags_test_have_pages(MAX_SKB_FRAGS - 1,
+							  PAGE_ALLOC_COSTLY_ORDER))
+		kunit_skip(test, "not enough order-%d pages",
+			   PAGE_ALLOC_COSTLY_ORDER);
+	KUNIT_ASSERT_NOT_NULL_MSG(test, skb, "err %d", err);
+
+	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++)
+		frags_len += skb_frag_size(&skb_shinfo(skb)->frags[i]);
+	KUNIT_EXPECT_EQ(test, frags_len, len);
+
+	kfree_skb(skb);
+}
+
 static struct kunit_case net_test_cases[] = {
+	KUNIT_CASE(alloc_skb_with_frags_test_tail),
 	KUNIT_CASE_PARAM(gso_test_func, gso_test_gen_params),
 	KUNIT_CASE_PARAM(ip_tunnel_flags_test_run,
 			 ip_tunnel_flags_test_gen_params),
-- 
2.43.0



