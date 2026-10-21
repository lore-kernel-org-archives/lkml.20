Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581840;
	b=GLWnE8gTrZKi+S1XNiiDZ0EEMW0fkwYwnl5nNAtj9dEHrs/GfNql7C8JhyQe/wI3ZDDw
	 bJoNgnueb24M+LZ4JXQBosVdYiPUb8ewSIjftk7Z96ec+Ku9pqMjMVrc6uncJXkeRCsOy
	 qErEW9bWhKDqPp3HX6aNjMOr3gnipD3dGhxb+3KXHTxSVKSTitTO4dH7zJ17VGY+3fExk
	 gF9sa4mNw6hskNkwjsNK6jygo8Ik94HrUGdMF3wZdnK2vd03dDSV4DR0Vt3R/Yo5AdGFI
	 bBF8NuhdFfeignxOMoO7ji4EgsCL2AeNsZ9NvfQsIWMBQ+qUFsXfhjHcqax/K+qkO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
	b=5VkBLKS/O443sxOC/YZLiQ7bU08XrCVBc9lW7cHhA7TwazyDoHReP7Bi6fF2AH1KG2lr
	 wBRYFAWCFrkSMxPReODLZjPTIoRTGl7AIIc/hmrZplnsFEz+CokePH+aWdmmNWwOW7997
	 Ls637fA58reYf8jzrtYBJHQjAuonW7pgTczb+KbYM3NbOOXxFW4rqXlI0QV5iyIhI07fW
	 rNauoaV/vIsmkahSYvI+O7DKfgxW3SfZyntR1FxQrmI2BVbe5mfdntNCennSrc5SfAfdh
	 fkf5cu6k7opTrPzp4JM3R/o53Lc98bsu4jEbKMFmRHxyEXjqSaWhsotD+PJ+rH/ciUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNSbFL1D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzgclMqq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75AB606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNSbFL1D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzgclMqq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6R28282269
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=; b=dNSbFL1DE56q8Ruk
	R8M08kmvVdNhGeruKLN+Upj6jQNsDs+EaMp905UWYV4osNRX7NE1owPx70/BfzvJ
	Zu3We+Vsck6QDewQFRBwChkCyMNDYZTCelnthSS5YoR3RDjv4OWFt8YF7TLMtsRB
	3Daoa2V8xHSY+uS9og7zB7PueJ2vbAb7TWIqaU6F/P8U/rdHMUiiepEvx4kXHJBU
	kbVbgnw4Rx6kP0z/WcoOeKViKxLGvlULhVcR0KIb5VJ/caVdEhZuMuBd6Wd8L8xj
	pCzF12xEoNHS7Gk/6IxOWohafUvy+WcuslN9KkzEgAyjrWKIffZ17Xa/zSBxlk7Y
	f2hqTw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2ra0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:23:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so1484511a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581837; x=1793186637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
        b=dzgclMqq7NXyfRMq2O6B1ULX6wXULNlcQFWoJwlcaSfJ9wLQoKwe8m0Yp7F3jh8fOS
         PCvJZt8edebN63EGXHZ2PjCO5VR8ocVmWLxZRdNKZcpJEk5Hmls/tDddd+T5ArlvAcYz
         lDf7VXqSk/FEsPllWp5kY/5uIVRCrAKML0FJ4i7ZR80F0JJVq6O1WUH/XKtdXaYzUz3O
         bpWf/LLWfX1OA50sPD66vmnIpzhyKpMpi305FoeFkeecYTi3jz2yEm0sK/dS03R2zP5R
         B64s1tjjtXg6+W9AWQ/ZUsRuoR9sbdFGt19Io2sMtteIUcR3LTJPPrFCyXRN2Zqp4kUE
         QM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581837; x=1793186637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMOgubZ9POR3EPQUnP7Tc2q7GElsLYo5uPzAB2RExmQ=;
        b=O64ML4wgTpuEIqTlm+aolZon10AwfDy8sG6+a6NdGFxq9aEcCPzS6LXcpGMaebhBhd
         bv4IGwxfhcAN56YVBekfF3Ed9t5bbH6LzX2yg0zOM21CJW1q5Tg+op10iFBe44FqpY9x
         GQewd01m78AkyugeMA7PnRnAuAekjh3I7544lYbzRzH1E8kxwgDgNvrIocFVyU1ds84R
         uhqh0Ne5DdaQA+CdxZfLw/Xu06NhEXJlT84bbYSw9o4DG6ksAKA42ucdm5A7vl/p95Oq
         IGIIzma6SWWtMCjvaBD+CeQi02JPrNwQkX9TEufNX74ATlBpXakFrvVZXhXfgaDSsryG
         Kifg==
X-Forwarded-Encrypted: i=1; AKwUvBx2XbJL+9ficSIL9rsAwP5ykbTxT0nI4qXGWeIKkV7RZlgat5Sy09+i5ajMFasn61N9/tzSzQBy/XJI5eA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdl9wkk7rEis57kCtPzBW420FZVKxp/0L3abOGllzhv1ZyDE+/
	EijDuc/w7MfCZc66tVr+Wo1DU67fnzJynYLS4bAQGjJ5Y+UcPGe4YvA08Wjsy4CUHANBhnVlGXB
	jOpOsRV+/3J96acl5bK0QNLu+8CfOtKELAvyeySWFQWlnEfqaraDjwPYEJ+FrJzxARaQ=
X-Gm-Gg: AYBFou24zMDGI7ttXL4Zui1jEZ5A0YyWuvb7yidm4c0iWJgQPgVUVa2A940rEugP6np
	ZTfHI7ULeExwO5u/fSILbYLjAjhsac6Ax6TfgpRVN/NHLFFJZBrMhV8hHFOrmy3w/SzjchJwxbI
	beN5hE6m+Cxp1PxWYwpF7iNbLwwwZeUGJw53zwqTaf2H3wTCXmUoEhUA2wEmdFku55RWbh5cwzK
	mg+ZD94NwXuv3m4+JDV2YAYEdsgBQWw/AGB+Q/2q3ZJehaGvPqYC5YBgqrjqb9qMHyH0vI5RI49
	bvd6FLrR7RRFfii1y6gRYRk5+WZBn89rreTf0zzz53QQbNyfJInJBy5th9ghNYfbIrysaXNy/rO
	tpDGBmh/5OhBhtKWOYbtbIHF4J0p6
X-Received: by 2002:a17:90b:2c8d:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ad86e96741mr999954a91.15.1792581837390;
        Wed, 21 Oct 2026 04:23:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8d:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ad86e96741mr999941a91.15.1792581836958;
        Wed, 21 Oct 2026 04:23:56 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad811c515fsm3765832a91.9.2026.10.21.04.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:23:56 -0700 (PDT)
Message-ID: <e127d06a-2c1f-463f-a30d-ee7815fe4a75@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:53:46 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
 <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <q7riz5qxge3gqjqz23xz5aecfhlg7bry5w3wzgblnyozm7ac7y@b5s3z7vk2k2w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8a0ce cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YZ6MeopCirwGMcWCqvsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: kyw74kUC9kbP43C-IaaYZb-zV_3CKuC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX0ZwrJLAcetAA
 D6MY7A4P1JON/nVmi4kVIYtkB9C2O98YzsL/t0/+n5zLJl8vzHNYrOQVmaL60LbST3BlekX2+Lt
 8UVj7WHv4uSMDrYJW9Ttc5HFuqUOEhvldrH22veTxlDUPTQ3ILemwxJOpoSN+Hk2J9VU+/TUolJ
 bNZo3e9atdgwGYd/kz1oGssiWpCPPU3UjiwxeHIWBfLz3BSSG0flcyV3yGaIHUE5cOhcLKC1z8w
 hsoOEtl+2tLRovKdNlqIYzYxfIfsKMQJXpA4U044nEQ5O7KuFmmJgyqUtIIjYe4ayBE1LX5041d
 3Umd7UOii7n0TV5srVKhqqvX1SGs5jC93ssOPeLBk3BOCLDZB2DvNqayDaeg0A1CpgdpEktI34G
 0LEEz4BYbTow6zIYiBY+MjxPMg6wDnvbFIViuKIESLrnxL7QgPTtxS+7GCuCRWsnufT+FBGrb0o
 aX5ZUAWpyDqc6opTm4w==
X-Proofpoint-GUID: kyw74kUC9kbP43C-IaaYZb-zV_3CKuC9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX/ZLLondrGnhV
 SsNvaTplj6SJvrhy3XrD83rtdW/ItVYBqK1G2MeclgC2Qx1KuCo1gW6iD7N0hKuTvqPaPKuUn3p
 Ah1XqFOR1Dprv7elX7FzhRxfBh+kN04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045


On 10/13/2026 3:49 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 07:02:17PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Nord relocates several DP PHY and QSERDES v8 COM registers relative
>> to existing SoCs.
> Why?
>
>> Add Nord-specific defines for the relocated and
>> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
>> phy-qcom-edp.c so Nord sequences can reference them by name.
> Typically we don't do it, If something differs, it should get its own
> set of headers, describing all necessary offsets (especially for the
> QSERDES). Otherwise it's not obvious if other regs (without the _NORD
> counterpart) are valid or not.

Ack,

Are you suggesting that we introduce a new header file for QSERDES?
If so, we're currently using the v8 header. What naming convention 
should we follow for the new header file?

>
>> Assisted-by: LLM
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c                   | 7 +++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h | 3 +++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index a3c893f72908..d5c6835b6c70 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -42,8 +42,15 @@
>>   #define DP_PHY_VCO_DIV                          0x0074
>>   #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
>>   #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
>> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>>   
>>   #define DP_PHY_STATUS                           0x00e0
>> +#define DP_PHY_STATUS_NORD                      0x0110
>> +#define DP_PHY_LDO_CFG_NORD                     0x00f0
>> +
>> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
>> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
>> +#define TXn_TX_BAND_NORD                        0x0024
>>   
>>   /* LANE_TXn registers */
>>   #define TXn_CLKBUF_ENABLE                       0x0000
> I'd suggest adding these together with the actual users.

Ack, I will update in the next revision.

Thanks,

Nabige

>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> index 93edabb830af..008b17222a8d 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>> @@ -48,5 +48,8 @@
>>   #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>>   #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>>   #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
>> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
>> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
>> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>>   
>>   #endif
>>
>> -- 
>> 2.34.1
>>
