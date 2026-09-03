Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7FD42E432
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423607; cv=none; b=iytwp79Ebpsqb0ZyL4H5vQo9dy7V7vysY+86Y4uXf3iEgzJAMGl6/6pGKibtwMpIucjHz8DntRiQl7Llk/kByVqb6S1axJh+udjtj+jtgCNrkV0DzyeLiQd5+yqwV03jpQtcykMaIlNbudvK+rmHiukyawaYX8lKQwjnqQYCv74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423607; c=relaxed/simple;
	bh=v2IcZx/bdW329MuIr279szISaWqbp5l1KL4vbZiMyFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4rBc3NZAPKW/ID6+G/h6rNvl7G46q99BoSHEblpwd9w4U1CSZHUwwE3DHHjm5JT48/9M4Lvk3xjU2JC7DWs4ZezDg7NqG3ItTRPuFl06AaUR9/GM7JhxQU3bSD8L4EROjYjGkWKvHNQVpeUf/hOKabeTFLxHKv6k7dH9kyzkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWqWmKGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH57A9My; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWqWmKGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DH57A9My"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lQxi2596700
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nE91trBQfq5bEh5os8r00zS2wlES+GYFvA05hs89jNE=; b=KWqWmKGAJbSfHgx8
	EKCNvpZMwp8hEoEH/cQaZ2FRB+hDGRinpTUJq4cgIHmSsozjWKjz7kdzysyB4UhX
	UioE9Cj6THiqAIl5YRAv0Xvy++u1ScsRL246LzJTtYukvHPPj6suyWFtyQGNS0da
	J8MMkE2QPEiAyMudtu58fSg7XzGW0RcaWEXaAR0EXzO/83RgUkgZt4ERppMeEiZu
	zza9n1Znihda5C8zEOaApBC+L48edAUEl/hTkQ/sijGpDp010i3kq3/3gLkfsVTZ
	OlOPv2v3EK2+WWVbL7ioeFn4r2In25m0RjTett7GjQeNqM9Wzve7/Wd6g7S2Syj9
	nfPYiA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja4bec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:20:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so3629211cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423601; x=1789028401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nE91trBQfq5bEh5os8r00zS2wlES+GYFvA05hs89jNE=;
        b=DH57A9MyA1Q17xYQRtp/KditJZ6/nEGepJPOIZsp0+Oym+em+1yEMZnH6GLX2NyoAZ
         NWwHSf/rlA9ryVAox0PuKQN59ytGmCpGU6sg2BT8VlpOiaeFrCFHe9oaxPXI+GnoU0OS
         wEu9YqTZ9LyvQzXwRc0Ht8oU6x1zUbwhMv5Zr9LhJwnG/PCM/PSZ6990SWV3c/KLaiKs
         EfvQ/IOVJKrwVlkd8HbThJke2TBzRu419bQHvgYZy3l6OriTq9OGGm2p0t+ovQuwWDJ0
         /IFYUzgN7qqEncchcVvzb6SYdLTYILme1qqLaJqsG3o11+AKwSMQsmlcXl25bNdfj38u
         7Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423601; x=1789028401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nE91trBQfq5bEh5os8r00zS2wlES+GYFvA05hs89jNE=;
        b=tPMDbLb7vcEDtDb6tyIrbRvOAqjcYfKkO7CjyWqJmhVPP+nEb0q4T7vqcGnSlQhIjy
         Hr3RzvM+fX8wGv8DkA/D+MtLVQEjdd5e56bJ8qhtXSFPqkqC878jvgkfvv19dgsYsVd7
         2AkDeETSEkDQB8w1F3+qFBwZPRJ1jTQ2GtcyCBgm9MhkCIsWW51CpXON64bvfIAeAPcu
         3PDShyuz0NjMp5lB1YzMnv/eFUqpoojFzQW7RYy8KYl1FnCuwibQHcg/9TDODkEUEyGw
         szetc+EjbhcSYYqUI5msh3nw6ijWwQ2yDJZiSioHwSOsOCSV8UcCKjR0ZW/gN5RvrMVW
         AR5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw96V0w+sLwqaNRqKdDjYwHlAsLMXUMOnqt+KPZOehexbL2HN0cnUpCecgxBZWYin8/+YRh3GTMZOGpzZg=@vger.kernel.org
X-Gm-Message-State: AFuF++lms+5kLiekzxLdvCFFe4+Jn28tMF0cXx3nFaIz1PaNdLpidYAs
	rp07cDnUBD9qNUYFWF4kmfgQRpid4ehVBABnl1Lpp9TIjYU/M3C55BFaotqts7i8c9I6U/T+gwX
	LSk4IN5HGRVOdCfeFDf3KXDXcpwXrFw2lNevb9Kl1Gw6xGX+dCD6E6D9+ZUoOZgKKyGdKffhoJV
	c=
X-Gm-Gg: AYBFou1TwSKPHeyOr2V0KiU7m0HGUUofM0AixuqtZLGhQWGdQ9AtoHGbe2SgsEjB+hp
	W118k9Vt0F/s0LheHuMf1x6yqltgoADn75LA+nQvrbS2j+ZDNZHSeYIYhwPUWRzCkFyCfU9JbOd
	OmUZFODMBYRQRZpJbDBi2TNljE3XO3zi6oeoSZfzJ2wdBhHhzqSMkh5at19/LPbCCixrEK9YqwT
	RSV2cOWbJGNCapOvz/3dPens0VgnwG+e8p22Phy5kyPhELaRyGHCviFAkGzxkAkBGF/XYKGZje+
	/oXiCCpwnPFdk+yBb9C1Ypf1F1MYlrqChqYD1xEnOnNavNGLWPDtCHZFQwVz35Y9yrk3Fc/EIor
	Nt/f5famG2PetjP2X0xbRKg==
X-Received: by 2002:ac8:7f8e:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-53036cdaeecmr82183411cf.3.1788423600833;
        Thu, 03 Sep 2026 01:20:00 -0700 (PDT)
X-Received: by 2002:ac8:7f8e:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-53036cdaeecmr82183201cf.3.1788423600480;
        Thu, 03 Sep 2026 01:20:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f952ed9sm1956997a12.27.2026.09.03.01.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:19:59 -0700 (PDT)
Message-ID: <f7128839-4983-4088-a41c-e734ce5f4ef4@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:19:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
 <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
 <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
 <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
 <apksPqKhUdb6bnt8@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <apksPqKhUdb6bnt8@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i9NqihvYksMjq9FY7Xfk4xZ1kx6cmUbD
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a992db1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9_5VF51p2skthlxBNIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfXyRU9Gp76ISa3
 2f0msU8q6zfKpAgrZQUjm193avhX40z0MArwo6QlpWc3ZSdoxKP1FWdoNjmtnLwYT2UKFWhEwJM
 oFP9aYibdd6wF0OJrOpAVxWYcd8E828=
X-Proofpoint-ORIG-GUID: i9NqihvYksMjq9FY7Xfk4xZ1kx6cmUbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX8kRw1NTTFiPd
 AwqO67xEOVSwvXhPNdcbsMj7d08vziVjs99mMpiMIJA72QTiHD9MpAXbD+gjDLAwedZIX0Mppor
 5nc+G19AMDymA+kFr/i+T93D5yLX80KHSqQFOvdZOWMuHVZIlCudMmk/8G5h1PFIbtw0Ym4QZW2
 hGwdMhRi8md7WBhNVEcEH4eg1V2wko4hnV5qPiXbs64zoiRxt0Nk08F4Mk5I3sP6zAKXCXoik/D
 M7KzrngRynwRCcqCALqzCqjIBQ2EGnneYcrGGqbtIG61y+YgzBxTIOI0NxC6+QtD827xfCpq6ro
 drW5P5Vot+4apy0tNFHtYAQEhTMJFvpmhfJyYhpahNCFN0S7A0KTxHovVFSrOfqX/miUV7zlV0W
 EjJEf2cU6ikFS4Jt+O56MLIWnHidjSJI6rekbrrWujvvRLO7ksdrUIB7sbk0QqKMYd/RWj+L+uF
 Nf0+bW8WhC10T14UasA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073

On 9/3/26 10:13 AM, Shawn Guo wrote:
> On Thu, Sep 03, 2026 at 09:56:16AM +0200, Konrad Dybcio wrote:
>> On 9/3/26 9:40 AM, Shawn Guo wrote:
>>> On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
>>>> On 8/31/26 5:21 AM, Shawn Guo wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>>
>>>>> Add the initial device tree for the Nord Ride Embedded board, the
>>>>> non-SCMI variant of the SA8797P automotive Ride board.
>>
>> [...]
>>
>>> Since we agreed that a bit comment is useful [1], I guess you are saying
>>> the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
>>> comment aligned with nord-rrd.dts.
>>
>> Ah I forgot I said that :)
>>
>> [...]
>>
>>>>> +		vreg_s7i_mm: smps7 {
>>>>> +			regulator-name = "vreg_s7i_mm";
>>>>> +			regulator-min-microvolt = <300000>;
>>>>> +			regulator-max-microvolt = <1200000>;
>>>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>> +			regulator-allow-set-load;
>>>>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>>>>> +						   RPMH_REGULATOR_MODE_HPM>;
>>>>
>>>> Are these actually exposed as regulators and not RPMHPDs?
>>>
>>> Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
>>> here. I will drop them.
>>
>> Don't you get a huge log of errors with these in place?
> 
> Nope. If we do, we must have already fixed the problem :)

Indeed, the cmd-db you posted [1] allows accessing both at once.. I'm
not sure this is intended..

Konrad

[1] https://lore.kernel.org/linux-arm-msm/ao7mrrW_ob77EAIp@QCOM-aGQu4IUr3Y/
