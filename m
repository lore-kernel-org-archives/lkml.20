Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F454CF69;
	Tue,  8 Sep 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873648; cv=fail; b=aq3d/5JKwj4ZKyIttV3ikqrWoG6jJXRbJ2l6glh56grKXprZrJeaXIFWGEyWY5rAg0huuSun0xufxLg79Ua4fuCxImbbqmCZHJqt7bgJ5PWBbKW7ih0WCIOocbbHC3+N3QSVTGGwX46MP5EgBIXl8J8jByN9UkSiSbX5ywnmAsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873648; c=relaxed/simple;
	bh=cCB9/cX8ZFPoymVI5EOTRPpIYqqRaGKuGrPNN382tMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlkLs6gYSc6RO3vKdd28SOIW6JP0dFY2vqynLmyTEWS5gnjixcBGLmglUpeQScFL/ZjzCWKVb/PtHNWyPghAprGwHf6mXZ7+Ke8TKPhAP4fNrfHvrbny28rk79rt59rQoIO+qF7Sia7rnzHd+NVtwkEx1iXp64A1M/BdXWtwPSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KWHtG7WO; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VkOxB+qj reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KWHtG7WO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VkOxB+qj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6884xe2l2449695;
	Tue, 8 Sep 2026 08:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HKyXr4bZU8sEqDn6KLBMazagsK6t0PMUcSlavDPl1+E=; b=
	KWHtG7WOE30SBN05YrnErC/THsASWAaqEI62yEscYewLFvuTFPg6klgJwUkyMp8H
	vV7IoswN9xIs+b3n/R4dBsJiV3zLNY4u3HLUQPqm+t4DkHacOkxWQTUlsD16r7na
	C/WM0JwixpApAsMIqi2CmwSazDyQnNfC5/VXFSdXgTQ+W+uMTccE//Lga0/u8aor
	GVP4pVn2ap+RcDK+KdmOriqrmEIQ2MJHRom/AALhaD6N0VIWZbDldqFbllVUfVgu
	yjqi/nw24OYx2xx5cXF6+QuqJKFHPA8j4nkqzK3OrRarDAtpbBkZ5ZVylEs/Uxf+
	g/Rtj5Dax93CyaBCD/q29w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazhn15013044.outbound.protection.outlook.com [52.102.146.44])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjucrt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 08:20:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJZlqG3fnG6oFjN36KobSN3cdVYD0Xvkds7vQHBxsj8e8NQQTz5HEeh8ICGvvw2csLb7g7Kmx8A30JZKF+AA2bV3h3Nz1J/cHB03visN9HujxnW358DVfkLiuBtoTaJToKFGhuSaGZ1C47B4k4Oyfl5QTZWB5QiqvKL7CqrZtIUxYwuwYc2vhOxx1zG8ejKZbgmQB4gcoXNIV3jNyDT+cUybX4yBvfEp23rsJwUkTciRvfWFLTTslljtCKxlKXNhZw81DJCM7AlejzHotmKgVRfG+hTRtjXXHA7tzUdVuP88wbvR8hjYbajOwZS9oM934C7by4CSJDHZKSlHBzmwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13Bi1nY+WvOvJZe6VeEx1tkGgztug6Ta9iSUMZUgEQQ=;
 b=w6NTAHK7zjKs+1gZSh/lYxhD6DKBZf82JrX2rePEJliq1pJgX9vQsRpiuCot7Wtm+x3ziZHyW10FnqYy3WYWIQA+Fzzxgd0qXJHMRzqmkK/jNElFwR3sLTt4+JFly0facX8bzgSCjZq9aXQlhTP0trKXj80Ae186QKu7gaOQzZ4iC4dUKGB7Co7M9Qks8PP1KuivVlB02c2ve8Y8efC2FQw3Qg6D4L9SVdGpCGrv64ak91VvJ0hgNSDEeJQ40sepJ5BG8ta962SBW02xwI3PuxU6SEybXgpQ3v266X64HcJtfmEiw/NgEXo7iDSsy5cOsjaW7eYDuxqLLPQCkl7UUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13Bi1nY+WvOvJZe6VeEx1tkGgztug6Ta9iSUMZUgEQQ=;
 b=VkOxB+qjPG51p3PxRBKcoMepR8km107xRmu3Xvz93+7sLYhfNocXrz85qJWAnIRwIY31JtMhlY25f/K++5OshKEPwtXf3XM+F5BpmSsZg1/OfjOXkkxsAGGAO+bIN0klnZu7Dg9FEAYqJh2kYooscjeA/yJkgGuTOfzwUV9W7rQ=
Received: from CH2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:52::28)
 by DM4PR19MB6073.namprd19.prod.outlook.com (2603:10b6:8:6c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.6; Tue, 8 Sep 2026 13:20:16 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::76) by CH2PR04CA0018.outlook.office365.com
 (2603:10b6:610:52::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 13:20:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 13:20:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EF770406543;
	Tue,  8 Sep 2026 13:20:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D4F50820247;
	Tue,  8 Sep 2026 13:20:14 +0000 (UTC)
Date: Tue, 8 Sep 2026 14:20:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Message-ID: <aqALjdlyZfUb5fDu@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DM4PR19MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec11dac-99bc-471a-e1ae-08df0dabec41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|23010399003|7416014|376014|82310400026|61400799027|36860700016|4143699003|10067099003|11063799006|56012099006|18002099003|16102099003|22082099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	5jx8CSdx2yrsnllPNkUqQv6OcdLmZsdhb/ednDNDkEnaCDjTV9D5XozJkX1eiYBikCdkI95objzuGRDKR4sgpaeS0R+ed4evsqoxSq4tguhSmGN9b7yDFAyuZLJ7WQ5/yh+9hC6c2TLvL5tofw1Xtn6lFJ/8Jo7RlarFpWQjlbmX86DCUChNGtYPHRGeTwb0kc3/UYnExneif908lCmqUSfzcnuX8/88sOAlFJUML47wSlkgddWhQtCG1sE9ZisfSa6i1MQGb0UNOedPyEPc9VLor7p8D6xIdpuQRUBPE3Dwfu9JHUycbue0Ln+sURGAz8KRH7J/rOeplik+Ik9e868IC8640LdCKkUGOnmJfnujgNl8jwo3eonkeixPEXDiLDdPqvv2unok9RHOv32tkb1nIPNyBm5tBFaG/2gVwpCBjypBnoiXcVP+Fb2PGYArmgxdFateP1ESGy7moHthz6Wz1gZ5GEecu6n+k6TVC6z13KoTuDWFJZN4AAm5GRg62B7IxAfs/9p5e8YLAlfhr26jIQsCfrFiFBRXLjScUQLH+9zFvB40b1sTx/mJF2+HCQeH6jmnS2k2NLxILwTjMtNkRL+6IsqpoBSDdGZqZxYLmusvBARywHuOVSafMSCO+ie05sLM7e/SVjHuAcy8JKkhUDJKt2CGPNg72xM0EBxcBl5zieqq6SV3mP2RQf/wiURrPdDdjwWDN+Ed9rqfTg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(23010399003)(7416014)(376014)(82310400026)(61400799027)(36860700016)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003)(22082099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t+nx8PDCtiBlT3mm28hO7Yj96blhV5e6JuGugIbNvq7oLsdckCP798VhKZk+ApH2SW8PQi7Z2J9LlEwZTJlu4WFs32+R/PYLrbJNDn3lGLwiECrJugln3zj3aHu+GohAtiRsCFkxgVDMvvAyS1GpZEf9W0pu4bI4taByKWSrwM/7Vb07+TiKpP/swzttaWNp/bYpJgtOjPO9KZwB9w85sbgjntEqWFt7Iq06IwQ1GX19NB0nfS7W0WhHUMYxQYMuPO/F6jEfUPxLjzrvmjsJ4pCq4NXMXt6sWlL9R7j1MbwLtIknNOfs70ggLKDc4EKqRHSJYczZgkbcimawK1Box8ip8z5fWgpyL8ZF6+AWfXF8YSLMxMt7GGxtx9YKRY+WSHAqkM1Q5XnLdk7ZqmYP0PdQykGWF7s+n3V6AcBysCqMPG6kWMCKgyGShRlzfEj1
X-Exchange-RoutingPolicyChecked:
	Cczvu39kogWLXNUbmQ0OwVNuxfbHw9AMIjUpOnxBztT93PqvPeAeuUpo97Tx+7JCr3NEji5z7XfKzjZW7pLDeNu8K5lfrf8GVzjXq+HD4o9DH0bAliz7ZQrLXzyL3gXnjSFrlMqYS7QGpc5EO4pCg6FrPZ/hBKtO9sUCI6M5sItFoGFab/n+wf9kwGJiLRBQmBQDVrfySVem29w80pzElMPd42WScOVp+Du2b2ReRuq3XCZPy8tupUP/7CjR7bStNQMAynJa5IaRYsUGH1H3STdpBX+NIFnpAqomEBl6PBgGKbRqmXloXRQlRnKqqtyqDqdr1Jdp4FtpKEpEoEtOPQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 13:20:16.1435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec11dac-99bc-471a-e1ae-08df0dabec41
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6073
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6aa00b99 cx=c_pps
 a=rt/ALwyEcTQPnCFk1mwiOQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=jA7ODzAtdX4U5uHHI44A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MiBTYWx0ZWRfXwK82wVhdg/8f
 BcmU1yylt3v+E8Nz79oGFNSM4fgPs03nF/fHL44eH4bXi+VrTtd1x8/YV22bbhjhuHx/Kr4zkRi
 2anHAQjqcrV3IxHGmEarQZjpOrCeU7E0D4nnCpI1zR5FKAtXX/e0j5dWiIzf+6x0hzpx6uDigLn
 6kz+58vZRLxKUai5v5IFYUjymhDsGzR8IupRs06U8MQAfr9s702OhGZZaoi36+ZXpwPfCfc/A9z
 uDyEHQ1EKkerJfj3ENy+MAo2Epkl5ItcYNYopirLX/dJt8uULuNQ0j++/sb3yMLRtlGkpb2odQJ
 QbrJfMEJBARpdJmbiDGMQfPgks7NAPmCHU+kTu0pQg3Lg/SCNfmasowgdmTtE5EoZVUH6PwIofA
 nL/u7QrFuqQ6rpAkGRCEtoQxZ0DTGD7JrXf3819wNE4tQsD9ac0U3lBzYv5kcldLodZPmpENwn/
 1kmEWZNeL49UkYcM/FA==
X-Proofpoint-ORIG-GUID: Kjm9Ig2Zh9GhdetzoNnCJ5W9WIS8uwXN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MiBTYWx0ZWRfX169uuXYMJiDG
 mEP83gwzVveix/69d26byVyn+99xvHe76vDJhpkzHBwpUrxIVrvtPTSPgz8kIxnNeJdCaRoQKvv
 cGDYRuE25Hf11vkcDimZ/GVPd9B44xo=
X-Proofpoint-GUID: Kjm9Ig2Zh9GhdetzoNnCJ5W9WIS8uwXN
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 08, 2026 at 01:31:37PM +0100, Srinivas Kandagatla wrote:
> On 9/8/26 11:37 AM, Richard Fitzgerald wrote:
> > On 08/09/2026 10:09 am, Srinivas Kandagatla wrote:
> >> On 9/8/26 9:49 AM, Charles Keepax wrote:
> >>> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
> >>>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
> >>>>> My take is that rather than encode all properties in C, it's probably
> >>>>> worth exploring a DT representation of the concepts that *can* be used
> >>>>> fairly easily and make the life of codec vendors easier - not as a>
> >>>>> literal translation of ACPI.
> >>>>
> >>>> I agree a DT expression of the *concepts*  not a literal DisCo
> >>>> mirror would be a better A.  I want to bring that back to LPC 2026
> >>>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
> >>>> feedback rather than re-litigating it inline on this series.  Because
> >>>> B stays put, switching A later is a change inside populate_function,
> >>>> not an ABI break. so landing this series does not close the door on
> >>>> the representation you're asking for.
> >>>
> >>> I am still not sure I really see what the value is in a
> >>> completely different DT representation of the DisCo information,
> >>> all it does is give us potential issues with future spec versions
> >>> and create a whole bunch of new code than needs maintained. The
> >>> ACPI representation translates perfectly well to DT, should work
> >>> perfectly fine using the existing code.
> >>
> >> I totally agree with both of your comments, there is no way we can
> >> replicate MiPi spec into an different DT representation, this brings
> >> both maintenance overhead and is fragile. This a very big effort.
> > 
> > But in your previous message in this thread you said the opposite:
> 
> Yes I did say that, and I still think an intermediate DT
> representation would be a better A in principle.  What I'm
> highlighting is the cost side, any intermediate representation, by
> definition, deviates from the original MIPI representation.  That
> deviation has to be kept in sync with the SDCA spec, tracked across
> spec revisions, and translated back to struct sdca_function_data at
> runtime.  It's a real overhead, not a blocker, just something to
> weigh against the "concepts read cleaner in DT" benefit.

I am very sorry but this reads quite strangely and I am really
struggling to understand your position. I think I am reading it
as you are happy to go with the group concensus on how the DT is
represented and don't favour either approach.

> That's why the current series takes the lower-overhead path
> (mechanical transcription in C) rather than proposing an intermediate
> DT format as part of this submission.  If the concept-DT direction
> gets traction at LPC 2026 DT MC, we can revisit.

This part I follow slightly better, I would be happy to proceed,
pending reviews with the current approach, although if Pierre
is or not probably remains to be seen.

I would assume the DT guys would be happy with a completely
different representation that was more idiomatic DT, that is
essentially what they have already said. The question I was
aiming for was less whether they will be on board with that
and more if it is a good idea.

Thanks,
Charles
