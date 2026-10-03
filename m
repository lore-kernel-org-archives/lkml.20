Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45254421A08
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025823; cv=pass; b=UadrXzw+n3LCvXtYkfrfBALbskbc+bT9vtEyAv/14jGdqJ8ApUFpI1T8347LplhGrVwkh3U1pf2dLDBaeR/zqDBsUE5XuAhG64UjiRJT7bR5Jj2vCBOemzdn6Dnlh0WGgIlDzXd/tsuXf3znCokLtXCYfHqBvEuRWsiqdxHKwLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025823; c=relaxed/simple;
	bh=/TyCH2CXZvLBL1T153w5Rwq/pPzcUlb0eHwPAnKYBro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVG4hJ/QvjkmA1DjIFm1M101QIjTJcR96/XRBAA7EgxE3LqTIQ0KWQiPmLbuVzYqiOon7JDt7reQOkr4ZlIAUdOVNRYF7aWMLyUReELOVjfcpfahaOcXSyL3e/9EBwWfi4Za3zlFbfmazlAOYsmibQCflgbWVV+6QxOZrW8qncA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+q4x8k/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un6V/ug0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+q4x8k/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un6V/ug0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693AvFCe3315956
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 11:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=85+1ADe93PSs2eP7hA3ohcdP
	8kQhajfqUw+b9HPdrdc=; b=B+q4x8k/s39Tqf7JKVELof+A8TI5U3NFV+a55qVV
	/LJzDuS6jn0PZcKafDCat3RUAC6bPV2Tou3BUqWORGDhDLf9IBWi2sri89HGRS4Z
	OMTMbCPNrvdZyUBMp3/dCZYxIjU8WORChaWWoolZqu7ypYvAGjxT5asd7JXqIcLu
	KEpGoSVPpMzu/00Rt9m3fmj5jd+V+F64PrLNVpzm1iLvYHJOIvP3ioD2DMToc72H
	6Dns/BhLGupledWcCItOKkJ1KImA5L1i7/ud3I8kTuOppWuW7GBAxSbL3LRp9oJM
	ojBkewKjgw5dfI+koALUfyIRnHchRh8z/gaJnWwWr9ni1Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t36gpas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 11:10:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so283629137.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025818; cv=none;
        d=google.com; s=arc-20260327;
        b=ezCQR3/1ye5THhbjKsJDy7xco4N5R6fQne2MvntQEFb7hgmdKEMWYd2CLvaOZrtQfA
         YHckW7K8xevc+FlCUJOBnbfGg6XfIFcFUBmml5lVISklSyQx08Br1SI8UAWWyty9G/Ag
         lWvqZLgnV/Hup0jjp7R2AL70Vki92FeXN0vSr3SC5f3o8ZRajQNw3OJtyzx7aCg4nJ4d
         lSZM751EpUt1eqXnV0i7VoVdvsTV0kx/NpUyBBeIbAm+cold0qxbb/Df4JThZfzNjVkz
         YP8rFYwS2jNUbntAUm/amm2K/6A9MXEnwOXEHKUzjN31VTyTQZuF4Cvo89wwEtZDdeEW
         OPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        fh=7habvL2pCuE3MIlv6Wz9HWfQw3z8Rs2JTllp7I33Jk0=;
        b=CLQ7kcpwmObi2rscg0o/QtoszxxoMRYiZ4PkW64VH2ASLNcYnqs/IzqRwVwLZB1lbZ
         tePB3G5VxQe8D9H2yJyMTf9FoBXj7UR8Gi1dnaScYGn78b9sqQkclvAj6wTvJvtOR3Si
         y/X3JIXqkVFjQPf97RUQszpKouWi07SAhPqEjMbCDmyJMm4pzk+H0hJjsQN1J4Gn44d1
         KGZTYvahAYSiVrLkO4zdIOJhlZK8MkvZv4CXO+PWBxU6y4jG/rhqhdTgNBLSJ/Vl3FFg
         iOeRnDDSrL+E+qvLlAXzmXf5Urg5MZRchc6P2PdvqegLUnyFZKHjKTWXYwQFxI/Us4vI
         9E7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791025818; x=1791630618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        b=Un6V/ug0xwA44d3D3wJdE5Agb8PHhJwkcIV3Pp+U0lCqt7cmbki4G2IbiOA2LOz2+U
         LIqxoGtHmJrzNVEX7+qNkqpDwAqx8HACbLKaT+z8M7VenmonpCiVPRthLl2X6DD1CAxZ
         UVmRzXX8QC2JDobqQNXcDMLF1fSR+6Yo8nV6yJ9xVFee064IJVwXVb9WFQrzdEkUt0wt
         jxYWVQ3RsnDgauWMDjAwDlKXHe833iNIfCUB94ttLXW3U4sd5IzVng03Dvp78z3gDeV3
         /jUpyN3c09RNM+SE0ss0yZKktkWqH6tuofoOVYjrHuh1r3b7U1cfgnc9dN6vN2XnQQKw
         i0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025818; x=1791630618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=85+1ADe93PSs2eP7hA3ohcdP8kQhajfqUw+b9HPdrdc=;
        b=TqPLiFd9LDKeeNsuAYXVByVBkp3e5myOm7k8LFTlPIwscDNS7/+3TpqeD7yNgJx3Gv
         YFYQBZXMvNEXE2U73svvbBlYT8w+8e6KNiki7N6aoWAu6G43NZfaKRBq9V7InS2MbN3Y
         hMvJB0LRf1TKVvrkjfG6Zvt3cmOZjNlVHsB/Diaqh6ybKGmyqUwo3B//YQiHsrPU6cFa
         6XllMKSFwy3FtKAV2MynIaKGca3aDofuYrCbTQe2G/ATuaWnCtH3P/1Mia6kBHVEDW1m
         UfiUzKtH4GZKxsDSnirojYAG5ih2MTJR9zjXkfNqvt0whDi5VidUJ4bjLWBvcFGI6DP2
         mquA==
X-Forwarded-Encrypted: i=1; AKwUvBypCMxDNmBFzP9D6YwFLp3X1BRxRFvy/ZFLWBv9YVXMHTI3IiBk9l9YyLhSx/wrjpCR0f3pvfxjKxsZ9+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdu+r19usP3/N+3YYsRWf6HjX8IAC0nAsyW53A/Z2LcZNfUDxs
	uqp9z1VfHdTLXnu9f8ie/5nX66F79l1X+xR0CoXRZGKucXIu5oecLyJ9bwgELQXd1pRlk/PjHeP
	P5U4MPtooyS0dfMBydiiwiux5Fgs8+BbfqHanI8mcrjV6BrIN8XJWglJaVeXuN2TxKAq7RHUgsN
	NoQN6/vA8UbfYQZn0s2ovmSHu7/Hv08q56x4z3TReTbA==
X-Gm-Gg: AYBFou19YjI5pFlyHF4uViPjgTsq03lXxvGaVw/eJkH68Abi86P6h4RRIxIH0kO/Vuf
	UNG+XX0c2iOY7vx8i9EldG0eH8ANSgRoXcpX6jhSk2XDqFdTJMj0h+zvZZk7GBhjc1i0GXCaXdx
	smoqizKuJRHU1Xrq5HxEwGYSKqHXOmGxGW4DelnZapxWfJstjZrJFCLkFNp6sRCVicdSdpNh1A0
	LQ6WJnDnv7Dz0E+tQ==
X-Received: by 2002:a05:6102:1490:b0:7b3:72ec:95c9 with SMTP id ada2fe7eead31-7c0f1ade126mr1808347137.5.1791025817684;
        Sat, 03 Oct 2026 04:10:17 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:7b3:72ec:95c9 with SMTP id
 ada2fe7eead31-7c0f1ade126mr1808325137.5.1791025817163; Sat, 03 Oct 2026
 04:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com> <022c47c3-54b1-43a4-9161-1d0acb13b736@linaro.org>
In-Reply-To: <022c47c3-54b1-43a4-9161-1d0acb13b736@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 19:10:06 +0800
X-Gm-Features: AclHuK-_DZZ5UAanpheGEwtkxas3xxOMP-L2JQ6TTe_v9IAzR_FdXx_rGiRb1rM
Message-ID: <CACbMrhr1srrcz-c3w1VgzHjdCEiG+6zRGZpjm9qMO3dt09YbPw@mail.gmail.com>
Subject: Re: [PATCH v18 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX9jsMFsUdxRUK
 RimSaK9Id+/gLRca/GpumTdC06h27xfjLhqgBrToabaM+6WXn2mJgdkGMCVOCOb8Rit85m4CBuc
 mDlhNn7x/UUhFPjjTmJ6t7mL9pqNt9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX3kQP29zoAnBD
 MCTKTWxZuL2IGUwBbi71OJ3pLI4OlRgyFklcQyPSR/mUM1oU2XZjIaTSPI3JABZn5krbHtbywv8
 aBzaSCmVCOT4QfeFPoTl3ropZbmRQ29EoTPnXvu7XjyhDhYcXs6805fAh2rxsPdC4yp5dwhYSs2
 kXliKAOmpAxRGOCJWQULcnMIvJ8+0nVblgVy5fjCFW7Pgr9IvRxbV2OnUz9oorUoLEogONSDeIm
 O+cuLFWY84+kgu2guzjIQl9P4XBXBOLswuQEpxrBU6hk0SpC+uXtkCU3IieBpD+4+HJDHmo5R/u
 21PlY8P4L7p1cOeWLGb0djX8Y5b0wJ34CFmSn4EEOd3qRiCjTf/O0VsVaQ0p25ckXSCRiGuLOMG
 U6tJcPZN/H3KjeShAcb+s5zlWROtZ0EGZvowifVkZiFuVIAjSJ+xuCQbchEZcV3+dphy32tyH5j
 Daq9gfjIh/kCVv3JH5w==
X-Proofpoint-ORIG-GUID: D_4g_6yl3_0UZYBcPIEiZRt-htuhZA0w
X-Authority-Analysis: v=2.4 cv=UpH2pOwB c=1 sm=1 tr=0 ts=6ac0e29a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=gaIY05ubZypsO8VhkkgA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: D_4g_6yl3_0UZYBcPIEiZRt-htuhZA0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030044

On 10/3/2026 5:08 PM, Bryan O'Donoghue wrote:
> On 03/10/2026 10:02, Hangxiang Ma wrote:
>> The CSI2 PHY common status registers are not at a fixed offset from the
>> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
>> v2.4.0 parts differ.
>>
>> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
>> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
>> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
>> no-functional-change preparation for describing other SoC offsets.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++
>> +-----
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>>   2 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 966d79c98f9b..8cd331cfb4b3 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -19,7 +19,8 @@
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B    BIT(0)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
>>   #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD    BIT(0)
>> -#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)    ((offset) +
>> 0xb0 + 0x4 * (n))
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset,
>> common_status_offset, n) \
>> +    ((offset) + (common_status_offset) + 0x4 * (n))
>>   #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)        ((0x200 * (n)) +
>> 0x24)
>> @@ -176,19 +177,23 @@ static void
>> phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
>>              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 6));
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 12));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 12));
>>       csi2phy->hw_version = tmp;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 13));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 13));
>>       csi2phy->hw_version |= (tmp << 8) & 0xFF00;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 14));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 14));
>>       csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
>>       tmp = readl_relaxed(csi2phy->base +
>> -                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset, 15));
>> +                CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs-
>> >common_regs_offset,
>> +                                  regs->common_status_offset, 15));
>>       csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
>>       dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n",
>> csi2phy->hw_version);
>> @@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_4nm_x1e = {
>>           .init_seq = lane_regs_x1e80100,
>>           .lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>>           .common_regs_offset = 0x1000,
>> +        .common_status_offset = 0xb0,
>>       },
>>       .supply_names = (const char **)x1e_supplies,
>>       .num_supplies = ARRAY_SIZE(x1e_supplies),
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/
>> qualcomm/phy-qcom-mipi-csi2.h
>> index 7e55ae007370..d6366f809e51 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> @@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
>>       const struct mipi_csi2phy_lane_regs *init_seq;
>>       const int lane_array_size;
>>       const u32 common_regs_offset;
>> +    const u32 common_status_offset;
>>   };
>>   struct mipi_csi2_genpd {
>>
>
> Aren't you using the CSIPHY driver in drivers/phy now ?
>
> So if phy stuff has to change then that change needs to go into drivers/phy
>
> ---
> bod

Since v15 the series has been based on the new CSI-2 re-architecture,
and this change is a prerequisite for the subsequent patches. The main
reason for keeping this in the Kaanapali series is to avoid introducing
an extra dependency and keep the series self-contained, which should
help with mergeability.

If you'd prefer this to go through the PHY tree, I'm happy to split it out.

Best Regards,
Hangxiang
