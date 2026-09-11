Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CA637FF40
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129546; cv=none; b=aiAm0MYQ7VldtPtEcjNWUB4xf5wSGliRV+S/SnwaLqEgQLq/r3OobxoKhCx8fWExELM1TQ4GvIjZ491JQnb3npKogQEcW+bJC0QfAmj5D+HtLGpj2/7jVC/1mcAO1Tl3snTLb0+k/Jm0WvB3adhHZI0fkQOZrSdwojYl9DccV1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129546; c=relaxed/simple;
	bh=yJC+EFzdNJshUGF22Bd8478Kl636Xmd2c3JpeZ9ieY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKBxx7ltkR4UMwZWa37NHD6/HQ/2kzj7MYvJlRfuMfWDclOuZyqkqeiyuikm3bv+IYJ7kRcB8UefAoDLIokLmBV2IfKiiE9Q3OmaoWAxQEC6zr4iMrii6XIQgbWm5q7dYE4ZBMBTHZvYfz7NIgpjPgsNnMLZiFybBE+qppfNydE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsajK290; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv6MkkCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsajK290";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bv6MkkCj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BApsqK3433245
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1S5/mPaFZQObEkBwz5Y/uD94W7vae2ZRFWoFv2SAZLk=; b=DsajK290ORKzekJL
	BoSHjxMnsxLcrc+zhjhUruSs030C8qDv6t8YBu271U4I8PW9U3nUzFbrBqv36RcU
	fNU15LQq0zGb0uMlIBnsRAiOfSfAuiiH9ehxthJHqV20Gvt/7mNKmg6t+20FIJ51
	rVE5eQfFhCup/9g08sfWnPMqxEl6ew8QZs8cGpUbOKdMI2urTAA+NNH1uMJ/EuNh
	W4hIAkY3Vo9BasXNCPHpvRaHihF+7eoifVzyPFgbTZK5tWDJxapFMUnJMmIyuRet
	MksTG+KnSr8IbpBCQ1luMHQDATxSRfa7Go3CjIaY8T89nI6IDszSW23NSice2tfh
	PKoAiQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbgkyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:25:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so11417225ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789129534; x=1789734334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1S5/mPaFZQObEkBwz5Y/uD94W7vae2ZRFWoFv2SAZLk=;
        b=bv6MkkCjq5v1cuzYBjqUwirAC64ajANsg9lo/XidPBzH7b44Gd1L8NOk/M/4QddDAx
         J/at1N+u9lx2fyiCMEcirAn7nUyei8hLjoYfWFSfjDQFu47q8pJP4TbFPI6aZy7GO40s
         iaaEdV5aCulIBi4AHQuG8u1l2F87SkZ1YzWwqrIWoUMaf6tOLda6SxQBikX8uHVlIQ0/
         W6D0VaseZgZG1w0RjBNB0d0vAPj11Qjtth1WyQfXWF6FO7cLVd8soJeoyijQTwkDPy0j
         8ha/WN7fpCnwwrvtf9tdrcA2LJKsdUH5vIZybJCcpJVDVVBVH+emmiFX3vOFfRMKuXzu
         +Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129534; x=1789734334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S5/mPaFZQObEkBwz5Y/uD94W7vae2ZRFWoFv2SAZLk=;
        b=b7uK24yd6mRp54DJpnD6C3BCo5nX21eGocxvNuBoi/lhmK5QjN5PIQcv2JMsqCTpNW
         bionNKaXmmJmlmj03DuPwXlXX9JsP41BiNKQO6+6dkvb8QaG0V1VJ8caCu5oh0BBJgs2
         uTr5Ah6OyWPt1bSqMAwaVWcGtcfCnnPz94v1quhPGPVqLkk3bRgxf4aO6dSkd6gvR4XM
         7Wsg0QFh8DD+g7C8xHtITyd3zWK7lv/ni8eq2pqsE8KzAjYyxeBN5KBdwyXkobBbhFrs
         rdnkXiyWbLxYRPQyZAO8x+HpJhfMbu7K4iEurj9MFTXTs9c9oNJQ35NCXqgCVAeMj1+U
         k9Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwtcvcOCazfMvvoPL8Apwtu7NF/WZqglPAqdV7fwbxTUmxgUkbXPftDymtY44NZmd9wbxMYp3TOAkyzCD4=@vger.kernel.org
X-Gm-Message-State: AFuF++nshFD2Gn7ghkd5CgYnxaiOl59FLcyEAYNjyrF1qEsPX6nuqtXg
	ui2HTXIxGns58d3Uv8MxvHpVazwg+U8YnH7y9ZjvdJxTTUbpYrUCLq5O3gZ6TV1IuDlZ0Z3ZFTP
	PRSAq902ZhEe9cd90IQ2rcVuKVQ1lOKM+rd1rluUDf81WywntkBQOD329wrJ64ghvWRUdJ62Lkm
	Q=
X-Gm-Gg: AYBFou3eUwFcP5RSD9x/LkQJcMany75mYCgNxHgFrRwjYvK3Gd6A63DxSe05mHmXAfc
	+P/7G6MrdFO3cki+dYwAwS7t7Q701S82/MAA8G8n73V/eWZaGl+JTpyGngALndFopXEIJr0k7/I
	XnN3fCZ95wBpjM84++4pD5DqkOBi8z4ix2HFmZcWuJ8hcoJeiQgP/bc0EPEAIhhEBwgpQ195Zag
	12zET7r18BjLxCTI3CnhZE//g7HkIJiMgqFY82uvZJz3bFjtAS6NtoDNDhCD5ie5YISI8nRfvLJ
	9bJH70BFeYvyQIKDfxSQXkP0hD3gk2PRPHTg14Ydj4B7Q/8gGJjy2sk1DinnQbLDkCOqgDnLOIT
	MoZnoPaLLhqldayVf1wi14lclI1z1
X-Received: by 2002:a17:903:2443:b0:2d1:134:b86e with SMTP id d9443c01a7336-2dd2a1cdd36mr71171205ad.2.1789129531900;
        Fri, 11 Sep 2026 05:25:31 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2d1:134:b86e with SMTP id d9443c01a7336-2dd2a1cdd36mr71166445ad.2.1789129526926;
        Fri, 11 Sep 2026 05:25:26 -0700 (PDT)
Received: from [10.92.160.138] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm8027738eec.23.2026.09.11.05.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:25:26 -0700 (PDT)
Message-ID: <2229f9de-dc18-4c05-8077-59869a987714@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:55:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] phy: qualcomm: qmp-combo: Extract common DP PHY
 init sequence
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
 <20260908-glymur-phy-v3-v4-6-ff22e5150538@oss.qualcomm.com>
 <rtpmf4gfixtn3ka44reaurodo7fgsaj4amajklef22ersizweg@a2drblb654bv>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <rtpmf4gfixtn3ka44reaurodo7fgsaj4amajklef22ersizweg@a2drblb654bv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r6m5Iz3zxNsvbwQ4ugXj3dCksRKDosAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE3NCBTYWx0ZWRfX7TA4tQnTiW1Y
 6JGnd7IxNAl20Ze3KN8ZKJ6vVy5i1AOFFoLFZbJTLVvt+x9Wdyehc4cDudG0SsCQUFWnomtfovn
 UM39uNq3pkkAisD5v8iUWiTs8LcIL7BLbM95gZlhSb8Z8ZgkYrlHqWTcn9KHnE48GX5i+6k3gNl
 cAMAchC0n5dzNFZddGLZXw9GwCPu4pCeYtNxhKAkI3qk3Dg3g2404mnzhOM5tP58Qw4FJB0aI/a
 /qWmwBavZ1v6ZjtSZ4RWxouKJ7z7Hyn9tYiVme6oRcHsxns/bGi6BO9C6sspCeWxf/dyfVFn7Rg
 DzSPklSmyNrXINYA/0/vmVKYU1j1TTHwJpSKoCEbFBFoPA03MY1GO0rpbC+k/cAsolPv/72qY/m
 XEbX8Mea8CHRfwMMguhBTcI7biRIH8oFNYDe9olrsBvQlvznj7TxtVDW3cJ5IGiRUqYBJbtaN/y
 9vVIGqD9/FK/Bewz1Pg==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3f33e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V1R2uIZI5OquyjJlcbQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE3NCBTYWx0ZWRfX1Ebj7uEDGv6B
 XkwSDFP/uVkJaxemm8Uqm4HAGVFH8P83NZ3pTu78uybcWd1CBuF/IgUVrvRQo0R1vbG3UsoD4e/
 pB8UjgO8aHKsrTOl7CEjYQU2aRwjVnM=
X-Proofpoint-ORIG-GUID: r6m5Iz3zxNsvbwQ4ugXj3dCksRKDosAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110174


On 9/11/2026 11:00 AM, Manivannan Sadhasivam wrote:
> On Tue, Sep 08, 2026 at 07:30:59PM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Extract the common DP PHY initialization sequence shared between
>> qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
>> qmp_combo_configure_dp_phy_common() function.
>>
>> The common sequence covers:
>> - Validation that dp_aux_cfg2 is configured for the platform
>> - Writing dp_phy_cfg1 and dp_aux_cfg2 hardware-specific register values
>> - Calling configure_dp_mode() for TypeC lane orientation
>> - Programming AUX_CFG1, TX lane control registers
>> - Invoking configure_dp_clocks() callback
>> - PHY_CFG reset/enable sequence
>> - Polling COM_C_READY_STATUS and COM_CMN_STATUS for PLL lock
>>
>> Refactor qmp_v456_configure_dp_phy() to call the common function,
>> removing the duplicated initialization code. Update
>> qmp_v8_configure_dp_phy() to call qmp_combo_configure_dp_phy_common()
>> directly instead of going through qmp_v456_configure_dp_phy().
>>
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> One comment below. With that addressed,
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 99 ++++++++++++++++++-------------
>>   1 file changed, 59 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 0ec382aebe2b..79006469f3d4 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -3459,6 +3459,7 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>>   	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>>   	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
>>   	.configure_dp_phy	= qmp_v8_configure_dp_phy,
>> +
>>   	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
>>   	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
>>   	.dp_mode_ignore_reverse	= true,
>> @@ -3766,6 +3767,62 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
>>   	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
>>   }
>>   
>> +static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
>> +{
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	u32 status;
>> +	int ret;
>> +
>> +	if (!cfg->dp_aux_cfg2) {
>> +		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	writel(cfg->dp_phy_cfg1, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
>> +
>> +	qmp_combo_configure_dp_mode(qmp);
>> +
>> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> +	writel(cfg->dp_aux_cfg2, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
>> +
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
>> +
>> +	ret = qmp->cfg->configure_dp_clocks(qmp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
>> +
>> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
>> +			status,
>> +			((status & BIT(0)) > 0),
>> +			500,
>> +			10000))
>> +		return -ETIMEDOUT;
> Didn't I suggest that you should just return what readl_poll_timeout() returns?

Ack, I will update in the next revision.

Regards,

Nabige

>
> - Mani
>
