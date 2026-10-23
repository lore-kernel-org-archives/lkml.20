Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723739;
	b=KwBvS/EPsrDy2n2V69VwYBit2rbnUMHC1AwFKGiR53KWqEtd+tPcLxr4tVgxynket2JB
	 vxAfbzOzvZ+FtC90MzOuUu3neDX801/2lTGpgx4AZsCfWOEupDXg2Vze4Lb9MYNd5Jahd
	 SliSlIcN/8elJEymNJm7rZgM+zElyR/imUEN5hw65hU5QuEFbf5H2bnfuNOIfVm30nj64
	 n1QWv6GOo45u0xRcoHcNgnxmriFfR0o/u7K1xRLlJU2G2HYJ1Z2iqGzQUzxKEaef/y1MC
	 73EgNIu8RcdVLOXb6ciOMBOz9K8FdiecQpOqidxPNIGn6W3YCaOTE5SEBAGfkzirXXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723739;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8N0vvNfPDySKES6FGwxUcVWy9mBFecMFoWDjJk1U3eQ=;
	b=LO/y/7wE8/ESlkppVLrV4YDDjAaSy58GMLIA51od7P41PTfj8HRFivyHXDNYtyEn4qVA
	 r5qkTRKzNxRHOgHYLNNqlIdqflrfH6IwG6e4dBoz/xbb5EHyjxd6J/me7dTdy8knjBMr2
	 1ghkDy+HttEv7O6fh15gHlIv4WhUSlNtEyD1ysKk0Ghv9TM/8tKdtqLodoS9bHitAe2sG
	 5RUoMjoOAPeFB6ubG/oeupS3OcUEFdr1XqnYyBZRp1BhK/ZvY4OEarybuIq0mjrwq+8DL
	 oqNkBv2A/gx1Bz16M65sxm0/y+mNCdP4QIGd6+QqyXZ2NRjTYGcPcEqyzyRpuqIsUbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=a9Ib6owE;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930FC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930FC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=a9Ib6owE
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8N0vvNfPDySKES6FGwxUcVWy9mBFecMFoWDjJk1U3eQ=;
	b=a9Ib6owETab+4b7dS0ictBOS5B5TAGv8PgiGZP8zclTK/SvMEAi/ZVSa2gw3evaRRqUVDcqQ6
	dWRNY/zP6wW8qw+tRfWa2FT0KUN6aknEnJsLt9UFia8S7J7R0fKfaxQZ6iZf7wMneZFaDSdNAtR
	C7jFWoUmGoL/5QheTxii30k=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4j9nXB0GPhz1cyQr;
	Fri, 23 Oct 2026 10:48:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7922B4057C;
	Fri, 23 Oct 2026 10:48:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 10:48:44 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 06/10] arm_mpam: Clamp cmax_wd to 16
Date: Fri, 23 Oct 2026 10:48:08 +0800
Message-ID: <20261023024812.232820-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023024812.232820-1-ruanjinjie@huawei.com>
References: <20261023024812.232820-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The CMAX_WD field of MPAMF_CCAP_IDR describes the width of a 16-bit
register field, as BWA_WD does, but can report up to 63. The
fixed-point conversion of a CMAX/CMIN value shifts by 16 - wd, so a
width above 16 would shift the wrong way.

Clamp it the same way bwa_wd is clamped.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 22169436689a..0bed6c430af7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -803,6 +803,8 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		u32 ccap_features = mpam_read_partsel_reg(msc, CCAP_IDR);
 
 		props->cmax_wd = FIELD_GET(MPAMF_CCAP_IDR_CMAX_WD, ccap_features);
+		/* As with bwa_wd, the field reports a 16-bit register field */
+		props->cmax_wd = min(props->cmax_wd, 16);
 		if (props->cmax_wd &&
 		    FIELD_GET(MPAMF_CCAP_IDR_HAS_CMAX_SOFTLIM, ccap_features))
 			mpam_set_feature(mpam_feat_cmax_softlim, props);
-- 
2.34.1

