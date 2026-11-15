Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773992;
	b=y6DT3KaiPs9O4gAy6ollqmY0AZ2TFl1Ji+SmFy5S9NnoXObnUniAQxF9Pr48JXjoglKR
	 3+3wLnRTl/TQoHH93qQjc/gEHLaZe/3SweOwTHWqRETgiZxta7MsLupeTLCGugyCZuSlH
	 7ghv0gyTpbYRgFJOFWQ1phKAUguIjP+HxrjKKg7Wh3iTyp84+wq4nI52/qOIsxpB7NE+k
	 1cQhSNqbTF+LbqpvA485Ou6ddrNxduQJ2cK0dsmpQJqr0eBHbmCKPqxdOXxZNToKnIvs/
	 rwOnSKvolPtgSCS/zfMDBOVFghlIhpF+EmTP2pgKpQpK7Do3Z2LEaTFAPFOJqsCnuFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Msg8sO9VRukA4Hei2D5lHVguxjS5HyhmixWnygOYMJc=;
	b=BFKFXKgT3Pu7O0mrONTXIdzmzFElSqZwKvEcHN0N0vrToWINSD5avRr/tV7Pxj4J4b4M
	 /zYtPtvB/18c+cKVQKI+x2ZvpuWgfYWdGA3hS9UkbB6iLbBrjVFkkCQ0YNT5Aeg/XFZEe
	 hlX9zSq6vJepLgsfOuyEVL1mIZgCUMcbrKdchpDU057DB3zVViqR3A2f08VUKzV6V7+he
	 t7rrwtiHDY5RjkgUIsddXrgQi+E8+qnOoxcx4IHIoKqCDoAsXrfyQvTQvGaM4tlCjl5qo
	 q3DtPzSGT9rGW+oGsAJY2ur7DSjthsj7te0Zxm3oTFBc3EXIuDYkwPwqtYlXVUEY3Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLOUKAeC;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4E606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA4E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLOUKAeC
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2844933a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794773990; x=1795378790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Msg8sO9VRukA4Hei2D5lHVguxjS5HyhmixWnygOYMJc=;
        b=PLOUKAeCcQCQz0M/38Om3SvXG9D8b3doQaR4rhA3f+xlRDg3tlh9hMGBV6Xt1JkRi2
         LHAxn6i2FUohto29FXr7Wr2Wf+cYsoZHX7JXejTv6WwfuvXzt81XE874jec0MDn6sY5B
         oLpJHcVhi7IFJ1vyDO5rdBPKrOBrRdDH0FBd73+U2JNa9I4xX3PcXJHPa58U99dZUhX3
         y8RRGNtGf7efftcdJbsPNeQCFW/0WMwpQJIG1rQg5GaTbaNE+ILgr3KGQNhxA7elAlTD
         Y+AFDkga2b9H0f92owOE3B3yeGRLTreCjg7k2pT1vuFIYSGW5J5A6NLdA5vRdhQSs1lH
         unnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794773990; x=1795378790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Msg8sO9VRukA4Hei2D5lHVguxjS5HyhmixWnygOYMJc=;
        b=LOPMGs1zVaVLeBqN/crUEsxlbXvIgvKyRN6ICt5btHsE0coM7IVffsMhyzlIgDXuSJ
         8yywBga+i5YHPaNDVeJzL7/g6f1f3oGo6p6GwhNQBr9pJlNdQaS0feit2PjN5ckPCkU+
         0ih5l9LluwGECOKkAwTJ5PcOfTbXw85r/SQ2P3DIsq/sHiwbCsY5tvdSTio5GWlUGjo/
         uJugBosxkLn4d22K1kpckcKaAkIg/qo5xTW7kAwevRqqVf0fnpyptVHs9/3KFJWX78+U
         fDERYjiQPGjW6o5sg8vrACIkmRILBNKghMo0hPsrobn9rNxW+f7rl9m1GJU/564Zy1PA
         UWKA==
X-Gm-Message-State: APuU4Z/HKUtgvgdShG+FDhfp/scA2d8uPvF4e56OAnefZW41B9ZCb0fv
	ab2+vKge9FJHlctPuA1mQ/8QF7GoVECV4rY0nvuC6UAFWUKuICPjEM5m
X-Gm-Gg: AYBFou16W0we9f9GZfiHbQa+vHzVcnv61sUYCMRZRIjVvC5E3hsiQtMlset5tmWeZ8+
	w8H6alw7Z7aZwl+JvEJRpA0gd+sl6toFzWIps4HZPCp0x1AqJb0oOh8NTV0y1u/6pI1aZEGhQZv
	WZ2xcAQfmD7VPfC8nVjbBGfRXwSxod4R6iJ9qdQFquq2wixmfvjVAc2gMu4tDWW3zk/qYg2Fam+
	/BBAveW9wAPb0RULgn5IJoKQyI3j3FXKmWMhRfAo4rE5zxC96z8NG/YVDLsnOXoUDPhrQ67NvxI
	SJAeiems54Y5r9hsHhIoUIzwddmBnR1BS6EuB6KvdbLfMjek/9Uom9nI6BNBPUoFJy0E66dQCwA
	YN3LaJJ6EmkudID+FaIJJPmf1UzIzXZ6LXMXnUgtkuUI4R3E2C0QgwvlC6IifWHhNWo6kiA54iN
	Dr0q8TclqSXPKqq+jgnoNIyKP3TnUSvlvscfaHtyjDNx253Bz35ipQ4Lv7b/0MnLPWOaQzmOSCj
	eRuGXWbMTQIerRilC7Q94d580fiILXZjIcvNRul7TKukb2CEZk/1a+ksGPgALYJXieFOZPAe3FJ
	AAmBFaBkucnqoOQsKU231z7OII8WX3RZUlW7emrNhJfj/Uj17640vaEO+FJQ21MWRB8IvILyXS2
	cEaTMC9Lwnua4uTBCMaAqq3YV32TegA==
X-Received: by 2002:a17:90b:58f0:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b1b081887amr9091795a91.8.1794773990435;
        Sun, 15 Nov 2026 12:19:50 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:c:7f10:a86c:c753:9418])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm13382005a91.6.2026.11.15.12.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:19:49 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v3 1/2] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Mon, 16 Nov 2026 02:18:25 +0600
Message-ID: <20261115201826.181662-2-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
References: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() reads the bandwidth from a 2-bit register
field and uses it as the first index into dm_info->cck_pd_lv[], which
only has entries for 20 and 40 MHz.

When the chip stops responding on the PCIe bus, register reads return
all ones and bw becomes 3. The function then reads cck_pd_lv[3][nrx],
past the end of the array. If that byte differs from new_lvl, it calls
rtw8822c_phy_cck_pd_set_reg(), which rejects bw with WARN_ON(), and
then writes new_lvl to cck_pd_lv[3][nrx] anyway. UBSAN reports the
first of these accesses as:

  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
  index 3 is out of range for type 'u8 [2][4]'
  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
  Call Trace:
   <TASK>
   __ubsan_handle_out_of_bounds+0xdd/0x120
   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
   rtw_watch_dog_work+0x217/0x330 [rtw88_core]

The driver doesn't need to read the bandwidth from the chip:
rtw_set_channel() stores it in rtwdev->hal.current_band_width and
programs the same value into the chip. Use the stored value. CCK PD
only runs on 2.4 GHz, where the bandwidth is 20 or 40 MHz, so the
stored value is always a valid index.

On PCIe, a chip that stops responding still returns nrx = 3; the next
patch handles nrx values without CCK PD registers.

The fix and this message were drafted with an AI coding assistant
(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
submitter.

Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Cc: stable@vger.kernel.org
Suggested-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---

Notes:
    Testing, on an RTL8822CE in an ASUS TUF Gaming A15 (FA506IU) whose chip
    intermittently stops responding on the PCIe bus:
    - Without this patch, on Ubuntu's 6.8.0-147 and 7.0.0-42 kernels, 22 of
      the 23 boots in which the chip failed while the driver was running
      logged three UBSAN reports for the reads, the WARN_ON() and one report
      for the write; the other logged neither. Boots without a failure
      logged neither. The trace above is from 7.0.0-42, whose line numbers
      are three lower than mainline here.
    - With both patches on 6.8.0-147, whose CCK PD and channel code is the
      same as rtw-next's, a debug-only counter compared hal's bandwidth with
      bits 3:2 of 0x9b0 at every call. On a 40 MHz connection on 2.4 GHz,
      they matched at all 1389 calls, across 20 hardware scans and 3
      associations.
    - In the same setup, the chip failed in two boots. The function then
      ran 13 and 15 times while the chip read back all ones (0x9b0 gave
      0xffffffff). Neither boot logged a UBSAN report or a warning from
      rtw88 after the failure.
    - Build-tested on rtw-next (04c998418722) with W=1: no warnings.

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2c4..df7df76785e4 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4404,7 +4404,7 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	u8 nrx, bw;
 
 	nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
-	bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
+	bw = rtwdev->hal.current_band_width;
 
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
-- 
2.43.0

