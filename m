Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277411;
	b=yZKNg+nh90LoChu113PRswYLUhd6m5GEnJbpdrfh/OWWmd3NXoAzQIrC181FXKJJGc0M
	 aIDGOAy9TLwtJrycXS1cgi9uQOReM84mLalHJgVfLNZYIQUsZY6vl01UIZyo74wEFVhda
	 mOTLBX3D+WxhRH11y+F4ZedEHMiUzEX7iuYXpOrBxsWq72JyjtAcxscHblvzL42pg7oqi
	 vWuL9SL4lCPQY2xzf7Wt9C7HAftvkO9MeqKx/B5V91+dHzb9oKcYKS5VMxypN0zG5wrUt
	 Hegque4CBW3/IMRrQYlVeXSvJQtyqG/gISts6tPOCxLzcwx6UiPVuy1RCiwEsunl+qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277411;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=;
	b=fjDOmlrU6zOcxsVU4rJJfRMsbxSVv0DGmlfcBCS3tzhOuGjazZHxY0dxoFSpWlJv5jO5
	 CDnCWiAg1u1a2PFuSK4n/oR7hC96WgqyIlPSsxhVbBXxFBaduaaz/FuA4AA3ocCKIf3mm
	 v9UE0WqKgjzw1DqZ7879XbJ5+draU4XyRHfQEmC4wsk0dh9VwzABWr4OSTkIXsmyaNAEQ
	 Vwtul+rhtmSwEnJSlRG5B808sW7niZTkveoyKsyheo8glx365YiiKpsDl0yEcwKwYJ29Z
	 oUOovF41LWR148D3hidYC0Ds2UUp9ENgihB3OuEmdyTwoVZCViU7yuNQ1MFffgdMB3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RDi9sqvQ;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5852606A31D;
	Thu, 29 Oct 2026 12:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5852606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RDi9sqvQ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9LtYTlF4nmZX0qyti0J6LbKRcdJci5QGUwvdH4bCuSg=;
	b=RDi9sqvQcqUUiXoJvYPkjsWO3kL7JyvV/wAgS2GQ4J7Kxr4nmZZQYZahupS82jwtpiewQV9/q
	7vDwE3uxIQeHUF/yqp0k9IJcCmDectsntLoK6cAMnyVj7FnLCJFkIJaI1b9OoZv5ID4eP7O+fWq
	rAcoKrXBIimdTsdw4quHXxY=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jFkJ114b0znTV7;
	Thu, 29 Oct 2026 20:36:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C2EC54056C;
	Thu, 29 Oct 2026 20:36:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:41 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 06/19] resctrl: Remove the L3 monitor event names
Date: Thu, 29 Oct 2026 20:35:58 +0800
Message-ID: <20261029123611.1108424-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
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

