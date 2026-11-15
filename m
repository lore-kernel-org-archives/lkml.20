Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794774000;
	b=Gt8ny7Jnbu06yzBKPls0IBEiZuF4WAbIW9JcbiIGseICXr3j2qndsMBTCtlpZiRynlqS
	 mxVPxzWku2t8G8cXpCBUZCPn3kGFDfaNBs8R5XF8HHP2ZCk77+ukLJp42L2ZAQd4VOV3x
	 +HPhaDdZoUZ4j6PZipINf2h7Bxr29Oq69Qjg/M1b9knaqn/5Pjum3tSvVp2UMj5fyl7BV
	 MKcem4HNp/el6x/fwSkx8vyc+tK0gK5A0aXeGKn0IVQdHcdx45y4R79l5zXM9PWKPmKlb
	 xg3Rr3lF2Cm2EmvhRLW0L6A9SAy3FP6/W2c2f6dit06IHjBu6B4aR5nbLz7X2yzIkoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2wLE6Jho1fk0tbZfdF2Cxh39w7CetYuxxfiNoiSkCk4=;
	b=mIPemyuy97/ti+L/LJVcOLDmzAHcvp0rPoKhj5JP2H9UpVg6faAqGllaMAbDB+AZnsrM
	 k8LKglKZYSDnTWqk1uhOQ+4KO/RSXKJLjFExIWjJgxIf0dAMPzm4/cdmcEmxb4ytQj40+
	 dCkLtV6z0Dx8zZMwt78Qv2JDoHuW982Q+M7k/DcPDJP9HZEkfjpFq/igz8avvzYFqPWUE
	 HgvJM+dkxpiP+Ok5TPrnYZzdg4uS6ZwteEm6GIEMETfDRmRJgBnx1fxgO4Een9anoWZLY
	 O6bJQGmOit8AX5WOERMZCqXtVierV8RCBesrp3E0YUNKp61W01rRLR3psG+ebSCadeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvoCoEwD;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17BC606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17BC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvoCoEwD
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso2214897a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794773999; x=1795378799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wLE6Jho1fk0tbZfdF2Cxh39w7CetYuxxfiNoiSkCk4=;
        b=SvoCoEwDo5eCOoo1BVV+dLdDT0ODRRSQGYsswW4JQ0+3jEEdDKJFRGs6lwPNHiNvE7
         Zfr9ncbE0mUXa8daFd4SK+nSCGdZYQIsxl5vZmYAEKEb/A3Jb230tG9nud0ogE5Wx53R
         S0gpjVXRJsn9r4gPUmJTC/69mvcLU+RhhWmzWnDFmKdEUbwfoeyR9Ip7646avw8nK8ti
         OsCrt82Y0Uvonf4AJOagi4YS8ns7cRdX5zSi4GU+48Kpf5g2iItamBfOxYOF3uydPCgW
         76YaKaqou18u+m3qroWW3iz/SSmr4CHYr3XZ3jKcTyepLLarbbRocxy39Bdny9+e5em+
         Y+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794773999; x=1795378799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wLE6Jho1fk0tbZfdF2Cxh39w7CetYuxxfiNoiSkCk4=;
        b=DdmhkyypmIFv4wl0ECi85O60z9igVIWLd7qjaxh74sTC0npbzEk/OOBQxvWmx4CllW
         lvzHVZzsnCp04mchnbYZEAE7jVzRN2BrEPMALGOxj6cUadFISxuOMGwKQjW5vqYwd8yo
         zpuUQP7JlJfUscTkoTdJTv7NKzsA5s+f5SApmu5GZSR8gnyA/A5ofmVYGFGyqBaaij30
         qiE6s6gWmXEJjo/mGKlkmwj11EU/YhoYVBYZTFmfmbk8vG93DrdHpamKTBrzNHZ225pb
         rfhHAal7w3yIIIOuCHOcEdzNSKOpVbKt+gF4CHMrzViT32X4OEHG8w7RAnxxGGpcw2LO
         Apyg==
X-Gm-Message-State: APuU4Z+kRCiPGn3qABQyk38Dd1AfEFVyge7u3wUBPd5szJOkw7LPOifs
	NWrHAl3nE2iWqC49uMOky6z/+rXed0onO9UnCXSZtVXTbQt4mEsolyTj
X-Gm-Gg: AYBFou1ouTtXmBoTzGbCgp5qx4+9kLWO5RGshw3OBluVgY8PDsBdOoUzs0kdw5pMWmn
	LAnJcQLpwz7PI0d7aKacnyl3A/IfNnV2qi+RU8wC8M9zZj3z6v+EQ3P0saHF8KbjWe5qs7tQCfU
	VFTymuXsHMDp1hxHgnNknMIui7qGpIEL6lCZHHYezjOI+QLzuVQB9yXCVc/AJtKHMCq16T6nsXe
	Ywl8OpW/Sd9R6Wkr7qmfKVGGgxeCvrqaKs83VuozRhlItXOk7v3luYsvEBQFhaPh+qT7ietbD8M
	NZ7V+xwEgZfHoWmvk4DkT0fcnX2CBQyB453W0LYUVtBkDmwsEn/vlYSnNCio8I7qsp0qoQFeRpN
	MJOlyrSq69cMaJKzc0870Jv5JimDbOJC6JzF00xF2yZb57D6cb2cl4RQRRzHsv1IlGguxk+cBXF
	7er3HrQuIOLYUswgialf43Cv8xwINZ6eiqgP5p8ylh8BqWcO0diYWbuqAL8vEdgbTFH6b24BKLn
	mrGKwPzrTVP+myrY5zqadzFO+jY4/0zJwrxn65i2B8QErsbsYqyptP2oAhm/iXUzC/zj4sIwJE/
	nOBP/lxxUcjnw6fGvLlyzW+fMTYZgM8mA1YRm9Ee+E17jFtPKC7upgx0lAxrrlKpiGoSvMZnTlZ
	H/Ry5Jq4rs3BPgHAtSDNCJXnmt6mQ+g==
X-Received: by 2002:a17:90b:8c6:b0:3b1:b66a:c05 with SMTP id 98e67ed59e1d1-3b1b66a0d23mr5084610a91.14.1794773998910;
        Sun, 15 Nov 2026 12:19:58 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:c:7f10:a86c:c753:9418])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm13382005a91.6.2026.11.15.12.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:19:58 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v3 2/2] wifi: rtw88: 8822c: ignore nrx values without CCK PD registers
Date: Mon, 16 Nov 2026 02:18:26 +0600
Message-ID: <20261115201826.181662-3-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() reads nrx, the number of CCK RX paths minus
one, from a 2-bit register field. The driver only ever sets it to 0 or
1, for one or two RX paths (see rtw8822c_config_cck_rx_path()), and
rtw8822c_cck_pd_reg[] only has registers for those two values; its
entries for nrx 2 and 3 are all zero.

A device that stops responding can return any value. On PCIe, register
reads then return all ones, so nrx is 3. On USB, a failed read returns
whatever an earlier read left in the buffer. bw comes from
rtwdev->hal.current_band_width and stays valid. When the level then
changes, rtw8822c_phy_cck_pd_set_reg() gets past its WARN_ON(), which
only checks nrx against RTW_RF_PATH_MAX, and calls rtw_read32_mask()
and rtw_write32_mask() on register 0x0 with a zero mask. Both compute
__ffs(0), which is undefined, and the write puts back whatever was read
from register 0x0.

Return early when rtw8822c_cck_pd_reg[] has no registers for nrx.

The fix and this message were drafted with an AI coding assistant
(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
submitter.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---

Notes:
    Testing, on the same RTL8822CE (PCIe) with both patches on 6.8.0-147,
    and a debug-only change that forces nrx to 3 on a working chip at 40 MHz
    on 2.4 GHz:
    - With this patch, in 12 s the function ran 6 times and returned early
      each time. rtw8822c_phy_cck_pd_set_reg() was never called, and there
      was no UBSAN report.
    - With the new check also skipped, rtw8822c_phy_cck_pd_set_reg() ran
      with nrx 3, and UBSAN reported "shift exponent 64 is too large for
      32-bit type 'unsigned int'" in rtw_read32_mask() and
      rtw_write32_mask(). There was no WARN_ON(), as bw was valid. That is
      the path a PCIe chip that stops responding takes with patch 1 alone.
    - In the second of the two chip failures described in patch 1, a
      debug-only counter showed that rtw8822c_phy_cck_pd_set_reg() was
      never called with nrx 2 or 3.
    - Not tested on USB hardware.
    - Build-tested on rtw-next (04c998418722) with W=1: no warnings.

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index df7df76785e4..1eb1a9656886 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4406,6 +4406,14 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
 	bw = rtwdev->hal.current_band_width;
 
+	/*
+	 * rtw8822c_cck_pd_reg[] only has registers for one and two RX paths
+	 * (nrx 0 and 1); its entries for nrx 2 and 3 are all zero. A device
+	 * that stops responding can still return those values.
+	 */
+	if (!rtw8822c_cck_pd_reg[bw][nrx].mask_pd)
+		return;
+
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
 		dm_info->cck_fa_avg);
-- 
2.43.0

