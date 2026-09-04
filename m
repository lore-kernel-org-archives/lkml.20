Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2648094F;
	Fri,  4 Sep 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523942; cv=fail; b=Txen1b4lUSCO6eS6P4+pnHgmHrWmxtVufW9hLXB7zbkXjrOf2XYj/FijtplMZKBy0rkQNrpagpmBmzUcDpZ3BqKe64bBEPxUOncVKh+NDfN+tYqN0lkq76oYw2ms3tp014Zw8M/7GegwfDOsGP7twjyPuHOA178pV/XX4M5/XmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523942; c=relaxed/simple;
	bh=6t8OFHwDlUFIgm1TOTYDTkznK/bQ00wmfGz8sCRzl+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TD4t8n1/hSLirr9cQamyQgXy7CTE3wQcNC6vo1eokTBLywFo0+ObedqAYWKaI43nL47d8NUcJJ8I0JDPeARAkPFIo9QPJLKqRugY6HIuoOCA6ZC3pJHJwnIJ3O/FguHaRL1GHi4SnvWalksHqXHNl3qcPNtkgPk2AmEdWHEG1TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eGrLHF6+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wQjXIALm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eGrLHF6+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wQjXIALm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6846Yl321305646;
	Fri, 4 Sep 2026 07:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=59cNXLJ4mD/f3mku2O
	hThwcyyNJyrdrzT9kq39Dh2y8=; b=eGrLHF6+tuhgU7iA7FreRLtAxfgNFCdoWr
	Yn5qaHpnNvMF6ZhH9mX96z9xf4HL8vE3w8FBoQuCVeiYPHn8AqY0tqVEseUPkuLP
	4mEhCunvjnLtK1iG93Y+XwCRFnsNeGZd1mWnVOmMbqFMltkC/hkXc9XIl2CEJGTY
	8R1vsypbXd9D7/ztMuqAWBO5YsNIP53x+QC+em/CaMPPIUKDKcXMQgNoEkWJeNq1
	Ek33jZarTDjZWE3qabyDCor9gQ+e9l8ycth+FLMJ6tx0QaC+sjsnWu2ZJcqldodO
	2nqfdnWDSQT+80uEer3uU7YjbX8o0e++Kp8SbbrV/4PsCDNiAoOw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023120.outbound.protection.outlook.com [40.93.196.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntnfka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 07:12:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sN2G8F1QzmNdRkldzEmSy24d+0d0S0/b/PQj3NzJKbV247PuMgOwyEJs+jM/Mv2O+uoNVkBo+NtlJ1H23SSc50TtbqL4Tu5DzR8fpfDS8vY/zICcjOqQSLQa1TL7FV0s5MEmAymhTpRQT14eAy4yYojXaNDxO009siD6TIUcSaJtBKTHJ8C+BrnN5PZEht+vDinsCwXhjFkZc0KY456851/1rOM+RAVTXEdjIdE6c1SBvviT9KdRB+Mtu/PK6OvwemdmSouZcU4OCGPvONd43mI31YLSBMOoonGInl8HyPuDhfXZMV1W0zWV0ZWgX0cTGBB/k1ebh+hz/3MIpUlOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59cNXLJ4mD/f3mku2OhThwcyyNJyrdrzT9kq39Dh2y8=;
 b=fPQZ4ZLGfledSZR1TwC4PW1V+lE3CFUhvMSd2rAe6nyA7ChGuslfY40+PaDtbfY5I1UNC6cpKf4usuOmNZZ/ql5AL7zuibwRXo0JF63Od2D1AhhYf0ILEb8QqLIHZzuuKVVF3GTQi2Ik8cLkXciso7fkQekllwzhyhvOqbKLMU+i4cuYSfT5Ixclks216VBFeAT8wnatyBUnE1YSTJXau0JTmUQA0lfwzkbNdI1BAM4R8r5v21KMdawZ6ezNQzBwHGOmRrCqfLlacZi1qKl7zmXZDRO1UP6N4IS3PFHg0XG+TuW2MLX16PfF4xvssTtu9ffZpiis2Cvw24glkGH9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59cNXLJ4mD/f3mku2OhThwcyyNJyrdrzT9kq39Dh2y8=;
 b=wQjXIALmrSaRrV7fvmtI7/sqfDgxt8GHmUZQXt1vZCUWZFNqDY0Y+V2DnpJNyW+3xPJS13O5QVH8GcweL87y3XU1XY3KyHD5+OqTukSBsrda7Oqdee97pz1EjF9mrozZO29glz6by8FJ+gbFen4NUbt+johyyinn3AGhsZEV9hg=
Received: from CH3P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::9)
 by DS4PR19MB997333.namprd19.prod.outlook.com (2603:10b6:8:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 12:11:55 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::83) by CH3P220CA0020.outlook.office365.com
 (2603:10b6:610:1e8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 12:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 12:11:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6AB9A406543;
	Fri,  4 Sep 2026 12:11:53 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 56ED2820247;
	Fri,  4 Sep 2026 12:11:53 +0000 (UTC)
Date: Fri, 4 Sep 2026 13:11:52 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
        vkoul@kernel.org, vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
        peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH] soundwire: debugfs: add root-level peripherals table
Message-ID: <apq1iNvPvf4+RgGW@opensource.cirrus.com>
References: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
 <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS4PR19MB997333:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f315421-5080-4139-eec7-08df0a7db616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|34020700016|61400799027|376014|36860700016|10067099003|6133799003|22082099003|16102099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	fcnGnZZDvIGNsX4lEhpmsCRCsUOeG/Ql+GFfBUcN5T51+bNzdD+23sN8hmHhCP8uTHj3punG/nkqkHzwF+yFY3MRotQ/AfduJf36LniSy9pk7WP8TkWaTyAeQ2TD1OfXhYaaAiRJyzGwbUCP73U+wGjeUGsI+BTiHQYu7Tv9JtqrNLJEgrESRJrDlRG5TWZBWWWNSO8xCRHUbix56eg32nLQnqDa5n3FKAEx2sI1Qlw2rwOi89CspTeLgToVuTtfKhkj9AvVW3LVXS/YcAOyx+33CGeMuk4YrRffyOvtO5FmkzGt0zJPZbCkQcFPwzHU9YnsDBHfL1vUbQhKZwJOWob8UpUOwGmW+AEFdDmk7HxJ2t5fjOB4qzdNL2lTk9Ur+J6Qbi22yEC1S+IvsbEBig7+tdffnP2rMBl0dV06gRI70e9mB8aYGPqh+6GcFMAm/Mk7/j2anG0dFaVYCZW5nxHWtf4lzcIMMOQlXGU+ZCZ61gPS2LasXzlzVOngKbMdyBJpsBEB3w2sLhEUpMgnysTn45z8ppwTEo7Gu2GL+evn3CiCzTRZ5gD4JO47TYNyNY883SmErF4xJmmZR+y9VrPugBpnu468xKxyza6P/f7e4LmP79hjlThBp8G6DUAHbnFV9WB3QK4yHd4X+uGus5KBIJtXk6hWfUYctd21QqmadBzvXvkMyiKTlejH1ahSlfP99Efk+PSMZA6OWOHGaA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(34020700016)(61400799027)(376014)(36860700016)(10067099003)(6133799003)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h5s1eR+Z7wF9cSvfy4y61pqPUcpkDJPOXljwGG8cWgdn1K0VLWke9ZquPPsxSaajaiDWXKCEFpUrjlaryoyk/3zoByFQw7YKx04T7Ol1LpN7KyweIOeaI07G/4g/6c7AvXbg5aOHfbtFqPKInfN8kqV0G0PjyZmX1u4f0lXAHZwDIFiRcrXUOtaysbe6li6BtV4WvfWSC3f1hWUVWpDkmMrFSpaPrclJn/Tq49QyQJm3SkcvcXoIyfl6BYKMX82EWLbrm0LHc6mBFTuxEOOMgM7GKsa5NRRWeclgiaj9VQ6w0CnEt+AuxwDPkO4X8gQVxcNwO25NlkpQt9WvXgQxdr8CoQKHA33bl1Se3PaT1i5InrZSPJNQSx5GP4kGu46H61flB/l6zJKLszBLYswML3abqgNbKHd0qGPg73ojLEIqJdeb7hU3r0PANsH/dPYA
X-Exchange-RoutingPolicyChecked:
	ne6g70KsxHDi3CAAySr0AyrOVKYxXQNNZLQBLjHnZVh4orIgQE5Bh8493OE7r90bpfH+DQUDuPICUZ/cJ/KsSWrrlbIKfJUhzxZaCya7Z+y/mZ8ZabvOpbA9iuKOPp3HZfDDaqpiGNta8UlYEEM74jg9c8Pdaur/KGYoX+MDFHklY1uDxje18m79HdW/d1vaXn4kJ4QrYFRsfNUU6pwiPLkmfChGOLDVNGuhxNrU6ujPcjv4skOTrscVCQSIkWD/UVqfygkuEqPOMGqy8Uen/rxB1H2YZyNu2DMprkdrxGE8ZVXAdOY+4A76MnxG5mKcmYB+1bPVjAf1g386Q85ilQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:11:54.9683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f315421-5080-4139-eec7-08df0a7db616
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB997333
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEwOSBTYWx0ZWRfX7JG24PC82vht
 8WJsaXM/cQqTB0PCk5ky/xaMDLGInQlDQzG0sg+roiILsiZXEt0qURr+LLGxNoKkgMBiodyl2rI
 v516ddeYZpV4S/h8gSRxYIQuVEIDBZMlxlLJN75BTiiZ8NfTaG5l4RADr0njqwlNmWdMv47EsBf
 xAY5rcQu0TNJlKN9CraNpdDnmxKQpMJOyjV/dUqm7ob3ilkmDaisgl1wHXi18WQWuYcbIUOljQM
 lLFVgjIE+sJFf3BJ63abyB+ILtUo739tHGSMg3P09knI0dCvDZgc+x8v18LZxtdhKpzHjKT/6WR
 aP5CbUHONw1gUZtuo1ZUtHlO9nPEj6loGE9jD5OTrkkNSWNKTgbkjJP4FQ8SnJvI5zJ0mYkjMpi
 MZ0jdMSPRFYvK83ZDRQprXm+1XDyGnq5fGhYh1buwNvx3GnMa/suxty3N66dggtQDKjOQ2YHzWz
 4covfmdcmTISaCqz21w==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a9ab590 cx=c_pps
 a=obCHicajeL4Z6yanQ/wdqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=hYDvdGWTe_dWH2bTkOkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEwOSBTYWx0ZWRfXzQ0f6gxQ1TT+
 IbCqcjVClkVYuagP6UsHti+9jNb7C3bT7ivKYS5FcJujTum7kro1UKOD6UNu8Z+KjA7/KGuSTtU
 /K+zK0cL+qcnDEnWsJYGf/pdRyxE8LA=
X-Proofpoint-ORIG-GUID: oq1Tv16bzf6C79XdNORCSKkB2MLQCdl0
X-Proofpoint-GUID: oq1Tv16bzf6C79XdNORCSKkB2MLQCdl0
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 04, 2026 at 09:35:15AM +0200, Pierre-Louis Bossart wrote:
> On 9/2/26 10:18, Bard Liao wrote:
> > The table will let user know what peripherals are listed and get the
> > detected status by the dev_num.
> 
> This sounds useful indeed, but does this need to be in debugfs?
> 
> We already have a sysfs entry for every peripheral listed in ACPI. Each
> peripheral will have a set of properties extracted from DisCo tables,
> could we piggy-back on all this and just expose the dev_num?
> 

The dev_num is already exposed through sysfs, so I think this is
more of a see everything in one place kinda deal. Although I
guess one could just make a script that pulled all the sysfs
stuff together?

Thanks,
Charles
