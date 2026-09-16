Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A0E274650
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528156; cv=none; b=TTbDCeljLSnI1ZurDCXVeAZR+54EnVv5Yl84rmLlffYBFK2QqibYfS5TG0KdUlshwK7Gx3e/c0NemGttqKaih/E9U8T5z+FhegL5eYMHqGIVZZODhs6Van4hgBbynqmhyXvtzqxr1uCZ7GwdIRbbjwSQMIc4A5+9ZFmowzdcnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528156; c=relaxed/simple;
	bh=yM62N2H1bOa/X/eOm9XfJAW2/IsPTDWnjWPkAJTwNSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxrYcBm8WNE3Pgdr0eb0WUKN9HSVf9fW2lCVRBTeyaDRv7725wfdykCNNAzWve24D+Y/lMHxbeKGZYNQKKLUK+iS4ARFO8iyyKBlFf+5bUBw9SpeZP9OJPaZYBOACwmpFPNFmNNLVPK/v/5b4/g1ADdEeI00aicOr0qGPYU15/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2+SAIH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYgCtG97; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2+SAIH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYgCtG97"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZ0F1079873
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=; b=C2+SAIH3viTGtLwt
	anuftS1UbBrRY8f6gP9mjistQDrN/AsiOiQf3x41sBtkTrxkv2qkMlbOelS7+vFH
	IxyGug34Y/8nBg3B0mKx4XygsIaqK+JD22LiMRTr4Iy5BUaoywgK+ha9vuy514bj
	Yv09UMS81I5PGX+OFQalGYMrKhGXhHuKYqG+0r2uQCrnEHQWgGabyWsvjY/Q0Lao
	VN5Lj1mSx7kknMqcLPpKj1pebCw5TB3fCq4/rVDxP2uuD8c9A8X/6FqQ3xbfhJMO
	olYD8haiGPL22qeTSxSnAJ5yAO7Drp62KAgx0RiblKph5ca7GqEBIgHXjfIu+Iaj
	ZhKE/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagej0ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:09:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so3954011a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789528152; x=1790132952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=IYgCtG97oCtgCwa7XV+JVsxNC/SVkSZfYICs+eB8xSAoGbzIHsWLwTf44jDRZQpXSV
         vW/3w7r0iSIls7L7DvyVSv2+mq86/HVSVnGTzhF/9UdIN1XO/4ttOIMTC+5WZkan1T1r
         udpsWj4YWdgmIKBzy0vWpds8+cGrXnA8q8w/zVtKzh3d4iBLU31FkY45Y4WuOXwo9cYv
         nSfFLxFuK8Wz1a8Ekv6+1waxsKwQm0D6Ct4kmsOpQYJI05VHodh8intXVnXvfqyIs404
         Sfq9ck2MdnLPMHVA0kT1K0JmaC2QactnZv0ux5OYeE+B11i15fXqtnpzkydD+gKCvwai
         /W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528152; x=1790132952;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=jmq1T06Nw7i9EGuxrDuMDBvKEBb2BfsaF9CxuUt0NvkxscNzeBW068R9VHIBNLLtV9
         FfX0nTpNk26QH1sICPtmR9PJSyUYbageHqL9Nsofrz6tECPP5ZECjpg281penLzgtXSS
         mL8fRHxng4bMwiKjbYkH6+E4UhZ0GBXgOXVCsH8SS/EgO2NXpi5l4ocLtUBcf2L9cd5m
         9PviOfvJxSDN5k9qOKMMPzhiZPbuVvgDRoOiNdvPPI8Ge/NjGEsFj1pN0t7CG9PIR0pH
         hvXPxrr67Nj9hd60v0kV4DxOeaP0i4mCe3FHNostIGAobObuK0AwLqFDzRLr5GROWsyz
         4dYg==
X-Forwarded-Encrypted: i=1; AKwUvBza456Zxhgw62ora+AqqE9+CYAm2vfTywBZKUwuC8rxNTxsPxvf530smYSXHi5CwXqK2/FoHiDU7yASOCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwL0Bxa/Ht3hiUSJ9mISkYhzqobRhJrYtDlaJpHi1AWkIjB7wA
	2H+xbri+H6ULZpW1VQGkmVQ98Npq1UADHH9+KVT1KqYnEjMMgMpR34kE0LUI3HZn8GAs0Xx641D
	5rkbdxIvLiavMv1rgMEZLqTD6yRWaLfKl1L9A2q8+zyq0npO+2gG96cuHZfD5WGbVxrg=
X-Gm-Gg: AYBFou1n3JvZN3zi+FULdEacfiorWjC994GCKOnAxlPktMXt7rtj64/6AorxKEsCxuR
	GzQ7+wAW2jM1ZGeuogUQXsQe77UVLpSudaw7DRWIRRIihnlLlpjgumBIioIwKgQIfGMoyQdklAb
	YYeRIDcNz2Z+2RiId2QE5FFRjnBBZYp9OYpe/Ic3Uq13/7x0egzCxbKLWQwxB7tr38dN+b5/szJ
	1I5QSJn8YEUnq2c9eDuXYDyNUuxwo9+j8j+s7AB4sJXooq/iQnDVIQFvpVhj5fYe5yYFtNB4tA5
	2jRvS80/FwP84hPQyQvgC84VnF+P3U5qRLlBycUE3WOZnZct1ZYJBWaHJYrdY3O3N9M2bctw/HA
	OLetePasDNyd1WrM0WW/Gg7hfHNrII6s/WPnY/ahN6aYvPrQGRpyKkaf8sQ==
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015588a91.16.1789528152060;
        Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015526a91.16.1789528151476;
        Tue, 15 Sep 2026 20:09:11 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3191996eec.15.2026.09.15.20.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:09:10 -0700 (PDT)
Message-ID: <6257c447-788d-4362-851e-0d552bcf7c56@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:09:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Vlastimil Babka <vbabka@suse.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Daniel J Blueman <daniel@quora.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Takashi Iwai <tiwai@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20260909055846.16539-1-daniel@quora.org>
 <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
 <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzOSBTYWx0ZWRfX8bhH6dPUWM2q
 Rlid7rtovtKU9NnMslCWDTnLy/hX46djKkGYv8VpK1sDj3PfEvW9KIhBQMMU9GDqBaPJu3Z80Bo
 cCVEwaf9QkILHpO2nXkxge8PvBp9YQw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzOSBTYWx0ZWRfX1QZNZmygT6Wm
 W+ORJzci0yBlNm58tDp+H13ZUi1bZ2PYs4946uylAyJJ8fV7Dpg+O1TQduXprbfMfc4i5S9yD36
 kaPBM8rnGzUGZ9qkfuxRkXIWTYZxTQYF4KLI/d4GaS9ZViCaTM2YBBqnpWWs9226h785ctSkNAi
 ErIjWdDsH4CjZAuZsGdgueahj65BcfGFr6QLwYzpphFe2mOpbmAtMQzlV84hsxGdJo330mbceS9
 Ds14+79kPI8MkUq6e20FWkoiD8w3wTb6MwZbhHRqlat9yklP9SxJUq2f2J6LkQVTUJvHWkXWyRD
 fg0gYcihZxmYOpRWRSfNQ0lgG5Q8Cv36T5fpa1NaHgxaShcvX+KsDUp6BjLzojEkxnb+Xy3fDTB
 2RAeBCe5iVel5h8OgmPdJD7gVKRu3pLaujUgmaCfi4MrCz8su9gaYxq9XSDfP9XhT8fWbSw8Xd0
 3wquSvtGQv7qcENBfqA==
X-Proofpoint-GUID: yq2SZIgyumfZdHPe6aaQO9Had_9lSFf5
X-Proofpoint-ORIG-GUID: yq2SZIgyumfZdHPe6aaQO9Had_9lSFf5
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa0859 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=_wE0MnXGkHm9nJMVzvUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160039

On 9/15/2026 3:48 AM, Vlastimil Babka wrote:
> On 9/11/26 12:44, Manivannan Sadhasivam wrote:
>> On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
>>> Since the MHI HELLO exchange was relocated, it is sent only at device
>>> registration. During a suspend-resume cycle, the firmware in WiFi
>>> cards such as WCN7850 indefinitely waits for another HELLO,
>>> triggering:
>>>
>>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>>>
>>> Fix this by triggering the handshake from resume_early in the MHI
>>> transport.
>>>
>>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>>> suspend-resume cycles.
>>>
>>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>> ---
>>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>>  net/qrtr/mhi.c     | 10 +++++++++-
>>>  net/qrtr/qrtr.h    |  2 ++
>>>  3 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>>> index 78347c937af7..2ffcfc2fdb4a 100644
>>> --- a/net/qrtr/af_qrtr.c
>>> +++ b/net/qrtr/af_qrtr.c
>>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>>  	qrtr_port_put(ctrl);
>>>  }
>>>  
>>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
>>
>> Use proper kernel-doc please.
> 
> Please prioritize merging this sooner than later (it's a regression from
> 7.3-rc2 that would hit people if it made it to 7.3 final) even if it means
> fixing up non-critical aspects later, or by maintainer upon merging.

Concur. I recently fast-forwarded my ath tree and picked up the buggy commit,
so everyone using my tree is now affected.

And just want to point out that many of the function comments in this file do
not use kernel-doc format, so I would not consider that a blocker. But it also
would be trivial for the maintainer to add.

I've tested this on my HP ZBook 14 where I've replaced the OEM Wi-Fi adapter
with WCN7850...

Tested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

/jeff
