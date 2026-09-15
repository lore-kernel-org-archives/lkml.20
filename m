Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A66472081
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478558; cv=none; b=BULc8dvqSS4UWC7OXx8wjL1H/1DYe9s/UoaljNX56Oio5Yh+LVHDmieuly1u6taD0aSpBk5jjIrIPBz2ycKRi8u13q9rO6FSR5HPXBzYJR3KS6icncKwG4HyKlLSgnFARd9w7vI5L2b/Kz+lGRZK2lx/teOhNEb5y5L1+TEywVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478558; c=relaxed/simple;
	bh=dklDLrl26zvKbWrn7A8Q7hFxl/3kWBj90sfvCieS/0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hyx9PAoKawPtFhDtU/sQwMQ6qRyg1zFYXAoJo+BdQIfI2zYtH7FrgZIIYFiNTIfm9eErWYrwWHL6JXaxxFfr7Otw336DLLeYsrt9+aVPW6lal1jUutwdOrkG+0Gx0zWHBX3xENZ23GCEuGnFOFpU3MQrR2/syR8zVPCGFjz5IW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUeic+PW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq5VDe3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUeic+PW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vq5VDe3T"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD05WP3654762
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKYp6xa3UjEsg++N6yWzjapYoyJmdad+ECxR/j4NFCA=; b=mUeic+PW/BCD6qk/
	1CtlYH+LQABg56I2V3VXh/mnCpW2k2S9Pev/EroDmm2IWjIhOkRiciunxPY4lELU
	DG/lewc1ORsOKNyIyxotbXHCFIiBAdyW+++YhLUNCHVBJkLPLGp9vxokZMKw+Z+G
	b3Ia0FHUZvIKJV7pNC2WPj/sPjlUfVOYr1dHNE7Q8xrD1ekoMDSavT9apRtuLvKJ
	52/jJan38DydU7WmAWsFbLiZrz21UwAZvVmZs5i6iHU5LSLmp/US3Mrvhrr4OlgS
	UL4gDlBu0IDibRpyd79T8M7RoKlrR8I0f8/H3h/2hUGyNwHCu21p5q0EKdthBwJZ
	PEYTxw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2h3gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:22:35 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eddfe28b4so40862947b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478555; x=1790083355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKYp6xa3UjEsg++N6yWzjapYoyJmdad+ECxR/j4NFCA=;
        b=Vq5VDe3TJ+cXfVJH8rSURaXboOh8Gcp+PwWI0hQ15HRBfZdelevMvyJTiMxYH9Bpif
         dJvZpQ0ujxoxLmKclEaBcOzzpnYBtkoqM1nGHSgqsAj7ZQMJrytWTzAoeQVDj7Yyq4E1
         QCiHwS+2/TE1Kz5KCY++xiidHXUuaAihwpaDlRRVisLgXIklmYjzj4yPUvYkSEao2k4p
         T1gS4r8lY/Q7XOtVof8CtYyMogCPa11762ZmhWsMVY2NO2HvxZ+oifpoX1b5lkXuWi8y
         PmjRVk+LjPgu/N02lLz/k4MwUcgSnWs5mfVwX3B3ntxTB2rPzM6N6nWX+S85GEUeeRoo
         rIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478555; x=1790083355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKYp6xa3UjEsg++N6yWzjapYoyJmdad+ECxR/j4NFCA=;
        b=gyJ9zBn9dwD3duVfx3VBeSXyoThE9hFZI5s8jgk1bI/ZoD4reX+efESMvHbFNMShqu
         mDaQ2kpJSwlAHJIdBtLRckYr945gocCD7pMRyTClc3rrZukJU0z48TQV95wmZHzRxEc7
         0KlAGYqynmXjplh46gm0NhK1oiCnNiveJL+ULHvhH6E28zHev036m1CEewenzwvHSrVm
         8brEgyHQZDHwlcFlcAHbbcsm2S8bvg6IueKsV9URTbh/WMCYXHqf7zIvmbWO7utvY7E+
         JR8AHGTB2DojiyACCFxKV3d3OpoKMcLOgeVUR0YkTMcY3So6B6nwZULWw+ozRlqNuH6a
         C7sQ==
X-Forwarded-Encrypted: i=1; AKwUvBytHhOPzF2iVziUm0OPM1mVtE1vbgGQdTjaBw1DWZWK2IlAbTwgJ//kmMSIFLY7AWTBh9bv0vj7ensS5iI=@vger.kernel.org
X-Gm-Message-State: AFuF++mwwn1FPMmvPXo8VAjRMB135brX5QZpZ5BbH+ASIbKR5aAUy3gh
	S98gDFCewCQKu4nwPkvP0yW4Qv+p+Sp/CLe1RW3+KPPbbdFVFLsMLMIIDj/tMmpO0LVQ0B3F/AL
	LC3VEgx7mYdZHIyzIElTxOXbskUwhnNPnlkBSs5ZMXavZD1YxUCtoLrli4CTIRPmDh3I=
X-Gm-Gg: AYBFou17XouQvW0uA9ewFc5eGFRvqUyJYia9zjWMkUxvmiG9H8vEGSS5uy7WtJc2H+k
	mYyv4BfzhCGOyuVhXTDzAdeE1eDteGsD1YZyMhl382TVTFGnWai3+ATiD88ST0GYkX3iAobPycc
	YtPnnj9BW9UehkBUZvEaRhLozg+ANBbedQw0EK8tgnKzfLDgT64uhl07vvoV+WVcCv9WCjIHIka
	6YIGmSiOX/nNj0P2YVZOR+1an8RlSiUNeU/M+gbJBoKoY74OpyCHxIpDHAih3UvekCzvn9RAKfn
	Ph5wXBs3D5ShcV7S/auIzbkK0Gdw+YHtWCCZsvNCdL+4npJzQ1OeOLdZpbNpdQRLQ13/eQ2nd3x
	UfUjYXdAOsQICRtlyAzju5dQVBxPnPRaowrE4L8E=
X-Received: by 2002:a05:690c:9990:b0:879:44a6:1076 with SMTP id 00721157ae682-88d21b31e93mr21603677b3.32.1789478554605;
        Tue, 15 Sep 2026 06:22:34 -0700 (PDT)
X-Received: by 2002:a05:690c:9990:b0:879:44a6:1076 with SMTP id 00721157ae682-88d21b31e93mr21603327b3.32.1789478554014;
        Tue, 15 Sep 2026 06:22:34 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939fd0ebaf6sm1014424385a.35.2026.09.15.06.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:22:33 -0700 (PDT)
Message-ID: <8d849a0e-c83c-469d-9e36-442e0fb29c84@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:52:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
 <0401ba5b-c308-4e54-9f6f-58005cd19a0e@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <0401ba5b-c308-4e54-9f6f-58005cd19a0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kjtfsquk5-0sVt6UJTD_FEFwkFq4-9f1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfXzxfszkgWq1II
 Wcb9E9fZE5ESLg21oCgRwlhePxT8CdDw98ixByroujzTocLgnk9X8L1bzNTHiVJ5J1fvl4tdPdw
 CRXY3oGY4k6y1Tfp6kfEzYNCBNvKS+6pz+0lF04LmuCMfc+MRXlrlM2wJX6G/e3+zsUqzSFplse
 aEOYouAWdJRnSSqzD/4WHjlrvC0DRCiKZthH5wpFL/qfvokg9ZQKtnhUb6b3amzSId+gvtyg0jC
 LozWa0dNuvsE3eauajJXZOPSppuiqUQbPCilva5WFzkdUS7JhqZrWWFq3TcDI4pfGImbEtcZCWC
 wUepybJ/jPqS49Vqrg/SC1k4I45iveBp5n3mUoYWcMLS63XjIAvv39VMA8atLrMavKyBUUBdHi6
 WjwKhX91Dy1ULTCxzrjLsgrRVWHTkhCVbT6sS6Nfbm2J7NwMf6NlgG0CAOO0ibalbSi1qfHiZxI
 w/Ex9vIhARg+aRo19EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX5RrGy1hnKpRG
 mRMKplGq/VZQ1Ozyu+iO3/S94oEhpnb1EVZZK8rX8z/+ZNEiZ1pVnU0dUkzbzi9F3ueuVBToI3x
 S4GbSdXFQENSc/BoZQu/TyKc4Hf/fHY=
X-Proofpoint-GUID: kjtfsquk5-0sVt6UJTD_FEFwkFq4-9f1
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa9469b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=CwqCskAXZNsc2T-QvLAA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150194



On 9/11/2026 7:48 PM, Konrad Dybcio wrote:
> On 9/11/26 4:05 PM, Mark Brown wrote:
>> On Fri, Sep 11, 2026 at 04:46:33AM +0530, Mohammad Rafi Shaik wrote:
>>> This series enables the Shikra audio path on EVK targets by adding the QAIF
>>> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
>>> board-level sound card wiring for CQM, CQS and IQS variants.
>>
>>> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
>>> prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
>>> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
>>> prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
>>> prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
>>> prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
>>> prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
>>
>> As I've said before could Qualcomm in general *please* stop sending me
>> things that don't apply.
> 
> Adding to this concern,
> 
> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
> 
> happens to be "Add linux-next specific files for 20260626"..
> 
> while the base-commit is next-20260910
> 

Sorry about this. will fix this from my end.

Best regards,

Rafi.



> Konrad

