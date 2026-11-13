Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576529;
	b=VSHtUL+BkVDArEHd5WbvT9zfbtbXMiNK06Dtf0AU2irKrkd1SLxKkPDEIGZzia78SRNi
	 9kJdBC82sJ+4FjWQwTrZAXKE+0ohFU23Tz47AX9lckqv8hvJF2UuWrnGOSmw78uvwz2ew
	 6cL34gENQrgKP5PKMQwNIag1dg6wlqKEULsB4x1x3BAzOq8dLbE3dnYam+N62UuTfiMCT
	 So53n6S0svRyE7+qcOT4La7O3SiprgDXfPm9TnDZrG7Yo830P4b8T34jxTiKkuYdQijBh
	 Yr2Qo8xlBFl/5FSnk+DBiaZY8sap0eCAE/be2GsSUlKBfpn/NCGMnJ2Wce6+AjKil4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
	b=hTHb1ajLZP0pheZ0i0J9oXGYjWqKEIyhC2lAwH8aZS7Pk9wkxfU2m6l3BcdSll80fWm6
	 31yY7Iya+FOIDcrBC244sSg1Fujj1H7ZO4H/bTD8gN6UWdDFSvxURm+x/m6kCs0fmKraq
	 Us/v/Wx9BzdRBAANrrD3v0jGLZp8/c3+e+OKRCg2elUq+ry8WjCu6dFIgjQ7Tut6u8QS1
	 nbd1v6sMdxwZFggGcg8Rt95raDK4Yv3jqmG1/9t1thmWXDIe3rV51TPEDQe7N4Ybd/NqL
	 TSnZv0+nn6AEH689wNdSiQl7Vuv+SWaLDAU0xjhglv3Kc3SpEnwbD9BaxUy6cgr3muw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WC4t2Cs4;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0907606B579
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0907606B579
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WC4t2Cs4
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso1577265e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576527; x=1795181327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
        b=WC4t2Cs4RyHPjYyOkqcxOQIEkwXquR0vgR7m7Ks5MSCCbfk7ABFxP1aeP8JHJ3DnYX
         SOHMIAfYA5MAkDyttah9DfG78FsOVDcdJb6Cy2i/vKhxv8gJORld+S52BuRjldbmyj3i
         tkVd15m/yprRFUTiEgpyzvvfBgO66JT3Nkv63LFGSGw9OsxDu5UuZ1FoChNmnTD7W/Nq
         vVxTlQoFoAmQ8N/7dTCdpLwgwADGGsoAs2iblQRvFUW42JsWssOq82/cCxD+lYBHgxRg
         4+a4LuDIPK6L+dtf5vrUhTu5RzlahirY6Vnhlg+ms3KziSvXmhawMTeAHFuO4OTfdNha
         JXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576527; x=1795181327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
        b=FEVk7ZTDsqECxEMpYNTthkRKGkhFsm5Pjz97l24InLlTd9HKraNmvPTjUCu3FbQVpg
         VT160zw9HH0236XHvxP7WcRGPfmQBIckn5pID6iqWeVHs8qUSu8Nxlsh1CEU8AYjrs1b
         wjVwK1fPLP+HKcMgKqkxHSnXqkjpvQtewT5sBB+vIvmpubsLvTAwdXzrldaZtqlw6jqh
         VJY5VxH3W6CO6likQMnQxd8elNFNvqHgvNpaqgw09QwXnonv+VsZ7Cy6av9sDreHP9a2
         Tr7BFlTQoubC9hAUavZERW3WkJAW3sdbdIC6Uy9NxOHT/yIlek2YYRkkkneiFh3ZcuIB
         Cz6A==
X-Forwarded-Encrypted: i=1; AL+hErFLknGMpokjuifPGdMLn8w9wOXe10EP/rkn6hFSP5rPlEjUjoYj+rlUsdqjyOhowyxxjFzrSc/dtwPchpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UduAmCbj0hmnrBvlegu3SsuoH4az7Gjx8bvHkU97xGWz/ByhI
	SGDBm1v3b+o8m33hDx9Cvykx31m9vke4GfLMdgAHbaZNhM/h6HLmC/J3
X-Gm-Gg: AYBFou2FF3wb+yP9uQ/F/xihyg4akhKGp96abh8b+kMFpo0uMTrqdmjF+Anvm4PE2HH
	rTI7RgNz/p9xIDOBV/WkAJFDtLBPqG0URCDkAsUgNXcHcYActSqgB1D1+yzc4DtHEB3Iij/Q5u6
	XsQSW5cEGD+7tqRxw+ezehLnyWd2o/MA8RrUKt1rh/cqWWnLtqRzsnGUyB7H2tdKeeJslSYqSw3
	LXUEM+XQaYHhoLyRZsj6Ppg4Azk33HbhFcNIXwExD9Llj6N4z2VS4w1p4pybuzE+OeJsI0FvfpM
	36VgA1MP/3FPf/StBfUh5fx8puqZXVPLJHSKhqbLF3Y62+AexcbxG8y8p+2hlVDql3UNvrGtiFd
	Vi+o+OnrPK4a3TCvLE2tZTXr9MpPV9xqPAntpuLqiSsJYMig7G9nLgHwiyJ6BF/KWsre9lY2DLP
	OfdpA6EINkIXk6wczAn/mXK1x6Z0ufsOfOOsQvs6wT08H7rQlx/zYcqqhKJUptjdIs/x6dg0vfw
	3Mdj7Zua+n2B3ERpuc3BMw2H8/mTQBC/6R/o1NS29Hoe9jhVHckNhG5fG9MtRH+IOqinUBLAXjj
	q1Oah4qEmBAFTnL4GfADUMdXC5rnV4A7
X-Received: by 2002:a05:600c:e557:20b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb55a583bbmr34500945e9.11.1794576527138;
        Fri, 13 Nov 2026 05:28:47 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:45 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Ali Tariq <alitariq45892@gmail.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	leitao@debian.org
Subject: [PATCH net v2 2/2] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
Date: Fri, 13 Nov 2026 18:24:35 +0500
Message-Id: <20261113132435.434615-3-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
References: <20261113132435.434615-1-alitariq45892@gmail.com>
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

The emac_resume() calls the emac_open() and emac_suspend() calls
emac_stop() functions directly without holding the lock through
rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
with rtnl_dereference(). But since no lock is being held,
rtnl_dereference throws a suspicious RCU usage on
Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.

WARNING: suspicious RCU usage
drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
Call Trace:
phy_detach_internal+0x490/0x5f2
phy_disconnect+0x90/0xc0
emac_stop+0x114/0x626
emac_suspend+0xac/0x126
platform_pm_suspend+0x72/0xe4

Take RTNL in emac_suspend() and emac_resume() before the netif_running()
checks, so the interface can't be opened or closed between the check and
emac_stop() or emac_open().

Found by CI suspend tests on Orange Pi RV2 (SpacemiT K1). Tested on the
same board with lockdep enabled: 12 suspend/resume cycles without the
warning, and kselftest with no new failures.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Changes in v2:
- Moved the rtnl_lock() before the 'running' flag check
Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/589
---
 drivers/net/ethernet/spacemit/k1_emac.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 51edc95f54c8..d07d8a1aa5ee 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -2031,11 +2031,16 @@ static int emac_resume(struct device *dev)
 		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
 		return ret;
 	}
+	rtnl_lock();
 
-	if (!netif_running(ndev))
+	if (!netif_running(ndev)) {
+		rtnl_unlock();
 		return 0;
+	}
 
 	ret = emac_open(ndev);
+	rtnl_unlock();
+
 	if (ret) {
 		clk_disable_unprepare(priv->bus_clk);
 		return ret;
@@ -2055,12 +2060,16 @@ static int emac_suspend(struct device *dev)
 
 	disable_work_sync(&priv->tx_timeout_task);
 
+	rtnl_lock();
+
 	if (!ndev || !netif_running(ndev)) {
+		rtnl_unlock();
 		clk_disable_unprepare(priv->bus_clk);
 		return 0;
 	}
 
 	emac_stop(ndev);
+	rtnl_unlock();
 
 	clk_disable_unprepare(priv->bus_clk);
 	netif_device_detach(ndev);
-- 
2.34.1

