Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4972A4BA9F6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156492; cv=none; b=FelQnj4HMmqxli91HJjrO8i+fQ0uYAO6s1ZXZ/AvXZNwkKOzCC6dPaQI6nXgO0Chhp3AVBRVZqSPMiiC9hoKlMZjSkOvxIRLyJUzUtd/inQs49ftXLmS5OD6xU1YcqcxirJ+1MQEwflaqagO++28xcxNGjyf5YdsAdERwvvrq2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156492; c=relaxed/simple;
	bh=CndP1bLne+UX3AI97tK+HL16zqhF/jGzueNBiUg3cEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEYLpDPPpb6SSEPVYSp19g/1AHIIuBNZZcA8JHIXjPkQPaO8hpU2u6VpkC+Q2KGkDO8F9bYGUqxNVdGPUC0XdXjQWAt/jjMpE3WX5Vj2CP6yKJ3w/Fcc+umyjL5Ov/aOaSmVf9TFtias5rLt9lA0ZnfR9IuSfGuW4OGgYW6/Mfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfG7Ut8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+YP8q3Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfG7Ut8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+YP8q3Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAIf52998535
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQZsw4ftvBo7+ZjIXx+lUmsyKGeSp9JqGs4axL88zkQ=; b=OfG7Ut8wEH1FASSl
	NEvHE2n3yl99902oZL5LLaDFq7dvc20v6xIeQzZFh1PncyKohYE+C4nq69HHZKVX
	WN17GyN8VxxNLmLVPQlWBg1Z9kr8Y7PwSsnkBU6a1pIRiGhRrzAKPZ9SLIk2J2gI
	7iB2vkAgxufgYPzjoN8VejpzWNDck1fPhA/Bas3u2i7AUwNJKovlEMtVQjmQZkuB
	HvRiaQf3mWrALcCUAlom2KtqaXKgiLFIyi5LSbRz5r5kcQWo9KX4JZTDBgCbqewl
	Xwu/Jv9+crSCvZt6lM7CBybKRU86eB+C2DDvsP/IJM1mlbe0NSI1hh6vb1etnrb9
	++8WHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12pch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:14:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so104037585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792156487; x=1792761287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQZsw4ftvBo7+ZjIXx+lUmsyKGeSp9JqGs4axL88zkQ=;
        b=E+YP8q3YpnzAR1LmVbpfji4+vcTji3bI6ExV+Cda9QNwJz/VA9poOwg1+OpJ3LJoQz
         ODS4LwNrdDeJt4OyaBq+hL3tUP+eLsdB/NINS4vi91erE5G7HaBZFMvU8FdGcydYnupw
         40PTJ4l/uIPoHidLCRlybqLXB0wGVTy0IUFmzKZd4boH+KPnCATe3KFqG5UEg91N6aTq
         xm+9aSGwvRKUXKymJJRu+C/XaZxc+P9ZdRPS46dL4UDaT6zAYkOF+lZ4E4mnfpPG+fFe
         kJd2X6orW+uaCFo4Ft/fCKc4kdwfvG1cvn3yRq/YMHJ1auUBWGFXyib8PPrSlD/+Hi4P
         J+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156487; x=1792761287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQZsw4ftvBo7+ZjIXx+lUmsyKGeSp9JqGs4axL88zkQ=;
        b=pc+9iiV+YbVjwLkmIIDWU8zeFmjnIEmK1PKOPY2gOrkvJXajaSw7CfE4JzmIaeGBqH
         vo2xbmIhkmza4N7fZCT8gknTzDFDEeN5aDb/FXOjdycZpTMex3HG/9lPKkWILdqh/ILN
         u0Ri5Zm3b7CiWgrf/c/dhtRY2U8djt328pisOqseodne5DC83S87WE2BYqhgbvqaiAof
         A7G1aYVcydReP/6jf1tbTkxNPuUZZh8chGnGISZl0U5J9GVxbHdqp04W0L5nZ19zUewS
         hZfXDShZQ/TH555PLIr4xcfZwGNNtpE3K+QStDiwJfbGNfcHdXao4ujsxE1T6DhW24kw
         SjJg==
X-Forwarded-Encrypted: i=1; AKwUvBz7wXIrndMIvo5jWdW9U716kzYo7yULiYBDpJUH/VGGVn3OdxLxITA80sH0CY46KLeTu+qp0C1Tqe1QcAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdHfmU/WFkaI6jq/IoXcfoeWiwqQ8wqjUxC1rHY8rTYhPmyiQ4
	qlw2/TVV/T//z54K0bomeoPC0PaNlEECgajYy+5ROEuQVgKpW+289kqc0aEIa6WUgc5YT7NL3vR
	JwKx1jBXukUw2aI9AwUj+7WM4CnE5U0F4mYe8K+lTisEz1ArIH3YOoWdekkBhk3c8ayI=
X-Gm-Gg: AYBFou3m1R7y8HpdwFMK/S50OOykZc7kVspGbhpNBIO6Es5nHV7B/83AU5hezACgMXQ
	p6CtJsEt+HqYG4BLU7nOeYMLkWTryNjTTYnrvlpsGXR/2DLyUie/aaFdsJtUkI+OBUczGZhWB09
	Yx3gR5HTHLdd+hb7ZeBc1r3C+7QIZT6zk7yGAqYufR0X0AhIoi3c6YfrK7PIwJHMiyDSbmXKFL1
	YS6zA01501EYg3Tp5R3bEmRi8VF0Xdu7/JRD2J8N/iNbrcC/SgXDsWg/zjtTSZhwNzykVCCW6lA
	jeNaMPOcKj44trK5ciCmkDUlH9vkeAbne8ffMdcMOPS+DMuP1+F1KePsfMM0a7zqpXEjhRBnTyX
	IbwPgWjwebMyDqilhOG1Qpw==
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr152804485a.5.1792156487352;
        Fri, 16 Oct 2026 06:14:47 -0700 (PDT)
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr152800585a.5.1792156486768;
        Fri, 16 Oct 2026 06:14:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408b4a85b8sm71612466b.0.2026.10.16.06.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:14:45 -0700 (PDT)
Message-ID: <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
To: Joonhoe Kim <26rote@gmail.com>, mani@kernel.org, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Cc: horms@kernel.org, christopher.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com, pranav.phansalkar@oss.qualcomm.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev, stable@vger.kernel.org
References: <20261016124600.31-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016124600.31-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ypR64Q-8_GcqAmoJ-LqAQwqlGucp0EXi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MiBTYWx0ZWRfXw1FvV8UrW9F8
 XpLDG9lD9ndpGSpp71qyXR8hCS2i6asyl3gwmDVkJ5MS1VKToQlzLxMQxgChhjRezLMtGv5QH73
 PuVqbapBSEBmZbC2UoxqsfUXDpd7APk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MiBTYWx0ZWRfX8Fl5yd8TbMzV
 TM/+gbmqNgOQVMpZL5451uEYH6mLZhiOoo2GIJr05CtxzdqUdQ44cfeQ9KpBEgTLG4TpVKBIyz6
 2voq2SHopCR4/GQoDsmUdU+6U9mHvf6SLmUBOd2yLg8gwjr+AVoJJQ0KSRPSpmP//qA8h/IKR3H
 KmS+hkAHvTuKz9hB/KEAgFSxkMgPrUhyrgOS9juSbW0jxk3uWvLuXWTHYWW3Z1fXvJUFXWeQdG9
 BuEGR+NK1HDQqtwg76Rsoy5RT80pw9EuErUqmj/n72lO2hpaxodMekdWUh65it04VbVvLIdx/As
 Ragpd8LmEe/ZtUqSfUa7Sio/tRl/nd8vqHCp9bYufMEstnbOhx6mtyK8EK/MqLmW84AkivHcowf
 6s7eZ0o3HI45cbA3xunGnDtf5mfEF+L4TNe+z0mT7lau/HVcBzV4jPb5u+1CY5E4fduVAEEaSYU
 +Ld7JAdCMVUTH9e4/SQ==
X-Proofpoint-GUID: ypR64Q-8_GcqAmoJ-LqAQwqlGucp0EXi
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad22348 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=tdnHcQlNMze5R78DgzoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160052

On 10/16/26 2:45 PM, Joonhoe Kim wrote:
> Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
> register"), qrtr_node_enqueue() returns -EAGAIN for every packet but
> HELLO until our HELLO has gone out to the node. The HELLO is retried,
> but the NEW_SERVER announcements sent in reply to the remote's HELLO
> are not, so a service registered before the remote came up is never
> announced to it.
> 
> On Kaanapali the modem sends its HELLO before it accepts ours. With
> rmtfs started first, the modem never learns about rmtfs and its
> watchdog resets the SoC about 40 s later.

Please remember about Assisted-by tags if they apply in your case

Konrad
