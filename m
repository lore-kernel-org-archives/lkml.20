Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793540620;
	b=VNtQWFy0M1Ff9kK54hu20FF0ABkUBOANnGfHBV0wcCaSYkpXm9D4OOuDxyBI8qNtP5wG
	 GHet26RhABmBJOpQq1Z8xeasfb/tuWPbIUfxWd695ETD4NH/N5n20Mutu6OtNDz89et4Q
	 gF5NALIKeHIRDIFa8n7QoIqJ9fzf7UJUbTg7lOsi3WsispqCD3vaiDh+6Iy0BM32Pf7xr
	 z3Skx/yOw/d0pmigmmHTuLVKQcpuEhr6grKROR0gBqZdDtNTtll5QOWt6WMvHlAYmI7YN
	 ZzsmVYaTZK1eWHFFCEwXjMkB713XXXX3ewgxJphFHgy9siUIxWlHpCdH47PPNIlEjPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4661m1xYP/jYEqHVXb2ZQHfA5Qdo4lmezgeOZnGqpSk=;
	b=BhCDoC4CvFrvODfVz/sJhh9Vo3U1DRAjD/miK6TzZlkFNAD4+d7JY4cEV1yKoNcGcflU
	 SFhRV0O16pzuYVCkwvmdfXACUt4h6H4LR6bspeG4/oQf+nNq5Mhn74K6Qn98jLUwJXHHX
	 lRKEA36K5vwWVAKx+HPvgC2Yr2JgrJJ6hDIKGTurvlpM5sbQA2yb2xD6/OXUHxVaf/hiO
	 92ds7LMrF9PCgqNioZsg7cTxphVgpILvw3fDQnG1zbqVdABzK+4zb0vYWyBQ4aLiUQAD0
	 GHcCNzfkz+PdmTdfV/E4N0+RBOHZOQW1hwoXXPotgNV9sJvDkrxt1AW8afWpq3oKv0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eisKOQnv;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB27606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB27606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eisKOQnv
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35b2c599f43so2934612eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793540619; x=1794145419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4661m1xYP/jYEqHVXb2ZQHfA5Qdo4lmezgeOZnGqpSk=;
        b=eisKOQnvuhXLkFpTLtfmv29J4yIGP8l4y+CQnaDOTYY+ApcPlAkuI9OJbUqcBQazqM
         NGKpVY58FJd5KtwXwV7vqzHGC7Uo4fowQnAu3w/XfTq+YOj43laEFWiU+x7+QQJrrUnk
         ye8hz1U6Iku+8wJ1xBbiyyHtexPJdqQZOK879xmHeNb57yMpvfk3+HLNqqrN+EykPeoV
         Wk2BJwPkiZLUgeSLbvOAzK/ACa0oMRLy9GyCam3o3wLPUcvAjt26bMx+3j1LiuzRcSL1
         s6V1qqbVh//JrZi9xQb9lRm7UZFDEj2rMGSt3HNn321OUSHU4oTY51y0E4MAm5DjeN9k
         YTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540619; x=1794145419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4661m1xYP/jYEqHVXb2ZQHfA5Qdo4lmezgeOZnGqpSk=;
        b=nOUNmZ/AGhRHaXmrsYceR71pShsf2NmWae0/EM4L8QeMN4ZqEhkGPAy1cZ+IZrTozB
         IH9VeDHjnLHRQiOdCWpUayYmZEJWJ2ADcmte+VSgwotRyMJZ8cZIF8ZcMgD1E5qTFiPm
         H5uVO1zK4iD4MIyHxOSCf2LjnzDC17Z5879t5z8gclOksLx+6CGXkVIwNhiGkTY/asuj
         shc1hB3fRsRCgO17z+ahrAw478XtvMR59R/NIRgz5ZehgzMFkDlGgnJHxxm1BmgcKXWy
         l8Lb5hI0t81SRm95UOS4FWZ5Ro4CxnhnXfgfeCW3r7DbWLhZHcwBPqxFUSADVgwRLp7i
         IzlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdzNXnSj2GjTzPhx0dzUbonJPgHlrgeuI6Aa0UvrRziftuNX03qPf8OvpbY2LBde47AOuaT4TARK4XjyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qH/NuJUUXzrzy1XLSZhzt8ZOfY9/BMyAL8Y9UzRhl9/z2Hebj
	vZPOupF0828RVccGNTIyq+LNp9dyM12rUL9LgcuQct91DYkgpdqRFu06
X-Gm-Gg: AYBFou1cD0yFr9Pjg7g25qzjMQ2vOTHJdYxG93oTJXJIECjt811nlPXFXAaTSrU0sG0
	iDb+NczMBGIwQsPFBNjOWXywTlDX3t5LsuqvxLRGPw5F3PkWEChgZCE6DibsN21wNMDiuZPBduc
	n48aZxQg+ZGTQKyiqCk0ePScUqirV65gr91Qata4kZoLragksoqLZxDIMJhOYxXsxqP85f23MH1
	zuKQBTbizUUSUqoQ6tyzivEeQInYFPXxHfD0GwgdsD+y1gq+MyY/rx4rcss2XFYarTZI6RfrA7D
	RY8QMBuFALpkWLJDae9bdI9SP0FLz/YVsSx8Yy17dMTcPqYyQ1PLVC2zm4tfuby74wJXJYeQjaQ
	2sblaFCGQOV7mrXpcqlgRPOhBjZPNrSpBhYpOjzLagimCYuxARVcgOPW6KfmtUoIwX3W+rwEzpM
	mCNtM8qSp4SusJE73JyFW906FLG72j3iD6ipNwhBWwd7KMrLYH0fOCSFNtCNeEI4jsAcd2WpXpU
	w4W4Ruc4XiC6jw3go+gqg65bmxGkOTNT+8kSmijOXFqqLOHrG/kF+bZLXdrM5u29hI/XXhT5RMl
	//41OZbRJLvRsYF+QHxHFVhZ8ifHuud8jGxLFSzx/u/B9A==
X-Received: by 2002:a05:7301:7306:b0:366:2893:7421 with SMTP id 5a478bee46e88-36a4235f6aemr11038645eec.10.1793540618755;
        Sun, 01 Nov 2026 05:43:38 -0800 (PST)
Received: from KRHW1CJW23 ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm26717779eec.28.2026.11.01.05.43.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 05:43:38 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	neo_jou <neo_jou@realtek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kalle Valo <kvalo@kernel.org>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] wifi: rtw88: usb: stop RX work before unregistering hardware
Date: Sun,  1 Nov 2026 21:43:15 +0800
Message-ID: <20261101134314.39340-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Disconnecting an rtw88 USB device while RX traffic is active can leave
the RX worker running after mac80211 hardware is unregistered. A firmware
event can then queue C2H work onto a destroyed workqueue.

rtw_usb_disconnect() kills the RX URBs but does not cancel rx_work,
which their completions may already have queued. rxwq is destroyed only
after rtw_unregister_hw().

Cancel rx_work synchronously after killing the RX URBs. Only a
successful RX completion queues rx_work, and no RX URB can be
resubmitted at this point: rtw88 does not set soft_unbind, so the USB
core disables the endpoints before it calls rtw_usb_disconnect().

LLM assistance was used to find the bug and review.

Fixes: a82dfd33d123 ("wifi: rtw88: Add common USB chip support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v2:
- Drop disable_work_sync(&rtwusb->rx_urb_work): the endpoints are
  already disabled, so rx_urb_work cannot restart a killed URB (Luka)
- Correct the commit message accordingly
- Drop the 3e3aa566dd18 Fixes tag and the stable backport note; the
  patch now applies unchanged to 6.6.y and later

v1: https://lore.kernel.org/r/20261028141904.8707-1-enderaoelyther@gmail.com

Validation: A W=1 build of usb.o passed. Not reproduced; rtw88 USB
hardware was unavailable.
Sparse C=2 and Smatch introduced no new diagnostics.

 drivers/net/wireless/realtek/rtw88/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 64e1c3420e0a..56ca4496b2e6 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -1371,6 +1371,7 @@ void rtw_usb_disconnect(struct usb_interface *intf)
 	rtwusb = rtw_get_usb_priv(rtwdev);
 
 	rtw_usb_cancel_rx_bufs(rtwusb);
+	cancel_work_sync(&rtwusb->rx_work);
 
 	rtw_unregister_hw(rtwdev, hw);
 	rtw_usb_deinit_tx(rtwdev);

base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.56.0

