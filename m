Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673761;
	b=dX+ojBst7feGc3Vae+i35CMZCMRbp4KwgnRHmoHF+JblrjbCdzl0mu+6D3T2BBKbaVp+
	 qh0xaHcxl0TTgc47riwQ6H6UJv4rtR4gB7PUiVj30Ia3tKIyJdWKZ5rl8vHQ6WxYhfdfI
	 92HMLngmBHbQvoeJo5ewxIn/NMOme9uBT7mtZilt6JmxOYU+O92u29Q5sK4/PVctPD1po
	 RfgaFaqvtIuOQ1ql4wmXJhT0ro2J8+uD03bNGdXyBfh/FeKZkutyheecX7OXRvoXlBs2S
	 MBupiHNWgllml2hym1dDXvLeReFytQBAK+MAwkmAW86tLgHsyhOF9QSHwgzgsfQ92AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=;
	b=wdGkSP2Rgfufrfn/6GyVil2xUUtUMv+YTFfx8Ai6MtmLI39AzQJVR97VezJdXpLAh6ic
	 gMo97OJeHw1xdht+qQzsUl7iGvcXBWLKvBkZycoUsfqeUIhRlsPh9FE86TtB0UrXo+yTB
	 GQ7e6vLmDAPec0pS4jhEjPixL4tiNPaUs78VEa5mnwax5Zb1JOIjHcdxHY/hNxHw4hNSR
	 C0XIuRIcfGb2hlcJ6l00NRYWnFrhmocV9+l8HL/hHBixT+HrxCo3nFsimAp4G4Qw47TJN
	 TC+9TG27wKdbbTNh2t58Guk29qbaJLpVrXqMfgYWZVYLMZp6dInww51swvkLksHeJRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvznF1Xh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIGaB6OB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A23606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A23606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvznF1Xh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIGaB6OB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkCB0640364
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=; b=UvznF1XhPrghuV2M
	PrLHrrYddfSUSSJ1n8PYnT6QykUVLrDWkEP/ZkswjOW+z6avptbOaQXIkm7wTwgE
	TCBDTryheIMQHfSqTqEzyueFvC0Tr4L+ekmzi7jKVZAcmX6nFHhsy2Zq/v78ltc7
	BZ05eiOpV5p3gArlYLR60JGc0p0V7rPOzQUzwF70GZBY4r77KXA1E5KENnA8bN/i
	O0W/Q6++mZC+m/H/vjx9EQFEf/pzIBpM2WqkIF0gb/DJl6dsxFDTcgfWBn71QR5Q
	bXZ09I8PiU9AHAOjWFJA9Wc5iCjo2loxEqAURDhLG1uFRv8Z8Ps1C6XdAyXEaU5Y
	EdX4qQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmah655-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:29:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3114912eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794673758; x=1795278558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=;
        b=CIGaB6OBcuJStLHbOWYc/o7PukfiRwqFS1hm0IriIJapguovIxEWDsCCUTiq5kpoyq
         nBmoALJfc+wUnFfqx2m/RpObSk4wugb63gReCTTFDYj160BgIwPMWRzpAN1076Lx4NZJ
         GTY0yGdqGdoA+qT5f+Z7AHM51yOUj8SpdYYjcG80yjPADr60h+CnixNMW5MWnPzosjdz
         nM+ibGlg20LMcmhekVIWLIqSCraD8PDtuaGV56xfuubXtw9a2/pFRF9EV5KiBxfYt88e
         hWwaKZd/oKrOE/4uG9q7HDK9GAdpflR5ZR4DvIO9mbRnrTNQTcc3Cwxh1bgBytP+iiBe
         03CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673758; x=1795278558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFSv36haa/S2tWhIqa+FIbiJpV2o1Z/WfYOu8JEVZLE=;
        b=QErI6S2i0n386HFWQj9vXQprPL+gaweL0jDytb+Chc10m8LF4201mk7vyJ33jdD7kc
         Askgj+zU95yuJhfnOsIajydxZ+bgRdH5jtGs6Wd0YiL35ou2vFXOmFZbMnQmzfukqKIP
         49/Rn9tA38L8DnTBObitV63jLYyFv9scQD5f1ltQ9Ocy/XoIQA7FemhK8ltru6OYx7Gm
         MkogVMGQy+pwyVgPjp/5O6vCdPUta85bUgzXUngjaHviJTI5pxf6fcS3vTp11h0L+CtJ
         54dKNqGdQDRT7HNp3nvTbnYnpEG9IPvw2DD87XfVgSdlcMLRKNXK9XjdSCJ0XQktl3W4
         23XA==
X-Forwarded-Encrypted: i=1; AL+hErHwrLzKKedpTDNX+Gu3zFotXxhLx2QO9gJsP+9WIHENvZBeFT5rqqYJ+RksHkQLbQRG8SGBMQJ4bsMoivk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dXim3zh9rwEeTcx/Z14zIEMbfyWn1xiT6T/HBE2ejJfPq5cHL
	szSc6/AQ/IIxSf+K2WiQqHsvgiylwoun2sWVF8l7B1PUemyjK/LMAkQMpXovDsqVq99oNZb5Kjw
	FqopxGKyprAWD6ghTnBq6Yh/JejBoTUzfOX3yT6PI4A7B9eg3Ugwfdx09D3OvCE8UZoE=
X-Gm-Gg: AYBFou38dhUXGbn1qAVCPVhsgxyUSHnJx6zp0rpDBXPYocNp7oenLe32BfONfMBQxKm
	DdKH5DU1Kz9i2RA8r1SM2rCW8j3+jDQnPjakECvcYQ/7dGWgC9r7DE3YVk3ZpWfVr19tMOoIQke
	Aj12hePEVVv61bw1QXpF47QDZuxWIFGEfyA5JvVhM0bo2zi90D4al9YAPWDPmofU+pFEcl8KXhb
	w+Rch497SL5cr1rxXj7yHMwlOrBlpx50UCNEvl8r1xAdL7TS+x4Dq/FbT/WzAwakglcKZU65Bk4
	qbKXzaH9fuZEsG5mqvYhIRMhu4fnInHgSwWxSYxx7ygiXe27CAx3GnXv3CtTB8B6Uk/6xkwAhMZ
	tq8Y9svzLFcH2Mu0ctzkDq2RkoBKeQxW7S04IF68jIgIn9ryi/pmrL445s8BSvbafRd0v717Tjo
	TJ8Cbq3RB+J/99LEyeZw==
X-Received: by 2002:a05:693c:808f:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-37966a5595bmr6632325eec.22.1794673758025;
        Sat, 14 Nov 2026 08:29:18 -0800 (PST)
X-Received: by 2002:a05:693c:808f:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-37966a5595bmr6632287eec.22.1794673757370;
        Sat, 14 Nov 2026 08:29:17 -0800 (PST)
Received: from [192.168.1.12] ([122.164.84.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm30930509eec.25.2026.11.14.08.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:29:16 -0800 (PST)
Message-ID: <4a2b0d2a-129b-452e-84d1-dad83353b10f@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 21:59:09 +0530
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
Subject: Re: [PATCH 05/11] dt-bindings: clock: qcom: ipq5332-gcc: Describe
 clock inputs per compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-5-d242e3d49648@oss.qualcomm.com>
 <62a5fabc-3a06-42fa-9c6b-6504650e712b@kernel.org>
 <7bcffc7c-5dda-4ead-a053-7eb4980e43a4@oss.qualcomm.com>
 <bec2bee4-dd38-4846-91d7-006fe38fc9da@kernel.org>
 <af43c724-89b9-456d-a5da-0d8ba46a9b8d@oss.qualcomm.com>
 <e8dadc91-226d-4b05-8de1-4b22318fc7ea@oss.qualcomm.com>
 <ed3c4e4b-7c6a-46ea-b07c-ba7ce6214830@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ed3c4e4b-7c6a-46ea-b07c-ba7ce6214830@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H3k3xZ2Nsb2xuTo_L_yUcxb3hORPzWAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX2MYRVXFPV+Qv
 Ji3mS82WQLkuyxDuRrRXhbJgiuSxzfvR17pUxlufrnzi8lDTI71lSs/nxrURLUQ2UXq79xp/sdk
 lC9NT+7fvLtEuVt0GhhmjBBOVUHZVCbgctvPY+qtoXnk9tynizvwZA2rpiKdN7APeceTm8/p3jW
 9Lxye2GD9LXiC8ezp5j659EIkhsfLD5p0Y295BCUDQITRVfRmlHEdlTLAa7mVzmhYQfM9de+dox
 KpBpz/qkwMtjiUNgbxrhc/jGpfkFNZmlIWPwRK2lFDSBrUmHnlabNAghM4Je75TwcyKXvwTBODg
 uO8HwPROFFSgeCvohjAsSNwsy/Bvd+vBBQEIbsqRS9AczlFt1I6Z5u1JjKOf/ssh4cwuHuDjwQT
 SuGokKOTuyPLXzy7GyBAh3Lh7WWZWcX9zZ0ZIB3djO4u/EwRCm/PC8aSZjkkrvmJZclttqkQVm4
 knY+Xks7FHQV5qRJ3iA==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af88c5f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cs/8+e8xk1Wfje/1H545Gg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mw7ywA0MMAP2sS5nzLUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: H3k3xZ2Nsb2xuTo_L_yUcxb3hORPzWAs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX4a4oHlAxOATY
 VDIOP+Sf9qFQTLnr86rN+ZsP2GxPlx9i1GCuBeY8OZV4br8RZcFHXKWGoCZElzwPyls9XTZOapf
 tp8ZJ0WB2pRg0tNZDurBV0LaXpESrNI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140065


On 11/12/2026 3:02 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:12, Kathiravan Thirumoorthy wrote:
>> On 9/25/2026 12:09 PM, Kathiravan Thirumoorthy wrote:
>>> On 9/24/2026 4:28 PM, Krzysztof Kozlowski wrote:
>>>> On 24/09/2026 11:15, Kathiravan Thirumoorthy wrote:
>>>>> On 9/23/2026 2:17 PM, Krzysztof Kozlowski wrote:
>>>>>> On 21/09/2026 08:19, Kathiravan Thirumoorthy wrote:
>>>>>>> The IPQ5332 and IPQ5424 GCC blocks use different clock input
>>>>>>> orderings.
>>>>>>> Document the clock inputs in compatible-specific schema
>>>>>>> constraints instead
>>>>>>> of using a common clock description.
>>>>>>>
>>>>>>> Also add the 375 MHz PPE clock generated by the CMN PLL to the
>>>>>>> IPQ5424
>>>>>>> clock input list.
>>>>>>>
>>>>>>> This keeps the binding aligned with the clock ordering used by the
>>>>>>> existing DTS and GCC driver implementations.
>>>>>>>
>>>>>>> Signed-off-by: Kathiravan Thirumoorthy
>>>>>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26
>>>>>>> +++++++++++++---------
>>>>>>>     1 file changed, 16 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> index 1230183fc0a9..fb39dffca988 100644
>>>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>>>>> @@ -25,14 +25,7 @@ properties:
>>>>>>>          clocks:
>>>>>>>         minItems: 5
>>>>>>> -    items:
>>>>>>> -      - description: Board XO clock source
>>>>>>> -      - description: Sleep clock source
>>>>>>> -      - description: PCIE 2lane PHY pipe clock source
>>>>>>> -      - description: PCIE 2lane x1 PHY pipe clock source (For
>>>>>>> second lane)
>>>>>>> -      - description: USB PCIE wrapper pipe clock source
>>>>>>> -      - description: PCIE 2-lane PHY2 pipe clock source
>>>>>>> -      - description: PCIE 2-lane PHY3 pipe clock source
>>>>>> You are changing the order which is ABI break. Describe the actual
>>>>>> problem to justify such change. Are you saying this was broken since
>>>>>> beginning or what exactly is not working here? The driver was added by
>>>>>> Qualcomm in 2024, so how did it even work? It's not some 10 yo legacy
>>>>>> where we did some mistakes in binding while converting from TXT.
>>>>>>
>>>>>> Also, I do not get why the list cannot be shared.
>>>>> When the bindings was posted, list is combined for both IPQ5332 and
>>>>> IPQ5424. But the driver wasn't updated and it was following the below
>>>>> order, so was DTS, which is not compatible the DT binding description.
>>>>>
>>>>> enum {
>>>>>            DT_XO,
>>>>>            DT_SLEEP_CLK,
>>>>>            DT_PCIE30_PHY0_PIPE_CLK,
>>>>>            DT_PCIE30_PHY1_PIPE_CLK,
>>>>>            DT_PCIE30_PHY2_PIPE_CLK,
>>>>>            DT_PCIE30_PHY3_PIPE_CLK,
>>>>>            DT_USB_PCIE_WRAPPER_PIPE_CLK,
>>>>>            DT_CMN_PLL_NSS_375M_CLK,
>>>>> };
>>>>>
>>>>> So I'm splitting the description between IPQ5332 and IPQ5424 to
>>>>> matching
>>>>> with the DTS and the driver description.
>>>> So we asked back in 2024 to have the common part of the list. I even did
>>>> the effort to dig it:
>>>>
>>>> https://lore.kernel.org/all/ruti7hmkxkayzmqfbme6rw6j2vbhlx4ul4ptcckwamcpd4cyfx@owufhxwpvlcj/
>>>>
>>>>
>>>> Authors implemented it partially, broken drivers. Now you basically
>>>> revert what we asked, which is BTW logical option. It's logical and
>>>> reasonable, but leaves bitter feeling.
>>>>
>>>> I have feeling there is no accountability and no responsibility of the
>>>> IPQ at all.
>>>>
>>>> No, that's not going to work. You cannot come 1.5 year later and revert
>>>> what reviewer asked you, even if issue was just by mistake in the first
>>>> place. And you should not even try to do that.
>>> I understand the concern, and I agree this should have been caught much
>>> earlier.
>>>
>>> I only discovered the mismatch while working on the IPQ5424 clock
>>> additions. My intent here is resolve the inconsistency that currently
>>> exists between the binding and implementation.
>>>
>>>> NAK
>>> I'm happy to explore an alternative approach if updating the binding is
>>> not considered acceptable.
>> Krzysztof, I understand the frustration behind this, and we will make
>> sure issues like this are caught earlier going forward.
>>
>> Could you please advise us on the acceptable way forward for this series?
>>
> Unfortunately I don't know what to advise. I cannot Ack it, because
> people look at history commits, take them out of context and use as
> arguments in discussion ("oh look, here you acked such change, so I can
> do the same").
>
> Maintainer's feedback was basically only partially implemented and now
> you want to revert that part which was implemented, basically opening
> the gate to allow such patterns in the future. I don't know how you are
> going to guarantee such issues will not happen in the future, so I guess
> you need to live with broken platform. Please align with Qualcomm SoC
> maintainers on this, because I will not ack it.

Bjorn, could you please share your thoughts on this and suggest how we 
should proceed? These clocks are required by the networking modules.

Patches 11 and 12 are independent of this discussion. Since resolving 
this may take some time, would it make sense for me to send those 
separately so they can move forward independently?

>
> Best regards,
> Krzysztof
