Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813622;
	b=O3ejXP2No267fi0GJ2PHEa8D345FGyjWytxhDHVjvbjeB177l+e1fvQH2oyJA/RssHe9
	 ylNlIcigqp3CDVOtQc0Ax2otrqzLTfXNFiNEA9oxnOhrb9GmKcd9/13/vOX/xW9VC3zxq
	 R+xQy7UsKow5ffMux0znDWH7acqoRIPY4wdSeOqcLzcxQckHlSRLVSq9H3/gLbizKeVNw
	 UfRS45ayU2gqQMtCZHbq58Y5s+0fn8akE+DmrTO48X+x7sMGiy0acqYu7p+8dXNuKrOLG
	 0/W41w7RpIY5ldKApKHYQWUO5Zuba/39KG6gmcoSYIrSExv3q3JlG7AmyalQUbxbwqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wciQv0OYjVv7FW/4CBvG8BeXBZomqSPRimAuRooCu/M=;
	b=WYcAfncDYsDTKIAHFCGl/R2DvwYmTf3EYbTUxvIjzzi4bZX36Wdw4ILDjIUNDwurnzyc
	 4H3a2JDxc8dZDySfi75QmVlKBn3jgvpDAHd4ZlK2DCRyPc/cn/5eEsEJYSV0iREq75YVc
	 3C2Szduz2sEiC0gUyo6CoVXFteZv0QR2DsPTAzh0FjbyTMYoWf5zEU2fWc/4yXxO9bHCR
	 aSchxZFL2WXMzPROK5n12DW8s5rFU0itxfc1uz37MaF45fedKypwkKr1goBGThPeodhCQ
	 byYJrUr2iRGKF2cwkm68Wnaq1CC3cSGQvG8P8V06KGQNskCHbBV87FefiZSaLZUmPXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yuD1VX3t;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A87606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A87606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yuD1VX3t
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492690dd5daso2961171f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813620; x=1795418420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wciQv0OYjVv7FW/4CBvG8BeXBZomqSPRimAuRooCu/M=;
        b=yuD1VX3tmlO9yiXfShOqAenHPtxtz1Jvt1ArP+JGgUu8Q/JRJ+Oym0gicOE035HMjl
         w1oy9xfUyUbzZIWa77n+GXiYY6PfW4+L0B3kCntL4NV/deUw14g8K50nh7FC3K/OFdXx
         k9yzrAhrrv7vhoMYgohMErrgF6LXrkRmwIpn+eyYySP4ZKLRePTz+/XADYeGE/wJg1Bm
         +l0H2iLozE9rr4fI+N++8aF1dVC++ZO7wmUaSsLSIhZX7LD1yXD1C4xv0l87RXiYieW4
         1SdetRJAv1gSeV0Z7K2hUM7aWrqRzcGGa8PupuXMb+y8W3Mn2CWwDlQZRbLdC9O1ZX46
         V7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813620; x=1795418420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wciQv0OYjVv7FW/4CBvG8BeXBZomqSPRimAuRooCu/M=;
        b=jDJGuOJ8V6cxjkJzIJusNk73XM56JLfNoiTXSiuLNg7ZLSUuE16VyNlx7IBn799AQ1
         8C5K8uATCbA0uMawxy6ecIoCNmC3td3H8YMPLruGHG4NUmQLM9M93FpO5+oTMCt3xrzL
         qv/Zp3hcPIf15Fy0wbsxHpznzi35Vpy6Hh3XaByds8609C8VZT392hTxhWvAWIcK5SCk
         ECiLA8OW/ATzhEXUlZUXpKA6VNleDB95smy2XSicxbpTOyGCVO1w87xzQ/pR9V+ZVGV+
         XcL7IG1U+bV2kDaoUmDUNhf34Fa8GGXits70PgLQ9t9cwMWrKhpBXEfN8xmvSF4TstCe
         odSw==
X-Forwarded-Encrypted: i=1; AL+hErFk8PVl7B4mqW4MEbhUgHLO7zGbRQl9u2GhT+EGhB2CosfY0O19H1K6hevlloh/pbUqF4sstiG+3DwclPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kxi7VeQyVbJmmrxS09wJEVjSXBgHZrON/8P9Ai5WJeKLBzWzf
	3KAH2EWaz71iCHws63XnrZL8egpxc4A/IcxNyDRtW6bxmoUbNsfodnI6
X-Gm-Gg: AYBFou3LrB2MZKNg1Tc0n+2HHsuRS+vp0V0+vfVlzKUGrdUkFzOndtJX0fLTKAyCTe+
	GwRn/7DP0BYgEJrHByW+vb41Af1nwcCKTWeKlB5FcVuZC/MubLKX+tobJWAe8sDFg5DMptHFQpz
	yq5TJlp1rlv9lnHSVVjIVVPgLI/WAnpozWQmbrd6JBo2Ld/vzZtyYEvCz/Kqom9qv+SJz1u638T
	rzbExyeY5rcTotEHvKCtg1Lkzid2isRHcaHXXPattj7blKgtQDJvgK6KQuQJIuxiT4dKvkgWrC5
	nAV88/ILY03xPGmBmvfFQCJZvkIAAs0IurmUAzeI5YRTXH4S3O7aQFi2QLxkeh1K6serPuae5OZ
	3TC6zcQDAaFXy0Kcv6P2tNGnMKFYXr1jaDEU9oJtEY+HjZkjucMrqzusJFSIR5qX1xRXm3U4F24
	JQggE+O2tTYaKg/SmjKswoC/zOQhFVOe6D6wLPVyAA+3lQ8Mue0A2Lx7pn2P+bmsZAD4G/Q/Uqo
	pzTwS+5E1hgzcwP04OCh8ty5wCo2JQr5cb3P7OTG6vmYBHvWnYESCC6Rb+cSDkvRvCzVOHSgimO
	pbCfqVXjMLZi2BWwFyfRPp6qKszxE5RyFhg=
X-Received: by 2002:a05:6000:1863:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-49c7026386fmr23687181f8f.21.1794813619721;
        Sun, 15 Nov 2026 23:20:19 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:19 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 3/3] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Mon, 16 Nov 2026 08:20:14 +0100
Message-ID: <20261116072014.1142494-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116072014.1142494-1-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recovery after a firmware crash removes the driver state of every
station with rtw_sta_remove(), called from an atomic station iterator.
rtw_sta_remove() cancels the rate work of the station with
cancel_work_sync(), which can sleep. With a station associated:

BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/u16:1
RCU nest depth: 1, expected: 0
Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
Call trace:
 __might_resched+0x13c/0x1f0
 __might_sleep+0x48/0x7c
 __cancel_work_sync+0xa8/0xb4
 cancel_work_sync+0x14/0x20
 rtw_sta_remove+0x34/0x10c [rtw88_core]
 rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
 ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
 rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]

Use rtw_iterate_stas(), which collects the stations under RCU and calls
the iterator after it. The recovery holds the driver mutex it asks for.

Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU warning")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index ce65a1a80840..8e7ae747b900 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -664,7 +664,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
 	WARN(1, "firmware crash, start reset and recover\n");
 
 	rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
-	rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
+	rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
 	rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);
 	bitmap_zero(rtwdev->hw_port, RTW_PORT_NUM);
 	rtw_enter_ips(rtwdev);
-- 
2.56.0

