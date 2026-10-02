Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11010005.outbound.protection.outlook.com [52.101.188.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BBE4766AC;
	Fri,  2 Oct 2026 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932471; cv=fail; b=bhZdo6je5s4vvM7F0y0aPxucP95La5Bq8maYqo0Z5wIpFRThYQsdZRfwr5RS1C6f9P6JSq2fvPu6J9nTQAwxfUFXrrfzM4N1uP732MGSw33ssucDX50Xv2Hh61et4ZHXRH9gLPn7DCFG67gNgGk2yfMOkp9aCPo0XXhDSenu7GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932471; c=relaxed/simple;
	bh=mnN3uB0DgNSf+/ODCcC3KHg8PUCl4QMzAs6wStALHuc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eOkvmmTIEAqO1TSrWSo63j9kuGKTyNRse2zlE1gcrcDP8pBeuveemOVvxmloADUS6aYs4d6wwYT0r4sHdhPvkTXbsM8AFuR46z9TKWmVAYyuDnJOB2Rd7g6Uv/MwOBKwSTNSuzL4XGXvNnoR1S4o8vsaXfRVe61a0dTI8ZfgH00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=ApwNhp44; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=ApwNhp44; arc=fail smtp.client-ip=52.101.188.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="ApwNhp44";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="ApwNhp44"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFfGIKrlecv/mYyHV4u1poCI1zo6xyx+eMskPxSSBcFpLPHNMxEAeYhAi5l7JgMILyIfrO/4RppZf176233m1JeC4q26j6TLXu5xWPntctpI4FpoPC9k1Fv9aWmAWJmYMmrriuGJmjj8i90o6/Vn7o6MwP3D7CTwawiPlkFps1wtSx6K2mNgX3SdnooNCuhUKq2hrZFCZU7aRXnLEQulFaj4Vpzn0dGmUtWLZbdQi+yAdrlHXZ8ry6jwVRd5CYBMoBbBLMl02zCkyynsjA3MRYY+nJMAu/DB9KJ7F+Nd5nQln44M3CV9hnav+k5fc97IW6COyds72TygwBrGITo58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6EINXhZOd6tX1FYIy0RxJUBR7nznwUqKdc8tAvkGjY=;
 b=LCvdhGaf0i/eOsIXtBfCKlR0Gmjxg9hqPMviCO36uS9Jckh7pJhVZZHU8ivF2iipn49oHshaCjzcOjr/p76ZURADzFpEX0oGslAue/+VlvvJKtDiDl+gABXRhnipMnPZJOPsy/FcrbUEknUAR3RSOFR4QDPuZhdpqMPZxE0Qcqhw0pF0uTDvPUYXRDOJGS3H0GPyebXrndKSeg0lT8kQvVja+A7iDXmsapGgsTYGqtg5YioZ4CMHef3NvJVdftL5rpqqRfDPlzuCc3HP9UzDWsPD1XNhzJz8OmZnvfrL9JTBavbi/fmIqiJnrT0I60WCgiUf1aMkzDy2aWELQyRz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=gmail.com smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6EINXhZOd6tX1FYIy0RxJUBR7nznwUqKdc8tAvkGjY=;
 b=ApwNhp44LD174V4zqZO79xPy7svscaNVkEQJF4iZOCrUrLVsXiziEMQ9SjJr9KH+OyMqJ5C/nxkqkU3YDeEbj1BfcX1jp97Aje7ix37M0eP+umCw/mk/BRDISGiojmaJuFKYJO54quiJJymkE8snz84pMIRvQURfPiGhI9frALo=
Received: from DUZP191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::24)
 by ZRAP278MB0032.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 09:14:22 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::29) by DUZP191CA0049.outlook.office365.com
 (2603:10a6:10:4fa::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 09:14:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.208.138.155) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Fri, 2 Oct 2026 09:14:21 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=ApwNhp44
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012048.outbound.protection.outlook.com [40.93.85.48])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id B1F037EB2C;
	Fri, 02 Oct 2026 11:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6EINXhZOd6tX1FYIy0RxJUBR7nznwUqKdc8tAvkGjY=;
 b=ApwNhp44LD174V4zqZO79xPy7svscaNVkEQJF4iZOCrUrLVsXiziEMQ9SjJr9KH+OyMqJ5C/nxkqkU3YDeEbj1BfcX1jp97Aje7ix37M0eP+umCw/mk/BRDISGiojmaJuFKYJO54quiJJymkE8snz84pMIRvQURfPiGhI9frALo=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by GVAP278MB2203.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 09:14:19 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 09:14:18 +0000
Message-ID: <49a4650c-6514-4296-831f-e12e57abe021@cern.ch>
Date: Fri, 2 Oct 2026 11:14:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kapenekakis@gmail.com, marcus@nazgul.ch,
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
 kirill@korins.ky
References: <20260930212421.4810-1-mstoretv@cern.ch>
 <20260930212421.4810-2-mstoretv@cern.ch>
 <20261002-cheerful-white-curassow-7457b3@quoll>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <20261002-cheerful-white-curassow-7457b3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::18) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|GVAP278MB2203:EE_|DU2PEPF00028D10:EE_|ZRAP278MB0032:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5ca613-d7fe-402c-76e9-08df20658bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|7416014|376014|786006|23010399003|366016|1800799024|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 w4Lp3NX8OPyNRLnXcJnqgNgtKL65OYxHIZreZp2GRWJRsjV4FLJjIV/kheC4VBFNKccUQIzQaVt2PGF2VaJz3wUjDV0cDvAEfyEjliwEvn9F2jigVdr3VNW2i511pAIt8DK4JFlBYWSDMI7ZTYxnxmSD92rHIwDsvGmRebXM5Lf/5cILnOyoze7KqA0A99B3cIAuvIOcEy8qzaia+KOBQYqAHf6LrSAgAfP3vS5Yb+7upWfNulOCcNoAbxU80zET11NYDqaofsi8TqFW3UyTlVLgHXdq8gg5hE5gjD9ZTCnlL0+opKpCD9lUrrLZya233J9HVZEh0HQTFExkQGzrBBmg2ecX2ZPsN95bcNr9xDjvq7mWw4n0hgTBe573qCDLGHrnirxclTxrNMEF7fwgifXchXrvDLm/BtVDwiejW+YucfcvtW3/zq4ICzyHrIqxJauPw+YHoGeimzJDd7Ig8J3gxjNoUv/q6MCQFWrYP5YdjXD6ZOSqL29g+XWAr1Cj3GzSlZFk9f8xOaXy6Xc0aZfCzPK8Pi5NwHxrVUN3qIRp1I4UmB532PLCA9dSFHKYrbTZwNjXirrbmEmth0lCCg4mIhtb7MZGzmQG4BxEat54gZrql7TAvmHlZqAe4Kodjc9TvQ6nYK1EqT3V/KzrMjGxniQL0fZWbbDArOOt8EI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(786006)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 KKVS8kOesHo7JBl5SpcZPukIsCGeWC7vkj2mH+T87bUchtvSNUOlXPjXjs71mY/YNFcqcsDhWRFhOi+/5DAReHRI2csKutPjgNBRj0H5RF8lGCgAob7uNLnfAFYOK+t8kJf3od6iZxOaiqwHcUI2FcSKCEBTpTZ472W8NsEs8lvOuCYqQbhHHwsJNaEeNp6wtIp67sVrlUomNag9tm9jPGIwrUf+q+m4PHCxiGogpFW5eQh0EEz2bPLoGC4wMynM/guon+3sBubzsA9zOYzPb/yKLiqDMU5b3Ki4aMdjkU1NgOf4iJX5ePIx8YxkeqKjHgbWuF5IwmrTWeptsZ4ZeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB2203
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81ba67bd-3c4b-4cdc-3443-08df206589ca
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|19092799006|36860700016|1800799024|35042699022|23010399003|376014|786006|82310400026|7416014|56012099006|22082099003|18002099003|4143699003|10067099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	xHjQhi2RUMBJhAjE7/uBot1EVVNGsE3r9KVofJxUrMN0p9R/RDWmp5Fm+XzNA0xjX700Tuv8j6hBjP+OPLssajqWypz07l5qcx9rq3thwcdwp6rV0YD7209xq9t8/tMZcbiZP/KpBbDaqf34t2XnEMHE+ETyiFOU/uafWGIRTiFL2qwrWfAu3an7yqOeL5d/YWHLqtT+SzR/PusiRpsmBqq17WUXHeKH0ILH31OLdcDCsci9DAwQnAslR+Z7XIwN7ix28GN83VGM2dfUu3XfzveWjtuY59uSVk3D73X4pe7Y2gvSBhaou2OmijWkuVwIxeKpjvV1QFIp0caj892WakgY3uH77/Hik1mWONKMVl1dgVgFIMJBgt377tsmSm9KBSbPw1bdsr8cMf0Nn+VD80aIJRJR23sT9uuP8LHSBWKLivgrrUzwlnvKZoqBKLBNYLvP+wmTgdeQZeeHscb3O7gxEvJeLe7AsqLaUqbSR9HO8sZzk4GopigC9OEbiudbRJfsgRbmRCulweMFJvdwo9TUzfoLsreuVnph8P5xqGbSMu1MBbSM6P+waBmCLdAj6fikZwtH96FmzwuF/aG/H1yXwnhlT46dZwFNGtGUYceDN5jh4M+3soolXOVrfHOe/OUnbH38I4lfCTDisQ+wg/Rjxk5SaCS9KrToajCA5Z0z/t/l1B6ZrO1Ggs9VugLwiqK/aRzMIgz5nPqzNQHWIg==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(19092799006)(36860700016)(1800799024)(35042699022)(23010399003)(376014)(786006)(82310400026)(7416014)(56012099006)(22082099003)(18002099003)(4143699003)(10067099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7P5WkDMJ4MRDgNAorhbg+JfvzCSF0HK/61EfydNBqtM/IdhfJxyI6kef82scp2BG6P/10OapshnqUIiKgMiK4HnftoVvNebmGZX0Lwie+v5QqzqNN5ekXwMvkCd4bKGlyQs8kFyqb9ny9sYgysg5ZPlfzWT5aQQJEIdJwB8uNlQ/BSwM1D2W+mXGbW2269qMfXvttZkoyV6hU1FETo211WMpEZrgN6JvglCT2Ao81YugJH0xPrg8NnVdE4VEQcBFyUUrPcQgOt+9kwJZbiB6jShbaIOR2Kv6qxcCQUFnAfpPH8xtm4fHgdJKkUuqvHnd6R59dMgJQ+x9+eVJCuwvdEwF39HtyHnanXD5LfYFV8HW6PZJzV9MYWUs+6SM/4iNqlpYh8R7R3ouvvmaJacIJ8X6r2N7WHWjv0C9+lJ0GPWkR3h+lJlXJrFGspOLYPB/
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 09:14:21.8729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5ca613-d7fe-402c-76e9-08df20658bdb
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0032


On 10/2/26 10:31, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 11:24:02PM +0200, Maxim Storetvedt wrote:
>> Add the Samsung Galaxy Book4 Edge compatibility bindings
>>
>> Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
> 
> Repeating the same and expecting different results is well, we know
> what, so I will instead just drop your patchset from DT.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Oversight from my end, sending all attention towards correcting the tags
for the devicetree.

Can have this corrected, however, can otherwise also stop here

Cheers,
-Max
