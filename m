Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004344;
	b=g5+zNLZP/EUdZf4QcvmeoEXvp2PyVX8o6IsmyeOfVXAAMu72IXONUsp0BHZC8NblsSVL
	 tQvm31HcOX4Y2OR74InceebvQ1BmPfOCEige7lJuaREiLnKHoQa0WJL96Wix4O1y+Jl5a
	 RqZeq0AXSbwCggxdgb8EnfHVrXBhCNWytLwedtV220dtDg0qZjq0w+uwW/qAUbcin9ogx
	 s+vcMXifCIDl+nnOUNEdIsWHbqGQzRZSJAGQd+1Sw/RdhdlVrA0kY9xjrL1by2x1dJ9Im
	 zGRYBpWCZL7YY6Xg46c2NSFNexDZvZUJ8X4ZmfC6GrO6Y2FVHngF5cpD/8/Vi5o35aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004344;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=oJlTQ1J1/v00rGsmIpPjsX1DcEmgAQSHXTSDO4b7bcw=;
	b=TtsaIQaxbJCswtMHsqNuFgQZY/yeOe2vZnUDCg8mLVP6xLj3mrGYcmwrJrdprIhHPyrO
	 PhH0C9bo1gcU1jpUPY3ltlW29h8MPm6WGN2CMuz7qoQyk682w4TXlRKFR16dKCVPRa3zU
	 iNWqkRO7ltmdA91Wd1h2rJZJACD+fcIVwMMpFhm3C3Ex8THj2iphE2qrcCFb9ynmzAq4v
	 SVyjnGFvQL0xrdSziavc05fuezZdPHA+AbCOqrKgsI9qwm1ExPS7UTXyJtyQhqpDUw/+i
	 KIJBeZyzJe9xG5pXOiatVKIthzz9dVtB+rx0RgqYfYHWCqN57rQyT60EgYI0HwahiDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006D8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 006D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jCnJX6dcrz5B163;
	Mon, 26 Oct 2026 16:45:32 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 69Q8jODI078452;
	Mon, 26 Oct 2026 16:45:24 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 26 Oct 2026 16:45:26 +0800 (CST)
X-Zmail-TransId: 2afb6adf132641b-92d16
X-Mailer: Zmail v1.0
Message-ID: <20261026164526813_4KvPc2SI-CEJ2Mzh7HN3@zte.com.cn>
Date: Mon, 26 Oct 2026 16:45:26 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <hare@suse.de>, <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>,
        <linux-nvme@lists.infradead.org>
Cc: <kbusch@kernel.org>, <axboe@kernel.dk>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBudm1ldC1hdXRoOiBmaXggZXJyb3IgaGFuZGxpbmcgb24gQ0hBTExFTkdFIGZhaWx1cmU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 69Q8jODI078452
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 26 Oct 2026 16:45:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ADF132C.000/4jCnJX6dcrz5B163

From: Shao Mingyin <shao.mingyin@zte.com.cn>

In nvmet_execute_auth_receive(), when nvmet_auth_challenge() fails (for
example when the initiator-supplied allocation length is shorter than the
DH-HMAC-CHAP challenge response, or the challenge nonce allocation fails),
the error path sets status = NVME_SC_INTERNAL and breaks out of the
switch. The unconditional

    status = nvmet_copy_to_sgl(req, 0, d, al);

after the switch then overwrites the error status (nvmet_copy_to_sgl()
returns 0 on success), so the AUTH_RECEIVE command incorrectly completes
with SUCCESS and the initiator proceeds with a truncated/empty challenge.

Fix this by freeing the buffer and jumping to the common done: label on
CHALLENGE failure, skipping the copy_to_sgl() entirely and preserving the
NVME_SC_INTERNAL status.

Fixes: db1312dd9548 ("nvmet: implement basic In-Band Authentication")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

---
diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
index 1fe21f2672f1..bd1185f13ab2 100644
--- a/drivers/nvme/target/fabrics-cmd-auth.c
+++ b/drivers/nvme/target/fabrics-cmd-auth.c
@@ -605,10 +605,11 @@ void nvmet_execute_auth_receive(struct nvmet_req *req)
 	switch (req->sq->dhchap_step) {
 	case NVME_AUTH_DHCHAP_MESSAGE_CHALLENGE:
 		if (nvmet_auth_challenge(req, d, al) < 0) {
-			pr_warn("ctrl %d qid %d: challenge error (%d)\n",
-				ctrl->cntlid, req->sq->qid, status);
+			pr_warn("ctrl %d qid %d: challenge error\n",
+				ctrl->cntlid, req->sq->qid);
 			status = NVME_SC_INTERNAL;
-			break;
+			kfree(d);
+			goto done;
 		}
 		req->sq->dhchap_step = NVME_AUTH_DHCHAP_MESSAGE_REPLY;
 		break;
