Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596758;
	b=rvhTckL+5slLuzEQBcNIT1CzbrIzJpO+9CMwM/A1eq13nJUH86DmpiTaWk+rh/LUCswR
	 kKq+8i9/q/sfxcZwlPQ+5JUDHMnkn3L6+hFp/3JmSGtxELyDxmbohbFKfglSbPWeZMHzM
	 nN6LT3MwsIDtFKJAex+AQbZ/AV1GmMSYPvEgQMDQAccMuU5GzWq/I5Wa1WN1EYxY3vJvm
	 JwiRy9OjwvAgq6vVa5QXHMjKCjBigsvmMU1nwfZAlCdrxeJKvS3kK5nuYktqP4QBXxv4T
	 YS/BfRYDqBAS17v17eQMJNHHEqNKWT0Gwf3Ppy2srlWsQ2VRu8ZpJ42VrzKXfrnATDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
	b=TCV1Fct0v3FAChBVkG+Hewioq/FLrey0c3vkc40AKCJm7/VhI5x2+OxzqdVKWcHf8gXp
	 6EgC99J6S01wqwZpOzNIZmrF00Bv2rfjMPD3DPlmE7cniRI+5jcr9KL6K9nZMxiL1QaNF
	 ellrt543RluqwMVkL1TML+fcCjAGVv0uUHH4T3KLjADmPG5MzcXBZ0DhOb14hWqdxA5Un
	 8aereFsCWY6xJ8CmlICClSMKxrbNqu5Pwc/pyTBh5ZHikSK6QqSL2LPxwLToqVrnlwZGH
	 VN/9ZvpSe6FDe2X6BXojhCKaIAqWl6KBja067dlY2Mhr7rFIJ+T982vquYED7Ea9tjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=naturzKn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D1SmIDf6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E77606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E77606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=naturzKn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D1SmIDf6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ22ZD1563680
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=; b=naturzKns/Ro24Ut
	42kO1hKMZb39rcdjc/j+jUi5OossdXeht+2JJb9mkcTOmi9HGwyczRA4363X889O
	LCSCjUOJWqEU3Gie3i8r+lBPGt3oW1xsAo8CXA4Wn3Sq6xzqWWCQ/+tJUHQzX9Tl
	eoiSoopRd8HdnULH127qu9iWTHq9aINfRw3PiFrmyiscHxbrrr/mXpvdTJTPpRAu
	MjMIzXrxEehOQI0KBKCEPnWFhEjuvR+yg+9mcXA4o7AsD1YvsrSNcX1ACyzi5M1C
	U1iqf89Tf9ZMr+zL3DshxqCz096BDZtNrr4KaTAEHp3SJ08ndImHL/JnLJRGq2Y5
	TNdi2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdmkbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37549877380so1646850eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596757; x=1795201557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
        b=D1SmIDf6Oma65ySp5zJ3r+77cHhai2Qam6WZ4wV+ae2yiDrGtwH8Df8JDbKid/64r/
         hGfscZ1xdLioYa8LS70b7MwI0JilsZZcQZKreJYHtlKHNPTcDHBQWPoD5MNlHyI0Volb
         0r1JbqikeHvIL8bybnvb+G78V5FBN14W0NGI2JXjTeOedKQuoPPy6rLQ16JMOa0rBY8K
         Nnta1EhovAORwKsEEUWqn6ohxi5MvrfIzxsh029UbZjzvaYPQBwuiwm8wRNCabYx6OXC
         WBULmkpVZLeEEWF1YgtSt+dKO3fPHzIWSFP84ie9tZQyBh6rkRpl79n+Jgeii5mmBBN4
         udHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596757; x=1795201557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
        b=gE5FWJatgkXKcNLLJp0v2fZMTThQbAQNZ8Nm7qcl/KOntAxYWXNzFP724e6a8Wyoo8
         HDX2KVw3EiC3tmxNNPM54Ckv6YoEXgHbkmnPivfZnelvPLHSQY8+OobWjC3pC1JhFqED
         36cVtyfiGEBvMZMWinQxCgDechhcfXf0WomacGix8J7kjQwUMp8ZQQ+EVZ6+jiHTr45E
         OQ3OsE0mGFiNSfW/EIbPU1becbymg+ESSPtIhwszo63cCIdtjPWD5ysSpODfLVIFiCMW
         Z29S0Mp4Um77nk70xKqfpmy9oMWoa0pV+G79/JVQuShImV/nku7H2gamgr0oVb+XG7+7
         yvsA==
X-Forwarded-Encrypted: i=1; AL+hErEFddw5qmWbNqzgikvGl7JwjatS9yQ9yGQyxLvJ+czbrYOeWQnRfyM0ixevAGnVgIloPBfEvuVXC/1al4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z85a9+AEYZeLD7a2Nmb25KSXwVjAprifrQv5vg7kJXKqFVoI+5M
	e1n7zxnsCf40QhJQSgf9gjFT2oNecNBzcbA0tbO9o1tKxsh5AauBWVHvlpcH398Sm23wacSPBFv
	qG8DyOhNeZNJWSibma1yRtJmSvOJaSRHP9jzfTKSmZGAosk4eOexeMvNag2JFELfaLJo=
X-Gm-Gg: AYBFou3oLQVbn6gveDQ1xKUZzZ6B6nB5Fe/Ahy9T4pDmh0giYxrCfvwXFQ3LulcrMfZ
	/uOtF2al3InkAqlGjEO/YuAuaDOGA4yeJ5oPn7MYE1zhIgbFOIsGs8vON0uw3U6EsInzWXsM7ks
	YLeSU5DcqIq+n3u3UJJzU+UbhZSYg0n8YJ0uwv6Xb3ttvX50y5xzGUPgdJpY3TyWI0OG24FZL5g
	qKDZsAxj6OwwFcQVK2J1U+xHPL04OI6SqYq77lsDnqFoCU9OPm2nIhvhZ1nV3BoqB07LZ1TfzAm
	8RJsXwtgEw1GHT6dIgTc3ypmaLLbkfHYjVx8qiBWztUeM4KunybnMkr7FRIgEr5sB64D3JL+2Aw
	elvq3Vhj1Y9Z0erLgzegAiS3thEV+oxidKDD+NplVwGgvtrRH2LSZBtMlJbGB6SK61K2cSlA66n
	HqaeikjJafVpumzHfwMCTr9Z4=
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr2697355eec.30.1794596756861;
        Fri, 13 Nov 2026 11:05:56 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr2697326eec.30.1794596756183;
        Fri, 13 Nov 2026 11:05:56 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm8616314eec.4.2026.11.13.11.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:05:55 -0800 (PST)
Message-ID: <6b3fbc60-34ec-4b7e-bbc7-84a0ec5d496e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 12:05:55 -0700
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
Subject: Re: [PATCH 1/2] bus: mhi: host: Add debug port personality switching
To: Hongxing Xu <xing1989093@163.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261113122302.2174-1-xing1989093@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261113122302.2174-1-xing1989093@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfX9r6MZbkZt2QE
 KRF0ME4gGO5aR4CwPqi1aVHo6ArPfEzsMzyFgELcnQpY7q9DwgghNrui/kb3e0WEdrD2J3WDgj3
 IswM8CP3e1qQfrc9ovPa7NDC8OF4liM=
X-Proofpoint-ORIG-GUID: y-t_u1FtmeGdg_ZGyrlr_fIyMWr6oD8n
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af75f95 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gG0Lje7BzgQcJ5p3n2kA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfX0USGHbXmuGwo
 8LrXtK+ImfS/NmOS72HY1KmX6cxAiXIN+jGBHF1sl0fPo619DFyrtNGzUf8TRZ8OoghA+VeaP39
 PaGXZo2DDpv44leFZCF7AttBm/w6b9X8GFUyPhJpTK2NBEce1SL4VpbcXJVCvX7bmc1HdH4uPEP
 Kw/eYag82UvTix32TyGPsyKp/8Y+z4btvSc3sZMa4PtophOO38mQLVavGPIBovmkv6t4jdt2V+6
 2Rz1ffkLdcoXd6h1Njq4uB6ExyTqf1vr7PzkyeiEL5bOaAe73FKBykz0MYzKCTPKbrLMgeEl8lD
 oxUMgDQ/nEITILjxHZ+uqpx06Bih5dShnUGaz5ZO5G9yuywP/CFLA7Vh4Igsl3w7Z6OR5iE09Wb
 hHfHUXWAA6k7d8hWHcC+Jfa3jI/cni8iWb9H7goipFg/on9YR8AY3v4vmzrwv7hboviBlAk3Eoq
 hQp52cgXajKKNcSErdQ==
X-Proofpoint-GUID: y-t_u1FtmeGdg_ZGyrlr_fIyMWr6oD8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130076

On 11/13/2026 5:23 AM, Hongxing Xu wrote:
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> index 8b9698f..1fe8510 100644
> --- a/Documentation/ABI/stable/sysfs-bus-mhi
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -30,6 +30,20 @@ Description:	Initiates a SoC reset on the MHI controller.  A SoC reset is
>                   non-responsive, or as a means of loading new firmware as a
>                   system administration task.
>   
> +What:           /sys/bus/mhi/devices/.../debug_ports
> +Date:           November 2026
> +KernelVersion:  7.5
> +Contact:        mhi@lists.linux.dev
> +Description:    Controls which set of ports the MHI controller enumerates.
> +                Writing 0 selects the commercial personality, in which the
> +                channels that are only useful for debugging are not
> +                enumerated. Writing 1 selects the debug personality and
> +                additionally enumerates those channels, so that the extra
> +                WWAN ports appear, e.g. one for the diagnostic interface.
> +                Reading returns the currently active personality.
> +                Controllers that do not describe any debug-only channel are
> +                unaffected by this attribute.
> +

Why sysfs and not debugfs?

>   /**
> @@ -381,6 +384,16 @@ struct mhi_controller_config {
>    * @no_m3: Device doesn't support M3 state
>    * @irq_flags: irq flags passed to request_irq (optional)
>    * @mru: the default MRU for the MHI device
> + * @debug_ports: Whether the debug port personality is active, i.e. whether the
> + *		 channels marked with debug_only are enumerated. Controlled
> + *		 from userspace through the debug_ports sysfs attribute and
> + *		 applied by debug_ports_work. Zero-initialised, so a
> + *		 controller starts in the commercial personality.
> + * @debug_ports_pending: Latest personality requested from userspace, applied
> + *		 by debug_ports_work
> + * @debug_ports_work: Applies @debug_ports_pending from the ordered high
> + *		      priority workqueue, so the device creation it performs
> + *		      cannot race with a state transition

Are these optional?


