Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53E39D6CA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156726; cv=none; b=S1WOaBzrp42Uz1iO5y0tSnTbxs7f5fK4eio/rtCpXIk4g+Xxi0SceOL3QOk2GajKk+AdBc/gW/EKna3LGdClV70WZn7b48F6B2SAY0wimd/m19u5U45Jjk0wCDnH/jwaHqHt5Ck+Ywi0a/yZN0QIcWlxtjRDEq+iagV5L/1QnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156726; c=relaxed/simple;
	bh=vclbbxrEXBh2L03+0rbD5hWawomsUAw6S4F76/NZMP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jqs8SKwkO4mSyWg1q5Qj1Z0m631kyEGYnMt9VIN9aBPAE2Gh69YAu60fIFhEfcLvpI9U31k6NZgoAzdq43jrowUdqEI4zY1cEHzts3ClrrfopnLnhZsUWasKf7grfcngfpox9VuLlSPkN/UwoZdbH/+z/g/0BLDGv24cpoL/UBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mrEXTzAi; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mrEXTzAi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vclbbxrEXBh2L03+0rbD5hWawomsUAw6S4F76/NZMP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788156720; v=1; x=1788761520;
 b=mrEXTzAihqwHWERl1PfC8HEjkFQjZyWbYgPYWU61uB/YfgFTelgOQ/V4gXkIN3G6l1ZPgzQ1
 W+hCIzz0UzVvtnIGE6V2JHLgQLsZh6WKSyLUQe8WpfrXMAt3mfdLUeQGOfWpqF2whz/OeE7HXlg
 XROdE7T6gXfz5Oe1pNH8/9vU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92e85d5713bf910f;
	Mon, 31 Aug 2026 06:12:00 +0000
X-Mizu-Trace-ID: 92e85d5713bf910f
X-Migadu-Flow: FLOW_OUT
From: luka.gejak@linux.dev
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v9 1/6] wifi: rtw88: add the RTL8723B chip type and SDIO helper
Date: Mon, 31 Aug 2026 06:11:39 +0000
Message-ID: <20260831061144.18631-2-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831061144.18631-1-luka.gejak@linux.dev>
References: <20260831061144.18631-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

The RTL8723B is a 802.11n combo chip whose SDIO variant, RTL8723BS, runs
a Realtek vendor firmware that differs from the firmware used by the
other rtw88 8723 family devices. Supporting it needs a number of small
adjustments spread across the shared core, all of which have to be
restricted to this one chip and bus combination.

Add the chip type and a helper that tests for it, so the changes that
follow can be gated without repeating the chip and bus comparison.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    Changes in v9: none.
    Changes in v8: none.
    Changes in v7: none.
    Changes in v6: none.
    Changes in v5: none.

 drivers/net/wireless/realtek/rtw88/main.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index c6e981ba7986..8f86f7c12de5 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -194,6 +194,7 @@ enum rtw_chip_type {
 	RTW_CHIP_TYPE_8723D,
 	RTW_CHIP_TYPE_8821C,
 	RTW_CHIP_TYPE_8703B,
+	RTW_CHIP_TYPE_8723B,
 	RTW_CHIP_TYPE_8821A,
 	RTW_CHIP_TYPE_8812A,
 	RTW_CHIP_TYPE_8814A,
@@ -2194,6 +2195,12 @@ static inline bool rtw_chip_has_tx_stbc(struct rtw_dev *rtwdev)
 	return rtwdev->chip->tx_stbc;
 }
 
+static inline bool rtw_is_8723bs(struct rtw_dev *rtwdev)
+{
+	return rtwdev->chip->id == RTW_CHIP_TYPE_8723B &&
+	       rtwdev->hci.type == RTW_HCI_TYPE_SDIO;
+}
+
 static inline u8 rtw_acquire_macid(struct rtw_dev *rtwdev)
 {
 	unsigned long mac_id;
-- 
2.53.0

