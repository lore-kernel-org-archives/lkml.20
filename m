Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144772;
	b=kzJRmLV+mpsKYghIDjUy0ZiZdsYO1CB1YxHzlP5wF3wQC27Ef6SToJQOKCONtKznaKQf
	 BV+aHVQQNjEn/zunMqc5rUmiRdvZVeVODkItKq4DVAoTC6H8xiYnCWe3ZELAaCvECVJBz
	 dEensZZ4/lRFH/zh0g5CwG3vnNEQSMTf41qDvcXXZvJvRJZNTdoItLoZEFgy23IPfHjGJ
	 3PqHubsZIWoz4Uhz39mNvgsXgDwyEfogV0ZGaDdQhCRUir7ns5shgbNnsf+wn0iex65NJ
	 5GwcseWmqJ88+30J9iXHDkuYrD9qgC0q74COCdrPAzcfQ7wW8BVRCkEIHSWN/9BOWFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=;
	b=HDO9QBm7b08KvNZZXhepyPMeZ0TK0T/6Fcex2h/mph0Y/QUgn6JcVoGoumOj+cyDBNnM
	 5MBMiYDhoveSyzfEDJB5RLUy8Tw4d3vS61Xx68HkfG0wzgxryggcgqMyEBz0ePGH186q0
	 OiZCFrJcCBaUxiGpRY9laG8qjlIF7FKlvbw5H37GX2QmTroKejQG4cTpu9u1NQkfTzaFR
	 bo33i1vA/iU6qtgd8lfooIDDamf1VllkWRaQuVeukGRMkS3j83Fo+3wqxnjEo/cyRZkzR
	 rLyL6wMBCtaQ5bVuFM0eeuC7JgH+xEbcItLIbkwYjt59FUzW9XBJ0Pr4ihJ7x5Ec9ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhsuEJ1E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXInXtkG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD95C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD95C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhsuEJ1E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXInXtkG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtP5C3336692
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=; b=OhsuEJ1EELNpbET1
	ZDtDr9vJ+Nl7HYv9/qC1dtjz9y1LRtW1aPENhQMw2FwKRFKJhCUM2QRnDS0RPms+
	8L8XB4CobFUaLXFINzyGWCh0j0vwQ+UuJ+WiuQZc9CodO8sRizoqqMsu6UZAGaj4
	A6C8VJi4lfMkEr5vdsj/wZCkft/VUa9u5Qqqnwc8g0kyhJSwEKBLDBHjHQrJqGG9
	D8oM+YdR6BvTNFGAtV746g3UXptIbLH3NTrrf2Tm11dtnN6abTMKQOEhMksLLjuH
	HpU5M78I/ie3Um3TizGz+7kAUpkKL5C1CoMDdlU4kHppTrtJmBhdjjhJ3rlw/CTh
	fKs56A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1k59w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:46:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so510477eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793144770; x=1793749570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=;
        b=OXInXtkGzYX06AU3OxoEzP/IkcnV7oIfASflVSE4YRtKCSMbyAX9tbGH6iRk/WO49L
         nIb92uDnDpONO5T1H0uKokBg0vB03IHJwlXNhgL8a3Ga/hHbeS/RcIefG92r89HqfoY9
         RQlShd26/WYm3LzuplHqMvJKfng6JygG2vRLmoUk/VuODUpVTDHdatY4nzAg5plOySb8
         UfassIFwLTr1IWrAiDwQ1qvRmn069IxDMHju7Qefg6aFTlGoM4yMRvaM5ChEXzLp6zFt
         0Cjf1vsxlZrt5+CSfwemlmeFQoPbQjkN6ht6eSTCe/cgP3WoJtMa7GADiU6igKpI6jWh
         Nodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144770; x=1793749570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=;
        b=yEX5xYjzk7UJlFg9m7HFCloHCLnIZ+NhNk4t82VC1oGtfljY7Wrh8hm1UUnPd+XyxC
         oyoIVSl2QgKgUuApQyvdscGRPMQ5BVJCukYiwYVMufHubX10apGDWZbgnDaUKv5DwozL
         9rxpgP/mlcCA9gS1CpL6/tQpKDSsq4G8uGVKGuSS0yA0P9T5Sx6FzT9OJ+xooSefWJ13
         btfLH3yKKA4FVOUwiofShIbBSIIcqgVMBRBIG9+Q11f17tASPCloxErKIUx5O79FoB8r
         EEaVg5MPUmzT+WK6pp2pacZ5jF93123jlC0weavCdV0MXmhOtIUr/MTa56NeMOPbpt2c
         clZA==
X-Forwarded-Encrypted: i=1; AKwUvBxSKbdoVOQylSA4g0EVyx3fbcSH0c1UGm/A2g637eKnLHla2pOVAziY2kYpuXhCzPo2Eh0CI99P/5nP1qU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ8uxUfrx4REfaLB0NlW20CoAcCoHOuyPzF1gNgvOo3WYDYCdN
	aMpb4cOLtOwhSIDPNx+n7Fs0I3Nz7nydd6Pep/gPr7Aid7CGXXY6QveEX3PNa/hz/UqMnc7wY5I
	aUp1J9R18Ji/7T5TkT6qrgj1wrVJ4fkkFLqNfX/T6YUP8o3XkCyIIPw41LVfPhj0kias=
X-Gm-Gg: AYBFou0t2rUtqW+5WTIi0ssG+xmNyA/fOqcdoWSM9u1uDKmyJ8lo1gI0oBj4xfMCbWK
	AlYP8OWUk0YTJhq/Vm2+wcjtKAfDJUKWsiUyTIHOa7USIcqJVHV/650fHTQhposilC1pq8lZX9x
	E8ESGmLRxzt1/RMoQjzP4Hh159qOsLAEG81O+Vw34WGwtU7qfIbRIrGRe0uLSQ29zumy6qns8Q5
	ukP1lXtlzj8A+nfQzS6kfINePanYxtxYAkqp0NgI+/sHTS6AqHjYXKigtvhGoYunrCVl26DGUR2
	HH+z1weVRCsv3V0sKpi8DjGenqB8LaGXONIVxljYYCI7N+oGM8FD8R/0b9OiQuQSWxufuFFchLZ
	htvP943pn7yyU37UcEz4Qf4DctL8vC1R2h9J8zvhx3yRCNYsJWds4Rse9kpU11A==
X-Received: by 2002:a05:7022:1217:b0:14f:5cd:f286 with SMTP id a92af1059eb24-1a6cf729c4fmr1036876c88.34.1793144770038;
        Tue, 27 Oct 2026 16:46:10 -0700 (PDT)
X-Received: by 2002:a05:7022:1217:b0:14f:5cd:f286 with SMTP id a92af1059eb24-1a6cf729c4fmr1036828c88.34.1793144769398;
        Tue, 27 Oct 2026 16:46:09 -0700 (PDT)
Received: from [10.134.68.191] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d85f23dsm153319c88.11.2026.10.27.16.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 16:46:08 -0700 (PDT)
Message-ID: <b1312ee5-52d0-4294-a05a-f84bc334af74@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:46:07 -0700
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
Subject: Re: [PATCH RFC 0/6] phy/media: Add generic MIPI C-PHY support to
 CSI-2 stack
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <pFAaFSKH8thStYg6_Ew1gWdIvj5lbNBF36QKdamV1cU1Nc73wEZfM_KdQWL2NmB5fvaUpMPen7qMOzjHZ9ROIQ==@protonmail.internalid>
 <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
 <141c5032-1915-4dac-bbcf-e697b762ae40@kernel.org>
Content-Language: en-US
From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
In-Reply-To: <141c5032-1915-4dac-bbcf-e697b762ae40@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae137c2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RNcpwd5BfBhkYgEZawkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: CwiH43aCw63K8XKlZit2lR27hpRznpg3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5NSBTYWx0ZWRfX+G+kO2R6ndS3
 qra0Q3ISOgkm+eka+FLeyF4YOzqEi23sWULLNje2cwrguD3edWfu0WVKn3Qi9Z6lEA7fV2jomaL
 LTan6ijefe/2xpYD62u4TMbJlu30VZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5NSBTYWx0ZWRfX3tTSzkioC++J
 BK0m4hBIMEo2iwJhR6QQ+FYvd+BeFjGTvGv52XeQmI1zUaTdtPKA+yjVL8qyqwUAfjnnr44q7e+
 /XDf2p+rH9Scvorbz1Uckwa0mCWEkQPuWVtmwrix25tW2/RnnJNTBrvydzEMZmv+ktBt+9QVYoy
 bG1l9Ts61DI8xQuTxpZtpFW0p6zFQL11EIupyalvUJnxiQO+sJIpmCNIpEYWRo/iY30s4ZDoKnq
 JP6+E2ZUGhIFKoO5pSIKD/ec7pAYfiHY8r5bORrz0ZTesv2iAkiqRdSiZKZrWPtf7ogmEjqPR5x
 r0yjxzDRuIaHMDSmdGG2otWohNyCbdCCaKR89Mke8cc0tK0oxCJGoFyM3rgg4Ck8IE5kRiISqSV
 gCN0FgdBMocUbna10TBGXlQQ4B1de3Ir3Lq2614D74mEqa0wiXbfUjaFz76oCMEcafs2H77X41b
 vPQTfPlRhBYGJeOkWSQ==
X-Proofpoint-GUID: CwiH43aCw63K8XKlZit2lR27hpRznpg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270095

Hi Bryan,

Thanks a lot for your suggestion regarding file structuring and naming 
convention.
However, we think that having the separate file will make it more 
functionality oriented distinction. It is easier for addition and 
maintenance.
Also, we would like to propose to remove 3ph from the file name 
convention as this is misleading the operation. DPHY is 2ph, whereas 
CPHY is 3ph.
We are proposing to have a naming like phy-qcom-mipi-csi2-dphy.c and 
phy-qcom-mipi-csi2-cphy.c as the names, DPHY and CPHY are sufficient to 
understand the 2ph or 3ph operational mode.

Kindly provide your suggestion.

Thanks,
JZ

On 10/17/2026 4:39 PM, Bryan O'Donoghue wrote:
> On 17/10/2026 18:13, Nihal Kumar Gupta wrote:
>> George posted a C-PHY series [1] which we are currently reviewing.
>> As discussed with Bryan, this series shares our independent
>> implementation so the approaches can be compared.
>>
>> Two aspects covered here are not in [1]:
>>
>> - Settle count calculation derived from sensor-reported T_PREPARE and
>>    T_PREAMBLE timing via get_mbus_config(). [1] left this as an open
>>    question.
>>
>> - Data rate based register sequence selection using effective bit
>>    rate (link_freq * 32 / 7). [1] noted downstream does this but
>>    deferred it; this series implements it.
>>
>> MIPI CSI-2 operates over two physical layer variants. D-PHY uses a
>> dedicated differential clock lane with up to four data lanes. C-PHY
>> encodes the clock within the data stream across up to three wire
>> trios, eliminating the dedicated clock lane.
>>
>> Patch 1 extends the generic PHY framework with PHY_MODE_MIPI_CPHY
>> and struct phy_configure_opts_mipi_cphy.
>>
>> Patch 2 adds t_prepare_ns and t_preamble_ns fields to the CSI-2
>> media bus configuration and extends CAMSS to forward them to the PHY
>> provider for settle count calculation. Sensor drivers must implement
>> get_mbus_config() and return non-zero values in nanoseconds; stream-on
>> returns -EINVAL otherwise. The strictness is deliberate: C-PHY settle
>> timing is symbol-rate-range specific and no safe value can be derived
>> from link frequency alone. A conservative fallback could be added if
>> reviewers prefer.
>>
>> Patches 3-6 extend the Qualcomm CSIPHY driver: refactor D-PHY
>> register storage to accommodate C-PHY, accept C-PHY mode with
>> multiple data rate table selection, compute settle count, and add
>> lane power mask support for C-PHY trios.
>>
>> C-PHY encodes 16 bits per 7 symbols, so the effective bit rate is:
>>
>>    bit_rate = link_freq * 2 * 16 / 7 = link_freq * 32 / 7
>>
>> where link_freq is symbol_rate / 2 as reported by the sensor via
>> get_mbus_config(). The rate-table entry whose bandwidth first meets
>> or exceeds bit_rate is selected.
>>
>> The settle count defines how many timer clock cycles the CSIPHY
>> receiver waits before scanning for C-PHY sync. It is computed from
>> the sensor's T_PREPARE and T_PREAMBLE timing. The /3 factor reflects
>> that C-PHY distributes the preamble sequence across three trios:
>>
>>    settle_cnt = (t_prepare_ns + t_preamble_ns / 3) * timer_clk_rate / 
>> 1e9
>>
>> D-PHY settle count is unchanged from before this series.
>>
>> [1] 
>> https://lore.kernel.org/all/20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com/
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>> Nihal Kumar Gupta (6):
>>        phy: core: Add MIPI C-PHY configurations
>>        media: qcom: camss: Add C-PHY timing fields and get config 
>> from sensor
>>        phy: qcom: mipi-csi2: Split D-PHY register settings
>>        phy: qcom: mipi-csi2: Accept C-PHY mode and add register sequence
>>        phy: qcom: mipi-csi2: Add C-PHY settle calculation
>>        phy: qcom: mipi-csi2: Add lane mask calculation for C-PHY
>>
>>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  90 +++++++++---
>>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
>>   drivers/media/platform/qcom/camss/camss.c          |   8 +-
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 159 
>> +++++++++++++++++----
>
> So on thing I notice about this series and like is that there's a 
> small change to the existing 3ph-dphy.c
>
> - Since it supports 3ph-cphy the file should be renamed
>   3ph-cphy-dphy.c (or something)
> - I like the progressive nature of he changes in this series
>   as structurally the right way to add stuff in. Small digestable
>   commits
> - I think the missing piece here is data_lanes[] and lane_polarities[]
>   per the other series from Qcom
> - Another thing is the other series from Anusha has
>   a more advanced mipi_ops data-structure for CPHY.
>
> Basically I like the approach taken in this series for a smaller 
> change to the phy-qcom-mipi-csi2-3ph-dphy.c file.
>
> I'd like the best of both series - I think there is alot to resolve on 
> lanes, data-lanes and lane-polarities in the other series and looking 
> at this series, it seems to me we don't need a separate 
> phy-qcom-mipi-csi2-3ph-cphy.c, I think Konrad observed in George's 
> series that really the file deals with 3-phase PHYs and that seems 
> true enough.
>
> Please work out between yourself and Anusha what's next.
>
> If possible I would prefer to contain 3ph CPHY and DPHY to one file as 
> is done here - at the same time the definition of CPHY ops and lane 
> mappings is closer to the spec in the other series.
>
> I think either you should take Anusha's structs and lane definitions 
> or Anusha should take your approach to minimal change to the 
> phy-qcom-mipi-csi2-3ph-dphy.c renaming it.
>
> One of you needs to pick up the patches from the other one.
>
> George can land his stuff on top then.
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  51 +++++--
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  25 +++-
>>   include/linux/phy/phy.h                            |  47 ++++++
>>   include/media/v4l2-mediabus.h                      |   2 +
>>   8 files changed, 315 insertions(+), 69 deletions(-)
>> ---
>> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>> change-id: 20261017-cphy_support-2ce4d656e631
>>
>> Best regards,
>> -- 
>> Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
