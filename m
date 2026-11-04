Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798099;
	b=zHE9SuGsoIswM5eZmGMBEa0fWPgyVG4yUVgq9qUVfjSregDmW1V+dIdlP8EzNkesXUYE
	 6ZUxGeagWi1IhfsLVYi40uQXRDKSXcqsMuPpWk+YReDofNj8Rb/6DzgIdj0X69c9ReJkE
	 MtgNzXeDluAZT1aFC+9TAApLflTxSBJPJ7A3XHnqi6kv8huUK2vne/UHkjM3ZGt8Rm11j
	 MzoHvnLzIyK3cx9R08UVpJQ5U3JCwC2u76WewTejPxUXNTDx8fUKOidMGH9tZHXIsl93L
	 3Y8wkICB2trrrjpeh9OGMYA9oPpcSloNRw/Kq5UXbAal8g8z9hRXijoRGpLEi+jsc5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798099;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=aGr9gUhqRg9IWOMherHgHlP29txekxiSm0bPWBFR61k=;
	b=ry2zlC4ogPxzRQU4w4IANXYCYx1ZLqFufhYYKMKf+ZvssNCSiCU9ErAa+5AjJnNfyORm
	 67EEqrwLiktUdsL+5KvbkHSL062ko9J5lvn5pkK2NmtXzrlfVlzV55S4YAMNNNIVdQr5L
	 wHJZMoulvQ6z9uOe/Y8UHoVok6quuNFAOWF5St7UO23TAqMaLIB3yFT+DuYPeJ5ZKpqKd
	 ca9W+5+PFPw8SRYxfb6te7OW7lIIhL56tMS1UYAboPT4HB54QmMQ0R5DzsHWOgp45j8bw
	 9qUm1Ovd8J7pmtE1GQRxa/SXWqUepM567RuwTpFPTdu8oUu/y4xjyyrbxW5D9QxVM+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31883606D814
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31883606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jKQs80Bbgz8Xrrd;
	Wed, 04 Nov 2026 21:14:52 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A4DEhKN038352;
	Wed, 4 Nov 2026 21:14:43 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 4 Nov 2026 21:14:46 +0800 (CST)
X-Zmail-TransId: 2afa6aeb2fc6685-f75ac
X-Mailer: Zmail v1.0
Message-ID: <20261104211446891tN1QRJiKV3CLPQqfb7gJu@zte.com.cn>
Date: Wed, 4 Nov 2026 21:14:46 +0800 (CST)
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
To: <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>,
        <linux-nvme@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBudm1ldDogZHJvcCB0aGUgcmVkdW5kYW50IGF1dGggY2hlY2sgaW4gbnZtZXRfcGFyc2VfaW9fY21kKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A4DEhKN038352
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 04 Nov 2026 21:14:52 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEB2FCC.000/4jKQs80Bbgz8Xrrd

From: Shao Mingyin <shao.mingyin@zte.com.cn>

nvmet_parse_io_cmd() calls nvmet_check_auth_status() and then
nvmet_check_ctrl_status(), which performs the same check again.  The
first call cannot fail either: this path only handles commands from I/O
queues, and nvmet_check_auth_status() returns true unconditionally for
qid > 0.  Drop the duplicate.

No functional change.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index a8171b88035c..12b82bb7e412 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1120,9 +1120,6 @@ static u16 nvmet_parse_io_cmd(struct nvmet_req *req)
 	if (nvme_is_fabrics(cmd))
 		return nvmet_parse_fabrics_io_cmd(req);
 
-	if (unlikely(!nvmet_check_auth_status(req)))
-		return NVME_SC_AUTH_REQUIRED | NVME_STATUS_DNR;
-
 	ret = nvmet_check_ctrl_status(req);
 	if (unlikely(ret))
 		return ret;
