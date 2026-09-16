Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC43630A0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570092; cv=none; b=WOY4VR0E8iseLcGXlzErhrukkCqDYoRHBCT+9zvhSOwIVgNmhHiO0JUK3RE5298nbHf1aAFGO8bOaUnUu4c5h6GjmE4dcP8aJ/aCTkk0GhRvR0PLruOBscd4vBogFIsUFsxaFxTM7xxiCQdd4G4nh3O/kWVi7N+nZ3/NUk76ROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570092; c=relaxed/simple;
	bh=ADERtoxYIOzXLRbqlsE2bdSO/yjhpvw3j8HbRBX/NXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgNYHlS7kkAI3xN4mwUiu6xoNDgbgf7EgLle+LK2twnxma09UN3HYW14SCdWmeCF9i8dnbe39UX8BvpAXnpn4f8zGnAHFLr137Y2ETeiBqCMVDFO+qmbXLOlczUKsly2lc0W9Xs5aXPKDLa0kEzuCpurgB4PJuvAmublt/B0OcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CErg3NHQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBToJqWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CErg3NHQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBToJqWx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYoxX1703393
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3Zk5y/DSVzAwqyVWlk3wiBDRckqt0orU3V64+Tdiko=; b=CErg3NHQ5/A/gFRM
	XuajNl4sOMsDLEvcvDIi7rL9Qd1vv0elLFlcPo0LmQ8RkEMZ79zQWnrZLF/Ccg4L
	53GC9x5kt0KOmWuCAcha8+5wIwDPBdu1CCXUORNoaK3su25gPyxmvL8f2WFkCuFd
	/FiBIE06xo8AyCZejnTFclez9AkxSbAekThQ5KqAlwtyWKdNkzWUg4OCstKwZJYV
	hKuQVkDj86IKHP7UGNMPTDClimSEJ3+kloI9QTrIjxJX+Dvv9ZrNaYomMPSw9IjB
	2xV2+YmrLF+HODBeZu5cluxFJzbvpLZhD65WNigavO+tS0qvNvJvO0Akm18wtRsl
	WISxXw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3sh2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:48:07 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c879132577so438929eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570081; x=1790174881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3Zk5y/DSVzAwqyVWlk3wiBDRckqt0orU3V64+Tdiko=;
        b=EBToJqWxuXBTXKW4MM4Fdh9ltiHXlq14NOBroRIrkjDsjsZf1bDM3iq+rs0gMuqA0F
         JCa1oMxmDUuuvtQYHSrpxeRIVo2DT4+zMbzji/WF+AajskmUZd+5Quhfji5Q5pis0iv2
         dRJ33HqR3pHTg0YovFOlEyj4BMqtB/anspaUmPbcZCo9+mlh6MtkO3tJNFToJGrBjpaQ
         Z1GEPRXmt1OxZY1CtNNTW+D88ZYzeOPQuSsYQk9L5nmh/5tDefAgxvVw2zUtl17yEF7m
         MbU+tGW6tFK7mXTkHqCojyh0ekqEIxTTajGvAIfRCHe6txS7xZ9LYPblI/YaKw8SHTkp
         NfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570081; x=1790174881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3Zk5y/DSVzAwqyVWlk3wiBDRckqt0orU3V64+Tdiko=;
        b=VYvDE2ICBMTR04Py0L3pyBICE2jV2GB5NW/02Et08elDhHB+HXmEAe4KNAkBSFFtRw
         VwYLhpsTx/Z3aacoe3x+Ns48Kkcg9zLSNqAZTyz3c7i2MiTOSXrTfUYQDP+u8JB/sHH5
         QQ+Yb7daKoFUvcWbJFwwEvckBvANkrSONqUmYXWysBRbyC+vvyhoqvh7g6IEQX6p8IoI
         JXVYA6SEZCeV2wUUMgYG/8v4jmw8dUU9rO1w6N4S74VqtLzrTsp9WzZxpM1UATgBalZ7
         1g6oh+6fwlwUJ0/O0MKUJwm6AxCx2ETXIs7m0EIcCKyqEjTO+zfAGnnwdT0HV2Xp0D8p
         RlDg==
X-Forwarded-Encrypted: i=1; AKwUvByHTxDhzeEyPe/0APL5iMdgsikRQTHrq6hT2HB8BafkCm7Rqhq68F5RwnqquckW9vdE5HQKtvAD6YCKjXY=@vger.kernel.org
X-Gm-Message-State: AFuF++k1pj36hSSNEAbRFU9d0K0jl6qaIkC7iKfKbcBMwYo7kaniGTEa
	GSz5S0zYe3R4AAhRBIOwiA0/j3MrFPZ7rdN7MASKLwFQNhKO9xO5YWKLIydCJ7zII7OTLCdaIYs
	iO3cXNE1U4lNDXI2yu/o7TLN0b9J4WBPQoJOdBgxHZgN1qNRbGhWZr/XeXIqUeCsecZ0=
X-Gm-Gg: AYBFou1YxQWmiKp1VTqYQ2z+OZdD6dj3h35waGFhphGvzNfFDcdZyF98A3prBU76ZTp
	1HNR7UPlRlyfr+MxTB3y1ICcXxyTzX4XWvl6rkX3M4PCQb0LSuA6Y8eyoFfxgqzEABnxs4xa0e2
	4bjgAm9YDYmRdlmcv8bdWj7hx7IBdlyUGRTTi+wG1AVdHaKYkbhQ8e/MHlf8yGp99GisZBYE9oe
	7tSqiQXMKgq2KaD7iUrhYztalqAt4ub+TZ0TT47levHD5O93W7FhX1wJe5uoX2Auzt34mZ5qZUR
	4C2ANMgyjfM5lx6BoMCjfEVMukUvNw85sic1cpzFnBw9BNiDO7ZAOZbIm8coqw6btuXMIGcwzpe
	DjQw+rq6S0Sw8zjxXY3w4gGzWDvMWMB0e/Ijlz0Gr
X-Received: by 2002:a05:6820:308f:b0:6b1:afca:5c78 with SMTP id 006d021491bc7-6c7d39f91e0mr2890682eaf.32.1789570081249;
        Wed, 16 Sep 2026 07:48:01 -0700 (PDT)
X-Received: by 2002:a05:6820:308f:b0:6b1:afca:5c78 with SMTP id 006d021491bc7-6c7d39f91e0mr2890645eaf.32.1789570080802;
        Wed, 16 Sep 2026 07:48:00 -0700 (PDT)
Received: from [10.216.41.130] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b030aesm8554016eec.26.2026.09.16.07.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:48:00 -0700 (PDT)
Message-ID: <109d7c44-f58a-4462-bdf9-7c22759b4569@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:17:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
 <381607db-0e7e-4d27-a992-64cd722c23fc@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <381607db-0e7e-4d27-a992-64cd722c23fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5OSBTYWx0ZWRfX2fZ90DXeJik/
 6VsFoAvoKX00pDy4KazEgGURcF0iQEFwLUSFkGhy6XI7f+YH+KP+cVjfyQoDowZttjZZqOBdeHT
 pxvamM2tMalrzYXCsJTiSoc8TmOzcaD/6IZEytbRCmhEyyCxmaeag39smnq4nKtRJbq1F6qGRfl
 Q+ThSx3WNGL74kOQMTpGWQtmWq6FgtiLWaX3YOrythDvr6XAScp1LUXeu+IG54v8fb+rXnvarWc
 BkyCysG0eeS3rG497++zLc9GBrX6p7PQLvUcpw057C0xTEHhXqg66LfwbKlDvmyCjlFHM6ycTjs
 8cfC4FDVDihmR9Y1Mv1bXz3nGwOkdrDtJOTP4CxksM1g4QvQXxp3D/JtJuIsz3lo/r4AErhIezC
 v4PPWjAXSHTcO3VeYe6+o71PS25LTdalEpmN3ZwE/BQ5x0oMu0Bpqta+OpqWSEowUSS0bmHH6IV
 YaZ5F3TCFu52eBK+buA==
X-Proofpoint-GUID: zoLRFofQHOuVlt5aVlfwJevZA_h4l8dt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5OSBTYWx0ZWRfX1PzPzcHs6d/Z
 2zaRfO+HKujZtO6mFW1p3kztJnzkX+yr/Mks+8itbWOoPD4yvR0OhhzWHkM+HPqfkqWyprTvB2q
 OnOiSQW6h5c/Gh3llEb3sdISbOoXzfc=
X-Proofpoint-ORIG-GUID: zoLRFofQHOuVlt5aVlfwJevZA_h4l8dt
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaaac27 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GD_5qw-SCA1CiScccr0A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160199



On 9/14/2026 2:44 PM, Konrad Dybcio wrote:
> On 9/11/26 6:47 PM, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur.dtsi | 114 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 111 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 624a9edd602c..7bbc804ed340 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -812,9 +812,9 @@ gcc: clock-controller@100000 {
>>   				 <0>,				/* QUSB4 1 PHY RX 1 */
>>   				 <0>,				/* QUSB4 2 PHY RX 0 */
>>   				 <0>,				/* QUSB4 2 PHY RX 1 */
>> -				 <0>,				/* UFS PHY RX Symbol 0 */
>> -				 <0>,				/* UFS PHY RX Symbol 1 */
>> -				 <0>,				/* UFS PHY TX Symbol 0 */
>> +				 <&ufs_mem_phy 0>,		/* UFS PHY RX Symbol 0 */
>> +				 <&ufs_mem_phy 1>,		/* UFS PHY RX Symbol 1 */
>> +				 <&ufs_mem_phy 2>,		/* UFS PHY TX Symbol 0 */
> 
> The comment is no useful, please drop it
sure, i will remove it in my next patchset.>
> 
>>   				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>>   				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>>   				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>> @@ -4103,6 +4103,114 @@ rng: rng@10c3000 {
>>   			reg = <0x0 0x010c3000 0x0 0x1000>;
>>   		};
>>   
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,glymur-qmp-ufs-phy";
>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 /* UFS and PCIE4 shares the same clkref on glymur */
> 
> s/shares/share
ok, i will change this in my next patchset.>
>> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
>> +
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		ufs_mem_hc: ufshc@1d84000 {
>> +			compatible = "qcom,glymur-ufshc",
>> +				     "qcom,ufshc",
>> +				     "jedec,ufs-2.0";
>> +			reg = <0x0 0x01d84000 0x0 0x3000>,
>> +			      <0x0 0x01da0000 0x0 0x15000>;
>> +
>> +			reg-names = "std",
> 
> Stray \n above
>
sure, will remove it in my next patchset version.
> [...]
> 
>> +			ufs_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <100000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <100000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-403000000 {
> 
> There's another (201.5 MHz) OPP at SVS
>
acknowledged, i will add it in my next patchset.
> Konrad

