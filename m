Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793873483;
	b=zmGxTuyO+30qXHhVvrG+usgBlPx5bP6JH2AGF/lGqSS/StyBem41AgPMWuz121MOhjrG
	 +Jih7Wqs9KJAYYI5J+3uzW+OwNNsKMuwqYItVu1uTzUkKH//7WGIOTZoBUwcMyGdZwqt0
	 1qhMF31MRlPXgUfCHX+jH8ucIMZWBXXkzuJp0mzJ8a0sUHmr1saVZxA9eHAMFG3hGv/Vq
	 QpDGijIhrs6RkMiSMrFrskp1nS9IZFRuw0f2x/kqwj0WvW/7VBxMJyXCahkGhav1efks0
	 OjPw7Fpqxw4oBzaRr5dN6TL9SxptAsKvoPnz5AmmFAEhdh8D/dovAPrLlS0IhLNpYZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873483;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=Rjiz+yqAFToCoUkmNBmOXK8VHeL9iEJEOqGs+BcxrIY=;
	b=QXmvjMv9rUrGkp2CT1KvUhhqUZKDFEGI/MGG8cYaEeDaOG7svF7KcDIDJhZ217vGPOoP
	 XreYGddFVw0BQAKqu8lGcvNi0nGV5vJ6PNhAQwiKkzRbhKC8Df3xJxxHNzFfypDkAAnyb
	 RNO4njSima4LImt23bzr527rA/upTcTE5nl+EzBzP3B0uAZ+A+P49Z4OEGTYsMt1LDN8N
	 vYXuNWn03Wrrg8E0vDhL1rcwRU5rZ4vFVra1JhJJYfSo7grnbLUi3Sr7/GnbE8sYlrKBn
	 Ugo3FdmktS4kIGECAIBzrYRnZHT9QdJyWwDZ86z2GxEgoTg8y9TyyzVZcDTNF3Rb1LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaisala.com;
	spf=pass smtp.mailfrom=vaisala.com;
	dkim=pass header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=L88io99F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.118
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023118.outbound.protection.outlook.com [40.107.162.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA2606AA44;
	Thu,  5 Nov 2026 10:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AA2606AA44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=L88io99F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPBEoBnc/yIS0SitL18DgqUyr/xklRhnMTcpVuzSiGvYHyznbtz/DvVS3AGht+qoWKUTqkJjWb0egLt8wZotxq5qLoqbJEkwrEB+lyXba6uX74MaJCGF4IBb0bUvJmdS9BRPZW2N8A1s7XFJQyr4/7Ri7SKyAHPZgo+u4fmFgjtosrBn89qwDEmXY54j2wrjRtH5uClhzh4YMqKfWlgrPtiLHVscy/Oi0qJ4/DtON1mMQNueXCn6k7+SRtXxThIANaWLr+yA8kwfNwQmm23YBducGNFNxVS/UruFcWXqbB4FLtEZm3N3ei5IL05t/oV3NuGfApfezEmyuNO0bllFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjiz+yqAFToCoUkmNBmOXK8VHeL9iEJEOqGs+BcxrIY=;
 b=NXDkFgdGDLM1HKAtATKAsPEYMRwXQPYDwaw3YEcFnmxOwX5G89P1ze90byLw+U8k9dU+jtLuDFXfrJNN802F8Q/GGlRIhQU7LJ2tVti2iIMmPTNdKDycB+276aDDQQ90ALWxi2XS3z5Aj7DJUOeZ1/nCvmZCvaJRT5Iir5eiiCkfew/IsJclML0MUq0XsdFGxFUXO3hCzYFc65D5o2/OV7tiYWp02y9cIlcY30aRbVb5blU4pvsS3VUr7P0Q7u/zLcpCx4xCspsFysaOit40AgJnsqxp4YsLqN+OktHYE9owNOWFDYes4IxtKMIYxtE/iB/ezAx2ESfPDRSpbMvPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjiz+yqAFToCoUkmNBmOXK8VHeL9iEJEOqGs+BcxrIY=;
 b=L88io99F8L5FKppwPm39briwJFiLottRxUdAh7B6pnHn991scadrcX+t6B8EotJ49j326MsoXpHT2WLEB2tReiRjCMTHLUdaVx58pDe0ExR49gPMIe5OaafLgTYPBP2XnYxJfBItZ59YZ/QJepz98FCKM3SMZTe5jgqCtOpMfhoMCEfTGKamzzplmOgCqf4f/4oe1W/3a5VE6zgTFyN13R1EXAmpNEevyxl/0aJeLZ67VXQmttkRznQzZivX+YUWu9TsdU09VXS/h544DwL9YDYc2S64R0CRErbShUMyNg52f2q7YRfVi5/ra26fXFDA0v47f8Z5BJ52WTyOA9HrfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com (2603:10a6:102:407::17)
 by PA4PR06MB7197.eurprd06.prod.outlook.com (2603:10a6:102:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 10:11:11 +0000
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc]) by PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:11:11 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: [PATCH v5 0/2] mux: gpio: Add optional enable gpio
Date: Thu, 05 Nov 2026 10:11:03 +0000
Message-Id: <20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdW7GoC/4XOTW7CMBCG4asgrzuV/xOz4h5VF+N4ApZCgmywU
 qHcvSZSBRWLLN9ZPN/cWaYUKbP97s4SlZjjNNYwHzvWnXA8EsRQm0kuDXfSAIYANF8pjTjA+TY
 DjegHguMlTtA5j8ZTCEE7VolLoj7OK//1XfsU83VKP+taEY/rCgvBN+AigAMZ13m0vSPdHArGj
 AN+dtOZPegi/zjLWyU2OFm53nLZoMaerHjn1JNzXG9wqnLCt7Yla+t36p3Tr5zb4HTllBcSG9t
 47/R/blmWX567E2K3AQAA
X-Change-ID: 20250925-add-external-mux-enable-gpio-c9ba5beddd49
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793873471; l=5559;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=GYRCojSTRSVdg9ksx1hVQarDXZUfB5ySlk5gXnTAUUY=;
 b=61iTNsJGq/U6aCO04bh5AoBU4vwZZ4qb7Xvp9wsxZ82aHfZT0Yw+roRMiOmDGvuBcTKR+MTLu
 T/s3CUdo+aJAK6yB6ariYV3TF6Cd1cwI7pFpYgQWOyMMIyEFuVxqnsk
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV2PEPF00046794.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::206) To PA2PR06MB9176.eurprd06.prod.outlook.com
 (2603:10a6:102:407::17)
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
X-MS-TrafficTypeDiagnostic: PA2PR06MB9176:EE_|PA4PR06MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: e22b5734-ac20-4dfc-e608-08df3b251e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|3023799007|10067099003|18002099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|38350700014|261009223027099003|261022105027099003|260925021311599003|260925021911599003|261026121527099003|260925022911599003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	bwyLHHHGCCvkw2plTgF9B9gWIY7B8IUqGT+wvmk318wVqOce4ninMJfhFdC3jg/w3CBx7a9+wP3sWCxYiEo/ChnI84Z2zKyq6dCDnvUEAHdHjeN+9OMsp60gAQMAQRDFETjSEv6GRCl0J1vABNCR6hyqrIBlXm+UDtBQfxw8b3JnOjz0wRCsaNOWsOWFZsNJjXBRVdLHm/ALtTho/VKIak7MwcUrUTxkNAk1Ryl3SYJto5TZcqDiWwNjVM1J/jywjDjeV677UMLMH+aL7jHIoJqrXzUvblnbCeVLN0WKNu9QBSqX+A6A4SEjhekVr/yMfaPRe/duZj0xDNBh9FgbmlSH0KAzq5eiFK5HqFLpdNLPzSDzLl0q5Au/fKM5nWRzPZnBFtx+nX1gsJUEhsz/I3D1JGqOKnoBevF5qQgk72O8+IJjuMYsyWEoCKYhpKrHRYTf3E8vMjvHxPm+tG9dPapbh6XMJXhhuKP7O5fzWUrZd7cSz802LHYsjl27gGqE6vnQ6NUAnkidwplTBl2pbDKuvXR0wItoGN2miEeiv32EPin+9DlWjORY+2chwRhWsTjtpH/Ehnny5w8vpei+PivUZo1JWFeg5p9Xk+E79OSMnH7HKzS8mveBBT/kzm70EVQNdych01UzKigwf7HwNBDNb1TLJVROwA49Cf5zo40=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA2PR06MB9176.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(3023799007)(10067099003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(38350700014)(261009223027099003)(261022105027099003)(260925021311599003)(260925021911599003)(261026121527099003)(260925022911599003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG04ZE9yc2xzY0lyalNEUHRxdit2MUt2dEZtdmhpRzRPY3piTlFleG5ZVUxu?=
 =?utf-8?B?bTZYRnljNWsvTEl6TVZoQnJjNmtwS1BBR0tyU0FjTXFBSG0zWkpLUXVOOFR2?=
 =?utf-8?B?RHJ2TTlROExuaDhLdFliSTdyemlaZWJNWWQweXJscktOM1V3RllERHVIYzhl?=
 =?utf-8?B?YXppZ010bFB3N2dWQ3g4Nnl1eGEvVEFUU2tVRHovYURDZmkxaXJQcHd3NCtq?=
 =?utf-8?B?aUhVK3RiQmpEdmlFS2ZOUCtVZW92d2pSaEdHcjlKUUhSKzdlNWJ1QjVtaHhK?=
 =?utf-8?B?SGtDMHlVbGx1UnBIa2d4OS9FRnhaS0tKbDNLNjIvaHg4RHFIUW5ucjY5TEht?=
 =?utf-8?B?Z1ZtbWhnY1lSK29JV284dk95SGh1djMwNnBONSt0bTZFUTllQkJEMU1SdGE1?=
 =?utf-8?B?WmloTmswRkNReE9Qdlp6ME9QdWFNV3dkUG1udk9mdGVkaFNTNGFRYys2eDJ5?=
 =?utf-8?B?NXEybkU5V3VOZktYSmtQbk1GeFZpcFpiZlNJK28xcElBQks3RHZJZEJpMjRh?=
 =?utf-8?B?R0hzTXN3Rm0zbWZCL0sxQVA5MUZKcnZuTUg3TUl0NVFwaVRzWDNwK04zeGpk?=
 =?utf-8?B?YXlhejF4cEh3ZXZjc1lpNEMwYWsxQlB1MDV3aUdFL3BkWmt0M3dGazJyaTZM?=
 =?utf-8?B?MkRHeXUyck9NS0YzN2taalRPTkpwN0ZLbUJnZFovSUk1YXBqSDU1TFhVNGVC?=
 =?utf-8?B?ZVp3aXk1ZlhFdjkxdTRNQUp3djdCSXRpNkNoMVEyV3puQWhOaktIM0NwR05P?=
 =?utf-8?B?U3RWeUI1NmNqc1F2UHFlMDZyTWxnekNkOTk2K2NWYTFGQnN1cGx4VXIveEsy?=
 =?utf-8?B?NTUrR00vR3A3d01BVkVEaktCSWxvSk91V3pmZHBvaE9UbE9pbERBVkx4SzFz?=
 =?utf-8?B?TGVjUTIrVlNDbTdTWk5oV3RTNXJaUUcxQ0dqUHNGdUFYYkZ3RHFJWmsxS0Jx?=
 =?utf-8?B?QVVZUE53L2JJcm5HenlOS1JPQmNnM1VHYS9XZFZyUExuT3lPR2s4U0o0dHln?=
 =?utf-8?B?R0lWZERXenVLc1RpeFdLL3h3cjc2RjZkSkxzalZzblcwVDNQRG9ha1k0Qm5r?=
 =?utf-8?B?UmFxbjU5ampZWHNGT0xiYjNRdGJjUExCeWVsbEowZ085ZjdLQlNKd0swMFJP?=
 =?utf-8?B?MXZaUjJhZmxJZ3JlU1FWdnl2bTlXU1hPeHNRMzU4eUJ3cXhqRmRYN3JqaUFN?=
 =?utf-8?B?L1MzWlljeE1OZEtIdXNOT2tuZGh0TnlJWWxVOEVjUlkweEExRHNISnYyL25l?=
 =?utf-8?B?Ykt2K3hyUHVCVGlxNUp1TSt6RmFZbHpQcUxaZU12eDc4VEQrNVE1bm5tVkky?=
 =?utf-8?B?T25SZnJQWk45aGNBUXU0NktoOWlxQ3I1ajdib2hEVDJyb09QT3NSRWczK2hw?=
 =?utf-8?B?NVZtaHU5QkU5MVEwSThrZVM2VWo2ZkJ0TWdPa25LOUJpaVk4NGdyRGptKzQ2?=
 =?utf-8?B?REtiZHlOalVpKzhjLzN1dVdrcHJXK3NZeHJhamRWWkx4SE90eGN0N1N2aXNZ?=
 =?utf-8?B?SXJyRzQzT3lSQWpKSi9HeWZOVDRHa0l4QU9mMDU3RHJUbjhtaENoU2M0WnNU?=
 =?utf-8?B?R0VYcXl1N1RwdkJhVjErMERlR0tLaVFGeXBhMGNRQmhxRHFhYzVVYktHNG56?=
 =?utf-8?B?Slk2Q1JjM2pPRENkWlhYTVN6cy9teUQ0cDNGZWw2dEd0ZFY5OG9nS0c4Y3Zx?=
 =?utf-8?B?eTFKcTBvb1k5ZXBTUEluRDZYR1JxemdsdGRtUUF2MTRueVR6a1lwVkpoclRy?=
 =?utf-8?B?QjRCUkZ5QVpKR3NhSTlpWjU0bkRLcmRWWlJoRGlrbmhGVEs5Vm5MUHM0MWlM?=
 =?utf-8?B?NnY2U3RNeTZxRmZBNFZYb1hNaTUxNW94QkZWem9KTVNLUzBOWmhEeTdCakky?=
 =?utf-8?B?ZTQydzE3U0FhbzFIb1IvWHdhUmRkSExLeW1pd2wyM0ZyaGdrR0VaSDVtZEJl?=
 =?utf-8?B?ZjVMaFhNWTg3ZCswUitJa1c5WEp5OFZNUXIya3Nkd2tFdWxRNVkvNWd3bzRz?=
 =?utf-8?B?VGJYbnoydXFRUkJmSDJJOG5MNEVPK0Z1bUtlVmg4Tis2ZzQyV0ZXYnUwS3JD?=
 =?utf-8?B?VmtDUWMveE5ScnZhY2wwajNadjZ3MEFGRTV2YmdUTS9BR2dLblZLalJkWU1m?=
 =?utf-8?B?MzhLOWNOVDZKQWYwSlYvNkRwVUVveDB1dTl1cEdFcHZhdkJwNmRKU2FJZkFH?=
 =?utf-8?B?WEQwQWJoc2FjeHpiUVhtMzBwcmxGeWtXYTdqdFQ3TFBhSEN6WFJLMzVJQmlK?=
 =?utf-8?B?NGVPcjNJV0VLUkpuWWtneVZSeHV4eVdQT1g1aVdkRWEvWWp1bEVJVDlXYjJl?=
 =?utf-8?B?Zjd5bFBQNnZPdlBrY2FqMU9NYlFVZXVTcU9MV05tQ2JEd0V5cFplTFFXYXlG?=
 =?utf-8?Q?qIsyCDfo44tn36mQ=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22b5734-ac20-4dfc-e608-08df3b251e4e
X-MS-Exchange-CrossTenant-AuthSource: PA2PR06MB9176.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:11:11.9283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjLE2EM9RI6+3DwTfseOWY6jzs6d9LIKPsMAuGnUYEiUzgl44Se0J3RgZumGmKj/EbMn5H/eYbUR/yzxF1bPgc/Gc7hjv4f4AwnDjBh4QFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7197

Analog multiplexers have an enable input that puts all channels in the
high-impedance off state independent of the address inputs - the E input
of a 74HC4051, for example. gpio-mux has no way to describe it, so it can
neither reach the idle state of disconnect that the mux-controller
binding defines, nor keep the mux disabled while the address gpios are
updated one gpio controller at a time.

Add enable-gpios for that input, and use it in the driver.

Without it the driver rejects MUX_IDLE_DISCONNECT outright.
mux-controller.yaml allows it - idle-state is an int32 with a minimum of
-2 - but mux_gpio_probe() treats every negative value other than
MUX_IDLE_AS_IS as invalid, so a device tree asking for the disconnect
idle state does not probe at all. On the board below that takes out the
i2c-mux behind the mux controller, both SFP i2c buses and both sfp
devices with it:

  gpio-mux muxes:mux-controller-slot@0: invalid idle-state 4294967294
  gpio-mux muxes:mux-controller-slot@0: probe with driver gpio-mux failed with error -22

4294967294 is MUX_IDLE_DISCONNECT, -2, printed through %u.

Tested on an i.MX6SX board where two SFP cages share one SMBus behind
DG9411 analog switches: the address input selects the cage and the
enable input gates the bus, both driven by a PCA9501 I2C gpio expander.
With enable-gpios and an idle state of disconnect, the parent bus scans
empty between transfers while each cage stays reachable through its own
child bus. A logic analyser on the enable, address and bus lines over a
full boot shows 97 enable windows and 82 address changes, with no bus
activity outside a window and no address change inside one. Dropping
enable-gpios while keeping the disconnect idle state makes the driver
refuse to probe, as intended.

Greg, there has been no reply from the mux maintainer since the v2
review in September, and v4 and its resend went unanswered. The binding
carries Conor's Acked-by. Could you take this through char-misc?

Tool use: Claude Code (Anthropic) helped draft the patches and messages
and reviewed the series; I made the design decisions, reviewed every
change and ran the hardware tests.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Changes in v5:
- Request the enable gpio before the mux gpios, so that probe does not
  pass through intermediate addresses while the mux is enabled.
- Rebased onto v7.4-rc1.
- RESEND of v4: https://lore.kernel.org/r/20261004-add-external-mux-enable-gpio-v4-0-e9393660feed@vaisala.com
- Link to v4: https://lore.kernel.org/r/20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com

Changes in v4:
- Pick up Conor Dooley's Acked-by on 1/2. It arrived on the v2 thread
  after v3 had been sent, as Rob Herring noted.
- No other changes.
- Link to v3: https://lore.kernel.org/r/20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com

Changes in v3:
- Address Peter Rosin's review of 2/2. Cosmetic, except for the last
  item below.
- Say "Some analog multiplexers", not all of them, and note that the mux
  gpios are not guaranteed to be updated atomically and that only
  controllers implementing set_multiple() can possibly update theirs in
  a single write.
- Drop the _gpio suffix from the struct member: enable_gpio -> enable.
- Reflow the comment in mux_gpio_set() and soften it to "might not be
  updated atomically".
- Flatten the idle-state handling in probe, read the property into the
  existing default when it is absent, and assign mux->idle_state once at
  the end. Use dev_err() and return -EINVAL rather than dev_err_probe(),
  as suggested. Written without the empty if branches of the suggested
  snippet, but with the same behaviour.
- Beyond the review: return the status of the gpio writes from
  mux_gpio_set() instead of zero. The other mux drivers pass the write
  status back, and mux_control_set() only invalidates the cached state
  when set() reports an error, so a failed write reported as success is
  not retried. Happy to drop this hunk if it should be a separate patch.
- Link to v2: https://lore.kernel.org/r/20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com

Changes in v2:
- Describe the enable input in terms of real multiplexers (the E input of
  a 74HC4051) instead of repeating the binding text, and say what needs
  it, as requested by Krzysztof.
- Add the missing gpio-mux: prefix to the binding patch subject.
- Limit enable-gpios to one entry, and require it for an idle state of
  disconnect in both the schema and the driver: without an enable gpio
  mux_gpio_set() drove the address gpios to the bit pattern of
  MUX_IDLE_DISCONNECT instead of disconnecting.
- Deassert the enable gpio while the mux gpios are updated, not only for
  the disconnect idle state, since they are not updated atomically.
- Show enable-gpios in the binding example.
- Link to v1: https://lore.kernel.org/r/20251105-add-external-mux-enable-gpio-v1-0-e59cba6f9e47@vaisala.com

---
Tapio Reijonen (2):
      dt-bindings: mux: gpio-mux: Add enable-gpios
      mux: gpio: Add optional enable gpio

 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 +++++++++++
 drivers/mux/gpio.c                                 | 43 ++++++++++++++++++----
 2 files changed, 57 insertions(+), 8 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20250925-add-external-mux-enable-gpio-c9ba5beddd49

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

