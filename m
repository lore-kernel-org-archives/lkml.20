Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB54B95A3;
	Wed, 16 Sep 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574513; cv=fail; b=CE/mNe+SxjOCmNWrGFpav4GF04BTxasNnjQwPV7YWbbAdxm3n2XI5mt+Fxj7hPK85tMkCxgC8rwAxY0AXooVl0Vrk5pndQQITD6hDDVJLOFVDuZSsLMbyIcU996Lth6TaEjQeINCPc1zIYZsVNzg1V7Is3dHEAJbWGVH7Dxa0vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574513; c=relaxed/simple;
	bh=+xAV6fjPpwxjsV/LZkGHaBfi8y6WAzxRlY5sxtXY1bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVo3hGd+MBAYuaY/4W9VqSEW/5Tp39HUzOuMVuf8ut3H9f9UueEEe+Dk4C1D6Lg8+HYykKB94rA+OC8/O74occq/PyzQNsLob9ddAIiRQmfDCtG77iGb4QdHR5OnzEI8bXPYnJwfWj6AFp/Rlw7xGuLLLzm2PGbB9H9jL6tE6GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ehcUr+0U; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=keD1Y7gy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ehcUr+0U";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="keD1Y7gy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDENFH2199766;
	Wed, 16 Sep 2026 11:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4bZ8+abhx2dMbAYo1r
	AMOqFP8AzMeEkaOe2Vhwi7Ke0=; b=ehcUr+0UGSraJrG2cNJH+7fBz5JDzABaHk
	a7H5+I2HYpvBj1Mu3RClhRGJvjy1EaTLK1hkL4xLK70fYFJCKm31gLIpNk8e/SAN
	Nqpaj/39/AkNg3IDNpRLjCRl5i7hRTbkUaSm00mJuqbnL5Iq62P/I9E/YE3y3zWU
	DavDp/Trk4XYBsrNxJroNiDVEYNN2+RzMPnq14BzDHnceFLoITGNGuVUiPLmBsrH
	kZ2E2qg9mxCCM1FEJR3pMSZU5CcuwsDpEkSQgVmLPJCgRUvXzlzccWusGAdXFi9R
	FqIsbxbj/8h9YJTtKcTrK6yWl30BO4L417yf4Dz8Uih299jW0n1w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021123.outbound.protection.outlook.com [52.101.52.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44wdfdh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:01:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrvX7wCFDPl4yt2NC6/FjjFr3alPndvCcChuFsxh64XXCkUrPAM0rZfdK4Fgjz5mVlzK5EtFPb2jjTzcJAYjvePjoZjvQn8+R77DU427sUxZ8abeqrnoGfmmgnIA77LNfNtYWX76MsvDK2JYUpy2La2Ie1kcbrqKu2+1ByfBIXIriZgqDLznK2/dmgX9++1LYFAjlFZyGaM/zlFKx/bwUSvyVSfl8FjdQjv9F8qucKkHG/1aNnLTusTKnp2FwudcFmc6a34Jv/2AldNaqmTZLmDWrd5PcHaTbhGMGXdH8wECa+wAk3y6UxtdYZC6snIsmN6a/Tjg0pXBbFAftDXmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bZ8+abhx2dMbAYo1rAMOqFP8AzMeEkaOe2Vhwi7Ke0=;
 b=mIs7N+nAj4tzl26sJliF9fbZmCvZ1j8iUrJYR2TYl0iOFR9SoQgaE6zwclOux0fvnSm7K2kC0XV+IzwQ0Qc5ty7muzRWE1QcgPNis2mMYtrgHnDpJlQGfm99THxjkWBoT7HV/arkspctNc2t+/isbjNXYA3DWlMTFDj/31JnsU7JtAzNjcsjas2Grp5KMiwd+NKxCSeRGTgzxZeYtkpNCnkwKiD/vxjiR+Sm9DRGac/FQtQKoW9TCxOEHv9jKq1ZhwbhK6at+YXDdkWnZZ6QKLxaPBA/hc8uJv9mCh3UnR3vhAF2ZthGWSuY4jMZmyaQTnTeKDv2ng5/6u1VbaCmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bZ8+abhx2dMbAYo1rAMOqFP8AzMeEkaOe2Vhwi7Ke0=;
 b=keD1Y7gyZKTizBeyUsz60P1xOj0TRVtx1tMQuk6O36cHIQfUd6MTzMPzhHHvIFfNwLTyAgWBrtwnGoI+RREw/FuEBeJjXSzUN4OFR3YisC8++TWZBxjx95DnU8Jq3iyz2r1AesHe1DSTdA/hCe9TeoYb6liwU3ZsFh0Le0s8hc0=
Received: from SJ0PR03CA0130.namprd03.prod.outlook.com (2603:10b6:a03:33c::15)
 by DM6PR19MB3993.namprd19.prod.outlook.com (2603:10b6:5:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Wed, 16 Sep 2026 16:01:28 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::51) by SJ0PR03CA0130.outlook.office365.com
 (2603:10b6:a03:33c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.14 via Frontend Transport; Wed,
 16 Sep 2026 16:01:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 16:01:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E7E9C406542;
	Wed, 16 Sep 2026 16:01:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D082E820244;
	Wed, 16 Sep 2026 16:01:25 +0000 (UTC)
Date: Wed, 16 Sep 2026 17:01:24 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: cs42l43: Move to core detach helper
Message-ID: <aqq9VDQ61TWjCmQI@opensource.cirrus.com>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
 <20260831140157.1736905-3-ckeepax@opensource.cirrus.com>
 <20260916152148.GF1605367@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916152148.GF1605367@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|DM6PR19MB3993:EE_
X-MS-Office365-Filtering-Correlation-Id: 5affa80d-0999-4a4e-114a-08df140bc415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|61400799027|22082099003|16102099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	El22GTApCwCxvLmyHhfAJwNfNSwC+hcBPLeJIbfpVMV9bReD8WHjt2dEUDLmviGEXgZSARa6+kvGpYgdL/RyVHecdhvu1d21rBrUqyErUMZoZ4hv1BckK04BJmvLtzWuQknU+ZW+uZJtIcX5O7bJrcEpVZrJDfDfpNKtiDycDyco+R8nAPI82MfaImSM3Rrux09/kSFyBFottApRyN/LE0kw/suN8x1E9rpifCe/VpbEL2l2lvDiZimdGF73H6V9mjqEhkk9g+lQOkaHJWvSeQbwuFmwEtcYptY3HWYRUCT70jpJzOa65sBrfWv3yrIBcC0B3zqLKUB5QbqJOVerlHHZygOrElN/vZ17lML4hdylrYFxSn6yWYjuP3KkTcnqHM32ZzAi5XjvRtC1ROXhNCfVYilU5gy2YvbLXyOIambZOd7G6XTLbP47buWiQPxR9m0uhSuPcM98N/zK1xLQsJNc8PSJWkIKBEQnxnr70Zg5OGZ2rkkJyAQXNBTAaq09ZJLoZwSalcQznexLbsw8VTWBH6SaDAj2oOXFAHVTSMiiMBvl229IJcqaNUWNrDTeAI4P5rfHSFXZamPFmKNZ9msUk+5OkFYQygCE8nMfa7kfXMZSfUkNE0z1GYSbMQHXHHITz6G12B/WiqEXfBqbE7Ux5T/yjMdMNGBAjLWg+8bnZYyk5jrz+UXYoRGL7e9oXc+o5/RUgbRE/yX7hAxRmQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(61400799027)(22082099003)(16102099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B1S9IQDeoJSWXnUIMwf3ww3bQtIiEafEyNz3KaYyrkrhZimrwF1BF3c++OV5TBUJ2YBpnz6Jk2SW50imqWw5m95TGvLE5TocjGgvEog8i8Nkz0P+occRHIJZWJKLEhF1kgarEXcLN0tstGTXHI7w0emuM+bStv2ygfi4TIxPUa9W3w7bpiZbglIO1fIdc0s2MpebMM41GgEDHLMZfq9fUR3w6SXKoTpsfRBJr6n+hOWIbpstQcwYjKm9oBrAsIYVrbLha17V4+NNbX/LuHJBxfRlSRhRkiZXGhKe+HrsWk08IRvm4V4VlFGrcPh/E2fm/J8/sxTa+k6/NAcqHstQXKb0QZbOD7V4Sr6xT6dVnNft3FCKv+bSLE8t7OR22saFVTqXjrB6NmPhGHINDqK0bMEWl/FaCZNr7uWN3Q8LR19wnf0F77ujY7EvUEnNBjLr
X-Exchange-RoutingPolicyChecked:
	tyOuA3pn4Z3ofUO5jlre5Mx+/miLXbns4HHvpViW9rihVvXtJqjKI3PowAx1GUq8LIhfTQU04pwHF941aFTztM/l1PTe9UM3mCsKv4Kki6b0TtvskjluswjUh9qpwrL605L5dlwCH47PIXHaT+n88idGTh5Kl5UOJ6eSNVz4gjvypsNPRnaEXc/HtAtoFZ/8m7lplD9NMsHM3ZJalvOp6cyMHRnYnSVhQ8ceplBRThODa+LfdtNd51vr3Wk4v1YAukUvkRCRs4Mi8/XI+5m5FEH43hWkgTNyNGjCEJAQzsjg1fn8aJ/yvL49hRHVhC6LPi5AtneoSa74e6fGnqthKg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:01:27.3548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5affa80d-0999-4a4e-114a-08df140bc415
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3993
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aaabd66 cx=c_pps
 a=bglwlcmNSKUHFS6lfo7hMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=4fMfMBNAZQe1ZO4LFRAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX/dWLFf/qI6Sr
 E007Hn9+FJelMnsqS450qf7e/lbwi9+rOxmw0JLMh9GudeW8m3bR5+wL59GR8eQJRY4D1EMZSF3
 ILWQFJ8nIsTlFwQMe5wbuja5syBXViwJcFYqi7lJtdNeocl1zbgRS54YvlOKo/L85K7JVPdjWiI
 biCGH0UBr0N03f4DacWic/pE/CIgt9auYTDNrqEl3krPTzEl6NUR7Cgzb0kBO7Zm8zfgxAMsBXU
 z4d2m1tVBJYeidoWNIXTnUNf397HvVwkxDjtH1lvl6pE2oYEVsoi/jXzJpMcQcdM2jobE2iYPQr
 IXp0Hmn2TmTNBuKFmc/BP9vyGyZtcK3ASbSJAQ3NfgTKgl9BzlGUL0dS48m/0HL2JuK1Mf54hoM
 FIXHkOzlrFJJPnVZMQuGa8aAnYPzppMZZXZnsk7pGCDwNsMmlQI/Uil8/s+ihNoDshYiSKzIn33
 EScJ+JvKRqWuKwSg2tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX+Lm+snlDQTMw
 SPgn7kv/ATa2E0UmX153u3J2LiOh9ni5+ggjzGK/3j3tiv37+2Px3vDd1Hj0wSXtudWULgasLGm
 EtyafXeCbbNkAOnXyqd+Z5cVOx5KK3A=
X-Proofpoint-ORIG-GUID: AXnZbU-OVodXs_-Kl8lQZyvlubZuEpST
X-Proofpoint-GUID: AXnZbU-OVodXs_-Kl8lQZyvlubZuEpST
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 16, 2026 at 04:21:48PM +0100, Lee Jones wrote:
> On Mon, 31 Aug 2026, Charles Keepax wrote:
> > Now the core has a helper to signal a device will detach from
> > the SoundWire bus, there is no need for the cs42l43 driver code
> > to separately track that. Switch to using the new core helper.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  	case SDW_SLAVE_UNATTACHED:
> >  		dev_dbg(cs42l43->dev, "Device detach\n");
> 
> Is this now superfluous?

It is still very useful to see attach/detach when debugging the
driver, so I would very much like to keep the print. The function
still has to do twiddling the IRQ mask on attach so its not like
the function exists only to do the debug prints.

> > -	reinit_completion(&cs42l43->device_detach);
> > +	sdw_slave_signal_unattach(cs42l43->sdw);
> 
> If this call NULL safe?

Yup.

+static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
+{
+       if (!slave)
+               return;

Thanks,
Charles
