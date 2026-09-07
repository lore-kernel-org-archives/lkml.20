Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6766643A806
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771353; cv=none; b=iQ5AN+0iacQHOs4KnCaTZRrWrWof6Vn9zWRtdGQq7y/Ej0nVSZbvWbOTXFQcYy09Id0cidfpzKmBYhtxfyrlNGcaKUpWia1huXg8ecMp7A+oe+ZmHqwB/LfZFnneQNVJMdDD9VZ9HRZG/Qm11YQNL7mS93WgnZ8w/Qq7C57W9TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771353; c=relaxed/simple;
	bh=XOzHawz5Dcjn9dRfX5rQQlpShEe4bIf6lApL0IJkG5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFbokzekcrElKlc+JCViGNn5Oe/EbQkCpw/suJfTohF8MU/xAwxJxKKLpvgD/Q5JAyLmcjPSjQt48qMCn5X6SJiZFgyL3YT5einNXEHu6WZ7Omp6B1h55p47/0lTE8SqodNNGNgz7N07vtKnMfOc5wm7SVAqQJ06zm2FaSOTC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu8E79IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPmqJVne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu8E79IV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPmqJVne"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777WGM2724132
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/rY0PTOhwHULU5ZbkRZBDsGrM086IAdUSUoe+e5W3bY=; b=Vu8E79IV1Q8Nm8Xs
	27AaE6B4uH/AumL+nXBq2HBK2V1JPYGYDsjcKkC/DYIN63KX+HSYIQ4CrO1G54mh
	onwxAtmR0z87l+x8NU2jF9QjarxbuZ4zdTjgb+10AyuNKazXkhsC/LsIbl8LFRgz
	KnqAwKD4VYlK/iCFLXNJ+EeoAC64Fa9y1Il3tgM/ug7zeLG7TDtiqWGDONJSj4ps
	Xj2W3NXwbfhXZQgl2kNpW3g9GezFg2rZ1ugwl37zRBVldXwdTgBQySpuM84au+Hz
	9PBJQ/yFH1h0tH52C8BGvQj7TnBzQ0l55tiFpMzyyS1b0Orx9BwxKRzPZlj6w1h4
	RONn9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkstxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:55:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cd500ad0aso6932186d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771351; x=1789376151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rY0PTOhwHULU5ZbkRZBDsGrM086IAdUSUoe+e5W3bY=;
        b=QPmqJVne+K8Il7+7RmfIwXwfTk/KpXeYNdZo1a9MOYLwDlAfTEE0zMmemIWa4f+GOJ
         PTojncG8ew8uYg7K3wg3lGs0GtxgDyJkRglYyA3saPVrJg+Xqi7GOTMcShdpYWz7Q81J
         Jdsz5Oy7LFoX2FaO/xR7y+GBH8hmEDvBcOqKFs4J7vYBjS6/aGfB/NPrx8gSrCryh0zl
         A/OFqpeJ0wUYtlAerxs9rZh0lH/pNBSSYn6DSIR0FVHrH0on31IkW2INK93CKFy9As3t
         pZj6Z9zrx76OgWYxQaNyuN/C0N5rtooUU0u03WXadS5kCpSx7lJ6c6b8EDIhqZILY7a6
         7D1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771351; x=1789376151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rY0PTOhwHULU5ZbkRZBDsGrM086IAdUSUoe+e5W3bY=;
        b=DOSjgcvkl6J0SFXwb8Vk7lno4cSv+LlyMNCJx038MldwMarX54t//dQo2JoVi7kKtJ
         wl+Mc4Z6MfoDOR0SGzwwqrN1b2mkotgpzVJNwkK82ntSImt323kiCzyil0kqWtgkiVl3
         pTgas9n5gnCcmFPA1BUPwpxJc4jRuYD/V/bby/x8ezdkhacuNe1Lk4ogi+ERBK0WYwGC
         +c5vVH+dHsgh5djQQrGUSbJ/zf/f1i/gjyDQ5UmqjgcBFOkhfEERdpa+XDY5dMt+mp6c
         cdurUKIupIkm2INjSWhf70OI7D3EIffF6ujLHMgFV3/xHg2R0wXt1QSxB1Z5q5hbevbS
         3G1w==
X-Forwarded-Encrypted: i=1; AKwUvBx5M/eK9DkTmQa0WPaOKus1cIhuneYaPtvwtSLj66HGpV7b4YFL71qnseJhY7EVAUBIqXiyDf5KxhRL6Tg=@vger.kernel.org
X-Gm-Message-State: AFuF++lMCdVNalRISeuru9itNSgU9mx59qstR9JFreED+VKsIqGi2Z+5
	1ZIn17ba0ov3Akei7nxVLSYO9mhcxYDPQ8L9oX9b1fZXM/JbaUHk73F0BBuAwG/n9uRA1zZyq26
	HJTaypRJALADPisLW2FW/+zc2+P3ximC38/R5rciktzRElRBARyg5tNzTVaCvRIS2/nw=
X-Gm-Gg: AYBFou1kT/7RtK3aFomshYbqh5cndubKIhDRE2GCMvClKZthjdjT7/1FIGcNPqa5oVq
	TZSDtSDqeaWJJC6lpQ6PpkjN5PRHRecW5Zl6vi7cvbrn/l9FRBT8adMJPaW+zzJS7mQQ9L361/T
	Sz8WI2Ml7akeXkXpS+UUm/rclvR7Yo0DkTbgvb/adjp/wAPj0viFMB178mUvDrRdwC0Pzj8Ksxo
	f24JEvIVNRgbgtlnOyMxlP+39aZxx00Gj+x80SatFeoLG6CSW0P20E0QJYlTWVj7IQM0fjSTgyf
	TO2+71zWNHsNtrNGXJM22o5YEzCarIMWHJ5C5Dr2jzz+fKOiIpOHKgWMujPa1S6mtalUg7iTk5O
	Yw1s3WaOnk+c8obLg6EgbQw==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160419885a.2.1788771350624;
        Mon, 07 Sep 2026 01:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1160417285a.2.1788771350124;
        Mon, 07 Sep 2026 01:55:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm436417966b.34.2026.09.07.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:55:49 -0700 (PDT)
Message-ID: <1db9a798-4935-4fe7-a2a7-a66791e75a6a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: ideacentre-mini: Wire up DP sound
 names and VA macro
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-6-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-6-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX2JxSsjdm6M5n
 jzGCcb7BLaPa13n8QxZOJji1H6JzLnA1dJXCvYAf2wbuBVMRXqz6hxz2/YiQFVEpAcWba4MKdFx
 JNhONKPyAgCKKU5Tssf+QQt+np0KHzuHtGqzC+rqV1ZFCL1sZ7XF3Ac81V7jPzX0NfxR3dCd8xi
 /02hyoRKD19VDAJ3TNphy/hiLupQQP8+kTNcwQv4dzpAgMZMrWnW81iVUmIVNjHA23dQ4gTbTLi
 6Y9BLj2GK7GzXaDHpjBEgjJ1dztF9ki9lKyd+I6KGyWuEHvta3p7ETNfPNPh9FAiL39daJxwy6y
 oAc0f6UiGhTDef4rOJHXKUenOK2XAZFGqUd1JbvvMIppcbUHYEzMjTDcFdxHEIDqCP9YHRuVEeK
 +CZpCYHUhmTIYVMu5thDsXO/eWBLa2PFsswWVtKMlG3KHGygZgnK8RznqZZI43Sk5jQ9Omw2yj3
 BHrPZXxCbtsbS16vBOg==
X-Proofpoint-GUID: zZI08fNZwq5Z2QfOwwD-YLHIyxVSHnSa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX6PcNCu/n8R9H
 owoM1wt2D7cedGmwShJ6/JuHKCb7drY+nSJvV8/N+EWWurZ1tl2dCB+kvnbGZ61otY5LNZSHqZI
 JXONC7lnpsbgQ63NON7YDQ6HyA6dizI=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e7c17 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gxl3bz0cAAAA:8 a=bNFII6xwy7BPjvP0o-YA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: zZI08fNZwq5Z2QfOwwD-YLHIyxVSHnSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096

On 9/5/26 11:29 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> mdss_dp0/1/2 had no sound-name-prefix, so the three DisplayPort
> backends were not distinct DAIs on the card. Add the prefixes.

That's now part of the SoC DTSI

Konrad
