Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610697;
	b=AWlh/FxH04naHaVUX8G2SNMfpUdhcAIjHquSK5ZIt1yylO1/3zUk92jwmb43iD7StVUn
	 neY2xwZpAkAGuhzdl0VtRAqK6vOC4snYVusgsm1++qh8phbMsQmyGWFYP1y5N6TfV+jaX
	 E0SYLSVaet6z7YxBarC+OUxXuAut5HNqLonexuWQuRGZr+gwdrgTm2Iv4tuE4ER9ZjHmx
	 ChlK2F/ISFYzME1t1S2AzG9IaUhyC2wIrx2qxct5M2WhvsOKoBIkKO31iXkeBNmdKJBG2
	 INqBz4zwwwzxgn4xfezfWMRWC/D1ohQ8QVdjLoAPTIZHP7myVz5uzLYLdBhEkudqNww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
	b=R2j7aN9/FbzWJrAUM2E9BPbSfmSXG8P87N5AX/GViMkbxQr3HnDFE60hO7RNv8+gP92Z
	 8I90JgG5zvtKXx54gmPsrVbCL02/NIFEPbOKkzAjh8fdi7ltuaM5D6TLs4ud/Opx4Wsr0
	 4ZQrR/bXLObnmbR8jzHxKciW9+zK5Gem8HYNT5RGbSRQkGE367oPSqiV5CxWR9uvDAJQZ
	 h1azepnM0U18C4WCBcA996lkue7h3jIpuhwu46wQUn8t26/cEkgGi9MWbljmA4ZEL640y
	 MV70LyJG/OgzbEq9cUatJl2mKRQrmydj9avmXfiDkN41Q1St0zljsCI+wlHWQH3TG5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E34A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMsS1821122
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=; b=QUWnkuiC9xEXxw81
	CXmHwdRTUEXk21Gqf98cesdGE6yjk4JrLYRuxMyFjTc5gk31J8r3SlDW2sBz/AFj
	D76XGf2mYKajqd+mGUNqClPL+dtiJUjbxAdmmjfPCXA9KynPCiAKnec34fkEUE+e
	d/oVF5KK0EmBTkvjjVM9IpMH30UGG0f5WnEUm0G2frqNR0KNonYJ57HJG+zgCBRM
	mkTONZwP3yQlpJd9MAwABHLQKiytzPAHOppuhgQ3c6mt09HBj7SfKMXz+2x6OWsY
	+68ms6CnFWMULK2uWfcSDglIZE8DDxwGMiDYFzNhUpTJORhPDvi/F5cOGsv+YA78
	EDDaMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gw7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:11:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea381ce04fso35122715ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610695; x=1794215495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=c7UBzL2xTWZ+Gks77LrZxV6ufkxco71Ebg1q7EhcC9qDgdh4UWYblZMMzDOHUACyms
         xI91GRvWwnrD+2L2EsMnbN7atwKtSQnf9T0j+PAd+S9ORwFM7E27BcJ73ahtutbUaxIB
         0/qGEMB876F0OHfCH/HXija+kywki4SvPo54txiEqBynWMX0aNiQGCTDJ3QFqIWzsEqg
         VxYrcrl9UY21rRyT7A28j+1pF3wiaEowK5xR+0WXmEgvzeqm4tuLwct+E9e2xrBuuHFq
         dW6SiAgcEpGQj0GHlDAJysGOBm8wUVBJU/Ii/E2Ca4cDEBgQ9fqzZcgJTP5Dg2p370CV
         Cd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610695; x=1794215495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=OBlBdxXFXDWInhyHv3kiC2Q7LJfMSGU+s4mYBKPiCGTwfbGINNifm6Xp31tUB+MpeM
         a8qctcT1HLngL3wiHDXC1RkJmXDzTL4hOatzUv4D5CIT1d3QzCCcDR3wJf/h2z4JfZ3y
         hqXwHwrubniJHc0M01VfWaCWQ9Fn4K7fkB/4Hw/8ARnt+juyJaA0vYa+KdjA1PhhCKP7
         gxefV9AoLONGpHgafyFXYk0uTk5b0dC42KPdyKprKd9itCepfSvw6hRf532DGxjBrF17
         V/GskLeJiFBmS3ZUEGy7dZ3FPLfXUJujyKcMND4LNmmg4TfB/KIf+JLOzPYhZ3mYH5EF
         tJhg==
X-Forwarded-Encrypted: i=1; AKwUvByi6tl9madqzzcyKzurpZWKr52VXQfXHN5Ksol3fqzdkuuflPcDvsFR3d04spjKgKxoG2dDJZRr3qfwnPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bmhVW67cjwluuum0mCrJklmcIRQ6FOZEnjq/5eemMKLbxpDQt
	YmrbP/fdiyBK7Vw9GKitZ+8/pm/orw0JunesI0hM7vWhJmlGf+CDtsd4vanvzZo+hDtjq/+O3sq
	Q7yDru4AVUPBZakADLdWoWv+uQXv2XGO2A9HyvyJo4t2YA2qhiPgnT0hCDhVXK3LsTh8=
X-Gm-Gg: AYBFou3Mu0nEvPHHFNfn93jlfej0NmbIDP1y0UW1TkrL7MLUCrGdkQ7j9OubPiVSd7R
	9moivkmjpZnhtXh08+CHrHDKdY/KkhuIyiVcZltFlaqpeB+bvUuAnVSbPRSuxrDr9m9pXWpkPem
	6YK1pdXp8MdN5VvlWWkZOhTesyPMOf+bARaFauyoQTy8aTlgR4VjHDJTb5opgcCsMkM/ZWem6cg
	nHp3DD1xbWRPEh3hXwkOtMCvzRtBY8FMLNJlRJQlOm1gLuHBXuYcsb/CTnSdH5DS2J3qac1cwD6
	n4+fsxjQePd4pLDK6b/UxT7LEyZn7lXNNJ1JoF+NBu8qZ2NRJoWbfVbidk3r214uITJsOYrrE2i
	pe034csuYbVubulLEz8K0Cz6dsxumj/b51g8YTfFXDYQM7e9hiP8tO9ih5roeunCAh8qvIHUI+d
	Yw5p4vhqZF8fVi53Pjv9hPx9ligyocoTtM
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629255ad.9.1793610694883;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629165ad.9.1793610694447;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248909sm25062335ad.33.2026.11.02.01.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Message-ID: <757f0875-8940-496d-a35b-5f482887739a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:11:27 +0800
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
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
 <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oNjlkhIS8XMdkAzNhsaLK-QpxYSEv_cm
X-Proofpoint-GUID: oNjlkhIS8XMdkAzNhsaLK-QpxYSEv_cm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXwV5uOJg+/diS
 OZQtz/cprxVRanH9UyirGKPYSgOb4PuT/7keWuu2+JORFgLN8bru2Z8neOBGCYJduMwCvlN+O9K
 tug74+9MRb8MK6h2VP42Rp5uu2MLTes=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae853c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dRQ5KtDc-XJZQSWJ7xIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX79ykVTxvEh8z
 TKLPfjJv8lK1+mdhUsYdRnq0dEqtKNrj8rDzYv5a15VWYbsC6ZFK3N0SC2tc9Me4qAKfU4AT2Zm
 1ct3zEGOxDh/LRK4ON4CLJE8A/rRZxwgYjlgFXp1f9T2SyM0VuSWnTjDieKa0QMudi/5EWD8hUO
 oaLGYOCNBqesXQhaa3Z+4YFiCkxq8rW1qwg99u1/sZNrhRDq3STrfc9lKTHx6Um1JO3vBFKZzgh
 1DKdQHMG5OFUy91+yUMzA1I1LC08ztwMbNpQgGqfSdaH9n3sZJayk3sbifQz/LKouDEAEZywpuG
 dUMvRbaGFVZ0uYDu4/CRO9VxFc+2K3chxBhLB4LKhcDycI9eMzt88i9mUi5VAC0cA70Xb/f52d/
 WEEMpNRNecmPDKmh+0wjXWeAOWuyi+owxvKs3mL3EohUsKK1Bp+V6DFTQsNDiyFVb5WQk8AAKhV
 fvjpafxHR4B88TJzWCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 7:42 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
>> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Wrong, it is NOT compatible.
> 
> Due to the functional difference in the register offset, which is
> described in the patch 0002, it is NOT possible to fallback to
> "qcom,x1e80100-csi2-phy" compatible device driver, and there shall
> be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".
> 
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 
>> 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml
>> index 1f1e2a4993b2..6e9eb8e265df 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -17,7 +17,9 @@ description:
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - const: qcom,x1e80100-csi2-phy
>> +      - enum:
>> +          - qcom,kaanapali-csi2-phy
>> +          - qcom,x1e80100-csi2-phy
>>         - items:
>>             - const: qcom,glymur-csi2-phy
>>             - const: qcom,x1e80100-csi2-phy
>>
> 

Agree. Thanks. This line of description is stale. The commit description 
doesn't reflect the content precisely. Actually, KNP uses its own 
configuration. We notice that register offset difference so that the 
adapter macro is introduced to handle that.

<https://lore.kernel.org/all/20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
