Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611096;
	b=zz18shLWYlZYAXj7ID+yFab66WnVVhGl/+sWhbJgprfMLbLrrWzJMwNRqf6yKiQUm87i
	 p5bMVthEfVNca+Pz380YMFOl1G6/bmsUjeplWWpZU7P0vGTVr2puGoqXeWboLrWKeWVLQ
	 KwNX6ARRXc9nH+tlc4rjSMwG+92WTuvXRrDXeWSTb29q0IywLzwcXxqcVPR/gorKWZnyW
	 3PDnsd9YePGemrfahjSlJPCrMcfc5A23FV+bx9rfI674n7epgZaKuWgO7YWj7996aj4yr
	 qceknG2u/1JLEgKy83/nrXmMs8ruq9wtvTDFJYBs9v0E9pHxlfxIYjYwdGsOCwgFi+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=;
	b=uvYkDoGMotTp8jAd51og6FuUm7yWlP1dyS3cXCLrBmU8iCgdw0wphUTvAADvhlULX1qK
	 mZfUXPS7874alQbWEWgsONxm5studZuSzZftpiUQuF6kbuzRCJwULagBF2F9sSPsSeO4I
	 Mf7I34JuZ3T38pcZsAjuIZIWEaGGswqNQZuI8pa/YYAKfs/MEV5lNGprHNuvem2EEsedU
	 7EZ7642JwOzDS7NWsewlkAeyhRSZhxZgXcq5MsE/WGe1I34LGPhjsZYXpnQ3q3vbHobDm
	 PFleeJFktov/ddOl1BTLIFw1KOcLCsxQaVWREd/yAZ5M0X+ymY91mWTcBdW49EKchPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AovAE3VJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5oNVJE3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AA606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AovAE3VJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5oNVJE3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1oX4015032
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=; b=AovAE3VJ0TaYsNYn
	E8ywr9B8rjHa+QUP8TmYW8aHcBvsbeuh2XY1xazLqOGY+xlaMqEUplRCreqXFK/B
	OBjhsXe2oLzzPMWky29RuuosI5rG316XsZr1a1b6CaSwRM5XF6mV7/3VPnB7zYR5
	UY+v/dIK/3ZMDBrMzEoqDjT8pVmnaoToHSniHV+yWvBTKxPPB3msreKL97Hifo0j
	89SRUrJNag8HTKqqDx0CEhSYjs3ngWM7TATCJp27neThcncbecNcr41Z7aozcnd5
	zzr2Rdup4LX5uFw+ALyU8Hmhrvz2BY1SZxm9nQMqJbtDj1WNZQQrPHbN2uQRGeRT
	sPlKrA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p9jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:18:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2704509b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611093; x=1794215893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=;
        b=U5oNVJE397uuRtqS9kXPv7f4x6sZ+tE1TkW1SyuARj4WRPuDTuvESI97Qbebz6SLBO
         O5lw52d9jtwdFTAkf9SPw+SAOD3H09bw2WrfqwtCU4Y5HCTlfMbLMuWXFnq5iXX46zdK
         EwWIz2ODJ/TJhcILpvpvUPQ41u6IBsGcBSjK3ZPj2taQ55SqaIqPmxTMhqinauFD46Xg
         pRBeXLh96iBLxiJOpjmWXEucBdRVKwYsLFGsTAi+hL5TQbecWHZPbRULoux8Snp4dBlC
         ThxdNm77CCL+g6KuLh7KaRwr0AxoKW3S7H/FtY1u0G6ta9gN3RSO/tp1GQCmL9HTk1z9
         4eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611093; x=1794215893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=;
        b=eSS4sMeGOSCmoNfmAV7gHA8YAiUUS2JE85iyHkgtQFJ0w5vSFR3GRyd0Q41lD+d6xc
         BObvWUMvMjMGI5Nb+FtbQHPYkLvVJZVwKCzKOqJ7ATf31BkhRmXTbiLOJhktVcD0Hw/J
         rxyxdjMFwhUcL5h0lN9cUUmH+PHx0YeBgNYMf4NPaF+bWQuYwEbTSXiV1ny6w2mPtOF3
         MBoMVG5iYVtWTyD+c7DNI2LtM0+BgMBuXvq8SeFGh9QVP/z+1M8U5+YIhcOcoohJoAs+
         izBNmTmgPShkk6jXvj6X0i9tn+hx4KAIiiqg/ea8zgAbiwlTClNqbIupbfJ+Co9byNJv
         ffMw==
X-Forwarded-Encrypted: i=1; AKwUvBxBRjj2EpYi4/hDCs+tH7oFTMG4y/dflHn50NwvoPc8kwe/QWOy6e0XoKFCbHZpDECySaNWcuDS/hz0z3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YCPTGSs/Azml8TF9oow7Z9lucc9TagoTTEPXw9COLcRxbqzh2
	DnWLV4rfFSpyIBLQ5Gnf22qjrGqNbP0Y2uPvfY5a2QATlxBUoECPD8lxSWVmLzdzdmKCQBcH0J4
	2aucRNbwIGi8s6Gt7VcjcJ2eUVYMaJLTuV85sOhJpNDYAiuWJ9ds66Nogj7m8q/aAPAxnLD+kfy
	g=
X-Gm-Gg: AYBFou1e5jKS5uihv5aksQTLIMIV5fc27YuWuXv3Hk2zpCKokDPABf1OFDMq9X1Nw0c
	63EGd6LSaZ/3O1RV/nmrKPKE4uxal6MJbuYcD2HP/wEKtLCCqUfUk493dBpBlfctjYDh21vslsH
	tj8YxA7LI39X5l8tzFzelaYF2/fmGKxMx8JoHnMWcpprEbAf3WbheV6HKQfM5eHxBIA9kH43GXw
	n6eDWYOhdlFEpFaMiZ6h3Epd4n8gdfs28Q7Qj+pFR+wzjB8RUj80VllhCXXTXsmT8stRSzIxGNF
	eQUp8Kg4M9PELKX0H9wxJVYzZ3FY9JfA5UVKE7T9jR8jO/fvslre7QLjKtuKjuZQFnjY41Q8osa
	gxyo5ukl6pZ60CGSBZDn5R9EN4mg7o4mKN4QH+jqfmruqJseimRMuQ4o521lV7thPXw1j93qKmu
	yQCfxGAjkMU00VR4Hd0ojMKliHr1gj4kTq
X-Received: by 2002:a05:6a00:4b56:b0:88b:8701:b869 with SMTP id d2e1a72fcca58-8a9bf2406bemr5756710b3a.24.1793611093444;
        Mon, 02 Nov 2026 01:18:13 -0800 (PST)
X-Received: by 2002:a05:6a00:4b56:b0:88b:8701:b869 with SMTP id d2e1a72fcca58-8a9bf2406bemr5756686b3a.24.1793611092908;
        Mon, 02 Nov 2026 01:18:12 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm1710055b3a.55.2026.11.02.01.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:18:12 -0800 (PST)
Message-ID: <65de0201-eab7-4d03-8b00-af17e2907856@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:18:06 +0800
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
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
 <7c7cd421-81de-4c5f-9e37-0bb3b7bc5974@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <7c7cd421-81de-4c5f-9e37-0bb3b7bc5974@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hkAitj-1MuNLw4AJDYe7uejwecdBb-pn
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85556 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=J83HQVenGjWz2Msjj4QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hkAitj-1MuNLw4AJDYe7uejwecdBb-pn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX/MeBDX29KSfA
 DbVtukIaPEPQfsQ0JIyUz2DnhF3gOpq+jol+PtlNf+lxHzzw8h9b3TG+8zENT1PbH7Xv2w+grzu
 oVJ3m53eL8TG2HjlnWmyL6WtCatd2D8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXzpxF6BxxLxH/
 u8rTNmKgplkyqOf3MkxpV+33UhRaUnWfSGImOIACZU7OCjRuXth/Xv5VvuYBwvf5WD8its3jPWL
 9VnWDwwC1LHQR9EtxxT6wK0HgTZk+SLKxrGPifSLpR20oTb56b9BaL/SWwM/klecHGq4NtoajtR
 z4hzInzBVpS0mEdbgVD9wdcAFPIkqXwWkntoMXXDfz1FCli/Te2hXpZ7GHTV6i2lawDDXG4+zdt
 i7jrij6pOG4buwxdaQ7MzJXWDU+202TaRkRzQ7lBpxup4C0DWJQQclcQcwZz47hx8zDMsS+qNAX
 In23onhyUyuOf2CFfCSLurGH/tOF5VmnQEMZ9ftZVssJow+0HCQ/aSsyOEcBwBwMh2Z1Hi862ha
 SPCAzeCpR8l3Cvygrabgt6GCHQ3JUGZRxqNwYiIbSqp6j8Pg/YdMdg4f59/BCLtm0OxJZ8nEWQD
 PDshH0VymfVXAdAOBcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 7:38 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add support for the TPG found on Kaanapali. This TPG uses hardware
>> version 2.4.0, which drives test-enable and reset through the
>> TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
>> TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
>> CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
>> the data source when a test pattern is selected.
>>
>> Add the TPG resources to the Kaanapali camss resources so that the TPG
>> subdevices are created on this SoC.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
>>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++ 
>> ++++------
>>   drivers/media/platform/qcom/camss/camss.c          |  2 ++
>>   3 files changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-1080.c
>> index 3d90d31201fa..ec56ba85a0fa 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> @@ -64,6 +64,8 @@
>>   #define        CSI2_RX_CFG0_NUM_ACTIVE_LANES        0
>>   #define        CSI2_RX_CFG0_DL0_INPUT_SEL        4
>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL        20
>> +#define        CSI2_RX_CFG0_TPG_MUX_EN            BIT(27)
>> +#define        CSI2_RX_CFG0_TPG_MUX_SEL        GENMASK(29, 28)
>>   #define        CSI2_RX_CFG0_PHY_SEL_BASE_IDX        1
>>   #define CSID_CSI2_RX_CFG1            0x884
>>   #define        CSI2_RX_CFG1_ECC_CORRECTION_EN        BIT(0)
>> @@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct 
>> csid_device *csid, int port_id)
>>   static void __csid_configure_rx(struct csid_device *csid,
>>                   struct csid_phy_config *phy)
>>   {
>> +    struct camss *camss = csid->camss;
>>       u8 lane_cnt = phy->lane_cnt;
>>       int val;
>> @@ -156,8 +159,16 @@ static void __csid_configure_rx(struct 
>> csid_device *csid,
>>       val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> -    val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> -           << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +
>> +    if (camss->tpg && csid->tpg_linked &&
>> +        camss->tpg[phy->csiphy_id].testgen.mode != 
>> TPG_PAYLOAD_MODE_DISABLED) {
>> +        val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
>> +        val |= CSI2_RX_CFG0_TPG_MUX_EN;
>> +    } else {
>> +        val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> +            << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    }
>> +
>>       writel(val, csid->base + CSID_CSI2_RX_CFG0);
>>       val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/ 
>> drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> index d29de5f93c18..cabbb2638cf3 100644
>> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> @@ -22,6 +22,7 @@
>>   #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>>   #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
>> +#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
>>   #define TPG_HW_STATUS        0x4
>> @@ -33,7 +34,9 @@
>>   # define TPG_CTRL_OVERLAP_SHDR_EN    BIT(10)
>>   # define TPG_CTRL_NUM_ACTIVE_VC        GENMASK(31, 30)
>> -#define TPG_CLEAR        0x1F4
>> +#define TPG_CTRL_CMD        0x1F4
>> +# define TPG_CTRL_CMD_TEST_EN        BIT(4)
>> +# define TPG_CTRL_CMD_HW_RESET        BIT(0)
>>   /* TPG VC-based registers */
>>   #define TPG_VC_n_GAIN_CFG(n)        (0x60 + (n) * 0x60)
>> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
>>       }
>>       /* Global TPG control */
>> -    val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
>> -          FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>> +    val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>>             FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
>> -    writel(val, tpg->base + TPG_CTRL);
>> +
>> +    if (tpg->hw_version < TPG_HW_VER_2_4_0) {
>> +        val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
>> +        writel(val, tpg->base + TPG_CTRL);
>> +    } else {
>> +        writel(val, tpg->base + TPG_CTRL);
>> +        writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
>> +    }
>>       return 0;
>>   }
>>   static int tpg_reset(struct tpg_device *tpg)
>>   {
>> -    writel(0, tpg->base + TPG_CTRL);
>> -    writel(1, tpg->base + TPG_CLEAR);
>> +    if (tpg->hw_version < TPG_HW_VER_2_4_0)
>> +        writel(0, tpg->base + TPG_CTRL);
>> +
>> +    writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
>>       return 0;
>>   }
> 
> It is necessary to split this change into two for the next run:
> 
> 1) the generic TPG subdevice change to support a new hardware interface, 
> equal to
> 
>    https://lore.kernel.org/linux-arm-msm/20261031112203.545319-4- 
> vladimir.zapolskiy@linaro.org/
> 

ACK

> this new interface is for a range of hardware including SM8650 and SM8750,
> 
> 2) the rest of Kaanapali specific changes from below this comment.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 6ff82dd2aeaf..df4b4cf30711 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5850,11 +5850,13 @@ static const struct camss_resources 
>> kaanapali_resources = {
>>       .pd_name = "top",
>>       .pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>>       .csiphy_res = csiphy_res_kaanapali,
>> +    .tpg_res = tpg_res_x1e80100,
> 
> It is closer to 'tpg_res_8775p', at least the proper name for I/O regions
> is expected to be "tpgX" rather than "csitpgX".
> 

ACK

>>       .csid_res = csid_res_kaanapali,
>>       .vfe_res = vfe_res_kaanapali,
>>       .icc_res = icc_res_kaanapali,
>>       .icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>> +    .tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>>       .csid_num = ARRAY_SIZE(csid_res_kaanapali),
>>       .vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
>>   };
>>
> 

---
Best Regards,
Hangxiang
