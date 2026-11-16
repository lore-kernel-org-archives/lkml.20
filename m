Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833977;
	b=a2Zg06AW+hHlbQCD8Iu9fc9lO/ZyQMkHd8Ys5Qf8pFAwsJMsALOZXtQ3Kht5sudKkYUN
	 4/p/b8ZAhN5PcqbxvjP7Gld/ecAOi7m9vUQYx8HNnNDCuRogyk8h34HytJV9FevI5oUHk
	 D5gZEmrAoJ3mWVqR9EDbwJCFONCmATOdrX4R8AWxSvQcNvcSkIc6slhj6USXccx4edkA/
	 cMHhxzdpUcZXwRMTqjHI9MtqHLHlr7fXrMoWQIxMdTjlyCDc1Pa9Ed1liLClBiKHTCYPH
	 C4ugNnkFm1dW21C2LQBnIwHzdb0TYCaOa97vKcAJR0db8lcLs3uIuShOjIGPdKrzFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833977;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=;
	b=iv51ewosmpWJfjh5BBiDjjJhmh/UQ5ipPdyvl34kf37xrxF8QotJtvkqeh+2NRJLFqtY
	 T0qNJE5Ho8RFmTTxW+msX1XtaTKhsfnTcXjnqGDt1aJp5BM3ONVifOSf+9V+WtK6y4p2l
	 6uTI/O2/o4emCgq5ob7X1OACgII22N7jM0EyDw4j9OX12QLoKRcyrvjGxSKdYmMdOIRq+
	 g/RA4anw2ZdsKeoukoaxPFvG2JbqDCKdpTgAT37YrFC4HZ+Fi/6JxFcPbMvWAZc41aKJr
	 EdrbI/tyvcbgnedb67dwgRpAC4z1Abr70DErw2nTJgIhzN4Mh4L0gRDz0dKwf4D70sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RDi9sqvQ;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D1606A331;
	Mon, 16 Nov 2026 12:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01D1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RDi9sqvQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=;
	b=RDi9sqvQcqUUiXoJvYPkjsWO3kL7JyvV/wAgS2GQ4J7Kxr4nmZZQYZahupS82jwtpiewQV9/q
	7vDwE3uxIQeHUF/yqp0k9IJcCmDectsntLoK6cAMnyVj7FnLCJFkIJaI1b9OoZv5ID4eP7O+fWq
	rAcoKrXBIimdTsdw4quHXxY=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jSnxk4SHvz1prKT;
	Mon, 16 Nov 2026 20:59:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6BB6640679;
	Mon, 16 Nov 2026 20:59:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:59:33 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <fustini@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v3 04/19] resctrl: Remove the L3 monitor event names
Date: Mon, 16 Nov 2026 20:58:59 +0800
Message-ID: <20261116125914.498841-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116125914.498841-1-ruanjinjie@huawei.com>
References: <20261116125914.498841-1-ruanjinjie@huawei.com>
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

Every user has moved to the resource-agnostic monitor
event names. So remove the old ones.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/resctrl_types.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index 8679cbe589ec..d0e56de038f0 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -71,10 +71,4 @@ enum resctrl_event_id {
 #define QOS_NUM_MBM_EVENTS	(QOS_MBM_LOCAL_EVENT_ID - QOS_MBM_TOTAL_EVENT_ID + 1)
 #define MBM_STATE_IDX(evt)	((evt) - QOS_MBM_TOTAL_EVENT_ID)
 
-/* Old names, kept until every architecture has been converted. */
-#define QOS_L3_OCCUP_EVENT_ID		QOS_OCCUP_EVENT_ID
-#define QOS_L3_MBM_TOTAL_EVENT_ID	QOS_MBM_TOTAL_EVENT_ID
-#define QOS_L3_MBM_LOCAL_EVENT_ID	QOS_MBM_LOCAL_EVENT_ID
-#define QOS_NUM_L3_MBM_EVENTS		QOS_NUM_MBM_EVENTS
-
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.34.1

