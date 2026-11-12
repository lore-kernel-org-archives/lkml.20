Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467804;
	b=U4ZFi5vXrKNn2S50BFDECGL3UfyDVO+WWVNr6gyLppHIHUrA8hua0qlxsE+3Cr7zqHx1
	 WC16GQQhEC4ZM25HOApA8akNWE9TTmxrC8XpRTxDjxHkXS3+g66wtR7f+Nmy3jrhbDhmI
	 V6IYajWmbgso6kHSHxFr5bV9Y7HikwRlnS7SJJnOUo9fP6Omfux81ChS2HDIcKSApfMTs
	 gNwnMuXMeq1Cyr8F+L9rU0YgWDoYo9hCkQFt42fdfds7VNQ576hOo+akEXc9r4bVL4Yr6
	 2GCMaIuCZ7l5rCaN1WDHdMMcKklPxeO+9VH6Htpj/01i1bKrYbsEPeJUXzCgOKB8Y2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467804;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J/c3tcoG7GcYlbXefXjlJeyx373M02Vm7zIx6yg8Deg=;
	b=CPvretbhqRrzuvnk71grmoISGpvnC/LAdbHqs8vXO120gVXQ+n3rzQhiTGonwn7QPs8W
	 Xpy7ywmHM4VkxSXX8iq3XJCm/dK5fQD2BOjD9xbjC8CjpO3KOKMj4EzS6fEH1XfhmCPWI
	 vNYQWPDWI7392+/vpvX30pcMoIW9i9tgInbJopL+RbYcpDyW5UweKXDEwo2c/8K9PPGwk
	 FBCDaJdadS7QJBnz8ZGVih/miDauwny+Abg5NyJ6nfQvEQjrJ06S8cu619RqhZDh1Au8i
	 kPcKhjQP6Xnle2UT53XrbD7wqL46aK8RQXacwQmvkkHjDXVN//Y3iaoR/O+q6wfLSyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=UJrrNbB1;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD20606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD20606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=UJrrNbB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=UJrrNbB14wg/m8Kpw9Vk+uKbzi6OdjsQqKFH5X74DQnAaISJntdro5NE1XYedrJ+Bwum4JddsCeua
	 j51loo0aW2POMXCfAEaJsarb8UmeUhREj7+2nvP0NGPJLOXROeRb/+HSeOxf5MrGrqxVksEIppNyGc
	 pkcBDbh1PEO3rTrI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af567d83c8-dfe39;
	Thu, 12 Nov 2026 15:16:41 +0800 (CST)
X-RM-TRANSID:2ee76af567d83c8-dfe39
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af567d7bee-f710a;
	Thu, 12 Nov 2026 15:16:41 +0800 (CST)
X-RM-TRANSID:2ee96af567d7bee-f710a
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: jassisinghbrar@gmail.com
Cc: michal.simek@amd.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] mailbox: zynqmp: Put the parent node after reading buffer resources
Date: Thu, 12 Nov 2026 15:16:40 +0800
Message-ID: <20261112071640.154439-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

versal_ipi_setup() obtains a reference to the parent node to look up
the host message buffer resource, but never releases it. Each setup
leaks the reference, including when a subsequent buffer mapping fails.

The resource lookup copies the address and size into host_res. Drop
the node reference immediately after that lookup.

Fixes: 0ac39d85a741 ("mailbox: zynqmp: Enable Bufferless IPI usage on Versal-based SOC's")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 2b81bedf0653..0c175f0b048a 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -696,6 +696,7 @@ static int versal_ipi_setup(struct zynqmp_ipi_mbox *ipi_mbox,
 	mdev = &ipi_mbox->dev;
 
 	host_idx = zynqmp_ipi_mbox_get_buf_res(parent_node, "msg", &host_res);
+	of_node_put(parent_node);
 	remote_idx = zynqmp_ipi_mbox_get_buf_res(node, "msg", &remote_res);
 
 	/*
-- 
2.51.0



