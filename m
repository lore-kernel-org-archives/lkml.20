Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597524F30EF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568501; cv=none; b=qtWQysPFE6+0tbgirtnsOzECmSyJPQdkiAZ/lC0feSzN8Xup8nfqUEz5eyP1E5WGHJ/tcKSL/PEpt5i1UZNKzZ9uP7eOgdRWs4aF2huU/BgPld4/c8NZPIqgL9abRo4d3pPvF20G7P5hJLw/SQQLstmdNhqP/oq4rl0u+wCj/1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568501; c=relaxed/simple;
	bh=1Um5EiCJSDVvTwK1Tyd0ZORnY2SUAT6cpGWylov2DI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVUiLvoHA7r6poP6bnIMTW1z1XOEpQ2o970EZgS3jUMSvwzRotFvh0PiFBr+f88JF2BNIq+RFz8KKC0QXAT5VKbadzqvuIktAxXf9KQaBUUm/qWzRFJAN0QWnj3DDVGW8oPMmgrs3ReBwt+xDzO3xvc0Y5GWH7CffRqn//ZG5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=A0iXw+PB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="A0iXw+PB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so4462301a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791568491; x=1792173291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC+umOfWsHMMd5xQqstPSm9nZ9qFadOsLmNye9AbZ80=;
        b=A0iXw+PBenJQucA9MRKSCMdBIpbtEELjLYLLA6u9GZGelwN4kFCkQ/Qo4KcZWT5eEc
         Br7gsCfLatAg1S+pObeAqhF45gn9iwVXAYibG3ORIfKTIwVijAny6pEkQfiqs0WX7Zk+
         m4fjeQMZ//qvhn3jGPjs7UmIWCATpGwrgclAPGH7tzJrApbrwinucXCSJQLP6Zt4Lvfw
         UFg4/Q77nFZIw8waLGOfyP3Z4EycDd/OgA1zOb8IGCh5C0716QxxW5jLtPuNmWz/yYfG
         5Li/QFD1VIsQylPzG7LzArYMT2ea5pP1+S8LmHr3MS3880mhiB1xbHBZwXTfN3l8k8Gh
         Vk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568491; x=1792173291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC+umOfWsHMMd5xQqstPSm9nZ9qFadOsLmNye9AbZ80=;
        b=Zf8wX+uejy18IfaWy7GxNY0BMfoU1i24+IzU0ckg519h6BlVtOkwIoS8kCtbxwLjo9
         AFknuIhz6L3pp8TIriYTtifWPZjPk6P/Dq6Z2SGiRPGTGequsracJpDqFM5LgBZWNQD8
         yr1aVqEoPzA7Lb3iEdrUniM12bWSHk03Gs65mOLAd2Dk7R90cx6Bh49wwuRTJMBtfcoo
         1J6bGHWGFYKhOcHp8gPyu/VARQMQLXPZjPv7ewBXhVebpo3oNRVmVmlP66glDdrxwLNJ
         gCMAL2FLpRGsd/tOpvw5mMvDg5eqjdIUgqcvJGUN40Lx61YPFwCOHfWe3hlAjBKSP8BU
         tEWg==
X-Forwarded-Encrypted: i=1; AKwUvBzwGkyNkkW3aIzpoJFC6M1ZjcPsxC1zp3mGyOBMPM7XZoKuRpKFe0pmb57vb8XTtOVVubYxRFp/Lleabf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdZMz3QuFcU5578sR8bMs21ldmwUTzfgYhTgE+iVhyFOe2zXHC
	CTv3djmPWGWxDDi5dejv2tZcSKURSB2CAUQd8DA+Q6ZlsdfjrFBPLt74xzG2uZAAo7IcHFICrLc
	x5zDJ4zA=
X-Gm-Gg: AYBFou3LOJkyA5zY8+xIxT++EAJrMI35eP8AANF3Vo22woygt5jiBFN2jCRPRSUUHJI
	htaTTXJfi+ReB5SnFW4CakmlPe8zX3bxgb3wPfxZ0C4GI/GVCD5L/db3MGUeF5PXHa4Hc2AJPB9
	aLrf/lqE64cne6qYwns6JRgdq5LzDrf/ULyMehFgS92mLEirjhRFPcqUv/1Guvbn3cDiU0/xmhz
	9y4UKWERNyS5RdndLPC7DZ7YYf2JxVXwUTl43hbdW3id3H1dxOQRGj2YMUYn5t0S6n0nycNmf5B
	gneWgnJKC1wNoXwtWaQR/Sb6oDMrWRLURDlDBLYWYW229/pbt/5F8dtHxESyTJoetAx/C4dG+01
	U5eeJ8kqKrC5Jvjgi7t5e9ob+HMggzFJCA+VsCwsRRS2om0cT9Sgg/P9QXN9CqKyIDZy0MdOyrp
	xQjqXrZIB7PorOKzxX5zWSnYGTmRY+EVTPT4wBjz3JMXwcgdkqPOZqlm4ZFlo8ONQC/3xgGy9oS
	tsVqg1ebs8XRNLJKF6vgg==
X-Received: by 2002:a17:90b:2688:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3ab3a775938mr2547113a91.27.1791568490985;
        Fri, 09 Oct 2026 10:54:50 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c95f:28ac:324a:cdc3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm5596962a91.6.2026.10.09.10.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:54:50 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH net] eth: fbnic: validate the Rx completion buffer index
Date: Sat, 10 Oct 2026 02:53:58 +0900
Message-ID: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer ID in an address/length Rx completion descriptor is a 16 bit
field, FBNIC_RCD_AL_BUFF_PAGE_MASK being DESC_GENMASK(15, 0) once the
fragment bits are removed, so the device can name any index from 0 to
65535.  fbnic_pkt_prepare() and fbnic_add_rx_frag() feed that value
straight into fbnic_page_pool_get_head() and fbnic_page_pool_get_data(),
which use it to subscript qt->sub0.rx_buf[] and qt->sub1.rx_buf[].

Those arrays only cover the buffers the driver posted.  They are
allocated with size_mask + 1 entries, and size_mask comes from
hpq_size / FBNIC_BD_FRAG_COUNT, so at the default FBNIC_HPQ_SIZE_DEFAULT
of 256 each array holds 256 entries of 16 bytes, that is 4096 bytes.  A
buffer ID of 65535 reaches 1048560 bytes past the start of the
allocation.

The fill side already masks every index it computes against
bdq->size_mask, and so does all of the ring head and tail arithmetic.
The completion side does not.  A descriptor naming a buffer that was
never posted makes fbnic_page_pool_get_head() decrement pagecnt_bias
through a pointer outside the array and hand the out-of-bounds
netmem_ref back as a struct page; page_pool_get_dma_addr() and
page_address() then dereference it and the skb is built on whatever it
points at.

Injecting an out-of-range header completion reports under KASAN:

  BUG: KASAN: slab-out-of-bounds in fbnic_page_pool_get_head
  Read of size 8 at addr ffff88800c719008
  The buggy address is located 8 bytes to the right of
   allocated 4096-byte region [ffff88800c718000, ffff88800c719000)

Check the ID against size_mask before it is used and drop the packet if
it is out of range.  Masking it instead would keep the access in bounds
but would silently attribute the completion to an unrelated buffer that
the driver does own, which is worse than a drop.  Set add_frag_failed so
the frame takes the existing error path.

Rejecting the header completion leaves pkt->buff uninitialized, and the
payload completions that follow are handled before the metadata
descriptor that looks at add_frag_failed, so fbnic_add_rx_frag() has to
bail out as well or xdp_buff_add_frag() writes through a shared info
pointer derived from a NULL data_hard_start.  Key that on
data_hard_start, the way fbnic_put_pkt_buff() already does, so the
buffer accounting on the normal path is untouched.

Fixes: a29b8eb6e533 ("eth: fbnic: Add basic Rx handling")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 27 ++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 10caacffee0f0..d85daab06c99c 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -985,14 +985,24 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
 {
 	unsigned int hdr_pg_idx = FIELD_GET(FBNIC_RCD_AL_BUFF_PAGE_MASK, rcd);
 	unsigned int hdr_pg_off = FIELD_GET(FBNIC_RCD_AL_BUFF_OFF_MASK, rcd);
-	struct page *page = fbnic_page_pool_get_head(qt, hdr_pg_idx);
 	unsigned int len = FIELD_GET(FBNIC_RCD_AL_BUFF_LEN_MASK, rcd);
 	unsigned int frame_sz, hdr_pg_start, hdr_pg_end, headroom;
 	unsigned char *hdr_start;
+	struct page *page;
 
 	/* data_hard_start should always be NULL when this is called */
 	WARN_ON_ONCE(pkt->buff.data_hard_start);
 
+	/* A buffer ID the device never got from us cannot name a buffer we
+	 * own, so drop the packet instead of running off the end of rx_buf[].
+	 */
+	if (unlikely(hdr_pg_idx > qt->sub0.size_mask)) {
+		pkt->add_frag_failed = true;
+		return;
+	}
+
+	page = fbnic_page_pool_get_head(qt, hdr_pg_idx);
+
 	/* Short-cut the end calculation if we know page is fully consumed */
 	hdr_pg_end = FIELD_GET(FBNIC_RCD_AL_PAGE_FIN, rcd) ?
 		     FBNIC_BD_FRAG_SIZE : fbnic_hdr_pg_end(hdr_pg_off, len);
@@ -1026,10 +1036,23 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
 	unsigned int pg_idx = FIELD_GET(FBNIC_RCD_AL_BUFF_PAGE_MASK, rcd);
 	unsigned int pg_off = FIELD_GET(FBNIC_RCD_AL_BUFF_OFF_MASK, rcd);
 	unsigned int len = FIELD_GET(FBNIC_RCD_AL_BUFF_LEN_MASK, rcd);
-	netmem_ref netmem = fbnic_page_pool_get_data(qt, pg_idx);
 	unsigned int truesize;
+	netmem_ref netmem;
 	bool added;
 
+	/* The header completion was rejected, so buff was never initialized
+	 * and add_frag_failed is already set.  There is nothing to add to.
+	 */
+	if (unlikely(!pkt->buff.data_hard_start))
+		return;
+
+	if (unlikely(pg_idx > qt->sub1.size_mask)) {
+		pkt->add_frag_failed = true;
+		return;
+	}
+
+	netmem = fbnic_page_pool_get_data(qt, pg_idx);
+
 	truesize = FIELD_GET(FBNIC_RCD_AL_PAGE_FIN, rcd) ?
 		   FBNIC_BD_FRAG_SIZE - pg_off : ALIGN(len, 128);
 
-- 
2.43.0

