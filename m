Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794611;
	b=ZQSfV4tKRsZBsQrbXIEv/2yYtlyjlJ8jUNno3OFZ4qOXGMtZN684+yymPvylz+HLtLhJ
	 8btY+PTl6pmpAvkCi062n0HruGLy0lt2W/iFdBsFGiHGDtgd5bF3ZTjmHLGIES0qU1LlR
	 U7B7QBFvtBTEn7kUv62q4KX4KN+t8b5FFdmxKRTpUaTdF1bLbwUslTHRJw2KxfviG0NtK
	 INfI/jXYghoJ1+Q8Ptwb6ISLUgY92gbwrQkyjDGlPY5HExUnbxc0wd6xsRHOXCL/ltizy
	 i95P/pq5f7+z0e2S3fId8CeyxZXvpSDoWeuhEAL0ueUM/dJXMVcdtV5hcKg6ybc96+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
	b=qw2DleZJmNt2sKW2/bZSgEcXf7EyTgQ5Kh9R91tVs6UQ8jiby45IivXkrds6spZiiAfe
	 JzMZoAABVKtT6vN1iULWyXF1susw0FXGPbPmujTYheIXFQ00vYIQlV1+pXHnFib5OwI9m
	 GnHNCsRUayqVXQYviNQFiC1mUWGY7lOSfaFCi2wC8PV6h08HQdl0dPkINfJI8PXYJb7BS
	 JAx4sWIaHtw1iBtFVmuAfWEY9y2D4IlaNUolAaSXQqFkvwoqN+S7QyelWVO+9Bafwomqg
	 ktXF67g5zSJqdeqIuccmIutkC08ll6SFLPQjqbiGujbWeDj/JW9/f5S2sZFLbETIosw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5ah1Fsb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKZCZg3c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD7F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5ah1Fsb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKZCZg3c
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1KuLR3890753
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=; b=N5ah1FsbeT0W4Wvd
	aQ8LpFyVl+juaE5h9YPvH4ymv4aBF0E7lV3d/Y6FbD1e+cpTzke0vlO4S1DB5BO9
	aEv/SsPShzP0YbNU5ggpZkOfKQx56WxIvGU9NlydHM1R9aJB+2tjSrx5R9WyDvhT
	6AdVPKZUkvYuh2+VifsxyoKfYD/D1mquEGIhisIek92rVW3iHYS/xFZ1TXAtP4mS
	cfBk6fC5pqHxbKk0UB4AOvMJ5EgJeKH+64++uz0deZ02T1beae6KPE2VaWq9MXd1
	UoMQyxF6plOaNGrb27jIDvcqpsnqgmQoYn2ke/kIFa+tNwn+DlKIsM7yJAmvGmuC
	FjmNdA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqme31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:03:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so2373878a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794794603; x=1795399403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=VKZCZg3c6WEAGDA+GFPc9kZ1v8GUOh/TKaP62P/eeal2GUqHORTHNMyIHGZbRb2H9+
         00p7VMh3kaQ0sPF7uIrluwzsBmfLDMmlyrLC4JU+0RYybT9LsGFzLH9bURqOVGR/P3L3
         ieLRDqDMn8bZJfN9MpAsiPO7ldI+SYOcOqI5lo4XjX9jFkrhLWHB+VjfSSJIKrEhMyhw
         IVdufq3Wj76DIe6C0Xdzu3V2S7qbjK1IkX6x4QAcueWQHhHmig5ClGf3zWcNK9nHuKOJ
         71C+UshXwBhwucUZeGLaXsqm+bbXasyy4g+401zwmjJ/nu1PEb9VgGJ0lRtQT4zjzxuv
         eUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794603; x=1795399403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9UeinhBxfqxsLlFJluuE+xqGWcUT3hi0lMKGG1MyGQ=;
        b=P324MzxWxx1+E/yRkLMKBJ35QWH2FtiYFlr+4lN3+50IDtk3FzBg+Ty9/UbziHXyBV
         WUn19xbincXS28uZNhN3s2ujHmAm6jUcgzm7jm9pUjp81YieiRkGtYHXY+5jE4ezHt1X
         Bis0KVHXdWwyaH/9QW4DJgqVK2ZNEfjeT6cMCLUuXAPL4gsQ2O6yQiZMYEp+r6xbzZF4
         RjQlyEl9P+fkN90GU2im5DokwLlUzdp9WxjwFNgCwkWiKommsahuY6WBjeTCyfbiK9w6
         BZ1sASWP1qduVhiyauvnmxNCbIhHljmCJtMmlQsRrlNU7JVEfXXnr/kPqKlg31Kw8gmb
         I21Q==
X-Forwarded-Encrypted: i=1; AL+hErGJl5FZTR554MRTh6Xf6g8xzFplQe/aB+tNBxWBNw7pInMM/aprDVKPZvcuP/Ht5ZAZuL/3OVVJJ3q1aqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CWkPzq8uUlP3NJcZ9T9An3A8yCzD5/V3qbTVz4pdyFqx7dd23
	wpb4KZZOrVZrQi9kCPIH9fNHSfFwo9S+X0PdsW4zMvPhhoXakd85tjYvObrsDlguNfTDku5nSEJ
	0teHL/4oMMRTr1g4s6rSpXGU1YLVZvhJ9922fFLi8dzZdPoImSH0AcHdM+iJ6VvE5UCg=
X-Gm-Gg: AYBFou1qvbtTAtZaph1rGI8uItadNMguXZ3qA6l8KL1RuDeRUjBC4FzYdu1jI/6MSRU
	Wa88Npx7oEQGOqq8meDfi7RfdOXwB+cj+5IEvit7csXXImZr3wLex/n7yIcG6cEp8jTOlOxceKD
	117cqFcZFdbljeElJGpmtS81976ooAxcwvs3n7ESFacnqHaSmZ68Ubs2Dw+qHpSiy+9+Le7Qw2Q
	fEUXbJAX1AX3vSxYSsiva1usQ+ECD8YdkBBRd4W14XL8WohTvZ29zg9ZXn38KBCOeoxuKF92JuO
	Z6NjTel/Z0VQgD5A5XZJgqTr0P1gvJDVgVkdyiOCSMk0APxTy3mDSiA1/KCekHWLUQQSUWlGwTQ
	1gRUc5ZUwGIgkTjUJnA1bgCDCmfBJdBHG7B1bBwoWQjM7UGY7xGNpkP3KcsXV4kAMoK93yTJvxo
	aCU0/DBFRQqYYxNbXZ5gI56BTHUuXBDuPjPT/U
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635808a91.33.1794794602558;
        Sun, 15 Nov 2026 18:03:22 -0800 (PST)
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b1b0b531b1mr8635767a91.33.1794794601836;
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm19748961a91.11.2026.11.15.18.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:03:21 -0800 (PST)
Message-ID: <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:03:14 +0800
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
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
 <20261111204322.GH9176@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261111204322.GH9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa646b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9Yhdbyfe_LZq1WiuscQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfX2+bvT2qsGfoL
 uIryhAVlm+BfGPvY3sSLloXCiZtGYnQ7SGVnWAnJTs0SUMkilRKiHT4RExHmFOdRse84yecfk4y
 U3TaZXGon/g5omsQIhCZbZZWDI26JEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAwNyBTYWx0ZWRfX3qDYv+vzWqOZ
 5IRopbOvqHxLjGWs1hjJRbBvjqzxUYZicXanzs7oYm4uxyqd2CCSerUCO8cf3QfNuo/x6rGlBqm
 0/u9/XLbIKugskOOF9zkEvJTvddFKwVdREFXV8eOm4ENRB3H8v8QJAxe4S8rTtmxxQH9hpdLAs0
 M8khnzuO/pXcCAzWW4eedZoLwoJ+kAAJSMgzitueNk5jpkhIDojYvfsnLzAtVzST6wia8BE9uni
 Qsci6Njwiqh35VKEo4AVw+92QwwMLtS3aPyCcSAF4b/5zwUz1rAb+1I8RxQFzijEA2wWfjcesSw
 jDGjH1o6hxG3qYJvJEUHSyHU1X06a4FcDyMIFIjorrAOhxuF0EFe04K2j91Ua3LS0g1lP5ftAz/
 5xPmby6kqnvlSmA1LJDzzK76R1ka71I15rRAVCM+lxoXu5UCs1zNGx6Q2jB2UxVBZSk3P6zbTVV
 FoDdIMVd6SnudZkmxBA==
X-Proofpoint-GUID: SVBO3YoQBZK7qTG6Sz8T2jOM3wf2NIsj
X-Proofpoint-ORIG-GUID: SVBO3YoQBZK7qTG6Sz8T2jOM3wf2NIsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160007



On 11/12/2026 4:43 AM, Leo Yan wrote:
> On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
>> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>
>> But it works fine on some platforms? We have a property to override the
>> peripheral-ID which would solve your issue. That would be much simpler
>> and avoid the ABI break on any of the working platforms.
> 
> Looking back at the earlier discussion [1], Jie in v2 already proposed
> "arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
> mixed together. The series later moved towards platform-device probing,
> then became current shape.
> 
> Hope we make the right decision on arm,primecell-periphid this time.
> 
> Anyway, I'd like to apologise to Jie for all the back and forth.
> 

Never mind.

Hi Suzuki, Rob,

The "arm,primecell-periphid" override is the simplest fix for the issue. 
Which fix are your preferring for the issue? If we want fix it with DT 
property, we can revert the patch series and I will post a new one to 
fix it.

As Leo mentioned, the AMBA probe is not affecting by the series.

Thanks,
Jie

> Thanks,
> Leo
> 
> [1] https://lore.kernel.org/linux-arm-kernel/9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com/

