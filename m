Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503804;
	b=RAGXnIKVEATJJiQXl9orbT1QXab/Ncd+/gxo2gJOLmOgehIbmcPHttS7RY22VH/Kzz3o
	 OKZx8BXUgsIo/aZr9sqrt71RPPz9ryypIFEpwzjEgDI7rI4fLKTPiQ/4bb4Cea+GrhE1/
	 A4HWiajAikg0YxzsFyUa34k+0tSAIb3+HNq7Tum9hx/8UjkUp6/CI1KH+wTwTRMpkuhvP
	 6LUvL25w06qxU3jsB5UQ7Oc9CwezQ2Fw5GtYxzaxnoNvq0OlDRyna5tbB80Z1c8mRIo8O
	 ptGTb8pU4uJjFXatw9vje9Iu/2wW6zS+MlfCLwPahObW20gJ8dxZHRctZLeuBWBbsKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503804;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=iMYujXOhWBWHmn+IhQQIgEOw5PqY3bO4tqVWw77etdI=;
	b=vYbAXaEc2FkPMRnblv6Z95/1YjAIGy68IKsMkGSKfNupIZZIKc3kYw9UcDcIEBZnEag2
	 0DDv7SpOoiV2xxL5m3j8SzgvzD3aw7KtTFMZpQZ4wfM21hi29cKXp45BsXKDn07ZKgFC/
	 ZA67iGGApAucEvyF6ZuI5VAodL2tCnMVRJPY9WtEzmtWfPn+JOXUJh8t7kf5HbTaujo4i
	 skb19mZgIhVIA+5ppkyjr0Zx2pkLfuHEOAF/WucTwHiJu2eou/8QN37jhY8V2CQ0CR5wV
	 UqueIl0DFgYMZn4p4mctSMGFyt7lYXDoJC3Ovibyrxn5/gZj0mHYJATCUTDpL5TtVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ul6t2fNS;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39E60A2613
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E39E60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ul6t2fNS
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iMYujXOhWBWHmn+IhQQIgEOw5PqY3bO4tqVWw77etdI=;
	b=ul6t2fNSo97itWbJRVMjWX5nt/NRiDHYzeW9kczmqMXBbzEC+ZzX0eBPTClpvmjdTDZqyCYUQ
	O5miMJLwWN/QrleOq5jdxJATRVmJ1XdNOAjrrcEzv5MPq6lWZhsv/KYjRt8m1R1PN3P7Y5dXWQv
	5LZOkTEytz1ZlBF2kzbkm4k=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j8DBc5dDMzpT1F;
	Tue, 20 Oct 2026 21:43:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B6C1E20333;
	Tue, 20 Oct 2026 21:43:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 21:43:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<ruanjinjie@huawei.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 RESEND 04/15] arm_mpam: Fix infinite PARTID reset loop when 65536 PARTIDs are supported
Date: Tue, 20 Oct 2026 21:42:28 +0800
Message-ID: <20261020134239.3921377-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020134239.3921377-1-ruanjinjie@huawei.com>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

mpam_reset_ris() and mpam_reprogram_msc walks the PARTID range with
a u16 counter bounded by mpam_partid_max, which can be 65535 on
hardware implementing the full 16-bit PARTID space. After the final
iteration the counter wraps back to zero and the loop never terminates.

Widen the counter to u32.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..61cbc75625fa 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1720,7 +1720,8 @@ static int mpam_save_mbwu_state(void *arg)
  */
 static int mpam_reset_ris(void *arg)
 {
-	u16 partid, partid_max;
+	u16 partid_max;
+	u32 partid;
 	struct mpam_config reset_cfg = {};
 	struct mpam_msc_ris *ris = arg;
 
@@ -1777,7 +1778,7 @@ static int __write_config(void *arg)
 
 static void mpam_reprogram_msc(struct mpam_msc *msc)
 {
-	u16 partid;
+	u32 partid;
 	bool reset;
 	struct mpam_config *cfg;
 	struct mpam_msc_ris *ris;
-- 
2.34.1

