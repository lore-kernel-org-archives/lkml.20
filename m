Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823848;
	b=F6WrB+lPnuJ5nnSW3FA9EdXxz920wuC29qXOjoj0enXLfScIdmTK3phsN9Pezhx0L8ty
	 qewpibD3TbUpg0duWpXFLsmsDkmyjzIEaZVpPhd53IId5oJu4sNxJOrqMKwxPd5QTDrgK
	 KCBcOJdhyy40XQ0qW8M5FNp9kduzzB9DM7ljuee8/YJN5LzcoRbxS88dRVuUXJtqXt9xS
	 UlXbWbdTCwpwbH+jy4OoXgu+R/Emf96QXw9DTRVOWXYSn7w2SzpR83hPjrizEsnsMj5HF
	 t27MBZtWE/mVXNRYne2khtl+dtCkxhWDIaZjujTuoZL3bvLAaUjyBY8DtMNPipY8PqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823848;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=H9zdV4HsOxYw8o3VgQCy5JYGPEbSgDNQYunQ4ZytMis=;
	b=v/wUg1hZdEGEDYM5VcrUQYJKXjs56CCBgOCItg6PsKuTd1wDhaG5XaaQdly6Mnwa+ojn
	 9PEXLW2da24wFioMga47kRpj8EQV7/0zFoE6oIz8glG32UNPcRLw+tGP0T3ciYTXCO7bM
	 OaiU1d5FgiyAPj1uU66ntX3D5HYwWW24SVuCmrrvr8O16IaAbBLWOi7PNK7V9AVN+r33i
	 MPAeqZLDzA/nEAttVVvRhRMa7sLlXI1uetQTe8AdqO0FlmpX6Re/GtvlLJR+9UIE9CZ/I
	 P30ArPrt6E/V+HCcKXx7IcX0frcMbxJdyAiD3VMy8JRnaVmIReLuS6QPvXh3HgiAk7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=RqDRWir0;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61E606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC61E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=RqDRWir0
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 39F1960EB1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:10:46 +0100 (CET)
Received: (qmail 28155 invoked by uid 990); 16 Nov 2026 10:10:46 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Mon, 16 Nov 2026 11:10:45 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: leonard@lausen.nl,
	Luka Gejak <luka.gejak@linux.dev>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 1/2] wifi: rtw88: 8822c: filter hardware-handled control frames on SDIO
Date: Mon, 16 Nov 2026 10:08:03 +0000
Message-ID: <20261116100804.425592-4-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116100804.425592-2-leonard@lausen.nl>
References: <20261116100804.425592-2-leonard@lausen.nl>
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
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.599999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=sHlgw8fk8WKCnGQM40/fVqDVr+su7sFDjaRFwuBjyEE=;
	b=RqDRWir0iSSeTbhe72BKJIU+Zmo/9kT+jEJhuXAl7hgJBYSYMbMQgzv333Ycu20ycROxqSwCOx
	DL8ov5h+tUmXzqjPEpGVcririvrTJY1w9hcdzWpZ1KOzpDGpU4E6bVnbuhDJJqc83cngTRr0hUir
	B3G3YoKpOqMgimF6ST1Mw7mFbX17OOycr5LLfFp7Gp9qgYhoUAfOYWstij90Aj0TfiCVXZAwox4z
	UKvflM1TRCzb3ldnMDeo3oqJX/V8IrdNTtH8Pgdf7EE4og36voxbHAEMOFcyqnpR/1INqE/1T8/6
	9/8OxFn7gRKD7tf/2i/bfeBggFfvMEhtnWLQJ70rsxyud6diuS7cI6JU+EjJnT8J0+TGQaltZC2b
	eOXDOveSDHHoaAFQsQsScSPHXPyuTI0xJhDCx3B1N/6j829e7ifcx1/Zu96FqBTkDmkcUCERNC2y
	kmtUp3p8oK7Wf8PsoZJPbh5mAdg1LOvgee77Ctv4re1YDZDuymJaR7cbTcxBO/s1spdotYTSZw9X
	B14ELXRkXwUyNDepjgOw+6zBsM8reesCx1NzmCjxPbuQEnEnwjGBXnYfaC4fJ9/rWXt5PJ+mwmto
	SZ6scOpaXFkXNtO1pgA9HQMC0OpVMI92PxKbJ43TN7RHRw74fQIlmpJAeTpeLp9/2BIi4JH0Ua1O
	Q=

RTL8822C forwards every control-frame subtype to the host by default.
ACK, Block Ack, RTS and CTS frames are handled by hardware, but forwarding
them also adds small SDIO transfers to the data path.

Clear these four subtypes from the SDIO default RX filter. Retain BAR,
PS-Poll and the remaining subtypes, and store the default in rxfltmap1
so FIF_CONTROL can still request all control frames.

Limit the new default to SDIO, where profiling identified this overhead.
PCIe and USB receive paths have not been tested with this filter setting.

FriendlyElec's RTL8822CS driver also filters control frames at startup;
this change retains additional subtypes for mac80211.

Link: https://github.com/friendlyarm/rtl8822cs/blob/c8b944a34bba2116fcdb060362bde40242bb87e5/hal/rtl8822c/rtl8822c_halinit.c
Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 drivers/net/wireless/realtek/rtw88/reg.h      |  4 ++++
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a1..8e220580be4f8 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -587,6 +587,10 @@
 
 #define REG_RXFLTMAP0		0x06A0
 #define REG_RXFLTMAP1		0x06A2
+#define BIT_RXFLTMAP1_BACK	BIT(9)
+#define BIT_RXFLTMAP1_RTS	BIT(11)
+#define BIT_RXFLTMAP1_CTS	BIT(12)
+#define BIT_RXFLTMAP1_ACK	BIT(13)
 #define REG_RXFLTMAP2		0x06A4
 #define REG_RXFLTMAP4		0x068A
 #define REG_BT_COEX_TABLE0	0x06C0
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2c40..03e714c3c2e7a 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -2096,6 +2096,16 @@ static int rtw8822c_mac_init(struct rtw_dev *rtwdev)
 	rtw_write8(rtwdev, REG_WMAC_TRXPTCL_CTL_H  + 2, WLAN_BAR_ACK_TYPE);
 	rtw_write16(rtwdev, REG_RXFLTMAP0, WLAN_RX_FILTER0);
 	rtwdev->hal.rxfltmap1 = WLAN_RX_FILTER1;
+	if (rtw_hci_type(rtwdev) == RTW_HCI_TYPE_SDIO) {
+		/*
+		 * Hardware handles these frames; retain BAR and PS-Poll for
+		 * mac80211. FIF_CONTROL restores all subtypes for monitors.
+		 */
+		rtwdev->hal.rxfltmap1 &= ~(BIT_RXFLTMAP1_BACK |
+					   BIT_RXFLTMAP1_RTS |
+					   BIT_RXFLTMAP1_CTS |
+					   BIT_RXFLTMAP1_ACK);
+	}
 	rtw_write16(rtwdev, REG_RXFLTMAP1, rtwdev->hal.rxfltmap1);
 	rtw_write16(rtwdev, REG_RXFLTMAP2, WLAN_RX_FILTER2);
 	rtw_write32(rtwdev, REG_RCR, WLAN_RCR_CFG);
