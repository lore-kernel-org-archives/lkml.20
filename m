Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FAB4E3778
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787243; cv=none; b=ekWOVnOKXqHZhe1CM/EYJzyjx+/enDt9rUSCQ64oisJwbfZSf4xbbWeoU6xwTqkegftL++l9/C5/XB9oUj3eIHXYTAOpGjyp/g63Fc6hlYeQN97cyedNcrTbyBksPxnzqdtsbni4AplGp90SOWarFu03cS4YMTNWKJs7dmOZMIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787243; c=relaxed/simple;
	bh=QMKR2U1eWght6rndoMaCkR4g8GmHo0hzK5L19P7OJrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWJOJkfMTz6ySOGhsPsxl1GjskFWOL2Tc33QByedq4YvTzkpYIarR2HSgjNKb1sGYJVr/oGG3Hhqpc6QlGWlmdIwL4zithQCwdY/m4W5zf6TA6yKmSB9Il6gXteNbloKzoEf0dbNnhjRJQI+yNT3K20fhrztEYi6H0au1RGi7dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUtLQNPj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZAmc2tV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUtLQNPj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZAmc2tV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnRbq4064577
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UzmpjIxRHN/BilcB43bET/35xfzOKpYXBLvk43yM1Q=; b=jUtLQNPjVOqllxfb
	3+KC14fSj1clLoxp02gAFxfXKllsMv3UGv3ljQApssvZOflr+LptWqsj8JkMP5R8
	sTtJewPwyPW6nB0Os5Oo1+t74Y/vQR6xbK5yt+In7iC/Fr1KUBUbkFUVS0Q/fLVw
	AhwUYq7kMrs88jGR40IOprw+u+NAqCwGFjLTyogXaaUyP7Qm8sASiN7XsIjJM1+0
	h23tStHFegX2hVXmB+tRJ1/Mr0/uSYNCvc7z2mxgnq8FjJ1mJfne1jq0gyy2r4Ht
	fq8370J6HOFgBgajsm0oSxFMHcwhIy0pIKineZSx9QHNgzTvGPmu5sFPOtSAfK/r
	MpnqKg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86sc7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980d998b271so1536241.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787237; x=1789392037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UzmpjIxRHN/BilcB43bET/35xfzOKpYXBLvk43yM1Q=;
        b=FZAmc2tV3hrS1fRn/Psi2CBTnTW8MHuaOT/53JlLNTe6o0EYO5CnDuylJqQuVelrqN
         /69blpCujsVOD38ye6yPQ/HT3nn/94pW/ec/78Q0eUV4ZiY0XTUFwtWHIDCfwTIPQNZh
         u4iWOaHyg0TUM7MWI9kAjpGNh3E2lldkIG3oWErHyYkbIJmaBmsa8jy+Gac2db2GMZo5
         2x9gAgwKV1Y9MYIxBGHQ1ZrT7vs7zDYvSYekuYMX6qEIq59C1Dxv1VpRkdcHq2MbZ4x1
         7pzkTh/iDY5Guag43ruZtWDhnSUVECpgL4fMWibkGX1OLZiI2vh9GTQ0VS6fHLkZsL6q
         fsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787237; x=1789392037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UzmpjIxRHN/BilcB43bET/35xfzOKpYXBLvk43yM1Q=;
        b=fqvPc0fuWnlQZ7hrrZTTzWdVDELTVg+nkvp4E+iJsEGi71nCKhy1/ywJ3xcotQ2lJn
         TlTXC2I+8hT9LOdlochBTWibPevWeis7+1Y7PD5mn/gVlciwlaQmOAMM1b7DGHXYpeXC
         ABd76kHUgbKBUojW/LNMBCxvgvMqHQh/sVnlo5PRxXH2bYH+ZuYsdixUDvzZCzXlFO+0
         ZghOT+6EUpNZPm/3PjOWvXjs0ZA+25BMEKeJ0d+++gVg9rZX2QiE/AivbmcFkIBmvIj9
         qpJJlWLBYZ1qJFUTq7gOyggaZAbDSmBrW4/fQPhL0B1dTxjKSsY9B3Xxo+4jn/v//xrV
         aotw==
X-Forwarded-Encrypted: i=1; AKwUvBwDV1Zj/dBa0kiseSlI4PXvDD5NeIRT6ETUppM4omvMMyqyZqqZ4GqIRJJ9IFjWhKVJ5AilgJRLPiGCoEA=@vger.kernel.org
X-Gm-Message-State: AFuF++kPOLQqY+NA3TJRdv+wdVx44VLZB/0dy4VJFG2YnS2gMX878Hg8
	q8646HYBc0bT3+sovw2iT0vNGga51IZH78u+1E+THA+UytCLrnOZhYHTJsam0W4nFlCcfd2AyWj
	xVdpJZIadwyqbeWMockaV8+KrroXU5AfVrCvU+QYdJ9ud08mD4C6yOFTJrPss86oETIo=
X-Gm-Gg: AYBFou2U5DJqtrHxBCC3MvPyYsS/ibUv+SCHXqIFVrml6qZLCf0o/6F5eOWkAAcCglw
	c+KxkmkGg5rGr+2LKI6l1MsKkZ3F1C0M8j7rSlS5Kyiktdk3SGuq6KjThnJn2TCkK4FeHwmrUh8
	TRhgwTusElz/sfdYRSv+59d0Qqyb/YJV7V8a31RcLBsSNuF/cUbCKonbQCfC4pfk6rieYRISpOc
	sxgIJl+RpAPObiZgNZwkQWU2xxWSb2TdbVIWFF63VJ3bVggu69JZsGa5SSPZvV+CWk8gu4Fmq8c
	uq/0W/mQxF4JV+K2mPr0+LUEXs5pkNV+5mvgxf7cieQQ9+yLxof7IJFxqLLay0AbrKGkava2fTI
	4i7oQ3bv1Cjc+Ys2npUEaPg==
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr1556730e0c.3.1788787236525;
        Mon, 07 Sep 2026 06:20:36 -0700 (PDT)
X-Received: by 2002:a05:6122:c2d6:10b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c7fbb2e565mr1556659e0c.3.1788787231199;
        Mon, 07 Sep 2026 06:20:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed2b7sm2377474e87.14.2026.09.07.06.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:20:30 -0700 (PDT)
Message-ID: <ca962589-3b6c-4e5d-a11e-b49cf20dc262@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:20:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
To: Marc Zyngier <maz@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Mostafa Saleh <smostafa@google.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
 <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
 <20260527-x1e80100_qos-v2-2-305c6539e6d2@oss.qualcomm.com>
 <apgeBNSiP01YfNcs@google.com> <86ld9d4h4n.wl-maz@kernel.org>
 <f58bd978-ca45-48b9-a928-45a2878fb54a@oss.qualcomm.com>
 <86jyox4fas.wl-maz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86jyox4fas.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vsbH0-wpisKd-LYuN1cmDenQzbVSAThp
X-Proofpoint-ORIG-GUID: vsbH0-wpisKd-LYuN1cmDenQzbVSAThp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfXzHksSVrTcdQb
 cfALgDrpYCMHSvcKXr8EosKz8gjY2BfqasC7/5F7T+J+/CQ1fcsNwK6ywJtVD6wWCRLBTlvJC9l
 bjeTgDKbaw0ebMeM8ON/h0quj7UbTlk=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9eba25 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=6exlRfS1EnHN7lmZ4RQA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NiBTYWx0ZWRfX8+Qw9JILKs2k
 HQ3pCcUXvnYXj/KukCEYnFy2fQ5SkTkKbh0krwhWP4/XikG81yV3IMjF5+wM9vQH/wF/59khDuz
 04oKe2TzcijWxHmkVWnWuQlyS7/zXnEb7uaHDp/TZrynuxIPqh8K1zywStGlzmL50GcEAxYXE78
 +ITH6sk/mv3ZKMSDOmEFvbs4ooNIrq0xdiSNUYJFNymKKS9ezcN+EgaU5cx5FDk5BC56J3ft0wB
 nq2jW1eJZmV65AOoKnHtIv/mdNCkr9MEk/wuj4vxWjzKWHQkX2+QH3z12RfPpbH8Rfxv7fNowEu
 iIOCDRwsc25v4mr7SMG4M4MqNj98XVOD+awJRPyUNptfpkYe7lLDHGJEubRV40vg6/CYR6aCEuG
 VZmyDxuhBzVHB1A8/FaY87x0P2JiJoFfmCQ0I5dZol7ZMQL2YwTJ1yGCkMS51LfpXh+OzKHrZrA
 rGAorO5n55Uhzt/xaWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070146

On 9/7/26 10:49 AM, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 09:18:38 +0100,
> Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 9/7/2026 1:39 PM, Marc Zyngier wrote:
>>> On Wed, 02 Sep 2026 14:00:52 +0100,
>>> Mostafa Saleh <smostafa@google.com> wrote:
>>>>
>>>> On Wed, May 27, 2026 at 05:37:10AM +0000, Raviteja Laggyshetty wrote:
>>>>> Enable QoS configuration for master ports with predefined priority
>>>>> and urgency forwarding.

[...]

>>> I'm also seeing spurious resets on my "X1E001DE Snapdragon Devkit for
>>> Windows" when doing large file transfers over the network (30GB+).
>>> With this patch reverted on top of 7.3-rc1, both machines are as solid
>>> as they were before it.
>>>
>> The current patch enable QoS for Hamoa SoC, which get programmed only during
>> driver probe. This shouldn't impact or cause any spurious resets once the 
>> device is booted up and probe is successful.
> 
> And yet it absolutely does break things.
> 
> With this patch applied, the box resets within 5GB of heavy network
> traffic, probably because some transaction get delayed, and a watchdog
> fires. With the patch reverted, the box keeps receiving packets, and
> everything is hunky dory (100GB+ so far).
> 
> Which makes me think that the set of hardcoded parameters in this
> patch is not universal at all.

They are, provided the configuration is for the right SoC..
Turns out Purwa has a slightly different topology and that went
unnoticed as the platform was brought up upstream.

I'll send a fix.

Konrad
