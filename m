Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793622070;
	b=k5HZrHo0iV9ZSMUXdT7ubG1ZHiqfb/DmP6GTLPYA98pASdcLFrvIYTM1uBCLsXjtexI3
	 it5k53iSvGBLy3X/qfy26vbL3llt7rjFdejb8V1shMnIVxGSL6isIWBxw5FRT4jawhyxD
	 38zQ7eW6XeL+q/KUL3134kfRDqBN+g24qDez5wasJxnhSekn9Nk3AAEG3cDcXX1WN0fgt
	 Cf+RBSWbFA9GIfRF+NJtCNDO7o1xnDR7FvJ7H+8va2x14DldrHWY/3v0pHDgk/VtsGh9H
	 QEb5KfLiNOge4bo7IUXnYwzVY6C6bevpGHX6WR2VEk1RJ7viXXfucvu45aMbSSMveVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622070;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XOXxJKF3gqz8moD2Dafc/GY7iGEiYVPx9P/Wnn5cXJc=;
	b=TqKyVGjM3UF57q3DD4EIbMVYgjKlp/TvA/IwLhGwg2DxmVGU8JUuyQjWmKf/qnU59Rwt
	 3Mh2cDfX9bBJ4dvVUUvTByflrZbU8fdh69topJ43dRO9cjBiEDworBpTrgzVWzLNidSNL
	 L0bpqr9A0gBX//fpC4PYbE1PwmbE7mUrP0nJJy9z1Ip16M/wTQIC21RZ4F55Qk/Cfbu9/
	 Q5njFAHWKtC8Bz7yGZL9hVJ0yRoOd3nJefofGHVmLqLjybk9PT/czKkFo+a+e+co1oh0S
	 PPtn4VopbQ7Y8sgO5avlDx6yQ07OPzQvHju7RuigueqqwwsHVap2zmm6AvWrFTxS1qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=E8VXXNUr;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=RZVFJ2NA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA3606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46BA3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=E8VXXNUr;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=RZVFJ2NA
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29BSZB3725725;
	Mon, 2 Nov 2026 07:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=XOXxJKF3gqz8moD2
	Dafc/GY7iGEiYVPx9P/Wnn5cXJc=; b=E8VXXNUraLz2WRyo1kWGyJ6hymggOxe6
	OJq9m9UmAxocA9AajunSJneUUVkaJ5a7n2eRh04ghEjTBqki54xeeUxyzJLf+ycu
	okpnvy2/yOJnhScRu0V50U9HsNV+yFPhrE2Ps9KRGunxiHCKFocV60s11zEPXOmT
	3w5Z7sCR/0Ay43eYrvsGs08upwbZJ8nURfeRAibxNUdB4ybljj3tfojWGccqmhnZ
	fvxF8A4C9FRlMkrAan4ePiNRbKDpJFnNBAgG+3SFXCpfsgA6nZgMa/yxvfLqIy+N
	2vuNNl172yQgckz8pAlBb7izzNWh3obiEQ+yGyG6ehhuWDlsaReM/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=XOXxJKF3gqz8moD2Dafc/GY7iGE
	iYVPx9P/Wnn5cXJc=; b=RZVFJ2NAmPZjBCGj39S45zVq2/ihGSDHSPi4FgxcBZX
	dCiXYY2psJDiFKHRsPagqneXFPrdnAeE+d/Mn3ZEbTbIGiMswoy/nDLu4nYrZd/8
	y8ZDQAzCXTNplSkm9L0g+26qp7/hUnJ1on7WCQW/8dAi+7H481BCqD1k+0fwX8gm
	cd3wnw7ZINvAr4PMiSNnk5uWvUc/czRypp0NYDmlST4fKkwZE2uq2duSfzl+o6/O
	RBdzeOexLzKzv9MQ8AuN8bMJSSq06kviFLCilXl3xC9HPbraCtZaXoAnFg1FeExk
	ops1Kl1Ir+yv/dIPJUfNMlONgK6ha/J6+vUVmoj8E1g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hp1tnn74x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 07:20:32 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjjGZwarbdkIAri/XzeAd9gw3mOsDWkG2WATbCCaBX7Xn83HIv5CLIQB7h/X83qCHnQm2/o4hD9zhg/7NxCYe0f5imA4zjcfYkjNPdz6CeS5bmyyXj62tLA1uuqvVPDHTcpqyYJQSUUNO9KfeGLFDvdTPgZWPMJ9bB699q7KprsyP9XhB5mzoVVqMEanUlFtxw7ZYBBJBRH3Tn0XFr/hUmw5cfjEbg1I+lDgg3rN68hBcn3fKoSIk+tSPyBlf0JiYP4BwcI3lDOdWWFbPsP5Anj+c20JEL0GQ6jo2fgrjxicOp8fyB6n6IzQRcYM8d6KS4xDXrye9RjPx4P8ItulPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOXxJKF3gqz8moD2Dafc/GY7iGEiYVPx9P/Wnn5cXJc=;
 b=rMEpI15DVbjhTiDfr2fv6DqNOqh11vjQdJQuQzA8uY+qmsfVs6udcMONmu+iC+HNuFjXlv96jCrOVc7yQK224XRqoO/n71zt1N45edNxK6TanQOjQe/O5/gcbEvAfyxAE7K+Wi+QwSEMNF352Dl0JikbcMlQ0oCLwUtoVEbanO+6MZpEq7EBpkBcOcwOufyZOndKx77j6OyaKVPh797+HoGSEwCmWEq/sXlaNajmsA/Olxxipkj8cv3cuxZI+PtNhQh/QgfS0T13aae35R7wRQgE/vOAohbsb/xl3RDGGGB0LtVPfMQPdfnVKmQq7jv6Gxh60suYn0OD1q/8rsKSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by IA5PR03MB989655.namprd03.prod.outlook.com (2603:10b6:208:604::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:20:29 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:20:28 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Mon, 02 Nov 2026 12:21:52 +0000
Subject: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793622112; l=10871;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=6WaZpN5/MJ1zfbg3rAvbr8ah6WEuY1JroeJb5pRLxmg=;
 b=mfIYWjghSRF3/F68qLkbM6WbCOiJA7wZzFIvW3Rp5HxasHMqyAMLwvdqQmzVE1N4Vb7cKLBUU
 S178+m4ZdDwCu8ScicL5ShCTDU1Do9Rhwj8XJjbHkV8VK+q7Me2Tzu+
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MA2P292CA0021.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::13)
 To SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|IA5PR03MB989655:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cf060d-c02a-4a4e-be70-08df38dbae68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|18002099003|3023799007|56012099006|11063799006|261021121427099003|261022075727099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261009220027099003|261009223327099003|261009221727099003|261009221227099003|261028144727099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	6bBOSbzOIBvDgMn8XWt3EV9SiX0XzJyIX6Zv5KdB1UAsnDiFvVvHjUUWBEHn79a9rb/XMMZypFPqUR8VdW0Tn/KfAO8zuKztrXwlgmCUJ//y0J7t8visDLtqjHhz2YWt8tZsCl0r7wpVYCecOCPfu6UvYHHg3lg5wVO03pTN6rcK1lVlajUEs3XJO1UhqAuU2ZMw7V8N3X67nLY/lD5XVnmeKCOUBn62DZ+One3HSEsvn6rWeB0ZvpQDcyah21u17mUGCorRxRWwbnuK673o+X0evXRoMU460Z+1ZYitZig5sXtM0kXm2dWbxkRuDorAe9eVV4b817YO9qqxNKhz09BEdLkBD66M6ePnHr0i1aA0HDV2pJsIUpflFBBS/ZWvSRPr1+P6jHkFMnw91uOsCNuH8l3esbYznX2vxXk4d5CVEqM4BGFYIn5QCZm4TSEQdmgrU/8n9j77yi/rFlfcNpoFdbP/MX3UX5JDLprSYCUEmMzDB6XgfYlAnl4KSRZPkdrL9/8mN/hnvuHZFD1FXWSGafbTt3vDzUeBQI7Ybd1fQyNrYcmeEZrRpFK6ZCWkqCsXz6zOv7H88YZ+BkpDcSUri+MkyGWB3mwH5FSzG6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(3023799007)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261009220027099003)(261009223327099003)(261009221727099003)(261009221227099003)(261028144727099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXVONEtkVys5YXV5QTRKU2hRMWFwN1RGWUptVW1lWDB4K2pkTDhTR3plSll2?=
 =?utf-8?B?K0F1V2d4L0RhNUlpQ3QrUmswZFMxMTZ3d20rbGcrWklIdXo1aHdUVEEveVFu?=
 =?utf-8?B?NHA4cG1Lc0lFd09SaDBFYWZZcHlRUE1oek9wbHhjc1dsSnh3Nm02R2w0L0hE?=
 =?utf-8?B?UWxPNzFTb0huY004emRVUVg5bDJJWWtVamEya0N2MG5NY1k0N3VOOFl6UGhZ?=
 =?utf-8?B?YnYzdGxVcG1VRGJvQU5yUThRaTgwNXRjOVVCUmZSMEhucndILzg1bW5NUFZi?=
 =?utf-8?B?VVhkRk8zSWY0aHV0cGZGci9xWG1oby9WaTJwVndzN0s3K3IzY2hsNlRTZWpq?=
 =?utf-8?B?bG9pV2FieUVtTEdxa3A5NXBBUW1nS1RpU3AvcVhXekJJZHd2aFhQVnVaS2pG?=
 =?utf-8?B?MW9kWTRvcHpZTmdzalJEV1RON2N1bjc4TGNrdFBwN1czVHYvZGdkS0ZKc2FM?=
 =?utf-8?B?VTRZSFJXNnl1c1FveTg0MXExMnNGZ3hvYlpGUncxTGJvMGUwOU8rUTNNdjgx?=
 =?utf-8?B?VmZ1QmhpZzFwMTRMUkVGeDlWRnRNdXg4eU1XSHZOdTBzSmt0eitGMEhCSVlq?=
 =?utf-8?B?M1BZT3BTRkhzWSsveldWbHcxOWI5WjVGbFVRMEdzVURLcGNvblpKVnpac0ox?=
 =?utf-8?B?WURIbE9MVk5jMXNDdjFKc24wQWhmK3hSNFdDV2ZBQ1gvMGJZSmxWaGpPZFd3?=
 =?utf-8?B?MzhlZllUTStrOFluMWRYUytENmVtQk5mWjJrZlg0TDlBQkYxcFFET1BFaE56?=
 =?utf-8?B?V0dxNmliL0RpNXpQRHpOTXhlOEgxSUY3NWR4R2c3S2dEQVdvQ1c2dGFkQnhS?=
 =?utf-8?B?V1dKR0xsVGxwRXY5ZzhBd2pPaUdUK2dDQmV5QzlXV2NtOHVkU1laSlg1U0tV?=
 =?utf-8?B?akpPYkN3Y1NNR1NRbTFjQlZKSlh4WkVkSlVGNEhweGUzdkJKYUhPRCtrUGVl?=
 =?utf-8?B?VEladFpoa2VLaFFCNytoVkJwRkhmSW0xd2crZGNLM3NLUXY2MkpYdlBubFVi?=
 =?utf-8?B?VUNpaWlhdG5NY0w4bnhHZUhKdmxpeVdRTDNNTENFdWY1MWZXTm1YR29Lcy84?=
 =?utf-8?B?YzBjenJuOFY4YWZxME5nampQQmZKTUVGVE9OVW8wSEJtVjJHR2NDem1xYkZZ?=
 =?utf-8?B?UWFpakVPcDNJbjZ3Tm42MDE1Vno1eHpFejZiay9oV3gwNk1YNDl1VTlaVmxO?=
 =?utf-8?B?TE1BdlQ1WGkrc01qWlZabmFma1RhdmdOb3BFVnJYaVhCdW1XV05nU0JHcGVj?=
 =?utf-8?B?L2VWUFl3N092dEM1bUswVVJDVGRhWlBpOERYc2dsSzBHKzlLdGNnWlFNREJR?=
 =?utf-8?B?bktLalVNNndZekt5OG9mWlVkYUViTi9vOFhPV01Fc3AzOExzTXFudW9EQllo?=
 =?utf-8?B?dUs0N0N2aEpOSFNkQXBzTHBCVmZudDlTTnduTGNxUWF1aFZhVUhWZWVNS3NL?=
 =?utf-8?B?LzJNRUNITldGdGJaTCsvRGhZSVpTRGZwVXlsdERIU0dpcmhvRGhZOHBCbTIr?=
 =?utf-8?B?SXpkTHdMOGdqRDVRLzVYTFdXdnh6em5WTU8wYWFkSVE0UXd5Qm5DS0FuLzRQ?=
 =?utf-8?B?TjU1R2JUTWN5NWh5RmYzcm84MWorUFdVaVB0enZST1JhbndIWStIalRxa2pz?=
 =?utf-8?B?aUZzNTEzVEhFbDA3a1RiT2dURHA4VkJ3ejNJcHpydXNKSWxLOGZ1WjJpeWlI?=
 =?utf-8?B?VzVhZEh6VWNRZXlHN2lwWkZsL3FYMmlBSnAzRnVHWThnWi9Wb2Nhakx4cDNi?=
 =?utf-8?B?QUtJYlNSbHRmVU9JRDRrbGVYT1I1U1ZMY0hycWZ0MWFwR0Y1dFI3OE1SWkV6?=
 =?utf-8?B?UER6TWpKdkNkMFR2dmhDOUFEd3BwRUE0WlFzVU4zRUh0ZnlmMGJNcnRGSXdE?=
 =?utf-8?B?YUI5dTZBRGdCeERsNEVTeXlySncxVkdPWUdnUHhiQ1JJNUFaZ0RzajY5Sk5B?=
 =?utf-8?B?Vmg3UjYxR2trQzhreEM5eUMxaDJqeWxCelNyU095VVhLdXhyUlh4cHBLVmpZ?=
 =?utf-8?B?NTRSZnJPVDh0UVJUdU42ZGNSRkpIYWg2YW9aUjRXV24vQnZ6c3kwVVZhRTVQ?=
 =?utf-8?B?cmdJSWo4NURRckw4WFgxdFJrczBxcWpxNHpZQjlocHVBdmVmUUJZVUxhdGsr?=
 =?utf-8?B?Y1Q2b2NiL3ZrcnorOXE4ZWEzSFpRWkRuenRXaDR2cEs1YjBLRVZtK3FyRXhP?=
 =?utf-8?B?WWg3V200YlU2UmNML1BJVys1a0hkRzhnWjQ3OHZkZ3V4WkNmQVd6T3Y1RjZ3?=
 =?utf-8?B?SWhxK1BVTlduclBwQ1NOWWxpd0xVQmVPZE1IcHpOSFhWT0cvd283Q1lsekNo?=
 =?utf-8?B?RTNxeDl0emJxc1gzM3Ixa085REU4WCt1SS9BenRtOXpza2ZMMUg2Zz09?=
X-Exchange-RoutingPolicyChecked:
	kc/zbpO+kODl1oDZuKSMMAkTwiX6QV82B9s/snPqtJhwKiCX1E9arvfL7OImL2EqatrfKJLY/mJJK0K3RuHi4nC5zYR9Vb1eCMRbwKIgNl4GXm/tPrfpc7u7bBxgeZUNq4TeA6Lkzk6Yo0wORNOnc81PIcmw4O5jfh4jW7koJGj1Abuk+DkC7WgYJhG7YPSn4vjxDHQcr9QEurpyzdOyxWkUpLH+ozbTlQE79HkYH342+6kmyRqy8A2M6ZVwr5N4cnMTYsM3R+m5KJx+N9hfmZEn9fIv0ysCIkSmTTtsLu6YkOdD7ZgT3MQMEZGnTlseY9VxX6NV89TdKv8im9wBgw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cf060d-c02a-4a4e-be70-08df38dbae68
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:20:28.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/hQwqwEqI8rl/Z7mOZVZsW48J7eCZ5ckOpcpAe/vEzf2QDOL1QP9PMnnjh6UWCtMd+EpI0K9HyYyv3Olzy+EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR03MB989655
X-Proofpoint-GUID: C_NoLA0HSZo4WHYVF1DVZxn2ioC8mXKO
X-Authority-Analysis: v=2.4 cv=BpEIUoX5 c=1 sm=1 tr=0 ts=6ae88010 cx=c_pps
 a=Eox/QAxx2gIfswQ7UCXYtg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8 a=PVkDEAEEmQ6aH4wvTtUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: C_NoLA0HSZo4WHYVF1DVZxn2ioC8mXKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXwTWD+ma0WW5W
 9NOr9/1yRcduKepd3P3g4LSdj0vswE8vVoRncTp2JzZmWZ/2Y0/7SkTeOEqfJ7w9iIui0UvreiF
 KbneBb3RIN/91/zrJLBpcRzo5rY2qrFxy+iU1O0Lt9TK4q7ievQXy8l0Yz0gKxjC45pgRMla6To
 oYSxijixQI7puG3Cr9ewd1jnJJvvawSQwuY0D8e5ZIHGfA+pPCj8vwqwb0OnvzDkUGhfuoEs7FG
 v2hSxpjKMfmLlzXnWqjmqhnqUiLdojmycF98XNbTc29LtNWJuju84nfhNf2NmqS92nvL99ndmbp
 XFXXubhQXB0znHzUiqDGHM2w1rVazEZbrx2/4WjYTxdxseUuCnIQBgACCOqwkJUtCzBAnfC+7V8
 P4DaSSj23S+O1Uj/EEPIdYIoV12NAeWSM+P7AxSDzFmMkc86/4imGcBbEM4NKwbLiXJoJ+QAwGv
 kt9eFpW6II7IbfIYOrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXzGFSLxJTIbD4
 0Bpn5/k5Q36FzMEdXFZMGhsETa/5k1lIseq0uYbeaqLeWrqvPiAkoPi9tiDrbKavtPxd4TEcMlO
 LbUIDXrKT63MWzudf8MFbx/cClEr46NgCxCmGeEZOzWoSMi8ivPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020048

Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
The part is fully described by SFDP, so only the flash ID and a small
post_bfpt fixup are needed.

WRITE STATUS REGISTER (01h) takes a single data byte and only affects
status register bits 7:2, so the default 16-bit Write Status assumption
does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
path is taken; write_sr1 is already set to 01h by the BFPT parsing.

The flash also has no Status Register 2. Configuration registers are read
with B5h/85h and written with B1h/81h, and the 35h Read Configuration
Register command does not exist, so clear read_sr2 as well.

Software write protection is done through the block protect bits in the
status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit at
bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to get
the generic locking support.

Note that given that the Flag Status Register (FSR) handling is the same
as in some micron devices, were're adding the issi chip directly on the
micron-st driver.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal
NOR flash.

The part is fully described by SFDP, so patch 2 only needs the flash ID
plus a small post_bfpt fixup:

 - The flash has no Status Register 2 and does not implement the 35h Read
   Configuration Register command, so the core's default assumption of a
   16-bit Write Status command does not hold and SNOR_F_HAS_16BIT_SR has
   to be cleared.

 - Its BFPT Quad Enable Requirement field carries a reserved value, which
   makes spi_nor_parse_bfpt() keep the manufacturer default quad enable
   method. As this is an octal-only part with no quad mode at all, the
   quad_enable hook is cleared.

Changes in v3:
- Move the IS25WX01G support into the micron-st driver and make use of
  the pre-existing FSR handling.
- Link to v2: https://patch.msgid.link/20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com
---
This flash is populated on the sc846 board and was tested at 125MHz
using the cadence xspi (cdns,xspi-nor) SPI controller.

(Note that in fact the controller also needs some patches and a new sc846
compatible to integrate)

cat /sys/bus/spi/devices/spi6.0/spi-nor/jedec_id
9d5b1b

cat /sys/bus/spi/devices/spi6.0/spi-nor/manufacturer
issi

xxd -p /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
53464450090103ff00070114300000ff84000102a00000ff05000105b000
00ff0a000108d00000ffffffffffffffffffe5208affffffff3f00000000
00000000eeffffffffff00ffffff00000c2011d80f5200ff4462990087ce
04e22801273d7a757a75ffbdd55c000070ff8170f8a12fcb278b00008401
0082080000000088ffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffff430effff21dc5cffffffffffffffffff000b801e
b181b58500f0ff9f500a000028d55a8cffffffffffffffffffffffff0000
060100000000000081050000e70000000601000000000000810600e70000

sha256sum /sys/bus/spi/devices/spi6.0/spi-nor/sfdp
a1fa0cab6324b45a17e6bd7fc7e581496517d558d8c7684cc85e57a5dfe5d87b  /sys/bus/spi/devices/spi6.0/spi-nor/sfdp

cat /sys/kernel/debug/spi-nor/spi6.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0c
  mode cycles	0
  dummy cycles	8
 1S-1S-8S
  opcode	0x7c
  mode cycles	1
  dummy cycles	7
 1S-8S-8S
  opcode	0xcc
  mode cycles	1
  dummy cycles	15
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	20

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-8S
  opcode	0x84
 1S-8S-8S
  opcode	0x8e
 8D-8D-8D
  opcode	0x12

cat /sys/kernel/debug/spi-nor/spi6.0/params
name		(null)
id		9d 5b 1b 10 01 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET | NO_WP

opcodes
 read		0xcc
  dummy cycles	16
 erase		0xdc
 program	0x8e
 8D extension	repeat

protocols
 read		1S-8S-8S
 write		1S-8S-8S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (128 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

mtd_debug info /dev/mtd4
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 131072 (128K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

flash_lock -u /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug write /dev/mtd4 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 1024

flash_lock -l /dev/mtd4
flash_lock -i /dev/mtd4
Device: /dev/mtd4
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1

mtd_debug erase /dev/mtd4 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test

dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out

mtd_debug write /dev/mtd4 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash

mtd_debug read /dev/mtd4 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2

sha256sum spi*
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_read2
a1230061123719295de1df8c401601e7ba2c6b163ab2d324d5d254d83ca71108  spi_test
03781ea58ffe95ed666f174f7804b84999f525516595c1ba0f99ee83eb8af22b  spi_test2

show_sectors
locked sectors
region (in hex)   | status   | #sectors
 ------------------+----------+---------
00000000-07ffffff |   locked | 1024

flash_lock -u /dev/mtd4
flash_lock -l /dev/mtd4 $(($size - (2 * $ss))) $((2 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fbffff | unlocked | 1022
 07fc0000-07ffffff |   locked | 2

flash_lock -u /dev/mtd4 $(($size - (2 * $ss))) $((1 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff | unlocked | 1023
 07fe0000-07ffffff |   locked | 1

flash_lock -u /dev/mtd4
flash_lock -l /dev/mtd4 $(($size - (2**7 * $ss))) $((2**7 * $bps))
show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-06ffffff | unlocked | 896
 07000000-07ffffff |   locked | 128
---
 drivers/mtd/spi-nor/micron-st.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f97f2dead8c2..eba07efdca75 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -216,9 +216,34 @@ static const struct flash_info micron_nor_parts[] = {
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		/* is25wx01g */
+		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
+		.sector_size = SZ_128K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
+		.mfr_flags = USE_FSR,
 	},
 };
 
+static int is25wx01g_post_bfpt_fixup(struct spi_nor *nor,
+				     const struct sfdp_parameter_header *bfpt_header,
+				     const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * There is no Status Register 2 and no 35h command. And WRITE STATUS
+	 * REGISTER takes a single data byte.
+	 */
+	nor->params->opcodes.write_sr1_and_sr2 = 0;
+	nor->params->opcodes.read_sr2 = 0;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups is25wx01g_fixups = {
+	.post_bfpt = is25wx01g_post_bfpt_fixup,
+};
+
 static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 				      const struct sfdp_parameter_header *bfpt_header,
 				      const struct sfdp_bfpt *bfpt)
@@ -655,6 +680,7 @@ static const struct spi_nor_fixups micron_st_nor_fixups = {
 
 static const struct spi_nor_fixup micron_fixups[] = {
 	{ .fixups = &micron_st_nor_fixups },
+	{ .id = SNOR_ID(0x9d, 0x5b, 0x1b), .fixups = &is25wx01g_fixups },
 	{ .id = SNOR_ID(0x2c, 0x5b, 0x1a), .fixups = &mt35xu512aba_fixups,
 	  .fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE },
 	{ .id = SNOR_ID(0x2c, 0x5b, 0x1b), .fixups = &mt35_two_die_fixups,

---
base-commit: b1fbdc83612abc9281304e5b000b93b106eb3733
change-id: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
--

Thanks!
- Nuno Sá
-- 
Nuno Sá <nuno.sa@analog.com>

