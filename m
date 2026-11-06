Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965611;
	b=hq7nW5u5zI1iONnwSU/wY9+RnJ3a5dZvg4NmtyvGHpJGUoK3McX5+vHQelOFR86h2N7b
	 q0gM2I9DvLF6p5TengqltoggaOFvjirsFlCnFgNLBokNdcZpSlUwMd9jMnj1hEUS2fyb3
	 wEIhlRkdMoBPRPsrWnMBPtF6D8QXjNAqda89gqs+qf4bLVQBl+9P1Lhvv4a00q8Irwdwo
	 dveyKaV0+I4gmCDIOvmSkGTUUKRoxNJ8vcMsD7NcYXxSuszqKZjK5sYNiJgI/BnGghNID
	 gi/zTHPtnGYZoW5RMVm1g8nwzwgrfgs7HBtWXkTWtO0tAR6kn1lAvjaJ3cz3COkwP4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ewbAZCHPYD2+chpQfW+XsvxDzLbZ1NT6epDC+c8eB2U=;
	b=Gv9Gs9h7FDvcMWzJZdOVNCOHJZe8d0r1rn5QMsiD4fgWP3GmDH2+9my9+S51heQynbiC
	 f6+RjTfwqRf1Zqk/3hEhkqhi0ty8cKUaHu/J1VpeyuT+w/ZOf8DC+2bHEMEc0b0b0KTlC
	 oZSgdj6jiUgtQZtCU5J53uPEz28iiVrjhjvrtJQt6Ev6c9AElf/R1TnRUsZP99C5kjZnv
	 CUmVQTcvqHiCCtE6KBYXwi4qCLQ0dsG0d1uQGyK5gJp+1B+nxXagYiaIHQL1/mvT3x89C
	 /CRnDMrEmjTVYsNlMVKhqaoW+loqaTQjmpjrPLwjkWI0pP0Nds/Fg01mBNuwCOwtK2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p99OWJ7k;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDDE606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDDE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p99OWJ7k
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so341987b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793965610; x=1794570410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewbAZCHPYD2+chpQfW+XsvxDzLbZ1NT6epDC+c8eB2U=;
        b=p99OWJ7kmAedUPv6+7kfP4cA6i4cIzm0B6jrcYVuOlZbnnvtgMJfTYlzzAeOtbyx+J
         NyXYVOkUjR/5hVj3g2ZKhH56r1+xXYJWJf9SvHnD3K6oE50aHHHTjVnPIT5vQFo6te1k
         P1KfnYahJ1I7h7Gd1/NUkCyB/qjZeiuajXMX4WAxroYG2VAvwo+YRAvyzebXjKdRGTHR
         g70rTX08dm21A3hL1cgnjUtlrvS/m8RSqXVqcrDcpoVvCjW2dy4IVCJa3XnJgFfKx/KQ
         h4xmg7kA01ckFbrM8cBuxvKunKvhI8+NWzwVKGrc2qprR13tg+MZHxinItmZ+mhpp8Rx
         OWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965610; x=1794570410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewbAZCHPYD2+chpQfW+XsvxDzLbZ1NT6epDC+c8eB2U=;
        b=rPPKX4aUuXHjXZhNZRWibP/5nvrzzFFkFUNH7vuYioKZiAjoaR2GWHt9x3ILjnc1BH
         E8/Rxh5Xp6p8VWCtwnrNCt8FWGNNPHxOqPK6iPPlBujq4NStMOfYd/zbH9PfgiZlVj6G
         NmlyRVT7yWUXejQeHxDN5dyaWT7tzMp7o4kWi9H3HiDjgF2mNhbaVkjIje4+ymP0cGeM
         NkO+P3Hfu6wW9cN3tqRlhh23kjQbEA9Ca615YRWmD+t/fpABGAR1LZtPsZ7Yi/SCvOyU
         GyIMDJX3WvoNbjuzG5It4y6BFR8r8o9RhUoVF5p/6hbufQ9VUsJ7wzVwoLFYUqtKXVK5
         Dxlg==
X-Forwarded-Encrypted: i=1; AKwUvBwUONL4XSxTYYwKy5tOxxkRcltS5RwZi9gmYNPiOFGhcsVmxcl+J1dG8OOeT9UUrTUcP2coMqRLpKghQ0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ml8033w9WbcTaXbTAT4CnRLPxNIS5tH3uZPEdi0VGspNfPvPY
	44sx9PeFnaH8BBtDbsedETaGYjchjxdenYvEJF6ang+VsjNdSad2yhIk
X-Gm-Gg: AYBFou0n/YC9BI5qh+A9A7UfMSxI5oWtMo9uDoKKSlW+Fvg0lmkABFitqrgB6cNl6j1
	HUg4r/c9PoVyEMzUq6A8eDWIoT3b4x0QeD3pykB4UMjURYmIb1gP9rjcnSF5Vub0r9dlebHWEsV
	IZ0wsQhcddxKnJwxvatQkHT7MXu0enXbhEjiWe2Z77xJpGBUxeL6i16md9RaBJkqSKGYj3HpFZS
	Ah+v5Wu/HgynaKN+f2GNwtXLmAArAyo2CsIBfT/KeCx2C9Mv1erE8NsltkuoCXE0mUKQETOPV0B
	BjMlqkdNNEqRsMuLlHvs6PUnB7tvz94BOQvsNowacoBaXJ4U0mQupwWjxwXTDaRd1Xh3wzcDlnk
	FIJjuWr3EPvewO/DqlILD5UnTB0XpDvsav8Mw8mZ8EOokL4n5X8BkgkDdmWIss6afSsel22eOV0
	t7ORhKDn8h9Wbd5RsN8kLxtMLMpFx1sMOBE0DsfSGR08wIueKkp8+59FFZF54IjqQeQFWlLedau
	UR/ZlwGZATj5XLauNyYcN9fuvhGoyaI0alW1wJ5N8Ql+X++iRl74OKDA2FbGbadqRRVtVebS+g/
	hk8FqmKNb/25pkJLYnJ4c6oxD/vF1hVz6PM+Y85fprTbEza7
X-Received: by 2002:a05:6a00:2188:b0:8a0:3072:ee9 with SMTP id d2e1a72fcca58-8b37ab9ec04mr2326503b3a.13.1793965609946;
        Fri, 06 Nov 2026 03:46:49 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35921deb7sm509832b3a.12.2026.11.06.03.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:46:49 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v3] ASoC: codecs: wcd-mbhc-v2: cancel button long-press work on deinit
Date: Fri,  6 Nov 2026 20:46:28 +0900
Message-ID: <20261106114628.2555176-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

wcd_mbhc_deinit() drains two of the three works embedded in struct
wcd_mbhc before freeing it - correct_plug_swch (via
wcd_cancel_hs_detect_plug()) and mbhc_plug_detect_work - but not the
button long-press delayed work mbhc_btn_dwork:

	mutex_lock(&mbhc->lock);
	wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
	mutex_unlock(&mbhc->lock);

	kfree(mbhc);

mbhc_btn_dwork is armed from the button-press interrupt handler
wcd_mbhc_btn_press_handler() with a 400 ms delay:

	schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400));

and its handler wcd_btn_long_press_fn() dereferences @mbhc
(container_of(), mbhc->current_plug, mbhc->jack).

wcd_mbhc_deinit() frees the MBHC interrupts first, which stops new work
from being queued, but free_irq() does not cancel a delayed work that was
already scheduled. If a button was pressed within ~400 ms of component
removal, mbhc_btn_dwork is still pending when kfree(mbhc) runs, so
wcd_btn_long_press_fn() later executes against freed memory
(use-after-free).

The freeing of mbhc was introduced by commit a5475829adcc ("ASoC: codecs:
wcd-mbhc-v2: fix resource leaks on component remove"), which switched mbhc
to kzalloc() and added the kfree(mbhc) above; the deinit path cancels
correct_plug_swch (added with the multi-button support in 0e5c9e7ff899)
and, later, mbhc_plug_detect_work (added in 0c105997eefd), but
mbhc_btn_dwork has never been cancelled there.

Use the existing wcd_mbhc_cancel_pending_work() helper, which cancels
mbhc_btn_dwork (via wcd_cancel_btn_work()) and then correct_plug_swch,
matching the other cancellation sites in this file and ensuring
mbhc_btn_dwork is cancelled before wcd_cancel_hs_detect_plug() briefly
drops mbhc->lock.

Found by code review; not runtime-reproduced (requires WCD codec hardware
and a button-press event racing component removal).

Fixes: a5475829adcc ("ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v3:
 - Resend as a standalone patch; the previous version was mistakenly
   sent as a reply to the original posting (per Mark Brown's request).
   No functional change from v2.
v2:
 - Use the existing wcd_mbhc_cancel_pending_work() helper instead of an
   open-coded cancel_delayed_work_sync(), per review - it cancels
   mbhc_btn_dwork before wcd_cancel_hs_detect_plug() drops the lock and
   matches the other cancellation sites.
 - Add Fixes: tag and correct the commit history in the changelog (the v1
   reference to CVE-2023-53842 was inaccurate), per review.

 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1623,7 +1623,7 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);

 	mutex_lock(&mbhc->lock);
-	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
+	wcd_mbhc_cancel_pending_work(mbhc);
 	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
 	mutex_unlock(&mbhc->lock);

