Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100088;
	b=5tqBS9PBMHK0p3lbseOm5SXv8XH9eiY69SXKK6sOXPpAEUx0y0zCfnfof9AcSDL27vRl
	 0fMaE10+YwFv544iCk0JXXtI7fOrgQTQLcOyDabjZfYsIbr9OO8VlQE6mLhYIQWy3iSvF
	 WUBSLvQ3yot7mnF/mO+Lcp2zi1l3Nqt+FufIO149RNGAJbNmsQQLNQgYJ5MP5RvNkU/a9
	 4fJqattlelUUlPwcMe6YIIR+TUlagyj9fHqXn6dm/4lt28Iauapi8OwbZ/D5zZ80cJ96Q
	 z7EdFL1G4JCZugu7lpUHelOeBnuFLGk7MCJ11E9U1CK9tkXLdCbCinAWAlhZ+BPZpgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
	b=U75NsgefpXUIWJhN3vq2p6moWCkHnJwzF4V2UDwu7L/gt+DM4Ajv4UgOAeKl5mXcL52l
	 cM949G9Kx1H+SgSSLH2UK7MQieOk81nGzsr3UcUhLKNLDeC5zI5eUulwQ9azP5YPtiSXd
	 l0vve6J/aYbia+doXrjyq+Mnq9NJpJE4qKxAjJ4OEg7cfkazsy2krDm4iw52N5GWjLICc
	 d8PBJnVGerz81rjQ2bVtRQilDzkgWmusjE9L+kNIYGqTay6kGzxnqC1mjefqQidacHGu7
	 wKKz+EXUBdhJSMztAPA/BUsF0Ui8QeuGA8BNJ252cZ4lBet0IHC47LuqQnJC9ZCn//g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTm+q2if;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRlnZO2G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD949606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD949606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTm+q2if;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRlnZO2G
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2H81614732
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=; b=cTm+q2ifSDhFLe38
	o5RQrj2a7BeytWINEZrGxgVix/c9KLH0ChWmpYI1ZVcfBpQfui1+Ojr1QOVeFB5F
	tKfb37U+IoqhxwoXDsT2tyPxlK6eg/6cgwTUsNLKJCeTrz+2YntAq4Xy/9oANJI2
	OpnNlENmOmxJ9/6AQDoXZIKBfAtutNJj34ogYSpqtoP2TNQKSpeFBpg1C7lzLgjK
	6koiyGGzPcII5dwagV2WQeieCMPgx4Ka3CDIWse/6SnKoDb5seuoc6zff5WjlMIM
	LqYqaD6KEf2dgBMTW2VtmBpADBVAU9Wzi7Dl4hGUh+JKGac41qcD+LHuktvhRiVL
	VQdl8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rw8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:21:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso15742511cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100086; x=1793704886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
        b=ZRlnZO2G8o++1Pw68odli4RtmINIpboM5Ab10jMnEtkJ8FPuO2B9vq2DO+N6cdPhgx
         d1Uld7atEk2VpaPfwTE6yEsfscDLulZngmp8nkyxgMlS8zymj1Zjr+t7uKf1WtKh6+q5
         qBLXnWlGFRWh59rgxImgmsIMsB6RlY6G+4euubjs3wothqiFaTDNeElqw1oe5b7LUPn9
         RNr6JfSqg43KKWZB0IVZWe56jxXP/INm7iechKS2FRIPiW2gTriT7m0xoHXaLKo4ipi4
         Z1owamNkEp/24MdFd1UC6t3I6WMqDcnXEiKHvUCFdRlY1k4kMwKl8h3ANYbbIAH6PPnV
         UbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100086; x=1793704886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
        b=mIw5sPopnzYvWl6PTwZYgHgxTvwjoihCgT2X6yEerecNAOYwQFPj2e/wYcV77N02se
         8sNtS1dazkg3cLFES6JUWpMiYW1MdBPbxYFRdzqEkHQubgEo1fEg04C/xLTno5FlN+WP
         +Op29yFOv0oX6IQ+wIvtvqLh+3Q5DkdF3h8NNhI2LcsbB1Q9CtR/Nsj+jd3fdBh1s09X
         KlZ4mB8BllCoh/vWJ/ta2wc9SVAz2trxpdQIZrUX78P0K18vqbL7hsSmpa76+fr+mI3c
         ZqR1YBoQcjPHMxM7Z5mPYQIkInJcQx4efjYTrvUvPimMRYKgWxBKm4dz8IUmvbWAkTWi
         dnEw==
X-Forwarded-Encrypted: i=1; AKwUvBxo2vPIeLreKKXJL4BXf/RwqHzAOHj2y2roA01CRDAhVP+SvYEmpVoQmQe/KaMMSyXqYGFXyTE6pj8gzr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZomVEk23uy35PZRWwWApvf2vpCtt1X/bAHgIkdtmi31tf9kps
	by1mKmk2ZDEJHISGGGD2fjlsbEq3r4KD+0fsX8/lKoUd9MKmlllk094rk9qKnnV10gQSllsR8WV
	tR/4zoLMlkICvushx1MHbhaiQqbnYJcpvmLhRtGlkBdZcItlGSzMgNA0TPmd4jE/1V4o=
X-Gm-Gg: AYBFou11Nh9PZ0gTnl/mNX1yvI9SqFkOnW6KOOAU0Xqav4Qv6OCQmKfze26/54kcKiN
	yNjUxwCJ+BXL9gksuuMDHNqB2KNg7kw0v+66tr6iVeii006NWUgKqLB+7+rGJLTDTVihehcvPRd
	wrS7RgOo7R3BaXwEKqdlp9jJZW8dYqKneH2xIh9HgP49AMh/d43P17KsqDl3SaSR0O1GDCs4pxU
	UUoDMQQ8Dg1z9Or6O5LQ+tVw3ce6ucPZdFyiBX8Kjg/gpg88oVlTM6dOh+MbVdjrs80uucI8ZCm
	ACveoYqVYv11hVBzfgfPbP7S6PLw0pTH74ZicJ5OrL4OzTgWXSkqxA1qYPhBFJ3ffSsAnyGgEiY
	F/sGkNtAMiqEvd3dHNtl3Hg==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1462773285a.0.1793100085753;
        Tue, 27 Oct 2026 04:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1462769585a.0.1793100085311;
        Tue, 27 Oct 2026 04:21:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e208d1sm118196666b.85.2026.10.27.04.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:21:24 -0700 (PDT)
Message-ID: <44dc3838-63f9-4718-9aa5-aaac223a81f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:21:21 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Manivannan Sadhasivam <mani@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
 <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
 <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
 <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
 <at9Dn2N-PmLOPaeq@debian>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <at9Dn2N-PmLOPaeq@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX/bKQYD81InWx
 ZnhslMAizWEVUjTLv5EUcohqruWLFnznFsANJ+IbKq40dugYg8JgpJ/Gsedq3/3UUpr+aEAVglL
 fdE1lNCfoqtAWgf4Z3/Xf2k2UTFUwX4=
X-Proofpoint-ORIG-GUID: B5bY8KxOSO0I2cXOElntWfaDyZ6KKAqx
X-Proofpoint-GUID: B5bY8KxOSO0I2cXOElntWfaDyZ6KKAqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXz7E4l2ozdRy6
 JO3elMVxnVqZjPStMA9q9Hs36sv5FQ5sb/1aF0CfBP5m1Dxnrkl+yauvQGS7b1FFMIgUJMVqAi8
 5pdaPlFa5EbL0Ea3+3a8vnyD1tFHTVMHLWgEXRRJn7iUyjbn2+Kh2HtSXpkeX1fKculuNj1Kvec
 Tl2Ghlbxi4hvfZiGSN2AiVJbnqO9PfPbsjXp7dHLeRFrFhN00oDFcUX2r9AXo812LAuTuZmyimL
 CXxqwLJ9kSyIzujANBOSabL7E4Qd85XzAu90L8weBicB9yMngG8DgBD64u76GAy7/yYJTUfYfCn
 6O8dHF+bTNb+P+Pa4XJnJ7+Mgo4xdBT0Ke3ZZ1fKkE6IuHNFCeYj0tzL7IF4691vKJRXryrg3YU
 iiEse0xzt8Jj90aZwjbJbXfX8EKhGfNIdZnV06jcztgI8y2EmaVCWyoB2wIeyB4+4iHA3y/jb+0
 LsE7dkHs27ibeXhKehQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08936 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5fzcQa2O_f0PTkyQNbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 10/26/26 1:13 PM, Manivannan Sadhasivam wrote:
> On Thu, Oct 22, 2026 at 03:08:44PM +0200, Loic Poulain wrote:
>> On Thu, Oct 22, 2026 at 11:34 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 10/13/26 10:13 AM, Loic Poulain wrote:
>>>> Hi Folks,
>>>>
>>>> On Mon, Sep 21, 2026 at 2:38 PM Konrad Dybcio
>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> [...]
>>>
>>>>>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>>>>>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>>>>>>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>>>>>>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>>>>>>
>>>>>>
>>>>>> This means, the dummy port/endpoint node will always be present even when the
>>>>>> M.2 connector is not used. I don't see a compelling reason to do so.
>>>>>
>>>>> I don't really see a compelling reason to defer re-defining them to each
>>>>> device DT either..
>>>>
>>>> Adding an empty port/endpoint at the SoC level is problematic for
>>>> uart, port is not always expected, this depends if the uart is exposed
>>>> through a connector or to an onboard device. So we may end with an
>>>> unconnected endpoint but still have a bluetooth subnode, which can be
>>>> a bit confusing... Also why adding a port/endpoint only for a specific
>>>> uart in the dts, and not for the others? This is a board/SoC level
>>>> choice to use a specific uart for M2 or not.
>>>
>>> From my perspective it's removing boilerplate. Currently all USB and
>>> PCIe hosts already define their ports and endpoints in the SoC DTSI
>>> and if they're unconnected, then simply nothing happens.
>>>
>>> Both 'ports' and 'endpoints' are an abstract property that signify
>>> 'X can be related to Y' and I don't see how that's a problem here given
>>> UART is very much expected to be connected "somewhere" (with the
>>> "somewhere" perhaps being external/a pin header)
>>
>> Yes, but in the UART case, where the connection can be represented in
>> different ways, we can end up with devices being described as both
>> unconnected (no remote endpoint) and connected (via a child device).
>> We can probably live with that, but if we go in this direction, we
>> should consider adding a port/endpoint definition for every UART
>> instance in the DTSI for consistency. The same would apply to I2C once
>> endpoint support is available there as well.
>>
> 
> Yeah, that's also one of the thing I really hate. For getting rid of
> boilerplate, we will be just introducing dead nodes :/

I disagree about this being a problem, but I won't block further.

Konrad
