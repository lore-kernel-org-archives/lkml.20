Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.218.115.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452907;
	b=kTF1Gx6ODevWhZTnnKKorxTk2CDcx16MWjoNXIEZTJH5mCzK7+ArtnrEjVe5BKf4Vi/E
	 wgIRt5rR93p3GcsxvNCwyZjHDJKaTo0/dK6tEuGf9lfE/8NJiaLHKKnYFcKRGbvEnZfZW
	 o4qskgVFeFGgCetBSSD6v9CdJX4Dsgu2x4ruEEFquI7rqg3UuWg+3hFNB6rVyoqnpwH3M
	 2iF8dj5xAv380tLG3fTqYXSVQeb2x+le8935P/Jb0Z2RZNIt/Wt0DPhqFxvUj7GucxgzP
	 f7orPxqXojofDpA0Q7aQNNxR651I5QRxfy3qCh631dJG1PdmzTe1/4wM9VMiu6eddpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452907;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=HingJ0YENb+3r4gVuRvxvixNcFrqq/9UYdQqlBlZUCM=;
	b=xeQg8U5o8eki8z82XN4c/gNNvdlQe40LnVqDfwdtSBNz5jUdnYQgUR+w3txhN41A8l9r
	 wlZFw1vqEpclhxfyCGH81naUnNZN4H3KJMW5yzBloZSE4dRPzCz2JVcRRY7GO7Y/x4ksE
	 xVJQ75zkaa+4/4QG3gLTMLY5caVIMFAIewD7nlpiliGk1ICjMF4zQbx/nKV0sevsHjskc
	 CsquIv6hERNd6zxJCyFg4+6MT8FhE4WZrWrvK3blIzT2+8Wwt99O6etCPuiU8+Jchkee7
	 iFL91WC0TMQiznY3fCdWXyODgipRVW3vDPyboQKo6qx9FwPYLcQvMjw+KZijZXJzpjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=ln4Qh9I6;
	arc=none smtp.remote-ip=34.218.115.239
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D6606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299D6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=ln4Qh9I6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794452907; x=1825988907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HingJ0YENb+3r4gVuRvxvixNcFrqq/9UYdQqlBlZUCM=;
  b=ln4Qh9I6yfcHBM+hMSPwEi6MC7zHTJTzLHnv5mUw5UqNJAA4kD5pHLhS
   zUCWL+pa7pWXLRUpBCCTjKZ5FeZ3R1v32LmkdEQlzGhcyu5B9FHZLuimD
   uokZWHFUt0gzBNdDBncoBKc3qoELgy/Ay5NhFa3OEV01Pz8tsAudNxleM
   KeXsjYae/Jn6Q+vtO0DLLZIAONzh8T+6aY20UliRpVzufuhDHPOBek64S
   M5lY7SimjoYxGnJLa6B7YAyQDrZ/9ENDazYVp74JgxIex/54cbUfBEIBV
   60YV7dhru4CTy25iCvVmJSbUmxfvR/g41qVLZJR248x62nKDWxjw+c4iH
   A==;
X-CSE-ConnectionGUID: hNHQwY9KSqCme1mlFW0x0w==
X-CSE-MsgGUID: X731bPnDQCaH/RQAe9oF2g==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33550225"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:08:24 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:20605]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id 28549e9b-5182-49d8-b862-ae3929f78482; Thu, 12 Nov 2026 03:08:24 +0000 (UTC)
X-Farcaster-Flow-ID: 28549e9b-5182-49d8-b862-ae3929f78482
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:08:23 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 03:08:22 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, <nh-open-source@amazon.com>, "The AWS Nitro
 Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>
Subject: [PATCH 10/19] nitro_enclaves: Do not report a torn down CPU pool as set
Date: Thu, 12 Nov 2026 03:07:06 +0000
Message-ID: <e417b0b35d9b7fae7b49be0639fe622291511f91.1794393487.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An admin who writes a CPU list to ne_cpus can be told that the write
succeeded while the driver is left with no CPU pool: remove_cpu()
returns 1 for a CPU that went offline after the list was checked, and
ne_set_kernel_param() only tests for a negative value. Return -EINVAL,
as for a list that names an offline CPU.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 0a1080443fc72..1c2a4994257d1 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -318,6 +318,9 @@ static int ne_setup_cpu_pool(const char *ne_cpu_list)
 			pr_err("%s: CPU %d is not offlined [rc=%d]\n",
 			       ne_misc_dev.name, cpu, rc);
 
+			if (rc > 0)
+				rc = -EINVAL;
+
 			goto online_cpus;
 		}
 	}
-- 
2.47.1

