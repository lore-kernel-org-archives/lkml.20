Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104752;
	b=0OOa9Kx2lc+40/Z5ZCUO6EP+p76legS4xPUrcQtlH3s880+bX9m/RsiQuxk93LMB+tyK
	 JJmC4/K2fYdvz9d32C+cOkBDp8YxgYHycQWKJBAq/LjTKipf1MY9LXm3iEo0AMq5Kst4Z
	 Yl4TUtoMUnt/oFvvDpMzpg5DQGSePqNMNGJpO5D3wkWOuoJmmuHCngzEOVsXJF0OQ3XKK
	 oqBcRcZJR08QXpFD3au7qq9Ozffb5HLoyJ16Xdvvsdhp48xCd4Cf6/npIAdGRYbywWP87
	 6UlbPjgPpgMk2TfQc/sGPvrAh4J7nHBIui5P+WUKvH3S0MLlD2cMRoJVuE4wBmFo0Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
	b=fL+nJfQSUNpj0XnVmMht99K0LSomzwprjjlrtqZcN8n+nX8BX/JHNWe4iqrIhkq2umeE
	 9PEfjpWtJWHoHoxLIy1zRafMQV/Xj++58j4kJIfHDg4upBj00brx4rf/qZbAvlb7koWD8
	 ziEoLBMHuT2+24QZQmLJbLW8mHjmg9Ak5SxaQa4gjQ/4+BC69o3A+GCrDx9mRbQEwOHkC
	 yGrdnn8Bo4+YJUzrhzR4Z2AIWgSl+8D4gv+UflMLoFTxUootQhyOf9eZFd0tL4EM+V1Nk
	 UiHlsRvzdXxPkxI0TTL0igvjayGInkXBu+d0FE5TJzDk5drZ8aRA63V/L4M+u4oYelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvjtCN0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pe4Dxl0C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DF660A263D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DF660A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvjtCN0W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pe4Dxl0C
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3YD1935891
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=; b=pvjtCN0Wqj2XrZ4e
	UIBV36XzWZKnwFhOsem/tlER2xVxXi+vo69aqus5wuFWUS3l/LEEoDJYO1TXnnbw
	tm1nPIJTrU8ZX6hIcggcXVOTRrDHfZcI/NEQPrv4s6O/hmxqhzo9ka0t2DAXPUcj
	aeb9Q5vSYIkUmFj2cYb4sIXzL1JDcFDXnxZX3cNDrI2/QLZpwPZtsc+H5PPYmqPC
	y3uybWlAQwuKFIKH05gI8z96UfDdrln6SHvcj7N+yI198I1GZnNPN+8F7GCWnl8C
	yZLrOWvyFJlCvBhlpylbO//huC6JJTfqw54eiwsbrObrESipRCHb2WAx5aqGuFr4
	dScenQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtucg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:39:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so2985836c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104750; x=1793709550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=Pe4Dxl0CYe8xc5+N88zDpxkzJFNkxh37wyQlTRvvXcK/A/8OhMlNf5muaRX+JITTGA
         +EEVvcqtcLeUvfREps0bmLfH9exRbeyUUB+pI0ZcGZLh8Qx269coeCiyyRbMb0fW1X2E
         IyJx6JjvLbubrioncE6wCqswrPJMRvpRcsCrYmGXbGaRxQ56U8uDxO1GbYCNQMOyPfiB
         PBRpbzO3JYUHIRHx1eThI1diV3KworGf7ObLMgEK4sqezE5RieEPD3KK5ZoZVkQWrWge
         2aFD1MOYezJMCJ1hbNuCR0A4T+dyvbz5f7VTLaqXmJXTXqtSBw+9SWE6JdeJ9dL3Pw8S
         PTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104750; x=1793709550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=CAUPgqmhN8kya6UypLK/yfG1nvG3JvHS8wcNgflGoIDeawxt5yLG5tOvASQWKEOZhW
         WOCL6Yr7r5Ko+N74qsVefdGc4Xf/sZt7mWcUJkEF6qELm8UT8QOZ2ksUxHbO0IRtyyDN
         gQh48yJdErxVZKVHGxWGwM6VYI2wS+ZGpm31uTdsZbwxHUcrzyhMqAv3rpLol5IJwePB
         0SNJQ6cHKoIWMIziKfLRkRJNhSG78Rz/SVfijc4tSv3Jdq9KazcCAnoGOJkmo0KMFweb
         9wyQTSvA3tdX8tVK5pU+2zdXFtqHJKC7wDgl3eNwmg229YHDQEl6QfdiUc9KEovpNx1G
         7jHw==
X-Forwarded-Encrypted: i=1; AKwUvBwnoRl1rITEicswySRVF+Uw++RYjc6Hg/f1tY1sPCzzBM5Zdb9671DxV4sTsMKBdj9675u028Os7rJjwWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRyj38XcUYLScFK0fPa+/lH2QcUfbxsGgApO6gfTjNNuGKn+dE
	eCzMUJLxQ4x7EjFZx6C63aHY6aOc3RSufZvhfslq7JHrWp5KE7W9YMZhjduwxQQU++MW+4pm5Gq
	rY/SfQkhGj7nKel2PWtCk2e8LlFVY8G4MwnIwgDuGx5anw5Y1YqIyqQfUWoUoafxLarw=
X-Gm-Gg: AYBFou3HvXfxQC8e9U5NsoznIB4WB+KkRi0/+8xU4CAut+jIatmuUSRnxnjXGAITW/b
	4f5Fq2ZRMMEjo0zpqNq/LXXJF25P/CxAeDHUeLYBqGjdm1B1zNRWbAbEv8bWfWFGnulfGrUq57T
	4ZrOlB0CL0HCbT/7bGJ7hZM4tP3D0tvFtBNo6pdgnMsaq5W8FIiaAGTO1iU+63eHjOnO6wdz+Vg
	OOI1mEig6Q5GbGiyuSQ+lRuiGrswIYO/QPLkxoEHwuM6QaSC4oAbZNlfKof4NGjGszFMLV8R14M
	qtunsa6a3kxAj9MHUpuK+3lXtCAuyoXrIj8DkiMwColEMlYRu4bu49/OALIxYhu/i3oOHZwMGnh
	tQlH3IHBpzt67W1q1gQOpUVWcD4BWbeOBT5tzapMDRtYbZBy9IhNe0MS2EpRTJqQReSosGMXR0B
	U=
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466964c88.37.1793104749665;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466931c88.37.1793104749144;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm32798498c88.16.2026.10.27.05.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:39:08 -0700 (PDT)
Message-ID: <3ad598f5-2e02-45ed-bc17-e4b6119ba2ec@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:09:01 +0530
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
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
 <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mgz4nNkexk7L3_6lsYiEYcK92tT6QW4E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX8lM4nT1sseCB
 gGO3bz6AeD1xKqwlw7l6HYHMyXKQALA5C2QhXpRH6AZ3fZ8nZcit4D/1ZphuZaibvp0LLiATOss
 OAP8o7RQQ1pQENgwWLtRWAI0x2Vlnyw=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae09b6e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ddxl3Jw30jVTiRF8AwAA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: mgz4nNkexk7L3_6lsYiEYcK92tT6QW4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX1NrtiikOBF32
 or8yc2yoPys5Yb9KHIEf9QFvXOBB7vYZQ1cyzaHuZ/eN6KT3xc7Vu61D+uw890YD4fAZMuV1GFU
 ESmVWRYOhSvN8HKF2q1ON4FwSiCzvyX+mCgcP95piJ1Pwq1BQXUc+fcq0lBaS7L4R52YGeCgK+Q
 hsVTVv2tvFMgtSy3Mio7NxA/GvEJp8/pUsYFfJeAonuuX2wU9UngtQXg12byO9W8jWOfWX6TTjb
 skMVQYDWSsjiVUAx07r+ONXoasM0boQwGgN9YUXQ4kavTkU24U4WUb0C2jxk9gsumAx2G3dO4zP
 h5UQe7plQTIenTvnWXk9h0Xp1NdbJHWYQYplovtTcyhWVBoqzzbMabOwCAY3SjgsVcbYJCicREr
 +ELOVC+O8fm5o7B8rsBAvUpaacXNipCGFBXLmf72s2SiRAtWruUQTZOb8v2wN67pI1CL5uMmX5T
 xmQEVl48LFosyaSMfzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050



On 19-10-2026 16:40, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>> the latest wake up capable interrupts when the CPU cluster is entering the
>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>> implemented as .power_off() callback by registering MPM as parent power
>> domain to CPU cluster.
> 
> GPT suggests to register the notifier later, so that if
> mbox_request_channel() probedefers we get a clean unwinding.
> 
> It also suggests to skip pm_genpd_remove() in the non-legacy
> case, but the API tolerates nullptrs (although it does return
> -EINVAL, but we ignore the value)

I will move the genPD/cpu_pm registration after mbox_request_channel() to fix this.
As for pm_genpd_remove(), as you mentioned it is harmless since it will return -EINVAL
without disturbing anything else.

Thanks,
Sneh

