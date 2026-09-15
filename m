Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5444A8A12;
	Tue, 15 Sep 2026 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474676; cv=fail; b=lLcRF8K4mmOAKQRV/2yT29aBJX59CK9LwXm4hIDEZ9OjO8DqAGclbtZXFffLOpfTOnEXOG+dyn0jclsHQg0BLWgKLxd2uMYLqs2BwxfAdEgWlHB/YNKCzs+JATAu9mihLb7mLjkJIdCGDim4oUmBD8UYm1OBOmkaTEAEfSurz/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474676; c=relaxed/simple;
	bh=yHh57dHi1tUzAidtSZ2acPbLoQOl4jPhfvxVSdmKkWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/4ybuk682MHq22RD9s5Gc64AZEYnT5tR+P2wIsjK2PzO+T3K5s2IBVVZqn1ilfndSeqYmglQ+mTSYgl8NrhIjiTQcG+ha4YlsKQMRSokn8EzVKqkRuyrYLHW3zZnN3iFrNteyFe71n6ixnOeZ4BSH6ztBi0kL5IS+khuzsbzs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q8hW8DN5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vYzdTAhq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q8hW8DN5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vYzdTAhq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6V50J2901892;
	Tue, 15 Sep 2026 07:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=402TWV8+7VYf/aS2uN
	Jx9mS5lWNEb0f8H3+lHllK27k=; b=q8hW8DN5oG8L5UEdjsNWcN5sRDgsHOrCVG
	J93ksONAsAuqM1T/9+XQkPciTeHs4ssb9vOqgFWyXqdAJcnSEpjvfc/K3OlVG79I
	WWVGYWl41v51BivAdfnxCj4qhPpLXZHshyB5TbR0Rj3raVsa1ABQggChRkH3AgPT
	u78dAjkkc96JQn9anrxzleqQ2o9HwOAoD6RQSKR+ewkqTS66FG83Pn7lzykFU/ch
	mrJxdl5UAZF3DyB0pmN+aUOj2oexgWhWmphk2RNvyfOQd4mjgrXDbsHlUp5hmwSX
	CChuMrz61nD9dSZdEiGFlsKOo0bz3f0d4o0bC3Y3aFYA0iEfiZkw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022118.outbound.protection.outlook.com [40.107.200.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35hbbqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 07:17:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uURb/O2v5Zw9lr5mkdMS76rnRXIp7o83M8ejyzUzv+dNyEse/5xeXofPmhqXOmzZwkBpfaCklkjcGAl/Bm/RF+vHd45euSBM2S3FEwRhsIRkwVVC8clZTh8Gyi/5aKa5pAYtnhEjEp8HfkaXDfSCyoNMoGCzAFqmt+quCgHpAZPwhgkpj6ZpFTlHlr0fKa3Si5yXiJlYyqx6N9SrxkKzvnJUJRtrH0uxPtxjrUeiTiF+iWrKC/54DWm8Pokx1Cql6MC5eoGBy54dpGjMtpkZGsUi+cz3cqeeB5IL4iIpvJYu9b2brTEw/nWS3FbJqU+cxKkLAXw4So+oS2YvV4EoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=402TWV8+7VYf/aS2uNJx9mS5lWNEb0f8H3+lHllK27k=;
 b=lZtoRWwy+Sbc+OA39p2DUM1WHMr568C3IEG+PDOzyHjK6Y279xXzYQlOKIJcr2pqptOeV8f7M/RwHnwhqCk6usw14wkNrLDmU4HAkSX+1enqp8wIi56ubTwmfT2r5JLhQoUtuXE8W08x3nT/DJ4nHctRhw5426FCPRfIktJyvno6IbTdX3v9efAeJXR30S+KbVDhXXyeDXY+5ZZ4YabBIr27m6OV6+Qq6G8dvn2HKUucq9FNedPzq9hbU6t5ncXu0AdjlB6CZKmIRHoAWCd2Vc+sfLIm2m83kUbT01vTjFGM7MXnqau2QlHSXJot149S8JaB3N3wzJQEqUZDOTkDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=402TWV8+7VYf/aS2uNJx9mS5lWNEb0f8H3+lHllK27k=;
 b=vYzdTAhqbXEuWpzW2TCFPxr6uUVoLiM4w8XYpM44hBWCO8/SVv2/bryY3dpfQUClwW1e+dBGdchoth58Z6h1sBfCAMciNWu5OMc7EG+twnR1vOZYq9gLwZK8tm/EMn58gQ3fpJ3wIbGKwYgjUNi2589EFWI/xkoZBHCINiS4RXc=
Received: from SJ0PR13CA0110.namprd13.prod.outlook.com (2603:10b6:a03:2c5::25)
 by CY8PR19MB7058.namprd19.prod.outlook.com (2603:10b6:930:56::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 12:17:31 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::30) by SJ0PR13CA0110.outlook.office365.com
 (2603:10b6:a03:2c5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 12:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 12:17:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A856406547;
	Tue, 15 Sep 2026 12:17:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 81E5A820247;
	Tue, 15 Sep 2026 12:17:26 +0000 (UTC)
Date: Tue, 15 Sep 2026 13:17:25 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <aqk3VRbkzusA3qBw@opensource.cirrus.com>
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
 <20260911161903.419814-3-ckeepax@opensource.cirrus.com>
 <8b54604a-ec75-4c84-9909-358510f6f3ba@linux.dev>
 <aqkMOFfQo2YRYt2C@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkMOFfQo2YRYt2C@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|CY8PR19MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 49dcafaa-e21f-4a79-20d0-08df13234f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|4143699003|5023799004|11063799006|56012099006|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Am84Ku0mbtS5iAyjxwlNKChPo0jIRTWa6nSQHjaGCSXad7K3wX+J8hSLsMh41BLQh3Bx+iXorQ+kS4xUOFw2MFoPvwISPh2bCLPmh6GKvv/DVNGT3bOBtAYAhGSE/mlEY7CQ0WblykcemR+ezKBtSNZVrIFZJTALo2rOB972hVegaJ8B5BHcEH1KvXEeItvExTwhuCgPGYfO3qvtfLrqR7Fx2TrmfLa56AOFwXEFNQIXMAohEbfppMHqi6KakzN4mlsdL8z1RZIqIPtOHydDWU4ZPjNdJ9RPCbxi7JRUeE/hikj2ICKCw+aXlvdLtSlE/Gp3Nx/gXgFf/Hii28N3gLYttZLMybcqyLhinT6D95X+o/kBVwk14LHCfU768UB+Nbz68HsWohjz1cOyCehA3ZTO8jeFdSKLYxDYJ0FMzZ3hWN/ikJjH1PT88ps1L2J91crt5H87BwAJDv3x+3dA4X95sCg0DRyXGAGot7kgDKydAwKKw4TeKSFz8Ws5lr7U0Y9bOq/Xy4R9op0I3qFYUReOyw2BQm3sEb6eMVQJ484aUelpJDjFdQsW8TWPAh4zno5/HzpBlrrebgdwkNk2/hlKlpddzs53FQtWzx0MlUM4caKGPjlskR6MNEshT6YwJqPdgmLK5KEkc+IEviR7GuA0bWGaougn6TTgKG512vfOsYGEogyn4qyO2/L9lH+vZA+WWHf6UTlcs1mFX5YhvA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(4143699003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BVg7bbZ4+UQmKQdcuTC/Izb+VW5af1jYG9rMvwGDWwGbnMLCaKUVBd4K1zFaC+V39bLZNPA/5GlUdQhydxHwG/Kb4JaLx7fzB3/FzsAdbQpWDugPBgcdp9xByAeFuAfmbQyxo5jFx+jeypksbVqksk+oRn8aRQdntH3o4Hl7ViEh0aRTMGRbXAYeeYKHc+tVvOM7431WnQqnjwOKWP4Cxr+AT0c1Zd29pf49THsiQ0buf2JQ/tYxakbIrx8/kaueklDkYWuDPqS0CK0sYZ7pzOXdXrVMmVU0OvnO5m0sri01msscE4oOK+bxElLZneiUdatoNNeqUNQ0jvniHTw7J9XB8kjLycL0zlbHtQExmaxEnLiI6mYBy9dxixUi5Fv++hu+ij6c3soqSdIdkT7U7eF1h1Cbu7quG8AFgg/D2VJu/KcGXf3c3pb0mOuu6B/d
X-Exchange-RoutingPolicyChecked:
	B0iRbOllJebmCO2qxs6ZPwCTGgwQOhEdfAogpX+YuUKdP7M0Y6AAHNahw/u42KURd5zEANwRTk2u0ccuh0FSFqetEm8nCK6Xe+rub7Qjs77ofRoD2liyQ5Ilu2WwojYCBb4hkR4plAzQ6y4D2t4RtKJGcClsLI+VVaybNBSqRTw3sWxa5+q6rnE+BCMZ3ziId1+U8uy78QpnHE74DHQeDWFFpqSjQ3si6IYhIEgX49bH+7wXX+PdSyCaQtIU5OIEFMriSgv2puKQnmY5gNvwfzSjhanLKnkPRcfjiJUqm1RZkyDgWmzL/+SDgiXagwezf0D0jmvWOBByHB3uFicXNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:17:28.6348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dcafaa-e21f-4a79-20d0-08df13234f90
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7058
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3OCBTYWx0ZWRfX0ni7huxb3mml
 lMOQcAoSgkicvbIhsuAyF+Rfn3Ujuy4o/HnFhh3vdxcSnPmWnPR797y8YbZuXw/PURAxtIeZ0rR
 Idz2qJJf6yqcGcIAy/Tt7l7U5slFkIQ=
X-Proofpoint-GUID: d82XKKtHnRynJ1LvnUGEQxX5yobAaSVE
X-Proofpoint-ORIG-GUID: d82XKKtHnRynJ1LvnUGEQxX5yobAaSVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3OCBTYWx0ZWRfXyOt7PwZ7sBDa
 cw1jsZ37UNgQgSE2At2dPS9SIAEsNj5FE7YlpqCw53yXmvX28kQlHJhNML2AuQYPlMd7eCCyFvQ
 0Gz1LUn9xwfOko3B4HSc6xw+o+5rIrS55+py/Y5wA6iuQih6RAxWCoWXGJwSHk7igoh3QcrBXBW
 6g/AxG7oDaI5y/OKvQdCgUro2MOMOgcITBtKU0DQOnGvAvRwXnLKgJ4DiMjhjG8rSWfNNZkmama
 StdmILU9h/jCr3paA44vMEu60HXkezLsDpMNcJeN9rUpmhAPFwOJJ5trx7UbKEVX21MKcGvNmwZ
 6s8L0G8vFDWjQECmqHYAcAZCsFCmfDXj5Xqth2cwib5wqg4s9FNd4bXDUB86lHCTdWB2LEKUhZa
 r8ZoroO/oRcn5R9lMHZd7GSc7KisNeK0Bk4OHFC9JOgCOjEqCr02DPtNrxemBaJ/R7/fE9wvqkv
 kLEyiIGh3F2ORVOpGhQ==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa93760 cx=c_pps
 a=XvwqfKrzn4xeEGDWI/eySw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=bL-WALxxAFm0Au93x-YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 15, 2026 at 10:13:28AM +0100, Charles Keepax wrote:
> On Mon, Sep 14, 2026 at 08:27:23PM +0200, Pierre-Louis Bossart wrote:
> > On 9/11/26 18:19, Charles Keepax wrote:
> > Sorry, that sequence looks really weird to me.
> > 
> > See the code in
> > 
> > void sdw_bus_master_delete(struct sdw_bus *bus)
> > {
> > 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
> > 
> > 	sdw_irq_delete(bus);
> > 
> > 	sdw_master_device_del(bus);
> > 
> > After doing all this, one would mask the interrupts on the host side with
> > 
> > 	if (!bus->prop.hw_disabled)
> > 		sdw_cdns_enable_interrupt(cdns, false);
> > 
> > but that host is long gone.
> > 
> > Does this even work?
> > 
> > The last sdw_cdns_enable_interrupt(cdns, false) looks either very racy
> > or useless, no?
> 
> I mean it definitely works and fixes the problems on driver
> remove. I will check to see if the call is redundant at this
> stage, or if there are any potential dangers I am missing.

Hmm... ok so the call definitely isn't redundant nothing
else masks all the IRQs. However, I think you might be onto
something with the race, I think if we get a slave interrupt
in this window it could cause problems (queues cdns->work which
then uses things from the bus). I think we might need to export
cdns_enable_slave_interrupt() so we can separately disable the
slave interrupts whilst leaving the other interrupts functional.

Thanks,
Charles
