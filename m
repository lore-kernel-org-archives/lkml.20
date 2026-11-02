Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618879;
	b=gkzEcLpZb0F8KTDFJCbyQU85X8MX1wTk5dKR8Jy50TMFQ5TQB/ATMx+7qqgxiOg8u6mA
	 luAbmhxMN6665qIRduycoRWjRBdO4VNU+ZA77HUi2hcBzlh9hS8VP7VJXqAX1z10G5tJR
	 kD4VnlbjhUxOn/Wtw+ThkWEb2zTbC3Igypk0DdzmyDdVhkj12YmQEvBvf4/WpTTMlKqmI
	 crfj5r9ig8r0sVWBLigguT2OUMomwqTBqxIe2eYbBEJVOKCBSWaUvGPyJ6J93EuBaoHMw
	 MHxgGJVHPeshZpv1PZnzIXyuzLr1ic98oaSI2G8bVuLjA5KWsM3hZlz1VVxi7rP+pww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618879;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rCXRkEf55C9RShy6W+6ZCQH6TLZ7TSKY1JRnIF0fU1E=;
	b=njyo2dBOaiXLz7JwV5h92mkMzZVYVK1JlXeEShh/i4QCsORXyeulH1Z+U57TWZSnTF2I
	 5Wa5HC35TOdpffiztIExtazZD/rv80bU7EkKgNEKsi8nR1qj0FzrCsOrBb96LPJWHU2Ww
	 V/sxECOKozq0jhEYRjJo9ewrZMFx9a9SCPbfCvroyQ4D1iA38GM1hN7rE9DyYBbr1huRx
	 UsHbIqkC3Y8GhSFCV9rvEVXUAR+7qpTiMsz5a2DxAXdZ7ibEExVsAvwa+hXlh59lvmtcp
	 LGL9/kIVUwmIWKc2jXDTDAjED7OgODbewee9WxCNQmp7V6CU3f6ZjGmqPYB57nyZ8FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="DBp/vH71";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF71606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF71606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DBp/vH71
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEA3C1691;
	Mon,  2 Nov 2026 03:27:54 -0800 (PST)
Received: from e142021.arm.com (unknown [10.57.16.239])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A36E3F632;
	Mon,  2 Nov 2026 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618877; bh=RKMzkXkTS77GadAp9J+goiHtSapT7Ynda5IA90c+4TY=;
	h=From:To:Cc:Subject:Date:From;
	b=DBp/vH71jf7I6tLRCXVvn/2ffdavIE0y4AWsUGEm6HXo6z6G73nguMt9Tp7TxjBSb
	 WvrcZkTtPuzPw5945yZRUulCv9ClShP9O7pQDptSyBxH5IDpDIjb0k23SjbZuAozAy
	 OI85MZfiTZAJfLscewOejq9UfhIny6hP6soA94ik=
From: Andre Przywara <andre.przywara@arm.com>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm_mpam: avoid hour-long timeout on invalid ACPI table entry
Date: Mon,  2 Nov 2026 12:27:48 +0100
Message-ID: <20261102112748.3458012-1-andre.przywara@arm.com>
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
Content-Transfer-Encoding: 8bit

The ACPI PCCT table contains a "nominal latency" field for the expected
maximum time it takes to handle a command in the PCC mailbox.
The generic ACPI code reads this value, but leaves the handling to the
protocol users.

For MPAM-Fb based MSC signalling, we use a value derived from that number
as the mailbox timeout. However if the ACPI table leaves this entry at 0,
the mailbox timeout code interprets this as "forever", and waits for one
hour.

Avoid that lengthy timeout and just add one microsecond to the read value,
to come up with a non-zero result in any case.

Found by Sashiko.

Fixes: cb351e3f304b ("arm_mpam: detect and enable MPAM-Fb PCC support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71e..fb596ed19a648 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -102,9 +102,9 @@ static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
 	/*
 	 * Timeout based on the "nominal latency" in us, from the
 	 * PCC ACPI table. tx_tout is in ms.
-	 * Add some margin here to be on the safe side.
+	 * Add some margin here to be on the safe side, and avoid using 0.
 	 */
-	cur->pcc_cl.tx_tout = DIV_ROUND_UP(cur->pcc_chan->latency * 5, 1000);
+	cur->pcc_cl.tx_tout = DIV_ROUND_UP((cur->pcc_chan->latency + 1) * 5, 1000);
 
 	mutex_init(&cur->pcc_chan_lock);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

