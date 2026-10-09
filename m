Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12E328610
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564334; cv=none; b=mseDT/SxrGdpHeeWwhG9P+s12/tyx3Vp7YH34rqZjFQbf8Cg/eWnRgOml6HED47lnNBfzZptdAPJu3PYhzDGp/XReJp3/QCjNpxtkLxtlCsBIFg24WvBiASuyOQDUAtwW65mgagFDKif/eFP6Q2xzZnXghrLJAWvOr4nCV583tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564334; c=relaxed/simple;
	bh=J5Dvn4BHs6an25pLjc5SYIxuz5I29ejiVTeArkYD+8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TX/HbjFNlOg3D8uJRTPhEaSsTDbyaWDMKONoF8od8/lK7Dfu0LTkXJgEyZaL8oVOdRsFXVjLvwNutPGeozIIIWHvPjoI6tWawOh7jtxgneS1HcB4y18+gUfs9yF12VL0lGk0AvnHTHtKP8/cfc9HCBeDcrm69pgpp1hMGfoGUPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWveqVRi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcMUFSMB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWveqVRi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcMUFSMB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699GbGH2888571
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 16:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SQK/COtAtg9hMbyJCE+mvI9lDv2+zJwCTOnpgFqrKw=; b=TWveqVRiPYWOPO3H
	gX8qKGU+aqGjRW4uS1Sbs970xqeX4iMi+KLfGxpVPsytVXEsGKnx0ntNZJpJtar5
	AnKNloCWcA6t/knsB9Il2KNrhoGkryqLiDs8zR/K7nIhlVPqyPBa6QsSmTKZR8Vg
	8wSsgjqVPg6oXbupWk8DqGphE5PWAI6kRbFC6vIEgn75nSoN+wBCeIdeWaYbHgFU
	HcrT/u7FLhw/xs6imWaUIZawUv8X+/rrO/A9O59+LtxnXk3VWPR/z8BpzRxOcCzi
	UDdskgYPp/gtl85+TKzC3UOiPSqCNBJMzFQ3iohZJ3zVoPqjelWqv8CC4vRKvVKd
	aQZcDA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f28qsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:45:31 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ab3dc2a7adso27496777b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791564330; x=1792169130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SQK/COtAtg9hMbyJCE+mvI9lDv2+zJwCTOnpgFqrKw=;
        b=kcMUFSMBR15NZ4jzJRlUKd6TgEeec0lqP48/S74IvEasX/GGapopGirIRGAUwp2dER
         SMqyg+QvhDFoXHjBUzMuxNe8OH28NT/rooUuSpH9o3p2lZDOnp04XNLak03Q1qGzG9kN
         7wM8dcRLctFvqxWVw7IRqsBv22rqCH3G6A0MsDGWfcarLJfaLAur8Zyrja5fkBgPnreP
         7vUjb8GshXlCX92z9yuxKrPhiVz3hj/k3gpyOIoSexIH5rRtQStS/jwPT0D+Mvas8gzM
         o07wplNM0m8e4PJbYDoi0LUqRooOJbXa2tV4sr/43j+gKDmCVpwghBuD3wBlAnGEicGf
         zmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791564330; x=1792169130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SQK/COtAtg9hMbyJCE+mvI9lDv2+zJwCTOnpgFqrKw=;
        b=Ge+gWhVIyzhpUwGTGyzdKpVD8g7Am+wh2vMBn4S+mTxzt82L6BfdrBRu5OpCZDzB5z
         rv3saaEX1soGnbb+dRlgNJe74OyGXrj3YewJR1XZjudWTZ4hBkSnA/el/254nfDHBk+C
         L63sNh2RvexYXLniZEmCiBRWuvwm8+sf0ef+nJW9U9UyY5j5V8rahVvXdoEH1rWdvtSL
         3+Vg9sn0Hl+k+w8ORVwIYU/fPMCzs09+gG0AUgiKXiIt1l0vJXHYpCObUPOcIUGSlSCW
         aEv4x72K5Si24K0X8dBEHtybdLZ09owydEhi12a/svqryGFtGnS2q2LKsjykLisFwpfI
         caFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD37GFNbO3fIqSSt+9jDRtMNTTslrLmHXfMYzadNK5e/0L9ChWNnKdou5rFKlo7e8ePXkpcClG6oVakPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRpFUo4J6ADCHB9Hx0IEDYRJJYiYZB+YJm3kG2LbQ0cDf/PLit
	nEvoQ7DGLU9BOxdwIE6ox0LyKF6mKGesuxIH8ihCoPjVxP0LWN52VjZh3QJHnw/EShn+laBT6Y8
	1tLaJQLeyKFaaf0VVOd/+UVn4Wtc37FyCvBQnDy1xQxHWJWbFTQllMRTPQvCuOuw1FyQ=
X-Gm-Gg: AYBFou3XzZzeqUUKjjSLraB9HWLgR4x/132Z0svSl6dklu+xmll/iEqB7TlAR5JrVWS
	AC9e/7v4l/t2lq3irmoxA5XcThBf6gP39qCowg+d/4dlZwOcgVi20Z2t6wIxyBucbUeA1YRWm9s
	pb9C/SAPLrljO4nUJxxSRDDudpmYXufCUjTuibK6N9r+TDj33P5HkMPRUYBUEFPj31q5ymsc95N
	ObvLCAEccGY+TF7MWzACLMbdXrw51vBELRjj2rlcrVxD/mOKooDXDV7zVX4Z3k16GU5loQyKf0U
	Br2Lm5ugv8b+9HJsnHmqZmkiayJnO5/yiLXBtUO/2fuqVgiuh3r/Ewq1cVe3YYzB32bwmgmCqJJ
	tRg2X/LgkvEuCvfJTnSCSCCATKHiq8ltIj2aj5zexINfBD3rbgQ==
X-Received: by 2002:a05:690c:c593:b0:8a8:a8a6:1c4 with SMTP id 00721157ae682-8b07ec98ebdmr5633277b3.14.1791564330457;
        Fri, 09 Oct 2026 09:45:30 -0700 (PDT)
X-Received: by 2002:a05:690c:c593:b0:8a8:a8a6:1c4 with SMTP id 00721157ae682-8b07ec98ebdmr5633217b3.14.1791564329903;
        Fri, 09 Oct 2026 09:45:29 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1b7d11sm9864857b3.13.2026.10.09.09.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:45:29 -0700 (PDT)
Message-ID: <30176266-b153-4576-8cdc-a1dd71a5e654@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 10:45:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] accel/rocket: Don't tear down the scheduler when
 drm_sched_init() fails
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261004164727.466164-1-sidong.yang@furiosa.ai>
 <20261004164727.466164-2-sidong.yang@furiosa.ai>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261004164727.466164-2-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0ZfelTaxPzznsfR9zLk2ZopE5Ok1QN61
X-Authority-Analysis: v=2.4 cv=Nf5zRGD4 c=1 sm=1 tr=0 ts=6ac91a2b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q3Tk2iPKN766HrrW7T8A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfX6d8w0/FS6/qp
 I0oShZQttg4lhFqjhc3sqL4Z1aEz6U2pzVZ8Ly/8TT7zWZ4O9q90QbcC4lV3v+S+q7deUSt8YSx
 WCoZNjOvqDfhou48JjzdkPR+h1G01oA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NiBTYWx0ZWRfXzGueijMF6TIi
 EkWOHlIP1QqmBlDxCULkZXWEliewyUHgUgeoreLSZhcympxbdhO2ArMdtOGYze/Cn5oDXrTfS9G
 FSM7wagUcuuuV3nmvQ2qZ0aSqBM2qE1PblXrtbK16nPjQ0Jas9IAKghtWXRs52JTbHF6L5XWX0M
 mytOfgWpfTCTr0cVm4M2xFpM8UfkUNBcfb1Qrs0AUwwTryBSkfJaV1s2fhs/bCxZBHxIAPkkiOK
 M1cdrGv7GsO/zXA87g0e0fg8R3YB9iFfG1pWo1tGW8HuWPoTCjGNaALkj9cl9vvPXblihq/qnwi
 +Em1jYci0HZ6/odgok+J+5LD8HSIE8QpyZ2XnEPRwrWcQISZlpXxoPXpuV5i36NgtJNieoetGub
 EHzZGyz9oecD4gmiYNMndsQbbVZ+CiwwbeOEyQ1NR2VbFBL5mlYY5mGFaNBrgIoeP90pRD72MhJ
 ekWqJo4tAFFLDW8ffvA==
X-Proofpoint-GUID: 0ZfelTaxPzznsfR9zLk2ZopE5Ok1QN61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090066

On 10/4/2026 10:47 AM, Sidong Yang wrote:
> drm_sched_init() cleans up after itself when it fails, but
> rocket_job_init() then calls drm_sched_fini() on the same scheduler.
> That wakes a wait queue that was never initialised, dereferencing a
> NULL pointer, and can destroy the submit workqueue a second time.
> 
> Only destroy the reset workqueue on this path.
> 
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260912114524.7A6131F00893@smtp.kernel.org/
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
