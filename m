Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542F4BD34B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791660443; cv=none; b=nERGdKh87gZUmCQSgLfj++h5cKRaki8IAKdxGyw+PVc/3mKgkFefAAwWNMzUpmhdLcV9Q+r0Tcgr3CoH5CGJJl7VbTRbYdsUvP79+Kh+Iun2u5MHHU1h/dxzu8SUk6Dqz+vut6J2fDaUv4pT8Q/ZRJDkGwos9vqQZ9qn9N11nrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791660443; c=relaxed/simple;
	bh=T21C/au/tuvTBrwLBzOHO/ngCMEJ9LQB0PnJ+o7cO48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKWW+11KlOUcXVNCEwnjZ4x45Mhum7kSOE9BLeUdrX5odKxIVIRLP+QYEJm8+RU5IPpQgwKcsme0pcyncQ4wIkAJvd3WhAzAKOxOEnMYZF9sZbLArIeQqUxUlalR2owKOwxcDW6wZ+oTxdI3tWUPYz6MM9X6tJ8dOhKHUjwrANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=DZc/VWcB; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="DZc/VWcB"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35115b52125so989542eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791660439; x=1792265239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONbofROHEB35NS/5T323EfaoteCEiGhp0xJlYSlbpeU=;
        b=DZc/VWcBXE/7zuz3dO+iCewTqlpfi0WBfQAFI2PiG6fItnsv75UeMsyLLMlaDmzEhZ
         XEqEpqI27NLTELb7V1KXdgn8EPLyyVGjEy2XHo3541/gTgnFgwPS2isAhKfvu6jKgMo1
         ZgethWu+fgpuXo1+Y6YaWonGEWQE6eoKzO/fYpRSqSdxFbv+Z/z8GB6ICw919zdG6DI7
         LW5uHkRLyB97cfQpYo94Vwm2kbqYAgANHtSANEBOPq9VkKWZckewucgp3UuX7hyYZisS
         LfVsLuRkPwNXx/YwuwbQbSKqJ6NbPmNCLXFu7NRgAf3wdGKau4vbEPmp4ICWsj/HnOHt
         Dh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791660439; x=1792265239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONbofROHEB35NS/5T323EfaoteCEiGhp0xJlYSlbpeU=;
        b=K3VQ4C5PjXnvyCbGt1VUHA3g/KjxvHLObMORm9Lt4CIjXWvM3cmYCB7phc42QkzEhc
         k/qP7fNsoZxqwoQ1bAvJ0vqSuMUkMHzb5eB9f1eOtFRNX2ynA8rOquWgMYH8l8l35sqS
         BiMWwXpm1Hc+TPec9TRueuHS0P3ERQabbvw0Zq7RT0vFWg+pcLIETZgjEbw/nW5Cn+Z7
         RJtkFwSm5rgSX6Schoo8AbGu9VUumjHXIGw3dtQ0OBGHHLQVOkyPuOUwR1JrCAFiz3Qi
         cEPuKx1T72cR+PJ1FrKLrcOUOSWZRbv2AI5SwHtvivlieFSO6BrBcBjFTxBHOwZogkJP
         xazA==
X-Forwarded-Encrypted: i=1; AKwUvBxdjB3whi3tiK6wT7CyFxxssjkeb+8YlVgn6FHZO8WrDj/W8wtHk01hScOiZDrSv9FDdO9SfMuNzq+4vyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV1VLMze0sMHKEtjcxnSrSi4L8KKQBG7KOKF4NKnRidT7ZEZC2
	ukC1Y9xLGqYoPD0TWF/fzNzN0Lu/fWOIGKt+h3utDd/lk0MVDPYsa4ZVAg7Or1tnaHg=
X-Gm-Gg: AYBFou1m9FjzeavEKiH4jdgWuDZ7k6pjDmAB0q88qFweC5HFDvD4dgr2l8mrUYMTH8G
	aWnJSSPoX0FR8BRxmYtdnl3H5ZmqqcsTjHPpNsd3eS9zIwkyTva3sGYH8VbgBk8Zwpf1lH+n/jY
	CksOcgpCQYTLvB5ZFUj+pQy5BKdkusAcGu9mCqO1pMGhND8a4d6DYK6o9XtWO5a966eILjgXlr0
	qDRITX+KOjWjdOSUDNLRfgO6zxJL/qhNW300hd/TBiS3jjeHfjsgj56ojzzMH1OM0kbeu7UJej5
	1M+D/fD1QGwja/6UzSARxL/Cs+UDGoJz4GCVhV6ttsYNRw4rYl/Yy9A0ofNNiBoMUdPt1VY+p3B
	T/uodQG5BVSfqzXqT8xOZNWor4xg+Hn4EwtpGLgZhg/qA52ZX2BLq3iTu9p2+VFTW9Ln2tB4HzG
	Gci4PVdTHgaBAayUzJakPIEH09exexIWN8qrX0jVpQx+c0SlUG/1MEJBT3AfygIMvL2W0M31ffS
	0ISaqukYhPrcLkL+K9BaRg+25ZRMRZQ
X-Received: by 2002:a05:7300:8410:b0:353:599f:d63a with SMTP id 5a478bee46e88-3537e0202abmr7181873eec.17.1791660438526;
        Sat, 10 Oct 2026 12:27:18 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:9657:9541:a576:7d2f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm18641806eec.10.2026.10.10.12.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:27:18 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] eth: fbnic: return the page reference taken for a dropped Rx fragment
Date: Sun, 11 Oct 2026 04:26:50 +0900
Message-ID: <57e762aa85874571b506e5b5a55004029b4b2a5d.1791659860.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791659860.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791659860.git.yhlee@isslab.korea.ac.kr>
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
index b4ca9f7e8bb2e..ba663fe7598f1 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -1076,6 +1076,8 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
 
 	added = xdp_buff_add_frag(&pkt->buff, netmem, pg_off, len, truesize);
 	if (unlikely(!added)) {
+		/* Give back the reference fbnic_page_pool_get_data() took */
+		qt->sub1.rx_buf[pg_idx].pagecnt_bias++;
 		pkt->add_frag_failed = true;
 		netdev_err_once(nv->napi.dev,
 				"Failed to add fragment to xdp_buff\n");
-- 
2.43.0

