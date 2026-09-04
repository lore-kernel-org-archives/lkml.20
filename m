Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCB243E9FC;
	Fri,  4 Sep 2026 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514010; cv=fail; b=YHr72WawgNr3XukR77zXqiI2X/MsTPzFdlvC0Fb52wQ1y05/feycXihxEIDgVbRf0D8/xpQIjpsP15eHjFcBSG9/bgNwvyaw6m8a3uHS5+apRnAlR7IwcTdI4x4ju5ifnmOVeUNjOqrqwS3aaAJnknSF15PH4l6orG/X2Igd9KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514010; c=relaxed/simple;
	bh=jqS8cCq0ApQMdEYgIqKBQjKNJqD7yEeciTZMf/FOQ/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/Tl21A46xZluVbwv0v4IXuGkIVYOe/tdIUufDoG+M6uAxjOujbdYMChkPGWuUIR6Juzx5Et61OV3WotAEsaAk869W27AXJHJgop7oySEnJ7dQyJ6Yu8tY1yg4/97ZugWyeBVTQRs1Cugu5DjGedkHyA0KtLSq2nnsRY43an7ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dxJNOK15; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=af19E3q6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dxJNOK15";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="af19E3q6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683MtDKK1954541;
	Fri, 4 Sep 2026 04:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=e1rHn/vmCpZfoRf0w8DqzO5XsBJI0OqLGNHjVMWVF+Y=; b=
	dxJNOK154jDlOrM55BG6ehHrs7sDm48J5P/PGvYlyTLnp2Mcrxj8cFgznKv1ksQ5
	aVUXzE8Dn5bxm/h9u+09anPb3MhAcqqth+Uti2V6htlir/rtk9+fX62AzRbjXyFG
	mO5jOgxiRPyCB4Czv9X1HutnRPmTlSPEQMcaSRDyuFjEVM8xZZrWfs8gQp02LC+Q
	VG0QJOR3VNsve6jC0VBM64p9h4UNaCj9h3+DI7w2jv5rgKmZrdtf2ZCrGS1/C4A+
	HroMk5aSZTZ3HmFe6c60+SS6Ot9twbOWqcZjRvvg6mJ7D3Tz+62tdRKicOOPU4J9
	eKxUUYXUsM6JNNqpN6cpjg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azhn15011002.outbound.protection.outlook.com [52.102.149.2])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4geyrqj3mu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 04:26:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e14GW164bvNNkw0r7+25UZyBssbUpTA9RpxWmcbJWphhclgMZ3S5EV03ObSRQlk0a6jQhC7LPGg6J1ACZlpEbQK1OzUmZkeVFa0S+vwHWm0AgIgwR5c2HzgK/tWgIVW9Wkm9Os7FXCshdzOzGaOvsXmAIPsgkGbs+vaHAO4YTtuzlF1nKq0DqxVPcqPbCKuToLOq5ftkCz7BH8Y1eZvgyrUX62bIXKSME8gw3Vkxt9Nh2Kz4eZD3K0UF0/p5ai1eDntZICr9Fpgd0bnQuCjGpT16TjNNdRG1axVCLj/wmZCiepPDb2DADQn++JnPv5DOa0EnQLDXzNR9I9pPiT6o+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1rHn/vmCpZfoRf0w8DqzO5XsBJI0OqLGNHjVMWVF+Y=;
 b=j/7+qYCzNGt+4k/QVWRCsvbk5RT5WKhotwkcRdcKRXaHz7ii/MwEk+kWdTohghLcnW102MJtbWdM/xF63o84mZKa5pMta53h41Kl2pJKhQLIV0tpHwvPl0lncasdoK63rA9rUUW0BlcUP6FbfoKgDkV8hcu8Rkc51/sENyOsipGkUHHbZH7HnVzd+SBFTNcNR/pgHOX8YLhYjpvd3h51i2T+wrRYyRb8YeznL6ZlEIYqWyh0Bd4Qgh+4dzYmBFohn5Day3O8kw9aXqu59GFIGIIplhXXASDPOOkGZ1e+mjEx39VoEVY4KFgdanoie8a5pPMwq2jrHUqoai0+yMm1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1rHn/vmCpZfoRf0w8DqzO5XsBJI0OqLGNHjVMWVF+Y=;
 b=af19E3q69Jw6G9OH3hY3kEn9AMmP4kY/MD04U5nh9XUSRD6nSRDXdfBvVBBIlR3BzUI8mpMII+ZyMQuCJadlCD2S2c75l5e5n/78KuhEdykwk7aEJHJ0xdn+hJn8Ql4cGK/UOLSluuldb9ehmbzwdOJPpeQQNPnrtKChpa8R69w=
Received: from BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::16)
 by MN0PR19MB6285.namprd19.prod.outlook.com (2603:10b6:208:3c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:26:27 +0000
Received: from BN7PEPF0000009E.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::3a) by BN9P220CA0011.outlook.office365.com
 (2603:10b6:408:13e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Fri, 4
 Sep 2026 09:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF0000009E.mail.protection.outlook.com (10.167.248.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 09:26:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ED7AA406543;
	Fri,  4 Sep 2026 09:26:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D06B1820247;
	Fri,  4 Sep 2026 09:26:25 +0000 (UTC)
Date: Fri, 4 Sep 2026 10:26:24 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC v2 5/6] ASoC: cs35l36: Implement set_tdm_slot to
 program RX and TX slots
Message-ID: <apqOwAMcO44j4fqN@opensource.cirrus.com>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
 <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
 <cd5899e7-6882-4e32-9071-98fb94b0fa7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd5899e7-6882-4e32-9071-98fb94b0fa7d@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009E:EE_|MN0PR19MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 25af5ccd-8db2-4b03-aa77-08df0a669875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|34020700016|376014|7416014|61400799027|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|16102099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	6PLWKL+UbuToHNZZqecTmB0tFRGq7809FjzDNvVi3SVeMUKQs65yyUwo44nQv7u7Gav5quEosXUTwkHn9pcgsScZDlU1BdA3l4OwtcmNtpoqeqWCj82kgxGzEy7PwtpIU8x42/iYDyxF58Nvlvprn7qVQpTMl48dl/2GAmO2S1JPhVSYhM2pF3VRAur4/BHB+xhQOHBlhWJEjnE1eVfBQVP1U1eO3XnwT1NYRd/pHp2VhP8w9Ol3RRNUeiYV9V2gHGFUWmEEAplgYxUxAHEGInzFxF6tAdC1CrvtG2dp0dE9fjsxxEqFsyyKJYClaGtTlzHydeSjdx62zA3ZR43IXc5HSHEYGisDUfY9FBFGBkbqGsVZXmYbcjfjS6/UsfYuOZV3oYedDXlgNB7vuZ6x+Ch0lxRXocC8XKIG7WCndqZOVDNG9NZUZscUVI5eXMBUDa9WAvNfhFu/bBRD/F3jeNz52L8vrboYBnQyvCskuUNRXDZPxQkW0onn7+Uwc2Dx8UfkRQhLgQ3TN6iE270JAOyxzTSatuAcrQXy1SVbkexvDh1vdH95Nb9DnZeO3fCYLzCSy88D/tbsP6yL3dR0h5bqEP9ungwpizoBSPqKFkiPI0RF2/k3Vk5fiprxM+GUNVf7HqpKbjipySP5wP3GyCGcIImu/fdCP5pTTwK0VlrSjtv8JNPD0tBHV4UKxDe2GAFlmxmI7ip23yZ5pT22+Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(34020700016)(376014)(7416014)(61400799027)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(16102099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5wPx5LTTC/HhXZaoAzinD8me/8x5VsTY47ksI2rPx2B78JR8z/knL/0XZAX0//pypo2G5CdLgjGlBxFVMZDYdPvezS/MIebkhTIGb/88F2LhXDFoSyG+IeuydPd3Icy5Lx0EoeHQhe7gHZnq8ZzbBJ0oPf6PC8nnldCcUtaj4SLhdOlu8rJj0zDV6MK5qP1gs9XylN8vfwnRBmKKbo/n/vfFY/jFp9D89RaFR/3Ncb6oTnrKxgM6kmA0SUDzxQPTef09jgs4DxwYI2lpdOka/qSqsR7nRKxvBuina/M1Fbn+OR2uDdAmxHiDrk+/W7HBRvfMBXEIol0DUfZUhB+KN5pBn6OxilF/H96hsXahrllP275CQjP2tkt2auRu6egqddId1S8CBZzXdqRDHiiSeyMP/5Z79arHX/rRy4SSVpT/S97TUtSKwcZcxuyMhtkB
X-Exchange-RoutingPolicyChecked:
	zK31/FrbF2Wni6IqNSI5I3U6QqIN5KUL5Uefi33Knw4kJCkl/LbI28Q4MfWpMkE8Y+ygOYKcj6FDVoyv8QBHa1ZCGsMCWL/IpeU4Jz7EyJmHNiWssSBtGxD1ImGLnZSiAoAU7e2fkPEJdrdpvb2ZPISXQS2RsEtT1WPYVUZgnRTxdUK/woK0ujkKA7rNn4B/qz7OAfP2JYy8sOziGGjcxicIWW4jXcPfYRx4aV4ur+Q36adhZQU8CulyD6nGLYIFCzx8uJHqM1VqhG/soJE+D55zMkKI9UMSHa0lJFAGajoQneOEUrhZUobk2r1nJD8xzvd6oS1x6Jd+4TTB9Kn8rA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:26:26.8547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25af5ccd-8db2-4b03-aa77-08df0a669875
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF0000009E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6285
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4NSBTYWx0ZWRfX+EgzVA/4QgL+
 C/bRefamdpJmc1q/PpTUKvCZgtVeEKvHeUAWhfusvygov+ldZozBrCTOl+05bftHe7Sl98Mhg5b
 VNAH4Um1fIhtBYixbxk09+u89EboN1p4uwPc64O99DBkjROYeTxUKeaLqo9Zq+bw5ig2zTEeNN6
 XCH2RLaOYZDytTvWkRBz4DM1DrpyRqFe2TwVzdl6e4R/dGpvFnZjkiGhvCha6DIkXIGkFWefyqi
 uZI6tZfgams5FZdqMItMIvLySSl2+cfRxvY+sP37eY9ISzSMz++0473hRKlPFlM4MEGc4Clg93s
 8q6vSKxhWJd1ImIa0wgvLrXOZvvRPTpD4uMlitH0wOO25TcqwQMal71JL42JL0QzHkC3AWvkDq4
 OqHmzorWlesH0EF0fzDz7WmA8k8rJU6nU5L/cTrcCrgeIH20+PuanJm743GpDGAelOB9ebxjS2l
 f7J2pMyAJ/a5T0BBi8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4NSBTYWx0ZWRfXzsuO7rq8CEco
 xkZj+1j0YU/DJHqMXs5yuJVtbJgr0FHe17oGtZamkoHN+62jj/1qfvcusbGCNo7J8WYNioNpd4q
 SJckyjsnXXwcQEIDH+pdzM9hIgGx3yM=
X-Proofpoint-GUID: CG3lj1ykv13rdEPVA06uJ-yjLReje6EB
X-Authority-Analysis: v=2.4 cv=A8Nc+aWG c=1 sm=1 tr=0 ts=6a9a8eca cx=c_pps
 a=VitP91tKss2Hu/cjxsqK5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=q4eCj6U30AiqV21fcssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-ORIG-GUID: CG3lj1ykv13rdEPVA06uJ-yjLReje6EB
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 04, 2026 at 10:22:18AM +0200, Konrad Dybcio wrote:
> On 9/3/26 8:26 PM, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> > 
> > Program the ASP RX and TX slot registers from the TDM masks passed by
> > the machine driver. Each set bit in a mask names a slot; codec channels
> > are assigned to those slots in order, ASPRX1 taking the first RX slot
> > and ASPTX1..TX8 the first eight TX slots, with a warning if the mask
> > names more slots than the device has channels.
> > 
> > Passing slots == 0 or an empty mask restores the hardware defaults,
> > ASPRX1 in slot 0 and ASPTX1..TX8 in slots 0..7.
> > 
> > This lets a machine driver with several amplifiers on one bus, such as
> > sdm845 with two CS35L36, put each amplifier on its own RX slot and keep
> > their TX slots from colliding.
> > 
> > Assisted-by: Claude:claude-4.6-opus
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> 
> [...]
> 
> > +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> > +				unsigned int tx_mask, unsigned int rx_mask,
> > +				int slots, int slot_width)
> > +{
> > +	struct cs35l36_private *cs35l36 =
> > +			snd_soc_component_get_drvdata(dai->component);
> > +
> > +	/* Note: rx/tx is from point of view of the CPU end */
> > +	if (!slots || !rx_mask)
> > +		rx_mask = BIT(0);		/* ASPRX1 in slot 0 */
> > +
> > +	if (!slots || !tx_mask)
> > +		tx_mask = GENMASK(7, 0);	/* ASPTX1..8 in slots 0..7 */
> > +
> > +	cs35l36_mask_to_slots(cs35l36, rx_mask, CS35L36_ASP_RX1_SLOT, 1);
> 
> GPT says:
> 
> Findings
> 1. High: patch 5 makes the TDM RX slot compete with the codec’s Input Mux control.  
> cs35l36_set_tdm_slot() programs CS35L36_ASP_RX1_SLOT with a
> six-bit TDM slot value in patch 5. That register’s bit 0 is
> already exposed as the Input Mux DAPM control:
> - sound/soc/codecs/cs35l36.c:588 defines the control from CS35L36_ASP_RX1_SLOT, shift 0.
> - sound/soc/codecs/cs35l36.c:583-586 defines its values as RX1 and RX2.

This is a fair point, although I am inclined to say that using an
ALSA control for this is definitely not a good thing to do. I would
be tempted to say just remove the alsa control, now we have a
proper TDM callback. But probably also fine to ignore the control
for now. It only becomes a problem if user-space starts tweaking
the control and to some extent that is on the person changing the
control.

Thanks,
Charles
