Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148080;
	b=ARTprzjnAasYuPhQK178HRB5fNXNpkew3cJ8LlaUvhWoUAJBtxSCvgepqUFtPzk0Psh8
	 N3JeuyO50LdpfPx9EzriEoTpuxFz5dSDSKcQx1V28cnWPkgfagyg1SL4u0bGsMqdxlr2N
	 J+Anmuxd9JMlTBfNq08dHxOX+HK32QqNG4a6jwPrGY9IWGf50i+ZCrpV16BXqUWY7frUW
	 Y4aMgKohISLXDVme4RsOIURseADI/b+OZAcFlqT6vhsQAV9mnX+0dlXKXuTwND7R+MOKl
	 F0sGlDS/YIHS5TqTs5jVvi7KWgzOfm1AAvoXLD1PWEabh8tAkDe4v5N0UM5VYKdHokQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6yb4v8US2fQ+VXTFuRGxmQ/e+mAuqVK2GIuH+UyXCZk=;
	b=2IMGJJk343nAjOINgaI2QtAuU4hkZINcdp0/qBLiimYj3bGpjEWU+rrD0ad6RUkqZTIy
	 UGY/44sMYDL36WyXpZbb129JZFKLJT9pznvxuRZx+fBmPcr6JTG0NdLkDiPAYTWIKR7Dg
	 W7Kv97HThj/yO2mBhAUv9MxzR8XzOit6pyzUVdiSufEEQevEPRurKkaA4X1hKY30Q9Rpw
	 VWJYbV6MTAdTEBwi4Jjqn6OU5d6F9IL+PU1oFs2MJfDAP4235X0ZtPLGQGoMVs8EvvWcd
	 7cKZxzAQvoZgtGrKzrRTXPj6I18fMmHqmBPZqHz5EVRNnwAVh23ynUe+ClR+5fK/uEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cF5dHCRi;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46F606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B46F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cF5dHCRi
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1adbf62dd31so137402c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148080; x=1794752880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yb4v8US2fQ+VXTFuRGxmQ/e+mAuqVK2GIuH+UyXCZk=;
        b=cF5dHCRi1ruaVV+KorKzsfAqqPVerArC/2WeQ/Pb2+f/4CazSe8zlwWxVtxAQGd/yb
         2Y7uihJXzlc07Cdsc5UtQTAajvym+BEEEXltMwaWUaC+xBN5mlVUGqXzNlxGwcAohWfe
         4YGWdywBNPGnrLHa9dAhbIl8KDnLwTxhzauV03gqnqPDlRg8SEoSCpiMeqwJrXxaTXAD
         RqHnfcJiMWiIzxP5sXoL+WaA685JTBLWVx5eLMXxTWhgOhHGmz9j/tlYqkUBFFRokcar
         v3rEaZmmDza0sklGV+zi5hrzvhlRkS8qcyOSsFTPYPuM1gsxRt46J4Wzvwt6YoO3ftUy
         C2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148080; x=1794752880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6yb4v8US2fQ+VXTFuRGxmQ/e+mAuqVK2GIuH+UyXCZk=;
        b=Gx86iSeZB6kKhzTLyq2QYRQFD+/28vJrSrz27V5vVl3lJQWr+bxFKkrKNqD/4PuLI/
         Ioaz6LfkjgVnyflM2MHYcgvDasL87oEf69w+mzNyRKLkagNeTJiMMMOgSdgc1aYzhsjC
         zk0DckY61L7Nu5zukTksb1IhuTbxbE9llIKJubjaXmyFzRu2WGRN+OT9xqdYjYwSzLJf
         nmlbh7N++WdTcD4AQ8WFKHpijYphycix6cae8y32I/4+9vSq0Sl5MlxqYGvN9KhjeHiD
         BPeCXzDaGu4qXK44b59aMNpgWOs7AnlrV0y42LRQ1POWRSmGbXERy0dVZ9XEGSia4k/V
         LAIA==
X-Forwarded-Encrypted: i=1; AL+hErEWQDd8HYWORon6h51QzQ7xijp//6E+jLYF8B+VQcyDgHyH2qocplBiqpKZQWi49dsXUqIqFSSGIkh7wuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PwQqxdpLSYUhWGpEMMuSGeTotOOSjeB5vIYyt0h9yyjbEkoXK
	54YXnkpDbcN3o87ihvXCvSyx3uaq4guoRf/jONomM1H8QzmesNz+wlbz
X-Gm-Gg: AYBFou16+ptWWBz2lE5H0OuhZkxSxniVNh4cnuHM33u5HxwGrIfd2zTZrz+/QlCCSSf
	2FlRtAIxAU6OPppAMtU2qEkPEqa4IECSj3i2g3h+qEzUldRzGAl+bSlU25JpRz16ZLliWKAQ9A8
	zVhv6VyQzOmpNT1K513JNLCTKgNBi6WU8uSEmuoaVKrwx+/qfD4lox6gPHUiwCBIibC2gQhT/++
	ki0Q6QaM7nSp3Yh3LwK57t9q59F5CrdczloSjQxTntQb/T3zEIQfQX9Zzt/MFPZLmWNsaHDj9o2
	eB2RTmmqAeHPbKCW4WBekMwK69TnmCcVAc0INuU32/48xLwRWY+tAVYcnHSruTgUBY4051mWNCj
	QEODvJnlL6HWW5JJdefwwudI+8dDy9YtD/LToc5n4kY3J5lFj0Xrp3LO45MRc3rndaZ9+aIKhAU
	zvP3MMyrTiNBL+pofxwnqJbkCw/qHBPh1reI7yVszn7IMn8YYwpr2HZgCdrmX9mb2GD55lduEq9
	n3ZPh4VhICIBDbxMVzH8bUbwEzBFznEUFSyG0CfA38JPRAs3GkhLR12CffCiQnDIqZ+5YTnbEH3
	iwsp5ptsBe7xQsjd0B2FmOdUPXykAwWunZglSTg=
X-Received: by 2002:a05:7022:1701:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b39fe9a6f7mr2245006c88.18.1794148079496;
        Sun, 08 Nov 2026 06:27:59 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm7141347c88.10.2026.11.08.06.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:27:58 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v4 3/3] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures on PCI
Date: Sun,  8 Nov 2026 19:57:07 +0530
Message-ID: <20261108142708.489067-4-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108142708.489067-1-skalpesh942@gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com>
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

A single timeout in rtw_fw_leave_lps_check() does not always indicate a
frozen firmware; in noisy RF environments or during beacon loss, the
802.11 null data frame ACK can be delayed or dropped. Immediately
triggering firmware recovery and a full hardware restart on a single
timeout causes unnecessary disconnections and kernel warning traces on
idle links.

Follow rtw89 by introducing a consecutive failure counter (ps_hang_cnt)
and only triggering rtw_fw_recovery() after RTW_PS_HANG_MAX_CNT (3)
consecutive failures. Reset the counter to 0 on every successful LPS
leave and in rtw_core_start() so that cold starts and hardware restarts
always begin with a clean slate.

Additionally, rtw_fw_recovery() clears keys via rtw_iterate_keys_atomic()
under a spinlock. On USB and SDIO, register writes in key clearing sleep
(via usb_control_msg() and sdio_claim_host()), which would trigger a
BUG: scheduling while atomic if executed. Because USB and SDIO do not
support firmware recovery, restrict rtw_fw_recovery() to PCI devices
via rtw_hci_type().

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 5 +++++
 drivers/net/wireless/realtek/rtw88/main.h | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c   | 7 +++++++
 drivers/net/wireless/realtek/rtw88/ps.h   | 1 +
 4 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index a74f199a93a..7009f8ae3e5 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -638,6 +638,9 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
 
 void rtw_fw_recovery(struct rtw_dev *rtwdev)
 {
+	if (rtw_hci_type(rtwdev) != RTW_HCI_TYPE_PCIE)
+		return;
+
 	if (!test_bit(RTW_FLAG_RESTARTING, rtwdev->flags))
 		ieee80211_queue_work(rtwdev->hw, &rtwdev->fw_recovery_work);
 }
@@ -1536,6 +1539,8 @@ int rtw_core_start(struct rtw_dev *rtwdev)
 
 	set_bit(RTW_FLAG_RUNNING, rtwdev->flags);
 
+	rtwdev->ps_hang_cnt = 0;
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 6ecbeb4ffe4..525f17590ad 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2113,6 +2113,7 @@ struct rtw_dev {
 	/* lps power state & handler work */
 	struct rtw_lps_conf lps_conf;
 	bool ps_enabled;
+	u8 ps_hang_cnt;
 	bool beacon_loss;
 	struct completion lps_leave_check;
 
diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index add5a20b843..fa3a4e476cf 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -166,6 +166,13 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
 		rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
 		rtw_warn(rtwdev, "firmware failed to leave lps state\n");
 		rtw_fw_dump_dbg_info(rtwdev);
+
+		rtwdev->ps_hang_cnt++;
+		if (rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE &&
+		    rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT)
+			rtw_fw_recovery(rtwdev);
+	} else {
+		rtwdev->ps_hang_cnt = 0;
 	}
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/ps.h b/drivers/net/wireless/realtek/rtw88/ps.h
index 5ae83d2526c..b088fad7cd8 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.h
+++ b/drivers/net/wireless/realtek/rtw88/ps.h
@@ -14,6 +14,7 @@
 
 #define LEAVE_LPS_TRY_CNT	5
 #define LEAVE_LPS_TIMEOUT	msecs_to_jiffies(100)
+#define RTW_PS_HANG_MAX_CNT	3
 
 int rtw_enter_ips(struct rtw_dev *rtwdev);
 int rtw_leave_ips(struct rtw_dev *rtwdev);
-- 
2.53.0

