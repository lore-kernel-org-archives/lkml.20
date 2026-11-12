Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489198;
	b=0FUtQ9CKV004KPtif8IlZHqglZylcShvdDacUJkxbGGf5JOxbaZFRSMyNnC8oKbxNvjD
	 lY2RI8g33w+gsRuf1+AFkoP6JT5x48mn05wJu8TLlmkiYWbaf/I4kWeBBiPA8ZzOPzYzL
	 DXn/grbQ4MnX9Q/dMCjuVJJOVMEC5fF9DZCRO4+hAVx6CkX9i53hnAgXss70l7SyoXBtj
	 BUcCSvw3ykxIThHzsGTCwlixj1iuTs0PzStwOj1PP+bCBbfWumQ/1NFrnOVxrzHQ35XVZ
	 WTjeoVlFwuovL2pt1WJt8ecjq0LD4PJ2dMwW5/lkQ4O8nj5JwCt4XXd5DQvShMiKONg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489198;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=S7gJ+mmdj4WD8XdNszsZW9Soksa9swlMwBZkMkhbAg0=;
	b=fqxf4dahC3maHaITEksfxnK/U11tpoEIWQ18VWfPvvXDkU9gT+CwX/8tQOBkjzsSpwJ8
	 CPZqUXfMeVJTTgXZebxGLN8B9xWrO5/f9r5RtrtJJEIy14ATQDQ0Mfk9c7pGzGHBA+wOV
	 4JpJohLg/tjysokFZ6oppKuko7G8R8e2dfkH2DyLEl66eS/E6gmiuF+n3/h1WSUwhqlHv
	 sBqSeIBFWyjZ/v9+IQV5VbYA2gQfIv8W4biyis8V0ZrJd1m9R/7Ehz4iIdNnurfNAt1VI
	 AkPzvXEUY2mP1R0bRCNKpSE2bXzEKo+KkaAw29ZYoq+0DcXlh8GspEx1mqIv2JfegkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="ej/S4iTx";
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21524606A323;
	Thu, 12 Nov 2026 13:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21524606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ej/S4iTx
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S7gJ+mmdj4WD8XdNszsZW9Soksa9swlMwBZkMkhbAg0=;
	b=ej/S4iTx41VeJL9brXJ9rhJdW/Zo2ncGLkDo6fqWSSbSp/XbDgbzr5EFlV/xl0YomR8umZLmC
	wJQwBd0sAqU3QsGzBsHqDpRVfz9Lm6MmNwhRlWUwRqfjUBRdeSzQfVrTKjBSLBQP9bzO/cwfbp+
	YEuAE49iHoaLXKA5EKPbyNo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jQLRf4JMyz12LdQ;
	Thu, 12 Nov 2026 21:13:18 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0BBE240537;
	Thu, 12 Nov 2026 21:13:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:13:12 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <quic_jiles@quicinc.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 2/9] fs/resctrl: Avoid division by zero in the MBA software controller
Date: Thu, 12 Nov 2026 21:12:47 +0800
Message-ID: <20261112131255.4043381-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112131255.4043381-1-ruanjinjie@huawei.com>
References: <20261112131255.4043381-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The software controller raises the control while the target is above
the bandwidth expected after the next step, and it uses min_bw instead
of bw_gran. The two are equal on x86, but when MPAM's maximum control
has 8 or more bits, min_bw rounds to 0% while bw_gran is 1%. The estimate
then falls back to the current bandwidth, so the control steps up
whenever the target is above it and oscillates across the target.

With min_bw at 0% the control can also reach zero, and the estimate
then divides by zero in the MBM overflow worker.

Use bw_gran in the estimate, and step up without evaluating it when the
control is zero. Also require the target to be above the measured
bandwidth, so a zero target does not raise the control.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 75abbf90d090..f067329e92c6 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -673,6 +673,9 @@ static struct rdt_ctrl_domain *get_sc_ctrl_domain_from_cpu(int cpu,
  * with 10% granularity steps, check whether moving to 40% would go past
  * the limit by multiplying current bandwidth by "(30 + 10) / 30".
  *
+ * A zero min_bw lets the control reach zero, where the ratio is
+ * undefined. Take the step up without evaluating it.
+ *
  * Return: true when the control value changes, false otherwise.
  */
 static bool mba_sc_next_ctrl_val(struct rdt_resource *r_mba, u32 cur_msr_val,
@@ -683,9 +686,9 @@ static bool mba_sc_next_ctrl_val(struct rdt_resource *r_mba, u32 cur_msr_val,
 		return true;
 	}
 
-	if (cur_msr_val < MAX_MBA_BW &&
-	    user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) /
-		       cur_msr_val)) {
+	if (cur_msr_val < MAX_MBA_BW && user_bw > cur_bw &&
+	    (cur_msr_val == 0 ||
+	     user_bw > (cur_bw * (cur_msr_val + r_mba->membw.bw_gran) / cur_msr_val))) {
 		*new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
 		return true;
 	}
-- 
2.34.1

