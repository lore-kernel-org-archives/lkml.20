Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C884CDDF8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769806; cv=none; b=q24AUd/XtDdqt6gSoRxOK6cNFdX6pgCDKxk8qPTkaRphQ7JGBmNCIXGCg6Htxzk0Xf7ftub2TbKWJWa70zi47lCbRoZ3YwiJXb7Yevj0g8zEfpIBRyYZIjp7ak3ZA0rk6aIW1GrfEYmIqJHyLGj6frp7FdTuzvi7cvcEKqeeUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769806; c=relaxed/simple;
	bh=hONAX670vsjm2lEUGS6xPLlDKsjfQ3e6VR7nIHGbOeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+XMZRWoQxNUJAXIr6uveYbpglrVAKd2g5p7gj6KWUsttx2PTuQoLqT1GjYzHl7QiGc9WnX2vh1WmBaHXl5ZoPFkoQ4RK9f3V+kQoDkldXn/IhZxvkTiudmRZNMfrHANfTLnWor7oxvy4cU4HN7pZGdKVoXF2huhnKVJvWXRpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJPxCCpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSd5xJZl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJPxCCpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSd5xJZl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7ofI3955025
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVhgKlodbVYoJavsQBEw6xYqmpo3okld/zMkNE/WOb0=; b=bJPxCCpjb/bth02W
	bf8k/+YmCPG8RvFHW6EKmbFotGo7gbw/4TNRRc9PmHSGjJIhVVc3nftbceghkL+y
	SCxKNfCZdpSCsTjG+gqQXfxSx6BvT9xmAhU1BVL1w6IQxguW46KMSJ2A7RvF80NI
	k6qifzQVJpxTje+e8k6epzZEkGTKHsTTvTxGheLnzCH5EFs0Eh5fXK4orFYaDDQM
	xRjSLPgsX/7qoCr+2EjuWFqgAWBFkU02kHDcBkrKIrSNGABOtjr0MBGmAsj2aHpb
	pX/h6ujeRmhuhArdITMe3itvzyaWlXRQg6ymzjwR7LuOGr/0PmJB1VUhA17j6lfp
	G2bZNQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97v66e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:03:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so8063038a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769803; x=1791374603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVhgKlodbVYoJavsQBEw6xYqmpo3okld/zMkNE/WOb0=;
        b=iSd5xJZl5SNAJgMKs65dgWUrUAK13MW9z2MtaKrtpoR1Ja+Zw9lj8asCDzZfDn2CH2
         wA/ZPKlDHm84sKKXjsgqnvbuMw8UTmg4GY4EBvq3cfU0tmMBhhFA32xlo9QSlfM8X9aX
         hmmVclIE/+40jJmJloVnn5HgI34nmcE814rimK35c47dTgMwSQJ0o0uWSf3FeJfoJbi3
         vA+KJTThmbwgsQIlJgjIrfyMnooXSPXLPdAn2GYN/g3pZCIg0mP5h8seTUcx/e2tC+OO
         3JTIV4JnOmukG+4mdu2IrYYgJzKYA37FLIhmTHT4qmvh0KHyirnbv4X5K6CAbNBqYEfN
         rAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769803; x=1791374603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVhgKlodbVYoJavsQBEw6xYqmpo3okld/zMkNE/WOb0=;
        b=1NYvsrJ+O9iFje0zdajcMpzbnWNvlP/Q0jrG9eo0zXHWB4qU2z1xpDODhtwSZGU460
         bWDVGUYNiGbUe+nEdua1yRZ/3t1c8WDhxv3nAZREMRke4inRibWzgTgxwFG5IiS+bB+s
         Gg/EMmWIox0hMGznfQsl5FdnMJwCh3VuTQSl4MP9WAPLZLibjk4IeeOmQj+rxzmZlGYm
         NsjuNIwEPB/RYp3aZTKtcY1SILPQDC8sEt+3RBK83gB6sOrliI5IPI2tvMPWQIxm6bPN
         TMP5O8gtZo/zwRbvU9pdGCA6uWTnPkGzlWsWLGyYIa7l4ivep24EAiWv8Pex8U4ZsIcT
         db0A==
X-Forwarded-Encrypted: i=1; AKwUvBzogQ59X0KKoZJDW+uLwCDOUKo8gVw0DV0VTayxa2bFLxRDeY/jB+2wMA636zCBU0IkPvqRva8SxsMzujA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvvScgCnEP8KY/Yx+3EoTb47tzKzCxi8BBfyRjU5fZULYIWuvp
	A3N0LHHxpFFqR5ODL4u6/E6/wapQDnGG2/p4aMp+9On0LCiLBN2ejf6FdvjSldKmEsVQqXnDUhL
	KV4Q3HAlkcyxtBq5DbSl9TiMmpmllEmcY6q75W5PXIf60yTIW2bgSQqu9ke/ypYZ/T6w=
X-Gm-Gg: AYBFou0PTcfYmUcDSP/7vu74T5D4Oc+nx/+uqN7GwjOP4hYSxL8WUCzu4UruuRkpqwa
	zmdYk0zEjQlI3fEfF77u+j2XYLnDnxa4zwNC3S9BEsBAoO1g9wDbcNKQHZNV2EwUXknQTSLV5bo
	QrvN5Iut732aBfQXCyku4tcY/anzQrimmGs/18uVRtSBGukWssnno2I7XCM6L3qYMQ7pQOsjLHK
	7NO32dMPb5RfTSeNQ6H4MJNokBTAulvvASyaWtGdog1/2uvbnYFHSdyaSKkHtRJwz+khfUII/oM
	9BEVRzQd3bB9fxtWp8bmSVf1e6eOBdiqdrscSpA0SvXikKOalVNvFZyZ/y9vCFeU84/xAywhvDP
	n9W7EJG+i+5jGm4lq9jdtpJQTw3FV
X-Received: by 2002:a17:90b:1c8d:b0:39e:4d7b:b247 with SMTP id 98e67ed59e1d1-3a4d1526645mr923028a91.19.1790769802636;
        Wed, 30 Sep 2026 05:03:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8d:b0:39e:4d7b:b247 with SMTP id 98e67ed59e1d1-3a4d1526645mr923003a91.19.1790769802144;
        Wed, 30 Sep 2026 05:03:22 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca7810d6sm4068318a91.6.2026.09.30.05.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:03:21 -0700 (PDT)
Message-ID: <c201bdf4-7b23-4f7f-83fd-b19a8d2aba9c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:33:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] phy: qualcomm: qmp-combo: Add hardware-specific DP
 PHY config fields
To: Oleg Keri <okerixx@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
 <178966967452.3333.16125740437772430030@gmail.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <178966967452.3333.16125740437772430030@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ncyeg19hYPkXcoFronpQARnGLnJas7oc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXy5qCvJMa7wQX
 yiHVm6ovzQA0fsKWgatjSz2KMmUKu0g4E5nr7eBFQuHu8o7eCHaG3v3HgQsPn6/0v8wcQZR+LRQ
 1bdDRigNj5qf/UB0PrAiD55wAbpJqxqxHf7qh+U5pjSd4HM1dl1qapk1+um3LhlrYmNpBmYTEZB
 14tF2SfAAwHFDyx3BmCCBwWJYyIiePFwtascx7EtpxFRwf2ew0YCMx/pOuRSUyuHQmmtgUt9EeW
 +iJ3vK49xgkn/Kd1OjVce+3DtllDZ3zdZfqlg6YgChUjKP/GDHtk7d0Uk+MxjvJo6axcpWKiz9m
 qcYYoypHDIlMICMViUfN0DCq61j1iTXnB2uq2WNEWM/YFhcvHV8TjVULdjrqVNQkeQj/5dvOZE9
 cgXNrozLsl76xBgRCMWcsp27L1PZw3DvBmRNseHHguZlATPWAEGkPlHmSv6XlFbUfc1Va5ItiZC
 HMoik3IaEsqmAPHFekw==
X-Proofpoint-ORIG-GUID: ncyeg19hYPkXcoFronpQARnGLnJas7oc
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcfa8b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2Pgbhd59ai6847CPl0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX+3QIfUgyXg86
 H6NaOsDYenoAkCQaaSxRThLY1BRdovRe6GLJLiqCfag2covjyWzv9ZjTtihZiYvuuvQUWBtV9k+
 ZalN3AcByYCpNvSbd6Rn8Ql8g9ln+Ag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047


On 9/17/2026 11:57 PM, Oleg Keri wrote:
> Hi Nabige,
>
> On Tue, Sep 08, 2026, Nabige Aala wrote:
>> Update qmp_combo_configure_dp_mode() to honor dp_mode_ignore_reverse,
>> so Glymur can bypass TypeC orientation-based lane reversal.
> This breaks 2-lane DP with a reversed plug on a Lenovo Yoga Slim 7x
> Gen 11 (Glymur), with the whole v4 series on next-20260916.
>
> With dp_mode_ignore_reverse set, qmp_combo_configure_dp_mode() always
> programs the normal side (DP_PHY_MODE 0x5c, lane 2/3 power bits in
> DP_PHY_PD_CTL), while qmp_v8_configure_dp_phy() still follows the real
> orientation and enables TXA for a reversed plug. With fewer than four
> lanes the two no longer match.
>
> On a 2-lane DP + USB3 dock (HBR2, one LTTPR) the reversed plug passes
> clock recovery and then never reaches channel EQ: the LTTPR reports
> CR_DONE on both lanes but never EQ_DONE or SYMBOL_LOCKED, walks its
> pre-emphasis request up to level 3 at swing level 0, and then clock
> recovery is lost. All four attempts end the same way:
>
>    [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #2 on phy 1 failed. ret=-110
>    [drm:msm_dp_ctrl_setup_main_link] *ERROR* link training of LTTPR(s) failed. ret=-110
>    [drm:msm_dp_display_atomic_enable] *ERROR* Failed link training (rc=-104)
>
> The same dock trains at once with the plug the other way round. UCSI
> and pmic_glink_altmode report the same orientation in both cases, so
> the orientation itself is right.
>
> Ignoring the orientation only when all four lanes carry DP fixes it
> here, both orientations train:
>
> -	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
> -		       !cfg->dp_mode_ignore_reverse;
>   	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> +	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
> +		       !(cfg->dp_mode_ignore_reverse && dp_opts->lanes == 4);
>
> I have no 4-lane sink to check whether 0x5c is really needed for a
> reversed 4-lane link; could you say what the flag is for?
>
> Separately, on 7/9: LN0/LN1_DRV_LVL is now looked up from v/p levels,
> but only in qmp_v8_configure_dp_clocks(), i.e. at power-on when both
> are zero. Level changes during training go through configure_dp_tx(),
> which does not touch these registers, so they stay at the [0][0] entry
> (0x02 at HBR2) where the old code had 0x1f. I can test a v5 on this
> machine.

Hi Oleg,

Thanks for testing and the detailed report.

You are right. The root cause is that in patch 4/9,
dp_mode_ignore_reverse was applied to the reverse variable itself,
which caused it to suppress not just the DP_PHY_MODE write but also
the PD_CTL lane power-down selection. For a 2-lane reversed plug,
PD_CTL was programming the wrong lane pair as active, while
qmp_v8_configure_dp_phy() was still using the raw orientation for
the driver-enable registers. The two were no longer in agreement,
causing the link training failure you observed.

The fix decouples the two: reverse is now always the raw cable
orientation, and dp_mode_ignore_reverse is applied only to the
DP_PHY_MODE write, which is the only register that actually needs
to be fixed to 0x5c for Glymur regardless of orientation:

-     bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
-                    !cfg->dp_mode_ignore_reverse;
       const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+     bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);

-     if (reverse)
+     if (reverse && !cfg->dp_mode_ignore_reverse)
               writel(0x4c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
       else
               writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);

I have verified this on both 2-lane and 4-lane in both orientations.

Regarding dp_mode_ignore_reverse for 4-lane: I have confirmed with
the glymur HPG guide DP_PHY_MODE must always be 0x5c for Glymur
regardless of orientation. The flag exists solely to suppress the
0x4c write. I will add this fix in the next revision v5.


Thanks,

Nabige Aala

> Thanks,
> Oleg
