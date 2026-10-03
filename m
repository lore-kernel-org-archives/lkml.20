Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC14135C6A7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 23:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791068839; cv=none; b=G2POKlMbsVA5nhJRT8ZiJjG6eCQwKnbiuh7fda87y3O9yh+RFzlR8IenvTZRJ2D4BEL/qzuDY6yCSQocGoOS4WxyxHU5Cnh4Y7PovgSK+XoG8RD2HB61tXg15GbcqPToFsXtjMD1hJPNUX5LJf43kEcjS70Ha+M3u9+oEzbFVGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791068839; c=relaxed/simple;
	bh=+ZP3oqRlxjLVmO+DUJ3oEqSGQUnarK8pMjoPSrpTcak=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P5JLsaiggLCxKqO9LVru1v56NmEbri2bjefM4865Wqsjaljk0V4g1UbYRqCB9moxX4EVm7UMWYT21UtQk/BbiYQUTcn/Anaz/uOfKLNPXHFdew1opI+dgBeExn+AXws0tOqHSReFv94CZp+pWbvSE2mkoxKrLxx67ZS46k7LZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSH13pZt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwPIOlhw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSH13pZt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwPIOlhw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693KpccR465003
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 23:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui0hYY9c2dDrMn8vS9nrlZOGWWpwY017RHY+Hel6dAM=; b=lSH13pZttf35mQWf
	MYIc27VMxijuPxdMaVIx80xKijECK978t9wicQaocmY9EuUTTxXNa+DjmaEHWg2z
	4/Mon90o9C6sJgl+OEf18NNtRe0DBeWKRfhXhflcw7NnUXGrSNxQPfOWtW6V898S
	d9Wf/vSiNs3eSqjDa6Gr47DD17uR6HL+6pKqQ/i9tOeNgkSFVbYx4uY1JAm6hLg1
	hRjYMkhlQpoHiGPblOaJGxXPeThAeW8UWHYabzKBqDwtgjRZOaFQ+XGW7dBeWAyo
	64Z4Hjc7gAvEFgxAajLCMVkLc85QeFKmJQjt95gxH+2yFm9qus599OpzaQpFDgz3
	tET4qA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08hv5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:07:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso579327eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 16:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791068837; x=1791673637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ui0hYY9c2dDrMn8vS9nrlZOGWWpwY017RHY+Hel6dAM=;
        b=SwPIOlhwBg2FbmpvQinN0AL7Ej5OLhpcQYrybHGq27BpbWI0iqOBb4zjwUxBe4Kmmb
         KJ921mq6DgJue20kJZgwa5lUInBki/GXu11CQnduzNM9irJO+Nw9L6Cii9sq4ee5HAke
         /jp/r/lQi/rSWicl9Mx3B20VmolP3Oek5swiCf6EASKwXIdq+c6XA0aEvfGn7gEsAK1d
         UiwdDHKnom0uj+fovV4/MFb5YsdWA/+Q2TRg8ObKlMJ/Ph/UOWEO+v7R75zpUSGqprUr
         JUHY6Jt/bXOE/40gpD60TvtJuCZEtz5Ov6pklNctzdKYjpXDWJaFTZWuK5E5hIP+vWZq
         pEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791068837; x=1791673637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui0hYY9c2dDrMn8vS9nrlZOGWWpwY017RHY+Hel6dAM=;
        b=edS3dygrhL+3CMFH/BK7J/jpx4PRkgavxqyVI1+73AE2Y7W0/uCTW+xIJoCpE7qTg7
         BeVTcjswFmxmDJbcL+Flgf6GBlErg8aRUtOXNjandvO4/OobuV3cGQM3PR3yWr4ji9OY
         FUR6HRbY0egtad3uhyiV+7HxlkGGF6OOfyXm+8Ah/zPNqRC2CIR7BE0e/2debOtQhY8Z
         2ni9qhjRpPG5S1nxrUJk5NIb4133Kd9cbNwBmYh3jN8b2F9uR73cA5folzjGdZcwxxgJ
         AzwUWeuIH00jlHrz4Vp7NzsjVcVBGipCQJZCCF2WemU9E5MdQKZvZ1WcpQugiqjquW7X
         IUWA==
X-Forwarded-Encrypted: i=1; AKwUvBxoTknm9d2OM2n4G/FZ+adSmaDCx11WcAj9F94fO0RO3hwjPW+cmCR0lUNAdsMYHRVEDbDv/cFqEnqOuzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7lb6wHf3jqjddjjkb0nBkeBsjgZoBa8bEPMhBxg5jicutGN0s
	ESrR41R+VsI0IgTKgzLwgX5evK1l06yqhQbsAHIOf14HmZDOgxVlMkPmfiUNEOfnDuEWjQ/t71D
	twFA/bDVfb50NJh0Y9AU4w9jKzdUd/aFwpg0w8zakqLAkFw2IrjJx1j00ThnalQy5jxw=
X-Gm-Gg: AYBFou0uZml4Ge1jk476Ag/05nzGeU9BQS9y2fNqILeaWVnQArLDLobPd9arTItsWzs
	PqbfE+GmSUwNFGfTj/pm/iM0u1ZmqirPAVJdE3lielwrdf0kMS6qviIHRUHT1kGpKE9MIwiBXK5
	qL+hOdRM3IPOF8Pp+VjHcBfJ9OrGPeYuGnfs0ualUcObRSGUpqYeLLMMv7SoYIX9Ar9M+/+avfG
	2cyExI6elqEV0mFAfq3fSh+r0pdH7fB/zCQZc/Ccy2RHtjMQ2BNxEyIaEWQMK589iq4zorpT2fj
	Omdz2x9uoVxCflwz7rPjNjOIiFqPKPd3hfG02UZzr+f/aW1NDOS9OQChq+Mbs9BY1mR4qDkRPot
	VMTFK197thlPhkGAn8isrN4Z0eqa2cZ0nBasMMseS4PfC1gNdaxHPq6PHYg==
X-Received: by 2002:a05:693c:69c5:b0:34c:45da:9b5 with SMTP id 5a478bee46e88-34f150c28c4mr7992622eec.20.1791068837124;
        Sat, 03 Oct 2026 16:07:17 -0700 (PDT)
X-Received: by 2002:a05:693c:69c5:b0:34c:45da:9b5 with SMTP id 5a478bee46e88-34f150c28c4mr7992596eec.20.1791068836529;
        Sat, 03 Oct 2026 16:07:16 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271612e9sm25294eec.12.2026.10.03.16.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 16:07:15 -0700 (PDT)
Message-ID: <dedcc778-3459-4f08-86b2-55aac20d3e3e@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 16:07:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-3-yaojiale02@163.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9IwEG2waJToYDVp8PH8u1GjxR9tzJU2R
X-Proofpoint-GUID: 9IwEG2waJToYDVp8PH8u1GjxR9tzJU2R
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac18aa5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=Byx-y9mGAAAA:8 a=JhsGp5YEgYEiw4z---oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA5MiBTYWx0ZWRfX3HvKmVYNNRq0
 q8xL5MLktvYy45V2sPzWUrzcHHXLOpriqZGT9Z78ilbMaexCjWEHOieqgotwHkbyGxe4chTK77E
 mkOXB6dQPybHZZqdpSHbjvn0rRZXK0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA5MiBTYWx0ZWRfX3DSQwUSDbneR
 gkzD2IsvBJ/Wxd1s0SLnV+ENu2hpzaCM+NLPzyU22sd1ayGPGjJJfzfEiiTAVdFuIc7vzpjyBSq
 NWN70lgvSFD5/PytvCRM6td9vscCZVvBKTFy1zs30d6FkxPuW1opTs9tcgVhxnv46DGSDwGgbjA
 OaeZLOS6sMaeZL4rxbagB46PKd9etZbCzyxrfL6hl6VT6guxLj9tdb99K8IgcprQBxQs4HZHHWs
 fgx/5V5qBhbvmkDXhIYOzvl7ceg5MZoJv77tN4t7zorym8FiP9qbroc7gfKwd1FlTuDFPKSZ6gl
 9OrsIg//2/cjL0C045GaU35N+y/DWSFuUpNhpKSCTNMvkloClYZVvr5/scXV4OC9apd1OZmMyXj
 axqeJZJE/LDQqj6UfxUny/hLOTQ1vO5ib230Ewd610lVUULnOrdiyWf5CC/GdojJGN/WIN0EiXK
 yru9p0vHU4eUGDk3RNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030092

On 9/26/2026 5:12 AM, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index b772181a496e..f84f1828275a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -6190,7 +6190,7 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
>  	const int size = 32;
>  	int num_args;
>  
> -	if (count > size)
> +	if (count >= size)
>  		return -EINVAL;
>  
>  	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);

Documenting this was reposted as a standalone patch:
https://msgid.link/20261003095913.575108-1-yaojiale02@163.com

I'm taking that patch through the ath tree.

/jeff
