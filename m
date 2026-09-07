Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D391043C056
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771315; cv=none; b=QIWLrdBS5A9P6G82XBywIIJYUm7EBKuDZFn76fETfDYkHgO9DsPt/MMlU9FTu6ZaS+6Kd7X6w6G9ieA1ploqUymiMg4T3Pp6IYBKYutEYWxpu70EIRfmgILhGzW62BAcyu9F4np+QeuXPEPLG4es3T53xuzlEO+NiyHYKLbDmbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771315; c=relaxed/simple;
	bh=T5URmT5QPTsKHgEHA05PozZ/SXOAu/fwq+audSuKHJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvVqDRPuH8deFBYQ7C4U6bzzlMQOpd0UsY9HDmYkXYJSkYcHl48+R8fPevWK8hJ1d/wO5vT8MAzmFvvdsM+Bd34Si/vk0TF6D+kzdzBS9W3m96s2Ilf81+iPNkysMG+FeIN2js9D3ZBpn2TgiP7nkOntvNLtlJy2piwyxAq0Vs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA3Vq7jP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qfr9G/73; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA3Vq7jP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qfr9G/73"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777WN72724131
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=; b=IA3Vq7jP7e+LAfsO
	jTObwTxWuKyOsnWCX/DIg5K/uXGsseZWYNX0g+9dbx/97FffQMgVuwKH+Po3ksRk
	NlNvYYz06Reruruukoo66nPnW8S3OndqGE3+vDRGJcJtxmcI1BShFZJG6HqNw3UG
	XEfIWedLdqmjoyRaKjDsWr6x4RDi34kyRJhEqeTjbedC7IM/fK3cgerR7vHqIkAb
	wnqWxjRAIDb54ADLjVafc0OS47U3ErJkK8XXViKWwAc1xNzqUXn1uA4fBSVxA9ZT
	Pi+yGDpuCFARz4koQhm8RBZKKiz/yC8IckAmS09GChXsuHa9P13JwWdktq1Wl+Pw
	zvkiyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkstsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:55:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53038881f1dso4971481cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771311; x=1789376111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=;
        b=Qfr9G/73Aa/vUKGQLnXbEQaD6B1yo3omwM7XowVma3CFFRDxOw1TIdvfGgZw7igfIA
         kQwpHrTW42+6OC51Ekfwrxi5N013HfeA4HFF4VMuUMbtzLL0U6b5b/zPkT7EJpqeyJFn
         0JKJvyPyAZjy5CUxJOxYQ4bF0GO5PbYEH17tqjVYnFR56A8FsCb8JivwAsXC3p++Fohz
         Lq8v2LZuinJQJ6+3XEdmQGJ1VDYm3Xu9lg5NJyhbaObibpxLQv6uZ3kfriI2TNuayCpV
         MxCy3OuTU4EAYe2TrcPCOSiqyu4TmMcX2PLHIWUViEUIINFXhq2hBM25fCG3zW/5JdQG
         c15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771311; x=1789376111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=;
        b=NjeUOkpZESGPGFQuU3thWyZgBC9En6Ce7e2JYQlpdgEANvoPf2ZR9pq982cvvKom3A
         IOODY1tMcC+E0YV6iBjAxQnAjA366nsm9Gtpa8mm/cA+0UYQwjVFORJpuHXpntHvGVdg
         uRT6KM1LD6DODqOe57LNvbMIOb749r00eWxCEvitFfX1JMFUxQNbDlSKE75G3K/vKd2E
         rI++F+/gp69uE93vL53r2ZnuDmFF2Nw2dnrOi5iMNWzlHDqtT9KXhgs9XcYhmjdh+UCi
         fpvI0rxhMpyTXUrc9+1Lp+I74KYgJC5H2SA5crOwFgPXUekoafH48GhcJ8jfxNIwQJtZ
         g3OQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8kjg/H8sMBogWsgEt0bmSpPtI4ay2KGwmv0Z2bnxIsHW9L6tAo1SP0fYiRW+/BiavpKKINu/3yXRmFIA=@vger.kernel.org
X-Gm-Message-State: AFuF++kmAIc+Hb6e/b8sviid49QoXbSZnvp/pWrSRJMfDWwjwbNQXJe4
	u33DZ5qTjtnZAd9ckA6VJzMaONaR8gFSja3BYy1agiOL1rAh9ZUl2FPK55Kl+N8CzuGe1tQKKJg
	0UUGP06Q/QKc9ez1vpGO92+R1KEkTsmPe7CIRGrHk6px/p3GBDjgDuFt37l+hrjjVP/0=
X-Gm-Gg: AYBFou2an/YytwGd4X2Xtc7/Q6rMZxWRVi5TIjSBWZ7uv4b0l+SddGLeZGbsKxSPq4e
	Koh6hXYdNM00CnClHDEK4nERFOod/scZ2gPp9o6wzZH5Rkq4HhCp0tX5NA1ZKOGAyCJ1E83Wm9/
	YNd6mdLF9ZN6dslLxy3n5YgHItQdFw+SrOJHO89rCXuJFZR0WcC9SrXGrJt+1kugavauAlN6V8r
	G1TeNZPETdnO77nPIJ0RWH2x3+a3gMDZ2y5lpPwzkbkHJ0/svPMkbvpEHpsgCDuMvb0FK62bPjU
	PAkqZMfL/yp2nXSPjicxww+MJV78RZKLEaXasIIt6+Z8akIWtwJfMUePjR4Txhv+Ve6VITSyY/b
	RecOYIxFiGIMQ+gkmDjyOZQ==
X-Received: by 2002:ac8:7c46:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-530646007demr130253221cf.1.1788771311655;
        Mon, 07 Sep 2026 01:55:11 -0700 (PDT)
X-Received: by 2002:ac8:7c46:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-530646007demr130252791cf.1.1788771311100;
        Mon, 07 Sep 2026 01:55:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bee8e8sm4381581a12.23.2026.09.07.01.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:55:10 -0700 (PDT)
Message-ID: <6f14d260-b8c2-438f-957c-8a169e19bce7@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:55:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: ideacentre-mini: Fix the second M.2
 3V3 rail
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX1FEIYl92t7Cq
 01DOwZ4EU2EjTzcWEUhlRqCviHfdBgeX9gKluXTRv5Hp5NPsvCSzNXjMeSsD357E1zh3HaFN0gS
 cH9gq6FYyCFKonrppKNy5zkAxMifWXUxrvUWNFMQ3IAjBXZ7mO+JKL8Jij47ZWclz5J6dEV3P6D
 8ghnoMwNYbhSRjEVGYttp5+WU5qHKx5S6hovKLi0sbLHTCNr4PnVmURseWY7rIULjWEZl4KUQQz
 1tTXN4GiiHRehTMFRtAzlq5L+ZE7l6sQmSvsZzlxt07MbaX1OoOVUirIhU7F4KpE7AZXjx85Br5
 7F4kUuDp58ZkpCs5BylTz+SYX41obhw43sa8I4gpVvmCnOZGNkovqOaTzjCE3Oe53AouHHIizzH
 lo/RLeIfu3uUvGkqG2SDxB0dwWkzmIQqge0UWkAiRg+TNK3k1Lyquhq9dkvUtMYRrjbB7YCDY2/
 8OFkWqK+tZZMlV0Fncg==
X-Proofpoint-GUID: W1ueeFjjHE67A2p4JuSwvp-FOGKm5nnb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX/AQ94T5r4HeM
 F4KVKXEmCiXWL7kRBuOkXb0Ppq+vnK9uYfPSuNLTi8XMSntMku3gnWlDuj6hnmSmEmA+Eb20V/h
 oGvkp8lwthGncWDaaSB8j4cp5M7zQvg=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e7bf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gxl3bz0cAAAA:8 a=SWV_-4jX4OqQSRabqnkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: W1ueeFjjHE67A2p4JuSwvp-FOGKm5nnb
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
> TLMM18 only enables M.2-1 on pcie6a. The second slot (pcie3) is gated
> by PMC8380_3 GPIO5; both regulators previously pointed at the same
> TLMM pin, so the DT had no effect on that rail.
> 
> Switch vreg_nvme2_3p3 to the PMIC GPIO, add its pinctrl state, and
> keep a 2 s startup delay plus always-on.Without the delay the pcie3
> slot fails to probe;

This is really strange..

> always-on is a stand-in until an M.2 power
> sequencer exists. Both slots work on Purwa with NVMe SSDs.

I suppose we have the "pcie-m2-m-connector" compatible, but it's
not bound by default

> 
> Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)

This is not a standard tag, which checkpatch should warn about

Konrad
