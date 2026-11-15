Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776661;
	b=kvyh0mNAER4gJvfTn7QzrZT4Y/WWU2fAot8qY7VBFfGv8VocvoCzx9CMbDwPc7+y1bnC
	 /wBDtwUcOpqK2Ayy9cRtdKGy+rw87+0ndonyclaCp0t1y06n8d/+xybcBJ1t7bFGMlD2c
	 /Xj1ekZ4BCQpYufY5Xkr2/9joPTksuONVKKoP/5Q2zQRVQu+LS++U1CBwaT7vlsR/ziEQ
	 pMoqPdsxud2RCX92kRpPLez8sUqmWeeEkagzKV9d2dD6bMlOY/pS7HedxLd5NxpGvhCjo
	 0UzWVvG75ER8wRam7e3vd20exWBXfVKLRVIoMuF7gA7GBXURD2+tJwbgQTRgJQ78vfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
	b=n8+6kFqNzhLHMzGZLIQ05adobNhyxrnVxA7FfS+dirL+CILdAVUnXo9nm9NlQPsibK+j
	 LQBcaNA1J4QGQEyujjoQBRAhs7mHDPZAOwkKMvdSzuDsrIIKgN9vOtDz3ZgJE1zPBBdcX
	 xutjF+kErBH3Z4VOFcq4TLW3uwi/7WbATmcmKjnFkVAVAMJ8YrNKkgGM66lqQ7hYAb8PR
	 FEPWlGxYXZ41OBzsCTqNkoCvtJgstbZJR8YIO+lolhkGo9lWBDIZ1KBYOf7zfyYUnMY+r
	 peEr3Clcaf8OxZOXNyKFTx7cxuLRH3OcK9iCPOhJ1YahMvPYS7VYmBmuz6Vy+ktWGMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B7B606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B7B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQiah3041681
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=; b=C2oDkk2gmKK8PAXn
	8374kca06ubl4FSAvnw0K4XeMdi4I7knBXHSRehGGam8wtB6gxjQxkK2G5TOMvS/
	7Vz7gOb8zxgOHzEPdR69CbJml6LYh4/sA5cyNC798+sIxiGMMySinjNXjS1eZNm8
	vH0of3vSOgl2uV5xciFigFpv8sv4kkAJSK88CRosUE5Bvof56GiMKa5Dj3GvSViS
	qp6ct0TQIksHxAYYU2nbA8M2XRWAXLSRadwbyrZE772JxE+WQRbQXYvsGAamPBm6
	cPK6J3FFfFtpgchb1zqQirUesvTF9eRNUmkKBBFWkR0bL5muKrqotdwniniucpSB
	/GY/ig==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqkvyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edfbb5b812so1017443e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776658; x=1795381458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=Yl3yEuIlskCdCWo4P2xJuvmNm88HkVnHL4cqGzYf0fGlIeEUIlhfahrFgESVd5JRtU
         DHWIEGWBm+aCjwXA2LQ5J8PfuoQmbNYTGGcRlG8DCEY8EtoYkHzIRUlRvxyUKwLVuplC
         6aKeE1Sg4sOpT5Bevb3aRKcZVAymvdRHLqWLSjoexkD5rFrcQ9GI4J+qcMihNJg3e4fZ
         6ZRYji/H487DJTJwxu7vED3W/BRq7xijyX2XUqN5nWq7rVzXLQTPugKFLlMxX1umdwCk
         dUL4Beu3IUBh3EAqTVoS8EflYtmqQkrfpw/KHYUv6Sr+Ev5Ad7COeaeJFRtTsxvpZgeH
         QUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776658; x=1795381458;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=CPPgDOy/SdZGP+DuiJihpR8dXRxYqUdThHzI/HV6ZpyYRjDvRYK8QHqSkqKveyb+RE
         QrU88/HAcRh5X6Avp4tTi8h0FQZO+dEguf+VWb4c2dpLVkzXlcmArG3XAUg8nEaI1CAD
         8Km+0spMpwjRnrTt/O8E4DIYVgdJOdSr8XHFUL8T39QXsvueA8BvGm3PC1+Oh2pZXB56
         oy/0P0hwC7zJVUP5VlRRELiBurMekLCo9hhp+eopE/2AoBMGS0WD9J96R6FP4FzJXv+q
         KLJn3p0tGHyO02H+VrBD+7l+tVBRWm3+9wmzTt2XKPX1sXbhHclLmqe8iQTfXMY9Yhd6
         vPbQ==
X-Forwarded-Encrypted: i=1; AL+hErHFQCQaPDPe+yJ5FS7dltSC9DY4p/XjaQo9eQLidnY0DGhrFlwJat9v8wjafRWtxGe4xE2fc/2QY5T2k4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bBqxR4WYhIDs6lglZuQvWDMNPKjXbhEBQxb+p/RkoKWWrMQsj
	S5OHR2qEuxwh8vouHWXL53IwV5iY5RTouLFTtoI0ohzkFVwySWOSKJJnFXbdmHWDII322ZvamNj
	taVAKZGe4eDIsiQOW8bDHHVXQWB37a53wwG1GE1Rpp6inEWLugab7K386r6pkVFcTxug=
X-Gm-Gg: AYBFou1awfEJeFlG9uJIaZCP0yCvy4MDD/0huSayvBMGe32C+Va9Ac5Y5GkDdaRM8z3
	l6/JmgVBRta/8tz9v1Kvgkktv3ylZyaaN5nktAVDQLKaVCXSZUSJ8s7g6dyWiYYac1vWSxjPBj6
	BjCEVjg0a0Q9dAZqCcCFk0SWFqYE/swEXbnxFt7EB2K+k6GU/Ap11vDqzTXvjNWPDX2tw3wjtG5
	XHb+RxJr7b4l0z90/c47dFvZJ3ogIZhjvXQfEVj2UMPce/sA75i7F1xs2wTdob5aSVRt0b5Lejw
	+CrgWAwhgmz+cgecGbMf6p2ADgEG5dU+kW/AuA7SAjxBNzTkWPVSdaoeUzPyMNCegrENK5sdnL7
	Foqt1nIDu7q9Pypu6ienshvHtWhkUsY+UHNQxs86X1SSKBfA7SNUbikh+g9NYz6Zt8un5TCNl2o
	h6
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587398137.31.1794776658371;
        Sun, 15 Nov 2026 13:04:18 -0800 (PST)
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587390137.31.1794776657877;
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Message-ID: <31e8d411-0861-40cd-81f2-6d48ac99f95f@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:16 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links
 with more than 8 DAIs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
 <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa1e53 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3AhHibbqxz6MnhjUMnIA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX93AToKtlaXjY
 VVXy8nsNRlNePm88n9LfCePVFZ7oWWYWUpcwWAiLYNEVipyDgGfzbtnK9p8XB3LyJXBML903LxZ
 rfE9odg3p/A0oQccWJlj855HMeLHBN4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX2/kqZa4dpfRd
 D3qJjmK1qEaL7p3CyjjvBZPL6Z+9mBnagfp97NVevq2JbswyhVCi6a5d0biUvxbRC5bpRHlVhfT
 AUrw98cr3SYQjl6F1Vg+zKCyuIHiu/FRBriVeBuEuNPnoHtTbb3v2lTW9fgQMbVQI7ai89rUwlR
 dvhW9b/F0m2Lpc352UIfRZDfRRi89vxUfs7IwJl4UFJGAYAd6ERBv2+wJMDWr3DVJVxbwB9FdBK
 6wRaLNJV4bCSTxSkh1CxF4rKNqFZX+FDBflSvyWrmk//oK+w0QIBXlgudfwEGERau9IRSEUmnwn
 z72LQn7jvvp1Ny0WSITS7OWbg5Qy8OXCrHyL+OFfR1KAsPkPF42iHujNtuVTwjogreMGiRdeWC7
 TasJqfxmn5PynUjA9EASbIqaLFaI6inm5PH+NQfH2RosYxxp5sWXL1lIoayS1feUwZ4Q8xFX3tn
 TphgU57MHx4rLmUmwwA==
X-Proofpoint-GUID: epLG3VBjHAwVSLYtk6BEs41e_bnRYfQ7
X-Proofpoint-ORIG-GUID: epLG3VBjHAwVSLYtk6BEs41e_bnRYfQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> snd_soc_compensate_channel_connection_map() builds the default channel
>> map from static 8-entry arrays and fails the card for links with more
>> DAIs. A speaker protection link carrying both the amplifier and the V/I
>> sense codec DAIs of four speakers has about sixteen.
>>
>> Keep the static arrays for links that fit, and allocate a per-link map
>> with the same 1:1, 1:N or N:1 layout for those that do not.
> 
>> @@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
> 
>> +	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
>> +	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
> 
>> +	} else {
>> +		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
>> +		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
> 
> This is a dynamic allocation bound to the card's device but it ends up
> in the dai link which might be stored as static data in the machine
> driver and get reused on a rebind.

I missed that, am thinking of moving away from static entires and make
everything dyamic and add  devm_action should set the ch_maps to NULL
which will make sure snd_soc_compensate_channel_connection_map gets
reallocated on rebind. This also makes it more consistent with the way
machine drivers allocate ch_maps too.

--srini


> 

