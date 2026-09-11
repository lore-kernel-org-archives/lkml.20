Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123C0584954;
	Fri, 11 Sep 2026 19:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156485; cv=fail; b=o/Mp/nw0lTiPkdFi/+N6r8IWWohw2F9BUc0MLXL4nlJQoMagz9k51HGnVFzF2Sr5ssgY681dJ6TBZS/KjdQghLrPdTlrOl/AhmAE1NTs628095iqCLMSdh8/Hg+pFPZyzAwtaozdCcWv9ee3llsMOJocBfMHYPFbKbEhrQIbryI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156485; c=relaxed/simple;
	bh=t00p61eTwhakLzX61P4I8zZvVhQXqMqcyJr/YT1VCSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LO6Q80v+kxN0iZBp2Fw3pp87IOQ+owSgb43GuBg+lkhk+bH+HBGp5QUG8uW9h9DPHAR+St+f8doPLpWafds8a4wYcMtBdI9UC5DqkTx10KrkE/JuRwuhYpPYkk20hfPrgVcOK7ETU/upDVtSV9b5BLCqlP5mllLb5bsqqx87Mo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=SPnbvNVe; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=N+scZKeJ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="SPnbvNVe";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N+scZKeJ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BHV0vZ213733;
	Fri, 11 Sep 2026 14:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vgiI0AQHBIw49JSUi4ZkzCBoj6J+Qgx1DZH87DmdB
	fQ=; b=SPnbvNVeBl7lyVSyQzlDQ2z88F0HzSTOMz8zlIYVEnglxcltXDEatP/aY
	ca4Z433gArwb6V5EcbWbJ//wCwU4JSwvWjU8/EdVTHv0qEZq9DSTeIEwjajiDjtF
	Z1fEYRiybZG+rlFBQye+Po89IY5nDBZZF16lLgr+NzpF2j/F1o0BcVYB2wQ3uLwu
	5EsfgHAWknZOza6vhhmk2KYnCdqETNhGAQ1Hre4IbxNH/JEVZBM0bUcSgy6aD9pj
	G6z3XWvmCau2avcdfCxQ724Qx+BcgRbYgIiJXPyA0pFtHfoaygejTR9uNzeKwJOj
	PWD89/f8xb7inRLmSh3nBBizLID6A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gm3yyy0dt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:54:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUWtYSbobrO7jWYMAXjMfoqwWcKhUtCMmoihssQ5VZPsDWGg6lYg9jOcZ4/rrJQY9JXFjhH7vG4u+r2wg02QTK3qShKC0yfaMUzZ5OrY/AO7xCIFxgYU7okqTFizZclvTulLC4tSozEKxwYPe1+CsbgTv24ac90//H26z13hgVVd9krOVqtjJpbdE/xyIg3TB9ZszZ6UDwGDomXFi7y4xzzWGoXaG1ZXZ5lzx61U1xEbT9pi3WCvqHCDpeb8M61VnNjBtahIHRB9MmkBkzVzlzhd39dwXey4HpL0i6pjzWtGOQi8XPhpSJVbt39DsFk4ZF32BMRBcOW8MmOTpJysYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgiI0AQHBIw49JSUi4ZkzCBoj6J+Qgx1DZH87DmdBfQ=;
 b=vW1tSAmqzqcygVSsesSShBmToKXlniQl627pJx4E2WIahFdLJCYVEAMQoFkcSSSkR3NZphCPgVqN32Npd1bXxhQru+5t5SuKm73o4aJaU2lBFHkmI7mFXrDvw9E5IMtJx0dxOAisX6z7m+zg+AJkrBfdN1iKbQRMIDT9lI1EAQwoif4j7QsUab7bJqOFPLn7Yy758D6mCaEP3buGy8bnubZzMAIMDGf2Eevhsfggt4Drg1IPEAunogMPyWm/p0Ftslj+393YEjdiIkjSh8Vm1rBIVQheEtPPbk6VL5kdaGa6EoNqF7GITBPEitySDlWstDVVKvH96EnQglJNNS3y0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgiI0AQHBIw49JSUi4ZkzCBoj6J+Qgx1DZH87DmdBfQ=;
 b=N+scZKeJpmrU3BAtNkvXB0CSpUtuLsLFjjyaTYIV2PLm6Z6SDVys0NbyIYmqpnDYQ7TPOlxCr06gagGRvi8eorPC+u7OLtlgypFlcxs43tBggZTtXhS0co/pAnlaa7MS8oeakMYoPMOfWRWvq3zuZ7zfu4SG5RTqvY0m6RVa4TM=
Received: from SJ0PR05CA0144.namprd05.prod.outlook.com (2603:10b6:a03:33d::29)
 by SN7PR10MB6666.namprd10.prod.outlook.com (2603:10b6:806:298::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 11 Sep
 2026 19:54:24 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::57) by SJ0PR05CA0144.outlook.office365.com
 (2603:10b6:a03:33d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Fri, 11
 Sep 2026 19:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:54:23 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:53:34 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:53:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:53:34 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJrY5F1697448;
	Fri, 11 Sep 2026 14:53:34 -0500
From: Nishanth Menon <nm@ti.com>
To: <u-kumar1@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        "Leonardo
 Costa" <leoreis.costa@gmail.com>
CC: Nishanth Menon <nm@ti.com>, <leonardo.costa@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Fri, 11 Sep 2026 14:53:33 -0500
Message-ID: <178915640725.2344659.5177315397956352413.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260909181332.1081552-1-leoreis.costa@gmail.com>
References: <20260909181332.1081552-1-leoreis.costa@gmail.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|SN7PR10MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f19bd5e-a84f-4aba-3ecb-08df103e7a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|10067099003|3023799007|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ZwNEN1MZYV8qxzhvfVmhMlqjC5bhmnYoDNWk9aMovC1wjsXAJu1pSnfSR4gyDHB1o4J6gS5WG02jwuREAB1ELyte8RfucQjh+Oshuz9dN8uzG5LaGHw+XQlp3TkydCaE4NCZeMo/sREZZyuWLnTK0Aq5Gibe75OhPJnHrBGvUljwWHvlTiBJjmx4hWi1fMhvMh5h3ZkcEGF1e+1V5QFkQsSqxXnJ+neCd3KC1Nn+q73fmIIvKgO3NQTFbqgCym8R+m0JsKyPDdY5EOnBcRmO+uuvZZ8V2aJXFfTwe+8k2t9LJsMTFIgTF5E9EH+Fr5jzCNYuu0kKXRBjisuyqpAcncvri0olDrs6umrpkS3h9Pc/M5aPE6JO2/hdnJdonbTrlrCjHTimQcC5zkC7kTlBL6NrCX+y9Z6qfbx0Cxrh0kAGRbSX/lKEJ19PT79MnozSVWJGbas3xU9Q7TSn4S2TYXSmXxwdtyVSuxl+eZjrZncyjeR4FSJDTQ4uMacaRFqSKMlyukflFqxY30stOyPwpjZECDxoE+rMOkJafL1s2mnTtiMt092/e9e667mFL4HrwfFd3Bwh7xgMBBC8UoitNE8QAEX2+ibT+FaELGtq1NGP6yZLd5//Md4HfCQFq6746sWp/RfPYnn4bTKTRTHXNZ0SUeDI3ZTKXkdgOv3x0p5cZw3ATOQhmEMIJ+QugexgpP7TdeeHZb4tjYjdFm0Inw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(10067099003)(3023799007)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/PJmUF1Os8+6gvsQC3dOnsDJro+OCPsjPiFZIn03uvGqWHxtcszFWYcZ7nh3VEx0o9Y0ayCUWL2y+mwblam8VctbASzmrgflzYOVUWBPgBruf77Y6uwoR2weiCGgcEOMynbGbF0gNWSVzgDtouzoJsnBvvRtOscFzx9KwRgq05MKZPX9t5kWvX9JagKtHw/dbSrvc9zK5JJvf251yQOKVu7ikG17Lry5v7otJpGOmSOzwQvN/Ryx1a5U3lE0i97FM5uUTO4v4CvX3opAKICwiQMqwlhj0r/fZxlimFhBeZTjco+RM0vcrVqzESy1XDWxprWoqvjrOburEc1QMWstFPHFw7Ma1kRoPVdjZa49c5pyIvhKJV4Vr8GzT9PDuiJtaBheGS1cAf9hTdlaYm3HCsie5n58lkRo6gGrsbMD8tLS8daxySYF68KO8Ws5XNMd
X-Exchange-RoutingPolicyChecked:
	CEw4NXXND3W3K0PJ0IrkiUBQjGCXFWs2OudJsGnN5gswD/l/9rNqcRMEzAW8Ekf2wrrBE34f4Ru9SEUhlQ3wNjVwJKHv+9UYMfZAnKA+oyhAl9jJCZSt/uctGn1Rh4tik9a+sDhz3ZbhZ4g3CI0vX4l5seZTrHRa0jOGsYVSYE82/K6xtY8GJAQHzrKgIuMob1HuC8oVtDx3Kay9F84eYQvWhV38dofnjtodaJ9MgGNIAWCMVGQMYna8RbdU/fA1siapP2cDZArNzuhgFXngUAIjxfYb55UpkBckwf8iMa59OZfm5rkmzzUu6wDPKYRNKYHL4Nk0dFvz/UyUZCYHhg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:54:23.4563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f19bd5e-a84f-4aba-3ecb-08df103e7a4e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6666
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI4MSBTYWx0ZWRfX5lWCs5/TQjVk
 7PR9ra9C/yvpclA0kwaCszwwCORh0spBu7jFLsQxSvHgRAJlzJ52fZ4B787vjLhqR9h/70VWgCA
 hIR9WdQ/wrTze4XuxSphgDyCrjAruNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI4MSBTYWx0ZWRfXwn5GaxW0wZar
 csO0Lf/Eu9T/OSGi70eCEQ9ufUPrhQDN4euhLZszuJBONKecd7tPZe3Udqp/60H5BjwHA5xcVbc
 Dz/8vkEU+FgIULzsH689Z7nVbzoKb624gbY26NwM9ngHhn7FSpK86pC9DXUL1I2MRPksWlMR6rF
 uxmLU2hNKiHdFWxrUCPXqbAL8PTkj/q/8EawkPDTbZzCCppi26GIPq/Wu3HlVS9tVTkacYnvutl
 brxQnKzwqkXPLu1s2Ptq+JzIM+QH0sHcSBISfE8fnDGR+iB4uDtNBCiaf/36TRx74QMrX5xGeMx
 iBs+vokbm5PqvG0ZumVyuVMmpuvr+1P8XkHhd3RcVchsH9XgmG43r4/UIyAs5vcysodX1d/Gc7O
 MySDBczH3UG9nrro8Tzi08JmsNZVPPxAoFmReAm0nsFVGY+KObpFWUiDDUrX5CkQi239R5paQAU
 ohGrp4WBPOT7MPZwfkw==
X-Authority-Analysis: v=2.4 cv=Y8FtIReN c=1 sm=1 tr=0 ts=6aa45c74 cx=c_pps
 a=BYzTVJwijQ+wlo0xVi9Hgw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dXYYSeKgOdxyhkEbn8ObOk34lfxqOvJI
X-Proofpoint-ORIG-GUID: dXYYSeKgOdxyhkEbn8ObOk34lfxqOvJI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110281

Hi Leonardo Costa,

On Wed, 09 Sep 2026 15:12:09 -0300, Leonardo Costa wrote:
> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> touch controller.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      commit: 0717c94b493171f350f113545f765cd3b71adc50

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

