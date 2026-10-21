Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573468;
	b=EQU8GrNM5Yvholy0aBv975d10LiGl5RLwtuwMijc72ac92XqGaYB2iq8NHiuA4Oir/ij
	 Uxy84EmIRcS2011grNvgxXmKcy4uLECkZ7y+RRjR/UKStEtX40aHij3fDhQKK6guTeBvf
	 lFzHZCteV3XB1A9BnrDy+R4uOLYf9gaPk+PuBEasw6rEz/JOEvifyQi4d16ii6cA+GwAh
	 kcqa+VTfOhSI3y+OXEyF9/HkZ6QYmPmXealjMoyJWWQG19aX+5Gef6+WfcdSpf8j1A7Ey
	 fDVubohVZ6S4Cor60GVmQNZLISn+CDgk32frovlgsXPjYjp9dg5H9gMmrutEI3MlU1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573468;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:CC:
	 References:Content-Language:In-Reply-To:Content-Type:
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
	bh=Mpl5lFq/5z/7P+5942HziISR7YV4Qmm+6R4/KaZiC2w=;
	b=IDMpak9vTw0fmseRE/ajecqWbFpyUXW6TNP0t4Q8woDP+fFE3B3DgCb04j9elIE+cuPM
	 VlfiArI/54DajRFeN3aj/tKPF1TiwTVLxMT83gadH6Ll1NsLVqASmkMX2YlD13Jkk4Y1S
	 6umtbtNZDGssBBz2D9vnKY6uAkQy44xb4cDp1llGbxyrryKSuyDgOG91kVyX4aai8igVL
	 3gLkPxnSkv/Y8uBtEj9Dw3StWuJ0rZPZ4/jn6i8zF0AXx5JVE1wCftfg4TWFN7XPWTn+x
	 EAowGN/e6JXoxFJBvXZhZ4LdRGKrFLD9jO2q91g3u11/EOSoHVdQJEmQrhKzuCLi9ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=K9IMoBDi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.12
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524A606A323;
	Wed, 21 Oct 2026 09:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B524A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=K9IMoBDi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLAvKKCcgXc5eYg7tLo3YQFLJr75gR/0k0Dp7Lr4Zjw47jsMU+/kKWh0l4cK9k2KcqZWW6TBz1h8cvKR7xrFgH69nb2bpl8OkIiQLW7oEAN7+gPLHcJpCCjZdMP+Igyf8tof3aAkHu9ApWsMqnva0O1pr0MMqX89CaHDC9vGI4y0H7y5ohKMjJB+3SM4wXKPJ1bBrIISBWk6jeo6GHmmeQK6+THeANnT3JF5929cfpsl9sJjsijKbHFKgpN50XoEjmyIZSyAIoWGEzklaeBUZEnTTQU5/RC1826BKUTq8af1DY+U6s17Nb84HhvNcKX7EO+IHNgCGMWuti7Ykb8BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mpl5lFq/5z/7P+5942HziISR7YV4Qmm+6R4/KaZiC2w=;
 b=g6k3b6G1VR8k5dU++knoTUw1kAsT5BmQ+AtI4oaFmu6MjNG97aUXHG4KT8ikPtz9Tsr2VCEQxqqB7xH5YdZvm667NOL0mQF7TOyqFrwX3fRycY6u4uQn3vGiFR/efzmkHm18246HrAv/yw9YiIruvDzLBR/SX0lQj5y5mcxstv9UFhP4+RVHPMgUD956nf4F3thm2AF6ft52miupG4ma0W/2EGBteOwvSbcNtsIl8R6j8nQk/5lfsxk4sJQdpl1XizV+mdkT5b0rQJuUE8sqMYF16pyy6SPkpUWtqMprFYZ0hBnvISKFCo0UohwWI0WI6igxne0iA0MgyaQWNksY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mpl5lFq/5z/7P+5942HziISR7YV4Qmm+6R4/KaZiC2w=;
 b=K9IMoBDiH10fycjBGC8IIKcsPSlB6x1ZIOfM1x44JeZ5B3OyMu/JbEHh/gw03jq3lteEVINCdJw2ntrnFlUDl6EjTh+gNMDx6k5XyQqiymUb9N6C9YNaCkTdSjN8Lig7w9D+0KjtZCpnurpHN9TDivJoFfUFljoHn9ozwpiD/Ng6rfqQgz5c2oefXql7Br9RJoeQlHTHxwbZpRkObjhwHRpsG36rahln1H9eO7zF5WhtCwzxGbsVGkkCC90uJu/avvFWi0T+7OqeAor8wDAY3bFiaMJVsp35SK31I3rxyyKdCKT7QDolebZRpUy7OjlUC4nHtaV1U3WZ2TUrZ3GZcA==
Received: from AS8PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:20b:313::35)
 by DU4PR10MB9166.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:569::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 09:04:22 +0000
Received: from AM1PEPF000C1ADB.eurprd02.prod.outlook.com
 (2603:10a6:20b:313:cafe::2) by AS8PR04CA0090.outlook.office365.com
 (2603:10a6:20b:313::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Wed,
 21 Oct 2026 09:04:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000C1ADB.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 09:04:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 21 Oct
 2026 11:04:52 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 21 Oct
 2026 11:04:20 +0200
Message-ID: <d379adcc-4500-475e-b048-b9a551d024a7@foss.st.com>
Date: Wed, 21 Oct 2026 11:04:20 +0200
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
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
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
 <0cc7330c-d563-41bd-b3d1-992f60ae32f2@foss.st.com>
Content-Language: en-GB
In-Reply-To: <0cc7330c-d563-41bd-b3d1-992f60ae32f2@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1ADB:EE_|DU4PR10MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df166bd-750c-48f5-99fe-08df2f524bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|56012099006|4143699003|11063799006|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cu3bYV6oODbCbBQfwvAVoP+sUlNPYjTwBPxyY8zQduyZS7Qd/HwGLkpCrbpcGr4cwYUtATzk6u8rNx1dJBl7yVwbRl4SYq4ZBLyvHTnnvt0/1ZT+WHjZ6HeeBEZ9KFe0TUjl/2yD5fpYqoUXpXDPLqQ7/p+GEHWKnv4wA7Kn2tUjlU89pwiLRoQeol9Oet/r65mi04F8gSdGwi2HNkbtCnZ8WEQ8eXhE61EuKRpVyKN/HTEQ7bk02+WCnjRW5iZmfhw4QTZAtER5kQ4i19LQaAnZ44c22gljv/U8VDJB/xDV8V/+X+XevihcETG6y9pYbjXE8xUJ10Tzk4bsOg/tyAUHAk2ogV7ZUyT67iwPSmqsJlBlFHN3i73ANNF8L6XnadgGgGnhu5rIxgeCobPLmkUXqyoIzOcS8kxmHbmiBMUNDrrbQHKrU77A8RNx6yWmhoD4GhZJxTU5/W/zdQSHMDzPlUjaWJ5pcNvDywGaplshl78USfInZ11cqqU1FHqhLHK9tgjYVunbizfGLupivo3GXU927HWbKs3GcNZ4VxOAnvvqweNybbwrTqyS33+TB+A6IWspGB5zdOt/1SwcQk/Xm6hvUpDJIquPVP5c6SRwmkwX0ynZzvyZSVKVOwjt/oBO/d68KQ9Lu4i5lyb6hbYnJwiUd4DVSwc12RR+NAF+9QEGzrITCcAQ+AMViBXq3/reg1qiUtbF7WDGvh0DAQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vi9t0oXM5Hfx0wTUwuCtXbMv/ZlqBqUYE82aORE7mDlbPXaLIfZm8FyYD5M8gf9BSR4w0JyQGXYtYoEJB6iXxBpJtXFjHDQlizDyH0CezCDldYdun2p+3b+Vsn2sIrbVUCwPyjBot6sS5MGSt3kSEAEvrxduqj5W5pvMVcW/EyBKTGjiDiuLAF4QQMuun3temF/71862MEBXmiC2k52LNR6sSYcoXE+XKNKnwkt1SQCi4qsaobN04heLp7nRULxCPpeLyjelpJqeKcsHTHwyNzVYta57MfBFDajLhkQ8SCYSamwMN43asB7wBsLaUcx6OLTfEJCBkJAX7ZEb4rF9GhGdi0oOG5lK+T+jF59n3j8qKf9q6dEOSJ9u+BFyk53wbMMxQmSsv5Q3PXU6kFy/DqE+AbxQOo/+zfU5JpFG98Y6UKYWUZR/e/FChXKun7uF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:04:21.7729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df166bd-750c-48f5-99fe-08df2f524bfc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADB.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9166



Le 21/10/2026 à 11:02, Benjamin Mugnier a écrit :
> Hi,
> 
> Le 20/10/2026 à 20:14, Sergey Lebedev a écrit :
>> Hi George,
>>
>> On 20/10/2026 19:10, George Neacsu wrote:
>>> Sergey, the write can stay or go as you prefer; the Snapdragon model
>>> does not need it dropped.
> 
> Glad you got it sorted, I was starting to wonder.
> 
>>
>> Thank you for going back to it, and no need to apologise.
>>
>> Then v2 keeps the write, as vd55g1 does: the driver does not expose the
>> status lines, and on IPU7 it makes no difference either way.
> 
> Could we keep it disabled instead ? I'm afraid some receiver could
> catch all data types and therefore messing up the frame. Better safe
> than sorry.
> 
> I should update vd55g1 too.

I misread your message. We're on the same page then.

> 
>>
>> Sergey
> 

-- 
Regards,
Benjamin

