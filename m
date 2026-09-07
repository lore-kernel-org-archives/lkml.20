Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649A48381E;
	Mon,  7 Sep 2026 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778326; cv=fail; b=efV9unfUTy4fMoH/AK7slAfPfbzihT4NfTfmL/g4rXMgdYsBZoHp+11uXFIV+4s+/SJ3Uvko0KGgAGy1PwUYSm7J7Alh3mFN/mJ4qVqxUV3JW+usdllaKzvct8M9uif27qvQ1whqnpJ4/J4IrAQtCivw8exoehNWf8Y0fckfKvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778326; c=relaxed/simple;
	bh=o28DEX3wLCa5BlE6m6azHSs3ZPmNJXH/nT+tBl50RrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILrqRLJPq6kQh7aY8nMghb5S5auT1H4iCkV6h8Ye5haMsrdjUBvxwmbWjvJQQuWsyVag71OC9NIq9xxczC9Qvxp9nD/yHi5PCSBi+rSEVB2chSebWkhau/I5w4B7e/f9on1R5sau6IOacyuXIVD6AeNYEG8QZhO6N72lGsgg4Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Z2Y5lENp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=drBRzckB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Z2Y5lENp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="drBRzckB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6872KmRr3945280;
	Mon, 7 Sep 2026 05:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=KuIy0KfgTbL+SKNnnI
	/UTHA2YktacSmqQh8CqWZlPJY=; b=Z2Y5lENpVKcTX4klxXAFwDKCoUy3WuvE0R
	KAl87cXa/CZuOYRV5ef+FLuoTW8h2zfnsxjbCJTdhuZGF721TD6LdMemNO1/Lfb2
	SDkWX2mFB1OdK4J/GTih4vRO3YCcjQDpuMYEqj8NNSCoW+MiRJMbOeBW5d88d6Am
	bHvI/9igmMymLVu/gAMjVOv3jFXKhX3o21OufRpBCjoEies5l4FcdyBEeh5SCQV5
	J6+F8rjRKs37Ln3+k+xjZ5KKB1Y1RK9IoYXbFX3OKNLFa5PTYPAtN1O0GKN2fEVz
	0Ch83M3ezHyVTM3mmEtKF/VIAIBTvkJSOfVvNIC/keQIQFhpAMbg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021090.outbound.protection.outlook.com [52.101.57.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjsv8n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 05:51:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oycWh4ArQPsQJuZ8eX9o4xAhzYinloTd2XTU33yp6K9bMr3Y9m8/eCiDZMPvzMhfPCWmOs/LH9Y7TYzKr3++dOvOzOmlXMisEuYZShFdNmkchgpHHqHI4vcMtGxixYiNS1thMUiG0ZuRmsEWHhA1jCW4kHIk8Hv9QObulbdqZdEZCskfa2CaA5AvrLcyOtQDnBBBjxrbE97cLiASswq9gnrTeOrq4hTAd5gsnCDHa4E+lpe1SY2f0YGUvJCu+RgCWVGOFFM1/2vvRvlDyP6J1oWksWrERva55heb1ziWTePBEAf/ksfjVIaNxxu0GiSXW7F/E/BAkY39JveX4qgqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuIy0KfgTbL+SKNnnI/UTHA2YktacSmqQh8CqWZlPJY=;
 b=i7HNkACcOEliQ5EXuob18jQS7FLUSybEMYnSX5FOM+AC8lQLzcVnO98o2JvvNxEBIfWNzg3RJMIopE1ghGqYjpPU4acRBypC4QYEcAn90QjtdCQBBRMzOJJ4HYadvXtJWfG2d+bmw4jTmGiHckbZOg93VJZ2+R6bbo1A8w2uL6AV5xHn2NjgW60IFCn21fDN3pIwr3qhNGPkXVhLUTJh9TUVRhvSc87p5qeL5QtuOKI31OAA6DC3ad1iNhUlW/qsrxMvkbDBMoHdfMEkWbeBHBmSnFPy1J92OXNrhg37MyredjPiTvq69Eys6hi698Io9UyMOHA6jZj1F3VIC5SfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuIy0KfgTbL+SKNnnI/UTHA2YktacSmqQh8CqWZlPJY=;
 b=drBRzckBqcknOz//aa5nVzKcVZV6ZHFj9JKvFkIfRv4ig6FffgqG3+DopJspVcJo4cRdoxkB8UAdutkJ4ZQXJyTeVZVWrDvcwyWuIEP5m5aSEnbx4vOO0Jbi3ypl4LF2OzL1bZaRH9gy4p9t/xrF01pUmgFIdDwkfU6UGr5Rt/4=
Received: from PH7PR10CA0005.namprd10.prod.outlook.com (2603:10b6:510:23d::11)
 by CC6PR19MB999015.namprd19.prod.outlook.com (2603:10b6:170:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:51:36 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::13) by PH7PR10CA0005.outlook.office365.com
 (2603:10b6:510:23d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 10:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 10:51:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 450BD406543;
	Mon,  7 Sep 2026 10:51:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3202D820247;
	Mon,  7 Sep 2026 10:51:34 +0000 (UTC)
Date: Mon, 7 Sep 2026 11:51:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: bus: iterate DT compatibles for class-ID match
Message-ID: <ap6XNbDeP2xE7axd@opensource.cirrus.com>
References: <20260907091421.837917-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907091421.837917-1-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|CC6PR19MB999015:EE_
X-MS-Office365-Filtering-Correlation-Id: d39498e1-1a2e-4875-bf73-08df0ccdfceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|34020700016|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	g8AnVPo4T1Ec254sbz9V7EVQ6iBzeO2hcCZW/7f60IOdG/GCVDHkxKrtPlh/3pW1odG55868F1UwVm22gJwKjy46dCUBkF0IJsKklHwk6Ici1wfeH3ZPF4ev510s+g9fs6YiWHaC3L/7d77Tfc3m0eTW+TC5KSzGKL7S8dwRjtBNBdBtcqwDW/xUC1CNeKU3jOGPdcBUdSw+uRKlHAE4I0+9cAw51u6vUAvNPiae7K1oHYZkudvJtfUPbvLrb6MpwPkSf0lZIljRBx2lbSyKE+x4Qrwz60jkHGoudznsVjDyyMo6ERIHgovjM0h+zxwLgHbo5MEKQ5MTwzNtOyLwoWZ8Natyx42BrMn7WkSCaErTZ8rLGJRqZBdnJLDIL/yz6hsCAqjLYiw5NUHiSR3mLFOc5TWPxAcsfSle8C4o0gFpdXETVyQA3g8/ukPX4wXePGKB5XDvLSosu3ALPJHBg07CVXSleHfN5AEfkvTTy3S9N4GtKPYe5wzZcQdHgif9T2+J15lRrhdieUq49pj0bQNZgVETmcAQF2zZah2JpIX3d+WtBv8GJ1z/aUxnI7yLEbk3Pzdrw/9ticIgITr7oox+vgexRxru/sBj1nU5ZqTDiROCIJKB2t6EdSDi8Z0rDZnFGKTwVBnoBozRDXqlOjbCw+mvK62f8ukQhsoezBpn+sOx1pL5YP9cLFOvWqT5NCJwGETwBU3l0JEUHyGHgQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(34020700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jr+Zp4nmjCiNdXgeClDYEfeYbweESz0isszVnRIq2e5FSs0pdnnBV6fJsE7dzfjgmJ0FL48A23Jb0US82xSSwj9Xle1FC4QFFVQvZUJQnCcUt8UZH62p0cG/f/NsuRQL1fOQ1r0fsIabyNpESAIMN0E6g8+E8WUhmUrvsDK2wur/CM5v2zKn0aK2H01lahu+N5RFjrSQOaIxiHfnF5yt1KKzXh1btFrHxA/O0digXjCf32oivnVEhbRpomhGMjrEtEoIndpCZUmFvnIgaUlStyWRgIPw55R0T1YbmjbnifGYA5gVB/peL4zfCbuX94uY6kHbz60s6rQkcet6TDukQCD6BnSjVXIFaNPOB6MDWWeK64O7HaX+iPPI0SSytwNopDxt+TbjK7mJTJIoO4RRMtBUMnEHgv3tNzsLNOimq1SmWk/Mc+Nsl+zN7W5nASU1
X-Exchange-RoutingPolicyChecked:
	Yv0ma+D4QYWb6mzRq07bkzYrzM6aJq9jQTc5osq7fW38rLyJK7IWGv/MxIByCMifjXGkCNfCwTqvubiiRm3YZP+y0tpjyIbM89mthAmXumnOx/7r9Wkx8YUDFHCXmfE0Ujy9tjuYQ5KwCh8/UM2YZs9wtSm2pZHTq5ymf8VsEx0vGyQPpC89ktRIgbB+mDKAFHXJAqBFFzPkDB53Pi+STPnZeX796taIRZnsAk8rOpigXqAUBywka1YFu1hF+xmeGvX2w3upaknK0jNK3FnkEXPwMMTHXsPvbaNnjoBA8IH2sYaUwLofx0znzVy4Ka3gydpiJ2/KTHP82lRaygwfYg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:51:35.8227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d39498e1-1a2e-4875-bf73-08df0ccdfceb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR19MB999015
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9e973c cx=c_pps
 a=xDfafPpXm9yecH14ZOSShg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=8PhWeRRAK1k1gAhUU80A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX44EBNWMukxzM
 plED1fj3e6a8jziej0CXkhSTxA1tKZJuliD7XtJ2H61U79dQXlW3uqmFulGRUV+n2E0Md+H52st
 JWSuI6aHZe3WRRzsxNF1FLh18rcqvxUdCxwpPcCVqRRpB9+aSsAUxD0F0iMEsC3xrGZD9tZs9sW
 V00JFt872Bmg/RXd6H1stO3o1L0HXb1P9Wmozgetof1t9KAijzkm0eITos67SDe2weXaWioyU+D
 HT69z3NxYpf5HQ5JWpeTYBIi4Wd8IMv5eUVga6hYTrzOTa/dquTEfOxPAFLConZ9jjbdGgmcTX1
 Pc3OfxQTfNTrU1f0rPaXNtAfhvPj9GARxz2zxOHgl8s7j8gwg0nqboLJouAMPDcSmQPpDtTDWsk
 glPQoWXabKsdUGcG/qAN5lDcAnjr66ovHRorCkTm8lSfxylFDmERS2SegBs/jpE+K9Bt/0/vNL3
 qKu5HkpqWMC4ELHJg/A==
X-Proofpoint-ORIG-GUID: NVd4zyTymdhx_jXaPI1TuUEzD0Mkg75o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX2teS1F6+oJE4
 Min4cvmO7DkXLZZwgIHaK/boAJKcaNUEXWLnPcAl0b446ePZBiy9LNVaUCRdm2lIB6xqRZ/BWFZ
 vSKhIysXw2+jHsuM/Vn8A7u33z6jXrA=
X-Proofpoint-GUID: NVd4zyTymdhx_jXaPI1TuUEzD0Mkg75o
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 10:14:21AM +0100, Srinivas Kandagatla wrote:
> sdw_of_find_slaves() reads only the first "compatible" string on a
> SoundWire slave DT node and rejects the node if that string does not
> parse as sdwVMMMPPPPXX.  This prevents the standard DT convention of
> placing a vendor-variant compatible ahead of the SoundWire class-ID
> compatible:
> 
>     compatible = "vendor,partname", "sdwVMMMPPPPXX";
> 
> Iterate every string in the compatible property and accept the first
> one that parses as a SoundWire class ID.  The vendor-variant string
> remains visible to driver probe callbacks via device_is_compatible()
> for mode/variant disambiguation.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
