Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A6A49D59E;
	Thu,  8 Oct 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463290; cv=fail; b=r39IX96OlqM0gWV0sdPLsFYCFP3wOIDAi0xWLSOMbeGhPsXBS4x5cc3pGzxkyjjAHgjMw/gKBsbBvIzSK/Wt8dSLME/fDLIAOi31e8XC06ZZRf4SyWSayqximhuPSepLBtsjerp5CI66W3Rgsqv/lSqIPrCBHRv5JDBEfc2f1gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463290; c=relaxed/simple;
	bh=kbWVrVfHR0evy+9LyFmCYA/u7ds61mDbyBGIZOBFJ2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaIWmE/9LqQ/kOxW3QL1XJ1RRwzK6eVNbu4nLf8UeUIjFHFMqFRa9p5oPvpzwSnFmOseJKYEqtHdaeX+2CxApImYIxEYUebMW1Ug3jW/jgA0Di0Dgi05dw+y7sIPEuyKIHfEQiq6l3e5o4AniICaMn2WUK4746NOlc3QamWtBWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Rbu56Pri; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=y/lk57fA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Rbu56Pri";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="y/lk57fA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984sZ2W4030870;
	Thu, 8 Oct 2026 07:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=IufRJmF9/o0TUKSYU0
	i8xFrc9DtUlCGby5Ys4k+sbN8=; b=Rbu56PrimbMDDsjlwx/cukaJZIyPCeciZy
	xL5kDM3L7sZVZ4EFwNRtTQxiV9KREcX0O9Ov0LJ58/Y9natxzTHgl71Gxzig6pJV
	te3YoQGTpog3juorpSsloTBAlo56zQA110/3/JFIvym5vx6AArWjAZeTEICwvgwK
	kZKWufT1RRIycuOS41HahHklH2M8jBRnQT4w/MQvzTM6cMBNjX4Ss5UTkprlwSYH
	gi3ujTLVQQyn9NVqSRPmCT3FbitKA+pgRcMXslRyEcFhAzpErrAtq+aOwej3dRlU
	Z8C9N0kantnAFvhtXm+nOCzENyTAABEAm0diVXdyLzRfS6UgR+Vw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022099.outbound.protection.outlook.com [40.107.209.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h5xd78ugv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 07:41:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUJnxemjUcH0EMCt65/0tN9JzsNyPav/T/Z4iEztrCzCkUbywstGmnO/q1DqorTr/zWVxhkyeqJ+af3eWWvp4krL+7UpS4T6+nBvuBhLU7b8knXlZ+whJViNLdm+aMJt8rnmj/dhDHLODfrzCDclR/mqRBKHrRSAkJxdRyTj00IQb2VX8MBDZZUb84nTr2W9HehStSBD/rk8GwibHlhajdbJB9P9eBZjPcBZaSAniOaklXcaVE3R1QnU6Z8tofsQRq+iI5cqHiC7ylsBkbPxIPXHG9tYMbvYntxIqrmz5ztaB4l3a6aXBOYqbgeP882r7Fiuoxmdqez2YDIkrwPj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IufRJmF9/o0TUKSYU0i8xFrc9DtUlCGby5Ys4k+sbN8=;
 b=UqnGmVzXNnk744IrXfwSG4UYq++KrqwAmSN9dAlAb2rSvBm/9O/Rg+zpso2/pub7k6q1P9JeJVTkuwAG6rz7cFPJHq1tQjNwjt8KE05Jpn3nDZgbl2/BxWpIWPbwnQZ2Ot2vv6yX8/vOMgGK3DHEKVcZvzk1VGiWkTyav+ro1i7A70a4eGaZZHhGCHAcE2ZYQFlrVHeDrdYaVCIBiGGkc3Vt8WfHpGutVwmSky2ycBBVR+ifEbdVE0zgaL6T5846MdaUrFKqsqXBPV8Nct0/9EKbcc09Y59Sx9jE1wsZW8pbhHIllKHXGiB26mIv0T03NFpN+tNfItWVocm6d3gtKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IufRJmF9/o0TUKSYU0i8xFrc9DtUlCGby5Ys4k+sbN8=;
 b=y/lk57fAQcUKST8yJm0tkjwYfEhVHAk20+NljXP4ICiHEkHFmZRv6zgQM0tEvLBweF3J5juQlPQxuw/8/LKSTg7mTKmfu4TNAe5RINIB9lzCt9b9k9XNv/nw7wdVghjsco0BSAcROcFGuBR+FvF4Q3uJbeHu/b+xQUjhPDZi8r0=
Received: from CH5P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::19)
 by CO1PR19MB5062.namprd19.prod.outlook.com (2603:10b6:303:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 8 Oct
 2026 12:41:08 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::65) by CH5P220CA0021.outlook.office365.com
 (2603:10b6:610:1ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 12:41:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14
 via Frontend Transport; Thu, 8 Oct 2026 12:41:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4F48440654A;
	Thu,  8 Oct 2026 12:41:07 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 370B882024C;
	Thu,  8 Oct 2026 12:41:07 +0000 (UTC)
Date: Thu, 8 Oct 2026 13:41:06 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Patel <ripatel@wii.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asePYrXFHxHNssgK@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <asJGxhij4OzWNYn9@wii.dev>
 <asN8pXcsRRRrwp58@opensource.cirrus.com>
 <asOiEwRp77ETKznr@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asOiEwRp77ETKznr@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|CO1PR19MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8a49ea-416d-4ba4-70d4-08df25396d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|23010399003|6133799003|10067099003|18002099003|16102099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	fBwuK/XQaJwgBfThhZCghbT0T4XGjcsIwQJ0VCa9k/YGXhWenbsJzMDK22SlnOtKyg5UBmmPHJowBNS5dmtVss6R9RxyKCeQNkTdYFJX/NGdw8PdNK8yy9qfFNwZqdAoYRQQwL+1UsshCjOHsN/+uL/c1CxQrljbSNd5hqN45UtTksJ5vvwPSvpYnq/YbWQb1nmWaBrxHHV8MIdleh7u7uQh9u9Dk4ngV0v7NDa9+R9/XFhSuCzq/sUItFMrEnf4eK7HfjMSTPCczix7fD3PJNGbjf1tFbFJFCNj7rY2NlcH605ve5K+ZYP/fbArBghn6W+uIuwcYfCWS6PpAj1l6KyyAZZ7+LMfIp95vJwK+SllISQ2JpfYOKOmzVOP4UtHqgKKJ6/UnGiX+ya88K5mNuM946EpIz6lJIw3RkF2W42HYQiQIMl1q8Y2ppfPy6lxbpl9BSeH5XJdavwT/Lkt8vLOhhfwOqtbw60EUYMUiMy1xR6xghSRMInVsJr8rrPl2rw/4WZk7ISSJpaTqMFDA1Y8rxL47guLunZQ5FE9wflv34Z6G0TJqDRAertictsjADy/xNQ0nAZwh+cG5sG5epV8uGoEMIxclfnCvv9ilpBbx4cNao3OqYwj/ecFVEMNV7kAFbjl2e5DnEuLLswqROf5uJEewYTQneaAV+51CRHLZrlNAbtatUHl+cFXtdXsKH7x8mg6L83MCWZ//PyEww==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(16102099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mFneOk2zbVkxRxn2Ywxbq4SF0Z508MWGuLH/2lhL88kN8OOp59KkP0qd1E4CKKoGK05i3UwEK6esv4kymQ2EIeYdSUPedI8j1ft7i25Z3vSxglLdGR9sJfcx4tKvbun8u9+TU+FR9DtolI0sILTZLqpZup6imqutUqdfV17BLSOsAwN/eV/JxNFJB2MWUCZMDR7ge4RutXfP/p+g3XMmCeFnJPVAK0VDwHuc08CpzNQH3WC3KefsLFMMRAmctftXduLXqfJ0RdII3qqn/FdtEEcbkCQvnLPuobpJbYixpG7WrvIg/WoJP0D7P/IFZ3oeRDk5TxZrLSx2TMzI2zxmzKyJrqlMOIBDV6CTeGbDvQPaiTL85/R/cWTxDSYexmuROOZHzYuJwjaJCIaHSg3D0tp8zUP0zQ157GsOIdXj4Qay05/YgP2RpuCdM4Cdaci6
X-Exchange-RoutingPolicyChecked:
	cO66G8WLzC99Z/iFifrl7TUhgCNoA53D0TKhcOnOZq/Ygq8LtqdLCU6u/2zHdmIB7qMInKVMnsPZi66RJE8nK3EHc9alVIFzBBZjc1zjyn0ZcYE1yMZNPJiyA3tGgbf05PulkOmd8UnzybThds3q0F0TAlPcjrP7lvjlQFsQ00xmpK91sJnZw4eeDivi+JadnADIsSOaZX2fp4kqD9EDXRjz7ooaj54WFSCSmWljTqjiCjam8k2RDP0oHbE6IjIYFjb09ToHBDeIpD+cyjXDUZSGbwTBqzkLAJz12c1AdhBjF+ceyEBAG2/srL1xG77qy7ZpPMfcja1eCbpv0hDUUA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:41:08.2198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8a49ea-416d-4ba4-70d4-08df25396d27
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5062
X-Authority-Analysis: v=2.4 cv=OK+yTiaB c=1 sm=1 tr=0 ts=6ac78f69 cx=c_pps
 a=TyCWzW9CAQ5Ogo61w8w6wA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=v3Bfc3WZPQKtZJy_lbcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX0ozCIXYzbTqf
 gr0yi45+GAerUOhET5Z2D5uVbsUL8gY5myoxz5Cc6qNHxKAzATpcNbzlQ5kIgL32jyJgay8wWQe
 QJq97fAWCOd9+i9wGB+t8H27IfvyROw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX6KlbSQxNmvVs
 qm6c+UlgCsBa2G6jIHP4y2YGGG6iE5299XS9DLugZbSA0eUzKXP8cU2FXC3K5EjNUj0by2v4veL
 FhECN3YWgHvyDhlcsHDPG4FTOJBcWJyVvCBR6tmo+BDptqP5amkGV5KAH53B+rL1UMUt+1Y09OD
 64YoH8R+R0N1lbjMccsrNRK0W8j9CfoPy1A5ng78wHz/HDA6ecT6j4UnniK0+7+j4FWHmrpUifj
 q/9ZDbHF2IhAbF95TGhpsIv0SZ4kTP5AGtyjEoq0qb1x+UGlzOtQWUaVI7MxaTqTcx0BUw0UZnz
 94ah0VAuS8zfG9K3pjUFMS4632dWiLmhjw4eDpKFe5ztyta3a716US1YMIlBOogIIhh3ifD2b3A
 OurSNYK5sqZDcdv5S2zxbCr1AYMxvgrXIqtgjjQDvwDUlr2en/N1KSECbMLle7XLTDMc9RwFWjd
 J7y2xiu+vtKSM4LggWw==
X-Proofpoint-GUID: 3GocDX7LJyepck4y0l4C06WD2jefjeuQ
X-Proofpoint-ORIG-GUID: 3GocDX7LJyepck4y0l4C06WD2jefjeuQ
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 05, 2026 at 02:11:47PM +0100, Charles Keepax wrote:
> On Mon, Oct 05, 2026 at 11:32:05AM +0100, Charles Keepax wrote:
> > On Sun, Oct 04, 2026 at 12:29:58PM +0000, Richard Patel wrote:
> > > On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:
> > > I don't understand the code very well, but isn't there a second UAF
> > > with the ctx object getting freed?  kfree(ctx) in sdw_intel_exit()
> > > runs well before the IRQ is unregistered.
> > 
> > This situation is unfortunately fairly complex, the IRQ is shared
> > between many different functions and only the SoundWire function
> > relies on ctx. I will do some more poking, but I believe the
> > free order is such that the soundwire stuff is shutdown before
> > ctx is freed. I am not 100% certain if that will prevent the
> > SoundWire IRQ path from getting called, although I would like
> > to believe it does :-)
> 
> Hmm... ok so poking this a little more looks like I do see just
> see these freed in hard the wrong order so we should probably
> fix that up too. Thanks for spotting that I will have a bit of
> a think.

Ok found some time to look at this properly I think this is all
fine. sdw_intel_exit() first calls sdw_intel_cleanup() which will
eventually call sdw_cdns_enable_interrupt(..., false), which
should disable the SoundWire IRQs. Then sdw_intel_exit() frees
the ctx, whilst at that point whilst the IRQ is still registered
one should no longer be able to see soundwire IRQs, so you shouldn't
get a dereferencing of ctx.

Thanks,
Charles
