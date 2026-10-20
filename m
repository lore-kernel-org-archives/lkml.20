Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792527216;
	b=5oUdEYE8l7rcWlcAZs8OmT01sKCpUKxXCBG4OxHkcz559TxewZG2o00IKn/fqnaBxzoK
	 MtyHT2N9H0A6A813Dfv62bWVeA37z/3wbLAQggsnHAKijzZDFojM26glqNkoYrLFJ58uV
	 fl5qYx1zKfWoF3jHag7y6+cJmcKJgkDAzJ15NNhIK8F0306sqkIyW4J9vaBLRuBvHbj8a
	 hlghZU1rQIAtAggocUdTyK3OkJGkZfH3QYZYQcdm9J5EZIj2HP4RFOBdxSR6XBp44gZ5T
	 zwBC2hwn+W76ZWVAQTSlm8hfYXBwT7/Ie5K/nDd6BVram1+P/kxVRFs5OAIJJsJ+BSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527216;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vaQBSxNf7mm9kNjM2YhhXmS4DaceKcQASMKrvQ8BTnk=;
	b=264gz4ukAtY0AmBwwGZyQXK0Lx8fpePxQlV4z4bjys+Tg0Ewze4INzjTYHSXVBC6808m
	 Q58PPaLzg5BgpQto3cGj8pSFMnIBJdqSrLEycJViKfBK8tFnEWWXk04uT7AmtG4vA0J2V
	 0IidgfYjKpMjvpejRnYU5lwnlCaj5rFj78VDWypqxwXN8qJO3r+eJtXsnN8yPbysuB8PJ
	 HOQmkdKBiM0r3vnyIXZiPZV1AZrsC9Uf49fB/Nv7wDPyetMZlfWk7cWCbRybasnuM7Tdc
	 Er5Eh8G7igYDsVOkMTHzGkJ4fEUdlztqXUinyxkMpQaf2rWOlRLvVYxluUH0K13Kr2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xEfykzka;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCFC606A31D;
	Tue, 20 Oct 2026 20:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCFC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=xEfykzka
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9c8V1QNzfhOk2mldCZaBTPxFt+WPkmQc8A+QIly61BYibbSfcd1GAA3k0Yzr03w6BjA/43lfdbXwpGWW3yGyNfHhscRaN3BiPJgfgQ2nMhzQxBDnZWgmMaDTGMqHkViRbSFIue5DPxZl3daOAD3BH70Y9vwIyS9vePP3v2FIEz2s/uhAH0mjGfg1V8AszuA3zfRmu+lYuB23ccRq05U5mduzMN8XHtjkjbt3Qife6Kxyi1yTDSn70594n3v17Dc4Sn7S+7d2gtQNUQs0s8wLuhYm9fVT3tnP1sj7hn5oDDfXy8lRaC2W7XKxu9A2ah1FXjKBvcKK3S7n7/zR/HxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaQBSxNf7mm9kNjM2YhhXmS4DaceKcQASMKrvQ8BTnk=;
 b=o1oQQVVkoYomxpqocYJVR5JINaIiqAk0NqvOsUogVix9ludGC8Wn5TgHZ7ZSfE9mJrRdd7oS6y7hznTskvUo0XpklZbsbF1PWERd2tm+kJewd4mSbcn73AqjLzYYcuoG7hbrrQU8tBkMhaPSc+Fhfi5Jw1JuNK1A+lWr6Xy3No8dsg+eqdhUtKOj+XGOBvUV6Icck23k2c232hdom2/9F0/8EkNZcp6Y6Osy+/r5YkZq/ivb5Uqu7eRTgtopo6x2tusXlWu1zWpoR9H2ZWOSEO5oO0rz4ZVu+Tb/qyarLA0x982IW1PdP6lZnBSSitH+BpCcsw0ukNRBJCsArVyE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaQBSxNf7mm9kNjM2YhhXmS4DaceKcQASMKrvQ8BTnk=;
 b=xEfykzkazyZ8BQQodlnJ+Rrua4P69wc7qPWArj+NRxilAnLXXs4sdw+RzRWp5VyWrJGLncRylzkc1t7Ody777JxEcwmpfKFadH4pXArHo1I7ygakgL643vkPrwp/aGp27OYE9SCcA//0rmXRv7sijBHti7zDIsuy/yVxrnbBwJmMX6yN6Q6pbnXt4gpt9QbxxsogKZZnEmAY/zKcR3UUGTHPt8Btr6eKfjkGLGe19wovlATuLc16dNycUrP4PMM1ZAIHVuox6j/3k03zWXRon5bt1Ewv+WlZavZvTeX6XquPJP8D4gcsCZdbs8iszQTtnnPFh8Qu7yT5IH4Z0Pb8GA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by PR3PR04MB7323.eurprd04.prod.outlook.com
 (2603:10a6:102:88::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 20:13:19 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 20:13:19 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 20 Oct 2026 16:12:52 -0400
Subject: [PATCH v3 2/7] dt-bindings: display: simple: Add
 waiken,101wx001-wct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-dxl_lcdif-v3-2-adc944659e14@nxp.com>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
In-Reply-To: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792527183; l=1788;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=yl15XoJGIqfOBSuMpXC31ufT3oJfOJlMAq+IlRFrdZ0=;
 b=Zg1/KSWTni6O0dbJTPViDiLQd2rmzz3W5ObFgdfofuD9jw/qPPl6EHx18azaTHxl4duDjZSJH
 QrTqT9gl4p7CqagNkilupKEXYvF5g5bajfKUpz8W66xeBMaxui9a+RT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:510:e::13) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|PR3PR04MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 738e710c-fc8e-4359-d8d4-08df2ee69567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|7416014|1800799024|261009223027099003|10067099003|56012099006|18002099003|22082099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	9KgxpexbOmx37/aEAv4uvRqzuu3H5k91TDpUMJz7qrBtC+hjHTDbj/v97ZxsURkKicvsyWEbKn6Dy8ZsML0CLf049kyqwe0ukFWIMtnjwdi3O9sKX5ALcvwh314C+vj3awA0RrGvyo9UxlpjwCMwD1PPHkhhtDWCfH50rxsi/tiiDtjbvypG0cHVmtPXPhj5hru0j4Pm00pJMJI71X6qAYH/8mPST/NC+QHH1pNfUPABfU++mJo7QRneUoU2FSdiRI1VfnUKGC53GR9N0TKvbXVN7YVwIlSwlhUwcWHJ7G6sn691X/oTaGdu5KfUEQwan+RYsepY2Y+wyT6nEJ//gaS7wi6pzBmUFPelIKpE/9z913GaNeQsmFFe7h3CsmDjuji8hGa7Z48B0enUvaJ+up8oJ6S3oLBpUCi5fB1E/9mtzRG9tF63au8V7aEwEwJcMNaBJu/W+cg/TKU0RLmTBH8x+NwI4j05e/0a842l9zesafOVePr5Kfvze4Exdw7vdzm7KCYcb3uQKrkq3pbOaBqG8wW4yoeng9jY1zMWoBZUhgUb0QNzbl2N0PQj4dqeoVwmklslhz5xqAH7/VFnUfv9hk+WQa0MEIClNuiBUXV25z0LL1dGmtQ0q+0YajkGIiHJng/CahUgnDdZb2qCtFbX9gVgqteTb1u4MilNXNBWyscS6gf8DT2ZoBZKzcuCxrqcPuJIC8gcv5s/q9nftA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(7416014)(1800799024)(261009223027099003)(10067099003)(56012099006)(18002099003)(22082099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE4zRXB5SkY1ODladkpOQzg2NlZsbDRVSXZvOUVhbENEdDAwR1FSVzNJMmU5?=
 =?utf-8?B?aHZOenJVRTdRL1lXOGNENGZWajhOMW0xUnBDNU9oc244ZzYzYVZIa29xdmNV?=
 =?utf-8?B?VVEzQmwxT0NUcjhaWC9RSDBDQ1MrZTkyM0tnQW1ZZ0tMQVBuRzJYRk1raVE4?=
 =?utf-8?B?cDhmRUgyVjVsamk2UjRaM2pieTZvbWpqK2tNdk0rKzBUT2RzSXd3b1BGWEJ3?=
 =?utf-8?B?bVh0RjFGcDV6cGlOcFJVbVVvanp3YUloZUIxdDBWSUxMV25KVnQzOTZNZ0ZY?=
 =?utf-8?B?ektWWi9MOHV0YXZ0akdqK1VtRDBBVnZmbGUxZjN0WWFRSnZMZWxvMmRQS2lR?=
 =?utf-8?B?ajNzYmR2cTlEeGlxMVlUd1UvRVhndzhZaVVPZXZ2WlowelVkbm80Qm40Yzc4?=
 =?utf-8?B?K0VmS1J6UUxqSXZhVkxZYkJUc1pJY2tWbUJ3QVducnE0TFBobnFzdnJWdmNt?=
 =?utf-8?B?UURzM0xzWGwyVmV6RUpXdzhrUUdrRnNFQlQxZnJFcXFnZDBLQ3lhaDFZZk1x?=
 =?utf-8?B?UHRTNytKYjhKTWYrUS80T2FpUWloSS9NTStlTHNmejhFYlpNK2xGR3ZCbVVj?=
 =?utf-8?B?RGdjMEQrUjlVbGh4aEw4QzV2V2pQaXF1UVl6cTJtZU12eENmNnVwOWhsbG0y?=
 =?utf-8?B?ZnRQSDhlTHhMSGFoZFJ5WDlqTWgvV2dDZnhhb3llbGZKcnA5b3ZHelNTS0dT?=
 =?utf-8?B?M2FDemhLR3ZwN0E2UlVvWlpjQmZvTjJBUlB0V0oxaERmays4OGJ1TGxyenpR?=
 =?utf-8?B?TjA0ZEx6UFA1QXU1QmU5SUtDQS9xZmUrUGFPZmxNQVdxUlZTMndib0QvS1dx?=
 =?utf-8?B?V1NRYjFRaWV3am1CRTBrVjNCRHZwak9xUEhqN3lHVFlycDUxT0pQaUI0bjJW?=
 =?utf-8?B?Yk90cnVPUnRCWlVYZG5NbVBNcDNuckVPOVZQTUVsQnNiSmUrbXVpRGNTaEVE?=
 =?utf-8?B?SkxsUCtmRTk2ZU93WFhpeEU4ZytKeXBrbHpsYkpJK3MydUIvbElaK0g5Mng3?=
 =?utf-8?B?cnhNb01BNmlIRldZcGsyWjd2bTBnVXhuZys4YTBwNUZsUkxFa3RhTEJEN2cy?=
 =?utf-8?B?WnB1Vlh4VnJwL09wZTJzZE40Qk1vREpjNHM4czBmV01GVTRkUDJxaGlIMUR2?=
 =?utf-8?B?UlFWSUJvbDU5YXBKM2Z6d1NLK09uYXloVHRiTlA0eWg3andrbGlBSzUrZi8y?=
 =?utf-8?B?cy9BcHdDQ2tFYzBKOVZhN2o1ZlN1clhGV08zemFtaGs3Nkoxb2pOcFlSbHMy?=
 =?utf-8?B?QXd4UlFyMUxlM0FqMmhZSlBjV0I0US9vbWNGT1NSTDJxcnMzbHh3WGZMZnFn?=
 =?utf-8?B?QWpGc1lXS1dQbGVTVTkxWlRHbC9RYmxZQ0pDWHVrcDJxRXE0d2o2VURFblJ4?=
 =?utf-8?B?Sk5pemZ0cTAxVzlxZXowSnZ3TldNclZ3TGVxWWx2T2hLb1I3ei9RT3hQYW9y?=
 =?utf-8?B?Q2JEc1RGT0VkdUovcWJLa0NGeUdtZi9zWHl0RWpYTGo0S1BWeDBqUWVTT1Qx?=
 =?utf-8?B?UkhZaGRNK2FNMnJSWDNLZDBqVVRId1VPRm1wR203NVlUNmtyYTIrSTVkQXRm?=
 =?utf-8?B?aWxGT2ZidnV3ZGViL0F5ZkxWS0pGN29Od2llNllTZUcrZTRGM1NWL0FnMlZI?=
 =?utf-8?B?RlowSXFWVVB6RFkyTFhrdWZHVDFYenZHaldseExScVVJcDZBU1kveERscjR3?=
 =?utf-8?B?RFh1cGpUS2UzblZCeWh1TjhMME1Lb2FiUGlMOVFlLzJobExpQjhoempnK0VL?=
 =?utf-8?B?MnhHSTlkbFNLOFdJUk45d0FndVhxWXg1QWREVC9TekFqU2hrdDBqV1ozSVhP?=
 =?utf-8?B?NEQwRjdzakc0WTc2dFpIN0t5MVI3aEtDdHh6eEtEbFJocUdCWG9FZnpEV1BP?=
 =?utf-8?B?eUVKWkZBTy85azdlRTlJZTJwemFsR0FMZ0pQSzZLcHBHSjgwOWdGdHpubHdU?=
 =?utf-8?B?U2RaazAyWnhFaWJkSDdGNU53M3o0R2VuNDJwRUp1S2lPdkh6Mjc4RVBobm8z?=
 =?utf-8?B?NC9ZOWVsUWVzYVBFcmxEUzZRNngvR0NHK29PekR1OW9HYTJJc3ZVV0JxekZ3?=
 =?utf-8?B?a2pjZGpCNUkvaktTaGg0TnRGdlcwckRXc1p3bXA1bXZBbVpjdVNqR0V3WUdV?=
 =?utf-8?B?T0dkVElYNGxxSGpXWDVWRXRZTTFlS3VxS3ZHTnNiOXp2TnNJd1o3TEtXcnZ0?=
 =?utf-8?B?d1daZEk0eHBuMFpGZDlWS3l4NU05d2FVVUFJeTdKNG9nZEdPVTk5NWdWYUFH?=
 =?utf-8?B?OEhSTHFBR1VLUkhYYlFaNW4zcDF4eGpCQWUvTHYzTGdIY3o2Nm5TZjRteFpB?=
 =?utf-8?B?R21EQmJlVTlrQ3l5N0VRTHl3N0xwc3hmZ1ZTNG5KVXhXME1VVTlPaHA4YVRE?=
 =?utf-8?Q?XFifwvarTA3Be3M71QBfOQk87HVK/kyWBQZ2f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738e710c-fc8e-4359-d8d4-08df2ee69567
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 20:13:19.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpIzV++tXCLwSoRJmCqjiYgZF/ZDjDWG3SkzSlVuV065D/4c2a9mGEahQ4tcNSYqKqpuxJXHTTuvw0Ce6tHUqOo0QsRsCUOz5IxWp6nYdDa2ANCC7oT69c39IOt9EoQZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7323

From: Frank Li <Frank.Li@nxp.com>

Add WKS101WX001-WCT panel, which is an industrial-grade 10.1-inch IPS TFT
LCD capacitive touch screen display module.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- Use Waiken Technology Limited in description
- Use 10.1" at comments
- Use waiken,101wx001-wct
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml            | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index eb49832b26c46..15f7dc0d0f6d5 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -353,6 +353,8 @@ properties:
       - vivax,tpc9150-panel
         # VXT 800x480 color TFT LCD panel
       - vxt,vl050-8048nt-c01
+        # Waiken 10.1" IPS TFT LCD panel with capacitive touch
+      - waiken,101wx001-wct
         # Waveshare 10.1" WXGA (1280x800) LCD panel
       - waveshare,10.1inch-c-panel
         # Waveshare 11.9" (320x1480) LCD panel
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 473019dd01263..97d77d1759e39 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1885,6 +1885,8 @@ patternProperties:
     description: VXT Ltd
   "^wacom,.*":
     description: Wacom
+  "^waiken,.*":
+    description: Waiken Technology Limited
   "^wanchanglong,.*":
     description: Wanchanglong Electronics Technology（SHENZHEN）Co.，Ltd.
   "^wand,.*":

-- 
2.43.0

