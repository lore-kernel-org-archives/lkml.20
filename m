Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023972;
	b=0ze7J33LgNsSdGxjX6U1BbO4uWKLbPXG0DgpoxCOcE4wtvogYC2sxStU9cDMQShRyYWW
	 8sELEeWF6CAY1Zc7wC5mNBb74a1dOYcamjQkD0J+oM6yKO05lw3pPCFXfemz9enDAHnDw
	 frxq6Fw6opxj79lMFG7gXIiWJTbXthgefJut94/404h7plGNcOwhUn84zKXjyTixuxvP2
	 sFX7FWmlfLSDORoyc1qNJABjq1rtXZR1WylwDKv1RPWvLl6mmEVsQ6jYm6YUbp7qbvz0x
	 ZqCu1dVWoI8kjmF4k7pIq2GntlkBgZ8KtkyOfCjN0G4+A1UCDLWqKmjxVu2Kylem6Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
	b=iHpozgixpPP0C69mq9M59Zuf+0EaIp1c217npAgiFwybGmhJ+WvfR69Qg/pzhxVoPFFB
	 R1rKyTvA0M3ox0tldq8/kmYkiXluW3oJSeW+ijPWeOFLYdDxEOIfKZ+SDk49nc0xEkPIW
	 YzHVAH9lkfZYkX1Au6xtQE4KiPSM7IPiHs5SEOBjFTXhOZEFE2Tasz7gnmOwXV2Zbgoms
	 xbI2NABdhnJCaiXre0HEam8+5hVpGLMGX6urYdwCLXiCtsxrhT/4ppzp+22xsJ2ncSLK5
	 vgm05uVkkEm7IpW7dEUKukQzS66QFFVUz+wunwwgNVAN5WB/oR0XEBKAebabEkL/BhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BkBAK2y8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460DD606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460DD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BkBAK2y8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2N13632933
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=; b=UjaiqTmU7fiHzeyZ
	26KInDkK981IDmWIvg9QuSIwAoRV4uKC480pT7B9TvrbbGMNboQbblR6ZNGkcdd7
	vQt+JGNJSX3DvH11byU/7zUqgnMYTcMB2I8KV36wj0v7Tv6Sd0Ai+VnHteyEeAFT
	WQC53Qbg0aCOJMLFVkp/lDZSh6v22a2HYb6kThPbpe79t6tajROE3x5Mv77jwssM
	OqAcknKfA4zAC1u5nkHH4o4Qz14/wkOc/2TMoJgDUhtRzj2knlTRpztfgTGHiu2y
	fzdVvwp3fjIm9AZq0grmzITjTOfOxrCcLccuy5mgw379LWBrg3BS1GqU+s/OVD4V
	cIKY0w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf0wb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so147443e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023970; x=1793628770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=BkBAK2y8PUc76+Kwqm9PwBeXioHdb+XtGZ14Pij6IusZQYn4d/AL6vxekTQC/V76qw
         U0w4zZpTf7X8D7myROs7WuwwH1VkbR/KuGuNRktAdzdBtdEFn2gMxg3x8cuOihzikfiK
         MEcKjM/TO+ghzquecQX62i9AWTaSEBj6jPKjOfoKhxDwXdAvTbYxxO3sKFdcxOOhSJY2
         HxeXJQiHRs4R87XOjkfC8zkaaPB7FcNdZKLQi+2IyrgeoQwv6uJfgRznexyK4qTOQaDy
         8lh02tFTmA4XT1YqhEOgjUcwJGowRPidMPsQoOxU4xXb3Uo2J1ZQ8pWwufJVy5MvECBv
         BXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023970; x=1793628770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=EdSIo+QOKDpXeCjThpZGuX4ecUXJntzmINIR3XlNqAGO8Uecf36JMRhTVfoCjqhEp8
         PQ06B2Va9rGJkx3yrbvsVkZdrNPHeiDWVKy1amNTvAuYfYNfxX1A+Mg/UB5Hh4FGVMc0
         M0wEJu28g0nH0TddN36zwYQM/jW9g2MfSO4YOFx/lg092CnuQc1/UIo2OyKgXA6MueU+
         s4kFfe4EDdyHPKyzIqyrNapigVkDEWOyKEmUn9hE2T3N9eF9zZT+H4JZQRGypKIbUE8S
         O4O5A688XkFX24JWGgOhHAJn95ITeE7APdVTvjJigmv3yDF1hRk2k7xGGOyKcFht5aH+
         p49g==
X-Forwarded-Encrypted: i=1; AKwUvBx2cw7Ph5u1JYOmmI7TYD1Aq9x/EkTkXakPkFtAfbqfprcoSPM6A5QrZJP9a6NcE9zAHSLdXlo29OBdCSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/5v6Y/u+7+wxsAiY84MHzbfan/qxU2VFPBCfq2C/K1G1qOT0k
	PlltCSLd/DLNEEEL+m5bYkKyw0WxwV/Aw/pOamGKzIlZv210RpurwI3xECtE82wpfqngXUpuUmy
	EX+jzpwZhOvJIc9lu8tOCyV9TY3do8ztJRWM8573WdsYh2N2lTzCnDfKeTvlxXBU8V+WQ6U3El2
	Y=
X-Gm-Gg: AYBFou2Cu/PmMOi540+PgGAF5QalbNd1SnlVFEAKlUo3SzfKmMLxqFm8JnKwRzItF6C
	S4qFcdrlLFiRwScGjRavGyWB2kQRlRC/6UYYzZm/1BvhDe3FHxccBhSKD7jwt/rqH7qKAu8CbCZ
	H3QwniIkOyaE9aDXYSWAmSC1UylWL1GnK9ww9ja3tdXLKN8kQItNssLTGU1cAZKXty8qPgmEUHE
	a9EUEV56WUHmPLs0xTiHV1Scm4Q8Z4uYFoxs5uH68sa96vLq8N2Drrvh1TH+KMyiKh/qR0KpvlO
	NjUYcuMckTV3Yy4ChPBaeUzidI4kjGoLhuW5YqOePXC9ArkqHTwzBI0evFl8AR2xP52u1UjTALg
	05IQu7WLT9iEnrED7zRXyDQ==
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648647e0c.5.1793023970304;
        Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648609e0c.5.1793023969822;
        Mon, 26 Oct 2026 07:12:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5202d9sm327107466b.32.2026.10.26.07.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:48 -0700 (PDT)
Message-ID: <e8a228e3-a414-4b2f-bfc8-e3225063bc49@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:46 +0100
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
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
 <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX5GVkcf268dQ4
 PU1K4hzug7k7ctK47z04rAfbnQrWtT0rGYYLFLt4S+hu7HXwof00hcbvw+VXZ5v1Y+9/910Q5ml
 TVYjIxGe/Udjp2aoRkkUH5MGyY0LF3Y=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf5fe3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=QnRxpVyo2ezrWcQ_LvsA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: qSWiFt867TYa6pd5PorCR2K-TxVgcAuW
X-Proofpoint-ORIG-GUID: qSWiFt867TYa6pd5PorCR2K-TxVgcAuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfXwY9oTfpYK0fp
 0ZhbFmqACCPAmJ7ADCPrywIv1/OvZ4o33PWELpFKjCXgl5TDVpPnXLYsBMV9a29YLRfqetCjixe
 qqeqReBw19Sbsv7zYymWsQCwsUx7Pwq/nWokOuH8IvGBQky/fYAM4yYHcajwgcNB0eELONfflIu
 847bgWhOAEIv77zSS5GMDx4R2YesvOB223kdbRGLIHprltv+ER8YN//sXCiMRDXwIGEJAgSJhyJ
 kVaEom2yofJBtP1RsiN8cWVUtDv3wC4WfNWtTGAJEO9YcPCfjaCe0WdbwZutBjcJxF/txsUKJ+q
 znrAfKiekkpezL8hMGjAbMkiPb2zCjV7mHVwY9TTowUhIhnxtoUpAX9dLlo5b6+BLRe2gMU+T42
 gj4EEyQKlyXch54guYYq2NnnPeGJKkkd6+beASAFhuJ65B1SZ8YNGJ2dpd2jM/DdrhSu9vuT4TF
 kYHJ3o5aT0Ungxb6YHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260056

On 10/19/26 7:00 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:34 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> PM8010 is effectively the next generation of PM8008. The device is
>>> generally designed to serve the exact same function - power camera
>>> sensors and the associated supporting hardware.
>>
>> [...]
>>
>>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
>>
>> I don't understand why you changed my match_data_struct approach
>> here just to reconstruct the same data
>>
> 
> I was asked to do this by Lee here: https://lore.kernel.org/all/20260922093327.GA2308615@google.com/
> and also by sashiko: https://lore.kernel.org/all/20260918165137.302631F000FF@smtp.kernel.org/.
> 
> Using an enum ID with switch() statement, instead of more complex
> match_data structs, seems to be a convention to follow in MFD drivers.
> For example, I could see the same being done in probes of
> drivers/mfd/rohm-bd71828.c and drivers/mfd/max77620.c.

Okay, if the maintainer said so, let's roll with it

Konrad
