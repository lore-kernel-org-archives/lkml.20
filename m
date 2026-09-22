Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE7321457;
	Tue, 22 Sep 2026 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087419; cv=fail; b=BvOuoaMPa9lpl7W0xDuc+5B3rdFSLvN5HFvoI5RyzOvlH2nlNIJgkpqo8GsmkSfKXhJaGxTFjLDHNQDAkm7YyHVoD95LTRR3P72M2mShIXWHkUKBOBcNS7H24xZm/iiaA1MQmcOYEV8pEX6jIHnRqRqtQ5+7fEvQ/Y3wb37DzuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087419; c=relaxed/simple;
	bh=yWQXEECtbyzQcW0cfM6s4F7EOxQYbSHqgqob8QNNar8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asT61T7Aa7z24C9p7OPuSXhqCTFtUxW0K1CaQrGOKhi95iHjf6xO1tWvLW423k1AR527VyJU+32x2Wyxrxke7uPUFEAh/MFsP7AdvS8nfTi+o/5ss5geCiXWAZ38CCvnSsfUS0BsYIwObobvT19JiuYWG/MLMl1BVCOzsmUzfbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EtFvVTE5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YSz7yiSx; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EtFvVTE5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YSz7yiSx"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MBOsET3446397;
	Tue, 22 Sep 2026 09:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rfJFkWwy3tr53Miij27RPWAW74LrMhIDOoY9iv5h1
	8I=; b=EtFvVTE5f518/IFSiHu+w3aIA8zuKb2DB7/h0+9VCvCnxQhdpoq0wCYPm
	3++QWgRD8zKZf9hGpHWdpHQCyDUIO5o1MfAmEJYzEUgdKHOdJgRNdlr5Zq1R/UKT
	772wZZ/nUz3W/3AxxFTa8aTa0IzHQgSfU775cDN2xsF6Y0hL5OocCIx/qKmHEaFj
	/9gEu/fH2ba7j7F+gFfPHLVKDKk8QWjocnWINzK1dwW3lh0MeCAkhJ96AnzKajHX
	QGZIuJfUXFtqrn7ZY7rI97RTfo9ph+lYsvATYLVpEK5UXIUid/j1Q6Cg7HJ0Snav
	qeuxeAqU4dlO/Pe/z8V8eua5VYqXA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gupea1tfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:30:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCq0Nbji7qBJ2zqboX2I07r5SXq6A2vYPn2121uuPTkrotjluAcDaFw8bXvspHYmrXk0FeRVoKf2kt7V8i7BqoIDtIcYrgoli5SoBEmpqU5TWzKVVQ5LXYV4LSfxyUkxyUaJtKEhHcvRomB+r3OeRgfnsNrozG0KQ6HfhOWcYXqVddLyCebXtqDPicBb4Lie5s67iJSvWHFIKfvp+tiTS7/dzW/p41sVtLTF8ILF9dvdOrgXXJ9yavs/sfZWGGqrlPJlHQRYAto2bEyaN/dYGyKUngNEo+O0nwJF3d9iqx6Y6olqndTvT1SzRFvDOnJYpXWapY+Owq7yGJrnvc0rwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfJFkWwy3tr53Miij27RPWAW74LrMhIDOoY9iv5h18I=;
 b=uUK8CUm7Xi/R6VvIYnTa3774OtRHcUQTrEOjiIWh53gBdrXliPlLhK0uyJfXt0SnUILDJXETy3WPIukkAA5JnXh9lL1VKvQ5y+256G7ilsAQUReXuxSVItjAo1YvG4WM0OEGiqecd8ioeyuWYewihLAO/hBa8CIvZZjPubtB5ZAnrHp5Nm2jpL6w0H4Gq8t2qYwKuGgmYiMfsWRI3mQDIWpyCRGmwUw6XrEIuxFu2uGwM3JLT1OqQS4ClMz+vRU0EGF9yeQIZ4FsteNconCuojk7nzzSieG/nk0i0Cj2C9IilLj9ByrCExxoHwYuwJwhIKshvZxc3NI3BU93An4asQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfJFkWwy3tr53Miij27RPWAW74LrMhIDOoY9iv5h18I=;
 b=YSz7yiSxOo5r+BEc1U9UaIY1Cs9vjHQc8wUPdtdahL1tG5RoaBOS0i8Ai2fXRguLaqzWdW/MCWqvpe3IgaDGYWjxRCEu6p2dazdXC956WhlS6lbxuAbMLzzmJ/huvXnU5ep8q14UQAciIvO78rRSpY74XnSfDFhlXxYgbMeGsYc=
Received: from DM6PR04CA0028.namprd04.prod.outlook.com (2603:10b6:5:334::33)
 by IA1PR10MB5900.namprd10.prod.outlook.com (2603:10b6:208:3d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Tue, 22 Sep
 2026 14:29:59 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::3a) by DM6PR04CA0028.outlook.office365.com
 (2603:10b6:5:334::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 14:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:29:59 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:29:50 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:29:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:29:49 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68METn9s135801;
	Tue, 22 Sep 2026 09:29:49 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-verdin: fix main_gpio0/main_gpio1 line names size
Date: Tue, 22 Sep 2026 09:29:48 -0500
Message-ID: <179008726793.4044824.6786355019611253673.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260914190943.50843-1-francesco@dolcini.it>
References: <20260914190943.50843-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|IA1PR10MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: 403561eb-3ce3-4e5c-792f-08df18b5fb52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XoW8XbbZdI7bja/lYW4FzSmYy3UsqpMPYrerScQtcXIvJdx8VUdHOW6aNvwfrx6lzdG0Nc3PY/qz64UtWTa3bAUia9NH/NI6vsir1HpVaZ6LwIgtgoybmV5hVVYl7QUg0UxFPdTRa8WMo682UKAcmcV3GPaPeV+sOGnAxMZxPeI5gSvXkBDyo7bIb5wbsUnZyvmfigAQ+OGTWoGvRdzo0DTxWU8fHBZX36IDO4dICPJV56haZ7jGv9TH2kblu27CHprgljTnJxhjNZUKlUTWvvD08oO5rtzofoeEHzLgqErBDpmruE+9TsZL02jMIvWOT8X01AN8N5uEtZbuY6XBGiD+7JB66l8MEkMZ7HfmKw0FRxIYy8obrxn4gVoK0qx3DbccQMc9obADEwo824VgsAM445xsZlvxgESuIw3V/6eqMQEHLq2xSr799fYotJk4/bZW1BaYm5DajDCAADpuTOpYMwACvwBJ5QlMZXk5akWXAUsr6u7qZg5E+laj257zvRxWITQasrtP5qMbLxfqhTCjAlZLfw3NoxJu0AsrwMIggraWIU2fr+2Zf9WIPocLwS7lD8N4DqUCRIWWesadfqoVMl5b4DHU7a9qdR0FDn+kJAX4RP9adKoy8zDhVztrerlhar2Z8KoXa6wmOQOsQwk6MKilXv5xd9Ju+CNeL0pdTCgFNG7OYOeTWHWL8t2CWRWleGaGQ9Vas6CZ2pce+w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2fKAAvl+NVrzc47wM5kt7MfxT3wTHpFgFeOd7WMI4G0LmgfULz/2xhWEmcqMdB9szavZkJiHNzyIK/zaWLUrCEBpsj8wJBYy1lJVa2X6F0viNudpnvN7sBN3xPMNM46gz7O9s2w7sVob/oExf9IDp13N6uywXgEaFCUYmhIPQjrkMHoOMzjLZyTHW27+pcrdU8hFmkFTkdwk1HU+auwcSqqbbAUeC/p5OInfZ2JwKSyDijLMScUbcKeEq76nxNBMxH8r6OG7i65LKIlctes/Ho+9OPRp/2I5Mt3dVOBz60e4+ivXj7KqYtNtGHbYH+Fns/QUErctGKo8dNtgFdhTDvfJmLdLmA+EV/IHaSsd/0oUMwcnWduJQgwmkItom+2eVNMi979d6d59Hw+jC1vNn0YfSeJ0DoT4oSA+cp1m4yshWq4uhOMY4H/H2VddxfXq
X-Exchange-RoutingPolicyChecked:
	5uUtcww3dVvCLG2ZgKqw6tVhRblMmYPZzKZF7dOIvqf4BzbvffIZ30NgSVov051fRo6lOGduJdykgVE0RAwlqcPQD8st8C0FoBevJDtFHJ9voahkCxMzMdCofTi/OPSlr33b/PwVCPRa5LSYorNdXEFynkJdrfutl8HXkLtVVXabwFfYl5U34EjT6bV+HGU1D90SIv8h6in+u9JgxEaRdUMrOUv1Qf7ubNiioxsZFlPJdjZzRCsq4ROciy877OuGKbzM1dmYmDn82EoHkf80ftUy6QrtXeEDADxFudXdtTjgio8QW0nGQdBtdmVpVXdw2HKgdebOM0Lc3XfwnIieXw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:29:59.3342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403561eb-3ce3-4e5c-792f-08df18b5fb52
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5900
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMSBTYWx0ZWRfX3bMVyuXzSYbj
 EHLNyoTlJO9CDtqp5bnhJLTdSkiFC4gmiYHOtNNmXHKTpso+qCk6CxVVFB8AX7v51NMTBb15xVC
 OdQBZ5V1+M0cGL9pE4lsr00fslwCUYnAi6dcjetE5UHeSdNc+0hdwCDtXTkNKvzuIcMHmG/HwWu
 fSYqWPlHdumGS/A5n1yPlg2okYwSuT4/Crm3tWeqG76oeDHaFG/yB5Zm3Q7/3RnQlXmAiwyTQ+D
 UIMurZLc7CvsVO5g75qhri8geE4OGQBANKVIqVL/6X2NiL8E98JPKwqDXv8PPR/zfJnneUnyiPv
 DoonZPIL8780SFyWP9LwmW18fwJzvewz4ELYaqpjZgwmBwybe39l6UJkvI9n2wa9FZzkqTQlr2o
 z84HizFTZZZ0rimjTAb8ic7cpNuXbQ8fwqQziAj00cCaAS6l0Ki9gPhxf2dhhS1oJTuE9sW6bIZ
 TOaD8enLEN1jspDD5yw==
X-Proofpoint-ORIG-GUID: r7DHZ_GTyKqMW1qmFRm8a_VmTyU4waU4
X-Proofpoint-GUID: r7DHZ_GTyKqMW1qmFRm8a_VmTyU4waU4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMSBTYWx0ZWRfX4PxREMctCAOy
 Kg5zPEQjv+hnZLhbQ2P93GZpXB3uJDlJHA74P7OHeH4f2P438F2ICDwH1s+C0yq9uVEiyOYS1xr
 pF1YuzFJnFzfoqnCZN1X7pA5kW60ISE=
X-Authority-Analysis: v=2.4 cv=Mdz5KJ/f c=1 sm=1 tr=0 ts=6ab290f0 cx=c_pps
 a=qO1H+kaF9sbjJIkK6g+tnw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220211

Hi Francesco Dolcini,

On Mon, 14 Sep 2026 21:09:42 +0200, Francesco Dolcini wrote:
> gpio-line-names sized main_gpio0/main_gpio1 for 87/88 lines, the SoC's
> ti,ngpio values before they were corrected to 92/52 in commit
> 28c8f2189d80 ("arm64: dts: ti: k3-am62-main: Fix GPIO numbers in DT"),
> four months before this file was written. Resize both arrays to match,
> keeping every existing label at its original index.
> 
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

I have assumed you'd not want this fix for ivy/zinnia which redefines
the gpio-line-names. Let me know if that is not the case or if additional
fixes are needed.

Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin: fix main_gpio0/main_gpio1 line names size
      commit: 11a51e82e1f997975a28358a1dcffec190ea7282

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

