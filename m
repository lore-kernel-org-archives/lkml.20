Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11010003.outbound.protection.outlook.com [52.101.188.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C5395AF7;
	Mon, 28 Sep 2026 18:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620919; cv=fail; b=tNACV9MITr6Z9ZmGu20Nf7WgkYM9486YTDdotGGVj+AJnqmGv0pC6ZZFOlD0NL/aMOBGZjt7Fe8IWXv486+OBAaZWzpP53gTETxMeNmHbzx/uYSkI/Dxr3KVSCkXQVmKn/G5FzaOwo9FlzbBOV5WtaSYcbimrI+5ZI2kQaQPD4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620919; c=relaxed/simple;
	bh=zYhg2kTqIjOtqGEQj+Qrq23KGCTk3AblGIEylIHV374=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BzZ1R+x4JL6iBAjzjRy3jk2tY1zK08TraUtXww1fstWbVd/+m+0RcQYRAh8tgm+TZVsyGVnoTxNaJRnyHo2MkOKGrrt2+UjLI/pFQzbSVlcmj6KrfQTTRV/0hq1nB4ehFDwkHbXbnqePdOjFwIboMZihWqj4H1+HF6PFJDv+kaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=fwYJTH4D; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=fwYJTH4D; arc=fail smtp.client-ip=52.101.188.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="fwYJTH4D";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="fwYJTH4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXuIFYazN9Nm64cdhBFMHeNabf8ihx0QKVweUNwwsYQiLQlKNnFj6mgacvKplQAB1iQ9GRcX09POtZNB3ndmkZnMUylrYCNXiyhlVdKB96r0sQd89pBrmMQKFc+AmyHbRJEOpMwdpGhqd39lDb0kv3ixLuN3dBNBK3HKZiLqACk2oVcuwgNYNaamB/nHPfKAWIWreR1RFDs3I8ShxDNbWGOupYnZ0+Gbpm21ZYNvNQKER25DvNXDzpT4qedCBmvP6YkELV4sIntQzvpdamBT0YYHQf9uEFnDHSHlj81WpZejXbo6G48OqQwvx+ki5IgOhDJmNbbR+smD88lbU/+KBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUPcY/Q0DOKluJ61jeltm6KzKJdyR21guvHmBJgSarw=;
 b=sirfTUsthEhtNUeiu403GBmfvk1+wowf2nWao/ktwOdK7XrJ1AuMGKCoRWhUhbdkKZ9eJUmJUDuBT5jgjdSr1VQAMpjsTYTvii0DFTRLWxJKmgoDBAp+DjuVoVjAnt7GgfUYQOzXl02F8mKBjQa2Mlr82T1eM4OgC2Lq27ukjViO5pN4tEOHjq6rQN3ahwgLYCzp1X/XpEM4hZKmesLsjSRfmXxEtpd4klTSUUGiuAODbzsObLvIPhhpDOKGJnO4tN9lG89pRAmIyGSbOVk2LpMd/mKRLYVkKbrfPQb8Em2oR+cVSczkZ8w6f9CbIfDOCmfDt1ivq27Y+j5jvgJmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=gmail.com smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUPcY/Q0DOKluJ61jeltm6KzKJdyR21guvHmBJgSarw=;
 b=fwYJTH4DpesRJ9b/n33+WmSs4Jwd3EfTYxeLH+c/zDviwy2/5HidmG9S/7h9jBs7HR9b9LoK22xXLbuDIehkq8b2RNvj5WJpRKIL+5VoclAdAv819Aj+Cs4dlcuojnnMgyyVpxH9qiNXIw4mZAnPgFQ8QljuVQnFT6rmhPaKmBA=
Received: from DUZPR01CA0294.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::13) by ZR3P278MB1511.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:8e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 18:41:51 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::78) by DUZPR01CA0294.outlook.office365.com
 (2603:10a6:10:4b7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 18:41:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.208.138.155) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 18:41:50 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=fwYJTH4D
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012054.outbound.protection.outlook.com [40.93.85.54])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id EA3F77EBED;
	Mon, 28 Sep 2026 20:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUPcY/Q0DOKluJ61jeltm6KzKJdyR21guvHmBJgSarw=;
 b=fwYJTH4DpesRJ9b/n33+WmSs4Jwd3EfTYxeLH+c/zDviwy2/5HidmG9S/7h9jBs7HR9b9LoK22xXLbuDIehkq8b2RNvj5WJpRKIL+5VoclAdAv819Aj+Cs4dlcuojnnMgyyVpxH9qiNXIw4mZAnPgFQ8QljuVQnFT6rmhPaKmBA=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR5P278MB1763.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 18:41:46 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 18:41:46 +0000
Message-ID: <6f2e0c22-0be6-4daa-8ab3-28d92f41197b@cern.ch>
Date: Mon, 28 Sep 2026 20:41:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
To: Antheas Kapenekakis <kapenekakis@gmail.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
 abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
 kirill@korins.ky
References: <20260920184148.31541-1-mstoretv@cern.ch>
 <20260920184148.31541-4-mstoretv@cern.ch>
 <CAGwozwGzw1CE03kbWJaV7iC=1o0QXg9PpreTunenm-vHPe515A@mail.gmail.com>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <CAGwozwGzw1CE03kbWJaV7iC=1o0QXg9PpreTunenm-vHPe515A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0131.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::10) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR5P278MB1763:EE_|DB1PEPF000509E6:EE_|ZR3P278MB1511:EE_
X-MS-Office365-Filtering-Correlation-Id: bae061a2-8cda-45c0-d9ee-08df1d9028dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|786006|1800799024|19092799006|23010399003|10067099003|11063799006|56012099006|3023799007|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 2K4ZaD+TN0PoAzzH+xxNThiZkKkVUlJGgi1/ayxbLgEyLJ43fSVpPtiOPhqf+1pY/yGPYPnO21+pYaFm/KoCVusLIrj/ERv8hxjB24rL7x/vf6/z+hpovjZMvmv2FGZqMPAh89AwNsvEWKtdbiVgHvi6RpebTs5dIF13PW8FKVmZrX7w9ozzijZTad5jDqQSqY4Om9cVW6E2xgvdoEzcamGBltJ7I9vN+7MCpCBj6rsRbUnNGbpbpcJ9oei2vW4ToMnF/XLEb+BBKS1+FWWFZD8crnM+++2oplHLT1AgaEHYXp9IO9VlcXq640QNGJoGHikE3CnkoQSISa0dPoQI4Vw2Rw3VpU9nczFiuOegUoRRMbw1ruO1ozcUf84eTnJSXjdnmTXfR3a4X2sGuuzSzAtXaN/rqDivpr5M64WRv6yF0vddWc7OUgYn7TSxL/lvuiGZ+nXQavF2ceaB3JnSRhYYEXV8sF1m+BhXumkTa0KXD+ljk3qBHvDoi5B3MWi6sWmZo1tEawLvbKfeK3VEGMWDXsnixH7QGhprWCkC8ociaEYMiuCn9LDipOAeeJOxl9vSkNxX+uQkt+umOued/O6bA+Lc6nipzQeWbcxgKhdHIL2C09ed2kSQlJRPSPVw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(786006)(1800799024)(19092799006)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 zF08BHQHiafBkLIglp082DcYIcmRYlpJ7ZCqEchIOMZ9llQViS3/mnkP9MTqRFuYmz7u18QSJVGjbB93Macf7TDZOEG/bMlvdQxRNa1DCNofy2V6oIhPQCryLQLqHTPmt0BLM28+z7VwxjhftRCU6RBu7Ls4qMiUDjzNzaRjLMal4arVyYXqZQyorEhjNVPKARcyUzGbn/mVuoLlrRsPFASo+6wh0n3krsoa2RiO5ojkiTSawvSoVAvtPbobaxmWx8MY/t/BI5titYVy85oRT3X1f4t6gDvkaq5n5RHb4tPNdHe8Z0vM8E6pNTCDRg/5SSnLrfJtsBRxA+Xbm9O6NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB1763
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8691491-f7d7-4c80-4a13-08df1d90260e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|35042699022|23010399003|786006|82310400026|36860700016|14060799003|376014|1800799024|30052699003|19092799006|10067099003|11063799006|3023799007|18002099003|22082099003|56012099006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	fFYBKCSIHiwOv/0p6sP2Se1kGIBK3U3hL/0N15df+nb5e/gDiKubb+LEmVJ+kZ9sosjVfTfNjGHc9C8c51pPPL+qozR67jIX+B3GRJPs6krHkiI/Rr0nROWfnPbo1QkKmafpENDFv36/bX5jK/mhGphkvpCz580ldL+t6f1/R0ppLNw0gJwW+c28I96m3JGEMsFuRrOKvNnBLOOAcFKGKR40P7SEi4OmKigwv3o/5hru4tjHw6IKAc0LZvBG4V4y3zkqUzjLnV3HkDrM4XczZoH7DFWWsxsvgFlGqmvcB9+gvIjs7ZEte7KKgJFMyw+Nbfjh6luq041GdIy0Fqy+iMKmMSmXwiMxMoT4O7safbh/SxHatNbnORyUT+1qYCWoKPp6C69Tyj4UOf2Vwwhsf4k2dD24FbpSexVWmG0r9PLDqM9QRKruX7rI8vp9RfrAK1sOaFobpHQeQqo0bOEt8E62GZUh0zVlogJL0j5u4SZxFAkq/8Tx+oJBQbNfWhiaM29+7cdY4dlvPX8Qe4w8jKqrkUkVUiGNYFIzSE7JYatTCEGJLM3ha7aAKL8oCBUNTPAkFXIpOOo6g+c+AMPQhXsmLxrizk250J5lvp9PFjQ7j1pBb80GOXtVz5YaYPfoYel6L6F2W5yzhmWrWEIDwg==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(23010399003)(786006)(82310400026)(36860700016)(14060799003)(376014)(1800799024)(30052699003)(19092799006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RNws36UKg/UUzSk76XAHEfCG3X2VvbtyjXadAWF/KmCX6CA6GCthg95ugxmnwaIF21DnPPRncuH4ENcb3ZIDlrae1246ZZSRBCG39TvfxR7EtP7qJ5dUuJqdoTTL7zLZC937aHcjLO8qns0n24D+sZwkn1iSQBl1nWzOtaw5VLak5fy6J+4NiBFnlY6potWiK6jedZ5Fk/UlQEUfnoJihGsdLnYkA+jp4ZLdZcRS/bLkW/YcleHogci5O8R29o8i5v7hvY+svz/Fi9zfKqNh3pzyK0MvXepV8+0AvManBMwMeLHzMBDepFmAa/REHiG0DFvYnNZqy8ZENs2xnsgc1LGpCRydbXhiDQJo0kjN8/41j1pcruYgmuzS1SQL4OklvxZN5oq6cOvlJ3W3IZefhOoJe9bWDXz2JI2gYoqxBo831zUKBdnF8IM3Hm+dk3ZY
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:41:50.6691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae061a2-8cda-45c0-d9ee-08df1d9028dc
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1511


On 9/28/26 18:44, Antheas Kapenekakis wrote:
> On Sun, 20 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>>
>> Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung Galaxy Book4 Edge.
>>
>> These use a common dtsi derived from nodes that were able to work on Linux
>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>
>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>
>> combined with the patch series the Honor Magicbook Art 14, which shares device similarities:
>>
>> Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/
> 
> Links go in the bottom, Based-on-a-patch is not a thing, you may add a
> Coby as noted in a parallel thread.
> 
>> as well as a few more adjustments on top of that again to get additional features working.
>> Special thanks to Jesse Ahn for helping expand on what would eventually become this dtsi.
> 
> Hi Maxim,
> I tested this series on a kernel with various other backports on two
> european (norwegian market) galaxy book4 edges.
> 
> Specifically, the 14in NP940XMA and the 15.6in (not 16) NP750XQB.
> Specifically, the later is an X1Plus variant that came out a year
> later with cheaper components. It does not work properly on either on
> them. I was hoping that at least the 14in model would work as is but
> no.
> 
> My test devices have proprietary Samsung battery controllers
> (ENE-KB9058) and type C controllers (Samsung EmuEC). Also the speaker
> amplifiers are different. So the battery reporting, audio, and USB C
> ports do not work at all using your DTs. The TPM does not bind either
> but you do not claim that it does. At least they got me to boot and
> for that I am grateful.
> 
> Other stuff also does not work, but I am just listing the main ones.
> 
> I suggest you change the -14/-16 suffixes on both models with
> something more specific.
> 
> The prior patches in the series look fine to my eyes. I did not A/B
> test them, just pulled them in.
> 
> Best,
> Antheas
> 

Hi Antheas,

Thanks for giving it a test! I think we both have the (almost) same
device, and your experience on the 14" NP940XMA (NO) probably mirrors
that of my NP940XMA (IT).

USB-C should already work for this SKU with the patch DT, but not USB-C
hotplug (yet). For now, everything is just left as already set up by the
firmware, so peripherals plugged in after boot will not be detected.
Everything inserted before boot, and hotplug on USB hubs, should still
be fine. Could you give it a try on your device?

Battery state monitoring should also be with the same caveats on both
these devices, going via a separate protocol over I2C instead of
following the other X1Es. There is a separate battery driver for this,
and also other useful patches (like the webcam and kb backlight)
downstream. For now at least, only the features listed in the cover are
included here, but our repo linked there has pointers to the other
relevant patches needed for now.

On that topic, you will also find links to devicetrees for the X1P42100
Book4 Edge there (via Ciscobugger). This might not be the same X1P SKU,
but could also be worth a try.

Cheers,
-Max
