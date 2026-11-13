Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582992;
	b=eOKHk97f3dJe5eQvZ8ReQFwpv9x88+g5iiJ16sLn/gjdGcPzEo/BoRTCe6u2velI7u1N
	 gnncsaSL4Unto1odTsaVlGb6L7cSGZNVx3pbFOgc21tTs/n1bZ/5I3gMdEA1nhYfQI3oV
	 w0Usbs+bGyMA/EqNYM9wEAwRfLTz6v/sDizi2RGo02d9ffdTR60P7VlQQl+GEN8Q/SaGl
	 2RGTwEqPQ0MSxQcb8rngTGMRbMY/R7ZHkDRfaHVcDka+IVqAfZ1X7EVUB6xItgmyLznGl
	 KDqKsEp49etivVRGs+1BrHARBQDr0VJWWW/CEMzOkV61kZWESswMOA7t6+eLkWWfYLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582992;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=neIsIOYrXedUz1G3zWq1jiKbezCseAxykAXroLao1Js=;
	b=eoLm9KS8RiVCSaAgv/UZOxf07NBYlsoJZ5kl1U1cjKYPsyGPk9DvJnD4ofKvUnlQgABe
	 CzNIp82IkYHr8AH11IjHb1OHkFB/52mEPV3H3hmQN0DPAjZmddVnNdLNvh0BWMzDsvhNz
	 CxglSXQyvuoUKN8acwCiH6rGU8rNDOmBN9GK3fvxAQU3XDR43gpVc/euw9C9OQQd7rk3Y
	 EkamosJbD8DcrdwB2DPxmqzdLcxIEnNurM+3em6Y0EXg+EUM7exW/0codEy9RgPq2Z39f
	 FjkgjiCXQZLFDv8Fw+LPpvhnXeo49sowdkoNn2eHZqnDEI7ab3uBK1xyVf6pqctTvtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=g0YWM1Ge;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBCF606A8A6;
	Fri, 13 Nov 2026 15:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBCF606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=g0YWM1Ge
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=neIsIOYrXedUz1G3zWq1jiKbezCseAxykAXroLao1Js=; t=1794582991; x=2109942991; 
	b=g0YWM1GeAI8bQbRzwstzLCALraKLhcmcKY/Pygrf6f4Jmn81Lmp+iSbSjY5wSJ95nvc38+gAj9n
	6u88hlagPvzD/rDOr/epn5tBH4jRRflINpZOFTkOcoEWjs64a52pgf2HT81ZPOF36Y5FkbRAgJDs4
	51kppX+0mKBSjUCsMT3NxTVTh+lBJ5jpsosz6VUBF61O3teikG+9HaqTmEHQBHeSABOT45SAJV2XO
	LsDrEhT5nXN/bKOl6wz1QMpzjFrftX3O8kirgwGiwB/U3vAEqFKZpiQe/vKScItPrDxtmwYUnJoJf
	0m7XvkKZdqj9AL+cYK9Cx2qYJB6xVSsQNYfQ==;
Received: from 186-249-149-121.shared.desktop.com.br ([186.249.149.121] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xRt0o-00AEXe-JG; Fri, 13 Nov 2026 16:16:22 +0100
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Fri, 13 Nov 2026 12:17:33 -0300
Subject: [PATCH] wifi: rtw88: fix skb leak in hw_scan probe request length
 check
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-rtw88-hw-scan-skb-leak-v1-1-3bd47562abf6@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAwq92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3aKScgsL3Yxy3eLkxDzd4uwk3ZzUxGxdy1RzQ1OTlNQ04xRTJaD
 mgqLUtMwKsMHRsbW1AHH+e7RoAAAA
X-Change-ID: 20261112-rtw88-hw-scan-skb-leak-9e7154def3d5
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>, Po-Hao Huang <phhuang@realtek.com>, 
 Kalle Valo <kvalo@kernel.org>, kernel-dev@igalia.com, 
 linux-kernel@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

In _rtw_hw_scan_update_probe_req(), if the first loop fails (goto out;) the
skb is leaked. It does not reach kfree_skb() at the end of the loop body or
in the second loop (out:) since it is unlinked from probe_req_list.

Fix the leak by calling kfree_skb() if the first loop fails.

In /sys/kernel/debug/kmemleak, after simulating the failure:

  unreferenced object 0xffff88810965a000 (size 232):
    comm "iw", pid 4729, jiffies 4345008185
    hex dump (first 32 bytes):
      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    backtrace (crc 20f7de11):
      kmem_cache_alloc_node_noprof+0x302/0x380
      __alloc_skb+0x74/0x2f0
      skb_copy+0x57/0xe0
      rtw_hw_scan_update_probe_req+0xff/0x230
      rtw_hw_scan_prehandle+0x4e/0x180
      rtw_hw_scan_offload+0x186/0x1d0
      rtw_ops_hw_scan+0x61/0xb0
      drv_hw_scan+0x81/0x130
      __ieee80211_start_scan+0x2e0/0x760
      rdev_scan+0x42/0x100
      nl80211_trigger_scan+0x53b/0x730
      genl_family_rcv_msg_doit+0x103/0x160
      genl_rcv_msg+0x1b5/0x2c0
      netlink_rcv_skb+0x52/0x100
      genl_rcv+0x28/0x40
      netlink_unicast+0x26d/0x3b0

This leak exists in the first loop since the function was introduced, and
still happened with the addition of the second loop, in these two commits:

Fixes: 10d162b2ed39 ("rtw88: 8822c: add ieee80211_ops::hw_scan")
Fixes: d95984b5580d ("rtw88: fix memory overrun and memory leak during hw_scan")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 945fedcd375b62b4110ab631e87889bb84e2f16b..09b5836540c41e80a5fecca0f781aa45c6327cc0 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -2061,6 +2061,7 @@ static int _rtw_hw_scan_update_probe_req(struct rtw_dev *rtwdev, u8 num_probes,
 		skb_unlink(skb, probe_req_list);
 		rtw_fill_rsvd_page_desc(rtwdev, skb, RSVD_PROBE_REQ);
 		if (skb->len > page_size * page_cnt) {
+			kfree_skb(skb);
 			ret = -EINVAL;
 			goto out;
 		}

---
base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
change-id: 20261112-rtw88-hw-scan-skb-leak-9e7154def3d5

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>

