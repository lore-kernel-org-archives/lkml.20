Received: from mta1.migadu.com (out-18.mta1.migadu.com [95.215.58.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A24483BE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759777; cv=none; b=VoeH8nhZN+ALuV1kcl6B/pq3VqtkWxkZNIRI6RaFi0FfLG9Iu3/+sRLSGXbl0HL3utcTkePj8V92wPqsdmzQQbYj2EVjbQsJPUtN7gwNPJY50nqv4eKfBBe/SJmu6Q91Vv4x3LTVDrj8aWQQxBzZg/Ea1/P+/7ZEy9KHuDHmhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759777; c=relaxed/simple;
	bh=D/kPwIXjj1uCkHtXFP4NiUR/aBWo83iDbuIBYq4tCTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfDJrBMOgzoXhyJ7ES29EowdOW/+8z9ozspu7UaaXUeeN1byf+Q5dvpmEWqjD6z1/vF5Um7X2PBDxEhZizYCwMqjQXy6n4EghiwS2/1vQAMoeGZBO9cLZsfcMW3b5zE4lKGSYhV45xajzxkf73b4J3hZQslOvawSJK/qumH/2iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KJKBo0WE; arc=none smtp.client-ip=95.215.58.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KJKBo0WE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D/kPwIXjj1uCkHtXFP4NiUR/aBWo83iDbuIBYq4tCTs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790759772; v=1; x=1791364572;
 b=KJKBo0WEPDXCtgarGdgA7lSUmJVDlBOB/Bys2YQnuU34A6IP5kEq4TCTx6TjmKCHr8i6xdaW
 41X84SjsdFgI5+rlm9xFDrf7Z+Fmk0iYlARMoy3QapDwExPucbzANNRLC2qXHIjIebYDPCYbrz8
 ndqWEWpnviCTCfIozIaz6Id0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9b5450acb9901d21;
	Wed, 30 Sep 2026 09:16:11 +0000
X-Mizu-Trace-ID: 9b5450acb9901d21
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v5 rtw-next 2/7] wifi: rtw88: assign the RCR per chip in rtw_core_init
Date: Wed, 30 Sep 2026 11:15:59 +0200
Message-ID: <20260930091604.52891-3-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930091604.52891-1-luka.gejak@linux.dev>
References: <20260930091604.52891-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive control word is the same for every chip today. The generic
default is written in rtw_core_init(), so a chip that needs a different
value has to overwrite it afterwards, in its own init path, far away
from where the default is decided.

Add an rcr field to struct rtw_chip_info and assign hal.rcr from it in
rtw_core_init(). Chips that do not set one keep the generic default, so
the field is optional and no existing chip changes behaviour.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/net/wireless/realtek/rtw88/main.c | 10 ++++++----
 drivers/net/wireless/realtek/rtw88/main.h |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 0f23498b5c96..53d8552c0d35 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2191,10 +2191,12 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 
 	rtw_stats_init(rtwdev);
 
-	/* default rx filter setting */
-	rtwdev->hal.rcr = BIT_APP_FCS | BIT_APP_MIC | BIT_APP_ICV |
-			  BIT_PKTCTL_DLEN | BIT_HTC_LOC_CTRL | BIT_APP_PHYSTS |
-			  BIT_AB | BIT_AM | BIT_APM;
+	/* default rx filter setting, or the chip's own value if it has one */
+	rtwdev->hal.rcr = chip->rcr;
+	if (!chip->rcr)
+		rtwdev->hal.rcr = BIT_APP_FCS | BIT_APP_MIC | BIT_APP_ICV |
+				  BIT_PKTCTL_DLEN | BIT_HTC_LOC_CTRL |
+				  BIT_APP_PHYSTS | BIT_AB | BIT_AM | BIT_APM;
 
 	ret = rtw_load_firmware(rtwdev, RTW_NORMAL_FW);
 	if (ret) {
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index d59f6e323adf..e0f389040089 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -1253,6 +1253,7 @@ struct rtw_chip_info {
 
 	/* init values */
 	u8 sys_func_en;
+	u32 rcr;
 	const struct rtw_pwr_seq_cmd * const *pwr_on_seq;
 	const struct rtw_pwr_seq_cmd * const *pwr_off_seq;
 	const struct rtw_rqpn *rqpn_table;
-- 
2.55.0

