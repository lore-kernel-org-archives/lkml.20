Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017293;
	b=g+rJq7GkvzS7guOtlCOCmldUgyOsO7iUcl28FbVhXah1mqdy72mGGQmpSiiLATEZMwGh
	 Ampu5CrS96j354gV4F1UpeP15A0pGZyXIKOmSFP0zyJn8fd/+W8SJ3jSd0FydQuVwelE9
	 9YJLyS2SOfaNVXMNmfiXdxo16uyQSkqiRTQ6oYVX1asbKyNbotw3lZ4l0FW4lm0HWRIiU
	 PFXyNg+5OAvyGcXsKFy/j4H1Q7R/pUKJdYf7AC6zqe1wUMM+XS69JOXOSwXQvtUIAT78r
	 m16CLbgaFpqImo2nn2CFa6ZK2wn4k5PXX60foIGazRgyY+Ine7hRuIbgKVhN+VTclAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=;
	b=ckdCrzFoTlnd9fVT6zCAUTb79vvUx8kmVbldxwsIUXkkY+XvScz5FSvCxM89cd/4QllN
	 +88nlVqzCQsMz6iLBlAGg/sGOroItYKif0ICJqSUQgWsPmFUKt+Xn9IdCeGNQnen8kQ3q
	 hbJANpqzHakM4bSych2TqYqy4L9urQnjekUzwoS6pNEIUlkFBURpBvTnwYP8kKqRZGC+k
	 whki9eAEwJfHuNNmqc7rZTu4E8X3OsXCHLAZ0UkgEr+HwYuHCEQgzoQ1N+hMzVVImpDLE
	 dGEUaOUgg5PPlGF1s4Zzw6mSbVH7hpYazkqVvYFQwFiSBAEkM3BOuu+8MomLiBpY3vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QWi/nl28";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBTUcjiY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1B5606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWi/nl28;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBTUcjiY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMm72009905
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=; b=QWi/nl281MHBftVZ
	+qM0biBZUyPJlArgcbADVnwBIGnS/sBmfD7VRz9tGOXJtvXbOfAmYWt5xuWCb3sw
	Mlm7EKZfJvnZc7bUrQ9HeTWQgt4yQxhthA0F7jAmoorw/NWrn9YOULuFxIJSC707
	tTzAffr0wHAYa6Oyr59P61fOKheO5vap+7KISwzTQww0ZG07KfVwHse3dOBiRJvQ
	K6tKxukGFQI//N4P+iggs7QkZfowI2Kdet/oHWEkrTklaZeyBxz+RUHpMeJOn5UA
	arY/4gbkV94tQgB8PsIfd1U/E5CWrgVJhdHiNvqyWII1ofh07isNQJmd0bNTXV2e
	AiSl/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xaxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:21:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so739232285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793017291; x=1793622091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=;
        b=RBTUcjiYfWpXpBXUvbGJ9f9yFu0dwd7SFb9nMJSLfTeDrb5Gr/GZTrh2jXRVEO8XIo
         FrE8/YnFcGO5+3Ck3Xw2d8HEM7DFLeIkJw9iy83lwOTef6V/kb9mpeuS2JsqBCSZNlvI
         whQACbZu7FBaWvYaRmMixQR2zg1mS/YvYaoAKysS1MxhXLwXQ5sDvH6GdlexrYgFPMFY
         Sr7shhlvVbBCP1Nmp8fMihwFmHJN/QDcRawPmIhSHqiF/DNZKQK6fne3A3SX8Wr0bhfv
         OvnqsqnLL4gXv1wE4/cC5Sr2z7w+9NutXNazhOP0muU/5bGbKz6yxX5TItfoDI1T07bb
         BaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017291; x=1793622091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okzDhOTrwCXTYAXnL64QNfIG2ShWfufp1R4BHN3mW+U=;
        b=OKRdY7mSzywZTT+Lrx8wruFi1L4SNXr0Fw8ahMep8i39ZsLieOJRfNaWR8HFnPaajX
         bvyUpdUxYQPu/Cj/+9FFV2spsUdCKquP1zkR6ddkgKjAzke+XJPAzfysEfLBp1PCCXZW
         zlSSXEkExngnxhywmTm980q63aGUE7NGO9jWd7rQJfmgdA37FPHX8va+D7AEIb3QdgwI
         9DpU7OEwph0Hy1Max8OltXRTSP55BJqsOy7/Jnx9oTrB+Q1MfvKczemNrBkbHQfke4Zg
         ZtH3ZfofMrsW8KUBTt1XjftMqPlhADbFboMkoxupScfMQHSQwXrK6TCqyFbrRkPXd5w/
         WLSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEssGXhL7VJX27765K7iOjzm4jNVlyJEnjr6Iq6iNqdQ+78Zk7M+bUnkK7Gby9x6+z3UscLJJOQTyGMuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK44xA0UyshDHeW+zfJuxphk+EWuAIyqwC9jawj/Z59TLuKU1a1
	H/bmvrCpUpQfG1c1ejY7cCe1tHn/68P36HYGPPHVTsNgAoDZVDZJJ/ObpVFTBr4Zo6n2TmmWOrR
	lKQysgvzga+CDHVRDC6r64QREQa5bb2BBKN3w/8JdofH6SjP6Hp9IQhY83NQPx/5+7hA=
X-Gm-Gg: AYBFou0grn0idlyKafJvptn7Z60Cdi+tvlRJno1tG7yJd0UPzcUX6GfmOtPU+QH94t6
	6a06DM7fbcUgbDMrXNWQNAWgmlhVrKAWpPkhlzK7xnanHqc8sKtg0/CPJecY4PryK5Md6joeR6d
	0s3GGxjLIN/lcxQAE/NPiRD2uSSSczzmREfAVqa/5vG3xiEj5xX3KdRgJt18kNM790WWjJQItRI
	ICQcHmzKxWQNiOaqbhWXbDUJXSSZEFEjpU6tLsnvGK0EjuH/teJ+pgzqdQOP0T5u2Tewzbe9Y2i
	AkXBFm/s9OsTVR3twqhNAM03wkcRGNUZBruT1jtiADAaqtcgImkgaFTuXcWJXMwEKwAe0t6ClnQ
	mjGCzI/y93Y1TgU+Ib4LjmYKrws4m
X-Received: by 2002:a05:620a:470d:b0:93e:c12c:fbba with SMTP id af79cd13be357-940ef94d193mr979021185a.71.1793017290538;
        Mon, 26 Oct 2026 05:21:30 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:93e:c12c:fbba with SMTP id af79cd13be357-940ef94d193mr979017285a.71.1793017289813;
        Mon, 26 Oct 2026 05:21:29 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64cd1dsm306573566b.45.2026.10.26.05.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:21:28 -0700 (PDT)
Message-ID: <c38dd906-1436-4aef-9caf-8c2901a7d09e@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:51:19 +0530
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
Subject: Re: [PATCH v5 05/11] phy: qualcomm: qmp-combo: Add hardware-specific
 dp_aux_cfg2 and dp_phy_cfg1 fields
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
 <e3a8d06e-5f7f-4743-a332-b2a8ef30e781@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <e3a8d06e-5f7f-4743-a332-b2a8ef30e781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf45cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=z9__apPl9ExnX2lTgnYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kFolPr6HISZiC8PvPhvgZ6i_W3J-xQES
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OSBTYWx0ZWRfX7hT4A6kg7uKq
 aGbppnpXSVm4S71LnULcx6F4qHpb1eBzTDOA0RbOV2xwcfEPUEMHygVCbw6H4P1ZSlQSJbsMHRp
 8gkcTRflz6EhCm6LRLJ5uX6ySbOKkPs=
X-Proofpoint-GUID: kFolPr6HISZiC8PvPhvgZ6i_W3J-xQES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OSBTYWx0ZWRfXztSkz9nGLUoJ
 IldYVMVDk2b61ZdhQ/0ecnRTjU/c8ITKLl8NVLj7pZapbNjGJr2XLqeLT/xBMhSI9RtlaQT/qV0
 3oC7AyJyaPj2SBHgGsxw6pfRCNH60WIujTgWacDEuxni4+cl8C3JWxfiKZMgXM/yTutwlzcZdvW
 bwHJ6eCgBDXd6KmFI2rkBp+h1Pc02cuG83e8vZe3B3ANh+u84HGpWIGxHTad/TbJuranbYYHwLK
 GGyuxDqWZoXlTrUzsmlYsB5VjNGNiapLFO6Vo8WsTLlKEjbin7vq3SgWRqHpF5in5wkqDpi9haW
 B4ZA1kwZ5aLGXU11raus7Dmt5UPVrOpC6EAsWEXeD4/4zOpY61w1CkUivYoM7DAEy/NpGxoEQ6r
 nhfW2Jlx4BcOwN7ATWxvSmcEzvRt8OumCqUGlWyp63RLZl1VERUTpC8oQniLoSevxo1SJzzjZyx
 TMEZQLbh4/q1OIozUIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260049


On 10/22/2026 4:04 PM, Konrad Dybcio wrote:
> On 10/1/26 11:34 AM, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
>> hardware-specific DP PHY register values to be specified per-platform
>> rather than hardcoded in the configure functions.
>>
>> Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
>> QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.
>>
>> Populate the new fields in all existing DP PHY cfg structures:
>> - V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
>>    sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
>> - Glymur (V8) uses V8 constants
>>
>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 37 ++++++++++++++++++++++++++++++-
>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 646e97a52886..ebe2e6136f7a 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -2486,6 +2486,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
>>   
>>   struct qmp_combo;
>>   
>> +/* DP PHY AUX_CFG2 register values for different hardware versions */
>> +#define QSERDES_DP_PHY_AUX_CFG2_V456		0xa4
>> +#define QSERDES_DP_PHY_AUX_CFG2_V8		0x06
> The doc says this should be 0x16 for flipped typec

Thank you for the review, Konrad.

After checking the hardware documentation more carefully, AUX_CFG2 
depend upon the swap_sel, which does not indicate the Type-C 
orientation. Its value depends on the SoC hardware configuration — 
specifically how the AUX lines are physically wired on the board.

So tying AUX_CFG2 to TYPEC_ORIENTATION_REVERSE would be incorrect.

I also tested the approach you suggested, where different AUX_CFG2 
values are programmed based on the cable orientation. However, with that 
change, link training fails consistently.


Thanks,

Nabige

>
>> +/* DP PHY CFG_1 register values for different hardware versions */
>> +#define QSERDES_DP_PHY_CFG1_V456		0x0f
>> +#define QSERDES_DP_PHY_CFG1_V8			0x2f
> And this should reportedly be 0x13/0x53 for normal/flipped
>
> Konrad
