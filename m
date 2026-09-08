Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FDA239E6C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874457; cv=none; b=F4pqwI2FNZWullwMQhGUQyKc0S8i8B4NSnPDP6YKEH+QX9hLIdui3Ib/yMCys/8fDqGEaTXTQ37nlFpC9huB8IVM41R87bpO0jkxlIu2hUDGJM8weYQmEINadzrqt6U6wGK7ouvA3fn3/7lov9De19C1rjL4hxwvf+5VE1iiOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874457; c=relaxed/simple;
	bh=FjvrtXgSJzrkNWDSJewmiNLwdxNXgytWznHFxUzyG/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ar8Di5NlM+aTorrTWzkjrkgGud8Zuh2T/jxDkRX/mheNLVTuoItqJDWMk5E1h90bcd3K8wzL8ZglCEy9Ee9+0taTtLV8D9VOHb+ryItB2LA2MeYYreHnfPwG7BHVCXZNztD0gqBYTNgsh6R1Q3v7ixTPWi15+82ItAor78GzljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUm4DZ9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKdKRbeL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUm4DZ9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKdKRbeL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkdMA4162786
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 13:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGBQTQwqiJYHaFi2riUHM9ZZfmyJuOH5IDkuXvGXM5w=; b=jUm4DZ9U5YqaYH4W
	zT1OlWHlCdHRli+yw5AWuoZzV5g9k5LC6er0QBDPVWEpRoS4o9yGViLzI7AtQ6O3
	9yBLck5AKW48h3gVXXUSMAm/FHOQgd17GzoZHt4xpgBqwvlbfSzc7K9r/EQSVRBm
	nPZCSKaH3AG+T/PWDYfTfadyw7IWTEbcPdX6iQssy/+FFIgXJgdCxIm3mHr8zlHK
	1QC+QEoPOXPsbDlPSXrCtYba5ZvW57t48IyW3H8RkgMKXvOE7ZvNcOpYamK7ki7S
	ulOuB5ijO82rVFDfbJGm+4AWParJ/A7TbEiMTdaXUHqp6ElDYCo73s+/dusKYMYI
	wtcprQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pa5j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:34:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d34a0dc8so3585137137.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788874445; x=1789479245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGBQTQwqiJYHaFi2riUHM9ZZfmyJuOH5IDkuXvGXM5w=;
        b=VKdKRbeLp0Np5CTIH1jMgDGP/Mrmq/LSmCrt88LgGkz95H5zvJuiAORW5DJP13qrxq
         ynzAQnq0K+CNVg3+gYQ5i8JZrKowFJPrOnmAdPxBnpzt2QxTshOk98KuCl/IF0M5/Jdi
         P5SPSBlufDea3V3bUFoiM9Jsa9fkGvOC1JtCvNWpVtLr22wYS4k7SWFwK0+5tRzO5wE2
         v7KIK30no6biYZQfH5mkroDcJRIaMAn3p5QUCcZgaMNtdOWfnBnOmAJKWXtyNPTQZWJ3
         G2NCD/ubQrrpqPcOsYMV0yD2AXdAbXNBIMWopjJu1XIyt77ZgttmQNrSvWdQkmS0itGF
         kFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874445; x=1789479245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGBQTQwqiJYHaFi2riUHM9ZZfmyJuOH5IDkuXvGXM5w=;
        b=hu9CptSlRGhp4KrjbRSnhnJ2P50G+xwWrvd/+CTFCGPOrY2NOK9YX2+XyLm30Th/6w
         /8ebkybKBZfsrVVzVRROc27qt1/CLeC4XXIbOaXTmeAdLgB8q941sxAI/7+QATKdcwjM
         Ey3vU1NXpCzhyTfl5oIkju27s5cAADaqgYmCZimwLIj1rxchbxqM74rOjpORsUiEWaJI
         bmqjoGPQK8peYiWFamepM+TdiAj37xCQcMFt/s/fvOTpnmr1RE6NYoMXrpkJ/fCwCYu+
         ujPNz2Ycb7NlMrMhO4WuXTajtBOFMxsgBveKsLKfnxNWH+Rw4/ILdT41Xtt0Vp8/ZKoH
         xX+g==
X-Forwarded-Encrypted: i=1; AKwUvBxHlzW+6nmXfZay3wDuK0f5zNph6aYgTfPFHLLf/QMAv9LexAAIL5GY9IbNlIJlHmDw3ZSGb4C+tUbPOfg=@vger.kernel.org
X-Gm-Message-State: AFuF++kbMG2qwXNA1E/o6m397WbAsG8vXxKbc88hNe7oix9pTFASjFXf
	1VyHuKcBtXGs9Q+kd/7juzQRTYku2ageCBYwRYAw4RiyK1hqovfTbT4I1mV2g1hU8Oc36zC+HWo
	ICONDteU+jIzwrlvigWZCZ8Cz8q932z/MjMMBr+4nqOmHOeaURBw93Ty0rfAlESFQp8k=
X-Gm-Gg: AYBFou3zyrrxzuBew9R90dS4ivK/kUp/0DUjmuyk0n/zsYGsWJS8RlLEZlsLvwiDrTZ
	++b1YoB2Uaq3vYoxh3R03QSMWC8oi8KJb7j2SIhdrw79HgDdpAFO06NpcaBebiwr32C43kazK7C
	Qvzvc1AcjFJNd9WyD0+vasZ/uYKjNaXUct5OxmAJR827cENoYqNFXEviQxz1pu7vKoHlagU6/Dk
	xuQTtf6HW78ZZ9XTDJDY4sYHilhjp8Cdt7od11DIcwC06MmQX4Sa8tMm1+HCm699kwUXMJ4sGg2
	hcj3SaWkjNVCFYeogSF6w6ueDsept8IxPMhRGyrisxaRc86RS3cn+NNsVp0sYOlAKECdE9B+M5C
	6qM44X8XhkXdGwXkJBoNyVw1EW9A=
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr12122015137.5.1788874444881;
        Tue, 08 Sep 2026 06:34:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr12121978137.5.1788874444393;
        Tue, 08 Sep 2026 06:34:04 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c262f97f1a3sm454448166b.19.2026.09.08.06.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:34:03 -0700 (PDT)
Message-ID: <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 14:34:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqALjdlyZfUb5fDu@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: saEPmcPJp5ez422LWpcp3LMt-gyuiPJR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NSBTYWx0ZWRfX3RigvLNKX2CD
 mVGzgmk/MbdUViS3BrYVj/S5vW39MXweVM3zhdE4URQ0Z33/H1o1lZ8LvDnShOFy/48CA5j+Rhb
 nBkHVWzv/9Nlubta3+GaVCdS1l4anx4=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa00ece cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=_BpqGgUEnCmz7QHiTJEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: saEPmcPJp5ez422LWpcp3LMt-gyuiPJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NSBTYWx0ZWRfX2wXeZi8xqeRP
 Ky0ANa6dtYysa9upyTVWA9IUlsc8lR9QgiMecft/K3NCe+Pfx4+lbB8cAKexebxXsm9vxI7Cqh/
 LyBsAJ58u2CjDJ1TBm+VpKcgCCWgXVBZiyWYDs6u5hnh3gEGIWzFoddIoqzVZcAbEiF6pTw5KtN
 Ey20whJPP671FjgjpqyKBEdqI8Jzy8RQYZijWibhw2/GMm2Onr+Z4TmIJUyGzo/9bt8Olceba7r
 klMpbjuHBp6PYus+dxgibQyLPP8bcfTg/K0nKwcuIQF4dMeTysy/67aq0zxIFEN85PdKsnk6o4i
 aKFiVTLbaJpxh014WCq6gOHyFVgECm69h7NXTeThQZ01ucgpZOmW55ZD4R1Pm4EPRF2jcbRxaEw
 NOZVcybOlJbV0m6Au6CvfCzNOIgyJsG032RRRRRW802GD+qoKdAImuhn4RAnMXpdq2pIe2iSm5v
 5cvdk0alLk9Cf6JdLfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080145

On 9/8/26 2:20 PM, Charles Keepax wrote:
> On Tue, Sep 08, 2026 at 01:31:37PM +0100, Srinivas Kandagatla wrote:
>> On 9/8/26 11:37 AM, Richard Fitzgerald wrote:
>>> On 08/09/2026 10:09 am, Srinivas Kandagatla wrote:
>>>> On 9/8/26 9:49 AM, Charles Keepax wrote:
>>>>> On Mon, Sep 07, 2026 at 11:37:49PM +0100, Srinivas Kandagatla wrote:
>>>>>> On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
>>>>>>> My take is that rather than encode all properties in C, it's probably
>>>>>>> worth exploring a DT representation of the concepts that *can* be used
>>>>>>> fairly easily and make the life of codec vendors easier - not as a>
>>>>>>> literal translation of ACPI.
>>>>>>
>>>>>> I agree a DT expression of the *concepts*  not a literal DisCo
>>>>>> mirror would be a better A.  I want to bring that back to LPC 2026
>>>>>> DT MC as a concrete proposal grounded in the earlier DT-maintainer
>>>>>> feedback rather than re-litigating it inline on this series.  Because
>>>>>> B stays put, switching A later is a change inside populate_function,
>>>>>> not an ABI break. so landing this series does not close the door on
>>>>>> the representation you're asking for.
>>>>>
>>>>> I am still not sure I really see what the value is in a
>>>>> completely different DT representation of the DisCo information,
>>>>> all it does is give us potential issues with future spec versions
>>>>> and create a whole bunch of new code than needs maintained. The
>>>>> ACPI representation translates perfectly well to DT, should work
>>>>> perfectly fine using the existing code.
>>>>
>>>> I totally agree with both of your comments, there is no way we can
>>>> replicate MiPi spec into an different DT representation, this brings
>>>> both maintenance overhead and is fragile. This a very big effort.
>>>
>>> But in your previous message in this thread you said the opposite:
>>
>> Yes I did say that, and I still think an intermediate DT
>> representation would be a better A in principle.  What I'm
>> highlighting is the cost side, any intermediate representation, by
>> definition, deviates from the original MIPI representation.  That
>> deviation has to be kept in sync with the SDCA spec, tracked across
>> spec revisions, and translated back to struct sdca_function_data at
>> runtime.  It's a real overhead, not a blocker, just something to
>> weigh against the "concepts read cleaner in DT" benefit.
> 
> I am very sorry but this reads quite strangely and I am really
> struggling to understand your position. I think I am reading it
> as you are happy to go with the group concensus on how the DT is
> represented and don't favour either approach.

Apologies for not being clear.

I do favor the C-style one that is submitted given the discussions that
we had so far.

You also seems to be ok with that approach, I will wait for Pierre to
comment and stay with it.

Am happy to fix any changes as required.
> 
>> That's why the current series takes the lower-overhead path
>> (mechanical transcription in C) rather than proposing an intermediate
>> DT format as part of this submission.  If the concept-DT direction
>> gets traction at LPC 2026 DT MC, we can revisit.
> 
> This part I follow slightly better, I would be happy to proceed,
> pending reviews with the current approach, although if Pierre
> is or not probably remains to be seen.

@Pierre
Please let us know if you are okay with this approach of C structures.

--srini
> 
> I would assume the DT guys would be happy with a completely
> different representation that was more idiomatic DT, that is
> essentially what they have already said. The question I was
> aiming for was less whether they will be on board with that
> and more if it is a good idea.
> 
> Thanks,
> Charles

