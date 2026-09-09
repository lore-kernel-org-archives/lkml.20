Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D81379C46
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979861; cv=fail; b=hS4q96pEwHOK+LjNorfrvS+MbmzQM34/HremzXoVk9EsCvS3jUTVxPB4cJnTZ7MlSqhQMThs84plNOPfZr5cb5BWsNSbAwm1WJ3Vc7SbSx9aLB6hZXKI4WRSeYQq0BpfkvndmYuJZ+5/459g478CXBMQYEelPGC2rzucENXFxis=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979861; c=relaxed/simple;
	bh=XmzxzNx5wOxfJq6+csvcn1FFZtQZz1gsggNNIkViwio=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a63Q4TK6D84Uk58Z2TuHQRvZuElm8FmXZMpFLbbu02VJXfF+GH37x2IiP2bJ/shSmNcU543W8oTUZOxhaaUOXeoxufyz2vba/YPfpFNsMTRxRjbv/qVxsmGGDQcLRXI7dreLZQzGy5j+JIDBvjrK4tzwkMvhue/Axtl18cqxMgw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gn4Quv4A; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gn4Quv4A; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gn4Quv4A";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gn4Quv4A"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qo97HbkJ1kWQPR/nEWJJ0cYh1pA+igeWTfTtaRBYPEy5kq/f7JW6iEDCt9RZu1o/quD1azEZSpZ+T/n+zknHjuPWRjG6+cbv21B20vt0TQfZBGVoRO4u/pnPCLzLa1D4jqfLLUIg5VQ0HPhiaw3zbCPMvgACoBltBYySfXMQbj6HR1JoNhCoEtKpOrVt7oiJXPUjE/Kg3CBZP5WbosST6g1ZqOI+u0KnxGnk2ut9QttKYLLsPRnAEYTrOA78b84/jCzCq7oxerPkyYTJ9QIoh2zKCEi2HmthtPfpybqa7vuoF8KYP2PTIKVey7M31sCafat0sK+r8789gmjXqxUhrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmzxzNx5wOxfJq6+csvcn1FFZtQZz1gsggNNIkViwio=;
 b=TnKd16BobPIGbRPnX/kJGBCqLkvYJ18w1AbwOuWaxbWHiuCqha0ll7YG3Pfemnzcx4J5vKiuhcqUgWpFms4C7a4eiQyFFcGawiTgLOaR7T0QM6tVqpfJh5cMyb4PwbsCuAKmyUvibPhhfh5o+hQndfV5tAyVv6CB9+bygr0JeGSXHmY33tG+xpB+a6EdO0WkXlOQjXn+WYp3uZhYVfu2V/jzsCWxU3aZsAmej1EIxSHusowIRNSYwMMrI2Ga07FnIVWTDF6cxfDBnJV8IvzQb0oE7vyrdeVA9KbmOxmT77BcgdVe7FwhDIMNOvN0H8A2EHb8P9KIP6+zf3mn3GOUDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmzxzNx5wOxfJq6+csvcn1FFZtQZz1gsggNNIkViwio=;
 b=gn4Quv4AmR69o8cRTWoZTLolDthuaENNYIlC9SDqF9ZtB52bp7Xcbage4rM755e5ZD6SHaNt5dtdoe/O7yItfMq9KS6Gn31kPPa2MseMqiyBdE59VM/eM22GoL9mtHg4NB9ZJWSXuxJySd8OdBNR5M1CiRaON9PlA92ChKfA8yo=
Received: from DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) by PA4PR08MB6144.eurprd08.prod.outlook.com
 (2603:10a6:102:e3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 18:50:53 +0000
Received: from MA3PEPF00000404.eurprd04.prod.outlook.com
 (2603:10a6:10:468:cafe::8b) by DUZPR01CA0040.outlook.office365.com
 (2603:10a6:10:468::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 18:50:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MA3PEPF00000404.mail.protection.outlook.com (10.167.241.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Wed, 9 Sep 2026 18:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJHMZ9ksNL9FjwR+7m/1Ia6osWFkfhv2HiuHm8FmLPnbH0jZYa6tznnc9oghh3RFsOXN0F/o24gzzbiYU4y/l7EpIGcS1jw+QODHc4IG/ct2GXeKCW+JimgR6ngh9dO/NwATqgrc/3jzVYa0kRPLTbWVpaNdmhzSPSAyqy6XYEa/tt9RlkAsqe+63YFbHZusb+3JUFRrH/hFRNDPDMI/QJ6dklhRenMmYT82JB4XvMMsQWusQR73n16ANL7eq/Fy8QsnwPcnk8rrFQjXq9V764ENyM4TzllxeI+f743dFspziQ7me5DNolYEiASqfdcjO5xlSGwj8/1QUW3xCtyW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmzxzNx5wOxfJq6+csvcn1FFZtQZz1gsggNNIkViwio=;
 b=jqY6a1+zztovzuGvcMq6c3tfpWgFuPPMyCHhMf5g1fPCVVlo5PpAoO9WhQ1Mpf/gsSoiqs+OrWdNr660ZdlFLGutzfn3IIUMI0GWokeDyej0o15fDiz9RrUqkBjPvUE0eILttSP60t6XZLt/Ni4rrpTf4qbro8X2hR0JKhc5Am+eII7+EVPjb2b5ESBGngrVohVUGE97sCK0AuATvHLXDncZz+n6pfMP21v4DtcqxplIXSEdwuYOhwonKGTg45gRmHZZRJpJUZ/QkJP3cit1ukb//xk+JObrb2p5G9G9bgpM6G3xNeZN0uQ9dHqRWhsD6ldgpnDmvpThma0M/vgMig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmzxzNx5wOxfJq6+csvcn1FFZtQZz1gsggNNIkViwio=;
 b=gn4Quv4AmR69o8cRTWoZTLolDthuaENNYIlC9SDqF9ZtB52bp7Xcbage4rM755e5ZD6SHaNt5dtdoe/O7yItfMq9KS6Gn31kPPa2MseMqiyBdE59VM/eM22GoL9mtHg4NB9ZJWSXuxJySd8OdBNR5M1CiRaON9PlA92ChKfA8yo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by GV1PR08MB8401.eurprd08.prod.outlook.com (2603:10a6:150:a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 18:50:18 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%6]) with mapi id 15.21.0428.004; Wed, 9 Sep 2026
 18:50:18 +0000
Message-ID: <e2e725f0-3271-4977-a3e6-1aa27e0beea6@arm.com>
Date: Wed, 9 Sep 2026 13:50:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/shstk: shadow stack enabling write return code
 change
To: Dave Hansen <dave.hansen@intel.com>, rick.p.edgecombe@intel.com,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
References: <20260707184542.1721085-1-bill.roberts@arm.com>
 <f9223651-a51d-471d-805d-e9a2ee9c6b51@intel.com>
 <0d639fcc-4bb1-46a5-825d-beb803b8f3e7@arm.com>
 <77ad85d7-2d1a-41ad-aa44-aad26f7af5a3@intel.com>
 <23183893-2106-4e5e-8bb7-2754dbe5864a@arm.com>
 <5eb8f7d9-a996-4bd7-b355-3c5e77d03070@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <5eb8f7d9-a996-4bd7-b355-3c5e77d03070@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS1P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::7)
 To PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|GV1PR08MB8401:EE_|MA3PEPF00000404:EE_|PA4PR08MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d11356-0460-44b4-0a07-08df0ea3459c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 QepIXbyiS0UqjeTXtVLv4p/zDWrgNlHywu0UwhhK0+6CtXcbvkpVL1A9YAlsTCCNQzvLv7FncjXdCnI7f+9RK3ewTOxBSBGt2d0X8wXWOpCKiSLvP6b/YY+9/LXVLmiP+TFCDK36RSrSaRbR8Qf+jrHzv6cBXtXN79RBHMQ1YeEwP1zxgqx3pVjXsaE7lrvp6ww0ME7AcPi69yD3YZ01W3dTKUk90oz+EEbHVyuTbr5OKj0U+bcZy7/5pJSEv+9dceERhojFFZd6Bd1HXXM1xyWHAf9R/FDUnM/zfW4opaXcXVCNTH/ODdNrQ0OqPSETzvEq46NW9z2LjnmJRIoRscrjCoY1CBFrfXe1gQGVWjECWPdE5z1ecWyz+tgsZwVHkZteiaRR23c4Yi2RF1brNkZXdVlQHmqRYjgnyNVEHwqBSrsB2BVRqzmHWwl5Mv4TJctPrDpwzyGYoBCqctiqz/ZiW51COLPBYIYQzqF/zvdWgNmiKRneC+IO6PhApIp8JYhLAijjRf35SUA2ZIrwhVv8ra3IbwpVc7ctH09wCMVSodXW41SlILviOsAG/AeMDU07gdawCXHqWmfNIuzLhlwQ7u1OxFz3xsIjDW5Kn5sgXX9Ag+/zO/QaO2+e5YNYSWTtUtUMI6vpr5+8OGYpKLts/suPjD+5hZD3N7OZdmo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 rVPvBUjO7O8f4QjkrH7urI8p60h2WZVKFjhh3qLE+f4lzWAk8gJeTiYBTXbF4BUBswYFwLjZCls8nZepYuqHZeXz0I6bjoM9H6B4icchFGcX3VlWP08thkLOwbbjVlMGAnPOm1K/f241U5wCs81AC+fGSOgnA3ZOzzNrwpBV86C696yPjknvZBpnEmf5o90bDNLLwdgY9Qi33H2tBbrt/27rQcX7KoLSFeUZn2sKuSHDfr3tnQjzSdryizeuwzzLuFECjRw26yeND/0qUBfPv84kzOZuXRORJvXWL43evSnWaxkZoqFPkd6w/1psF+GZzragnpBtzsZeb1jjECvlwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8401
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MA3PEPF00000404.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7fdc8b99-f3c9-4341-8947-08df0ea331c2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700016|376014|23010399003|14060799003|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	I1f960tP5X/IpuxBT8sntga/Q7eBwAc9NSKhaf5Ie/sri5TKsyBj0WY0mDN6c46tqack49NPvzAT4xvgfQbrThPEPCqqIN01KUsI+9Q1Ksv1mzH4+E5daothNu2XfnzUJDL26OEhRKFoX+7MT8zFalmibIG5KHHQQS5UMlpWpNo1e6H9pTgZUxKoTy4JxjA041dZjDGH4ULqSsplA1crlP+U4/lU8BJ2N7bHqwbq1hoGubgoI6o+7oyuWEY+Ih6oMM19vU1f77TkQiSTZXdsaP0rfEQe0Fvmk7oWijonygtVSmfwx4UXyDMKHMejqKGJAj/JEomGQdcWr4bZWJqmAKVMvIwdaGg6iEeLxvEB7lHTLGe0AwBulxTdM/dVvolRpFDa9nLzkcJsg6NUPFG77+5gCBOkJYkpFabmipVvJ+TCoZb5joC5Dii/Jx3TwW+GkMSoHoAVHgGd3BVGl1Ns13cYyFtHe7FE8/JdlhmkI98rSfHBDc083qXDM/VQlPQPDP8HlcKGettygUCd5uLZTvC7R1nI8fTVtPgkc/TPYNX+JDrK5hAdCOi7oj+YY0W9cd782E6bBpgXYKVC/FUI6sorgW36VdB13vb5lS47fSwvIcP5/JGHIxBO9+NcdzNNGIEOM0QUrw6lyUgWX+AvLBrvddkcD0cLmrJoBPi/jc7SVSAgMLQ3wOSu0uPLEsL0HK68u3ds9KkILmBeKF3ztg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700016)(376014)(23010399003)(14060799003)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qNm7q+FwlKFCOLO56bCHatlXTK+x8TUuRAvHbJh40jImVy88l9QE0g8U9TFsxQ/lOuxWi9UQTFVgjdnfkczjFu+2x14DMQdbIcm7dN4c72M+kxIssmMAEBn0h2VUaL0CX/JEDLlu8zCESd8F/7ESe5bkFuvTCx6WjO1Z247TVn5Ft7KNKbQy9F06ljaWsPjpi1j7v6nz5AFGNy8Q7aKJ18dGTlp1oitahXkbMZtF3/sLbCZP5NBncIuSIh27kxWe6gx+7Fb4ovk3JIoD3ZuNQkQevjv5cG3iHx8ERB22Ehz075sz1nqhd3DXmFcZZVbXwqBdKi8ePPhB9tXvBxM0hGqW6RoRGe3c2CoPGp01XK2ypo5CTvWgxUFs8n6JbhKHiaIBEguN5caEhS+uT8FSqkT9b+P0mhKm16vlND1NKqPDtc4SS9w5+I9NvOgQWwfh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 18:50:51.8545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d11356-0460-44b4-0a07-08df0ea3459c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000404.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6144


On 7/14/26 3:27 PM, Dave Hansen wrote:
> On 7/14/26 13:22, Bill Roberts wrote:
>> On 7/8/26 4:00 PM, Dave Hansen wrote:
>>> On 7/8/26 13:56, Bill Roberts wrote:
>>>> Now for this patch. I noticed this issue when I was doing
>>>> negative testing from userspace via prctl and the return value
>>>> didn't match what was in the pcrtl man page.
>>> Ahh, that's the bit of background I was looking for. Thanks for
>>> that, and thanks for the patch!
>> Hey Dave, just to clarify, is there anything else here I need to do
>> for an ack, or can I consider this staged? I also sent out the prctl
>> changes this am, so you can see more of the context.
> It's in my list of things to queue. I'll probably push it out in a day
> or two.
I didn't see this queued, did I miss something? Thanks folks.
