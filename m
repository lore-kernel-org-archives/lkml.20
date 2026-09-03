Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7599528C5B1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422188; cv=none; b=VLfkT3loAwM96yEy1MS4Q9lG1DwM4yFRNHbNemPoHqNfzAuzrDnh3muz1j2DDqlKRWzA6MjeEs2cUU1/KGJvSRdTb1Fwy7fP89gFY0ZZr/3AY+fI/mUlXudGUmj0YOajW0lPpRJ+cgpQqds3eJJoiLtdzO871HCudQS6o4x+5P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422188; c=relaxed/simple;
	bh=4Qc5+bea2kI2xGzw0WkDPMlUpgCylUKO+0faw6tO2IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJ1/jUvh58zCAnkhZ6XDhE9vcHk4SkYV0drrCo/iZwpC/qyR/VA+ybphkzOTuR/HZ7hmMJNJt6ib6oLkOY6vWDqrDBc5o3C9nAwsvxzSNDcSBUXMijfVghlkT+UWA2itDwXn2SIYKurUEMla4AHjd2AvbJPRml40ec3QwkivzvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyTelCTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmqQOTmp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyTelCTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmqQOTmp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lQPX2596699
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=; b=FyTelCTD1dOsKdch
	7HScrYaM12SfvKsgHDCiNPhLyPavKw7PUGL+EJO4VfCuWWT5YC05smHrZOW1Eyr9
	dwyJUDj0bZzA5Ih99ZjUhfQlqNEe+DW+iffjmLbxlfWxQQq5G5/8hPD3kvKszLWy
	OqTfdDRmOAgBPqbJPfyBlUq58UcfKIjXn0aaQEem9xtNFs2KVPHlgWAn0iacyqSQ
	ggE1kP48m3XfHzlgJc3sMPaSkSo2h9mV51Wy5hd9y2uSGhKnGsW1mK5YgFUa8bR/
	OSCVv4LIulO5XBWZBCM/QHtUMXykrFB8jz2Xv+ee6ghPevK6sny8eSmLOan/R/kH
	9g3XKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja48ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:56:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so49281885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422186; x=1789026986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=;
        b=GmqQOTmpKsXRD6fm9KPLqDFmXrDP819E/l0XU+HJHX/25chdncyJoSVaG/WX1yigVm
         DmVQUTMaqGbNFexSR+t1MkiC9napPQU5XV0+Og9/qKk2xGV+XjmtkhhcuN3EpEgIJ9VA
         tup/gqR71SbSHy9iZhIw87eW2Sh7vABIwwUuXT15By5VbmVr4BeO3CK+JsCYL+shCSa3
         c+T08Q9ZX4o+sE9ayODIg6oAi4mcKQC+KN0WsQ/luDTCnJzjFFksSO0PQX/oJjUhu12r
         M5QIU98JwPEhQJkeFbyJ1yklh/yE6skNyd0X/y1ozfauOffPT1X15b7T9xHfUua4tCuW
         oFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422186; x=1789026986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=;
        b=cEFhF+5fGS/ZRmJd3ZSqXQwICJI4Ri+mFD2fPKSj8JfVhuCP1yIUwgRWgbEHR/zsn9
         trw9ZuGxyGUgen9CFBk7urDgoaTZv5P0JIMis9TKkPsVrKwLK/20uHIM05SGNkTH88FJ
         vob1B3ZfmQ7saazCC/l1fO49vXkZVVLfrCVvyJTAalkO6dmfCWxpdvS4bA9x8YBncGJc
         aZfMFYoEfQBkSxnG2YiaMzg9SdA98P5+lxgHDZPRW8Yf9CnuBSJq98xGxvpC2ws5x1Q+
         WctL9LPkMrIZfjvKtXRy6IBYarNdFJQnE8+Ucf/RY1HLgNMtWDq7AgMrdmDgXmzaYCQO
         kxkw==
X-Forwarded-Encrypted: i=1; AKwUvBwPjv04adkz12YTa9+cJzu+s3FsYXCz3aN/lGSTDkRQVHuTAkq0uimkMDjITJtnAOrTCySPyBuykh5tY/c=@vger.kernel.org
X-Gm-Message-State: AFuF++nMp9yKcycAuPL5E847zFfKv+ijRAP5j7eGTSUe5eUWfL/qI23K
	WZkHI4FsnKqlKtG58qO2PkvKASTPm59yUnyOtZ037BqvYO5p8/bK3BIzpuZmg/XlK0UMNlt19v8
	xvcSUjmxzL8FQQnU67AEx48GSeffwJgsmWQyplnOAYCY/2fkPkhYK8tF+SGJlw4kKAhs=
X-Gm-Gg: AYBFou1r2JRTI/Ctgad+RW4PHvlR7/WDZE5EZd2O3i9VhB2VeAZOr4OsO5BQuIFPf2m
	amUS/E8jZdqEqJQVpCvq69SP2MqwJFQDaZP8FmSIgUGgXADApHCClvvWnTIYRKJPPBmjP9ywOnm
	5SKsohfg0dDm6s5NCJ1Z+X69vWyfzGGuRvQMxdnCZj9w1VWnksLQGeO352czmmcXlrggabBV9Z7
	jV7IvbJDb+UrpoSXPUi2g/4s3boce9yEn8K2+CqSYM+qYsfOtn6NJQq/YQ/XRlE0tX1cAS/o7RF
	0aKUP32jk9/8PbOgfZbFXVqBfTPP4SHmlfnIaawMR/6AHN32/91JePIHvvbW3oj+s1zDWxIPnhq
	YJCnctbNCKv4JJqssyWs6qg==
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr771694585a.3.1788422185528;
        Thu, 03 Sep 2026 00:56:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr771670985a.3.1788422180245;
        Thu, 03 Sep 2026 00:56:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eed0bfsm60697366b.7.2026.09.03.00.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:56:19 -0700 (PDT)
Message-ID: <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:56:16 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3-6xC7Zl9pJ-W6WTPDZstXUWjagHrfxZ
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a99282a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PnXPAKEUq80feH0KgGIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXzzK2xgvAVmW2
 tbfgOcjTfBryb9B9N/oXCQw0HmIcb+94bH9m3G7EHQuMUOeqFIKojXJQh1ZNSQdHDnSzpZeciUM
 RsTobZF1oWF3BCji1bUyY7K14ZpW85Q=
X-Proofpoint-ORIG-GUID: 3-6xC7Zl9pJ-W6WTPDZstXUWjagHrfxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX3qioLbdmg60A
 i62vflbxtG1Ie69Eo8N0fdcrKEBy1sQWfm45U2FC2YzT4vEYMAJlDFK324HuMQyrW4qzmgwUSa9
 XGxJ5dSdBsoMG8WZ8sFJupQ+3BMhHgQcJ7P/szScJvaC8UttZT5heJomASqi++3q9BY50jzth9z
 ADa9VkL5EDATXoXB1MltyZRvHJkgY/Wmr625Xz6datASjPzW4WGjHbKnAMzLJOyzqk2sUnlyISF
 Ws+4N8AB7skYsg2d33Q9sKfDV0k1ObP6s1oPPgbgMbL83JD16/P/ccEc9INa+Ol8LYjWUDhiWFq
 6BIXLLjr+LNUWB+pdFbsYqWmik4jdC5D7KQYCbvXWPAUznph1knlQd10Dzb56egxSyCcyjusiy8
 sI5FIuAaOCP9w2wKkBhSpChaRjHPKqDvU5wURRAU1VqF/Dbk7hWgURHLjL/TkTezHuZFTVs/ZeR
 vqWaltSEePfJhZ2K7pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

On 9/3/26 9:40 AM, Shawn Guo wrote:
> On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
>> On 8/31/26 5:21 AM, Shawn Guo wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>
>>> Add the initial device tree for the Nord Ride Embedded board, the
>>> non-SCMI variant of the SA8797P automotive Ride board.

[...]

> Since we agreed that a bit comment is useful [1], I guess you are saying
> the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
> comment aligned with nord-rrd.dts.

Ah I forgot I said that :)

[...]

>>> +		vreg_s7i_mm: smps7 {
>>> +			regulator-name = "vreg_s7i_mm";
>>> +			regulator-min-microvolt = <300000>;
>>> +			regulator-max-microvolt = <1200000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +			regulator-allow-set-load;
>>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>>> +						   RPMH_REGULATOR_MODE_HPM>;
>>
>> Are these actually exposed as regulators and not RPMHPDs?
> 
> Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
> here. I will drop them.

Don't you get a huge log of errors with these in place?

Konrad
