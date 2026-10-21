Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576795;
	b=bGH5r/JPYxsB0XHCalywm6aRAi+Y8KcbK9Dpl2U+ae/T5CHronzltL6KRcD2DVqEx/4r
	 zJsh+//mOKq29yP839wulVzD1DNk//u3wgvpiBwnO3xy36RIqkyA5mSe/sFczXIwR95S8
	 OKe8V9w3B8nbHfKhTzxrh1FW7UXHDRiDydAtazQawZerJx/SQKd3T38DafsBfkFyUw4qn
	 q9tSSWh+Gy1fsenEzwtUy3qPpROAX/KZAjXBXN7qUY6l00fX75blOxuF+orwPkGnE8n+s
	 zOlBGralKB4XKi/JEWB/chfCIdySx4vJkC4Y8xFyw4+pIzM21X63xYUVvR1AwqliguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
	b=PKNS5/kt6fdzoImTZGAjiFxM6Mi35HJKUajJTxHvMtlg59fB8ZZhpxzzA9kCmgIiDb1Y
	 0JY2437UCLDqAFGgajdlE7YmLnNczdCsT1SrABaiKozbc0rMoCcbnHFieaa5lqq3d2CAf
	 KIYqsrvTbPbKLvuRwhEmcGqvj/R/10RwDcjwvJ60V9vUB1mm+h2bdc+hmzLTBU7xpn133
	 r+XY0fAj1PmMPz+Vzult1LN+rm2nweoXFJiEZvq3zUnz+YGRmie+H2XDS0EFeWa/fM2Hh
	 aRSs+msS6hcWVZNC1+WdwCCes/1tQecqR1oNqvwJ8tlAsZV2xs2NaRHzXTdLpdSv0hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQ7rFJf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N8ngMJpD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E9606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537E9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQ7rFJf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N8ngMJpD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j11q3355737
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=; b=jOQ7rFJfoJnRqvLp
	cZvlaCpXNpC2EV4vALOwIWs/r7eZLrNflrlH8fVX0JFAG2qr/4gsdlmRRVlJRWdK
	hIBYEDPVmQdcwtn/ZOjUg4jq0jU+WNez1YfLxGfflCiQLE9Ck63dacgTeyzEysak
	MFoY50OMV9UT7tcYk0UNEIM1YbQvNPS2sRr3eUxebEzeOciBHhrMSPTDIVt+jT0Q
	DBM5nfnUVakz23nftf8OAO45caF6prRog8cfaXbX5B7Bhv0e8eJL7nUiZd0CRbJm
	53SNRckMdyrr3Q2h4BGHt+C1pP5ALpysqOkwGBvxvk+7wLLO/BRN5CEtk1MbRFfq
	d2qvAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kbrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:59:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bf35c4c78so1465646d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576792; x=1793181592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
        b=N8ngMJpDpmqvmCXL7svp5vq14+su31741tUruWUGMusXuozXYSFIuY3PqL76btaMWc
         BQex0rHp424rgZlu1KTNAiQPLealRv6tJtQBSl7hY/15kEq1a1ZX4IBoH9MQOlmPpk3r
         viXd1Nm6VKqmznIPZON3x8uEXJIjWAJdgUGb7u9dyZpwyr4amjBKX1+Cwe3HeQBBdi14
         8Dio6Zwix8rYxf/Js/0SElRUn6qWAlDH1qyG0PJaGGTGvM5t5tCMSLVZA3ARUFBBqPa6
         i3EepNwoNhop+iZUuQep+nAj/+KYmd/DYG6HdgOiX9uvgMooOEc5FsnI8p7Kdj29WaXH
         OFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576792; x=1793181592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yP8ttg+rpEQYuH19+9KQM8ac15FE7RfLZpDf2VWAhg=;
        b=WGwUm7xBYvuozVAKo7L/pRvtZBpQFKJVMX0c9klT57jCfEO3QEUbUXBI4FAl2sCdnW
         1Prgakn8p5K2MbpVdnULJjUgfzXO23qrkgIrWi4SDzIn6HkY/gt0z5MA5gFE8XIb1tfV
         HDZyP7qXNJkDfdrBiCsJ7n9WjCmdmd41FcqPga2dq/ByyiD/hbK2K5VZoPizN5Hcwi3k
         MM1sF3uMcMAHkCPKfwfKe391no6MROY8nKHOAbb5sWUxf9OSDLl//oq1gDeqSmeDniro
         oV+d1sQlv1YsQclQRJnNiivGpHhBtFb0nBi2QZlM3GJ3NvJqanxIqW7nRAUgWQUCD6p8
         yf+w==
X-Forwarded-Encrypted: i=1; AKwUvBz5I/BUc+3X3xLtEBlF2sN8noBtB58ivQlFi9+OvvDywQKSGGfe7j3Ixdzu69dmPBhD/lI8w32xgR9rMCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnZNtZZDuQweMSAPuH7Kopw0vzIbo7WfqB5iLTcfbo2pFQbvrt
	6UUuLE8V6eT/dx/SAFmESLZ5ttI3QK7lRtfCDLqUwxlvKXnoz18Yxq/Z+sGufYl5jjxUIN6L3V7
	RE1anLa0ERow4xb3mtfuu1sm1zJ3QNqBdegTTb9MUbXZQeaSkPGfwELnA0w3cdGEXPU8=
X-Gm-Gg: AYBFou0bgUR23T1SXsVJRVFH1bEbrF5F63CiObWxR92b+7wkEDYkssjRR6pD5thJaae
	0WS3W9hitp0mrtrwNumh+PChB6inr/PGQv54drminKdOhY/+plBuA3A/LZChRNh/yagy9s0Akt4
	BP4+4X+H0kKSrTZhLbRNpS7tB7FxXjp0SKtGXOt1dj+ypEj578RZgXaMIIRlqLuIQIP7p4cYaII
	rF9qHskOJB46ePWJ3XnkleRXacHoWTH8Fxxw+f4R5pHXpStnQGbBmiR12qpRGXi2cMlzGYq6lI9
	f1PCqS413jawtZHcNrOSzN5CQtj/SSfwKo6boiAi4bg9q6vaiBAijU0iWBCDr1K+e4oOwBy4E4x
	KvEpF9Gth2GJJ9ebxmeVFPg==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr364453985a.2.1792576792371;
        Wed, 21 Oct 2026 02:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr364451285a.2.1792576791929;
        Wed, 21 Oct 2026 02:59:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315506bsm685930a12.29.2026.10.21.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:59:51 -0700 (PDT)
Message-ID: <f09674f9-5336-4e0a-bd68-cd9572c8d0b7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:59:48 +0200
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_wcss: Fix missing subdev cleanup in
 q6v5_wcss_remove()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006-b4-q6v5_wcss_remove_subdev_cleanup-v1-1-307f58667679@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006-b4-q6v5_wcss_remove_subdev_cleanup-v1-1-307f58667679@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX9Slc3bXZeK9q
 L6b2DOrKlTHhdZDt4svxxoDaF/7j5PGZ6qjzVHO3FTxIOwkBZ7WSOlSnIh+aF/bLFJM+AyjhN+r
 tGtGoaJwE3LwATTkqV8piUM+GvbZdXZvn3+v5zrkgkfDZBUoFYgzVS5AvUyrBRb6EOXbFdX0npR
 tGZK0FRGmESr1F5CvuN6sDUJz9VqA7NpZYtAJ77q5Ax/Qwroi5FDXuLm4U3AKZrFim/H1MUIORi
 58BufH6gXipnOOx53QPDlWMTOwcZgH3Am/hn8u6FZXvv8K/XnTfnqjIi2NHpuHifCf+dUXwed4W
 w4DTH4tlDy0mJ0u0lGddBYQLdZNVKoAqlTeeLUqAjrsmg/0iPFHbL6rGwTqd9BGIwIUnPbaiJfQ
 RrubHsFzdkr8zqrzoUxV7GA/U3AiXq9IFnTuhm89EiBKVij8QUeDK5i0J0eDPesfjRF9Y5T9c/3
 tVPnCLYBKRe5bljCSWg==
X-Proofpoint-ORIG-GUID: HuFWGsuDxwsGMUQxaGZi2d1LKXNPJwwo
X-Proofpoint-GUID: HuFWGsuDxwsGMUQxaGZi2d1LKXNPJwwo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX7gmWNQEoXS2D
 DlTg6AjzNm5q/WifKZZR366zMJ4mFG6/HteeNUl7Eix166pirsTLPBeBbLHcHoWncxAYPpr41+E
 oqWuCeIbD1vGgXeo3OlsCn96uZFayys=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88d19 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=o47FBeiU2xnD7M33FAIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/6/26 9:29 AM, Anup Vishwakarma wrote:
> q6v5_wcss_remove() omits the cleanup for the sysmon, glink, and ssr
> subdevices that are registered in q6v5_wcss_probe(). This leaves these
> subdevices registered in the rproc subdev list after driver unbind,
> which can cause use-after-free if the rproc framework subsequently
> accesses them.
> 
> Additionally, rproc_del() is currently called after the subdev cleanup,
> but it must be called first. rproc_del() internally calls rproc_stop(),
> which invokes rproc_stop_subdevices() and rproc_unprepare_subdevices()
> to run each subdev's stop/unprepare callbacks. If subdevices are removed
> from the list before rproc_del(), those callbacks are never invoked.
> The correct order, as used in sibling drivers such as adsp_remove() and
> wcnss_remove(), is to call rproc_del() first, then remove the subdevices.
> 
> Fix both issues by calling rproc_del() first, then removing all
> registered subdevices. qcom_remove_sysmon_subdev() already handles a
> NULL argument gracefully, so it can be called unconditionally for
> platforms where the sysmon subdev is not registered.
> 
> Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
