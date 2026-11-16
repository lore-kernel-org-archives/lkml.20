Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838914;
	b=JekQRmzOg+sdb5D40dsG9476oS4dtMO5Eh3/FS4f8GnvsSvWNoH+hsvjE0B+gxooSnD2
	 8amNZHURR5UzlgFT3G1moc02dydRPYjC+g1W/4/p4UArLDvDS8GQwy0XBup6+eR+dCaQx
	 pXC+R1kooVYhClhDZOB/Hxd/9p90SyhO0fyDyb855T0XApYIaYqlP3oapi1gPT7Zklsm9
	 Kl9oPUsVRhseQnSfRwYABAycW0DOh5bSI7DyoUrCcHpGSaFc61D+zVX4NZr2095Nl08AG
	 rUYZHSjS0plJlo4Zs1PV8+nOA2X9siyj3pPqisa2qspMkg0D00EoKTPzrMGjXbMvmJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838914;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=pAbun3GqdZNiZ1ekyuS1J/nGFGM/isgEcWBQz3A3gLQ=;
	b=NNDxaHLz5AyedO3UrYQ1nn9tJnqpsMKViN4pMDIwfPR6UOX+zFC2/lFqeoMPoXB97+PQ
	 UlBAP1Hm+4npItDtPWFN/66N0rKnbNSilYHg1JgBs7qD9aJt7iqDo5heXXcpLQloiDNaa
	 jfrjtHQjBg7IwaxMiLFDtgv/1TpE1W+c42IjOMdikEmd2sM20zkgck4pKh2rMeCmooLdF
	 n3OMb9PCwqfWbkiIVz1QaYe3CrbxA/aF7VeHkxeh81v8OstgkCQZtiPyUDCYPbEUiSmG7
	 OtrOP6S0a69TQ2f0HZRa+zKRihmxH+k85fNwkWtu0mcfJujUZYBG0FP2Ride3KHmvbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=dBvLkfF5;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8576606A33D;
	Mon, 16 Nov 2026 14:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8576606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=dBvLkfF5
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54dbcb43d;
	Mon, 16 Nov 2026 22:21:48 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ti: vip: Fix potential use-after-free after stream setup failure
Date: Mon, 16 Nov 2026 22:21:47 +0800
Message-ID: <20261116-c29ba55625-media-ti-vip@mail.sdu.edu.cn>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e4bc4df803a1kunm29ab40b010e33a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRofVktPSUwaSEpDQhgfH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=dBvLkfF5dJERGJgXUXPU7vD4gInmd7+qHesUZ+rDAE2T3sHk0cBSjBvkI1rqeDiTV7RPwFdRFIuKkJo9hX9I2FLNX6n1wAcNCxwn26YEWl1nf6MIxsR1j1CcyHIZf8hywxvHP7P4/VSbprLRGYaFwRqnDKYv1nbtnUSlSNRuxu0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=pAbun3GqdZNiZ1ekyuS1J/nGFGM/isgEcWBQz3A3gLQ=;
	h=date:mime-version:subject:message-id:from;

alloc_stream() publishes the stream in cap_streams before completing
initialization. Its failure path frees the stream without clearing that
slot, so port teardown can pass a freed stream to free_stream().

Clear the slot when rolling back stream allocation.

This issue was found by our static analysis tool under development.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/platform/ti/vpe/vip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index 2bbe8eb31555..6cdbd9946da3 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3149,6 +3149,7 @@ static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
 do_free_hwlist:
 	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
 do_free_stream:
+	port->cap_streams[stream_id] = NULL;
 	kfree(stream);
 	return ret;
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
