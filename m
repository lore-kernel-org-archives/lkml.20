Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB44530E1D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951636; cv=none; b=AUweJZMXfH4Nqg4cwpG/HIm7ja+4d5QdGD4CbWgjgC28hVG5QVl4Z9DLMv/GGtYUWR8O4qmXS0SdSNSFNNDO8SdvZXW1dL+sHDb5FljImo6R1z+251mZr74bnZ0449Sem3UUWoWC8bCdebcxtNuhu6dTkjfiBZF3+Lm6fJr8ctA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951636; c=relaxed/simple;
	bh=BpZU+Csbr6XAi4Uya3364FwpsUxyX/Gtm2FuGJ0r0Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dq+1ipb28VHF3BrdpK/sCjJEg/O0Oh5QisvqSo0b/RmrZm/sSQ256teegRYXnsLCKqtehP3Nq4C5WJNquykHNHXD3VO41UOXJ/7qcd4y++rpTgWaS8Sjx/l9KRaH71CwMGbU8cZV4S17b/n6l5ppe2xpTVicf5QKIhmvyUA/rTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cH4zVMhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc2SqaxQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cH4zVMhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rc2SqaxQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Aq4hP2569822
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=; b=cH4zVMhTMuyO21jy
	30UgnLlKC0zv279sZxMCK+xh5RiN5zRsalXPfLhUQ+C28JTBLAfQ8IvWaoWYV7PE
	UzPSVYD06CV+MImUo99tggF3kuSifr49YyTuOd9XVF48p73nU75E++tyKC0/apAK
	YdDb13iTcLzj1TgL9OAP/9oRLiuYdWw0s2UXEkiqcUoQzU8wYaBxUWfSYhMTPHTP
	Dq7s4CXX3VjbCnjO2mADXjruMYg4KHjYd6ez80ETI+UMCKmiVc7oBURqpGfxklyl
	4CVptdJ55cSeRHfpDxBUrHKRjXK/cBetZ+n/cQ11L+7ZdeznA02+DiJBvzARwaUq
	UZZFfg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3p4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:00:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78ff33b2292so12786137.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951630; x=1789556430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=Rc2SqaxQWswonc3Vgk7Q8btDdty1Ts5lbN2x21NViwZulJYXmBKf58Unjm7dgVP9sI
         vuFeamDXhtKjqaEL60dReO1PohmqLggwfKux4LKpcRHSbKVgMn/RJGUPPeEKKsK7J7fj
         oULOb63SmVGsgkp0F0NafJ/2LUpAZPt1aBkfRlsoo1q5C8oGssa+yigeAW9N9/4Pd+wN
         N0bA0FwyCs30etEuwZPMOtzTkinrhnooVvi4SRQsvo3s/1Jq9xZJhPVSBDl7BE900QC0
         GI1iGDBjr0cdco3XC+2LUtvbVlx7vqs8m7O7XspEg6k5AhZgNwIrL+ymSRW4pAFlvvzp
         bUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951630; x=1789556430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=Z0C2N0I0cRvavGPfcNdxY5L78eXSaiGPTQqnKpefKnqcz7+lONUjxNLSAFvX3IQmR0
         oIo9OUrybaQxLZzDHjeyz1yuUJEAiN2v2zQ2tFO9oMMFYMTYgto82ZLJ7Ds2Bjf7AXbr
         IBTiuijpsfLNMc8UVaf2+eUcV9JFhRJuEOI6gJxDG2ky+QO9+Of04CWSmgQlUWrUBQzy
         cJjhBULYdO4629VJ48+RlJkRgekn962KxT4ienQHWTrDs9F6jKw979s1GGO0nWT4IuRc
         s7fWP053uDm5C9bdq03yWX7FQ86JG+du7PiRlmll+5uSmqfZckhdtifLQC87mAChMlhA
         CiDg==
X-Forwarded-Encrypted: i=1; AKwUvBzGQHKSrNzEF0CyjMWZeHbpjf9+r/YKl4DSnLabZzJMk9HXLN4C4DOGoXIUGcbOQmY3+JQT8n9RrYeg6sw=@vger.kernel.org
X-Gm-Message-State: AFuF++ly4RKyR2JALZVsy9rioW5/HyLeg7V+DKewVuN8m8lZiugpMvR0
	g3SNkofoOOgortdSY7DY4iZYhlo+QTbP7xyCvZoUP1A/8AheyqRz3FXVpkYUeHlxTTOiSatod/D
	hP83XjH3e7L0SfQ7IwhRnjjQWWW/5D/gOO8nvZ+KJU87Lvz7erZTKm/h5KBQdaYq3JUg=
X-Gm-Gg: AYBFou1C9OVJxr/YCMJyQHtV9m8/IFBoX0nQ7BY9WSR73JEF3/HeQ874HG26aNKx4sl
	rk1twwY5QwGvQNlG5QOSwf1qzkMqRtDc8pUlwqWAKvS461IlBudSJ7H7Jg70YBmZGq0zW7jd/mZ
	h/tCFkBlJZCpARERwjVNBnxKbBp7Gqsdb4OvYhp8xKza9cjYP9Ik4CxVy7Hs2lhIY2nyac9NOTf
	XUd6IAfVVgzt9lIOHxSUWsuCKfPj7SrCuVK3u0CbzP5JhypaQEuk01llyrS7rsdd/Jd5Y2SVzSv
	XmZT25R/7TJTAzp6L+U80mV1iZfRfqB3KicIpiKB4YLSD8MBHiBqC5Dcqbzzvvfly87Cj/FG80/
	jn68o8N1JWcu0ScITi/C+dg==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465033137.1.1788951630528;
        Wed, 09 Sep 2026 04:00:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465021137.1.1788951629956;
        Wed, 09 Sep 2026 04:00:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a49e959082sm3022831fa.20.2026.09.09.04.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:00:27 -0700 (PDT)
Message-ID: <0b999fca-7441-44c2-b6b6-a092c30cd65c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:00:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfXwfiHBKmSFFhi
 /3c+1cErhpITUsySGf5NzjGULfdVfyW2a4+ZsbfRlGHA2Ot/17aSialJPKVLEHd84PP3wbB2XlG
 b1yMWTwt0L/YXzJpySIY8ImbanWyQELUgwXQOguMgnCDBFKN5LpeYCSw3ep4AAA81dyUsUiuLxd
 XEKmIrYP3C0slgPaK8waSBagnGJUdL2MumphoBe0P8tzAxQsfQjsuxpd9Q+kz0APcXLiPfreON4
 GaCQCy+GK3kHQJ/l6UhSz2b4dSs5gYbB8ZhjEDFzibq9LEW7c4WmOOjufrt3BURkdeELRksfGRs
 cyznZ4V6CwcyI1lIl9vAMyBY4T7q1Qtk9N05OoJoNFlvan1gou6eNanhqC0XeI0mvhOGp5szXXu
 uJI3r2ww2u0y15RW6mqlkVFsu0/Vb+cggU5YOJS1HlhYymjEQd1g7IJBp4wGX07ZJpbraUzZL7r
 jqz9i4kZuO+iBVgwIhw==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa13c4f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 6_mJOOKdlSTfgGjECMC4gQbF9KsTG8rM
X-Proofpoint-ORIG-GUID: 6_mJOOKdlSTfgGjECMC4gQbF9KsTG8rM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfXxUmbQrQavioB
 zzARW50mLWIZ5idfR1gIKRDcYV+gvpgoK0z3XPIYKIixFtwXDyNsv5OZ/54O+7cB7IpjLeWOGzH
 8CQhY3HW4sZg6c33gSjcawLyKnG/efw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

On 9/7/26 5:58 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
