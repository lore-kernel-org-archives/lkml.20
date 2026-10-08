Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B933587DE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480641; cv=none; b=Jl4jQfjAyrrNBvAVZycpgtPs5U9Ka3gYLszeP4z8VdkUIkUdNdr7vEkjhggjLQYTNS6rkTHxRSq3PvPIVPH6OmdGWJlhn6ajIiy6+zYstmskF3+k7sqe8Ug25B0lI45a7VbeNPD6yQX7YU9NOYaVy+2muC9jseKwVpV/hWz1buM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480641; c=relaxed/simple;
	bh=kbBbyZTdB2VqOzHzVOpsG37cV8GEZBvzhLOSioAjTSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZNrO1QrEqEqmrz/aRuHUwV/ApbjMGOUoCh/2YPQ3JxMN5xjbEgxJsohuzwaLa3w7Uhi+oqHHXjKbli2ShsnTez3FDu2KEGTQDPnwLDwKvfM/HFzPGx7dV074d0w1yLpqZMgkELteCxWEC+ri4x6WkqYwuUYucwfOFjYfEcYd2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPgbO7v0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNP/moW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPgbO7v0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNP/moW5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVIQv2299450
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 17:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BpnrZueYXCCjEcEkDcfSAk1x1RAKDgY0ujsITMSD4t4=; b=RPgbO7v03FDFpiVh
	MWLdcPcflpO2sXv0TY9cH59v6+SDFow+DAdbcIiFtU6j/ZgbgbDI0Qw9Hd/jpto7
	NVguRyO8M/y821gwl0LCYFue9TjTVRAkdON+BPoEJiLkTornUhBS9MNfufCqNWih
	UKDHs1wdcx30Dm4xm3yfBj8y0tH2xYrY73motGBjx9MOTi/mDkz1mqBoW9OUBpsv
	zg8iXqn0cI+ZZ1A3eidZNdIyWRE4hEI58JxY+RsaF6o/+rfOyL9Yj8bCrpzqYEu6
	6aXDLS4MXLaR9awwdU4byVnfxV1VWaHDt+E4LhsAQlZQ8JI4gcs2vh27bXhzJxxY
	OrPQbg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2v0j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:30:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10550755eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480638; x=1792085438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpnrZueYXCCjEcEkDcfSAk1x1RAKDgY0ujsITMSD4t4=;
        b=iNP/moW5cLGXT7PJTFi+7GT1MwgxD4490idWX8kNX9xEVCxadbDwcCxZaIf+HBxJva
         eHY5pN/MKWuicQmEUeibGslzYv6bjkTaI6cICcuTjAwzCn/ILTReo6Q4qmty/cXeFrYF
         KGtzd5LL8XXQ2+YWtCyUhPvatIRGUZOJdBvCimRR0kTCvMKZoIBb2Ta8INS4iaKmWqr9
         FkkouNorslvmNfCUKYtqMzl9GhHC7GymRKEuzmheKJSqbkn6HTOgWvv6bcB4rDbA6YaE
         E2iHJPpcHFBqpm00Ulncsd1emtOu0WmnIaL+W1Mjxfx75v1XpnUFI+NvfDoPMiAzCRDF
         cDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480638; x=1792085438;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpnrZueYXCCjEcEkDcfSAk1x1RAKDgY0ujsITMSD4t4=;
        b=mdLgEVq9MciMAXNWBtNxWCzyDa1hI1RhfRPf5HrQFpKcfV5uy75ee6/xI8fCL06LqC
         iswpiVFx9illbJ6QW9I/FRSXhk+KbDUZRczeHVEn4ysys8nfEzf7JIwqIuFM6H6HSJwH
         ohPxaco6URi/hIC/XA3lX5N54uapEBrj/7y/yoKVNbtr8J3u7TtQu636TEX6WLu4gq6A
         PIKSWDOwbI4JGJXJjngqAlvbkpsA2tta8qsFIh9WnBKeBxOu3iZ7rlyQYxL+I75nDID4
         +HmPbWHCGdSMXr1urxm/xDxZsvvzAAu3PnhSmMXzamblWo8U2eygIdMBEEgkKKSxE5s9
         xSWw==
X-Forwarded-Encrypted: i=1; AKwUvBypePw6nkAuknRINJCsZTKfXsa2LRyc2OB+hyqNT+gX/ygmAjJQMa9UoDs5QbupV9sgRWnztlYaAkiAA1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM2xG8vr/wRw5uBkYx80qejxS4WfCvLY4UN7II+xoQlFBEXszn
	M9V39v/DhS9Q9cK73YSQArM/bwaCsLrGFwLXHmo/vLdFky56uw8D5c2FMH4nDPdiMASHTBHy+/z
	Frf0YkugKHNe03FB7ZkhDhA7XTehxlO8d4qte+TmaIbIQjKDqp3KTiTgJikZBtkPQuZ0=
X-Gm-Gg: AYBFou1+5xyUpGVQsdMESMU1cFxxWPc4v8xNUOSBiqRjemOaoxsdmYcfmrmtllKhJIB
	uw4TZnt+KywizXIEx2ysbxomFzEx1M9ctL05ZQddm5UKht3lpkT2dJ3JbDqFpV4Fbp5t8gzZnuW
	8ZG+NJbJPE+abQnMsRd7ohIHjWcZWUU237MljL+Mp/zasvJjoDHz/cap5fBhvgkhDDi4B9cRNBA
	EZGzpZauZ0JEHZ2rVO8crVHyEkbU8DWAb+tFFMrN4lnXz6PucYZKFm6HP20nPgGGEN600pUAmVP
	dc4RDVHlItcrZAm/rmlAilhmhmflig/UHPKONgE9hWqPvOkZXAKE6Zin9hc/0rmuTcDKBAhWOhq
	AlcC1sYKoMwv5HJv6vQBoM/YjA9hoNPpDEhhAKLJs0+U=
X-Received: by 2002:a05:693c:6088:b0:315:afc1:72db with SMTP id 5a478bee46e88-3515dd32f70mr7367077eec.9.1791480637932;
        Thu, 08 Oct 2026 10:30:37 -0700 (PDT)
X-Received: by 2002:a05:693c:6088:b0:315:afc1:72db with SMTP id 5a478bee46e88-3515dd32f70mr7366162eec.9.1791480621711;
        Thu, 08 Oct 2026 10:30:21 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afab2c5sm16076109eec.21.2026.10.08.10.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 10:30:21 -0700 (PDT)
Message-ID: <6454da30-157a-40c5-b1e5-d4ff0bfaed55@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 23:00:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove unused
 HAL_RX_REO_QUEUE_INFO macros
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX9liN4shWP91+
 wnfz/IbIy2sswV605rq1f3HL0IUjy14LHFAtXPEhWKGnzE7lMqrKXyRSZig4DLxbnRH9T/zXXwd
 UMFNvWeZfjVlTfWl/ZgWHohlgdZ8RdM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX//LbkOngEej3
 QHLmLSLAVKXQ0zQ7Eyy1oWDWD/q6xBwMjKkjStb/Qhm5wphRJ5wlScDR05dnfZx5FFf/n7+2foc
 SKeMH3MeGKGf4/2kEAEndNS2ZIO2ywmmAZnQlH+MWDyxmLnsuis7XrSUsLGMcglguUPe8Mo1/Pv
 huYtOSHuZnon1Fx5ab/ReGo2FXgDBAFi8sf1xqCVYj13/SMvK1X+rrrmoLS5nunaSlg7MrK0NLv
 Vq+9iQ34WzpFkgLNDCKhMjvMp9TgkshNYnDrk4N9usXBRGRDXN3dvq8P4zEdAQH1zlBXa7B+BFS
 ibg1T5yzAXRWZkfBeLtrUdVJxNY7eOw8gvGf2qiT+8dIW6Dxt/DUuPZdVZJuVdZ0jmVp8HevnDR
 pfubdaDVcf78eSm/WSKvCISc/LRRgkea9w1Fwknm5juYz8DZ2eJObzX5bTXt3bcxee0ivL9vzvk
 aeHl/YLePaGDhwRNtBg==
X-Proofpoint-ORIG-GUID: 8PUzn9VHl9JH0NGG7pO_4H8SckzIa9rU
X-Proofpoint-GUID: 8PUzn9VHl9JH0NGG7pO_4H8SckzIa9rU
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac7d33e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=S2GIDFmybDkgDShTZ0oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069

On 4/14/2026 5:28 AM, Jeff Johnson wrote:
> Many of the HAL_RX_REO_QUEUE_INFO macros are unused, so remove them.
> 
> No functional change. Compile Tested only.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

