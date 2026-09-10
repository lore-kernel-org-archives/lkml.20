Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD339A4A4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083397; cv=none; b=FBpg1eOXzyq3tdtHwuC+WMdMEdm9bNjOP2+WfYAlZFh3eN07SDfQjnC81NQrxdEWcK6EYEy42C1CCO6Pm1YHO2UdWjGcFYM5itrwlmSUeTj5Y//8sg6iKjOr90FPTP0inSoXly+UUXMQoJTXvwph5xqb2/V8seRJsIb6e73LMmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083397; c=relaxed/simple;
	bh=epgqlBySMN6w/cVjDW0RVEJKWkmkN3AgYj4lnrkHhCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unOy3i5NfO2dd5594WHMZehxLPkul96aYtUGCSWloojTEub6J7YDukVZ+EZfxLzT20S+p70E3oJN+D7gD+8HcqehR2zlTCGaNPyWVkyFP5TVM7FjtriwYrZ+J8pz7XjDDKBFwe/iSDfNTRRSYZEsQHQ5tnulJk0qkkoaq/E0CFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCwW5ekC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGhZeYdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCwW5ekC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGhZeYdt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALU3Fm2996556
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+vvzCCj9uIOCMpmZMgB4cBfFQbtwALqKT3eGuMlqX0=; b=VCwW5ekCY6iefRfk
	3Iu3HlcrVCG3NeqQAqI5HYNLMG/AvMpzyzOQ9BSzngOEEMKO3qP41rCgJ3ZzW1QB
	6CVXG7veTJwWm+38u6NzMAVWeaqdoWN2b82jh9R0iaGKYs7YSDQHA0N1gCxK9+9D
	Kh0wdhhvh0zyhABDlEoK5l30FjfuQyyeemyobfnKX8pXZ2a6J8Sj7mYdhSnDQWtm
	+3xOrxbl8pjro79dvDCnx0kpCJnCxBqYf9UjfppjMs65x24ycWX3H6yD/3SoO9vK
	4poWOhJ50shWQ1mx2cf8YG03CaonSulaZJ+u6AvUChGzzvEJ/cVLbf7CCaX9Ss74
	XjlTog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8t60a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:36:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so324175a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789083390; x=1789688190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1+vvzCCj9uIOCMpmZMgB4cBfFQbtwALqKT3eGuMlqX0=;
        b=BGhZeYdtVFvG2Om9aqg9N6WSev/KVO+p1GK2JnJsGFYvYujTJ9D5nwGdgjMFxzC/S6
         rSIa3MmR1gCRn0uMolvZPO7gpf+UwP2/rRN5oCcF+jQ8jnedduzj1RjbiSmUn8UqweZH
         1XaYPuuEgy/oCmBplJvt8W4TFsK/Vc2Ondm6i8sFPxtC0tYgbSGv+peCxQRAg0EnEtO/
         HFiqHARyu5FqexdobOEEUO8Um9QB4nMW8nEMzgEHFVFbhbKcM3XJ/6LNjpUw3wFWv2aF
         n+BPq9TDJYMZ7tl4G+dw4N2CVVYYhy6YRLnEktzotoXZEsiYQUVracChOPAEPuApl9mE
         7YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083390; x=1789688190;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+vvzCCj9uIOCMpmZMgB4cBfFQbtwALqKT3eGuMlqX0=;
        b=qc1mnEkpKiRq12URbsecZaw1HYH9sTV+XvRZhqeltH2DouHI4uIqdHkPZiKlo/rIRE
         6vx2apPqlDaQXWNtLB6hnyMNwSZXkEk16gdjnZeRRHspu2v4oKgV9DEsujcJKtb55BRk
         wSsZGmDNlf5lF9wMnz1UcLCdfVFu4RzFXZCKQ8gL8C/tmTnAA/bbysrBEPi3/x9h6T1R
         PTsSdJNAqOaBMnW5jT6I4rEEm3pwMFWzzSGHcywl+KOICtA/WvBjIovDf+C6KKdOrcdQ
         OF1C3xclp4sSxipJChXZ7iHLD2jvp3dTPy4OoSn/efE63/4Nw0xDTrieR0Jzpk3cdDS+
         zKxw==
X-Forwarded-Encrypted: i=1; AKwUvByQLIkFtZBLRan7WNOd4iFmCtGfueLCNNSrqgkxgYv9g3xQz2uExy4+BZlt+P+eotWeZ5RjaCDhQA6kKEw=@vger.kernel.org
X-Gm-Message-State: AFuF++kdi1ymcelsOCf3zDsUYtrqztmHXn8LbiRGgXV9ddz7B/5uXyoQ
	C7dpTdKStsVpmXQKIll7BXw+QU6GfZ7Df1Uaahuki/Iuo4qnG+KyyDmiNdA/gKi3Mzc/9LP4swf
	gwAEzT909+WJMHBOomoW28R5fgm2q+oKzrPiCu6jPjyUDoiLuuNWMo5Hxd8kEdnoxhUbmnXI6oX
	I=
X-Gm-Gg: AYBFou2wDO+NwqjRl+t1WAWy1j+wwRw9BlpT+1XBnPu+gTMGc4MmYGuui6KdWIPkxjQ
	f5GZ7pmna/ixTsAUjimIYlDM0SX9unuxDxKjquOWj6nYovsELxtUR/2TF1WlxkHjGt/NyOnAqwI
	jPXcGQ0EDjFxI+nQ143Jtq2f9ncc1yElMe8O1kCLWZrslOuTFGJJ6v5WN8fbNyaMPR/KhYSGtMT
	SBVDzs7yqxm9e5ZokEjS6VjghWCbsdgrkMHw0u/fYKbkxG/FJmr+yYRs2N8Jp0n+ybF3VlMaRd/
	5+hh9qorhBT89EbZ4IP6gHYsfKCwQPO/Qfa4Qu+Fs4UTDcuDvS0jo050r450lY7gZbLFVfeBwc3
	cStz8TFJ2kKnZ6n0/u7CJu7f8rSyf9IxjPwBUAWzpiQZBbls681b4rQ0=
X-Received: by 2002:a17:90b:2f44:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39d9c21f686mr1988979a91.20.1789083389990;
        Thu, 10 Sep 2026 16:36:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2f44:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39d9c21f686mr1988929a91.20.1789083389498;
        Thu, 10 Sep 2026 16:36:29 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm1895630c88.0.2026.09.10.16.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 16:36:29 -0700 (PDT)
Message-ID: <f8563571-3ede-4f5d-9744-3d72b441a4b5@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 16:36:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: wcn36xx: Fix potential use-after-free in TX ack
 timer teardown
To: Fan Wu <fanwu01@zju.edu.cn>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>,
        wcn36xx@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Song Li <songl@zju.edu.cn>
References: <20260910020907.3353-1-fanwu01@zju.edu.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260910020907.3353-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cAswkASB2iJOYGpEDS4xW9zFiYC1fmzL
X-Proofpoint-GUID: cAswkASB2iJOYGpEDS4xW9zFiYC1fmzL
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa33efe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=OIB5ShivEfEboS5j5kIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5OCBTYWx0ZWRfX1lRI83JMQGA0
 v67QEIyzLovoh/8+nsori9MvAxyl2Bmo1BNntTjvnZTvmj4x5/RPXb997OjaThLnSAYNTZJC75y
 QLKOR+bHXKPhluevbZoo1cP43rlLMDoNZMndMB5qg2bfi9EhQUJugauALgxnGmSzRlTNCLgN/IC
 UAXOonhEIVLCKlc6kG7C4SNK8pOm/UUPJitVJ6j7OY8WTPaLCCPoJgOUAX/UKRZR4rIN388Cdzz
 wqwi7w/Iqet+2Ow3JmtdHaDFaeVikz+6Xrj+eOU0kjrsr/WsVUykdXGl00srita/R+yzM7IbKFR
 bVQNSV2w2ueCIdOBZXFH/5/tCfeOh2ZffTCQEfQ/d35LhDQNcfbBZFFeyK5iiMbVcbMoGjozIQK
 tXeFP6j6M/exp9ZuvE3dTa3q+XMBDEbhMOYLNWfEjpt7PcRgnf5LrDxGqQTL/Hc6T97g1Tcpq05
 qA+vO9N8ChCdOVF8O9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5OCBTYWx0ZWRfXxjvJ+P0JUjNT
 Js3fL2jhwhCu6eQCPZ1bAQnxI5ZzPHp5JGXucvbqEDHklDtDVGSTRv5xC3NY1lzZ0Op32Oxyrvp
 O81vOGCLKG3TiwAOaUBXwJP6hJETbfM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100298

On 9/9/2026 7:09 PM, Fan Wu wrote:
> wcn36xx_dxe_deinit() tears down the TX ack timer with timer_delete(),
> which only dequeues the timer and does not wait for a callback that is
> already executing; the preceding free_irq() calls synchronize the
> interrupt handlers only. The callback, wcn36xx_dxe_tx_timer(), can
> therefore be running past the teardown and use the wcn freed along
> with the ieee80211_hw in wcn36xx_remove(): it takes wcn->dxe_lock,
> reads wcn->tx_ack_skb and passes wcn->hw to
> ieee80211_tx_status_irqsafe().
> 
> Fix this by using timer_shutdown_sync(), which waits for a running
> callback and also prevents the timer from being rearmed again. The
> timer is set up again by wcn36xx_dxe_init() on the next start, so the
> start/stop cycle is unaffected.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: fdf21cc37149 ("wcn36xx: Add TX ack support")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6

Current guidance is to just have Assisted-by: LLM
https://docs.kernel.org/process/coding-assistants.html#attribution

No need to resend, I'll make that change when I process the patch.

/jeff
