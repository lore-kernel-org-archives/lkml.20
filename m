Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008394;
	b=j9RmAWvXvryolDVLmZonY/fu6a82LWPTWtqb2jEYTzO5vAEXvnsfq3tm13j33+F8ODnC
	 j2h6YJOWFBEs1JH1s0frDZSQ4jSAJtcKaelS1b/LZ238+IWgath9TuMsJiN245/abX7Ew
	 Fd1m0o3splMEoxw4J3+yrmT62eS1KzP+Js5OKS/HQvsDk50jkdA5EZ1WiT3VbPE/S+e18
	 b/aupoP4RSaYPtkBzPALVjSocam/cuVOYcw2c2DyTz2LlvGjgiaNArFZtx4JDCr+QddRL
	 8I/aRw034meQyVpXhpQtGyJzM3a9c7pTXEDSGtfhrTSDp6qXvkN7XrFapCtHHYeb6ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=;
	b=df2S2c1VfyLQqercyehVCEYNW81ipQK8AzhuJH22+kpF14JBc0H4nulq6NeAzQveD2KG
	 9ftRWY9ofgicm3gI2LNDFgzXevYEui3DkRTfBjbVSj37G1ezAKqOKjvBy2ZyeVfWvcsd1
	 LjF4j0JHK4BEAIydIp5fgfI0+1Fzja9GFrxqFeyf5FuX7WUfFB3GX9lwTvdfEgKc/9ZF7
	 Tnf/ML6+Ia7B9YhRePvBKu4iZ6FV9hYZEtPnVfJaZw0XtyeQZ3iKnCEbaQ/VTCxGihCJ4
	 0y3x813K7kF82bGYZaDlcVYX5vyKpaQHGSdcbXiW5ZQxgrvwkCYdr47h56aAqPoJAng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JPV8hxT0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drL4hGM0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E448E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E448E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JPV8hxT0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drL4hGM0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aujR2255188
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=; b=JPV8hxT075qsg3T6
	mEcxbfzWO/F+1sHvbdS1G5qtSnMINA9fKtU8iq0N4eX3VManpvgZnx28/OYHsPKj
	0nWtMhPFg9FZDl56IzqTpIhLJI+suaIMFsJTfgyKMoSNkceArzFrt4rkp6DQ7nzR
	hWngJCzomXAwMUOZ1sf09waCCAMS/TnD5lw7+DYp+8X53Sw9s1xyXKIW+WZhRfs+
	xveOSkrSw5FhyipIoD5ksk9iNWegn8G2JnPAH9onQ6PsR5z9XZnmvKaGt5hkt90o
	YXfdculLyMcNh1bPkAGA7A/EMpNfbC88TYpbujRGi/F7XqoXiOIT1Z7MJ0vumpBG
	zxxciA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nrta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:53:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso34796685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008387; x=1793613187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=;
        b=drL4hGM0+AATbwNTS6Yy4e2F0ActdezJgOYWnit9LaNjxp7DaUBKcHo1k5RRLI0I2P
         xVAO7SwPCoJ5//uVMD3OraXrKsvmliQN1ocQi0bFHMiMc9nK1ZPsQBjeIhQRJiZuZtd6
         zCAcIO9Y+7P8dizmTr4xmuHQ7zBFNE5YZiSdOs2DkBoLIz2jIOpCptzbIJyvNN4oB2mN
         TUN1zEb9j5JLGHQMWbvzt9d2Di2yOoA7CZI+qnoLaH2BL1uSUZcsivm2j3JOh0nQrGiy
         g8lEZVBCsqWqshpG+G8NVQRZcNs2kfrrzmiNrMPZcgYUzR4ZCgv8hgg9d5ucnrp89Sq/
         zmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008387; x=1793613187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYy/Jwyeow/fBLZ5IOY3qekzGxtgJZYPejsTaPKV4sQ=;
        b=qD2v6exfqb5lePbmo3ElDHzkXUOLqJbwJnCSfCkyY3C23sAt9t6lxU7wZDPgjgZrMu
         47sqDHWCPigIj5J8DtuZBMcc4cA02PM7IONsXZaTtaCUlMrZUj14moHt2gWHNPeNLbT1
         QvvMp7n/KpTWI+I5ax822pHANctjqGXDFzjR3z+HqjtM7g5oAtfpWVpdtDvVSE8DdLaI
         7k0WG6erd4POeCAY1thQ6GdQ74S2SELGjkjuo5qhp5W3JfvekMm+/6/LvmFgABfIrbXq
         mxfSPSaflh/19tFemzBWETwboR1IbyVAW7ZLKzs+MfHGwkmdd9T8Rs4UNCN5eS5j1UH3
         444Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPVZvc9l3FiI9D2Jm/0piIrf1RMNPyV5g3X9tHiZ8EyHUuwe8lcqrEX1twK0vHtPNMYwt+gfWl9UqfNaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/2lP1HO7A31wTp4iRvxKYaMS9TZq807zdu3+b8fLHopoJ124n
	qaYsdvJGsTbUvsGlzfiOMQScG0Vacz1PZU83P5RLrqGd00OzF9qMCC7q4iz7FH9E2ny1DCrYqn1
	nX6PGXKhYFQDL1rjXFWxeCCzDTGYdq0ONnDfrMqyKX++NLQVZL3QSSDlEdP+/me0JY24=
X-Gm-Gg: AYBFou3ElfDtjhL9L2sR/VU7SJfydcjPHgLdnBqxZbf182gs53lXbe/s6Qg1nK/EkGm
	SAj4uawgCS3C0mA7ZW/HFF/HAo7zcBeNEusmId14N8rtGTAXytcpY8QxKVqfEUERodhI2uzVUMv
	mZ8KGK9mQl39U22PiB5Z0jg8Hz7dETDSxZMzTPf/QfU7vg1nKmNiQjgw9Elr5pyJRcUwrTSLWte
	VS13+/ADR/slaj+c/9y3w6/PxdSEHCKDj8kroHX6TI4BFq7V9BicfOKXdBCJ1KUzCVE6Ah0eg3M
	VrigELpMlGreFvhEcE2ST5VqMYHVxkCsiUkfdb+OMpRMhOBbFhvDJVRGRE084vCXy5sLWt8M4pd
	VNfFJPgimkm0Jimi/8Aresw==
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1010422885a.3.1793008387197;
        Mon, 26 Oct 2026 02:53:07 -0700 (PDT)
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr1010419485a.3.1793008386690;
        Mon, 26 Oct 2026 02:53:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89e6sm304007766b.20.2026.10.26.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:53:05 -0700 (PDT)
Message-ID: <13053ef9-0301-4db1-a9d5-1cdd845866bb@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:53:02 +0100
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
Subject: Re: [PATCH 5/8] drm/msm: Fix sched_prio inversion within a ring
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-5-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-5-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gFQZ769HpRdGrKFWmU9CYjh1E2w6IWmj
X-Proofpoint-ORIG-GUID: gFQZ769HpRdGrKFWmU9CYjh1E2w6IWmj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX2Bm+o/t20ibK
 BUAyAZx2i8Cwhi9eZfSCo6fjIROCurKptKMIbo7QIKjYImtc+o3Fa4UQX7PV5JOchv1PAmDymYC
 nPz4Xq2QhMZ3UK/kq13zQWPXT+USjVU=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf2304 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TPaDMEC0OJE0i2k_fPcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXxKOQxZ4qvRkg
 MjT5R4M4aFS2S0m+4jdE9wXkw7MYQ+gL8klh7hgW/vOJyhOWrmMJldfN2enDvhXZGv0st2uiac1
 ID1k4kPID81CHA2Np2N8Q6HwLopPMfSTNgli15fE3uYkI1+t3Tn1ifblQV6LU5Y3DRTRIOYQbKU
 Tu2mH+LQhrtgt6F7N+sLbrYlgaU1fi0oUooVYNc0S7cvZFCQ/gvUbG74ylOAAxTzFKXXufhXXWn
 mvgn3Fg4wpuOqNId/P1cB9cI6ZWE7iHostgpxYo1ZRu0gztAeQX97pMXxsqlbisodjsFkQM9kyw
 6WsaNjZb4AUP8MpNdR34ahyrmlAlRqydSjycHXROPKLhUmSTqL6q3YGBJk2vJ3llHpZtot8IxwC
 hFGfo1+s1OYokcb0MjLW3z88+z1nFscLfRXJcawsKM5RvKFXQz2GnqFeIiBW3CFnYtC9bkXRz3z
 BaicaBfyZgsfTOAN+RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Commit 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
> reversed the values of each sched priority. But it didn't update
> msm_gpu_convert_priority() to match the new order. This results in
> incorrect sched priorities within a ring.
> 
> To fix this, remove the inversion logic and add an offset of
> DRM_SCHED_PRIORITY_HIGH to keep the range within [HIGH..LOW], reserving
> KERNEL for internal submissions.
> 
> Fixes: 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
