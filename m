Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C3821CFE0;
	Wed, 30 Sep 2026 05:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745313; cv=none; b=gcwAZ9L99I4gmxLQLHUHbkkDue+EnNoMaIXoJ/ke2+5VziY7TcDW860m0rRFtpqZYZxA4APQ5DJ1h6yIR8zpmiiEOcTFv9JNzTHeMEria4BP0oOwkQ3pOqnTkvFviGZBQAtGby773Lr7agOHEgzHOtPbTBDS0O1nyLg1LtQbJIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745313; c=relaxed/simple;
	bh=3jMs/G66KFFfPwaucwRCSemgPoTboIC6tZoHaXof+m8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t6F2IF3SOBMPJ9fMSEj8fpVGDKlAEWxp4H1+pMHHu7FB/DghlODIubSKsEIhiGI+Tta2ZClXkTclCbhCK+UATYEBo9n7dLMwGiWlKYDQsV3L8TmaTp6W+eYe0J+VnnkxLvC7IRhvk6ozsqRaBq4cZ91YjMSx2l/YqI3uQC2lG8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Sep
 2026 13:15:00 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 30 Sep 2026 13:15:00 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 30 Sep 2026 13:14:59 +0800
Subject: [PATCH v4 1/9] EDAC/aspeed: Set the DIMM grain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-edac-v4-1-c2e526f3ed79@aspeedtech.com>
References: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
In-Reply-To: <20260930-edac-v4-0-c2e526f3ed79@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790745299; l=1202;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=3jMs/G66KFFfPwaucwRCSemgPoTboIC6tZoHaXof+m8=;
 b=sRf7TWL5EgGoyjxkzabJQ3BR3KN5+/hZwCavoxzhzcEykUwr4FbVallHrx6UpntmLwGpvb6tl
 +HF1wFm18J9Dk3vFfnFkIuQsSx/2Xn0ydiJAM2Hqq1CYB5SeTP6w60O
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

dimm->grain is never set, so every error is reported with a granularity
of zero, which edac_raw_mc_handle_error() warns about and substitutes
with 1.

The controller records the address of a failing access with 16-byte
granularity: MCR58 and MCR5C hold it in bits [30:4], with the low four
bits reserved. Set the grain to 16 accordingly.

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

---
Changes in v4:
- Explain where the grain value comes from rather than the warning it
  silences.
- Drop the Cc: stable tag.
---
 drivers/edac/aspeed_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 6e069b255595..83d60414f89a 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -266,6 +266,7 @@ static int init_csrows(struct mem_ctl_info *mci)
 	dimm->mtype = dram_type;
 	dimm->edac_mode = EDAC_SECDED;
 	dimm->nr_pages = nr_pages / csrow->nr_channels;
+	dimm->grain = 16;
 
 	dev_dbg(mci->pdev, "initialized dimm with first_page=0x%lx and nr_pages=0x%x\n",
 		csrow->first_page, nr_pages);

-- 
2.34.1

