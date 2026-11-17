Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917336;
	b=r8Pg+0dYCFxXi8fW7me3R7M8CtD3EZCe1rvzVoZbNVRKqSJTc/3Sb2tuYtqfg9Wpl8sr
	 ptdAvHd2Qh8MjrJ5oos7+S9yQmPJZA26fXjO77AbRwoQ7oET4YwcdmvCaeR+ZaxoxSQKK
	 /ud7zuf7SDIVbL6tctO+EqEWp2shR3UzzCoZg+xXw/wbmQhewFnQTZqmiGPek0BOdzPiI
	 KH39o/NmFninzC48ltdKrVSLjGxLMn8tPFX4KsqPpAgFes5LCAecr5kGx8LTxVwb8VEde
	 Ljb6zVJsGwLKrA6UBlGoszGMxc6nZ4Ec1D6MJFRkyUvLaRQP3guUgIhJ8oq3/wSWmGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917336;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=w2VPsao9cWqNADcq1/Hkj+IZuzFQOAAnm2gqt7aP/tQ=;
	b=ow/4NMTNTlekOCh2MYQJKV2ltVwh392PWAd0RbOtiVgvczVVGWo/bTm6cDlREll1PyS4
	 pKXYs8U1rV7dZ4NCxCu5hjhyStOa5EZ0QFoB1LlgpBQ7HB7Z+s0mZ0IGkPtHOVuybgGQC
	 0XWYqCQiPN96+7S28Rej9V87snxJWXPkdwBrX4CEwX46Q7QeLkemiOkRW2DRJViNCIw6f
	 lj+xKgTlPDYzFE/w+TAl8ypeccoOBE7OOtNHrn/nDRF1cKGoGQDoD2odSVvhW1RfBWMKM
	 FUogn36qD79ZjfPuuTngLjjgwD0vtVUoB6N21ZSebLieprLP3KI/tp+mrBVYONZwXvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Yn2klA+P;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D82606A33E;
	Tue, 17 Nov 2026 12:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D82606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Yn2klA+P
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=w2VPsao9cWqNADcq1/Hkj+IZuzFQOAAnm2gqt7aP/tQ=;
	b=Yn2klA+PdREfza5eOwUO1vfHm5h2YZZuoalSREFtowDbYL5n/YUPYGyNmo1vBOwF+lXvYqL9e
	tLy1WpGNduyd1x3PxDeF0I62luzHSgIlHoy9p+kPj4Bau0znBlU2eoVQhYSWmDrQTuKem6YUXN1
	Od1cOqWlAEEAJAaExeiRZ80=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jTNmR6n0CzLlTm;
	Tue, 17 Nov 2026 20:08:23 +0800 (CST)
Received: from dggpemr100001.china.huawei.com (unknown [7.185.36.34])
	by mail.maildlp.com (Postfix) with ESMTPS id F239D4055B;
	Tue, 17 Nov 2026 20:08:42 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr100001.china.huawei.com (7.185.36.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:42 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:40 +0800
From: Fan Gong <gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>, Teng Peisen
	<tengpeisen@huawei.com>, <netdev@vger.kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei
	<ioana.ciornei@nxp.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>, Dimitri Daskalakis
	<dimitri.daskalakis1@gmail.com>, Harshitha Ramamurthy
	<hramamurthy@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Zhou Shuai
	<zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
Subject: [PATCH net-next v04 0/4] net: hinic3: Bugfix for later patch-set.
Date: Tue, 17 Nov 2026 20:08:30 +0800
Message-ID: <cover.1794917917.git.gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemq100015.china.huawei.com (7.152.185.230)

These issues were discovered by LLM Gemini-4-Argon and Claude-Opus-5-5.
At the same time, LLM recommended submitting an independent patch.
These issues were not actually triggered. Based on theoretical analysis
and consideration of actual risks, this patch is used to fix the issues.

Testing:
  This patch-set has been tested on hinic3 hardware.

v04:
* Fold a short ring refill into the hinic3_rx_poll() repoll decision: with
  no WQE posted the device raises no interrupt, so returning nr_pkts left
  the queue dead until the interface is reset.(AI Review)
* Keep csum_errors in rx_errors, and describe the u64_stats reader change
  as the cleanup it is: the driver depends on 64BIT, so the retry never
  happens. Drop the Fixes: tag.(AI Review)
* Rewrite "fix some checkpatchs.": name what is wrapped and renamed, and
  note that the patch has no functional effect.(AI Review)
* Reword "Ensure that the value of max_qps is not changed": max_qps sizes
  the software arrays, the hardware capacity is nic_io->max_qps, and the
  change is a design change rather than a fix (no Fixes: tag).(AI Review)

V03: https://lore.kernel.org/all/cover.1794467919.git.gongfan1@huawei.com/
* Cleanup checkpatchs in file hinic3_netdev_ops.c.(AI Review)
* nic_svc_cap->max_sqs is already in the range [1, 256].(AI Review)

V02: https://lore.kernel.org/all/cover.1794371175.git.gongfan1@huawei.com/
* Rewrite the commit message and provide an explanation for each
  patch.(AI Review)
* Split checkpatchs in to a separate patch.(AI Review)
* Fix the failure of napi_alloc_skb() in recv_one_pkt().(AI Review)
* READ_ONCE()/WRITE_ONCE() only stop the compiler from tearing or caching
  the access. They don't order anything against the work item, and they
  can't stop it from running. So, remove READ_ONCE() and WRITE_ONCE() on
  nic_dev->adaptive_rx_coal.(AI Review)

V01: https://lore.kernel.org/netdev/cover.1793946318.git.gongfan1@huawei.com/

Fan Gong (4):
  hinic3: Fix the RX stalls in hinic3_rx_poll()
  hinic3: Read the queue counters once per u64_stats retry loop
  hinic3: Wrap long lines and rename q_params
  hinic3: Keep max_qps at the hardware maximum when RSS setup fails

 .../huawei/hinic3/hinic3_netdev_ops.c         | 77 ++++++++-----------
 .../net/ethernet/huawei/hinic3/hinic3_rss.c   |  7 +-
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    | 22 ++++--
 3 files changed, 53 insertions(+), 53 deletions(-)


base-commit: 73022f605c447f31610b94ed4a983d2b4bf2c721
-- 
2.43.0

