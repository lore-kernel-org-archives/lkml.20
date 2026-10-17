Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ADF7260D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792199768; cv=none; b=JzvMI2Jk7noICeoUK85i5tbuZ32SDyYKFYXk/OTnAoKSiFBFJZ7Vi31auWlS6bkEVBnQi/95pfpncYiLzi6T75p/eF4YGpaN3bXaZptzMETv7FozM90LT/YtReu9s2ONk7LPfOFHdma3/qyvLDdoJyGyWUXkkxFrHnnliCu6SS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792199768; c=relaxed/simple;
	bh=N1UX1ePJTEvGDwKfCxkM5pQz3wXgY0ArFM7AyF8x7EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8fFxsMuJ3e4FOvQN0FnNQ6dy9bmAxVT1U0TI8ctDuogfZkrSJ2zGX2ajxphdobTZIvWYjOloGNdG6Kc37gDiIBkyJ8tlO44jfb7OKkGGTl3DqTHlGziDf8ZcMVzLOxJvXXVXblXMk9M2isBRvDGy9jPXsdD/MtZY/1P/2vas0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHFrDeCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIzcYpfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHFrDeCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIzcYpfr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFWe23322844
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=; b=AHFrDeCMOkINo1kC
	/0JQUdQs7UnjSYAc7H2oufk8bzQUzPq8rNnFcymWR2LRp+4MfDb3lnwT8NeQNV6B
	NoMql0m20iygtC/kjWNGO4Am6F8uKBw+TQhGnldWSHBYQ6v08DeZulCVGy33UUce
	ZXR+5QCLhhwHPFwcQ5s7sbAadAZDIhoyZB+HN4+QH5dPZMX0x8BfdXSIICCukCSr
	RG0v+0MtLOPzDAG+lo42l3N/piOUNNUW6fi9GB5cudhLBQZdEUNuk9f/KS9olaPU
	xj4B3p9kAoyw/tQ2rTDc+4SSesky/Nu1g8OjGt8YzH2pIhve0XEEMTDhIP715Q7v
	vXzlCA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumtxg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:16:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so1105053eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792199765; x=1792804565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=;
        b=gIzcYpfrX8ROvWcjHZ4kA9r1sIMlekqnCOHhijxs1s1mXbalErW7jGahp0PwL9PNKg
         JxIcnTjsn7eEeDk+RTgXRthk1/Oxr+Pchs798Awsq4fTX69q2cbolBh/AtIeH7c0sWMa
         QwQF3F/OmN7KvUmRK1Inh2sjVesXXrsWMBO5JFQsenLqisXolK8ELxzbaGMcCngknLkp
         1qVYdTsolPaKLO9VEgTyf65Kex98Cs1TwfD3uaLzOVN97ttJyQuzJq0cmJBCPpzt78hH
         Sd3LpQmOYrGZZcXoz8HfaOPOAUeH/Vn3RpvQGN9ZsUWsx/gKdBVXjS5BC81YXR/IJWbA
         +qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792199765; x=1792804565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xvye0Zrnm846Ik+htO0ysSMRj9rXqFFc9N95iZlEh4=;
        b=MvHjJ8PA7HaLkw0GCD6ORit41dI2DSs+yL8Y/xbj7KbYlg/uWDcn2nU+Y+Uk17Od5A
         /1cSqrz+N03gvDa2Phsdrf63aokDmff3LXT80+nNSwLPPezXwDPLkHsEonGL7bSW+vWJ
         m8ntm5lCKZFaEo1rlfrlIfZpMg0z47E9HqgorOgNB/A/uWGFT7XgPiKnHSvhhwqPIOg0
         iX94D+rlAWho2mE5bjqbkSCT+zMdQwlKBhwiX2Bhv1Zt2l/XiKrmypgmpP5nH0qKPrvX
         F7RNdnd0IXKHMVg7t2HI2A2tNYsU0Oy9Wa4QpaaNdv3t0dMjvKulb85KC4QFXNCjFaD1
         /7ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDGs/v8FyKToqsx9svHfhHuvadqbTp0trey68N1ONwJyHerQYtYlVyMDxSOum67pSilApn0EC64/5/7wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgAcmaA5kEvByP35OWwzLsxpCkWHsB/KPAh1aHCRl2XoVjUp8+
	kpjRC46QWUFzl+4YEfcDv2nXrzg8iHscu8a8U3ls2mF5kvT+bIA2QEVyRxmJCyDtqkuJH4gHkLg
	nFe5c+Uvo0LRTA2x1R2w/cv5sZPVi4CKLD3xubjFQncRmLVt0yQx5gHeBxAv1VmxFjP8=
X-Gm-Gg: AYBFou3WkKIosS2WIh1ODK5dEqEM4+98xlczF7ssab947qR3/M+nWKFwT6K5FYeBTrl
	3sXhdxGtTWlW7o/mlJBvdHENbEA/JFG7fV68p4Yk2c/zKUvRIi9mbCj2GXVA+45hwUtO31C6fwU
	yilO9b7/QSzhIHspXiIrfQFFx/wm0HIDlXqjdrLOyUyM3jrxIuD5ch1RuYppRdugxlgx6AhvGFs
	QDLHDu9fuDFVpBDkrg8bVgpM8hL5GKAm9rEZFYTn17E2SMH3ZzALJpuUVbS8hl4otYrHYZvGuZz
	bM5L/+JeKkQXQAfFVAR0aNc8zDz6uicrWcoXMh0rwnYYaEzoBORHzL28GAZA21HRjDsE1IuPgcp
	WZ5tyuQN3HM/CeUy76M0wWnt66U4Law==
X-Received: by 2002:a05:701a:c90a:b0:167:4198:2cb3 with SMTP id a92af1059eb24-18512c384cemr2002765c88.18.1792199764904;
        Fri, 16 Oct 2026 18:16:04 -0700 (PDT)
X-Received: by 2002:a05:701a:c90a:b0:167:4198:2cb3 with SMTP id a92af1059eb24-18512c384cemr2002728c88.18.1792199764314;
        Fri, 16 Oct 2026 18:16:04 -0700 (PDT)
Received: from [192.168.1.133] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ca95700sm8902773c88.23.2026.10.16.18.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 18:16:03 -0700 (PDT)
Message-ID: <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:16:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX/eaujudh57iS
 CU6VlC3c31TeHe5y9sot8l3c+t7ERXMBO+gmEKPI9So9ZPUrgn1purh6zsQ9zkdK645J7Lmu7jP
 xWmZmxBKgqOrXJivlyeP0f9L97TetHM=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad2cc56 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nSKOGGwR5b_Qa3AChTEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: eyg2SuyHCTxZA8C31A0pq4w4oRTPfF1k
X-Proofpoint-ORIG-GUID: eyg2SuyHCTxZA8C31A0pq4w4oRTPfF1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwNCBTYWx0ZWRfX3L0NLbl7ZZVN
 wPgj29n1cCOVSClhsZM5tfPrMmkp32fo+18Y78vFUeoXUNHLi7KW7oiCCif6ZXHTVpKjjNlYPxo
 k9PxVg4tIVZ29kXa9iqcNufn5gML9f7ztFdOicJLZ9zw7XONLKwA/H0NlBYfOTszbIaJq10simQ
 F3CgLna93lhrlIO8dm4P0Tp8eOjiG5DQ9sf4fSMRl5A3dQyRi9IrL15bPjO/xq+q5xH9itFVu+Q
 UpsdeT630t8K18bDjAObmvRZ602cpKy1RbUMv2ttK64k6nDHW78giNewWPt94PmYEi7bTRwALn6
 5R2udKqnldeGwmCzM8q545OvC5aw3ODpNxMLPS3AMXtBkUMtJdtUbnjgEbEWDjknxXBDnS2xkVm
 Wj0kYLnhM/KN17SGAIHve1ZnUsuK/+GKrnh9Cx1Xq24u0RaKZqwllQcyFnxUJdYef0ahgDtPfUc
 c61p0goUlFtom8R1Icg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170004



On 10/15/2026 7:43 AM, Konrad Dybcio wrote:
> On 9/29/26 11:35 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
>>
>> Restructure the driver to support per-path role switches and remove the
>> chip-level role switch. Additionally, as EUD need not modify the USB
>> role upon enabling, remove the unnecessary role switch call from
>> enable_eud().
>>
>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
> 
> 
> [...]
> 
>> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>> +	if (!sw) {
>> +		of_node_put(controller_node);
>> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
>> +				     "Failed to get controller role switch for path %d\n",
>> +				     path_num);
>> +	}
> 
> This will always probe defer on a fixed-role controller, we should patch
> dwc3 to always register a roleswitch
> 
You mean for fixed-role controllers where an explicit `dr_mode` is not
provided in DT and the fixed mode is derived from the HW capabilities?
For explicit `dr_mode=host/peripheral` cases we bail out earlier and
never reach this path.

The EUD databook does not explicitly mention fixed-role controllers,
so I was assuming all DWC3 controllers relevant to EUD are DR-capable
and register a role switch.

I can see how a no-op role switch would address this case. Would it be
reasonable to handle that as a follow-up improvement for controllers
that resolve to a fixed role at runtime, rather than as part of this
series?

Thanks
Elson
