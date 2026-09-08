Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A794AA1DE;
	Tue,  8 Sep 2026 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857436; cv=fail; b=IwYyBDmAK05UU5PWRdhx4JSxQBiUq4G1ylED9rZcl+CTopvQNOzQnwLxRXje4HfYFi50797wp8gpWUWTb7ZnTtimfq8QBJ1YQ1SRHG11ZzDMawMs7Ex3q3FWLQrft3i/cgljo50Txm3qOa2l9TbjPjQBkEaga15ZzygVJfjTItE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857436; c=relaxed/simple;
	bh=OGjNk7STDeyzh8pkqvrHao/cBXIA9vcUFIio8LrkNrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdZ2Sk51+05c8F9jjzLLH0AM0ZTRgoKGDL7SxkCqziagDkTNXDCMOoB0mgUnZBIBAbDTDHQIoiRJcF/03OR2VEkJKJrV0UEwbkYLSrg4ktFooGj86L+dTN5Bmcohg5xMf0k4JSuwuWmLcsBEDu2m7L5wK5ybqoPH2U1L/wAWcyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jh/UyfwO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zVio74kn; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jh/UyfwO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zVio74kn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6884pEHN2435247;
	Tue, 8 Sep 2026 03:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=bn4h78Fhd3Eh+CqkN4
	MvlyD5r39/+ISsk552u/bQMAk=; b=jh/UyfwO3qGXF26CyPb98hsAsdr8URfvxS
	NaQKT2ZZ20VTVbEodJdYfpkMt1UnzHTeSK0FDZ69sP/4ocW1611t6P2quSr0liXL
	dWtg7OciwYR9ecjVKJi/+H0uHhi8I1S1uKlgydjqZDdRInN5k4OoDYREipWKt5u5
	A7iuK+z+DBAv1QfHXirGvOaIol18JO7/XDdvwY0hSuNct5ocYKLdM1EJUlVmuqYj
	TjA1TTboVnYiA5yxcdGNebsN0A6eMId+cWi5FR5AJ9Myint76ocoGdKAmWEEFXEP
	rN34qVNP/cSyzcuTNqMynL7wmRpvcnKwV4aJ1SvLWUGRZ3a65KTA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazhn15013062.outbound.protection.outlook.com [52.102.133.62])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgju322-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 03:49:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2lT/RFHkzI92Avd4ic1t1T0SpEjqQxzEevn36bFdkOOHVy7ATBYdx4tr0BQUua8ni+tE19eqODnedI/5AgcQcTKc5k62Nwp4qr8LAjEJRvPCdWJYaK53MJJ4Qxvisp/Gn0aS8+dsEKvGmJ+iE0257XD3fTNXFQ/hZPtCoyDwiyJ85Duf+3w6ygG8nX7Dt65Bq/NabRtpCwHxD+SRpvSMHZtmJbh/PX8P2iamc9Y5f9H37OHWumbdwtKw/1eRzUWuDOKRG5uzKa2r1d/7IFgzywj4VmjKA/l5Yw0uxuYJd6NEzdj00LJxglFJcq+Xbwx/2GBDCurEB+IKfWBHn4NPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn4h78Fhd3Eh+CqkN4MvlyD5r39/+ISsk552u/bQMAk=;
 b=MZwz+esAn4UPPFNgU1Q9NWZSmQjOd6di4UTzy0iIcdIHmgP2nN5taIc8K1GcgA0iP5Lxv/DgytFEEdUgEGUsAwmpjH08jEaecSLxIaQT2/r5dgmhg+XaXa58tQZRRfWONE+qurn6sZPXXmuRHs4/FcEeJWf2jmqQVPFbWhJJK6iIBLwtNszVa8aDQQ7B+Vs5o3hdhkX8okAbz669lGn0gMSwPdCqJTN1z980fCeyPYUdZGwkj8pRiwF8vvXsbrUB35sBgPSLn2vNZOcJRpGqFTo0lTcFijob40FNKawcmd/6JAjQKdK6S9jgMm0hskpRSDDnBivsJGHns9b1/JSGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn4h78Fhd3Eh+CqkN4MvlyD5r39/+ISsk552u/bQMAk=;
 b=zVio74kn313UCoIXLay0lkdjOcupjNJXvavMGkRYREEYUXk7X3BF7naeVQAXGOo9la2JpTSr7D561ZqXZ0fUcg7/PGzoEjumMKn+OKuTB+qDzt6u0pkgdkBo9Zz8lh7XshyGLUtCf9Ven6Tco4wbRuQMgL91FSMgp8B9X2x0nTM=
Received: from MN0P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::8)
 by SA0PR19MB4489.namprd19.prod.outlook.com (2603:10b6:806:c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 08:49:28 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:52b:cafe::2b) by MN0P223CA0017.outlook.office365.com
 (2603:10b6:208:52b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 08:49:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.1
 via Frontend Transport; Tue, 8 Sep 2026 08:49:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59B66406543;
	Tue,  8 Sep 2026 08:49:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 393B2822543;
	Tue,  8 Sep 2026 08:49:26 +0000 (UTC)
Date: Tue, 8 Sep 2026 09:49:25 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
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
Message-ID: <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|SA0PR19MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a1e70b-8d63-4bd9-49e1-08df0d861765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|23010399003|82310400026|36860700016|7416014|61400799027|376014|10067099003|18002099003|16102099003|22082099003|56012099006|11063799006|4143699003|12100799066;
X-Microsoft-Antispam-Message-Info:
	EL7LLyx4jvWn88b0WDWBFyzgLvo5w+RHLk4GNu9FEQzG6juLt1e84gUw9qgH770dgRUQ+z4/2JQOSUsFQ1BSNqrHD1qGxBJ/UTE1NonJ86IW/vj6Mn8tq15H0VhvTlToucGXrdjmAq5Bc7f8DwTaPyzmm4NmN3rjK8QbY7VLTWTB8lCJdb8+l/DIbaGHus+q61P3iEaD0oX0ToLs5bZip8yodlAdEufrAEscqKHaR/pPe94bvDI9WhKstAHHxOHB0kGq0ghTNhqTX6Xxk5nJg7fi6EzPuuTIWAbj5CyTA7xCyn5ZWJo3adLvTKFlasjnRJsVW4t4sHbn407PCl5KBT94tUlbB8QweDxyNyuTk0DiCu8acUoktzRQ3QMz5f6K07hJMyDCtJ6vGSw5BByVUWQTVM1peUR5WrmOGy8JizRssFkC0bZAgdfY01xg8MJ85nqabCNLtYxuLFVrUuC12I4C/WEdSgcuERW+aFqoMb681T0R4BQM+qq48ohg4cKVqR3k2fT6H+qJpOgAbQv/vO+11axrNbreMjfXvaaCQ/dnqDglp7jvMGo6dMuzwVyyl7NzxaHiMfDCnIaukzLliZ3uItHz4x8/HBNEmQKzPuZVYtoYL/G2aXv1/MQQMiXICMuLzez3brhkFKHhi24BjsN0VWO9HGS21TqVbcCiO0A4Rl3xz1JmYY4yh2AUEe4HrJ2YrLQ41oxgIYknWINb/w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(23010399003)(82310400026)(36860700016)(7416014)(61400799027)(376014)(10067099003)(18002099003)(16102099003)(22082099003)(56012099006)(11063799006)(4143699003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	08YnfUPWETga0ryyUBzN2pSNDAlXjhssuTeny70vzos2pQESG2QdnMYatO7SND+VdJlqnUuml/amava0BvaDo5u+ubVa7zBeGMDt4J/z0YMV5FcubtTDF1vEKfUusZdkpqhoU1OS+OOAq+VDkCG5weIh9tfjWRoaCCxGB52WGBMDwJXbVBJk1oBlgRGpq9Nqws2drqPZj+2FKSZKW5vsDmxnxrWI54sgDk/JsA6GAytA9Uh+W20PcmdJE4hrI753twYqNhf6Crew90Yj5c2U49m4/AtLneYkAoP988SNZFGWQpt+nsnOQ5HeKkKZPCS+tbxF30QQCnzT7nlQyAgpYdYonuGZsO11rF3EV5zEzLOb5cqNgnBOvp+4UctfgRXtUmIba8nEk+6KpokUGIGj5/tw1GjQx9e8fyX7kv8pvscN4gN8R4vWX1Dj5kZdiV1T
X-Exchange-RoutingPolicyChecked:
	VddhUqycCXo+kO/ukWMZ2LAf5Hqa9Jbd+qpJBuO4Ldo+ctIwcEobtVeBOf1B5ZS9SAgsqEVRgtcnZM6GrvITejY/tEgP5pCBQuOq4MinuLlhPcIXejcX/pvWH2z/kzJgocqMc9OrIn34H50/6Tx3V/5s260T9uB4kcX4/seNkd5CZ71ilet/2ARgsMCoWvRO1jtnFILTTorx4OzbareCUUUZq9x+WUXJgP1jr1CRe4j6gLTFj3H+CH9duNMtS/pBdmLCHhAPPumvSL+1+58w0w3s/atkjDcK3P4dk1nHKMQ24NrB7URxfAKg16YNGFj6XoL2XhZ8S5tpu42cPH4IxQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:49:27.7062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a1e70b-8d63-4bd9-49e1-08df0d861765
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4489
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9fcc1d cx=c_pps
 a=VqolhKNzGRpeuY5667+sOg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=78B32pUPY0lhFY_OrVoA:9 a=CjuIK1q_8ugA:10 a=jZz-an6Pvt0H8_Yc_ROU:22
 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MiBTYWx0ZWRfX4N8GxPgR8aRW
 muMGTnNVUoPJtCQ5dNX1ZkrXQgHCt15VuA6Z78R08qUpiDo88UMg9zpXuIksnfWOQQuoo9el4co
 aD+kRdDA3hHVZH1VEUr2EviZBrrtmRX1r/RatbWZgbcoVBmjiUkZijmBdRPfPzOvQjn3DQBiW0s
 hVt37lyjfnZjnhzVKgjrvYNobnFotRiqrUWl18jk0pMasROQ/F5h2qlhIcl608Z1QjDv3nii1fG
 2JQhM+/MKploW9RSidCy8GfqerG/I0oo+Lfy1Xyx7u/7OoqSof6Z+e4EovjytnS1lXPqV+gPE0+
 OwLKkKIvhzfwPXdJU8v2D7iKuK+u/L/vDujt3J6zo/ZYSFT78nYG1fr8VEgz77UUCvWd3iX5e6S
 elZ1b9iBSlvnLjVQfNyLVrxtgEjpss29f4daDSsHMQVmCFBDRWqSfLxzqO22P2W60Cr31qwy6hu
 I6HNpY4+DcSh+sRPUSw==
X-Proofpoint-ORIG-GUID: RRKhfFRlcTgzp9ew5ErZ4PKzAJ6kBvfJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MiBTYWx0ZWRfX7kM+fpSED2qd
 9JQP8fYL0w2bzxbOUPaoQqu7nNyysMXq2m9brI0ZeKDeX0/cgny3rbOHjlLWc7MHk89Yx3BCNYj
 fh7m2R1Fvcy7PF0KhBDsB/qIQco/LPQ=
X-Proofpoint-GUID: RRKhfFRlcTgzp9ew5ErZ4PKzAJ6kBvfJ
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
> > My take is that rather than encode all properties in C, it's probably
> > worth exploring a DT representation of the concepts that *can* be used
> > fairly easily and make the life of codec vendors easier - not as a> literal translation of ACPI.
> 
> I agree a DT expression of the *concepts*  not a literal DisCo
> mirror would be a better A.  I want to bring that back to LPC 2026
> DT MC as a concrete proposal grounded in the earlier DT-maintainer
> feedback rather than re-litigating it inline on this series.  Because
> B stays put, switching A later is a change inside populate_function,
> not an ABI break. so landing this series does not close the door on
> the representation you're asking for.

I am still not sure I really see what the value is in a
completely different DT representation of the DisCo information,
all it does is give us potential issues with future spec versions
and create a whole bunch of new code than needs maintained. The
ACPI representation translates perfectly well to DT, should work
perfectly fine using the existing code.

However, that said if people want to work on doing so I am not
going to stand in the way. It does have the advantage it might
unblock things with the DT maintainers, since we can focus on
doing stuff in a more traditional DT style.

I would also agree that this is reasonable as a half way house,
it seems like a good fallback mechanism to have for emergency
work arounds as well. If we can't reuse the existing parser then
there is a lot of work to define a new representation for DT.
Ideally that would be worked through with the MIPI group as well
to avoid future specs causing catastrophic issues. But all that
will take significant time so we probably need an interim
solution.

Thanks,
Charles
