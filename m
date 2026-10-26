Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024830;
	b=k0hHYWscUj+JzuS/b+zOurAm0Vv2UNisTweN19XjslzkiuGlmmeqlFebs2NxFEtuqaq6
	 IEqjP64QLADczv4+Ge2gQ0bMNp3cijFY5PRzkNcBrdSejW3i6TJLVFd/Fb6qc2xU16NA4
	 f0og8ySrCBlG5zXlHfK6EVZI4zjiAAHs/Ut1w7z/icI+xglW+ZZycb7cVhJpwND2xyMe5
	 nCbGJrehoh7GD4cgnOBR7q82jMNS6yyenMH17A9m/O1tcZGt16/U0snKl+ts8cVoXnDWn
	 7h6ULdyqLTn8pQqeT6pM8IBKEIOM3C+jIc2o1PewbwauGTGxrza/DREHQi3Rtnt/ocQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
	b=GbCTHS9v7tZQjAi8gwSSvCiHkVkXM1riYZv2HYWznn4yP0PGuwJpq+f+YuVncTjRGXSb
	 R1bkRtBOmSrQ+me39B57WUs29IFHWk+ntmQyly5Evu1EiY8kwR9BqctPHSuwq6OLtSKG7
	 NvvTwvj2PndOi9zdfHgLiM6vOqKyrTTrIGAi2mZK9nVCfOUAkGFjTo5+pdFyi0mCU2gro
	 8Vmg3Y/HQj9vjARuZocR0Mnw/cXkQNAeTy8K9B2RkDfS9UILImbRp3EBKCrmmXiINTPgp
	 MqsE13Jl2VjLJqkSpx7ozGBk/otvjyyRhGuac4M5OT5bSQ9COX+O+waH5Y/vjNkJ/vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwZIzzlE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JDo/xBF0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2D2606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE2D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwZIzzlE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDo/xBF0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtRpA3348824
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=; b=AwZIzzlEeGhTQmT6
	owKx+fKavOPPVwB5kkhFl1jcf2hHNJNiEAqmZyxcbgoeicgnfNQMdIbhowSw9GOH
	SNrjh72i4zTJoP81Un1VYXgoxXqxdslYn3jvj8x7/YtLDLBBXtksRLTIwsdMhS9+
	OOpVn0NnyDuEi0CNREPns4f1eAJlQ182qBc6IALASd5Hg+Svdbwxk9r522N0Xx/D
	IQudgErFZUOqPea/DSjCHBV5Bud0JvSHvsa2tiCEaK6WMVd19Mr444PJLAC9eSHv
	LlTv8HJyGMQKTm7wSXRfzMGVpiGLkn74HkJAXimNF6JE+DqJ+UDWjdjQ1gZ18Uwv
	xpt8Qw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrbu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:27:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so83029137.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793024828; x=1793629628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
        b=JDo/xBF0KPxvMm/bZNWhuz8db0UFfPkt4Ce5P1SOkZIr1KfmK5RHZr4Vi9Zro0YymR
         Lgrlnkf8xcXN0OUGAu1Ts6z6J69ulODJMc5yR4MRAUU5ggHx8peOa6kPMRzoO0xGm0ZJ
         2lhgxPRU5CLhAV0jVG/cD3NZI0zzBjka9Ckn13b0wWQ5ASdhA9cZpZIyYT/pLNpJtYHz
         fjUo8K4sfiBf7OWPG99/cE4vI42d/Lm1Vc3KaGEfk4zpB5feyG4WGEI0pJmn8rjRtcvS
         A1Ae2/GQB/Sd/rGgBLrUdk9gQdTunQgv3F45Z4nALrXL6t/lywpCRmcBHg0q+vQ80oyT
         CSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024828; x=1793629628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i018fVxtGTIXL7t0acZx7UyQ/yTWV3DDtBO9UCel/XQ=;
        b=jTTNEIHF1NTIgPsApdRwcMMyHLk8M1REyFNKe5hJmAsUFMzVHMqDi2d3ZODGz9P76x
         DmHzLWaOuj9cdwzWdSqOmkZOey8jRyWT/8PNzxxBt5Rq3mX3viIJ69bLmW5AJlUIh390
         BWaoF9T122UrGJfqrDmjcar5HG05jOuWpuR42Z9w5Rf5ql+anzJO9zx9NcIp5nORgJsG
         cgHtT1tuKD0/YPrLCd/LzGlG74N78BrcDvwHpcWzaPKhtxzcrkD7LQUtoADz0wLlUg3K
         7RE+n6vNMKaVkhcT5W5wBfv1AAhfQmYJv0ZQ2d01MJz1p4EqDUiaS7SjoBaKcnGC6HCb
         iE6g==
X-Forwarded-Encrypted: i=1; AKwUvBzC+t9cItIEVbLlLnAQ21blJWAyi6Nl2YQap4/7jeQPnD6E21z+w05DTc83+2/jZ9RLvUJqw+DJzwqHlME=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhlDfH03ovqXPxOrll9XZmvCzsR1wxw9PjtW3V7w5jRPEQG99Y
	vKx5UITBfw0jziBWDHDFOMB6kWMoLg0mHohL5mcxfJW4Jh18ZSXbN3jY83/nJkxwrdDIYsmjVTr
	WyIjCXnXbECjQNMzSC+1d8PJE7TU5u4dvBXtCais9WQniuYfQxoBhDwSQxcIt9d3iK9k=
X-Gm-Gg: AYBFou3A2Q5NCi3D1Q6VFpv7kG/kH54XFa9tv/lB+PJYsfFcIPgPZLybz28yX6TrLBd
	5ehmXbUDCzRdNiLWgm5SG8kFVfnf4t9DXwLei6T3c3JTOSqK84wFEJMS7xgcWZcjWyU2sRJ/vZD
	9OpPilNtaZ5z8rDVTtd+A6qJjlEpmkCecbaOw5/1rDcFXTtLkZmLp1D7s2OUyM+bCVVXBzGORsw
	3EkxEndFGf+2tHQhYNrHJHpcDGOpUVHwGB6EHybF9JvuIE2Kd6CCbnnwnEmrPvkNdB6byWNOfH3
	IyztDzDozibC2OJUrbkL/4iQifLoYGQX+ibUUjNGNb0DRFVcVnAnctHoKnX7ARgoOw3A0cG4sxW
	giJXzfFxujaHTvVA/uLLEQA==
X-Received: by 2002:a05:6102:8648:10b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7ce5cabd66fmr1677000137.1.1793024827930;
        Mon, 26 Oct 2026 07:27:07 -0700 (PDT)
X-Received: by 2002:a05:6102:8648:10b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7ce5cabd66fmr1676924137.1.1793024827225;
        Mon, 26 Oct 2026 07:27:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm3584442a12.24.2026.10.26.07.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:27:06 -0700 (PDT)
Message-ID: <a603ce1d-6664-4c28-8f07-f8697d833e7a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:27:02 +0100
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
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
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
 <944d39ba-6e1a-46af-b5ee-32140947f924@oss.qualcomm.com>
 <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ba7e8dc5-a5a3-45de-a1b3-ca200faf1ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l2SZ9DnDuYfqQtLkn8MiIr2Z8HYsjtnW
X-Proofpoint-GUID: l2SZ9DnDuYfqQtLkn8MiIr2Z8HYsjtnW
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf633d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xHC4QZjwoU4ybDikHDkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX1+4UbS5MdsPe
 dGwU5ZW9eKhQw0hr5FBQGkwSkez4fpdhhmDM7aoMIhnEBS92XiowSTsg6TM3n6zGEVTUB9uvYDB
 vgPfAWx7OrR++S2nsG/VcqOf7SsPy3qUUz67AMHSSvGunUDVOELb9Z2rTO8plDKHBZpeUvpXzmy
 O60YXNWcWGSe1GCjoVvhUtM55/cMJaws3IYK7pDM7A0OCs5lJVmhJz8i8kBKxKpg5HrMdHd4seH
 7/piXAvKlbEwV8a6epqeQSwn131TNbRKQFePuwI1Ohe1IlFrjcvkbgwhChEIgND5tAc7+Ocpl0R
 hNeRXWfB3iL7UZZZHQYuSpu9YC8b0T4+ChK+xLLybnY1RGF+zPUWmZI0OXDhXleO3dlCDxdRWxB
 fzRtRENo4mn7BTtmWQMtXBlRWeC/d7IQ4delDFBK4i/Ii8jhxrea7m0Eie8jUhDwtKjmyOA+hvK
 FzcG2VvI3NkvIMNI2dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX6g822SDC05Sz
 VjzUF9u8h9hL4sDnuz0px9szhHuxTMkmfbbQkPItrQatCT8k/gFz2HlWJ9popXJeABfBxYkzKFU
 KjkI/ovYbkGso0cs3JGva7wIRBkoEh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

On 10/17/26 3:14 AM, Elson Serrao wrote:
> 
> 
> On 10/15/2026 7:44 AM, Konrad Dybcio wrote:
>> On 9/29/26 11:35 PM, Elson Serrao wrote:
>>> The EUD hardware can support multiple High-Speed USB paths, each connected
>>> to different USB controllers. The current implementation uses a single
>>> chip-level role switch, which cannot properly handle multi-path
>>> configurations where each path needs independent role management. Since
>>> EUD is physically present between the USB connector and the controller,
>>> it should also relay the role change requests from the connector.
>>>
>>> Restructure the driver to support per-path role switches and remove the
>>> chip-level role switch. Additionally, as EUD need not modify the USB
>>> role upon enabling, remove the unnecessary role switch call from
>>> enable_eud().
>>>
>>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> -static void eud_role_switch_release(void *data)
>>> +static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
>>>  {
>>> -	struct eud_chip *chip = data;
>>> +	struct eud_path *path = usb_role_switch_get_drvdata(sw);
>>> +	int ret;
>>> +
>>> +	/* curr_role tracks the role from EUD's point of view */
>>> +	path->curr_role = role;
>>
>> This should be assigned after the fallible call below
>>
> My thinking here was that `curr_role` should track the role requested by
> TCPM, rather than the outcome of the downstream controller role switch.
> 
> When TCPM requests `USB_ROLE_DEVICE` (e.g. cable insertion), EUD should be
> enabled regardless of whether `usb_role_switch_set_role()` eventually
> succeeds or fails. EUD access is tied to the requested device-mode
> operation, not to the controller's ability to complete the transition.
> Likewise, when the port exits `USB_ROLE_DEVICE`, EUD should be disabled
> irrespective of the controller's state, since device-mode EUD access is no
> longer needed.
> 
> If `curr_role` is updated based on the controller's outcome, EUD state and
> `curr_role` can become inconsistent. For example, TCPM may request
> `USB_ROLE_DEVICE` and we enable_eud() as per Patch6, while the downstream
> controller subsequently fails to switch roles. In that case EUD remains
> enabled, but `curr_role` would still be `USB_ROLE_NONE` (see also Sashiko's
> observation with this approach 
> https://lore.kernel.org/all/20260811215406.7FD161F00A3A@smtp.kernel.org/).
> 
> We could keep them synchronized by rolling back the EUD state when the
> controller role switch fails. However, I don't see a strong reason to tie
> EUD state to the controller outcome. EUD is intended to operate
> independently of the controller in device mode. Preserving EUD access in
> this scenario also provides a means to investigate why the downstream
> controller role switch failed.

Okay, I think we can tackle this if any issues show up in the field.
Otherwise, I think it's high time to get this merged!

Konrad
