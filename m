Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603716;
	b=PZp5/oTZRtoqZQF/u6Y6AQHiwKMyq5clM4o5P+9E43tEmK9Tafd9uo/I8/Lhy8ubJIJg
	 ijKIyucedivFwOjE3KsDTBhSCpB57OkfI6okd4IB+753QyF0bhGCYrKv8F5d/yg2J5D8U
	 RwW2bWe8VgeStB9vA1qwJY5UAZCaFQkfQTrq5wfx89f53n9K3tdFUArT3ArrUz/PpcpHj
	 PLkR5WVUo2Ju1UdbQU0ziG5yDq3ftFecSXg/GWrjAP2Uz8QblMk+MkMqaNmH1pJfgL00U
	 59xe9MRrRce9snDPhuwgqxErJqUrgLRis9+Sxy3BUKcCCaw7WuBZPMbZgQPEAS+3S9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603716;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BDap2h3izIMnFXDTGxRXROY7Z/4sFsJMxwXcPaP9mag=;
	b=CCeI2oBOtPFLt9rOeECdB7GcTSFFTS6g6fAShjQT7oLHrxHFwBWZfdiwNbhmZbbZg9vL
	 cBuN0D+rqq+xmvBEQ0FmAo5pKFgJCYwk+/puJqyLcyXhqMQaMnTxdel2u4XhV0mfTbRux
	 K0r0lTUflFNzwA8nCybR0ODOg4BvH1Lx/qjKfatMdK6p3yA+RFyrmYN5IbKsXUe2AMaI1
	 VIm5FoJmB53QaNquObgeBVOC+GNc9z9YdTipRVilwJxRvjo/NYQlaVG7A34IqecAu1mRS
	 EKEMX36JiUdH+Ye13txUSlhQQyDlpjhhL3IpjITz0HYonIr0M4ltPm/Z6QU8uVepOrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=eqT5Rygc;
	arc=none smtp.remote-ip=202.108.3.162
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn [202.108.3.162])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C4606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B1C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=eqT5Rygc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793603713;
	bh=BDap2h3izIMnFXDTGxRXROY7Z/4sFsJMxwXcPaP9mag=;
	h=From:Subject:Date:Message-ID;
	b=eqT5Rygc3Trno7GEmOumKgFvu2ouYWUgzqMAsNCjTaIB5BsHOW65S8rGvdTbGTY0H
	 nqHEN2QEav9yNJlho58tU22yDPSR8b2QDguKwBX+R8a5QPS4lJyyYgMm1lLenkP/oS
	 10GbR3CgPGBkZKT8gM3pMqeuVd+mKeXHhTURGcco=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AE83875000040FE; Mon, 2 Nov 2026 15:15:04 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 4638156291640
X-SMAIL-UIID: 7F962807628D4485A88D563E741C9EF7-20261102-151504-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+c8564fc0a96e3ecbe4d4@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [dm?] WARNING: zero-size vmalloc in cache_ctr
Date: Mon,  2 Nov 2026 15:15:01 +0800
Message-ID: <20261102071501.414627-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ae61f5d.61c4c7f9.11e392.001b.GAE@google.com>
References: <6ae61f5d.61c4c7f9.11e392.001b.GAE@google.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..c405d30938f4 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2455,6 +2455,12 @@ static int cache_create(struct cache_args *ca, struct cache **result)
 	ca->metadata_dev = ca->origin_dev = ca->cache_dev = NULL;
 
 	origin_blocks = cache->origin_sectors = ti->len;
+	if (cache->origin_sectors >> __ffs(DATA_DEV_BLOCK_SIZE_MAX_SECTORS) > 0) {
+		r = -EINVAL;
+		*error = "Origin sectors is too large";
+		goto bad;
+	}
+
 	origin_blocks = block_div(origin_blocks, ca->block_size);
 	cache->origin_blocks = to_oblock(origin_blocks);
 
