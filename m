Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405039;
	b=zresYHb7mcANBONPn7SDMhvdwcKSBp1Rl78q3pg3441Y3OvJf7B+NlUVNHoaFtTSJs6o
	 umpdyN2n8SSHJocf9/fNLxJmMCnkC9SUa5tvXZpHdQjVw/2j+gXzGuCul/kk/+Uctji7E
	 CAmDg0yPqGOhgD2GU2DeUwerhtmaR5yeg9Mxb/MVrS5X3wFir7ngVH0pIZe0ZaxUmEtyY
	 lHxS3bNSDPAUytDRebpi85rih6a8YjZwPfBRmzu17LiLaCcp4Fp7zEIjY9kptu4K960q6
	 F8eEgwWTV8Tg1KByQqxrkNeV4leFjsLrRBWsddR/os5oaX8UeaoYO2rZ4U69pgfAUpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405039;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=HjIx34s/1l6Bawf4jJWnXsLjZAGbPI2kYNq9L4BPx5w=;
	b=wSpZn4yGEW7luJuVfsDHduey4LfX8JFSi4eHbk2OUCpBTa+1/jXSQ8a8ks3/+hgkJ7z0
	 RrHOLdpKNeD4MO7Vc/hDyHu3I7xyhEk2jvQuRb4vvHbKrZhiQ6+itWyhNOjisagt1TJMu
	 PMNOgzblCS+l++xol86vHtJ0ZAO4dFb7KIfq3T5Z6NPwmjDlpa+SeK+AtxdPpzgux6bhV
	 i/PJETQbTeFWJ4EM4FKNEW6RpdiPAWrDxSXO7GfMmGrUAmlQd3BnIcj/1KVaqAgbwrYK4
	 LYsNiUrCdB9NNW9iiXKDa7y9RzpwqJinEuo6Lxd5qga3Ugixa6O3vlNcgquT9TtaX0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mcOwns7t;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C560A263C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701C560A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mcOwns7t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794405039; x=1825941039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HjIx34s/1l6Bawf4jJWnXsLjZAGbPI2kYNq9L4BPx5w=;
  b=mcOwns7tK9vPvhlrhcQv0nXNWf5RSGRSrSdX24Uy8Q0rhTYdX3xWgDHp
   7KRVRMWvsDc0EVnyvz+wO/KSJyKqv1HzL23pI1DN98a5axsT6C2nseO9T
   YDC8cLBhDL6k3Zy6Yz/NHRboV7S34+uDnDRXL5PMkfmBNlM9ytj6BntlE
   DnY75o+rtqKALMUgquCtcVRzLPAONouDsvbSsaXcyGqjAfk7sD/ekDDTq
   nka0ZOVc8DJCe8VQRFmy24gHjiHUiFUw7u/y3bJtflDD3rYRen8XRGVLd
   ufRusjNNKN2uG447aU/aNwhoO91lKmc5+vTyYX8hn4PA2cb4HcdJCKDBv
   Q==;
X-CSE-ConnectionGUID: i8hD2gBHSteVe11dD/lsbQ==
X-CSE-MsgGUID: Kkaji6OJQQCrbc9OYC1jWg==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33584285"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:50:37 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:3390]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id 52a0164a-7ce2-49ae-85b4-ebe8e6cd3e62; Wed, 11 Nov 2026 13:50:36 +0000 (UTC)
X-Farcaster-Flow-ID: 52a0164a-7ce2-49ae-85b4-ebe8e6cd3e62
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:36 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 13:50:35 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 03/19] nitro_enclaves: Ignore the reply of a failed slot info command
Date: Wed, 11 Nov 2026 13:49:52 +0000
Message-ID: <35ba82f73e2f89340db12cab8f7245b83d42b6ee.1794393486.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300000.git.graf@amazon.com>
References: <cover.1794300000.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When the nitro_enclaves device fails a SLOT_INFO command,
ne_event_work_handler() logs the failure and still compares the
enclave's state against the reply, which then holds zero or the reply
for the previous enclave. Zero is NE_STATE_INIT, so a running enclave is
recorded as not started: its owner is woken for a state change that did
not happen, and NE_ADD_VCPU, NE_SET_USER_MEMORY_REGION and
NE_START_ENCLAVE become callable on it again.

Skip the enclave when SLOT_INFO fails, so that it stays in
NE_STATE_RUNNING and a later event can examine it.

Fixes: e5d616d8bb50 ("nitro_enclaves: Handle out-of-band PCI device events")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_pci_dev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index 3e1455d505269..c37777bb95b49 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -243,9 +243,12 @@ static void ne_event_work_handler(struct work_struct *work)
 		rc = ne_do_request(pdev, SLOT_INFO,
 				   &slot_info_req, sizeof(slot_info_req),
 				   &cmd_reply, sizeof(cmd_reply));
-		if (rc < 0)
+		if (rc < 0) {
 			dev_err(&pdev->dev, "Error in slot info [rc=%d]\n", rc);
 
+			goto unlock;
+		}
+
 		/* Notify enclave process that the enclave state changed. */
 		if (ne_enclave->state != cmd_reply.state) {
 			ne_enclave->state = cmd_reply.state;
-- 
2.47.1

