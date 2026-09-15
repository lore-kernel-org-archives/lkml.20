Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59B242376C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505718; cv=none; b=VC6o7viA9NMMe5SDk7OSJB1QupGLNATWBfaRKojpF8n+/ogyXV8ni9hykKZ9fhkTrizQEcK+DZ99QkRE8KRvXkZWf61A6AQhsV1WkglJDXYf4fOmIILqVms8XDcD5hkOXYiDIzGRod/nDe9my8O60CCMZFx6hiiAy9dYM8N+nGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505718; c=relaxed/simple;
	bh=nWwyXimLBtMoj6umo79waqNeVJC0VfX1nAwqyCrRPT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqWGWdOPRF574rx84qfBVQzajGALqzxyhLFaQLaVVwQ5MGJQlsDN04ss5J2HtOMlkzsxoX8SFF89T2VYphDP+TXw7TviWpZX/1cn5cAuLR5LzIfWOGqkXplXXBjicOpS9ocU7jFMQA9R/VwIUEmdo6G4cQNfi2Ukma0XHaJp0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jk1loSAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPGArZ6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jk1loSAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPGArZ6z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FItspV277213
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVQfVF1jR9XqD3LOT2wsbXODKwQ8MMbrRdIDkkrrKQQ=; b=jk1loSAY0QTqTUuO
	K2UdAsHHSk7TjeFtKaBb2PGr6yT7qNlxm4Th6LCVBR4VTcQg/umst7+Qa0Kx7KG3
	QhQq+lHGjpcbSSyCkU7QXEh2Q2hCnDRRewAwQc4MzG6tO0Og0dNVyLLRuIr820tw
	2vJ/AO9aDdVrYwROGcCKqENwpSxzvw8OoU4uReyqURxXDWDQ9cCyusqLR5yHeYWa
	UImvxlVUCVJwmPmmHYZmyaKdD6feNPTQ+gaeukB2G95Ggc4eszuN8eQm0TOmPAWa
	gSjFl7p4mTC9ZJ8Gy4puc6MWDsIT2CFykEfolUOlZsPKMf/3Ztu+dVy8tbLGrQNX
	YFBfJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2k8y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:55:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c8da50f4fso74056626d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789505715; x=1790110515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVQfVF1jR9XqD3LOT2wsbXODKwQ8MMbrRdIDkkrrKQQ=;
        b=IPGArZ6zD1VxEZ2jks9s++/uis9/3Hj1g5YtGGAlJ34xJfhK2ey2R6bYNVPgbLygY2
         5ESle15Zr/n/r/zFQE8XuwxD4A/B5M++r0xBropvz55Fj54qbbsUmncmpQN5SpfvKnhE
         SJEgrbwQ6TmEiVbmQ+y06vWxEHeF6WNmoiIcx7jg3JFZZo+YMpdIoK/bXNVmA3zse/aB
         Sn0rtgFxstpXwMOK2Hx39dmldKYqcyuUjs8lPl1v1p4kh6ldUr4Y/9SsCRlq1ZggthXA
         yde2eZnzq+R4MutFtGnLptyHQzYsi9/UhFuN8PnnKn/ZEOc914cShf3iSQMMj0CjQTY6
         VDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789505715; x=1790110515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVQfVF1jR9XqD3LOT2wsbXODKwQ8MMbrRdIDkkrrKQQ=;
        b=f1O0pxkKCn74nQc7fTqBXPf0M2+hEzBhNGqw+N8D1i1NT+g6S8FbB1WcP9ryCiwfCy
         zuba53yshE4eAf0nrMMPz6aIgI2XhZC5AJ347wy/flxwRfaLKIoYsFlczX2L0vTS3z6Q
         alQn2/6WcYU/YK9/k0qBslcNTTD+PW6zHiGfEqEATW9zV+IDgjm42Y+ztc/EsK4f9Lwp
         GEcXg1ynZisVQx4L5wEhPxc2n9BpSHFaF1Zz31spUQ0H0g/J3xhP/4hZJhr3kp/L6nm5
         bkLsKjUUjCuNCahx6GsuFO77doiuUOUm362YJWNpnyqyZRLe1Tm7kclh24hW6eXfrcbR
         2HAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8ikRMdf2SmWpTpCnRspe+Wkm6uNHA54sHAPhrrTJd7+VmF9UcnaBqWNiF8zjYnqebBGuiJezDX5iriS0=@vger.kernel.org
X-Gm-Message-State: AFuF++lzLUTi1iSq+Ascl5VEMzQjzuO54Pn3v/+gEfa0m9TJ9ry3RVU7
	IxqiWumpLMw3DeaJbag6tsZgrod3aDLFII36XOK/BCFlPn/CujJ7MX1CiISkQUkHG5ccpkPp4T9
	ckkXYuBTN0iiKx7S/3Q3a0g2mm4lpXziwKHKwAoJ9fvjAEd2c761VeTjDl3ZoOLN1pM8=
X-Gm-Gg: AYBFou3BAwQJM/2pD/N99m4xWrrah1CaSvXKFrqykv5sX56KFNeNXUAJHxQr06h4l1a
	uKttK2HG0M0d5JIRRJNvso44RYswDEapzCGH2Y/u4qaMX77negOU9WxOkezOQUrPLwDW2Z4I4rK
	O4Pz7s5vOn0FnIro0GAKGML6lZCv3mA7hSEbYfgtRbkrQ6G+v836qoXxvk1IciQQYoOrWlRU8OJ
	9TEtrVCYKQWK4qXCtqKjdAh002DhQrGSYEATxOMeFjSxUtV8zmZm2b/kzVECew6IiZtdL7jR1Il
	riRUhcH9mVQYah/owiT9l+ZcDdcV0RyeiSzvdEmAvaLhWwBD35eSXqTQ6vwXChOlJTTan/WXpMH
	7eE/P1tiXeXg4OZMFDN2fGLOlTZ4=
X-Received: by 2002:a05:620a:2b89:b0:93a:83d:1d0e with SMTP id af79cd13be357-93a4088b012mr391360885a.38.1789505714868;
        Tue, 15 Sep 2026 13:55:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93a:83d:1d0e with SMTP id af79cd13be357-93a4088b012mr391354585a.38.1789505714334;
        Tue, 15 Sep 2026 13:55:14 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83aead50sm24753515e9.7.2026.09.15.13.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 13:55:13 -0700 (PDT)
Message-ID: <783b1fda-b75e-4f4b-a059-b0914a795dc7@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:55:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>
 <b906abab-c252-48d8-b185-5acf3f94b381@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <b906abab-c252-48d8-b185-5acf3f94b381@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BSlY9z-jvRlcwbr19CZf4YCFZfT6pq30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMwNCBTYWx0ZWRfXw7EBHeAkbJhQ
 czm7bM0tm1ayYD9kQMu+Z8OqcMg4ujfROa1AScq+t6srRuuRVmUGSpKlgPNX+Q0whP8u3h7+mwc
 DpGhs9jZ2MyivKjEiqFuB2APPnXX33qsgZ+6KzjSKXLOqF+DCF7kcKe8bsYNHh1/i2xWBJKs+mX
 XVIJQzYKSSOmcz7h2mPPH5ONHvDarN14sAj0tE5Ir2c9O1LK/0PipjYeENNIzmJtuy4+IpnnrDZ
 LQsPk+8TAOqa7EnuVJTwKP1JJu9KC3yeq6TGXY8cLRaEjCWz3tdru/oBJrtY7G3/Ys1oIgUk1Nm
 40caQvMHutxRSSdMW7y8lmDKB1E07ioKPRrSDSuJAptOuFHyghIIbEKtHfCXJGj4KgCxX1L+MKW
 XwiAyMMX6qj0mcLL0qnhU3oZP8TwRv5d2X5RUFzbs+NR//zEUqQtmBKyPcBxe5sUpl4vTuIRj0U
 aCeuI6YjNMUx2xwKVLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMwNCBTYWx0ZWRfXyo/hi2tTiDSZ
 jH2iH1U6isWGyz53iIynxdK8ZAyV0g9QsI93k+Ahel4/KMt2wjgidNpJLYm/guO63GR04eM7QNX
 tdN+3tYOYQ6bye+i74etjeZKDKTurTw=
X-Proofpoint-GUID: BSlY9z-jvRlcwbr19CZf4YCFZfT6pq30
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa9b0b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=B_1h4dMf_IzxQDtsNzIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150304

On 9/15/26 7:46 PM, Mark Brown wrote:
> On Tue, Sep 15, 2026 at 05:56:50PM +0100, Srinivas Kandagatla wrote:
>> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
>> mode over SoundWire. On ARM/DT platforms without ACPI/DisCo firmware
>> the SDCA topology and SoundWire port properties are supplied as static
>> data through the codec driver.
> 
>> +static struct sdca_control entity_ge35_controls[] = {
>> +	{ .sel = 0x1, .mode = SDCA_ACCESS_MODE_RW, .layers = SDCA_ACCESS_LAYER_CLASS, .cn_list = 0x1,
>> +	  .interrupt_position = SDCA_NO_INTERRUPT,
>> +	  .range = { .cols = 0x2, .rows = 0x4, .data = range_ge35_mode_data },
>> +	  .label = SDCA_CTL_SELECTED_MODE_NAME },
> 
> Do all the other controls have interrupts, or should there be a lot
> more SDCA_NO_INTERRUPT going on?  I see that's defined as -1.
Thanks Mark for spotting this.

Yes there are 57 more entries which do not have interrupts we should
mark them as SDCA_NO_INTERRUPT instead of leaving it zero which becomes
valid. That we make it inline with the parser which treats no property
as SDCA_NO_INTERRUPT instead of zero.

I will fix them in next version.

--srini

