Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86161560AC7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082982; cv=fail; b=lCMqq1QuMB2vNBkLnOtajfMfBBQek9k3u7aAbZU4+MShS1Uky6SONGqoscUKddz9FhOiQ6bUk6V73BLvalqLETX7vCfzq9o1KEeQUt6/+O7z4Vm18yJfaeNsP3qm4XZi6O8v7oL/LdK4tCDqJN/sqL/LREZ+GK+wAOW95ns3I8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082982; c=relaxed/simple;
	bh=0YLRQo6IsCiq5QXaSMxKtWH5piQrOuwrWmPYaFyBvbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uUGU5kUI/VKMO8269YlZ6yQa3YUd47PfdtU7jVCHcq9OGU7nXHj/CGPbPQMMKcX9m6pYZCBQgoLIb3xJKvLRxvFcOS/OR41X5LXs814D++OZ4YRcUTzDkDKYYSIYIni1q8W5XT4KpigEjkbyIWOFc1WXmZ78sEme6vTLc39ybq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qBGfObhL; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qBGfObhL"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MC6nbD3070418;
	Tue, 22 Sep 2026 09:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RGg0w
	f4I7ORu3eddFmFaGeQS3WdRUs2HVlRmx/5h1GM=; b=qBGfObhLdtt2EKOhNzoRB
	GKHJR647iflNCVJ6g8wA7mKE1461IaxiUvO5q1BDqYB7+wT4zE60cz+EFWVVELIq
	4hUylAou4kNui2P2y/pICoowLVR/Sm8R+eCMuQsdsKOi89mwXPQIGz4Mfr3HUv16
	6p7EBgd2OHvyWpWdQR1/WV/gfAx1Ehi4G9OgZff8U6o+KrQIktsqt/tp1QVnfdd7
	IOPQZSD8FJOVZlCKFNTQm+9E0OsjbVPJFSIsjHinsgOK1jNErmozZHX7XyrDIe3w
	hTd/CIG3MS1ORQ3N+0pfF/r1TC+UR9z2n+Ffj6v3jnnkQtJly947ESEfquKv5gL3
	A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gusd2ra09-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:15:47 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvKDXTSDsBFKtpbMTLEFu9yRHu3hL20NzXtFpOHFRYEEFnvJUg1H+oPGv3GfPPsTqf7j8L65HxZXM/rL6vHDsA17Se/+80DkRxr6F1p3dPx53/6qai0HHQE/d2MGxjup0rllYYijJPEMXMGVuQXnZdliOF/SIvoyDjI8c6n4ZA+QvBPlKhx7uT/oZr4lxfQdDi6Nq963pYXUCaohWMTVhK/RBO3yXtEjifmZadE+oc/UFW3f2EN5Njud2VZ4u5MLhUFoOwG5Lehwd41f3lDuxHYP/KRQSD1N2JqEasfOOOMbzshhat+cSqsj51jlQORkbclSlkGVWaeMa3PYxEiR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGg0wf4I7ORu3eddFmFaGeQS3WdRUs2HVlRmx/5h1GM=;
 b=n0qdCGz6wgldSxQ3/whcc4+XILD0BDrNpxQJBT1a7uUcHMjhSnA+RobujR+NF6eeXsqCn/JjxwZTH3oAXu8t0AnIc61fLNOQE3nul7GK5e8V9y0w/dhh4j6Qne3jTZrtjWK3YiRKbbN2To6W7HXR82+CE6KfLaCamEl89bBDuUvhVKQ7a4q/uKGC8AsNGyDXIEUMit3bxhX5T5to1rM9kmOsviXo1mIko5jTbjnWNytBIoxL6TmfkDMyRDiZUP/q2hLNcyXiU3SxTSYwry95E5y0lSeGBs+VvbjmGBiLXeaFzK43K3/sFk5JWP0QRgFa9kgXQX8zLOO1KcIgUFVpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by EAYPR03MB989252.namprd03.prod.outlook.com (2603:10b6:303:2c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 13:15:45 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 13:15:44 +0000
Date: Tue, 22 Sep 2026 14:16:53 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <arJ9bO6O5laKQpZN@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
 <aq0MKTz6KIx8N7ZT@nsa>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aq0MKTz6KIx8N7ZT@nsa>
X-ClientProxiedBy: MR1P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::7) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|EAYPR03MB989252:EE_
X-MS-Office365-Filtering-Correlation-Id: 21043e84-5c3b-46c8-4cce-08df18ab9baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|13003099007|3023799007|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wjnW5MBC1uCYL/nhYJq8wt63GLygrEi9E3U9v45WFQMa9UFI8Cbr1c3IHEM/oDnpStcYV5VtMvvVDHW6Usag8+ehGntamgwH89FdqoxdXjliSiP1kAjRCNKLNviMA1pZPef0jfmPZap0G2DLoNkaKZk/bE4O7lzWgRELgxyVrKy+2yHbxIZeyiMppGPzTIP6di2o3pNOYKO0ZNHuDxlRVWsB9MyoyogmLCINBOxdq0ffhxj69odxftYtBRDGskJnbyZkLLnqCImJ0QWiihjBQ2O7QSh1zafPmregHR0cQ6Dhf5PjgPopuu6eDgts6ntE2C4sSEZJm2UnGh2RN/Vok5KxGvVnADiuyd2CfBqNSX7mmvsmuNgLGHI6U10W2HPFrdZVuEX5t/isFQuutHVZUOVf1ZJYm2BnLGQAFeKDwiYqK3yr00qC7aRQuwheE5nlKFomchp45FOn/jyKLiX/lzMuuwNFgE/q5SD/RB7G/q2tTN8rV0q118Mkg5k1sRaejRFEv/DrLzO7M+tqHMjB6p8lrLQcqvkgfdS9uSHRx5ilQp5Xe4QhPoYmkYVPesWSrLLqMCQ83HT6zNH7pSfhb43W8BLFuKbSgZJ2CLinjUU2PJguBVYszs6Qf/sclypsUYNWTU2fcCLuHb1HiHPjTQo+M6IDkfbvg2badQx7hnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(13003099007)(3023799007)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzZWTzZtY0pZeWtQd3RKTVA2RmN1Z3ZLM3ZocHhKb2ZzeUNkNndJMnR3MEZx?=
 =?utf-8?B?a3lMaktsdit4Q05yU2RmZGNnSFhDM3RPcFdQL0JScFJiTVRYbzhkL2pBeW1W?=
 =?utf-8?B?K3g5ZGxRTEpFUmZwakVtOWhSRFRuN2NYbktwdDlseTJjNEJ2S1VnSytVdkpx?=
 =?utf-8?B?bDI1Qkg5bkV6ZDdwc2oyUFQ4MFpvR0NBNnNpbHdnbk9rWkZVazFFL2h4dUZ3?=
 =?utf-8?B?SExyS2ptQUNPdVgzWHFYYzE5aFJUL2J3S1dKbVFKY2xNYTNjVk1TK1cwa3F1?=
 =?utf-8?B?dEx2eWJJSDRtQkVNOEdTT29vcXpNejhiencrMXhGRk94MU15U3BOeDJpQzRy?=
 =?utf-8?B?UEdBY2ZidkNmRlpwMytadjU0NXRsaUZOOGtBdndOM04yUHN0NGFkTVBhZHBM?=
 =?utf-8?B?TVpXRzVVOFFTeG8xTlFZanRlR1JHZnl5YWdHcUNSY1B0dERxSFh1RGppeHJ3?=
 =?utf-8?B?Vld6RmVnZnVnUW0xYWtMcnhXbFNuS2pjbTRMR1I0YjRxdWNaODZhcDV4dmZa?=
 =?utf-8?B?eTdnc3g1V0NCeGllQWdwOEx6UWJhQVVnbWt1R1lJN1REUzllVmdFN1lneGpy?=
 =?utf-8?B?SGlMNGlSdi9Qb1pSUkw4MzFaV2diUHNDRVVKODZGRGw0YXEzQ3MxMDBVQVZl?=
 =?utf-8?B?bGZDR20xNUVNQU1BQlFLU2Y2OSsxQ2RnQ1dnRDV4aXhza1UrTy9OMFRDRUJz?=
 =?utf-8?B?MUExVFVKemZXRnN4RWQ1TTA4Q0Q4NWRYVnd2N0RVWThPWWMyZ3FuTSt5R093?=
 =?utf-8?B?RXNUd0JIK2pIMFMyaFlmbW93TzRXQXhFakpHT2plTjVPaVROOC9hSGpPS0lW?=
 =?utf-8?B?Mlg2RWNrZHNCWS9WVGgrWUM1RmNmZzc5YVZnOURCQlVyNnVjMTdsTWpNb29G?=
 =?utf-8?B?NUYwV29HNzFuM3k5OVVqT1Q3NzE0b0IydjB4a3FXN2dORFZ4Y1NvM0F3QTRo?=
 =?utf-8?B?M1ZhUW9ZRDM5L1N5WnNEMzRrOHByMFNCeTZiY29PZ05uTDY0Rzl1N3gwc1Yw?=
 =?utf-8?B?NGRRa2dvMWhHYkxKamI0MklSSE5BZnVEaDA2YnFsSC8zakZOWVQ3YkRSanBM?=
 =?utf-8?B?TzRzanRlVVAwMEJ0ZkhuZTBtNWdtOFh0MFlkVHFwYjFXTTB3Z2NGWTlMZGY5?=
 =?utf-8?B?bXgrTHhEbHJocUtjNE1iOS8wRnBiUi9qVERxVWZrVzk3eTE5REhsOWFHUFdi?=
 =?utf-8?B?MndMYnhOK0xUNXVwZHFSem9YOEV2aFhoQ1VVblByS21jR0ZHanJLUjFYUFF3?=
 =?utf-8?B?cUxqa00xQngvNlo5ajF3TTdjalRCa3duUEJ5ZEh6cnFyOHIrUVJldzY3VUdN?=
 =?utf-8?B?aE92NE92dEJEY3REUjFsaEMweVNBa3ZIQi9jZGJaV0NWTzg3TEFWUkVwUnRv?=
 =?utf-8?B?WjZUb29GQlMrRXR3UkZ6cmx0clAvWUFFL0dFa1BDSi94aVp2bFR6eUtpbG5x?=
 =?utf-8?B?N2J3akFDNmJQQzBtRmFiSmUvYjI1RTZUN0VMenNJLzVRRjNaTGpnUzJTNm5T?=
 =?utf-8?B?RklNZ2xESlNZNTQzL20xMmpCbmk1K1ZjcUM2cXREK3o4c0V2WEVabHA4SGRJ?=
 =?utf-8?B?SVpSdld3VS9JL3lkNmRGcWJXOUY2dWtaVjM0cDRjNmMvYVRXQ3JxM3NSVmJX?=
 =?utf-8?B?UEo2Z3BWK2R1bzVRM3prUDlGVHg4em82SDRNME9uQ1hLNkNQNEhqTkNxS1o3?=
 =?utf-8?B?djlMeVZCbFpxbnZvTWlBdWl0cmZ0VGQ5ZFdsZmZKZ1MzTzZoK1FTN0psM1BF?=
 =?utf-8?B?OUhnOUkrZDRFNGhibEdaalpQYk1Sa2hvMmN3WFlJdWcvVEROdjRycHc1aVZp?=
 =?utf-8?B?MXVPSEJKNjRUTkdzcUl2ZExNbHN3Rk84cVRnSXo1T2JWTlhsblgvcFhvWGN2?=
 =?utf-8?B?WERaam8vY1lZeWdGR0hrZHBmU3MvaElZcDB1dUdHZEwwWHA4dmdaWVh1QXJZ?=
 =?utf-8?B?NGlOR0poN2xxaml0NW4yKzFpbUFrVW5YeUNwZ09xRjdabldDQll1TnJFeEtF?=
 =?utf-8?B?YUtMOU0wWU8zQVd1blN1dXVJYjZubzZTUWxDVzNSUkNmTm43ZXN0M1F4SGxu?=
 =?utf-8?B?ZFh6ajQrclh2M1ZCVzMxelNJRFlsTVRNU1FDa1hoK3FldVNwM1dTMTV4SWE2?=
 =?utf-8?B?a2ZYYkpCTm5Rb2tIMnBhRnFBWTB2bzJqTHdvTjZPMzZWV3B1MnZ6N3BwQjBE?=
 =?utf-8?B?eXY0Tkd2OUg4QW9RVmpsZm9FTFBSYUllcW1OQ1RKWGpYQkZvK085bXFncDZU?=
 =?utf-8?B?blB1dVZ1OVo5R21ZamZmK1hKakIzVnNHMG5xMEdhZlBIZ3VoWkswaE03VUVP?=
 =?utf-8?B?ZVdRbGJXOXdremF3bHIydmw1VDNrUS9DcndVN3NDbDRZdkVqbUljZz09?=
X-Exchange-RoutingPolicyChecked:
	znscMXxZbkSinXlyemQiMJc/zzhSPc0SliNo2eXZAT2RR5Qk9VYzZcv4BZ9Tz+pQJfLPWpiO8zcAgesNVi2gtrOVNf3lL/Oa9QT1cQAyU01QJCx65/DDXHdS85KZPhs2JyGX6n5/OQpVp/lHwYCUFfmE6N1RCInkEp2mQDdCWIcLj2Ob3sfyMk6hT9yMlpogty9RFxZYtTBAQOyJKRpPxdyvHImu479prk8t3CItN/uZ5xv83gCAq5efGziYBTSd+yoNhiuvHZa8utEaOVTXNNij3NWThIYRQ54UATdMrf2coNCBjQO2AtbyX5i9ehdPbv8YsOA0zetJ4oDebamI+Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21043e84-5c3b-46c8-4cce-08df18ab9baa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:15:44.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4JBCTBu0VinCV55T1LCD57Ipp6EwWjgw8sjZElcCUj4uI4iAh5IOjUlahuIovQE+kkTlUYxh1uzPVEFQ6JarA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989252
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE5MiBTYWx0ZWRfX6JSfQaHfRPcx
 sK4XB8LskBvOkh1KNeaB0jA9x6ci9Sxb7DRDyTgyrHoitHw7QUinUu/R4WqvdaKO8FarIEddBxT
 9Jh3XGFO/8sHT0AXFT6WjotSFtYpoHzoE1aIbhWWX9o1q0zHSTJSu5SLODvTkXeim6rCqy0YKDK
 tb7Y5AziTXRlCej/zZOXe6SPaCbPZn0AWe72OaMIHoAFwUD5klfqyvivno/uvl1lLrYAESJISnV
 Qmi9IS2BA7bgZExGF7ASFg1Gy/8aBF4ii0TSidkpZlH6HaCnrYEP+3sgTSJNi2mo2f3/U2aMFWi
 SgeHHzXhPRqCX80aC1kogz5yJNzQkJzkludz9Bn+++qbxD0+wusytPNBsIdGZ2so+qKCCpncI6b
 lQKtLLbDcCcIoQa4UTD1RHTm77QOUXpXDIR5wT/lOYjwkVrpdh6lxEzlXUMdsmCo+QOrM1hxNFJ
 V06L0uBt+QFi7QwHxbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE5MiBTYWx0ZWRfX3qedUrxIaOOC
 +AlZh2gW1IDmRSce9g1m8pYZZ+V59SihXvWcfHHKUPO5V01G+pfnG68VVijzLTfhWkmX9agBzCj
 nSy6NiREPvAMUUxv9eh+idEhhPsxL+TKN4w3/StoxKzB8qCXv0HQ
X-Proofpoint-ORIG-GUID: wXSZpm7BtiWAr7zYedwQKqj6fUjrrk5n
X-Proofpoint-GUID: wXSZpm7BtiWAr7zYedwQKqj6fUjrrk5n
X-Authority-Analysis: v=2.4 cv=adH0Dhot c=1 sm=1 tr=0 ts=6ab27f83 cx=c_pps
 a=sTSJOlcUIwiiAZkT7IHz4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=JfrnYn6hAAAA:8 a=ndfAsE3V-q_wF2UIvHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220192

On Fri, Sep 18, 2026 at 11:07:10AM +0100, Nuno Sá wrote:
> On Fri, Sep 18, 2026 at 11:25:54AM +0200, Michael Walle wrote:
> > On Wed Sep 16, 2026 at 10:44 AM CEST, Nuno Sá wrote:
> > > On Wed, Sep 16, 2026 at 09:14:52AM +0200, Michael Walle wrote:
> > >> On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno Sá wrote:
> > >> > On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
> > >> >> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno Sá wrote:
> > >> >> > (*): I should note that the command actually failed with -EIO but it
> > >> >> > actually unlocked the chip! And the reason is because the flash as the same
> > >> >> > FSR register than the micron-st flash. So WEL is set to 1 but can only
> > >> >> > be cleared when clearing the FSR register.
> > >> >> 
> > >> >> Why doesn't this affect only the locking operation? WEL polling is
> > >> >> used also during write and erase.
> > >> 
> > >> Sorry I meant WIP.
> > >> 
> > >> > Not sure if I fully understand. But AFAICT, the reason why erase and
> > >> > write is silent is because the default spi_nor_sr_ready() only looks at
> > >> > SR_WIP [1]:
> > >> 
> > >> So usually, the WEL is cleared automatically by whatever needs the
> > >> WEL in the first place, i.e. program or erase, write (status)
> > >> register. That should also be the case for this flash.
> > >> 
> > >> Now for this flash (as well as the st/micron ones), there is one
> > >> peculiarity. Whenever there is an error bit set in the FSR, the WEL
> > >> cannot be cleared by a write disable command. Which we shouldn't
> > >> need anyway because it should be cleared automatically if nothing
> > >> goes wrong.
> > >> 
> > >> Also the write status register won't set the error bits if i read
> > >> the datasheet correctly and it will always disable the WEL, see
> > >> Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
> > >> and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
> > >> datasheet.
> > >> 
> > >> > OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check() and
> > >> > give no special handling to WEL so I imagine that we try to set it as 0
> > >> > but read it as 1 (given that it clears only with FSR) and hence I got
> > >> > the -EIO in [2].
> > >> 
> > >> We do a RMW, so my guess is that it's the other way around. We read
> > >> it as 1, but then after writing the SR, it's 0 (see above). That
> > >> actually assumes, that if the WEL and any error bit in the FSR is
> > >> set, a write status register will clear the WEL anyways. Could you
> > >> debug that so we are sure, this is what actually happens?
> > >
> > > Sure I'll do some debugging on the unlock path. The DS seems a bit
> > > unclear. It also states (for the WRITE DISABLE)
> > >
> > > "...In case of a protection error, WRITE DISABLE will not
> > > clear the bit. Instead, a CLEAR FLAG STATUS REGISTER command must be issued to
> > > clear both flags.
> > > "
> > 
> > Not sure, this contradicts each other. As I read it:
> > 
> >  - Write (status) register will always clear a WEL, the only open
> >    question is, does it also clear it if the protection bit in the
> >    FSR is set
> >  - Write disable won't clear the WEL if the protection bit in the
> >    FSR is set.
> > 
> > > But the truth is that the second unlock I did came without an error.
> > 
> > Which might indicate that a write status will clear the WEL anyway.
> > But then it might also be interesting to see if the PROT bit in FSR
> > is still set. IOW, if a new write enable is sent, a write disable
> > might fail even if there was no actual error.
> > 
> > >
> > >> 
> > >> But the question is who is setting the error bit in the first place.
> > >> And I guess it's the testing sequence for the locking when you try
> > >> to write to a locked range. So you could also actually test the
> > >> locking/unlocking without writing any data to the flash just to see
> > >> if that is the case.
> > >
> > > Pretty sure the above is the case! If you look at other tests after
> > >
> > > "Once we trust the debugfs output we can use it to test various
> > > situations. Check top locking/unlocking (end of the device):"
> > >
> > > Everything worked nicely given we were just doing lock/unlock. The DS is
> > > also clear about this (table 8.11):
> > >
> > > "...When a command is applied to a protected sector, the command is not executed,
> > > the write enable latch bit remains set to 1, and flag status register bits 1 and 4 are set. 
> > > If the operation
> > > "
> > 
> > Ok.
> > 
> > > I also did tested with basically the same code as in micron-st and then
> > > ERASE and PROGRAM commands just return -EIO.
> > 
> > But the unlocking does not return EIO anymore when it's executed
> > successfully?
> 
> Unlock never return EIO because we do micron_st_nor_clear_fsr() followed by
> spi_nor_write_disable() which should clear WEN. So the error is reported
> on the call it should be reported IMO.
> 
> > 
> > >> >> > AFAICT, we should do something similar as micron so the writing to an
> > >> >> > actual protected region fails rather than being silently discarded with
> > >> >> > that status bit set. The question would be how to do it? The code is
> > >> >> > pretty much identical to [1]. The masks, the opcoded... So should we
> > >> >> > somehow handle this in the core (by having some common helper) that
> > >> >> > could be set in .late_init() under a common MFR_FSR flag? Or just keep
> > >> >> > both implementations separate for now?
> > >> >> 
> > >> >> I'd like to keep that out of the core.c, but also like to avoid any
> > >> >> code duplication esp. because there is already handling for the
> > >> >> intel spi controller in there. So maybe move it it into a new
> > >> >> common.c.
> > >> >
> > >> > Also don't like the dup tbh. Could that be a follow up or should it be
> > >> > v3. From the top of my head I could think on a mfr_common.c kind of thing.
> > >> > Don't thing this FSR register is standard?
> > >> 
> > >> Not really.
> > >> 
> > >> But (at least) parts of the datasheets are actually copied verbatim
> > >> between micron and issi, I wonder if we shouldn't just put the ISSI
> > >> part in micron-st.c. (Yes vendor will be wrong, but I plan on
> > >> deprecating that sysfs property anyway).
> > >
> > > Also works for me. Say the word and I can send v3 with this in
> > > micron-st.c.
> > 
> > Yes. But also please verify the our guesses about the root cause of
> > this and what's the actual behavior of the write disable.
> > 
> 
> Ok

Alright! I finally got the time to some tests and the unlock error is
actually as you expected:

flash_lock -l /dev/mtd4
dd if=/dev/urandom of=./spi_test2 bs=1M count=2
mtd_debug write /dev/mtd4 0 2097152 spi_test2
flash_lock -u /dev/mtd4
[ 3147.464690] spi-nor spi6.0: SR: 0x5e -> 0x02
[ 3147.469699] spi-nor spi6.0: SR1: read back test (0x00 != 0x02)
flash_lock: error!: could not unlock device: /dev/mtd4

            error 5 (Input/output error)

So yeah, the write enable is left as 1 and we try to write it but read
back 0 (so write_status does cleans it).

The below logs also reply to your FSR bits question:

[  155.737250] spi-nor spi6.0: Reading FSR (0x92) before write SR
[  155.738385] spi-nor spi6.0: Reading FSR (0x92) after write SR

Now, one interesting thing I found is that the datasheet is not very
accurate because the below test passes just fine:

flash_lock -l /dev/mtd4
mtd_debug erase /dev/mtd4 0 2097152
flash_lock -u /dev/mtd4

Debugging the above I found out that write disable actually clears the
write enable bit. And given that spi_nor_erase() calls
spi_nor_write_disable() we do not see -EIO in unlock.

As for FSR, they remain set until we clear them.

So, what would be your preference? Some common.c (or mfr_common.c) with
the issi/micron shared code or should I just move the new issi part to
micron-st.c and use the code already there?

- Nuno Sá

> 
> - Nuno Sá
> 
> > -michael
> 
> 
> 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
