Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893243;
	b=sVv5Jrvf0eNYcaUowcwzn+anfkGWSa7yjw0PEwHnY4B/ejwOlTWbhl6gpyAab0le+WG8
	 5QkzXXY81WiX92GxsnIxU94E0nrmZgowvLbcafVEow9L7uxY/fy67u9Rd+8ZLVlBM1sxj
	 0i8iIAP4R4QEMOjGIzcF1ANzdaJKLDrKMS2ze1xmehvW8bD8APL5kSEV5PuP1fKur8tT2
	 VLYd+BJv8dl9Ko3k6QI9y/eFJ4V/0H9RDhkkMGgFkAJTNQYtmBJbxUWC2WrQvZmhA9k1V
	 a2TxL/0kgklHG+2iKTWhcH5I9v+AiD9601V8em4lGR1+q25bptQm6mYPrW4ZnXkBdNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=;
	b=XKwrwsr4RrxOwE7J6nLiChjXbzIfkuLnmvlle65ZWLOCmFNTGdvuCZEWABoZZnRi8tNj
	 VyIUbqoPNidSUiJKGSzFHhnjIR9htqwS/m1Ny/shc5AVhDymiNvsRn6ex6xmKV9RH7Mgs
	 v3+KQglKg7YxV+kWi9XAVr6gUeWOj8pKVvv1N/EpoqAm6AEZQe31xEpCRa7Dm6YFp1jUG
	 wfys6ZqIUGhZ9OLyLV5kKE6PfK3G0xs4A+y4hXmKuRUOrhaLB9E77xAsIge2xwMr88Vq8
	 /gBeWQ5GHKBA5ioDurkwORTI0AdNZImR08fXk6+0yNMfPcv8XtcdXV883zRoYLD23Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlwI94aV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihpJkspn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C72606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C72606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlwI94aV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ihpJkspn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ5El2082381
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=; b=YlwI94aVTLjkwCFV
	DWjRnl5Ypgt07KOpNnMNbM5XFKidQyV+uFtmpQvvqmflq1AuaAM+5ahEwArpixGx
	BsgkqbiDEiCu8tRB9d9F4m/hTqD7p+nO7fzvfzwArpakSK3MrxRbo2Sr6q/QRFlo
	tUwYmTX96EV91xlwz2QbLghTe9WlCmKQiv8QPkZ2VxvJIpqKZB33hkHn0ZtTpBqI
	8XnpZCqSRD4koDIPl7eYtZV8UkkpU1p5p+I/YNfzKFrnHb7oSjUIb3P04O1n4mou
	WjB3XiIFnNr9Tw5nGChoMYXGICji35sbxBK8O5Plh7B56C0ARNwCqp6QYTtGiLua
	5oDRvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraas84g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:40:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so384492985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893241; x=1794498041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=;
        b=ihpJkspnXPohH9jQz/3pVnVFnxou/vqyQsE/tw+LgEkVNNTQ+AVeYOTqQKQ0BRlVtK
         lEdJ0kW+h3LcoYHXHPnhzGI5/C0Zt8jJylo5Q8NSnapsrbTs8Vv6pd6iXQNMNhyyGcPa
         3t011C65XEaBmwnb6hvaunENwMBp4IScdyXv8TR6mTFgQKGleV7NkSZzNwooggkNj/Vt
         3qO8Ltyg/mknMK85EnulMegRs0dsMlYQDv5NotoSGFw4gpUsaUxale2Cpt1VQ34S0aKM
         1Pf3AmBF0xtlr0fR9gC0vFGqAJgOR2MCflOSm+icgp9v1ExfdFtxT1lF/9KiN+T7AM72
         RL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893241; x=1794498041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVAkQslmMydLHpoDYQUP0g/AIJpYFwYWqZKMMcXJLaA=;
        b=L7Jtbvnlhn0RX65IZ49RiF+NuRmRocNuMnJ4tkt5ypZ8BmsVvLltUMkUhCHlDtjz/W
         vviZCI7gRtOrP/8I8JGlZ8livpmeNA54NmEONrIIYp6eHRn7lAMpPy9gIsIaCi0snSpW
         jL57yREZdtpbmLT8W5Y1V/PXfqHycsVhXhmUO2mcd4fZeiuuWSd7FHMfh6N8q7NmuDly
         HxEu9Aseh4Ya+5dLrNCALSdX7MU2APC1PZA2g2UXRlZv2YLQjT/DWpElKNGyzUG25iVB
         4fFBUUf1appWWJUzE3OWoOezU87spijqo1VijrIoVDP4tR7gw8QM8BJt8tMg1R54bJ06
         4Gqw==
X-Forwarded-Encrypted: i=1; AKwUvBwLWP6d2xdDivZbC0J7Sjz1X15vMID0H4WCPzv4I+6xyvM9VvIDdyed9wuFLL8jfg6d/6go3MespwsyDxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/36zNNuF7AqvV4YRCQ9gT6A45SvVM3OQb3/uCHfNtGTCXx+tFO
	5NUe8iUn0N5ugKwfrniOkG1nhF4LzHKDRtqQr7Ln14q6EtQJyHzZCu1nffQqaOW1l0zzNBm7ald
	HGScHVN60IjL7kqChVGjVzS2jK8d/S126j2DErI3r1pUiE1icLHTZOQy38myZ1PaiYNI=
X-Gm-Gg: AYBFou0ZmWr8DO9YcOIqKuxZzyww1Bjv124GzBrSgpasa8n1VZz3K1jK7U3fNHOQroB
	8CFzNlt0LmHJ6Ab92VvBcYtu/rVr1CDH5dwlRP17Lumi6/NtpjfPHKueXIZZV5Z22NmQnaJEek/
	o6MM+BHVeI5DrATN0Senkg2tBe6yrhyqW+GnT4W7PCA7jXDYoFl/RYR/d0SUZK4VdkDgdjL7Ynu
	aQfdfx+o/btwJjb7PFbTXKsgXIMLyCWDtLL5Sir/7XfsznxeCPQYfAkjID6qVEKwtQOA0q4+t35
	wdUctAqXEOGhCdndt/gCbHdC0BnX+uCesqj7hXo3UC0MlSBEkQapXAvTrMElEGPgVmO5IRDJV6T
	6UvIyeFH++s40id4t0r6PVu/TB42OaVFNPwtju99/BJiEUIgXF32AZNhspJsZlON9VkKNd3iytf
	FFnvr63Q6kgqX41gCB
X-Received: by 2002:a05:620a:29d4:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-944216efcc7mr3223703385a.18.1793893241241;
        Thu, 05 Nov 2026 07:40:41 -0800 (PST)
X-Received: by 2002:a05:620a:29d4:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-944216efcc7mr3223698285a.18.1793893240709;
        Thu, 05 Nov 2026 07:40:40 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm95732535e9.1.2026.11.05.07.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:40:39 -0800 (PST)
Message-ID: <bde5eafd-3018-407f-8b96-08cb04c5917a@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:40:34 +0100
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
Subject: Re: [PATCH v2 0/2] ARM: configs: Enable the TEO cpuidle governor in
 multi-platform defconfigs
To: Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX01zM3jaILuEA
 H3BfSyMZbSuPXw//VFE0UV1Ax9TScrhu14aeqj+5M/lMjCGjR8yYqAWDPhqKMvIpzoDz8wAvkfJ
 YorAslDSL0DGSb8TtHYQw412gqA+Upk=
X-Proofpoint-ORIG-GUID: cWxVoFmvfenhq5CvS7drnTlOjw17fOcB
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aeca37a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FcKzS_pcoyWHRQSGzCEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX0JNmyQmnlIwk
 NOG8txBsNCruTWzYOreQYw+PmbnPQn+3KmTnGWzw1KR7JqRcoCzBrZbvK/GSx7r1BiO8RaR2Kpv
 wavXfr0xpjAZRjyFXXF7fjxYYXhNzRp/LxBDgOqKDK3vysH2jyYaeByKmA3nsP7kyxED6gWJIDV
 r4NN62i1Ql0kQHivB8Gx2TrIVrEhM41gmwkqK1UcqbX/57e7xTvBxWEw602ogs8cZyvODeUDBbU
 nreoXNGg7wrBefatbnwlKkqdVWhpl3aqnpOIIqjbouRSN15tdZN72bfuuhta8srovxZAGSXpGeX
 5jwDcDwZKrlwebmHICsSXH/KWh1IBWeouNWP6CxIYFLvxxf6PbL+bF5xHtCIxH4T5lbAhYVy34B
 cqCsFNi5QKFWrXUSx+xHQRnnVyWYEI13gk/UoqMFNh8zcpo0d7/zPYpAWySS8TcSPqoOHW6mIXe
 hExiiWqP1AHWalnyNWA==
X-Proofpoint-GUID: cWxVoFmvfenhq5CvS7drnTlOjw17fOcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050062

On 11/5/26 13:10, Linus Walleij wrote:
> Enable the Timer Events Oriented (TEO) cpuidle governor in the ARM
> multi_v5 and multi_v7 defconfigs.
> 
> The upsides of the TEO governor are described in
> commit b26bf6ab716f27955e2a503ffca1691582127cbb
> "cpuidle: New timer events oriented governor for tickless systems"
> by Rafael.
> 
> We need to gain some traction for this governor.
> 
> Both defconfigs already enable CPU_IDLE and NO_HZ_IDLE. Selecting
> CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, so TEO
> becomes the default governor on these tickless configurations.
> 
> Leave multi_v4t_defconfig unchanged. It uses periodic ticks, which
> select the ladder governor and give it a higher runtime rating than
> TEO. Enabling TEO alone would not make it the default.
> 
> Configuration generation was checked for both patches. No hardware
> runtime testing was performed.
> 
> Prepared with OpenAI Codex assistance.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>


