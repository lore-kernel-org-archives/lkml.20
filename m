Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9E476CF3;
	Mon,  5 Oct 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196341; cv=fail; b=j9DFptK5RD0ZkPB3RkX1injmU/M3OlVzIWZXbBD+o9d70bHj4CpRw7HCX1yMV+NuxRD3xUcVnpCyOhM51SST7n6t6bqvJws6P6CSgbC1hzZzdQ2asXeVXVTqqog5Ry+3gIxFUicHLamB1Y/pjENOX/nTap8d02RgEzFls9I1hDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196341; c=relaxed/simple;
	bh=NcxBnsC7kkxC2yiaA4B8DmhU4F6nL9IB7nd8ILEhHUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAbAEcUeg7diHhuxEGRCGFfAndupCf9iJbvtyQOWB6CSx5DvS7jDOe4E6dA884g2roj65GjkFlWvPG46yDksqQyrAS4hiItZIIy1w1DliuKs1uP6QAJhyEXfXWUEsmKM6j+XLxUmV7CAKJQtqXrv/knwdP1QMVOp5v/gJzs2Uv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QI5qklRu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ONJFpaow; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QI5qklRu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ONJFpaow"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6955olbK4080705;
	Mon, 5 Oct 2026 05:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=oLcvyUY64QFhbX8zmW
	3C4URpFbBH8oTXLrM6AY0xPuU=; b=QI5qklRud3tQOaBPM1QDS4OTmLcnaAQasb
	COnTOHANI5q33ZIjte2H1LgDe6tHtMIS8bNQgMJNBR8vz6AaAyEgoGSxPB3kjH5Y
	RIj8TkneAg+LteaIyns48bIcNpH9kiDrgu2FIiWvdPJqVT/SBqTQ+TOVqT66XRkU
	Ad/TWphhdKELnYlbxF+naHORzfUfQv7YCqySDmxxCsmHuBLMiknupP76FUjdK6Ui
	U5VCzQVF8TnKdca8ZtGulXlU4AOQArTjrqBA+ffEdMVRwja7DS6Fp8+PRfoajG+7
	TjVoUfKZ2qCtft+y8zvrmCgDrZ4I2i5jEdZ1rYTLNIuVCDxRAlmQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020143.outbound.protection.outlook.com [52.101.46.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h2y3w9s1h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 05:32:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu69HwiMYBM/qL7PwYJNxBfKH4Ty4XEi/tNkqTe4OlLqMkHTg/ZTdJAwut7d90zCw7qqCQ6kr1yxZO3gSUXn17ob3U1TY9nfIgwKCLfCgJkDUnI3p3X3gqllxWCHldOa7VIKZM92YH0EfPYpqUx9yp13mQ/Timu6ZdRQO8It3lNh2VXe+uCJltJ5GI5xSkA/BSF+XjHismM/5BRXtddNg5P5O9OMYxfzMx39ZX897iCFP96VAJqz9vbJxs72F7mLuL50jRze/rERgRxYYUa15ds9GdwEHDXamQmzW3fTsbGH68BfE005m4wh1m/V0im+sZxOhRqWeBtZFm5RM/apSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLcvyUY64QFhbX8zmW3C4URpFbBH8oTXLrM6AY0xPuU=;
 b=cq1yl+1E1W/Ytdc5hFpb8T5U1cQdmrlnQtFLO7X6wu1ndZuQQeslC/N30jr3GaAZzuIjA3bHXnd1vrra8c2SrEdVIaSR+Sd6CDLZUFBnXWheSMTuNH/lPLmBDKBuZD6q5cyDWnvnj9YT0B/fz9JmenPosKoQzadEBaCG/n1EKRup2QUJAp51zLRtMhCJ5Xzcsu5Twu2+ujsEBx+0WVQANkgeAUnj5xM5ZrMIxsIThWPooUq7hrso/pz5vHyVkq7NC7KK07ckCt3cuedF2ffQKi8JZKQzIkrBfw+NhFK7S3fqtPnQk5Igm+MB93PrTq2oEv02YlgkHSiiynsV8KLn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLcvyUY64QFhbX8zmW3C4URpFbBH8oTXLrM6AY0xPuU=;
 b=ONJFpaowdPpYq2NiKLBOmG9oswLxCAHbY38m2oMgA5Du+Nd+Rub2Yr1HL1IIQ/OkZGgFKg1XxX/r+xM1u+oHUiSrWQjXLATIHjjopfwTfgPLYUHFiCwzKiwFHVAdh9JmnxzA0QNgDMUd/mOe+d5Wg79owIREqoeyUEUBb0S8Jtg=
Received: from SJ0PR03CA0260.namprd03.prod.outlook.com (2603:10b6:a03:3a0::25)
 by DS3PR19MB9294.namprd19.prod.outlook.com (2603:10b6:8:2db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 10:32:09 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::59) by SJ0PR03CA0260.outlook.office365.com
 (2603:10b6:a03:3a0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 10:32:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 10:32:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DDB6040654A;
	Mon,  5 Oct 2026 10:32:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C541B820244;
	Mon,  5 Oct 2026 10:32:06 +0000 (UTC)
Date: Mon, 5 Oct 2026 11:32:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Patel <ripatel@wii.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asN8pXcsRRRrwp58@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <asJGxhij4OzWNYn9@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asJGxhij4OzWNYn9@wii.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|DS3PR19MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 3564bc46-112e-4182-942b-08df22cbe885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|30052699003|23010399003|61400799027|376014|11063799006|4143699003|6133799003|56012099006|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uIoOJUtgMm/FJ5c4sg+QEasFCIcpsjSkuvTxpMXV/TQ4yaSndf4fYy6UVUgN6HKq/I+DwKM8Eqctb2lOYz8zgh7UXejgIOmenmMeuog6WbZzR2yGHepTLDs1p2ub9GU8FH+XJZ8mD/WhheAM0SYDIgY+ryI8LSsYv0AefpddaZz09EJxbn5ou+9ji0JrMojwHXAl4Ohxgi6GI+CmrN/Twl11+vIk6UU2+xu8L3BWwVm3yZ8f5LnZJajASPEAr7nUBrn5oOvRMtk51iCznIHtrEfA9l/XJysTdx69E2Mqvh2ic/esCzrLJzrs8CiV8oqbkcFA8MCcpPCtrVynsrjQcOqDeVGjPO5FstwMJLUKpFQVok9UwMGWLBgL2w/ASXfZwEeRqAQ+ItQI/UY58KVBG/jAaNuEl17EwqzYda9sH7rpOxrffLjE87PwgJEmrsqFof5n6bGTxC8skeBVxEEEkUNRc88ZvaRCxGRIHbCWqE+I7ZXXLPXJC7mtEsaCwkIQGAxZSkPePrt7AXtkAahURxSZ74iXQb6vLmpALOUjS/waL6WzEbJk45w52RX4WWtAYmg1RToe4XUSt607zU9cb3qDJX9B+4eCuWoIJTqmpcvhzp9c8nN9ogz7Cx8alSIGkVI2WXGxB9KSL//WxVDlnowpHB93sZH1n2uPfa5LE6WTvf6651FigQ60DGAEtl21JB0ZFBlx3LyhIR/UVbSP7w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(30052699003)(23010399003)(61400799027)(376014)(11063799006)(4143699003)(6133799003)(56012099006)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3OES9vidhJ87jN+QUNUwiLN5kshk81eBqYJN/eXHikjWcpR/zpEPrQLSjgYDLwXEGwtFVFS3KlDIcq0wayhKlQTVtPEQi6Zs+w7T4qK84tosFirSRTCQw21UejrFiUBhTVmOdp3xsohYXfs+5Vh4JJZREsnWASAlKoPB5u1O3Ff//wbnJNN8fTrqFRiSKCeYbQMZ5prn2SRqcgI3NNfQRRgsueMMTKmxGxKPvkNUZ95qWEcSx1xji5KDtbuU1TMXcZJOZlMZ5I4v6jAOCMeNEOMbJPSLPVFeVlNlOjS8QKUL5LkyWLMc6JW2Q39NfdBbnHICi16Icj74C4uEW+V7jwOpMpB+cEQkILUMcDvNhSNnBLVz7rhQ9zbZOjZXCxHQhTAPn5X62a3TVg4C+4BC7WsRHE8JRkxoupBf9TTdXEJl4ukFYTf9wuBldXYdzF+u
X-Exchange-RoutingPolicyChecked:
	WKdsI08ib4wEbiO1lcBRdoxmVXvwO9nfhcx4Q3EuBinWE451ho5zko196dwIbrh7Ephfgk5QFnjQm7gkqe9oLdVNtEusigAd2WdGBGbly8OrwWbbhHOCLs+4qr3hh7E7ncgYqvAaLu7uq0hmZox6Wi2SogvJcRDpoGdl7QCxsyP5TPJYO33+h7+wfir5a3dtJrqM/57eXAdvxwCelebq1omxRAljdBi1J+XgsMl2eUnR4hWJKzQorLqjv/DsHMjgx0RVrp2vtqZXu7jR448ZnlrdLz6Orv6cBJ/dWSojChNA/QLTAp6tiVdNQUYHdrfFkFQbXcItKwP7uw1hInWeLw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 10:32:08.1537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3564bc46-112e-4182-942b-08df22cbe885
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9294
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MCBTYWx0ZWRfX6Oc+CKEOB/dH
 6huxiQvcWWUJlXvcFb/ZDiq7xKQYER+9Ok6OTFobPSaEj5Gm8FDZplMfU7LfgzRPwqA7JLAjZXi
 cXP0dmgNuaXpZ7+QGQxXEI0QJ1CaHXBRWPyNP1GxxnsIzw2F/JAX2jGRDhoVTr1nLpNkXqJgjL1
 jFoKZ+51LXEmhfmSzfji9YbUUUV8o2OPyNf+hPA7yT6+ofdR9xftsUK+CaFzA9RJle1z05NV5RB
 jB5gfTYizrdld7+8aNljUoGNG0XzGbSwdbM2PcYrnJ0Isc25sm/KDCzub7p52/Q+k/ZCCeBqGP7
 MdlVu0Nl02f8NOlVBR6MHeU8XQaVOK43PxyNlEpb9VOjey6ynYuTaWt83iRRRgDUjiR6y+NU7Op
 K6VC124Hyi8Dgvqovzc4tFLji4Ya7WPO/ztDryWfx2mjjW7JmMCK5Ir1ABBTxeD0t/Dteu+/4Gx
 h4mlHAusfkbsfepjJFA==
X-Proofpoint-GUID: dbW7IceRTWhBa3qJ6eWexEaYgzlJnU-C
X-Authority-Analysis: v=2.4 cv=XuFvqlF9 c=1 sm=1 tr=0 ts=6ac37cae cx=c_pps
 a=XSy6xVanZX0hR9uvxkBJyg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=FIELzQhrjLOYfE1bBOIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MCBTYWx0ZWRfX7SiprIew5yy5
 BnuWVX59sUOYKAwQvKa6jPhNjSBW9gBs7OtBljQwsoHNNX/DP/0JaKrJYYNKeG3Kl8/YrmdH1QF
 NCVBHVLtfMFxz8C156vw1mNxu8cz5m4=
X-Proofpoint-ORIG-GUID: dbW7IceRTWhBa3qJ6eWexEaYgzlJnU-C
X-Proofpoint-Spam-Reason: safe

On Sun, Oct 04, 2026 at 12:29:58PM +0000, Richard Patel wrote:
> On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:
> I ran into a use-after-free on Samsung Galaxy Book6 (Panther Lake)
> the other day.  I was going to send a patch adding RCU, then I saw
> your patch already added a mutex:
> 
>   sof-audio-pci-intel-ptl 0000:00:1f.3: SOF firmware and/or topology file not found.
>   Oops: general protection fault, kernel NULL pointer dereference 0x3c0: 0000 [#1] SMP NOPTI
>   RIP: 0010:sdw_cdns_irq+0x9/0x1f0 [soundwire_cadence]
>   Call Trace:
>    sdw_intel_thread+0x2d/0x50 [soundwire_intel]
>    hda_dsp_interrupt_thread+0x97/0x320 [snd_sof_intel_hda_generic]
>    irq_thread_fn+0x23/0x60
>    irq_thread+0xc7/0x190
> 
> I would add 'Fixes: 4a98a6b2fa75 ("soundwire: intel/cadence: merge Soundwire interrupt handlers/threads")' maybe

I can probably add a fixes here, will have a look.

> 
> > @@ -145,8 +155,10 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
> >  	struct sdw_intel_ctx *ctx = dev_id;
> >  	struct sdw_intel_link_res *link;
> >  
> > +	mutex_lock(&ctx->link_lock);
> >  	list_for_each_entry(link, &ctx->link_list, list)
> >  		sdw_cdns_irq(irq, link->cdns);
> > +	mutex_unlock(&ctx->link_lock);
> >  
> >  	return IRQ_HANDLED;
> >  }
> 
> I don't understand the code very well, but isn't there a second UAF
> with the ctx object getting freed?  kfree(ctx) in sdw_intel_exit()
> runs well before the IRQ is unregistered.

This situation is unfortunately fairly complex, the IRQ is shared
between many different functions and only the SoundWire function
relies on ctx. I will do some more poking, but I believe the
free order is such that the soundwire stuff is shutdown before
ctx is freed. I am not 100% certain if that will prevent the
SoundWire IRQ path from getting called, although I would like
to believe it does :-)

Thanks,
Charles
