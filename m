Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450677;
	b=Y1PWkjd9156gBBlFfAy0hSD41IepEQRJwWEawLo6SPtcFhrAXNeShLWcRa0pmmFm6LDv
	 xcLdJ64z+GARef3TxzaZMetNCog1xl/3M7N+yBQJb4FnxeR18yFMrvHT6VrZeZDdQmmzo
	 xiMPx9/v8Vvwqve4xcEipByUfKMeXW75ehAvtN4hQ4Fv2LGqCxvDhlHAzY95UAvv8g0Jq
	 SWviU0cansK9pN4wCpaGvJJmsu0zsw2PL9qcwa79mePHxmbxS2vqILeY+KqCrfPqyrPbn
	 h64oy9oGMxJyTp2KZgiJin7rwN7RceBNYThOpMjUa11LTRhPG6Tc5VYL/5U7vtgBSDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450677;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1XJFoaIeUqhO0GefopNaJ1CQoEbP0xbppbD7iy2MzDI=;
	b=QjJvZRcNJrmNgeHZzea0ekV8bj2YD2o5CXLzjPdramd6VUMx75GpuQK2DTvWwpi10tn+
	 WwPxBILPpxy4HRWa7YjIfxrWICPCIpoTW+t/roGxpCZeThHO1jtrTP8U+qIEC2FHv0We1
	 qrSbyRSEYuC6/jvJ8AKeMyZt6mRWJS1ndx37+zHgdKzzoe+yIrBP0jE8o6NoD2Xe+ntbJ
	 PQUkDo99pDlGzOFdIeukVBmYlltgxT0zEipaD0WP77AwjXfz6VCYUGG58mpgvM2YiSzhf
	 4b30VUBegt62P+D1pNDUz0stLrHG3632ViwPYFuvF2ZoDyfy9LLzkX61VkQ2E7AQ+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="ue//+4Na";
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF3E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF3E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ue//+4Na
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ue//+4Na8qSQfgP+w+BaKdv5dLlTANRQCuTL3dRnC81CjMEQuz5nY644acWsRzucDv8ShCxOb76+6
	 fW++2EUslu8/MNrChAm2InzfbXtrp1bA6i7cQratTN3N++Y+xbIA5EaoohkkCMOgpor9Ek5V8gW+JH
	 NobywREsMDS02ywU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af524f214d-a8ade;
	Thu, 12 Nov 2026 10:31:15 +0800 (CST)
X-RM-TRANSID:2ee36af524f214d-a8ade
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af524f10ff-ef405;
	Thu, 12 Nov 2026 10:31:15 +0800 (CST)
X-RM-TRANSID:2ee46af524f10ff-ef405
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: rafal@milecki.pl
Cc: srini@kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] nvmem: layouts: u-boot-env: Put cell nodes on registration failure
Date: Thu, 12 Nov 2026 10:31:14 +0800
Message-ID: <20261112023114.118202-1-zhujun2@cmss.chinamobile.com>
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

u_boot_env_parse_cells() takes a reference to each matching child node
before registering its cell. nvmem_add_one_cell() transfers that reference
to the cell on success, but does not release it if cell allocation or
initialization fails.

Drop the node reference when registration fails, preserving the existing
behavior of continuing with the remaining environment variables.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/nvmem/layouts/u-boot-env.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index 33ec2350386f..f4839571b794 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -78,7 +78,8 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		nvmem_add_one_cell(nvmem, &info);
+		if (nvmem_add_one_cell(nvmem, &info))
+			of_node_put(info.np);
 	}
 
 	return 0;
-- 
2.51.0



