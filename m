Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551513750BE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778604; cv=none; b=RQPF1OYuQ8fPA8QR0iyHf9aQbyR6jDYERpMh3zCa3GlpksniL59XBUAnU71fHMJT0OXdb1vmreLNOkSGVlr3XFl4nh/DhQGgqWM835o5/xnOm4Sv7L1HKXTJrMXhtCpC8nLO51nETF2FLp89zOe6IWlHQ98Fq+8bmHTTG885P2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778604; c=relaxed/simple;
	bh=sQrj9NtsIHkxF9w49pSeMNv9N9eQxQbKMSBF5j2fiVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQSb5tlS3ag8fTQjSVCya89oiC0O/wqvr3uYPBeMyS+DFxOCBN8wp72aVYuzlvwDvMap08nKusysSSX2AF54SW99hldKRH0Bd9ngF+fbE4EacnIvbL9KHll7TOMRsGmj8p7KXgLF284TDofavPNTRrf1EYQXaV2++yCue3H5kuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=nL8QH8Bg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="nL8QH8Bg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e81738d24eso13326255ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791778603; x=1792383403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMjXa7fPM07GEuEQK3ZTCMVcOkPQnQoQnjCjmIDRcqQ=;
        b=nL8QH8BgwQL/76yuOYzpSl5ZCyfLH04d7kgForWpm7AmqO5iqLmxLbHU7ORHKcfzUP
         SH/0+vXBqJUsiFFTJfgtlhGJpxYjJFuzi4BK6RKdHPM+Y79sUqkjnsiCdvMykoH1qtKv
         agIjEli85YjfIAvBxlJmXGa7gpcaBYFUOlDFzXC6UUmxAY5e8wgYjP1ZaawjMgjlx7e4
         JPnx9O3FFAysIFoJQ/Pm2PSnZI3ZjxPE2fEgnDRFSntdAF0n/dB7WKoZYTN0QH10fgLF
         1frGb8XlnJ2Z4PO3gvz1NryFY1tYucrN0lkUQXrI/Ly8v1DXrKKogwDwdaxHpq7W9Y0o
         rWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791778603; x=1792383403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMjXa7fPM07GEuEQK3ZTCMVcOkPQnQoQnjCjmIDRcqQ=;
        b=ffKSWefbgzDSkcafIArJDrfE38jHWdgA0+CCo5o20ZdRTpiUX7i8uxrWKLvqxx0PaP
         XygkInrqjHKtlDxLsoGyn7XKOWdQrgN3VPKscA86azDVEfOKMxgFCKu09/m269/L4riP
         rPTsETC9/6qaNp4iJmR2eqF6vF+TF5sA4ZZcM2Fj4OR/QqQXIdo3lu9XxmIC824CWua0
         1G9tJBCMR3PTLg0dcWybao1MV1p7PZRi1NvD5iP7iOs71hleSAD/49nHG3GT0VbIA1tS
         MPMe+/BPqDuim6VF4EGvnPlZ2ZtveUXJpViFM9xa11TaRCvPejoT9C9rWoIsvEEcltAd
         OGrg==
X-Forwarded-Encrypted: i=1; AKwUvBzUIiu89SV02P0F7QpdKd4b1gyq1B+++wXsvCK0SSme8NAh0h58hOQar+VZn7G94hgiOYGV2azU/owlpHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwV9F16eJJqC9zVcROuRHycMBBokggE5KmUsEsvggAQ2xAPcWc
	Hko1IVNiskjlLPV4wNkEBR6Od9rkEDv7/XzGki0Y1rQKG1v6UbX7sxolWHnjTby+QXg=
X-Gm-Gg: AYBFou1ak+j0xe7opdtsIuwtNJKX0Tu2zbWE9BiSDbjAXSrJIMImoQyXXqkwZM9m1Cn
	Zcc9+LIExvKpzy9vCxGNuDMB7zoeWwDB2v7rrW7zqeyMbo98EtPDAXNjvC+qWLvrC6EBJU7OwCU
	iPXD6dpeU2sDy+0GYCX3QxGQd3zaS21nk2sLQiCXbxPIm+NzBJS+cE0NWs9VOE8yWnO8PKfYUlt
	wD9vqBVJnUG8ZjCFAdcPlmp7UWZPtFljVjiXWAH2ZWd32v/eMf/jaZQH/mj0NP9r2qxmC0aLEwn
	YTUjVbLIY4zmHTpPWvfv2PWNVkLEHqLuT/FOL89WxrPioOWirvAMYChlWqCH3hbVk7CJODAUynT
	gdWei9n35NqvwMF3zd7P0Uh80UWE5pswI+m3iqCy4ZDQdvNuLToI+uQWuPeuMVFkz57882LB3zZ
	QntZPWqmzBXM1v1pZ1Gc6G/2z7JKrbqTQkAZpVAiLLAQg1NW8pQy0aI7QzidnV7loSG5KxnAQ2g
	XNuRmS3tDUw0cPr
X-Received: by 2002:a17:902:e790:b0:2dd:ad74:ac1d with SMTP id d9443c01a7336-2e842cfc98dmr74612865ad.24.1791778602300;
        Sun, 11 Oct 2026 21:16:42 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421af46asm38240025ad.39.2026.10.11.21.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:16:40 -0700 (PDT)
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
Subject: [PATCH net v3 4/5] eth: fbnic: return the page reference taken for a dropped Rx fragment
Date: Mon, 12 Oct 2026 13:15:59 +0900
Message-ID: <9d77812119330cd316b7eea7fd35fa4038ff86a0.1791775409.git.yhlee@isslab.korea.ac.kr>
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

fbnic_add_rx_frag() takes a page reference through
fbnic_page_pool_get_data(), which decrements the buffer's pagecnt_bias,
before handing the page to xdp_buff_add_frag().  xdp_buff_add_frag()
fails when the buffer already holds MAX_SKB_FRAGS fragments, and on that
path the reference is lost: add_frag_failed is set and the frame is
dropped, but the bias is not restored and fbnic_put_pkt_buff() only
returns the fragments that were actually attached.

The page is then never returned to the page pool.  A device that keeps
sending payload completions for one packet past MAX_SKB_FRAGS leaks a
page for every completion beyond the limit.

Restore pagecnt_bias on the failure path, the exact inverse of the get,
so fbnic_page_pool_drain() reclaims the page.

Fixes: 61f9a066c309 ("eth: fbnic: Use shinfo to track frags state on Rx")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 47ded7a9e0a81..7a9bd91bcc41c 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -1171,6 +1171,8 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
 
 	added = xdp_buff_add_frag(&pkt->buff, netmem, pg_off, len, truesize);
 	if (unlikely(!added)) {
+		/* Give back the reference fbnic_page_pool_get_data() took */
+		qt->sub1.rx_buf[pg_idx].pagecnt_bias++;
 		pkt->add_frag_failed = true;
 		netdev_err_once(nv->napi.dev,
 				"Failed to add fragment to xdp_buff\n");
-- 
2.43.0

