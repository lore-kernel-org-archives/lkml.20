Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369133;
	b=agnHIIPWrZypaDFUEu4GoJTVQycKGqcHPnvQ/Zh17/uEU/SP0OARrkZnx0JwWv7N+eKG
	 KR/6RzxHbFmKrzgmv8xhUrbKwJFq8L1IV9kiEcnLKKP7rqYciLLtgstGBCKoR0qYUQW3r
	 E8lVRIK6OpNutNwZwsyCT7nzfKm/wcCAybIswhw35D5LsT+OAN79BhBnU4/Kkp6RUz/fU
	 g3EmLxpVgmedbRkvy6Qt02CZ+f2NWDO9g7QX4md6eq7kTvp2tBzQIc2aWG+CfFhcwJtaz
	 +qIvlQE+oTtAynoEd3EBAURwqB1Nf6xUgCwm49z0RBUfEizpDMsLsJml+bREmdzbUxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
	b=OJm6HpILK/PIl7USeZoKfbHJuG826AvdCvpUtLvPvoGa/A80SWFwcSm9UpJvn+PcpCh4
	 yMprm39WtO5bz+A5tOJHDORvLEf60y9Q44oW1IIcq4zpP5MMWVyWNPzJH2XE8NU6XcPNm
	 U80uGfVtriqErbWFPqEqLgMK+bGBFpvkL+kMkJE2MK8qlogAWuBo633j56N93fV5ahhxT
	 espfAcS7Y4QVjvLxRk/sX9Gm2KkzlJero4ovJ93hDXjp7m9BFMT5cSsOxLzlMtuDndiaY
	 HwnCK94ELmD1UXf+GiT/HouZ5FMKqJ+xzky2iV2Qo9+SBDyfvVT/9xwAYiNp2cbLgDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/B4aZSU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB71606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB71606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/B4aZSU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnPFI2883774
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=; b=I/B4aZSUbex+VvzH
	UGsrZ/7W+JVAfwK8lQqdrmfv4UkM2BuKAZKFE9Sm/HVI9Hi+D9fmMoJtXnah+iIY
	Up3vBSjW7ogvrz+TMhbMZNVxup2cRbceEQxdkP2GRUCjfrD44Ewx07Q/9HC5YjV1
	0iQfqKLuNrj/ec4SQoiTraQWtUci4WUAyybJqwQDm9p7B+4tXXdKfG7tIJ8qt38k
	Ht5gd5X5tsTeuRaO+vcZpAYUOnecBG2VaFwK9QVyO4nfKIQY68/Os+vGiAOfbeGR
	cy4zyS4CAwiQtVoM9a9kMOWKHqoB1jMGpIdJ4ZOjf0NytbiJJn8XaO53ZochKWiZ
	dQ4zgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkcu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so671396a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369132; x=1793973932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=CxBmYtt+9JA0tzgdpQiWRIKtMLBNeL3HAJkpgs3vC7+W6ggITG6S76iMjbui451+oA
         2cN303WLhFG3hkUfplHFrw8XtE0VFOAEPa0wIJRe7eC2DFt2n+jSbrTZntfyE5Ewg6mi
         tmnuOtqouxtHbuxIJnnn2NFhN4hGRS9v8DZIVPZQr4cGII0aJhfNQDci8Z/KeH8FDUk5
         UigkvEewJf/wyDf19FJVQKiIo+79gdUqePWlGxuc3uBu+1iGfUaB7B1l07eWbl7rShvh
         VyAoxTOvndI4aNvihI6vi62yMCcXTvdSffGGuTS+XG9FPVWGobi5XrvobpryFNN5W/WF
         D1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369132; x=1793973932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=ro7mq0h2d3FJ4QjoZsZZZcFSIUB6N4fe7Vkg9kcLabFjxX+dH9vLpS0mGfo6rFWSIp
         qKd0B9Zt47Q8Ltz/R2LNeFu5DuAQb2QjpA23qX4I+gewRnDAAiUAGDh1UdzX/KFcfrd1
         2uuRc1otLNkhOgikJFXSwczCPti4K09UbDX8g+lSqwX6eSbOS5UhMzioYPODzTcRameB
         YtRZ495ByCxGsgrFJimMqVMSGNUT4X+LGGRiDNNhdPQrGzAsBqdZuwH96SAq5TqlDNa5
         rLCYzQbvCS4BfkuypkIAIPAzBZxiG+MSrVeK0WNoWw4hcir/URA+qXf5tz16HbJ+tA6T
         KyXQ==
X-Forwarded-Encrypted: i=1; AKwUvByiH6f7whNMXdypGTfQp+t/9cp8s/4sWLUsrSO4EjAkTXcUpV+kXJPx+lpJELYkgbOdaYTFcgXJ3F0WPIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD07K2CPyNVY0bAlbLUXPXPuGPONCM3NW6pb/tAVB89/N/UYWf
	72qkG9vDrd5HTkpkOS3Pg7qQcfRDP0RkNifL+UAFTvOtqZhEZaEuFUFXbh7Khdrd5eKOlCEVsbw
	g+oH1be2sUZOb1y6q70NTbeT6oMCTKOo1vY2onhd6E1uJRjxKiNjYXJhUK4FjoW4LC6E=
X-Gm-Gg: AYBFou3Ufap5RDkCPBOD45FU+aqHBfkSqzAZX7blZvCsGbi8BUITky/TIzdi5PWVHc5
	QZLhMSiX1L34za5k/996fHGdt5U5WyPoxIJrPlEQTMhvp6SJ/SRrtl781/NsFCYIGfK0+gpWw/l
	4Jxi9k4ri6z6Z87xaFfZDim/rSp/cAoFe+18FCkSRoO27b9Zyko7szzpVQnnVw5LdJwdshnT41Q
	yqbMKvOOgt0fLl5mx9vO6ekDd2hVMwnQwMffVxTMSSKZlazu6vyo7arCwi3L9SK7c6oSX9+2UAh
	S4Qj9FWTPUZZ3d9YuOWRDWwR8yU6m8lialmDuBUn/PuPjqnl1TWJFF2fhO8OweV5QnnxoXzgHC8
	MUZu1oCRxcBN1ZQ/vPdn1Ms6PLV9v75YfhOYaEFPx6ZNDCly5C5lCP6NPSt+RNYDQqIeXdIJQfB
	55N7C9fgeNPLYa1FEOqcRV+c37cr90Jwhe2wwo
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780115a91.37.1793369131933;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780080a91.37.1793369131298;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096fbfa9sm739707a12.17.2026.10.30.07.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:05:28 -0700 (PDT)
Message-ID: <10c00e3b-bdbc-447b-b8e5-23642faaa4d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:05:18 +0800
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
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
 <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfXx32uu/UcARW8
 N3VPUIRmudLUPS5jWKIZiGE6R3a4bwetowLWO/A0OD3RWc1jq7L3/GiFkkV8YGTBNvJTkXlosfC
 kZGtZRzCpYxoh/fT4n1wNnt/U6FWFquoQJ6HQcEVbhboBeZluZPXlJLzXbjVZX9pO1/MMNWSIvy
 /989WOy5VdeyXRuMtiiRbhZbqCaqZgiVgMvSRoVuP+YH+kDTwq4SYGvUx9XRpDATJUVwZIrMyvt
 W0ydcxqyyaRhFu12uBvCAA/Ih18O83Ttk98LOJFfRka8HkqhZZ1ZIcYuxw/eBYoWm8lcN1YKeRf
 cpEdOyqdThd3b5Aa0H4RwIRrX/oF3GlHVmdJcA4BNQddW/bePpqRypAfCxl9AFzhDMPu9826pVX
 Lrb3R3VgSthwQQCPgExnEd1/vzoe8xQXFT1MypKtMFUNIPq2dFrUnjo83tSAte8WdQgD1AZxONh
 dskNmgz7AziPzv0i1Cg==
X-Proofpoint-GUID: cpWae9cmB7gJfXSpuNLvDOztNQJU2hFC
X-Proofpoint-ORIG-GUID: cpWae9cmB7gJfXSpuNLvDOztNQJU2hFC
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4a42c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tb7J9fPpy6OZh8FWujQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX/8e7O3V056ja
 EicGBLPa4R8VCeqLgjnlBVP1nNN8c6ZNo3yaV7xFrMW1U2IHRRACCNxBFotRVrJHuk7UsiZVdHy
 zfxgvUUnJ5nlZ0sSUUSahjciSU6huo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300056

On 10/30/2026 9:38 PM, Loic Poulain wrote:
> On Fri, Oct 30, 2026 at 1:43 PM Nihal Kumar Gupta
> <nihal.gupta@oss.qualcomm.com> wrote:
>>
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.
>>
>> The Hawi platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

[...]

>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
>> +    #include <dt-bindings/clock/qcom,hawi-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        isp@9253000 {
> 
> Address should match your first reg addr.
> 

Ack, thanks. Missed updating the binding accordingly. Will fix it in the 
next revision.

---
Best Regards,
Hangxiang
