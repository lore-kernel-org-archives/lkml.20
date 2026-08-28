Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B812C534
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922951; cv=none; b=StIqhE8mwyZhMcdNuNZqbnCurUhBtKy/PEPlblpd297AVcupEKILq+UI14sJAOd2hn45TCvFufwJn+NPiyliHSU0rWHTLK8IwEuQ3WFUs8sbimmSMg2HoVpGjfCxAQ9mkM8e32GRcq3/6/tFPi7/qkWP+5amKb5IFg6jMvshSdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922951; c=relaxed/simple;
	bh=iePCwxtbzLSdZC1CQ66MmSNEzBXjyySM5S55IHQlS0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e05zD3Ad1YdTyRs8otQDuTTflEk2RP5ZYI9zu6CfzCk5MLY3JUWMAwWr01HHP8J9y2j61nmik6SKR3xvgDvGmLzrguwqoWGxb/ztBBYZxXIVX42pjkE9YET7kTW87BKvVCFE+0rJj/THtss2xi4j7/c/kBnlA+Hkyvt4ah52I6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvvTGBUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FF7X7I+/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvvTGBUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FF7X7I+/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7ROK2061305
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=; b=AvvTGBUparWamklC
	OOSNQ20TngU3RSWyETRpCQ43xrF6+As4y/JMCHxytpUWxc5zdKG2if/ppy7TeH6F
	8JoA0OiuwFhXmBZiRT/16d4kPM9iptm4fgrkgaQdT/9NdWVwMoSGAZ382FfwloUZ
	OTPNOG956WdudxmTDWN6JGWtv+NSammzQlV6ID45JntPG587lGACzNcpnr/sb+av
	b22v3gVzjV3iNMfXCNdG2bpud4fUEFbooHgpSP8otlAOXRFbb48WO4uvgKl4ZL3v
	pUQ5i3+KE+20nn6c1zMwGdWdYlaTW3NpjYnk7M5j64wCu3yFyxGs6DM2Jh2/lpMf
	FoOKFg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu9u8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:15:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77969cb40dcso18337137.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787922949; x=1788527749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=;
        b=FF7X7I+/h6U2Q8FkIQyunOiDW3ri+CJ075chZOZ9oLe+PyE4S2mdpJqTUBDpv8jHG4
         ngV9IEtP6n6ucIFo5dGGOlx9Rx0uIj4dRrDLys7WPeolDamBdeM++/3RGMk9/pH9H70U
         77iLQDQpMHfw+GuRa2CIQEBWJHdEEE4mh/hpyEMC7THN2o8RpD3FxwUiZGFleupO5+FN
         GePfRyJ6KIWa5DudDHbk/Mul8uwulc8Jwr+iWp7+lTrY0e0DZtQw1hSRldkmkuIsmYtw
         je4MchUn25Bvf/TtlKtIB/j3eWta2StWOo7SOgFJe7WaG01ZeufPXoI7NonzStaUM6oo
         Jlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922949; x=1788527749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=;
        b=A3p9GhmdeVS3NL8ZMdVlhJfrZoo87wy1jB7K8jk+HZY946HaiYzftdAAVK62KohqtN
         KKlvV0co816or9COa7FF2w1Sh50T0PM8CkYQvSsSemL1yNQmcX/hoqv5twJoJSGu2WRe
         KjVA6l+AawqgFJ02p5WWM7Rg/I60sDOzmCWPX9yfR5aG6w1KcZc3CophLLt+2oqmPZw2
         6Pv/ArxB2VO+GpFJffQyX2TuvS0jqYW/SAn0ySfVSG/EMCsWKIQtrUIWeZiDJ2CcHvBj
         jRtyNUsvTNvdCgespk7HzwU/Msk+yEjBoRF1MnhHJphZwr91KhxJZG51t0xFJV6Y+Uf9
         /2dQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCLhrP0TDNttZp/pgw7ZVlSBahPLnJwaP5oU8dTI6/KEvVAlEMPVCId9QGZD3J9nAzlB+x7WY1pRWbiT8=@vger.kernel.org
X-Gm-Message-State: AFuF++mekKfCBJmNRvFmVSCHlIjJpKce0jleSG8jc5uIF3JVip3Q1JJq
	vMwKvTqrId8pQ7nE9A3wLTuX59iMQNRyl8i3W+gKHhu3I3tYZBXnu8xCmwaRW3uPjq/NfHwOu5J
	fHJG+BwEdOx0bJMw5rDLxSCayjmhK6wDtUKJdRmn7eLvuV3Qb6rLr9tPVAKcXFrFYTjY=
X-Gm-Gg: AR+sD11F5n4RKr/HJLZnvd5p98IQp3iMjkvXZDoKH1BH1aP+U2xKMEa7+T/kKmoLNGS
	1DOj5TvDS2m4bpJN7w1Wv1YLBvyj/kMdkXSKPP05tDcpCNFF/WGZP9ilYtLqhKHss5gstyS/9LZ
	6XpKWhRpY906BxWs+YoF8k6zOTUcqTnRUPuNlsDBMZgLDaYKnqEY97wy8vrMFp1wCnFodDDfQtT
	cqkCCjnTUM7qgT1Tg5aoQyRmh/AJCVkf8UIICbt5Ck5PD5UWGKv5khLCV1u4qgQ5yq7dO18w2iS
	FKvo7DnQb5043grtxxsmBN+VqVQO5uI+NggCoSvAUV+zL/UuVN5IMcOc7RDKdEeduO410VHMnC7
	2R0dqgX9fOLnZJutJeZ7GWeI=
X-Received: by 2002:a05:6122:6b86:20b0:5c6:56ae:2534 with SMTP id 71dfb90a1353d-5c681519d46mr752283e0c.3.1787922948690;
        Fri, 28 Aug 2026 06:15:48 -0700 (PDT)
X-Received: by 2002:a05:6122:6b86:20b0:5c6:56ae:2534 with SMTP id 71dfb90a1353d-5c681519d46mr752259e0c.3.1787922948209;
        Fri, 28 Aug 2026 06:15:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm78819966b.45.2026.08.28.06.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:15:47 -0700 (PDT)
Message-ID: <673359ba-7249-4e0f-b5e3-4c729d4fe6fc@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on
 external DPs
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a918a05 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Uer6SED5Sbd5OPh8DIMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: P5oa85sH0hBcysMHLt9IxZmV17OQpGDs
X-Proofpoint-GUID: P5oa85sH0hBcysMHLt9IxZmV17OQpGDs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfXy1gDUM5n9pGA
 LRarFFwOMmHJ0mEw/pqVIIxtN4SQk80os+QuAqC76OV9byE8FtzxZ+2hX7FeWO267Mgss6MZapy
 1ZaM1kM/yCU8dNSsSg+sGGtFjYvv2P8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX69d2D+t7nHRu
 IOdXvpFdnXpwukssyBQjoG3LSGBZ3eBQcRghcxQdTbIOjOLR0/2+59EYcAqY35UbKow57OAmxXQ
 m7MTMQ7EiTtrbP8t4Ux8xB+g7q03EQc9rPpwPZA0hR7pohyEPUL0BHtENo+TMMR+xESl3cZp+NW
 WsouZEiZ8GYy2Tu5MwdnuzLDQqWqA+6icGsFek0yECpe6s7aCE17yAI2BGMGkEc2ov28DDpxU9e
 v3OGIkDCNImYz8N3hky2Pxnrni2fMrb4gqmGhHEHfoSAVdR6AuWV5v3fJ2AUU0sN9KvIwQOTnIn
 sIch8E/qJWjQPzUSHTC20pfuE+26ImodNHM59p7tzkfOQOKgE9lozvFYxFquZUGL/kAEzkangU5
 KTwRmrWgFW6S8fjRIXPARspxcr3rJrkvTnl3/FkdOZ7hebWfmuMusI5cqUSpbuBj4jcVrPWVZMc
 qFizbdcKQvh3U12y04A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280114

On 8/27/26 9:52 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> When no link frequencies are set, the msm/dp driver defaults to HBR2.
> Explicitly list the supported rates including HBR3 (8.1 Gbps) on both
> USB-C DisplayPort endpoints so high-resolution docks and monitors can
> train above 5.4 Gbps.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
