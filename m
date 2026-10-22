Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637155;
	b=QealBf2YpQZdYjQ7y9p498Ihpr6riFwoC7Kf9d4Ig1YEnhMwW6V3948C1AZmemngyAVZ
	 US270gPpmpgF3dYuodbvNzT9Xj7sLb1wP1LhXelbdbYIIyI4dLgzNWTqiTEe04GZDwi8u
	 ZZT/5xJW0IGyAIh1hTbJp663G+dYCRfKkEX8+ZR6uTJjpTja4eMBzB5ETeCc7VJT5ixmB
	 boaXdBYUfNWCyJlaTILwyhg0kK1Ms4KKLqfQeUOw14mRLH5jrLgW6ReLGESTpvwoMuYPy
	 Pc5Pe9/MT9ccYCR7bTtCaK7MTiNwdJDolVs3+ceeHEGARgl1+K0C7MLOrucTfyd+1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VT2q5PxrXQMvAOxWgRFp/t4Oj4pTE0hgdrfmC+nu3PA=;
	b=AWpIvBnuEzX+yK2rg8JG60yUtiixNdYviqrR67niaBh2DVZJkzRWLbiQEJhEr8ksSpl1
	 4U5dmnYMajKwN3aN6zBwHx87AinJtmBma/TXXCLzDorpK9DxSJtxRIKWItWjrQqLvlJgu
	 gqvCA/8m2mCZABt37LtX9SiYE4ogyAk0I5sMPci9wpQY/FWkQvKFHJJhI4kAIGjdsve8f
	 dIdUM8GfhPJaSi98COOyqy0kaEeCKszPgweuKrAYKI3pJAnUvgsYtedtyU7d4UM5SP0uX
	 ioCQw/aFS+XXjuGxycZ+21c7M8b1SIWsx73PczXTlSO/VhvFEsukHwIeUYWE7AmlUDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJohVKtF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSXzFHaz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E62606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E62606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJohVKtF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSXzFHaz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1jPbl2336479
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VT2q5PxrXQMvAOxWgRFp/t4Oj4pTE0hgdrfmC+nu3PA=; b=XJohVKtFLbEQJtqr
	i0BZJt8tw1JXFt+FCRfjwxZO/uUfh0EhxsD6/AByuMi+AzUAaACTB2zwc5mAkF0Z
	+tEJwWOyZ1JVMCleU5XFWrphSkLVH565hB/6StVw9uaBpwqmwdHmQCbLXcEGWAo8
	op9KCtMiVnT1H44ssTknAK/aZd8bOHeX8RaGNEEOdY5nGhgOz3p2TaJsNYqd+SD9
	ZqQZY0gWeVIoebb3WDNojxI3yebznjlnbFLNxzIr4MCPOiWpCSzk0KVEWMqA4Smo
	20kbUB4u75QoqS5HVJXUTs4dT4qycsoF7WQgB8VaJzTaWEUEIXjFQIdHxgLzvF2h
	ETUYSA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ar9cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:45:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso1747406b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792637153; x=1793241953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VT2q5PxrXQMvAOxWgRFp/t4Oj4pTE0hgdrfmC+nu3PA=;
        b=dSXzFHazZNFoelGl66ilg3ApG3j4VN/7ifH3/qEkmj4i1aAh6Z0ctGOhGetxC0G4u7
         dGSl9zMTTHUTiDndGgu+G+sVGTpSezdoDsr0Ampf8Uschyl5AcxZ/hPhZUdBa6l9vQE0
         COpRLotntUODfWBdrtsyjw3KFMRWLllG5E62c27urdR/gJaetLI7TGZDLYDNDFfDYc6e
         WfwSIfBaATIzU4IG9vOA7kZvD53WNwl5Y4WrUFujMWEF3nsaILak0zxv2Mgx/AVDMY1o
         O9LWPEFyLptDsJuJLcQNdcGmf8vXb48qrj0IHffMKpSYyov76ui5GsRIRutkXXSvkav2
         Kihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637153; x=1793241953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VT2q5PxrXQMvAOxWgRFp/t4Oj4pTE0hgdrfmC+nu3PA=;
        b=yh82oZSkRrTCfEv6ygwtbzuPvWuicRAgnakwuXYhGND78Ik282//Vjz2ZEfrc2hr+2
         eV53/NhqVpP7RR8myvU/kQ391/2zwKVvM+QlBgBzZ31Ep7WH0uv18WSx4coI2PJ82WDS
         K2TTwviB4sadZB/FEag6MxBA7iTgXun4kHyRl8N1L4YUi71LLTCp3kgH049YJ6mI1Roi
         kE1/hzXWZbJ/VmBfGPSl8nz9eWwz8Z+1rQnGzSUzRDdWziNI5eUC5kjg17kGsTm3wTuL
         2CL/6o1NQmtv785DqJmUrS1KGEBEaFfMzs+5nk2s/Z5agOJJsZ0UsAA6vzCtbf9BHGqI
         zvlA==
X-Forwarded-Encrypted: i=1; AKwUvBwGM2pDvLdK7QBjoJHzGi7uN4TuDZGE7STMD+Fwg27EFC/fnVYPaLlbO/HlEKf3XEEMTUVJbVi/Fz3gn5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP+uUnV1vnCSY+lqTV1jiTekwJa1sqnz/tCR86YGYGn5AzqlF3
	S8runfnE8ZvnBqIe9qvDptx0auk9e/1Xnn3QIpSEv/lxBuPV83VONEdgTIoYWYTO3MxjYXOtg/A
	kqAz9TW/evol8mAEmsxP2GMWbJie2jPPNKO0BxIjB7HFCCnH4J7HK2C4QGnA7jrUSUPg=
X-Gm-Gg: AYBFou2suNNOFPyzeFEvwhzftFQU5lnAIqvvi90pkXXg+6UyBN/KYosiEZR59Buxin4
	WFXhgiFIwXZ+cHEGT3obwIwVc5HAKGzIBKNmCIVKEBDNWhjL7d9vL68ZNAEp13RKAM5Aw3116pB
	8Eb2b6L4q1HVjWPjdQySfK5vK1lEpTJdrjlLDJ+360ryJj3H1dj6mbvsfpR9zHdZOmshiQ6lN3d
	UsTeIy2HThyYvCgR/kU2xAGKCxNfxNnK3ZYp082aaQSvJ9F5Itqi7Y2V4JaDvPeNvCWTPBnI9bt
	7GIbJaEyBY/cQg0x7m2h5iudjzPHmd2pmZ0T1AfTj2yFDto5R0QrjD1vBv+ndInhXQLLrEyO1B7
	yIkRtDaDtDIKz19EO72pnVvPetOmBcSNw9LjkpsHLi/wXPXGmUwbnooOMj4Og
X-Received: by 2002:a05:6a00:e0b:b0:8a0:7ba9:93a8 with SMTP id d2e1a72fcca58-8a089de7130mr3052463b3a.23.1792637152398;
        Wed, 21 Oct 2026 19:45:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:e0b:b0:8a0:7ba9:93a8 with SMTP id d2e1a72fcca58-8a089de7130mr3052440b3a.23.1792637151841;
        Wed, 21 Oct 2026 19:45:51 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fa967sm1474761b3a.47.2026.10.21.19.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:45:51 -0700 (PDT)
Message-ID: <908cfb78-b343-4abe-a3bf-81b5e5d08c1d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:45:44 +0800
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
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue
 <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
 <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
 <dbde0e35-8246-4f69-b3be-cd617a1767d9@linaro.org>
 <c1a0dfe9-34bb-4d24-9644-0f758aff0af0@oss.qualcomm.com>
 <CAFEp6-16PUJzLKZUBrC2g7oh8pN_Tygrf6wYX53nL+YM4ZvunQ@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-16PUJzLKZUBrC2g7oh8pN_Tygrf6wYX53nL+YM4ZvunQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfXxHAZI0xT2MP4
 ZxEaRPpkizDv2DCtZJO+8GNvcTkFYdiBcn6bH1NB2HlaPR9on6mjZ+VovaMEybTyriHuSKYqVTB
 ecQKD+MovEZ7dewjRLZZr3Db6EF6J20HZasOr45LqJT8o4DkXZq95BEWpKMCs8A80Eb2JtYcRjP
 a9vAroKS1Tuw8pY4j/f6O6yNZX34PmEaUK6nN9Vqhny+x/qpfzLRv7Hw9cnm7eEuUet0zb8JT2B
 xkbGu2YbrqPUUjTm0x7N2WNDpY1Pl2czr3eZbxwzq52jA2weLHSReC1Xiggj/UQ8xbkphVb7jE0
 L2COEBrhRIwE0sLyAx6wDZZ78m6vkxK/aD9NSvmiMHHDBR93BFhNZFyy4GkC4kRw5uf6SIpl5hv
 hgIH7tE6m4SdkLt1bSgyeHG6SVwdUuvli0+/sOZga0em2RSL9LmPmihayFh7V0EE8WCNwHg71AW
 alufNcI6gJ/ulnr1niQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX9MFlKBFUDHDL
 /9EOQfCrdPc/mVHjk8LSRZVAmJ/5crCA3rlzcQYXsZX2WAcqpG4u3qvPLSV7g7JhDG/tZeos4Kx
 7SrD3gcSa168Qbi1Rz0MCU8evD2owfA=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad978e1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ev2TUFqRJCULxgkWBQ0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: vK-WDivkqd-wukMj5hLmdrald73anvQA
X-Proofpoint-ORIG-GUID: vK-WDivkqd-wukMj5hLmdrald73anvQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220010

On 10/21/2026 9:00 PM, Loic Poulain wrote:
> On Wed, Oct 21, 2026 at 1:24 PM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> On 10/21/2026 4:53 PM, Bryan O'Donoghue wrote:
>>> On 21/10/2026 08:37, Wenmeng Liu wrote:
>>>>
>>>> Hi Bryan, Hangxiang,
>>>>
>>>> On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
>>>>> On stream-on, CAMSS starts the subdevices upstream from the video node
>>>>> through their sink pads, so the VFE is started before the CSID.
>>>>>
>>>>> Starting with CSID 680, the REG_UPDATE is issued through the CSID
>>>>> rather than the VFE. However, vfe_enable_output_v2() still issues a
>>>>> REG_UPDATE after queueing each initial buffer, before the CSID has
>>>>> configured the stream. The VFE then never signals BUF_DONE. Therefore,
>>>>> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
>>>>> and CSID Gen3 instead. The operation happens after the RX configuration
>>>>> and before the RDI path is enabled.
>>>>>
>>>>> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
>>>>> the VFE sink pad implements the reg_update callback. Platforms whose
>>>>> CSID does not provide this callback, as well as lines fed by ISPIF,
>>>>> keep the existing VFE-side REG_UPDATE.
>>>>>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>>>>>    .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>>>>>    drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++
>>>>> + +++++++++-
>>>>>    3 files changed, 42 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/
>>>>> drivers/media/platform/qcom/camss/camss-csid-680.c
>>>>> index 345a67c8fb94..556cdfef6207 100644
>>>>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>>>>> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct
>>>>> csid_device *csid, u8 enable, u8
>>>>>        writel(val, csid->base + CSID_RDI_CFG0(port));
>>>>>    }
>>>>> +static void csid_subdev_reg_update(struct csid_device *csid, int
>>>>> port_id, bool is_clear);
>>>>> +
>>>>>    static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>>>    {
>>>>>        int i;
>>>>> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct
>>>>> csid_device *csid, u8 enable)
>>>>>            if (csid->phy.en_vc & BIT(i)) {
>>>>>                __csid_configure_rdi_stream(csid, enable, i, 0);
>>>>>                __csid_configure_rx(csid, &csid->phy, 0);
>>>>> +            csid_subdev_reg_update(csid, i, false);
>>>>>                __csid_ctrl_rdi(csid, enable, i);
>>>>>            }
>>>>>        }
>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/
>>>>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>>>> index 0fdbf75fb27d..830c9c818d3d 100644
>>>>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>>>> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct
>>>>> csid_device *csid, u8 enable, u8
>>>>>        writel(val, csid->base + CSID_RDI_CFG0(port));
>>>>>    }
>>>>> +static void csid_subdev_reg_update(struct csid_device *csid, int
>>>>> port_id, bool is_clear);
>>>>> +
>>>>>    static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>>>    {
>>>>>        u8 i;
>>>>> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct
>>>>> csid_device *csid, u8 enable)
>>>>>            if (csid->phy.en_vc & BIT(i)) {
>>>>>                __csid_configure_rdi_stream(csid, enable, i, 0);
>>>>>                __csid_configure_rx(csid, &csid->phy, 0);
>>>>> +            csid_subdev_reg_update(csid, i, false);
>>>>>                __csid_ctrl_rdi(csid, enable, i);
>>>>>            }
>>>>>    }
>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/
>>>>> media/platform/qcom/camss/camss-vfe.c
>>>>> index 2680a9914765..16a0b5663fe2 100644
>>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>>> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>>>>>        spin_unlock_irqrestore(&vfe->output_lock, flags);
>>>>>    }
>>>>> +/*
>>>>> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding
>>>>> this line
>>>>> + * issues its own streamon RUP (i.e. its configure_stream does the
>>>>> RUP).
>>>>> + *
>>>>> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs,
>>>>> so the
>>>>> + * upstream entity of the sink pad is either a CSID (possibly with
>>>>> RUP) or an
>>>>> + * ISPIF (no RUP). Only enabled links are considered.
>>>>> + */
>>>>> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
>>>>> +{
>>>>> +    struct vfe_device *vfe = to_vfe(line);
>>>>> +    struct camss *camss = vfe->camss;
>>>>> +    struct media_pad *remote;
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
>>>>> +    if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>>>>> +        return false;
>>>>> +
>>>>> +    for (i = 0; i < camss->res->csid_num; i++) {
>>>>> +        struct csid_device *csid = &camss->csid[i];
>>>>> +
>>>>> +        if (&csid->subdev.entity != remote->entity)
>>>>> +            continue;
>>>>> +
>>>>> +        return !!csid->res->hw_ops->reg_update;
>>>>> +    }
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>>    int vfe_enable_output_v2(struct vfe_line *line)
>>>>>    {
>>>>>        struct vfe_device *vfe = to_vfe(line);
>>>>> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>>>>        unsigned long flags;
>>>>>        unsigned int frame_skip = 0;
>>>>>        unsigned int i;
>>>>> +    bool rup_in_csid;
>>>>>        sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
>>>>>        if (sensor_pad) {
>>>>> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>>>>                frame_skip = VFE_FRAME_DROP_VAL - 1;
>>>>>        }
>>>>> +    rup_in_csid = vfe_upstream_csid_has_reg_update(line);
>>>>> +
>>>>>        spin_lock_irqsave(&vfe->output_lock, flags);
>>>>>        ops->reg_update_clear(vfe, line->id);
>>>>> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>>>>            output->gen2.active_num++;
>>>>>            ops->vfe_wm_update(vfe, output->wm_idx[0],
>>>>>                       output->buf[i]->addr[0], line);
>>>>> -        ops->reg_update(vfe, line->id);
>>>>> +        if (!rup_in_csid)
>>>>> +            ops->reg_update(vfe, line->id);
>>>>>        }
>>>>>        spin_unlock_irqrestore(&vfe->output_lock, flags);
>>>>>
>>>>
>>>> According to the hardware documentation:
>>>> Starting with CSID 680, CAMIF has moved into the CSID. As a result,
>>>> RUP is now issued by the CSID and propagated to the IFE.
>>>>
>>>> Starting with CSID 980, software must also set the SET bit in
>>>> RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware
>>>> ignores the command and the corresponding register update does not
>>>> take effect.
>>>>
>>>>
>>>> Bryan, according to the HW documentation, the change itself is
>>>> consistent with the required programming sequence. The main question
>>>> is whether this is the right implementation from the driver
>>>> perspective, or if there is a cleaner way to handle it.
>>>>
>>>> I have tested the change on the Hamoa EVK board.
>>>> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK
>>>>
>>>>
>>>> Thanks,
>>>> Wenmeng
>>>
>>> OK thank you for the explanation.
>>>
>>> OTOH I agree with Loic's statement - it is cleaner to subtract the
>>> callback and disjunct on its presence than to add a flag to the same
>>> effect in reverse.
>>>
>>> ---
>>> bod
>>
>> Hi Loic, Bryan, thanks for the review. I wonder if it would be better to
>> keep the check on the CSID side?
>>
>> vfe->reg_update() is also used outside stream-on, such as bufdone, queue
>> buffer. It must be implemented in VFE. We only want to change the VFE
>> behavior at stream-on stage, in function vfe_enable_output_v2(). So
>> making vfe->reg_update() optional could affect runtime updates.
> 
> But the patch says:
> 'The REG_UPDATE is issued through the CSID rather than the VFE'
> 
> So you mean it's not always driven by CSID?
> 
> Also, today we perform a reg_update after queuing a buffer (i.e. after
> programming ADDR). However, as far as I know, this is no longer
> necessary in recent VFE/TFE/IFE generations. In those implementations,
> the ADDR register is not double-buffered and is not part of the
> reg-update set. Instead, it behaves as a FIFO entry, so issuing a
> reg_update only results in a useless RUP_DONE interrupt.
> 
>>
>> Maybe the cheapest way is still to check the CSID side reg_update
>> implementation at stream-on stage? I'm very glad to hear your
>> suggestions. Thanks a lot.
>>
>> ---
>> Best Regards,
>> Hangxiang

Yes. Before the 680 platform, VFE issued the REG_UPDATE itself. Starting 
with 680, however, the REG_UPDATE signal is controlled by CSID rather 
than VFE. The CSID stream-on RUP is issued from the CSID start path 
after VFE has been started.

Wenmeng previously described the hardware evolution and the documented 
initialization sequence in this thread. I hope this helps clarify the 
background.

https://lore.kernel.org/all/3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com/

Going back to the split AUP/RUP design, this was introduced in the 
Pakala (980) generation. The split AUP/RUP design allows us to select 
ADDR or REG updates independently. However, since the 680 generation, 
REG_UPDATE has been moved to the CSID side, which does not have the same 
split capability.

I agree that combining AUP and RUP would generate an unnecessary 
RUP_DONE interrupt. However, please take a look at the implementation of 
csid_subdev_reg_updatem() in camss-csid-1080.c. In this series, we have 
already followed the approach you suggested above: during runtime, we 
configure and trigger only AUP, without RUP. Therefore, no unnecessary 
RUP_DONE interrupt will be generated.

I'm very open to further discussion and sincerely appreciate your 
feedback. If there is anything I have misunderstood, or if you have a 
better approach in mind, please feel free to point it out. I'd be more 
than happy to clarify any questions and learn from your suggestions.

---
Best Regards,
Hangxiang
