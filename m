Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611193;
	b=wbDLvaykJh05Q2GmDkPGYyTD65GoBTYCjyo7gESr9Tvr9nmwBI/z9VEGdU6xGITHarc2
	 I1RNthdnkN+W5BCsSMq8mXOOcybAHCcnfby1UcBSJa+pYEbNSAzOu4ksUuE/qLmprfMKU
	 nY9eXq/AjCLdnTjQ7arty35dmvUenGg0psFBYxEsJJHXZPoQ39AHXosGuVXmPTQOrL6/m
	 u4fQmmObSIPGLLSvNRQEWzQMRYNLh8po5Jtn1wgjFo5L0rpCG8RyIphC2kchpvSAZJm4p
	 Rux7xXBOJRyVPoXftCsGe7JIb5HjQRfOMokEXwLE9GfOrtBqlOocrmw6rOr9bDnVpUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=;
	b=up3eO80lrOIUp7gu9LVB/wjTvH4QqlSfIl2EWoaeyrKIWEYoyaouTrhG/joiSfqwAaFR
	 5Z3msNJFfcL9TRZdUk7JFxP08C0VI9aWwcOwY4+71ytuh+cldT3JrSiUc8MKACsMQErQ5
	 DsXgJHZw04SLUBuAeW+Z7aT6TVdBZrPs96XlJmUefq/SGOuux097oBrSAvVUkzaHs6Owb
	 73hGxOzUCWip0I4InLoSzVcPtocwsqEQEKst52vu9fF96oPCv31nWGROLiakwhUWZrrTS
	 OdaESJTLgdbLrGzkZ2caVNVcHYr3/133wblBrsHkUOmMhy/6XEg9+dlPyGko2HP5zZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YNGjC+uw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJPAFWou;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBA3606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBA3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YNGjC+uw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJPAFWou
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQwX3440401
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=; b=YNGjC+uwSIOe6IL5
	XYWV8m7UJxqekJmwv8ib6Xq+BPVZHqvll9zDlwCVSrMd7OiSrPXOCvuojNJa0glH
	fbbXSXHylWnKOaHacVw2hg7AtOmFftSoxfEOhXWf7nTO2J6VKmmYdX9ApjVdXBus
	fGT2oKTkFf69bkdk7R2EvxQyVNw0zYXuNQiBhD1FfETdyLCY+ZnHpMGNodAdyTG8
	xvPxK7CdYf0uWKZs89QVfiTvCEnGbDtjTF+5Plp98yElAvuBIT6T885Sc6cH6BF8
	MEJJejp28wwIqo3/L4y+Ak0E9H6DtcW7IyqXoIc38tRM0ppnw6Zvi71PNIrn0+e1
	CkLSMg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201m9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:19:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e05d31e54so1879619b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611191; x=1794215991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=;
        b=TJPAFWouXKHoLZoyyMYoJP/rZjVcDcHtJBoi0zWFUCHbdnIgaVajXNyhnHxTc2h3c7
         TklQm5QKu3U1DHbguIdiE+F7+oD6Ij7rGibd1MnK0InY0yoIdfKGHDVznsbc/xpvODo4
         9PRIYn3czMIikIRyYkr65KfLDH7X5tA+RNGeHRr0JhITPYwq8D3z4uh9TBKu3O1dBoY8
         7S7R3qSejR9tuqebNiXZuJnc17SgHc9EpH2BkeEuaBovO3PouXKH6abQgUqMfcuWE+tD
         WOBkTiQsaLeQxTee0utEr7csKfZ6w28M2E7CnNwSsQ1J0oTc19SNgp2l99lNHRi5n/Ma
         ehcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611191; x=1794215991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dM+Oq09U0gik6VMseiUnNNkPS3lC70s6n7NCT9prtKE=;
        b=GtrP1OMwgXMUJIrVQazP6uOna2VAOOIwX21zOT4jUt+nrpgTTWZ8Y3Pija75xQbeUk
         AOizJRHkPVsgg4aCl4/mudf53yHM/Vgexusgiq20iOwekw030/yQaJ7/1Ge3CsP1/lY1
         DSh7xTIXufFPT12HnXr1Ee/E1Qao9S+2H8YeG1NCD6p+PP49RVZQ04OrXyBfhPUak1RF
         LC8epM3DLC+nFo4bGSIek1uAx9tSG/WApcSejgY2EIX+r3w5lVXvaqDlzXxIMhBft6ec
         DwKE7jBO+sPo6njc2MZEFvbzmqX7KvYMiLGRuS4jG/qmG63loIZJhy+aHUmzoMO9tSc5
         DgRA==
X-Forwarded-Encrypted: i=1; AKwUvByupDr7gVID8A2+gBvxKHQ4zLRsfgx0tBBnTK3zKKrS05symOdtNhcgJ5OhPJKkGZmYkWTHfYS9Y9RZheY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8GBNJ+NAxg0Rb1SGb/8tjNofLlNrShLjvN5kM0u3X0PSUPcZ4
	mOMKQ7GuSx1jIoTQjA4IbY4vJDr2iOjVaiRSzs2qrXTXeei8F/3bbyU+WlYJB19iqSzpl/pbyk0
	HFsmCcvhABVerzqNx4PERrydmNfv5jgiVDIIiKFMV1YCS5y1hMTsFOrWEV6OSI0xw9jA=
X-Gm-Gg: AYBFou2bTwSFm6ykLgsgpAQg65EjTZm6bJ0TlYKv8K6CTzRSsRl1mqR9OEEgi6EuK8M
	VFavOPjWwFy7P0ZNdqK6qnPF7P0QTwcTcmd0FSRXCk0uLodU5gOwvTFLib0yA9bgPBsUgVJT+ig
	ymMfqKfQnn+pSsfblfUcTVttTndD/rkdf/ALT9Rlsmvbf+JLFerrdS7qJD9OXmZQhgmbS5y1Cdb
	/pcHPyyq1mmdna3RfMZsmr5qg+v1q5yzTCAK3bxh0jarwrn38ftdoiJ97WdUFeunurRoHaTrLIW
	rtI31DNobqshTVnyAM9rvWTf/hW+ADm46cCMhLR09gp1FVKpNnBp4FTz7O26t++sSn0Bfim0yrV
	3t+wdJmNRVClcV7n0K48aubx7lVa28eaF5WsxSVUjbmQi0kCN9RCUEDHDkNu/VLyzH5ZpiDIt6E
	fhaJP7cMhZcA4MMdo8w7acMXdKS7/nr+7j
X-Received: by 2002:a05:6a00:3990:b0:886:ead5:6d3b with SMTP id d2e1a72fcca58-8a9bffd29a8mr7141343b3a.53.1793611190840;
        Mon, 02 Nov 2026 01:19:50 -0800 (PST)
X-Received: by 2002:a05:6a00:3990:b0:886:ead5:6d3b with SMTP id d2e1a72fcca58-8a9bffd29a8mr7141327b3a.53.1793611190336;
        Mon, 02 Nov 2026 01:19:50 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfe7sm1780249b3a.19.2026.11.02.01.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:19:50 -0800 (PST)
Message-ID: <d5531292-b2e4-43eb-b931-2b0f72d5a6f2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:19:43 +0800
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
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
 <55aef663-254a-4d36-b9ec-3ce7f4c4c74a@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <55aef663-254a-4d36-b9ec-3ce7f4c4c74a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ierDUrNGMYWvERsGYfQhwUfnrKbxtKUF
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae855b7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iN3j4yL-2maCF0JdeDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ierDUrNGMYWvERsGYfQhwUfnrKbxtKUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX3NGfTR+Q6lj2
 00ZjTCCsj8hSm0WTmF+gexXJM+L2OSNdN5SuRezXaRuc8tMy0TY8P5oOoaWBaWKk8/Gjwr+O4GG
 FhWyXEItaBeIWFkXvJdcFMPKtCVjKSB/MkUV6YcyZZip1JNeca5iFUc7L+20c+1GzKXF8S5YKrS
 WtjY3KC+tNKkZPnFsRCs9B7ea+gFr/35J5/HznFZVUetHEyZoYPq1L0Y/NTj5/UxkOYveCGIIRG
 cVu079bkvWmu72ANkWtcgtAGOzt+u3AlvUIF20+tbeDxMppFaIm8hjsh3IyUsK5R/1Hf3L8I80t
 X2m7HVsB9LknOyY2D0h8k+VK9tVWEAAsgdRu6+mUyMv05ksM4ruX06oJe7s2VZQVtowgB06eHp5
 SBrgkNSLS/4eLcwmo8v8r8IlRWEPOcpWCCCfEoV3Qp71S8dY0pTUgCAHEk/tsXSyDyGd8RvM5Q9
 bp4RT0o2WH7os2dHrOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX25P9xD8cmxTO
 Tlf49yREMt6IOw9Lu0aOONW722YDOyhu3EJdVqBdLWTY0I1aPOEPuNng69pA8jjuUG/LKY8NKbH
 92wL6k8tERwHYvdVk8u/eUa+MRaczNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On 10/31/2026 7:46 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera 
>> pipelines
>> can be enabled by board device trees.
>>
>> The camera subsystem contains:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 401 ++++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 401 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/ 
>> boot/dts/qcom/kaanapali.dtsi
>> index e48a179d0722..0c8fd7da55b7 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -20,6 +20,7 @@
>>   #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/phy/phy.h>
>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> @@ -3597,6 +3598,384 @@ usb_dp_qmpphy_dp_in: endpoint {
>>               };
>>           };
>> +        camss: isp@900b000 {
>> +            compatible = "qcom,kaanapali-camss";
>> +
>> +            reg = <0x0 0x0900b000 0x0 0x1000>,
>> +                  <0x0 0x09253000 0x0 0x5e80>,
>> +                  <0x0 0x09263000 0x0 0x5e80>,
>> +                  <0x0 0x09273000 0x0 0x5e80>,
>> +                  <0x0 0x092d3000 0x0 0x3880>,
>> +                  <0x0 0x092e7000 0x0 0x3880>,
>> +                  <0x0 0x093fd000 0x0 0x400>,
>> +                  <0x0 0x093fe000 0x0 0x400>,
>> +                  <0x0 0x093ff000 0x0 0x400>,
>> +                  <0x0 0x09151000 0x0 0x20000>,
>> +                  <0x0 0x09171000 0x0 0x20000>,
>> +                  <0x0 0x09191000 0x0 0x20000>,
>> +                  <0x0 0x092dc000 0x0 0x1300>,
>> +                  <0x0 0x092f0000 0x0 0x1300>;
>> +            reg-names = "top",
>> +                    "csid0",
>> +                    "csid1",
>> +                    "csid2",
>> +                    "csid_lite0",
>> +                    "csid_lite1",
>> +                    "csitpg0",
>> +                    "csitpg1",
>> +                    "csitpg2",
> 
> These I/O regions should be named "tpgX".
>

ACK

>> +                    "vfe0",
>> +                    "vfe1",
>> +                    "vfe2",
>> +                    "vfe_lite0",
>> +                    "vfe_lite1";
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
>> +                 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_CSID_CLK>,
>> +                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                 <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
>> +                 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
>> +                 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
>> +                 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>> +                 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
>> +            clock-names = "camnoc_nrt_axi",
>> +                      "camnoc_rt_axi",
>> +                      "cpas_ahb",
>> +                      "cpas_fast_ahb",
>> +                      "cpas_vfe0",
>> +                      "cpas_vfe1",
>> +                      "cpas_vfe2",
>> +                      "cpas_vfe_lite",
>> +                      "csid",
>> +                      "csid_csiphy_rx",
> 
> This clock should be named "csiphy_rx" like on sa8775p and a number
> of other platforms.
> 

ACK

>> +                      "gcc_axi_hf",
>> +                      "gcc_axi_sf",

Will remove this unused clock as well>> +                      "vfe0",
>> +                      "vfe0_fast_ahb",
>> +                      "vfe1",
>> +                      "vfe1_fast_ahb",
>> +                      "vfe2",
>> +                      "vfe2_fast_ahb",
>> +                      "vfe_lite",
>> +                      "vfe_lite_ahb",
>> +                      "vfe_lite_cphy_rx",
>> +                      "vfe_lite_csid",
>> +                      "qdss_debug_xo";


---
Best Regards,
Hangxiang

