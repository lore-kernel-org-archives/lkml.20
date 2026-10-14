Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E24DA9CC;
	Wed, 14 Oct 2026 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971826; cv=fail; b=cSH+10lcIqDwFlkVZbHCDPP5bQd9MFh2tGZEBjuvpjVC0bi/ALJEP67cWi22Xz/iOMnzXlHm+bd5ck6scX/CNtaLCraIIJLj1q6eCVGcbN1bs+DzV797ys8Ri/uFCjeCl6+PfixOmwPUuUgj6iazXxpayX3TSkaIb76cnPTTRhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971826; c=relaxed/simple;
	bh=XZbDtmixS7sX62ehLaPQ/haYLZ/aFospGCOoDSbdaHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qn3dOAqtFkzMI88fcO2Yld8bGpBBSjUAKeqp66JI/d0N3LCvoiz3uu/Z7Py9VgSUgDcDksPEHYT2hHtIymyn+4B+T6QTaz/gJQQRD+FK7bo2El/hCWtasXda2dE0SZYnMJ6HigOstYBLY3RwQQq+5WmwLagtWhYUec2/sEb8Rpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BcfmCmkk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k7Pc7zrt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BcfmCmkk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k7Pc7zrt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8R0kv253412;
	Wed, 14 Oct 2026 04:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=50il6bP/yJeovbTLqZ
	jdBocHcB/sMQTR1fEagV+jjH4=; b=BcfmCmkkCo19DkaVGI5c7akiBsCE/Pv9lj
	u8AjGz8kKhtyaQchNXX7lk2KfZ0ZDJC2r29PAFH9EeIzMTNr4njz67JB1raJplXl
	Av0fNUAHPoW4CbsBieXdO6UlzYo8gJQvaC+FXiPK1Hq46y3hc2juf2K4WBkKg40T
	1SREXvJklmzhqHOhGNguRHtbCAKqBatovmxxKYaDjNnyIAMa8ntKBBP0QmKLrg1l
	uuZ2qCQefaFb9MULOEf3Fi2jTX3zaF80FQUII0CdjXArnyG0vJH8Nyr40IzZaIp4
	VRlRl0CJ8S9F1tk1rKpmDH5QO6uizc2ci52T5uKmf8oRqbK8r4Vw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021101.outbound.protection.outlook.com [40.107.208.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxdcxw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:57:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCPNLmRvjXxbq8fu3X3WxhWXsxVabl7QpK+361Cvuv7EtA9hac9cPT91K4Jyw24sVcX6+S2n4F14+yrEfAVcgXGfmKrL+SaMUnRFvKY3DB61AOTBeafB5+CjevFz6skQSFHMyQ/Oey9pReCZkaAGeDRIVUmqUAcRguqstFUg+6m0NBi60phazO19HIjFZg9ef6JlIgNYJf0rRvGsQGdrmtwyLFJR1wD+AaOvts8Z9oWPnqtv+FucWvvC439BajMo1LK/EzPgCZCheax/h4PKcx94BLYg9Ppbrs8A2BZ+ppvTJnyYYPtYBq426LjMPkra6Q1jdL7RvfTwFUNR3eZNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50il6bP/yJeovbTLqZjdBocHcB/sMQTR1fEagV+jjH4=;
 b=t3xTf96iX994UoZPLs9A1Snzu1ghOxVtXwgJgqyvykTJnYKiVt7Kgapa3SSZPbyhaPpXLkRuIYuIca8SqziNmIF98NN9hl6NSURiYg1hNtb5N1EoGn3TTEbL1ChNsDzlb+DBoh/5ZLRGe6cxtGP0PM3BnOwf+XifFWwL3Du6xBpiFvsfTA8WUogqLr8lBVJHqNcXQ6w7KxMoN3pnTJPgK+uXKR+IY0kLlOc2JKZLLhZ9K1dc8nz13Gp7vZjIPNOxlPisjCD5o6zmJkO3PYS7AnLCq27AdlH7JmEerYrWQKeo6BgZKM5r3xC8waVuZkLHRAQsQL5HNU2vHL/wCmHAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50il6bP/yJeovbTLqZjdBocHcB/sMQTR1fEagV+jjH4=;
 b=k7Pc7zrtTlQkTQKPG7AUac53pz2K029LTi08lW2HJuJB3teeosoekGLS8DV6I+3wPmZfvob5HFnXiEm5IYgHqDvvLYLx/884Hk5PHGiO4dBHjbqn7DgqTq9X3Qtxk4fKnUQ6whKI3Wmt+U5vrQ+Xco8YW+JYJz6IA32E8AtzZgA=
Received: from CH2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:610:4c::27)
 by SA3PR19MB9621.namprd19.prod.outlook.com (2603:10b6:806:496::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 09:56:59 +0000
Received: from CH01EPF000BE94E.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::f) by CH2PR10CA0017.outlook.office365.com
 (2603:10b6:610:4c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:56:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH01EPF000BE94E.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:56:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 39D28406540;
	Wed, 14 Oct 2026 09:56:57 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1654C822551;
	Wed, 14 Oct 2026 09:56:57 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:56:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] ASoC: codecs: wm_hubs: Fix definition of MIXINR to
 MIXOUTR volume control
Message-ID: <as9R6MSS9wY6R17t@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <1ea1d115cea5b183dd51bba5cd9e38157b3482ee.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ea1d115cea5b183dd51bba5cd9e38157b3482ee.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94E:EE_|SA3PR19MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f1de18-d61c-427a-146e-08df29d97c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|23010399003|82310400026|56012099006|11063799006|4143699003|16102099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+kYNVog5uxuO89PfTnXoL11VPtAYzVI+vz1JKwghXE/MPwlkEZALskXkNESnSch4QzZKVeVaec0Z32sgS50atOwBs4CJP735z3It3feKH/kZyp58KjELZuv6xFFwvr626imaNdVCpTVgx52QxkTffDcXyQftREexvoIhsD6xVylGbjneKocKVqMh0sCvIp8tlrBVIWVWfH/Y/h4lSZUwDRVEZEG+JCH62Fh3dGFFSfYkUG6zzS9f4jcNrzVDXb8fCr0i1ln+o63JNGmYK1W0tAnxbb8YP+HQ+GWZQLfEBlXdegf1UOPMvAMr2fXNFuxOsXD8wHm4aEsJUr//QE540bYC05Goun0nV35h2bpOmvCSy6xXCW0ogDn8xgv3XJGXj89pTwZ0G3O9q9JU0z+zrj0Ih7/j94/nkdQJqvq0KBBX99x6QaEnzrLoFHmV9S9fTpuynT3+nDJJaf3beoBLQalQ21+f6M6zxEjW8GziwVD7LBrP8UzsFTa1XOctqD1lrKD+fXxc0AP9Q8Q/DmNtMaRNCwC1n4vgF+stt6oF5naG95xDpzA2li9+rKhqvkXFBLBoOFiJKuKyoGUTDcoqaH/o3e5NSr3i0VpPR3ctQBdFyi0MP01tg052upXB1Mafh6pTWHyXyHTLE1dU6SgNkM66+UaBlmobDjKjrFAeYa3qNBTwh/k8Zkn1VE5KnLGe4NdWgjfJfTkZtNdrqQ61oA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(23010399003)(82310400026)(56012099006)(11063799006)(4143699003)(16102099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0gI2h3bcL2RfzkNH9QlP/lcdpANrEljBy83+qMT5BFRTW7an4Wmv9wl2RYt1/bpm7W8ylGCpogUhR5CoG8r6JKVnhcYxwTnzSDWh4ikZFWJSm+ljQ2sabfMgy30wiL0GpAGykTL9PZX+EN87VLUsSuQ/1sRHeDlXdVStRfCdjmlzS34FkB2t4+v6NKj4aIS7xiUaoPRF1TW8Fj+ilB66PIVsWqvWG/V1OGt+Kg9TE0bM2PTCdpjgBO/XeGszVapVmqJCedZ7o1qgXGH5D2PBQ0VszcLMkAmUzt7eLplLq53AtY7tgPU3R5m8TxRiYfEbj8ZgWjG8+s84fj8/8upxTydwMMDoEuQ2o55QeBjFBQEoywSke6IM/oFx/ie44nwiCnbn8s22MwRcQPfDZN4dvoMN1no4CgaWunzU7NHZzOKTxUIfATwKVlFoQ3Hj7CYf
X-Exchange-RoutingPolicyChecked:
	WOkvHvR+9TXsbLZzKx8kzTBJw09nKPfK1xYgBRB0hXrS6esRsK6i9ZshBqihDYPwjtTEefYdFOL3+k5HiiaWMVfhJiN6/cCzzBkZkiOLBArRCvKSggZHJXkcfdU7CkhgJQTspKAj432YPLCWz7wMJ9f2FGX8FiZBV17Zzn86sO1pptil6SFzEuyZWFhYAt8UjWpv3yVyNbxupTAt6KAh/NN1+XJEJ7mBdRfUlTzmt7Lfsxhh24nERees3e5h5cgYTvFU9RZsAy27ONKtYXd3UraQrPIog3STmMnPDZb1h+eY5HHohgc53GST9wFvcHB7H7Bh6QJHebOxbJXPGrb+/A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:56:58.2916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f1de18-d61c-427a-146e-08df29d97c9e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH01EPF000BE94E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9621
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6acf51ed cx=c_pps
 a=y0MURNDS5CvtOemsVNO2Rg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=ZS18RAWNQyGuZ_FHARcA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10
X-Proofpoint-GUID: zG1qMsdnm1d0T-QQb7fSVXA_7Fcax9R2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX4fhPy/uwAoaH
 uOm21kxSR7eDGJKpKaiugx1MViHnicoF0mPK6q2z+Rj2FLGxbLkN08gBDNxFIaL/ob4dO+TjqW3
 Kiz07DFRl882Awd1PfPp4tszMvk7dzw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX2MckhHGoVF5O
 fialW5QvBcuSniWrdO1ijQcuTM6KQwWEtnb/c3X8bjRX0jLHd0lfCsIVSU1sHaHnRwjmxU1Ex8v
 nrXPaMUxQHdGcHfSEucwtG6x0y/O5ilhNGQOryHP0Sk5ojHTzYjgC6NiKvs85Ta9hrm4hdn780Z
 xNWTBFWx/cDhYdym4dshwbVfdCN6ANsCut9kPrfCUYJ/1tFrcZmMyQjx80BnOw6P+Wvf3ysbdxr
 AI6xBAkLSaWgZrXKgLt0unoxd+jPIySFIW8wQWU2oXHOArveV+gQFNdMdqYUy8APwSB6lePHghR
 1Zzx8mauEMzmfTySkn61KQPw1ZBPu1yBIy8Vpj8BtVu7bKivzLLhA3PJaK3yfwkRnvJ/ya7HTR9
 zViQ+y3o4YyDh1NLZTWw62yWqfRNwT69EeYZbqAtQew//HFj/UDSo7CH60aBsqPktuuMIDhUIgX
 o+6OgZscKT59Arjukmw==
X-Proofpoint-ORIG-GUID: zG1qMsdnm1d0T-QQb7fSVXA_7Fcax9R2
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:36PM +0900, HyeongJun An wrote:
> The Right Output Mixer Right Input Volume (MIXINR_MIXOUTR_VOL) is at
> bits 2:0 of Output Mixer6, not at bits 8:6, which hold the IN2LN volume
> (IN2LN_MIXOUTR_VOL).
> 
> Fixes: 942c435ba79f ("ASoC: Add WM8993 CODEC driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
