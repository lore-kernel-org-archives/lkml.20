Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A225F99F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939981; cv=none; b=O0HOA7/bVhtUgMbqkuZ0e7ZTkl245W04HLyTSYp2MewJMhveKe2e0dzMTaoGTixW3mkY9r0GBqHj/t2cagzy4GAGlQYiYt10SdgfzxH6EkbswtcGWlBA20u6A+iYFjFHkAAmb5emo4kKuspmlrtnJP2IhIbmwOdMNMB5M7PULI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939981; c=relaxed/simple;
	bh=1HiIcPTQpatgTULQZq+hKSjJxRyFSlBPlKLxkQTGBJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYcBC6eLu57vxmO2QLbHNVq4P9b/fZ+wQu7z/pPQijiNT3YkZerjuz8jToKRH2pN44tX3yEYjGr/TTCVlHPL/JPIY0ys1e0vRRTOkcPt2Q1CYTJfRtumrQCOYEOKNMXkjs4LBRPNL9POXHhaLmUFbxZhLXUSA1HrwEVJKeXly0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=coLEw6CS; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="coLEw6CS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1HiIcPTQpatgTULQZq+hKSjJxRyFSlBPlKLxkQTGBJc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788939977; v=1; x=1789544777;
 b=coLEw6CS11UEyfIKmGB6/shFa1kz53s+d0aPO4zmlEZRrd8jUoBOnwyth7Ex50gnRJnQ3FZ0
 HtZpbWvk8qzdCDwCtzThDe5+q2fXLFZlCVp+GSUGhXi1GzxCVr+n+vrU+Va6N1U0FyctRMTANLw
 vWMLHILGtEVfM2RGI066ARbY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa9e0f830415ec3f;
	Wed, 09 Sep 2026 07:46:17 +0000
X-Mizu-Trace-ID: fa9e0f830415ec3f
X-Migadu-Flow: FLOW_OUT
From: luka.gejak@linux.dev
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v11 2/7] wifi: rtw88: rx: mark zero length packets on RTL8723BS
Date: Wed,  9 Sep 2026 09:45:51 +0200
Message-ID: <20260909074556.55709-3-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909074556.55709-1-luka.gejak@linux.dev>
References: <20260909074556.55709-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Like the RTL8703B, the RTL8723BS reports receive descriptors with a zero
packet length, which the vendor driver drops outright. rtw88 already
flags these as having no PSDU for the RTL8703B, so extend the same
handling rather than passing an empty frame up.

This is gated on the SDIO interface rather than the chip id, because it
has only been observed there; the USB variant is not known to do it.

Co-developed-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v11: none.
    Changes in v10: none.
    Changes in v9: none.
    Changes in v8: none.
    Changes in v7: none.
    Changes in v6: none.
    Changes in v5: the zero length test now evaluates pkt_stat->pkt_len
    first, so the unlikely case short circuits before the chip test.

 drivers/net/wireless/realtek/rtw88/rx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rx.c b/drivers/net/wireless/realtek/rtw88/rx.c
index 01fd299abb7f..fde21c840ac0 100644
--- a/drivers/net/wireless/realtek/rtw88/rx.c
+++ b/drivers/net/wireless/realtek/rtw88/rx.c
@@ -253,10 +253,12 @@ static void rtw_rx_fill_rx_status(struct rtw_dev *rtwdev,
 
 	rtw_rx_addr_match(rtwdev, pkt_stat, hdr);
 
-	/* Rtl8723cs driver checks for size < 14 or size > 8192 and
-	 * simply drops the packet.
+	/*
+	 * Rtl8723cs and rtl8723bs drivers check for size < 14 or size > 8192
+	 * and simply drop the packet.
 	 */
-	if (rtwdev->chip->id == RTW_CHIP_TYPE_8703B && pkt_stat->pkt_len == 0) {
+	if (pkt_stat->pkt_len == 0 &&
+	    (rtwdev->chip->id == RTW_CHIP_TYPE_8703B || rtw_is_8723bs(rtwdev))) {
 		rx_status->flag |= RX_FLAG_NO_PSDU;
 		rtw_dbg(rtwdev, RTW_DBG_RX, "zero length packet");
 	}
-- 
2.55.0

