Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D859B35F180
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344865; cv=fail; b=MnlgGRGyU6/AUdlCmX3zrKF+syqrikh9X/R/8ie5yU7IHi8RTLmVJs791iYxhlPIsMNM6uSboJ78S7QMAsDpitayfL7w2dzu4+l/HxS0jqbsX5tTskdR82OATUwVZYj8bSSDSUkblI87kjkwF2ewStqWg00HLMf0uHdXOgnzOvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344865; c=relaxed/simple;
	bh=MDYxKbT4NVu6RbJZkoW8/5WjFWC3XwDXEuERiuOHRNg=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=l6NbM2avJpoTye7VY7pe5GFPAZhU8CVh7g4xqFe+TInL36/f+Z4Y4/p8phS3llVyfuIlhIPTYsykeZJJxRXTQkabFjn8ISHNMP2+zotmfvZZYMw11looHVdrCU/RyJRkNcHnHnOEbz+YkKSW27qDwQ9Fz1J2dnrOrX6Pn1fGT4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=Ygm6PowF; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=aP/iAaOq; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="Ygm6PowF";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="aP/iAaOq"
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5o3aL1678033;
	Fri, 25 Sep 2026 16:00:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	270620241; bh=hXvCnIf4yLnGuCiaJ121sOZbcQJ5VgrBaZeXwYor2gc=; b=Yg
	m6PowFNuTeXwMDS67gvMhjhp6JSmxrdOBB+JHA6RLT8EB1Gn7fxT+3eAke46NrYu
	nilxnyLmd+wYpaRWvWLZ6/ayOhlUUc60QPsH5l+QL6I4uQqbWgE0CxSajTgq7+u7
	XQJwWbp5Vlrg8VqjW3XGkguU6XiRcG41iT7cq63Ia5trpRdm58LaQvaaIFbaQAeh
	gh6WdgzNNC09VG9tDLyi054l4uVOt34/2ulWnT02n8Giw9ulUIH8nfvQcyB4E4rE
	Yho6t+XXoILCLi7rO8Yk14jYv4XLkQURcEr/QGuX7Cho8Vig0D1adhPrJDlnemfY
	BTmnbmVZGo0cF99eaU9Q==
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11021085.outbound.protection.outlook.com [52.101.65.85])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4gweje0n07-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 16:00:38 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFtF+en2OZwGWVhKdWpBdGBQMVq9v+TiDfLnNysNvvXWmJJDpue7PIjncjUpHO1P3v7eO+cUlrw1iF9panz/gebZeQMSdzirwud9yWe4Os4fRwVCwt33psiRt4uk8phJexBsshl2xqenXC08NL+ORoGCHYdn3CqkCXbw65VUEyNka41tN7lX2A93gbD5kbKymfgtd7YkLGy7EHEYnRUKmH5QM4aHstyb3CHeGtWsJ1/5/ULav0mG/g/ZwsHfjSb6LCMgHbXg0PmKq0BnzQ9yp7JRwa6j/OF+n/webLX8uVjny7X0vxwzePTLzKRayCRUByycy/LHr29qEHV5AhLUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXvCnIf4yLnGuCiaJ121sOZbcQJ5VgrBaZeXwYor2gc=;
 b=BPiTtWiB53Mas86QEtRSHN1xT/hMu45we19EpEeRr50YXWBmonj4Lpql7xJtiWcDlxPtuVY/ZqOX8dQW2F4AwWx8diBtcmbY9x6NyQJrKDP3hKk5PeUxT4xCHaDUeQ+6bdYGzoBZO26/68ZJsfSxR9ozFF1cPuEUkxSSEUyxLCkJUg0fUSq3ZUF6Iu0KEkHNnbTq0jM5qIZ8Bdq8xjaNWXrgfecqa5lAoGSjQLaoRgpnxXn1drZZpvIXx5NcIeyg7/KWYJjcYh+uJ4LhNvCNRjyMJ6focD7f1ab0ioYtV27jjPBxSqq02b8MULDm5yR5pu+v8blJauoxlCfeyt/M9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXvCnIf4yLnGuCiaJ121sOZbcQJ5VgrBaZeXwYor2gc=;
 b=aP/iAaOqskESXs2HZIEuAc7y1tPHYzYCj91/11TzMPhmSFoQMi2KA8iZEZ0kJGiZpI1Njpa2zFJjG9WNA+iN4S8bS00mSEI4UxXPo0JTM8X85fBbyQpFm1mVe7PvJg3LYwmFkvO+4mo8rMNiA04TiMMvFfmqXcUlQlsbC/IXQBw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by DB8P192MB0566.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:167::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:00:36 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:00:36 +0000
Date: Fri, 25 Sep 2026 16:00:32 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>, Jouni Malinen <j@w1.fi>
Cc: ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        hostap@lists.infradead.org
Subject: ath11k: Question about active scanning of DFS channels
Message-ID: <arZ-gEnmv0QyuGI0@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GV3PEPF0001DC3C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2f8) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|DB8P192MB0566:EE_
X-MS-Office365-Filtering-Correlation-Id: 0021a20c-3a06-4430-dfbc-08df1b0d5f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|5023799004|11063799006|56012099006|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WEE1IrptX4D9SGiU+pEoJO99MbTQfEyo/mJgPMe/UR7R6Qh9QZsFa1Gg3AHMW1F2tcyFSsVMeLZ2BjkxSpFqSGOf/vHY5nCgJmyiJ5S/2aYnL5pSnh4+XVhv0DkawomVFC6viVG3BpH+fsElj+3OxG5fO1Eq6lzgGEf/Ca+hf2Q0GJwhjv/B/77Vft4IHyysKhKObWDfTWQeeodwaOasemP9PqzsRNMy08vYpvwMJX/Gkhsmc+a4Dd/MbH/o8kY8jO3AZslrosJ4DyFbQX3sGt0RxQ5bQQBGb5C60vcDCpPdkqHpPzRN2Q9zyi11PvURpyRMeMrOT2AKKN9rlg17ICq77t3fWzHkvY29b6MTocVQNaNcpx1W+FHnHY+W2L3+D1d8CTZrgfjYp5j9/acZtVeGqzb8flZvIaMBQfZuCaVN8xmdZp+FsAyXNgtxw8loNHZjxA6zu5JYHmQNVby3bdB0lpegjX5VqTCL7nzpTcDc2iaq9CGoxlrSKLoELmCAwiax11wVQj9kbNmzWBMTC2G2j83+25Y2O5n4q7f3JjhTM0fWDm8Hc3AKAiUCv4euvSnDOteYd4aiczIL2h2p9xoR8XoMCosZaH0yqQLD66nRfQATOD0uFIUab20++A7qpVix+BBkWc9HeqXzVAyMGR4FcsmpLmbE+BzXYbSoKmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6zd/w8EKxmRiZTM1tEDBYaLWY0WWufTWUlb+zSoo4Tw5GeuWvkMZfnLaGZQR?=
 =?us-ascii?Q?ZrNFEqEGzh9/V3TR8nTSessrvuSCyh6yh2+U7dw95NV2NZqLmX6vG1Oa478S?=
 =?us-ascii?Q?Ja8/R/3zir305ysbORWnkO/+cak6JTiCMLdefiIW7/WZ9PzBcPasR5UX1BKF?=
 =?us-ascii?Q?esGC4PI62uFP3JUqwFu+bR6Zd0oKxODCQFgAnHuCE3KccuoXal17jKqHZOZM?=
 =?us-ascii?Q?um0p9pTrO0j0kaFJzmi6J17QNSDl3iY0wCsQB3QX6tIHoC5PXqJla5kI41vW?=
 =?us-ascii?Q?cBXAP6AtQusm5pS0CyR9qbU++UDHH0bz6J2vFBv4uyiNp9rXI+1pvrr8cgRB?=
 =?us-ascii?Q?Iuu7SUI4fSQZ/ZpwT8q2tBNbDI00lYgyaJ+x5rccXEXVeavKRQWqmM/QJt83?=
 =?us-ascii?Q?0TjmLPK0WmM2AV3edEqKK7OmwrTTHI7x7xQU+xp15WY4Lkb6EADqQwGQXGL8?=
 =?us-ascii?Q?coI5KDFYcnw1KVjdTti2/clt3iRLXAlJNptTYmKpw4Dl38lB6oMIo33W2FsY?=
 =?us-ascii?Q?N7fXR/kJf4NdtPwxsm0IQc4ssQOUab7fWyEamvolI/cLDBmrbCQhhgIzKRq5?=
 =?us-ascii?Q?DvUqCepLtRE1F43NmPVrJrGS8d8jaqb9BLa1ivoKkwZAFyPkYDBUqvusj33t?=
 =?us-ascii?Q?XZK6zCpYWXbsxeqUjzpraql9bii7c6zeKAPlq6DKBN1myRZTukzX5KOIZAqN?=
 =?us-ascii?Q?cE+60x6FR4gYavKnkPRzYzibLqik+REblbVvPASnxmomWYeGdGvqDiG3B/a1?=
 =?us-ascii?Q?FAAkl0vNlxgnnn95zbdsJeeiutV9Z9XHHHLv2AAC+7UxnqyDQbbVIp2F/S48?=
 =?us-ascii?Q?UbPTurq/xZDK+EFmEqRJV8zuMWaUvvYV+VdyCuYqXbmrYsEQ7K8gn/rsvWT3?=
 =?us-ascii?Q?3O7fQ1sx61ke/sWyCcZ5w7jk4K9wSaTJlhyJAK5IN5lLf68AN7nZ6SWhVi1d?=
 =?us-ascii?Q?T6f+IVqUip6LZ1Y2TE0UvVn2RKXwP9ltD51rPSKidVSC0WFCQjpran2VLnRP?=
 =?us-ascii?Q?z2JhevQViM0Tptt+5MH3RhpjF64caluiog2AxNj/0sDx3rgnZD1W01/GVRZ0?=
 =?us-ascii?Q?IWWM3ubfkBhrZmbWljoePEa5Fp+toRXMtftnBHiNTVsa665pmfY3bDlC5gIB?=
 =?us-ascii?Q?kDDnoYwfCfEipRDb50EYJ7bAv29doSGAjc7q/8xtJedPlCaOGJyTzwovSC6f?=
 =?us-ascii?Q?eF1/8llH1rT5qD+hROribAbtEFyEwAfXuugsvkotSSIGhcmqS0Wpv9Uz/u/Q?=
 =?us-ascii?Q?UQV0qB3iUBjrNDpjmJc/sMj2ZxkMKVjtwDjqbXxQG+P4iVBgug58jRnY7Nj1?=
 =?us-ascii?Q?c4F2WZFTf8k95h+RrH5HO+NVJ30NBUP+Kl9yl+9Zno2np5ThL0pxLlX8quig?=
 =?us-ascii?Q?iCEOUOLdE9bO6mD5B66axWiGv99UhbwK1ox1x1I3yaYmh3c2ZZbDIyBHdP7a?=
 =?us-ascii?Q?OhpAzF493oX2H7BSCEM3QaPxRbCDmRSkFdfI+94X74GYS+00bgcJG0znjDr9?=
 =?us-ascii?Q?lZlVOf2vRmNqd93aqE2jixOkbisxObo4JJAbABYsH9+ZYUDWXrVywi6J8i2P?=
 =?us-ascii?Q?1Jv5SVSOobLp0wA6ay1z8cPd3tev3KKU/HcENXFpZgMOg8zG97k3ZD3UnT3Q?=
 =?us-ascii?Q?oWD8vfROJk3/GpAiqmLFKIFyRc4zmN2uOt3Qxh64/VPPxe4bJV8+T75E8c3u?=
 =?us-ascii?Q?2pkzWZXLdpHbaAcToKn97p42aVXra91iMlSXBbP4mdvkETOxqwJEGwozuJqM?=
 =?us-ascii?Q?g3OlN8FeMQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	BFFoX4TS3ipmnkOugOi40LBYY9CRlqRHc67JwMoJuoTouhIg6kynkvKOaaXF9+zJcn0D+SCAOwGIPYiA810/NnGaZmyQheTap8b0qtY2Tq8yjGSY1uhFfxzIK0aRuEXd/q+dTAI7MIZgmMzVbrAbfHZXp0TyOHb6GKCD8L7usRq9eixZ8DGe6lc79+lQmWrTUE2p1WFRL7qkqIOy9w18d3lBElrARvL4cqGHrdiUmJ6SjMXeY7SPDxg8HCKYq0dtjhNil/Skey8Z5SEwTU14gAuqPr5vGDw2os5n2jazBhAmkZ3JTTPy4JDF1q9L6QGLyzJR7hLsBoruCpo3J8BpDw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ImDau3L6uBXpZydkT8EC36wOwi0grFsexr+WlvVrRO9ZoeJpXku3bDY5IGVVdE9F34zySsIwzv+BL9KdvnDSnRESUkz7Pzu3UiSvQeYxtGABRU59QGk2+Gj2ket/DEKw5onQEG9wNLrmjj5hs2A/k0jNAenJrNYkPTaNwhzRaD3CMQjR1cM8/O49v0mHHhJpiwElNSrP2IcJdRPlMKm43Kt6s3vgty/xd24d25T0WVCrD9tsGZ24crNg36/KUwyzM8GKfZW/D2p9WMALg7ry2wcjdDth4onZ3hS/kzmdap8RMxOpkDceZx2s8Ozdh2mdRbivfb9t4hbn3e5XHx0MAmj8NOpYtq6/0jDGmc/6Xs3zEb/wzDOAB42jzsSRupqT0MQ/2+xjG4HG89+5m+CopBExFNg59epeR0/nJG4GyAPFRrEBt3lTRSRAn/TV8tXzL514oQHpDh0utbPNH9tWRZvKDlak/+lyXrHI92UvGGw7mjJ+wCsKZpd1/PnVM6TU5Ni0DDCrR0M8D0rB4QZ/moi+Os4YsGSEfOBAsAvUUbS80FlkrVIxhvWyeoWIoPm/5E+eXwEm76JBiL5Dgs5IBBK0LSiEC3mAlD7va+sZXEur0dbJSTRI4UOROvh+aNym
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0021a20c-3a06-4430-dfbc-08df1b0d5f6d
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:00:36.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdkfiQ9+1TnNZuE0G1amQc5q0MWsxcBkzudvjLq3IM/jp6PEHXPldqiZsDibGBuQhFUkZ/RT4nqhTrV0a7i5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P192MB0566
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: DB8P192MB0566.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: rIsfkcGvjnqBGqBK8f-dJNS-jJ2uObG4
X-Proofpoint-GUID: rIsfkcGvjnqBGqBK8f-dJNS-jJ2uObG4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NSBTYWx0ZWRfX+YkYnZio+cGq
 Y73biAeDVM+POHSvBIVEqmHASyCkEAK2Tg0kaNXMiCp9+g+X42IYq2eFvpiU4lQGEL9YHQ3Blvv
 EJL+Qy8M2oWDeWJjEhFfe1+7nnJuYmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NSBTYWx0ZWRfX5oB9YUnhNpki
 aFhzmqr62RDJ5M06bs6ePG9xoUyafbDp/RpFbHF6uSdpfXktsfPs7DXvuje4RJ76qTCTCdbV60P
 la4SksAe1ZVnOeVZGfUCFRB5L5hPPQFKOt/LyEZRZfWrbVqP/whTibdzORCQZqMfYwb+ivF/eaw
 ldYhlKO19Yu9Ec+fZJ8UCw11vulegDj3Qng4dYLB8mmOY/MwGN+dXCyMh84mV9p03PxLXJmzLea
 J2ZJfTNu1qw/4wAaKyPVRNle7/XLwRYJoyvPY0BukNe32qXUg4AxmjIuYQ7lbgBtOJT7KKRIK0W
 tvtiKqT9td7Es2nAdmz5PPwWEI31VA3ecuAzsiv/WhfGOGV8Thj7qPZ3xDPLXwnbKNYKqZkUuwt
 Wjj4sZACYzIH0CLxaJ8HDjYuiyTrVrU+r3ZU0HDdBcknxmARjMOzAf5Pe7vGzJCorwgq5KDiaXb
 7q/A/twlSlbWiPZlSUw==
X-Authority-Analysis: v=2.4 cv=DMYacCNb c=1 sm=1 tr=0 ts=6ab67e86 cx=c_pps
 a=dceCaKy/xC/3bTNpRNSjDw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=ZoHfLQ28jryDjCGo3uoA:9 a=CjuIK1q_8ugA:10

Hello Developers,

I would like to investigate the following issue and would greatly appreciate
your support and feedback. I am using a QCN9074 chipset with the `ath11k` driver
and would like to use the background scan functionality in `wpa_supplicant`.
During my testing, I noticed that hidden access points operating on DFS channels
are not discovered. Even when I manually trigger a scan, I can only see the
hidden AP to which the client is currently connected. Other hidden APs remain
absent from the scan results.

Based on my research, DFS channels cannot be scanned passively, so I used a
sniffer to verify that the "directed" probe requests with given SSID were
actually being transmitted. I also confirmed that the hidden AP responded with a
probe response. However, despite receiving the probe response, the AP never
appears in the `scan_results` list reported by `wpa_supplicant`.

To further investigate, I modified the `ath11k` driver in the scan request
handling path `ath11k_wmi_start_scan_init()` as follows:

    -   arg->repeat_probe_time = 0;
    +   arg->repeat_probe_time = 50;
    +   arg->n_probes = 2;

After applying this changes, I was able to verify that two directed probe
requests were transmitted with a spacing of 50 ms between them. My main question
is how this use case is intended to work. At first glance, this does not appear
to be a driver bug. However, with the default configuration (repeat_probe_time =
0), the scan results do not seem to be updated as expected. Is this modification
to the `ath11k` driver considered valid, or is there a preferred way to handle
this scenario? Are there any `wpa_supplicant` parameters that should be adjusted
instead?

I would like to fully understand the intended behavior and the interaction
between `ath11k`, firmware, and `wpa_supplicant` in this case. Any insights,
recommendations, or background information would be greatly appreciated. Thank
you for your time and support.


Best regards
Alexander Wilhelm
