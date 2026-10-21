Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573360;
	b=CZiEIF/XydbBzS2CtnxRRVtxjPjQKbglDu5/imOWoVcmpOsDBlXAjEBY00Tn+Hd+zFrQ
	 k+qAFNOrMbztheSDOphMnBu+QDXwOz385SYpxrD8PNPtf7LgMZVcJH09Lcjo8XDyT0Sv5
	 DPa8aGspvf1DqMYhIThtiDrNkXFxhtX6B8QS27srXX8qbygkTsAK5atE3hv/kJQLhgx+4
	 KeKO0zcGke8pWwAaBgvBzqkeVj3HsDjjRa1ACkJdcKZr7/auLG0YtWrMvYFKt4c8DMb3n
	 bFKyNbXDbuR6cLmEzgTSzXK+HEjc9pw60rW6ovZsHl4RN8MewN0QYm7YKzhaaCP0bRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573360;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=eRh1kzx5HpSfi5egkN/Oe4gMBbqv7c43Q6Wurahc+Io=;
	b=zxt8YtR8FmpTbYu8luLveQs13gqey4UVtXoPAXnOUAEytGgHh21okfFLdVopOPmBOuG+
	 qKOCJrX9BlRFGHd7P1sQvs8eGMuvcyir3dstIUJmvCYAIJULvQomHVwCOqwXPgQYZauBi
	 hVGIpQollVYR5yeCBqkQ46hm8lAiRusXLLbECdjDzBBD3VEpQp0Bcja+0UVSk+ugrT8MZ
	 awbnvR2Wm71hyzd1LVjjXJSqp8GeNvMtsdRsvXmaQPCUdmptE/oXVxKazkjsa1zFpG8tr
	 WKDR+wecZQYKc6Ci08mXZXZlfzNlHzFQWqBXj5j2jAyKhJlwrXMPqWzA0dbZq8GibEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KWLHy7qt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.21
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8A606A31A;
	Wed, 21 Oct 2026 09:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=KWLHy7qt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MINdFn7QGbbqcHxnQMYHjOzPTwK+mFaYaKCRpLWR8zY2PgtKSxCX96ZzrfUGpSEm2PVKMrChVW/JxV3vCkHV/m8B6L+elQ6V5+cwXfYjXWnTCa594IgxIzGbKfbCjg3bOeYdMK3uMXAfQqFMXdrpyQh6o6e6JNKNGp5ws24UO+IUi6+QiztWLqx2RQE8dg+Z1IlRlZwcso+5pYof0/dL+6G3rYDjgO2Nhi9A7qJ+R3t+d5MqHHlC6TdH6rM0aWXDacrgjzyct1IdSyzmCVau9KAa9pbrlRqPANCq0lRLMvW5EfRUKlSvQhmEDUaQheLhQl349yKvVRZH2Vd9+7QbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRh1kzx5HpSfi5egkN/Oe4gMBbqv7c43Q6Wurahc+Io=;
 b=y0nKPFW9MNkntxyeJuYbTnrOVcaeyPWyspf8vgMyaPEkRaKKSPopqN/+jTQ4ZOuhw687BcOifbzos/cpRi1r177SR/JAPc+WDAIZWKoaZt9AxlgcMSBDOXTcruteoyNe8wqXYN3NDVwb6HrnxR31UNeqtxHsk5tpy2A50ZBJEAExV9L8WaiESKDAGRdc7Xv44xRRDtl/ecLxJUUnGMEP+do8mnOUW2ereXmRzJVijKKzXpC9yrkEjz1+av6aJx+HbqcNFQ047cbBa6hybO1sVY6VQs+W/tD9sxmqlW9CY1swHzGkzitnj5mTLDxel/29VlAGXtNQOxlh91jiqKd6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRh1kzx5HpSfi5egkN/Oe4gMBbqv7c43Q6Wurahc+Io=;
 b=KWLHy7qtEPP73/HQ9kY5oFIZgY1c9qTrbUEer3cI/yajE2es2yicfcXDTdjURUqQR6exYn6FYzbFHrToRhfTLQxjbp687VjFeKZ6YTp9sEZwH6D/ejzzuvgpewcv9R9ZYif/X6X1QU+ahwUaMIYaKW8WU6cTyVpQ7jge9oKxZulazbUA7UubqKkRdQACMrMY6L2zTAPArp4UYpfFBT86jVgat3rfWzAJfDhz+yaF4Hsa7FdgwJKSndXy9zvvuzfEvyA9zAY2h4n1u+t6hVtgco7Wf8N3HKmiKpHff0UFPwKhLdqtJV+YgfF5Cv5KIWuCm28SBK5cdX3z22TSwaDtTA==
Received: from PR1P264CA0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34d::14)
 by AS4PR10MB6063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:582::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 09:02:30 +0000
Received: from ZR1PEPF0000E6B4.eurprd05.prod.outlook.com
 (2603:10a6:102:34d:cafe::6f) by PR1P264CA0195.outlook.office365.com
 (2603:10a6:102:34d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 09:02:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E6B4.mail.protection.outlook.com (10.167.241.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 09:02:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 21 Oct
 2026 11:02:46 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 21 Oct
 2026 11:02:16 +0200
Message-ID: <0cc7330c-d563-41bd-b3d1-992f60ae32f2@foss.st.com>
Date: Wed, 21 Oct 2026 11:02:16 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor
 driver
To: Sergey Lebedev <lsa.uz@pm.me>, George Neacsu <geocausa@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>,
	"Hao Yao" <hao.yao@intel.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261019162722.25587-1-lsa.uz@pm.me>
 <20261019162722.25587-3-lsa.uz@pm.me>
 <179243379000.31842.4735750009847702427@gmail.com>
 <20261019193402.52923-1-lsa.uz@pm.me>
 <179247822513.25202.7960395606350309657@gmail.com>
 <20261020085200.60619-1-lsa.uz@pm.me>
 <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com>
 <20261020142641.24808-1-lsa.uz@pm.me>
 <20261020181025.8625-1-geocausa@gmail.com>
 <20261020181415.70007-1-lsa.uz@pm.me>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261020181415.70007-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B4:EE_|AS4PR10MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3567c1-55f3-4019-5f1c-08df2f52096d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|1800799024|82310400026|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EJ62/iNWInwIGxp1XNoB7OtxQ16et5XfX1CvWlpvpZ8shgn0dZ/xmFbaaUIJYbCA+q94y3ITHOmAns6SvoBsASSh6nNmujV6dQREswkAtYhjkhRGfaPPY8gc70gZYOS2wTP8jl3oA4r7ySYyuG95f5jEb7EymSfvV00tMvwXDtalcgvvZ1JGlmLXW5kMS+lNDoi4GRSQ05pjYFjoXt6GwLYrKFnjyxCiazaBHPwIirWg4/OcegM+g4RZLw91ormCju9VWavmMyXOWYo6kRueDzt9knNWX+Y2Jr4OnjXuhCtI9immxsiPDBP4vC/tmAQ8zjDg+UMILNGLvyd1/7QRdeZXMXrdv5YaLESrjr/YKZPXEMLglxRI/0KA5K1KW/kqhtaBSLRrLQaC+OI0l4u+65TWjkbUeYQvxABLkeV2mIxn2hQpAL6xovYBq/tV5BrLjR/MS2lECgKqpHcnQlerp4t3CSOVfd3d+7g5EP8qz8dTNOBxP0nPKDkfAq5pw89lnkjg4kMcuMCfyyHCYENNgQgMuSA/4XvrfO30pQSLWx/cJOtfEVEltbyu5wDKRZCdz3jYgcQElERyfkb23LyZ+8/FEgHM/UVWMhkmiuKMXpk7s0MqtoymP8uuRzBfabFgC6bB8FiZ+JKt7fVxxWSz+c1CMKISe/EJomdh/OFx70ZwhbB5aa65wRwOtnWM5qXDnFlIW71wjjAWqCCKU9VDGQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7jhwbk10v8u9uBU72v2IK15S1c81oM9JBjTy6bsYhpEr22nJf6qVceXBvtkH6UgBFooWpuavgiL1HsjVBw43ZRA/ztX8o6Im9gNy3SAHNDzqYBMGxK/m/1O2kgu3KMGqBTFU8wyv/XJPhEa2tDHZzvLyLWUknW3W2y6vqEXVgxCAlAarkViZTkaiQ5SkxiAFuBXDOHq/vTIsSysrqpSsxMnwqu5QbsvQ4eKe6AL5JxC5mnZG6Kb9s8t+Cbg9lff6QGcZboqzVYEKLKabPjlSY53H8fSqzv9BDDix9pnjHxHZ91XfjVPNyQbBTUE9u8kyUwD0EfjdaGOWZifhqvShY7BPzuJy0e0H+K7mofV6V5B40e4quKeMTvIX1DA+zzMYrPwYHR4UqA9bQ22f66VqMi8XNK0LmxV5OBPXQr75aLg6Fp9KvfT0avuiH6F7iySo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:02:30.1151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3567c1-55f3-4019-5f1c-08df2f52096d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6063

Hi,

Le 20/10/2026 à 20:14, Sergey Lebedev a écrit :
> Hi George,
> 
> On 20/10/2026 19:10, George Neacsu wrote:
>> Sergey, the write can stay or go as you prefer; the Snapdragon model
>> does not need it dropped.

Glad you got it sorted, I was starting to wonder.

> 
> Thank you for going back to it, and no need to apologise.
> 
> Then v2 keeps the write, as vd55g1 does: the driver does not expose the
> status lines, and on IPU7 it makes no difference either way.

Could we keep it disabled instead ? I'm afraid some receiver could
catch all data types and therefore messing up the frame. Better safe
than sorry.

I should update vd55g1 too.

> 
> Sergey

-- 
Regards,
Benjamin

