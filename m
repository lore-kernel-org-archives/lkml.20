Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.73.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794845026;
	b=xhgg62srm2c5co4HDbrks6qOXqet9XuiEO2KHtISQmRJwVx86UWT9fqKMyW/juFsFBoB
	 78U7TmT2QIXBsIoBnSnbjQbRrE52lpQ/iGPIOTx5C1JnEdNyTHdNXjT47xFqUoPhMBicI
	 sWO+xozIEDf01OdpLbUnetmg4BelKWMLqpxzq0A5Wto1BG4Rd+sdihez+sOXD0FPuNN0O
	 nr98isxwQK8R003x4IOP6fYPqhf2KrLdCE3e3/Dpqdoi3iMYT1SGFJCeWMQFV0I1WpCXX
	 1b7JSK6UdTjQOMRUOFJHoY9t1pQG+1b+kb22EVYPbtndznwJ4Vm32g9lrGTt2mNAO4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845026;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Type:X-Change-ID:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VAqvjpB5AW7VSkoN/GSP7pZasCvY0XKkxJK6vkAWCho=;
	b=r86Z8VPg87nWSRHy13xlLpEyNeZH+hPqh6ULuqVrpyNqmohur5+Aqt/53msTOEjgxqAF
	 q9Z2kBx6Z3J9WJf4yoByWkcvGm6Ip2KOq3p9LNFXOFY/yNi0B2vkwCIZ8PV89sYfDOwc9
	 /ABDqnZlD+KELZ6hzIADNHrKpvsDDjNNeI0ZIi/VwTRaplFA1r7Gj0E7rnLY7/VauIKmH
	 jHkQxi67SXtiSEFqsVFm89AbZrNRWGanG3CVjTzyLN51r7RDtKE0hbyR3HWbL6I9CqYni
	 2bBOrAs9+Ct+fm0rf/FdXElGI/+fVWeE82euiyJwx/lc0v4q1cROrGkUuuflEIzQ9ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Wvdstbkd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.73.14
Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazolkn19010014.outbound.protection.outlook.com [52.103.73.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59A7606A31C;
	Mon, 16 Nov 2026 16:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Wvdstbkd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4GA4wDl3D5eBfmSqo4W22DyLM3+ZJ5f6G85rlfzYW+T1/Oh7ubQNjYHh66cxezZ/ZtKoDkN4XKCl00fmMIwRrjVK6pgL5xQ9idZjx9zqsO9XcDlQMM7qTEOXzvjGDOY5/G8IRlVp5cASHjqBGcZgAIfzBKZu8CyTjo7Z3Lge310IBjGL4URfTrL8z/MJhCYwAIMats+MtFdEgETl0bLQi9PJOZkhv3Iy5uoiIUmB9yEY0lO7tozkVzr3w8b/gewCt1A+msz0THGH6oUOJL8WUlwpf9T+Mj7/AM5hWHwN7FHJerzRVWNOuTbsCClfZIfqj28RdVDOmzQLFAQv8l2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAqvjpB5AW7VSkoN/GSP7pZasCvY0XKkxJK6vkAWCho=;
 b=Pl9kYgCKBzMuoRVtYRvFq+L8IvJB0LcqK0l8C7pIWsBQnvNdINlgEEp4EpfO0I3+PH9PAQXm8dK0BQH0bUYY/uOM1MURDruRec9w921B3hNLR+7nIsbttX3yIBLna5HZQ5llrK5izD1eIts7fFOvoKjEzOPYZuQVQEqR/CA4S2n2HSD+KpnvdRgGCSuDqHSoouVnHikvflK/dm9pdj/N9BQTXUklLDH1wU6NIDi2ngjRbJ/6kADmaZruJ5YTYNmMhCz0dTEibh1RkNDgnQzOaobr77nvfrbxF3CV+74++ZxRvFatSRznKLb5/ClMSrykwmYpVJN9t7EOJfk3vI4vlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAqvjpB5AW7VSkoN/GSP7pZasCvY0XKkxJK6vkAWCho=;
 b=WvdstbkdxsftEP84+kn2gPwCdWCPfSikjCILfSZmNLOe6DjI6/sOHIdPiLXefFMT0/2UgnH+N3NIcV1GclpgT+kZDqJf7FKyHRw7gsIZqQGJ6jj6UWANlXU8IgE05hV3l9/smYnZbE0IS3H93G2zRoByb8DrJ6iaUjjqclqeE6mYjquMDX+tL4Q2+88FFXMjxKPhv4dR2PSffH0fo7SzkJw5JQK8R/GMovrzTsxp9CWEn4gidhrNkKmWd+vIP6gVyMc4S2y69BJaQNfd+8qFls6bUP6mk/Dk8iu6PSwNPXr6lnJOSYWQbasDS/5XkLjU1rSq7D+7EItMExuG0iaUvA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME2P300MB690011.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:289::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:03:38 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:03:38 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Fengwei Tan <tfx2001@outlook.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] riscv: dts: starfive: jh7110: add PMU event mappings
Date: Tue, 17 Nov 2026 00:00:30 +0800
Message-ID:
 <SY8P300MB00418634B80A844FEC530E9EB57C2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261002-jh7110-pmu-node-98b04e7cc010
X-Developer-Signature: v=1; a=openpgp-sha256; l=4004; i=tfx2001@outlook.com; h=from:subject; bh=piqtXLaqqGjSdj5QcaUU1aLe24D3E+CTYydCyykE6GQ=; b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+yie/2GNvgGA4yyerrzTFKYII6m2P111cCvwE naHqcuNTZ6JAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavsongAKCRAcD62l0/wL 2kL5D/467U35kt3ITJXs/ywB61SP2LCMk1aTJQilpaa5hWsllZQAe/1AWxeJiCjv8m1k6e2Lg80 iFZaZoqZeDTB3vAb46AvKvSxGspdK3ftLrLAoY1mlRmhRgsapPeVLSY+IC23m4H+tqoqlvmQXrp gQxRNuzRtfN2LvBn8KFPk9b59F87oCwSped6BVAlpLaeTuf6ZkPLuh8oV1wAR3Cjfemg52bpO5W bZbWOD/Wl+6qEwX5qTaPKXZUiaoYKIjbGwqbgjM4+VcBjiE/NpZxdZyR9kYFw8RkspF7WnDqfty 6m1XKExbR5bubz7akW9cadaTuW1rtBIpxKU9MxcwpSRVG7JGjcmPGOCb3RVaMqUpjBA2DovgUOb jzGfVEgi/rjjRP2PaSFErWLnIMe1ihAEoQSkINIjhCz455tmRMuQquhfb2MldKAgQivkrQxHpBx W5lFe+Qr3uos3p0nxCD/MfoyoWNDvTXZ4zbfw0JA8SDuaWAD0/TrFbp5JmvX0mjbdjWc2lo+i28 1CM5RYa0Oq53d6KSYsT+ppD4kZPG+5VMEKJ/nUS7lR0pJbbK8q8sBnMpvQN/dw+r5NaGveCywPK Q6QAjunn+Ymt9HJOAbqdvYbc5mFA/F80Lh+RaJIR8qNYzfwhPl/yty9+DRwd591Bfa9eEfKINUa f5I3OA+S6tIoPzQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp; fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261116160030.63496-2-tfx2001@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME2P300MB690011:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db2df78-b4ab-4470-3954-08df43fb2cc4
X-MS-Exchange-SLBlob-MailProps:
	ynsnEk/J89fn7Y5o/EtadxwWPciBgmkOVnpWfM/tVqo3j22OD+zxDJKm7aDvinHubhZ4B65x5tMmLfi5t0yuD8/3bbFKZOiqyqyzO/Toefg6G+ef5SEFrSaR6RYNtZXchwg+tJM3MdgcEjrPalE89SL70vYd1uawP8ArmiO0iA/oY/n3GzL3hsdMIltSVFecSSNemRjZOTKQioQ0MysrGA/kOAxCFX03x1ZkGY1eEayeB/+2TdICt+9loz0IIpr57CJt3Pzc60qz5batv5HxX/iopto4b2QIvmjsBgG/Ce+BDGoJb2+7BdpawjgpNJ+P+/nYyhcb9xrHoMICmsuWY0kJR8+eCQwzumOtjsU8zpHTnDgvS/6F1xwY3IDVNuuf9q1JTmfMJdC9FkCrOfyUT0Q88PPGj2WvvPL48olUVnR8dHTlIsCqJK54b7t5ra+fkbXOCVuKshtcwAWY0AofEEfnS/sUDYao8Xk+cr62d7qzg5OQ7WglcHprwUn7ZLfb5fChnMg2HT6veTe1+WHc4bJCfxrNaN+rxB6MeTnDFW1koItO1zS1frPksvXVY7D0TA87PJO1yTDOmrIJm7fMcuS+mS47xneVeFgnQQ40/6CweoCZzGxupvez7OGw1RFR1EAnmsPnR4JsBzM+RxpG7HP7bu3zEdOR4TJrG7wiWvDMV0r+WXhXZ8Zavn3s1xtEmZPnaE/qOdSfpgKCCkCoblV3sPPjTJ0Q/qxj7yJg+27brC9rQutWAAxNMnY/m99uXsZ0UMoyWASG8k4GLgcqg3k2GYCJH4M/5ZXO9CAZgX9BC2ONfw6MHIiZ6obdK7vwCljTxHhWo8R9H33cJU9QOMlXPWrmPmFEGSIQjDSyJFxIv9sMg3of//h8YF71e71u/noLkpzcyi0SSoZN6e/H8w==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22141099003|23021999003|15080799012|5062599005|25010399006|24021099003|260925184616899003|8060799015|5072599009|13031999006|6090799003|4140399003|19110799012|39105399006|440099028|4302099013|3412199025|26104999009|10035399007|40105399003|41105399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmhnUVlISUxZTlQ3UWNGZzdNOWNLNmhtY0I5WTdWd0Nud2lqZU1LT1lBeU9t?=
 =?utf-8?B?ZWVqbFc0ZlZIaTdsaW5tZjl0NWJCbE5Oa2x3ZHNPeS9zQVRzREExZ0FhZ2ZE?=
 =?utf-8?B?UnpkOHdRR2k3V0RWRnIrYmdhcDNCVW5lZ1ZlblAzaVJMMXV3Q0YrcEZZc3I0?=
 =?utf-8?B?cDZKWUR2Q3Rzb3dZMWJ2L2xXWlJSb3dJdTJXSHhhM1JGSTJqY2VLcWlFazZH?=
 =?utf-8?B?STNRUUlvdXhKd0wwWVFzM1oxc3VKRkhpQ2ZGNHB3c0tzQnkvQ1craldKdkx0?=
 =?utf-8?B?QzJIYVlHUlZZcC9iR3U3NnJOUTJCcFBmSVVmZE1VZlNSalRVMW1ZYzhIUE9O?=
 =?utf-8?B?ZlpJbGdHYXdEUk9sZEcxYjB4Q1ZERk81bkJ4dFlaeHRpcWppRlNJRURMRTlp?=
 =?utf-8?B?ZUVZcnBINHpBek5EdlZFK1VPOXVuMVJwM05tWHM0bWZKd0xtb3ZRbEVWYmYx?=
 =?utf-8?B?ZUVGWjlTL3FNbE9PNit6azVlZjdud09VSjA1QkozaFNGcmJibDUwKyttOHl4?=
 =?utf-8?B?ZkkvZkJKcTVacmV1Nm93MnhxOUVqUmtIM1A3bHVleForcFZ2endFWURNbklz?=
 =?utf-8?B?WFRHZEI0UE85OVpKOHRoQi9kRU9zUVByNjZ2Z21yVHRhWnk2VWhzc09SSnA4?=
 =?utf-8?B?cVhDZ1F4ZFN5ZEpOanQ2dEZkbUV6TzBtclJSa3Ntak9lbWtvVFN1ZUlQQ1p1?=
 =?utf-8?B?cGJhaFV0NnZTai95eGExS1BFMEVKekVCQWhSaU5keStBL3g0T2JZdjN4S2xE?=
 =?utf-8?B?UkpkVng2YWtlR2hCUHlCTEdSOEZBN25tZlEyK0I1bmM3ZEJlVk9LdHpCWjdO?=
 =?utf-8?B?SUxkL2FVbFMvMWowckpQWTJkdlFGaXNUUlhBM2JpVllFN2RaRE5JMEkwanJl?=
 =?utf-8?B?WXFVVVVmVVlEdjBJbTZzOEY1SW5TRkVaeW9SNGpHbmljeWdWR1hTN3IxVjhl?=
 =?utf-8?B?ZHYrdUt0UkdQTFhHd0dhUWxsTEZZRFI3VmtRSUsyRFdTZzBZRGgrT2o4emdo?=
 =?utf-8?B?a3kwWkhadWZKZTZkb053V1h4VHhiL0U3NVFjMGt4OTEwUnNQNDFyQWQ3Nkpz?=
 =?utf-8?B?LzA5ZFpwUFlLNTh5Z2J6cDZEeFVXdTRzc3puM0toTkYreHVMa20zcjF4MmFo?=
 =?utf-8?B?MmxuVXYvTjEwSTZBUEF4anFCTHZMV250dTlVT2RoemV6OWtyQzhaYUtPRitT?=
 =?utf-8?B?eTNuT1hCNldFUk9QaDVrc1JzT0RBZm45TS8yUUE1dnhSTk5hQ2Nmdmdkc3M3?=
 =?utf-8?B?ZXEyTkpMYkxLNGRYZWt4dmt3L0xBMnpGa2hEZnVETjBSNythaFRIdmk3TStT?=
 =?utf-8?B?TXBIRjFmU3BmQzAvMWgrNzVHSnRLbVVUNzdpc3oxS3J4ek5PT1R5eGJOaC9H?=
 =?utf-8?B?cktKaXh0RXd0L3N4N3MwOEhKVXVXcUhHUE9VcWtiVk13NkNpRGlZaC94eTdX?=
 =?utf-8?B?MElVZktFYTUwS3ppQXE3UUlpTEtCc0paNFVLYjBsRDF0UUVtOXB1bUJKL2tW?=
 =?utf-8?B?c1ZGRUc5Z0FFTDBzRWpFZWlWc2FMV2lEWEtwZ2Y2d0N1bldGaWE5ZnlCZE56?=
 =?utf-8?B?L3RNQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWRSeHUzc3pKa1Fib096NVdkdHp1dWk5TVVhbW02eHFySTFhUmM0dnBvVlVT?=
 =?utf-8?B?YnJyVjlZd1dTZU5XWlRrMm5sMjV1ekRFVDNrYU5UeFAySEt3SWIrRnExbDRs?=
 =?utf-8?B?aktoT20yYUllUGNWb3ZFRks0bzhNSUh4WUZDQUFCN2t0TWFmT1hvKzNUci9S?=
 =?utf-8?B?aDRZNUliNitZVjNSc1ljTGkzYUp2eUhpVFBHbVRhSWVXSlBDemtCUTlvYUsy?=
 =?utf-8?B?L2xETXlBT3BINDd2TGVsVXhzVEw2YkZ1Y3Z1Ynh1QkFoMW1lTENZdXArZ0Zt?=
 =?utf-8?B?UkhNeU96N09hMmdIT2djK0V3eDN1a2lPUkJueXBQYXpobEJFM1R1OENIdmQ3?=
 =?utf-8?B?RTRWV0Z2dTBYbVNGR0h0VmkvWjU1dk12cDJkejlkUmxuNTQwdXVibngzRkQ4?=
 =?utf-8?B?cjZVWlNnNEgxUTFudFVINDY3ZU1ac0x0cW5acEJ5NkV6SWR4NlVvczBjQkZh?=
 =?utf-8?B?RnM2clpia0dsQU1YSTlDMmxwTERSNFFvMXVhY2E0cTEwdkRnVHFMSy9XNS9t?=
 =?utf-8?B?YXo1TndMOGFuNGZyeUlhL3FaN25qM2dKTnBqaWYyblBEUWxQR1VKdGVBWmp6?=
 =?utf-8?B?dFBzRUdPRFp0OERmbVdFZDhaVHZ5WHRDWm5qdVpoRVBOb0cvZmRWSkcrZlJB?=
 =?utf-8?B?Rm9SVFVscThpZkJWbk5GQ2JwUm9iNmJuL0ZQMzFKSVJpVzlhMEFDN1o4cEhB?=
 =?utf-8?B?TkRNYjAvSWpSRVhWbUczTHlEeW52Yk83U0pTQWRBUWgzdTBsRGxkb1dvVVFv?=
 =?utf-8?B?N1ZXdTNJRjE1eFM4SlNIa1V5SUlMNlQyT3NQT0ZpU1pxTEdZcjVHSzZlZFdl?=
 =?utf-8?B?UmRDVTNJSHJ4dHRnbG1JK2JPV21GaVhTczZXZkZ1VHBGQXRxUmhCdjBOVVkz?=
 =?utf-8?B?WGVhTnhOc3NIVlh2Z3pHQmkyRUlmMEc4WEszZzNEdFdlWVpmV1hXSS9NMnJH?=
 =?utf-8?B?T0p5V3o3MFdqMVh1eWs4aWVFRGhRMDMvZU1hSVhRYWdiUXJYaUViakY2dG1o?=
 =?utf-8?B?L1N0RS93eUZ2R0Qrd09pUzdzQi9Qc3VpY3daeERzdFovQlpGWWNYL1I5bEx4?=
 =?utf-8?B?VFRqQlFReWI1bFJyUTlTRko2RTY5Tis4V016R0Mvc05VWFEzS2dkc0FGcm9U?=
 =?utf-8?B?K1YvK3NaVUpRZWp3aVFKemw5QmlueVdjZEx3U0EzSG82c0owOE9vcXFZaEpO?=
 =?utf-8?B?MEJ4RTRON1ZNdndNVUoxbGU5aFJjVXI1T01yWDFDVkgvMnVreDRKbjJ4c3JY?=
 =?utf-8?B?M2ZLY2pBZkJocWZBMjVLL1doNS9rNW9FVjY1em9VMmU5MVd5V2w2Q2Ntc3JQ?=
 =?utf-8?B?YXNOcHlqakVoaUxjVnlJdGh1WVdNNTFWL1VXV1VtRDlYY29vWG1RQUlFVWpq?=
 =?utf-8?B?M1FHV0piQlI4Y0RUN2VPaUJ2ZDdHejhnYUhQY1ZmeTZGK1hxeGVXTXFtRUlO?=
 =?utf-8?B?cWR6L3grSHYzZHpwSW9DQ0Nnb1lZaUFXM3J5ZitrSDJoY0dHb0xLOEFlaTYr?=
 =?utf-8?B?Nm1kQ2hpTUJ3bWxUS294Y01ROWY4MXUzVmxCVnBxeTZXZ3lobzZybTJtaDl5?=
 =?utf-8?B?SmVIUHJFeEp1S0JmNDg2bHQrcUJkRlJvMGxBWnFZVGkxa245NkVPZ0JWQWM4?=
 =?utf-8?B?bkIvUWdjbU91QXhtTFJmT0o5Q2pLUnc2cnI5Z2lURW9wODhKR2czTmJIWUVG?=
 =?utf-8?B?QVUraEM5eXhoREF5aXkrSEhIK29rRzhjN05YTWI3TUg5VmhHRUhzYVhHTUxn?=
 =?utf-8?B?NVgyMWxDWTNiNEVHMWQxRmlyYjJKdG1LUjFPYkNVdHc5Q1BOaEo0QUM3TkJl?=
 =?utf-8?B?WjFIeW04SHlMSndleEpTYW03SDlWcG1CNlM5UG1Xa3R5VmlsNmx4aWFFTVA4?=
 =?utf-8?Q?I5LCuYd5K3Vq0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db2df78-b4ab-4470-3954-08df43fb2cc4
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:03:38.0146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2P300MB690011

Add PMU event mappings for JH7110, which uses the SiFive U74-MC.

Link: https://sifive-china.oss-cn-zhangjiakou.aliyuncs.com/Standard%20Core%20IP/u74mc_core_complex_manual_21G2.pdf
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
Hi all,

I have been working on adding a riscv,pmu node for the StarFive JH7110
SoC, which integrates the SiFive U74-MC.

While reviewing the riscv,pmu DT binding [1], I noticed several event
mappings that appear to be inconsistent with the corresponding SBI event
definitions.

For example, SBI_PMU_HW_CACHE_REFERENCES maps to the Instruction or Data
cache busy events. These appear to count busy cycles rather than cache
references, which could produce misleading results for workloads with a
high cache hit rate.

Similarly, LL_READ_MISS maps to UTLB (Unified TLB) misses, whereas the
last-level cache on this platform is the L2 cache.

To investigate the cache-reference mapping, I wrote a small program that
performs random memory accesses over different working-set sizes and ran
it on a StarFive VisionFive 2 board. The program and results are
available in [2].

The results suggest that raw PMU event 0x1001 counts Data cache busy
cycles rather than cache references. I therefore propose omitting
mappings that do not match the corresponding generic SBI hardware event
semantics from the JH7110 PMU node.

The U74 mapping example was originally contributed by Nikita Shubin [3].
I have CCed Nikita and the RISC-V PMU maintainers for their input on
these mappings and whether the examples in the DT binding and OpenSBI
documentation should also be updated.

Any feedback would be appreciated.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/perf/riscv,pmu.yaml?h=v7.3
[2] https://gist.github.com/tfx2001/65b15deb82c0733eae07a4abd350a5ae
[3] https://lore.kernel.org/all/20220902074104.7082-2-nikita.shubin@maquefel.me/
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f715b0..24b281ee848c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -223,6 +223,44 @@ opp-1500000000 {
 			};
 	};
 
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmevent =
+			/* SBI_PMU_HW_CACHE_MISSES -> I-cache miss | D-cache miss | MMIO access */
+			<0x00004 0x00000000 0x00302>,
+			/*
+			 * SBI_PMU_HW_BRANCH_INSTRUCTIONS ->
+			 * Conditional branch | JAL | JALR retired
+			 */
+			<0x00005 0x00000000 0x1c000>,
+			/*
+			 * SBI_PMU_HW_BRANCH_MISSES ->
+			 * Branch direction misprediction | Branch/jump target misprediction
+			 */
+			<0x00006 0x00000000 0x06001>,
+			/* L1D_READ_MISS -> Data cache miss or MMIO access */
+			<0x10001 0x00000000 0x00202>,
+			/* L1I_READ_MISS -> Instruction cache miss */
+			<0x10009 0x00000000 0x00102>,
+			/* DTLB_READ_MISS -> Data TLB miss */
+			<0x10019 0x00000000 0x01002>,
+			/* ITLB_READ_MISS -> Instruction TLB miss */
+			<0x10021 0x00000000 0x00802>;
+		riscv,event-to-mhpmcounters =
+			<0x00004 0x00006 0x18>,
+			<0x10001 0x10001 0x18>,
+			<0x10009 0x10009 0x18>,
+			<0x10019 0x10019 0x18>,
+			<0x10021 0x10021 0x18>;
+		riscv,raw-event-to-mhpmcounters =
+			/* Class 0: Instruction Commit Events, variant bits [25:8] */
+			<0x0 0x0 0xffffffff 0xfc0000ff 0x18>,
+			/* Class 1: Microarchitectural Events, variant bits [18:8] */
+			<0x0 0x1 0xffffffff 0xfff800ff 0x18>,
+			/* Class 2: Memory System Events, variant bits [13:8] */
+			<0x0 0x2 0xffffffff 0xffffc0ff 0x18>;
+	};
+
 	thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261002-jh7110-pmu-node-98b04e7cc010

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
