Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284086;
	b=JT+xaBViq1fudZWpADV0ZCvlAQ9e4WU8D5PjLHnyTPrlknmeznJnRARsKothsLhorDLC
	 l2xHcR+bI+sppzk2uAEf4QTXUK4x7uXUArNh/aUARHrAsg2WALmS0rSFM66VXYHLa9FQW
	 FXrtqZHYrDG7afxEUF+5HR9Kcg55yL4xHznLm380r1FYJdyJYWlOk5QooaJFr6Fcp9Wiv
	 YgJ9NJbJIF2B17Je7HgAlt5IQk3AXfspuQs4HOdEtN19CK76oRjD8+wlE4JrDeoCb2Tjg
	 lwYw7oFwZ8LD07d0165LnmWCFHBFhOFKzoNfAhwUwOicsnxTXNAlNiRe3EZ5QoAmU8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=;
	b=HPNuVFX//EGk6aGFpTGoJN6oMrB4U+3xJbHhvtl+ZhCxSdGzRyOBgfCRx7tNb5z80Grz
	 j6beyLby4GgYfu8lLO5eJ5Fgyf+dnOh7uTos0lVEqTJWRIXE3A7n6bW4+NARklW8XodD1
	 DoyfvTvpB5rA6C6codmYeBKwkRljqZFeqmRWYf0rAgBSgvw2nE1BKFyVZsKggFp7O/m7k
	 2NV/2UX+MLvg9AOy8wDD1XaOW3MSwzdlYe2EzfpTJsTz2XjnjHH2GAhcEDQxM3WZTw1PF
	 2Ov1CB5FukrxdNYHHPnEp8cE33Xr8g3Ps194fnbyj4iWns8LFGYaiKJoIbsjSzGsnOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwD0zJSj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chivNziG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwD0zJSj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chivNziG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ATjb679895
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=; b=AwD0zJSjZ2kNkWJN
	ccpRP8CVoDMEniLAHBxGHAmBLezgXrJ5C8Q5JRnrHagwgwnFSXcCv5U8J3RgpC0B
	bX5g0KkkqqSyJRTvxU20DRDK+KDb54uvDkbNkJ1+vvunYK7LQiNrWXpUBZ9MiCw4
	ZHfada8u6hl1SQUvF1AxcbmKEORYo/yJYKYKR9B684WSYI5oc4xWz2Iw76SJ0Pw5
	bANkRf/bNp0N4uNNrhIbGuEveq2ElJKcF7TQzoa0EMzaO7EddzQMASOSzRiYvI64
	PP/Ef0TjHeP6drxR8kZcGM0kOc5GTLXjqWcdQ45k7ds8cLGBNX2IExW1TAL1GqcH
	dJ7qQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4899j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:14:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea446ea8c9so11072265ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794284085; x=1794888885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=;
        b=chivNziGbxn6PquaCRLyWZbOAlBCLG2v0xT0uaMfjHTUwqr5woaxxyFshK1i6Q3hVq
         6vxo1lOqt475B9ytHwkBReRiPYbwZMjw01zVcw5VUMSuOcCzeUIUxwX4lNj+TZLKmY4S
         pTQIzhbI+9Vvt52rPpWpodqZgNn4RT0Q/fduKL2gGb4nR/BSeYtd5j041hiX3m1proTC
         uwIW89zvlH2bFaDA6I34b1mtp/N44G58S5EvDuefxaahNTjYeqCi9YtwsC1Rx6CIX+Rh
         42gngj1oM3p5HLNTkTQUc3ITYrXhegl3p7gK3RqBKSoA4on/gmxHmixV6MEH0OwHa7U9
         6yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284085; x=1794888885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=;
        b=qYEBe6e/XRwbmf9VnQukZhh0YNBGjN95tD3Y/3KG9NjGjY75a3JyfR9AuweAYa6bHp
         yWoyJKhtO5uLioVt/QQcnRc0zvV6/AsFYb7XDMbwsK+0tMMuLK/ffh7Ijs6U1AhtTBii
         YY5hXahioe8bfyjgmcVO2kJ5KHgE4zfmB3U8w/IgknFAl656TOmYqxhdFqBIfdrQzf+6
         4XX9GzMvhHPiOdI5qGZQbWfIi318Rn/AIXBNDSMKe5Sf1tR5Z+07YVnmKFACvZwAYOBk
         9xUOr5tTKrYVwB7jyqI8pnS6Z/DUKbgqePCZyi08kF3l46sEbJiRtcZcdzDl4KhpD4h+
         Y2Eg==
X-Forwarded-Encrypted: i=1; AL+hErGS3M5+FJy99yKIfqwY0nZawCniBk2lisKHdF/BA6fvIXcjkrMK7dRaH9bp2LpABzahf/4kR/7Fr+GdJz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OPnRmHi1wbb9/Z5/ejXSFGvmw6/GYMDrXET2HsVQOdv7GcZN4
	4GywataPw4yI6WjNz1xHAmDMU0w/kVxkGqUGSu2va4zlWGOIKsesdIKIwX+QXZF1/PsLD+8dBoK
	GyvrM2hO3E8njReKFDYCMfOcgfW6E2gUGbDZT00e2ByLzO19+WzHE84NXd1bCPVjazdE=
X-Gm-Gg: AYBFou35aHWfBMYJH/4ppeBKpsM8vJoekE/YC6/zCFwu0wyjdAUTX6vU7tXQlEWAVH2
	hGDTirDzKZaSNbgGW6n24K/qFa4spVDj98qo/AL26tdyxDMf3gPURquH9UedtmOucVeznk/l+sD
	WU4om2Ef/LBhNVRqSIweu3L2h8f9tPbIKcPQOf3TMacqk4hthnOZeHlUKYDD9l7KkzOSI9C3a1j
	AcjrAvlV8SLC+YS2EaU2i20LNTpxtl80d4CurWkoN4eIXIdYXcPBzatViqXgZFzlCuWlBIRTutZ
	DqhC7zOV43vh2L7B1WLhvY/hbGT+gsiVgJfrCvN4mwaUTPyYnSLrZQzwgt2Q9CiRkP9MWvyfUOQ
	i4YYV/SO5gvOYfDsQkpYrIEtu+cZbarT2qAaAwfkg1nJXul3xJaujbyoWes+WOjIPmLb4iv0paU
	DW
X-Received: by 2002:a17:903:1850:b0:2ea:10e9:7db6 with SMTP id d9443c01a7336-2edb6e6d449mr12045045ad.3.1794284084691;
        Mon, 09 Nov 2026 20:14:44 -0800 (PST)
X-Received: by 2002:a17:903:1850:b0:2ea:10e9:7db6 with SMTP id d9443c01a7336-2edb6e6d449mr12044695ad.3.1794284084156;
        Mon, 09 Nov 2026 20:14:44 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4d838sm4208715ad.12.2026.11.09.20.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:14:43 -0800 (PST)
Message-ID: <7c80e1ac-e4ed-40cb-b562-cc2a27e6bc3f@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:14:37 +0800
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
Subject: Re: [PATCH v7 00/35] drm/msm/dp: Add MST support for MSM chipsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Robert Meijers <linux@robert.meijers.dev>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jesszhan0024@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lumag@kernel.org,
        marijn.suijten@somainline.org, quic_abhinavk@quicinc.com,
        robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
        stable@vger.kernel.org
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <c329cd0a-1396-4a71-a0cb-6921427f7699@robert.meijers.dev>
 <vr7xot6mfkdjou3wy2ni33ctban7goaqsr3xuw73przuefaupp@6lexppuvjypx>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vr7xot6mfkdjou3wy2ni33ctban7goaqsr3xuw73przuefaupp@6lexppuvjypx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX0YVf13M2YPHv
 Zeog366rKRuYjNtWt8hD94muDWB0+kP2vl7y9ELLLj82XihRn6naDYHZxsjqF2aumJG8RmOA+gV
 setDrmC8ugLrT5b4kbtxE6xrjvlAyMw=
X-Proofpoint-ORIG-GUID: VFDY163QrThaBc3-Z-Bi3VL95mgap8fb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX1de2nJ+hTT5Q
 zu3UvfzhNAK+qhhksCBN/toJK0/DyyBkT2ulS1puQ756faciLDrqw3SIDf2c+z4HGG0ZvO38L47
 KPNajSnjtLR9149BS0nqDBsjCOLGyusdfgYdUVXOfJUhBr1TFvxB+SDvUbD6N4q8oPjLSMhNO4Z
 hwU1w2U2aYBRofuDw4NUZNzsCP0ICzGueU+sbEzZ+Af7+bC8DF2ukif2V2QpTxhj9XrWf60I3SL
 Sn6kS/SK0YxL2+HLwKUW47ucjF+7LXobj+TjVBLk4yveCNX+3aErrbb0qPQESikFPkIdYUs+56M
 523+cMEO+C3bdrpHhEamDxXMT+yPYFzKbzurfkAq0tBvwrysdLw9FWC2q63DJnfA2AGDTshOw4f
 Q7A/3v3BqMQmYxlXzBeocW2VNPSX2s5n1aZrE86busDact18TD6/ABJ5ReU9NvJ7xcBmgN689f9
 /gUqIg2DlEVv8vgCMgg==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af29a35 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=m0oZJYypAzi8eX9yTqQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VFDY163QrThaBc3-Z-Bi3VL95mgap8fb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100016



On 11/9/2026 3:25 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 27, 2026 at 10:04:54PM +0100, Robert Meijers wrote:
>> Hi,
>>
>> ((Sorry, re-sending because the first was rejected for not being plain
>> text))
>> (First up this is the first time I'm participating on a mailing list,
>> so sorry in advance if I'm doing something wrong).
>>
>>> Add support for Multi-stream transport for MSM chipsets that allow > a
>>> single instance of DP controller to send multiple streams. > >
>> This series has been validated on sa8775p ride platform using multiple > MST
>> dongles and also daisy chain method on both DP0 and DP1 upto 1080P. > > With
>> 4x4K monitors, due to lack of layer mixers that combination will > not >
>> work but this can be supported as well after some rework on the DPU > side.
>>>> In addition, SST was re-validated with all these changes to ensure >
>> there > were no regressions.
>> I have applied this patch series onto a near mainline 7.3 tree for the
>> Xiaomi Pad 6s Pro ("Sheng"), with SM8550. But with these patches
>> applied I don't have working audio, over USB-C to my (DisplayPort)
>> monitor, anymore. If I disable MST support on the monitor audio works
>> again. Debugging (using AI) reveals that the DP0 Jack is not reported as
>> connected anymore when connected to the monitor, with these patches
>> applied and MST enabled on the monitor. As shown, for example, by
>> amixer:
>>
>> $ amixer -c 0 contents | grep -i -A8 -B3 -E 'hdmi|displayport|jack'
>> numid=208,iface=CARD,name='DP0 Jack'
>> ; type=BOOLEAN,access=r-------,values=1
>> : values=off
>>
>> With MST on the monitor disabled this outputs "values=on". The same is
>> also reflected by "pactl list cards" and "pactl list sinks" where
>> HDMI/DisplayPort is reported as "not available" with MST enabled (and
>> "available" when disabling MST).
>>
>> (Again, suggested by AI) I also checked the ELD, which in both
>> cases (MST on and off on the monitor) is identical, including audio
>> information (like "speakers [0x1] FL/FR"). (Also, audio works both using
>> an AMD and an Intel based laptop, in which case I can also choose
>> whether to use "HDMI" or "HDMI 2" to switch audio output between two
>> monitors, in daisy chain).
>>
>> So my foremost question is: should audio be supported in case of MST,
>> after applying these patches? Or is this possibly out of scope?
> 
> I'd say, it was out of scope for now.
> 
>> For clarity I would also like to note that without these patches
>> applied audio over DP does work as well, irrespective of MST being
>> on or off on the monitor (obviously always running as SST because of
>> missing kernel support). Which would make me believe that no audio
>> support in the same setup might be considered a regression?
> 
> Technically you are right, it is a regression in your case.
> 
> Yongxing, how difficult would it be to support audio over the MST?
> 
I don't think it should be too difficult. It would mainly involve 
programming some audio-related registers for each MST stream. But I 
haven't actually tried it yet.
>>
>> Note that I do understand that me running a forked kernel on a
>> (by upstream) unsupported device might also lead to issues or require
>> changes for the fork. And that if audio does work with MST then this is
>> something the maintainers of the fork should, most likely, fix. But
>> from the cover letter and commit messages it is unclear to me whether
>> audio support should work and/or has been tested when MST is in use.
>>
>> Kind regards,
>> Robert
>>
> 

