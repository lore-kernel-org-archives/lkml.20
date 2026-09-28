Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11010066.outbound.protection.outlook.com [52.101.186.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D124F85CC;
	Mon, 28 Sep 2026 22:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634165; cv=fail; b=jzwtI0wJZNh5PjZ2uWsPR+TZ9fllII+1DwX4zd5M1TfR8w8VGgbAPq2+N34LyDmOQXsFZ2XHfPkibXIcFvhXdJg9oCiXpxF0VUuHnJjjh0lLsB5uCFuLK1m67IMrafO2RDMtC8vC7WlL7nugqOJeaW7GzTF6vQft46x3qTLEic0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634165; c=relaxed/simple;
	bh=CWtqEnXDnpfXCIa4ShvFARTuCUQ1UwkPq5HeWOQ2jbA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pKu+L3McIiy88JNvfkkT09/JHOnjdJQ1lb3nlFartsVDPOc9vQIIJZ3+w1kkpQNHJiaAgdN7QdhVdc1BBGyVxEcJAq0wZsiZyX9twyZz5gAueKtkasaOnPf/+9hSA3/bfrlaBydnFWzAGVDTqInBg2nmE5Bm5mBmUZRtpFXrdNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=fOfAwhWK; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=fOfAwhWK; arc=fail smtp.client-ip=52.101.186.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="fOfAwhWK";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="fOfAwhWK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEzwxC0s1tanm0I/bGEegpYVLhrzQCyqqrVS5/MrNod6aF5NsnvAmrGy5ILHdQKl+n51B5xnOsdeJTinIQcSePDTtQwqvuDAygub5O9jwEhWNH86YN7dBLBJlS2jY2aU6B1tE31v5WAWrNfs0dy9mFral+EjmxWNuOzakDUyBL16WnFsK8GyI7VCypppKkZnwNtykv2dnvfoMg2QWeu+2MjXgLFaB6vn8ukDnRyzAhhiXucS/QIOBX+51hl363fOrZYXK3py3qgRndiYxwGFWf7t/EbDXTCXBsr0fZN3aEVe2UngZJWTEOKaG9hekUluZxDprhW8ntDa4nrekcZhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4QIND0yYiDqzd4mDpY1GNCpLlfordQMlekB3Il0mso=;
 b=ou07z6GnAMBYoo/d2pxtGd1WAfA5CiWcyjbJTZxs0Ujn0l4uQXzis+xzx6RwG07cgyq7z4woVImn4z0e49iiQM4O5wE6dEfQG9YGigIKrRgAaVtFkgcvQVRsuM9gnSk+MyDaJgQ45XaWG/ZPen7tctrJE4Q64CmLpxEn4GqAQPr3nOIEWWgC0Gb2PM+aotxcX/I+1wvYmclekrGoAt/AeewahoSGA+v0ABOpUBQPW7v+Qgy8IP/kNf9W8eiZEzEUxKeuUbHYwKRb0qTGMTyjYJVGINbXpx1MT5WJ3N1WMg0ksrBB3fKOXBKLvGHDnc9JgNzRL/icNl1M7LC7nKIH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.107.2.244) smtp.rcpttodomain=antheas.dev smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4QIND0yYiDqzd4mDpY1GNCpLlfordQMlekB3Il0mso=;
 b=fOfAwhWKr/LxB1x7dwr+NlydPZNkWS3Cny6CmC045D8VNZVWRuPappvRyrba+EZ4OM8kWaLO3ATNDBFJUYZcHLEf/iuCfJz3xiEuyRk/2Qd2ar3/KICwFi176I5ro0eCmttIDI2s9L+/7JEhFrQVpwVTZ5SAILUwvOrOvaWA0sY=
Received: from AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::36)
 by ZR0P278MB1741.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Mon, 28 Sep
 2026 22:22:36 +0000
Received: from CPH1EPF0000052F.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::3a) by AM0PR10CA0056.outlook.office365.com
 (2603:10a6:20b:150::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:22:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 51.107.2.244) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.107.2.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.107.2.244; helo=mx2.crn.activeguard.cloud; pr=C
Received: from mx2.crn.activeguard.cloud (51.107.2.244) by
 CPH1EPF0000052F.mail.protection.outlook.com (10.167.241.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 22:22:35 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=fOfAwhWK
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011031.outbound.protection.outlook.com [40.93.85.31])
	by mx2.crn.activeguard.cloud (Postfix) with ESMTPS id 33B7A7F3E7;
	Tue, 29 Sep 2026 00:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4QIND0yYiDqzd4mDpY1GNCpLlfordQMlekB3Il0mso=;
 b=fOfAwhWKr/LxB1x7dwr+NlydPZNkWS3Cny6CmC045D8VNZVWRuPappvRyrba+EZ4OM8kWaLO3ATNDBFJUYZcHLEf/iuCfJz3xiEuyRk/2Qd2ar3/KICwFi176I5ro0eCmttIDI2s9L+/7JEhFrQVpwVTZ5SAILUwvOrOvaWA0sY=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR1P278MB0978.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:58::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:22:29 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 22:22:29 +0000
Message-ID: <3c0701fb-9f8e-41d3-a815-d48b1a29716f@cern.ch>
Date: Tue, 29 Sep 2026 00:22:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
 abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
 kirill@korins.ky
References: <20260920184148.31541-1-mstoretv@cern.ch>
 <20260920184148.31541-4-mstoretv@cern.ch>
 <CAGwozwGzw1CE03kbWJaV7iC=1o0QXg9PpreTunenm-vHPe515A@mail.gmail.com>
 <6f2e0c22-0be6-4daa-8ab3-28d92f41197b@cern.ch>
 <CAGwozwGwccsppaCUETVJzNN8uGd8Pzujf9pz08SyHUQFKEOxCQ@mail.gmail.com>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <CAGwozwGwccsppaCUETVJzNN8uGd8Pzujf9pz08SyHUQFKEOxCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0145.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::19) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR1P278MB0978:EE_|CPH1EPF0000052F:EE_|ZR0P278MB1741:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fba1be4-fd3f-45b7-edea-08df1daeff62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|786006|366016|23010399003|19092799006|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 5BZBorLML6F19nkHanQOoPnmrmbcbqEqirok24lAPKl/jmn9+5jof5K60R4bB6Yxpavz+q13iXBzzmlFhzRBgyIBpEYEVcJrgcW+vV2FFJGMmH9mA6TQXMiQdg/rbY0M7gKdA9/KwayrOWb5jqkmltHo21pXCkKfrWsmLLaUHmWAzUeRHY6YEjqfi0n468EG7sUjwuKOS0jS9zHHcYa+kDJ4vtUb7J0gBxBQuHpXZHwOhdGgzVkQXtu78VYBnm/WDdrs6B3MK11xp4wXq/eV65G5YBbQ/zuBRn6LUwZIVfUuYEIfIcBRO1YWaGnD8Q4XLRJqsrnwV8tZJnVqQtfANTPfmtNQQ+63i6I4Qguv7Scf9wH516RojhaJGE9u7FFKvJaoCQoG4Il0VkaSW6ocSFNv9nkqlinaOgOEF5l1XDYZ1DsDXcHyteBpRCbesk6JM4fFtbzvUp7kRx8v1IQnRwqWxKl2kY9byxboL9b9/VK/yDmBy74b+iOYIT+2vHgK1W2AqaqV2YdsUnNfHWI87A5GshOMi1/WcweJXZzf8ym5zpFSfmsv1jcvuK2QqKlbnQ1hhlGANWEJz8ytfQcC9pq3nVC73CZ0wF/VpwI3SiN1Yhjb4plbmb0bwQCFvltX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(786006)(366016)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 5UM4sNbDUqqNfHJhZ/dARXBJ156G+Osjwvasg4c5ipk0wqc8VVu/nb4jWowxupqj+Jg8nfN2u/WZ0GGklLe4D5u6sFo4dg+CSrcbAZgvGuA1gTQ4nmG07HgxcAccKYd9CDATVWO7a+hhnBJLjVVNszHkHsP2ihnG0kG/CC31cP1Hg68c8ga1FqYFl6VR0k1d9w41ydAl4ehtIga7w8SW00JPWzsDn8Rr7bKbtuBgsH+RGtV/BKTXJfWFrjMzF8m+IkNx0KgFrBDrvDM1gXPihTQHHWMtqWvn/Xn2LjZ1PIlYUGnRDQuEs3GuVptkpID2Gj4sGO6COaqnbhSfJ3nC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB0978
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF0000052F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dbe6717f-05a8-46ad-b802-08df1daefba6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|23010399003|36860700016|30052699003|376014|1800799024|7416014|35042699022|19092799006|82310400026|786006|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	3BdPdwxCB2L32zkH9XwyC2oeS1KXU+oCG2SSAp7+ygwqHxhzTPQJArUfEZ0/okpF1cskfctUcYzYGEpRZIv5iqj9FW9+uBZjcdWv29ddIbGq0MrHPULxH4pq4iuudlMdD6CyEcQgoGogHvbM5wR9B43jF6THyL06BaJQ9XKBv/ajSvFNnp7XW+D8znQWPcYLrv1GlcLvjiu0VG1ejD0I+bOQmnwSelMK99YEGztG9xN8Zvqfbfx4WgLzrfHq5EqhOzb0K6VR3nfbcmjbEFDq0uA0G8WAFAD5uQoYFo9Ap2p8OfA/z/vPJTFV8KAEFxnY8grJU9XWg9n7P0axcIl+rzB1rC8PRR4q7sH3W8rlsaVtFFFH2cMcj9gv0U7uZyb387ZJf9qgWuSlTHMHHnZ8TwAQt/Xi/sHnc1S/A/OIqEPGvjdaxx4VEuSF7iQm9vMrRdfr/Ks4zCkdafngU7cU6nnvV7QWfYFPyFbXgsKeiSUkuu83eAcgKVn9GIoy2R9n1SA1A/BWoXzam9wZ4+IgSnKG4HEor+KbFUPpoAK75TZoWT/MkhzQFqyL26lc37VqDod3K+0g8UgICZmamXbEs87TMAfzO794/oIfvC9/ptp0yuPcr0WRbj7LG8o+fMXSoOuJbRotqtql4t/hX7Gfr+dQXW/HNwB9Oh58wGFvlJE=
X-Forefront-Antispam-Report:
	CIP:51.107.2.244;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx2.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(23010399003)(36860700016)(30052699003)(376014)(1800799024)(7416014)(35042699022)(19092799006)(82310400026)(786006)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BewH6Bkh6W2tQUAURIQsvQxHbiKslbjt/rB2/tbfxivtorRikNAMs7+g2keI8llv5UGSp676UlzJwXeFuDd6bAXFsraMCLKev5WTQSUveGBvSjuHWzAVdRLqnOC1vavskyqZzb8Zsxt7ICyZcE9W2N1SPewNILTnJaJRUkmpbzGkxx6WyF7Q+IfJoHYBmZqNk4o5kshoGAvfbr3YHAd7miIyb6CU432sFUiTSKRp/vApRxR1IV/BllpzGBP7o/vEwfyXHxWNMlMDTQlcIsmpFxeV5XfKxiW0cOr/TYWPaAokTiw5JiQ5hQnFZGwj+ZxTX+Bru2JvPu51Mn6I39RxBfYhIpPXH68OwAj8VYvbyzd4BypnwaL/usaGSp4NDuio6YY6JZtBm1qr2gyFZpx3oSo2V9FRvIfHCdA4g8Zu+rJTZBJIs3Af3QU01qOQHht7
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:22:35.5342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fba1be4-fd3f-45b7-edea-08df1daeff62
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.107.2.244];Helo=[mx2.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000052F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1741


On 9/28/26 21:09, Antheas Kapenekakis wrote:
> On Mon, 28 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>>
>>
>> On 9/28/26 18:44, Antheas Kapenekakis wrote:
>>> On Sun, 20 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>>>>
>>>> Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung Galaxy Book4 Edge.
>>>>
>>>> These use a common dtsi derived from nodes that were able to work on Linux
>>>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>>>
>>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>>>
>>>> combined with the patch series the Honor Magicbook Art 14, which shares device similarities:
>>>>
>>>> Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/
>>>
>>> Links go in the bottom, Based-on-a-patch is not a thing, you may add a
>>> Coby as noted in a parallel thread.
>>>
>>>> as well as a few more adjustments on top of that again to get additional features working.
>>>> Special thanks to Jesse Ahn for helping expand on what would eventually become this dtsi.
>>>
>>> Hi Maxim,
>>> I tested this series on a kernel with various other backports on two
>>> european (norwegian market) galaxy book4 edges.
>>>
>>> Specifically, the 14in NP940XMA and the 15.6in (not 16) NP750XQB.
>>> Specifically, the later is an X1Plus variant that came out a year
>>> later with cheaper components. It does not work properly on either on
>>> them. I was hoping that at least the 14in model would work as is but
>>> no.
>>>
>>> My test devices have proprietary Samsung battery controllers
>>> (ENE-KB9058) and type C controllers (Samsung EmuEC). Also the speaker
>>> amplifiers are different. So the battery reporting, audio, and USB C
>>> ports do not work at all using your DTs. The TPM does not bind either
>>> but you do not claim that it does. At least they got me to boot and
>>> for that I am grateful.
>>>
>>> Other stuff also does not work, but I am just listing the main ones.
>>>
>>> I suggest you change the -14/-16 suffixes on both models with
>>> something more specific.
>>>
>>> The prior patches in the series look fine to my eyes. I did not A/B
>>> test them, just pulled them in.
>>>
>>> Best,
>>> Antheas
>>>
>>
>> Hi Antheas,
>>
>> Thanks for giving it a test! I think we both have the (almost) same
>> device, and your experience on the 14" NP940XMA (NO) probably mirrors
>> that of my NP940XMA (IT).
>>
>> USB-C should already work for this SKU with the patch DT, but not USB-C
>> hotplug (yet). For now, everything is just left as already set up by the
>> firmware, so peripherals plugged in after boot will not be detected.
>> Everything inserted before boot, and hotplug on USB hubs, should still
>> be fine. Could you give it a try on your device?
> 
> Yes, that mirrors my experience. But without a TypeC driver you don't
> get renegotiation. So no USB3, no fast charging, no hotplugging, and
> no DP alt mode. I wrote one but it's still buggy and a bit too
> complicated.
> 
>> Battery state monitoring should also be with the same caveats on both
>> these devices, going via a separate protocol over I2C instead of
>> following the other X1Es. There is a separate battery driver for this,
>> and also other useful patches (like the webcam and kb backlight)
>> downstream. For now at least, only the features listed in the cover are
>> included here, but our repo linked there has pointers to the other
>> relevant patches needed for now.
> 
> I did not find a battery driver so likewise I wrote mine. I think the
> battery driver is more upstreamable than the TypeC driver. That will
> take a lot of work.
> 
> But it also means you have a spurious hunk on your dt then. The hunk
> that registers the dead battery and supposedly controls the TypeC
> connectors from qualcomm can be removed as it is not present on your
> device. It can then be replaced with one that registers the proper
> driver later.

Just left as-is as placeholders, but yes, can otherwise be removed.
Do not really affect anything otherwise.

> 
>> On that topic, you will also find links to devicetrees for the X1P42100
>> Book4 Edge there (via Ciscobugger). This might not be the same X1P SKU,
>> but could also be worth a try.
> 
> I had a quick look at your repo. In my initial attempt, I tried to
> reference your upstream (not you) but quickly gave up due to the large
> number of commits and dtbs.
> 
> I only see a polling commit in your tree after it diverges, I do not
> see a battery driver?
> 

Plenty of old branches here, but README should always be up-to-date with
links to all the patches used [1]. In this case, we just use the
existing battery driver by Saddy [2].

> I think the only realistic way forward for me is to wait for upstream
> to catch up and only add support for my reference devices (the 14 and
> 15.6) so I can flesh out my userspace until qualcomm starts to deliver
> results on mainline kernels.
> 
> I attach my current tree below [1], note it is very unclean and I am
> currently doing fix commits. Once I get to a place where I am happy
> with base functionality, I will squash everything send it as a series.
> If you tell me that your device works with the drivers I wrote (note
> the LLM assistance), we can synergize. I do not expect the typec
> driver to get upstreamed unless someone more familiar with the type c
> internals gets involved, as a lot of the changes go over my head. But
> I think it is realistic for me to upstream the battery driver, unless
> you have a simpler alternative.
> 
> the drivers relevant to you are ene-kb9058 and samsung-emuec. If they
> work with your laptop and are universal for these devices great. Note
> that they are both interrupt based so the battery reporting changes
> instantly. You can also take my dt for the 14 in for a spin or just
> deploy my tree as a test.
> 

Thanks for that link! Tested your np940xma.dtb + ene-kb9058 and
samsung-emuec drivers on top of my tree, and they seem to boot
fine on my NP940XMA as well. Battery monitoring displayed, and there
is hotplug detection (for the charger).

> I am contemplating whether an initial series using DTs, then a
> follow-up switching to ACPI is simpler for everyone involved. But as I
> see the huge amount of dts, I start to get concerned. So I might send
> my initial series that enables the device to boot using ACPI instead.
> As you know, Windows uses ACPI to boot the device and a lot of the dt
> i derived was from the ACPI tables I dumped in Windows. The DT was
> important for me to get an initial bring up for the device. I can now
> sync kernels to it in ~2 minutes so I can rapidly iterate.
> 
> To that end, can anyone tell me why are we not attempting to use ACPI
> to boot these devices and relying on DTs on the ARM side? I know that
> traditionally for phones DTs are used but these are UEFI devices and
> contain proper BIOS data for autodiscovery. What is the current
> blocker? Switching to ACPI should let us drop all laptop specific DTs
> by adding parsers to their currently DT only drivers. Am I wrong?
> 

There's an interesting discussion for that here that's worth a look [3]

Cheers,
-Max

[1]
https://github.com/zensanp/linux-book4-edge/blob/x1e80100-book4e-7.2-14-tmp/README.md
[2] https://github.com/Saddytech/Galaxy-Book4-Edge-linux/tree/main/driver
[3]
https://lore.kernel.org/linux-acpi/20260623145225.143218-1-johannes.goede@oss.qualcomm.com/

