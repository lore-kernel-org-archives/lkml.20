Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333394;
	b=yzrm7RM/+SM15yShhIsB1faZ968+dRrWhWwOD0qlmbtFwc6dUyUw37d+lVYtqyCkeXtm
	 z1lzkGf6JwooO+6YRYHcGj8Z/85dThoowB/nJWaiPa4Nv4zjl/qHlkBsDA6l/eee1Xnqb
	 GkD+PtmPMqHrdleH/B+qFDNWUYjP+wQxH4qu+jKADkr7XybO9dwpUTMgrHlgKO3WdsGRD
	 sAmORXZgIHvidaUYgwWQz9h8qGDtEsHgjI4Z3vsSSW3mPQ7ZIN8u4G6l1RSWQ2xQlmrgR
	 qW9Qe+rar52IyxfsZgzkdI02Gupiu/JQYEXOS2a9Pz/lAYbu2MZdq0N0bMIZCkEqvfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
	b=QNe9Q8tuq35c1MwrU0JPwQ7aAkUTrlRukrYYXE3C+gePzoW4R/ku2ukk0jfn9tIgGN7z
	 EiuPoK89/w8mLMDqHKl49AvbTvhSlp4m8u3khb4Y/FV3mLma0G9QnPBbcTJcvYVWrhcg6
	 61YrhAi5AnhBgI5H7lJ+Q5XnJV9Lt21G28BdHgRJ2u/5mkBphIOWXjYx35ij9lddwvdIL
	 0CCNfAfIRqGHFzqxD8ausj5suAViDvfO3xkx4h7GdDowN2tgbb2xXoDO5+3lq5CIvUwOm
	 fdne9Ha0r2c+NU4tzWpO3DrPv16lteUoCGWic0TEyQ38TtknuSOT7NWCfvMD5gndlgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSWZn6aO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmab1KoT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B6B606C695
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B6B606C695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSWZn6aO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmab1KoT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Cu43713588
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=; b=lSWZn6aOLce+tvG3
	WgvAUUKkWfeSDc2aOw8DZAnZlOmoT/1P1xsn6I2RsYmtlPQj7OVcZAbZWUYnmT+2
	dpTYQB18HK+4vUO/BbL6MmLr9ugAplJ6OMa8jrHjuIAADR2JOlYFl7iSpv6BJrpL
	VqScEwwntSwSrW0yrsJjWjZUXuQ0nfobMOpv7nGLC5TUJEmuDZb8Ju814jHM2nIm
	oUcBs5XVI8xNXND+/Oq4wrFk38A4bAFwKCK4a09+p1x/wwykwxBqc5GIUdECnsnZ
	Jyw4gl9zoZHZYGsekG3RVxOeioQt+lYS1iULO6KpNKfjgpAuvsAPl4iicCFR1WQ5
	qggyBg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdaymf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:56:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so3481087eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333392; x=1794938192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
        b=kmab1KoT+l9vG+osWCGvAlZP8IonuFgVVlG/l7bTCIiCII3CXnc7ed3C99+J9mD9eq
         0roUdcre6+v7lrKbSOfGU6VsIePLE7buJv1Fr+swxSaU7XghkUVmKoTk7SEMrbO596lV
         DiSZj9jTC5JYvJNCquftsruKt0hCRs6k5inzEVnqIqOmT7l9iQMYr5BW72jGMXQ24xd0
         McgtQvjk6eyJzD330iRmca3QvyWVaYQdrl+7QOjtp8vqqS5ngNPMIn/oCHhAqZ5lZD0H
         54tNFXOESsOq7dM7UT4PGXp0efHdpF7/jmSFa0TetJi5bAY6K2hDJN+8SQLSvFPLjnD9
         uPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333392; x=1794938192;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
        b=gP3pO9KQS9eOANq1/9wfCjfudsH1SkOR+zvaZefvaPaxCRz14Md5i5vPI3vGlJC1+3
         /rByAR2dsKjqYRfcc8w58WanUHLQGbfJiDVk/mZWCz1cqVcRZYn2T9lwaTWY9fRCwRFB
         WgYw0PIbz1xSJvhe4ayin8YsQjtCTWR0fGCxNIjFKXTr1DdvApAC8rzwzbQMOp0GcTYh
         Xhl47nxoXpW0RLZ/hHR+40VerYNVMuo9J+I1EDeriCZun2sRUbcE49S1DCY5FyH8joQZ
         xdvaaBIzLTobOaZE0W8Rjgajq/9xn9PqT2ovPOs05XhZiKG9j0GmoN+yQlKFqd5DZhK3
         lqow==
X-Forwarded-Encrypted: i=1; AL+hErGx+pDblFSbZPPlf7ObafJQLbVHoiIzaIOSMaoXhpPhq6OZs0MTXm61T3LHZUStd7xuL1ZjRuNSgT0kxS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yyFvo5a/wKlil/tPOoSFya58mDnjFNIL6K7DqIVPYAzf/x9jv
	Nn4YtLezoWr5+/uiODiyALoroxl+jNjGnxSpG+T90BW3uF6/VDRi6D+fV0lq4AZte+2UWnWd0lY
	/13hSNGpV/0DekQ0rXtXcQL0/1MJfRQGi9f0Sr+jhrW//XYq29CAjoZ+uh36rt1E4hk0=
X-Gm-Gg: AYBFou0aR06Q8xEYs6xYi86C4yNOmmEg8toiJxPCXIxQlWPge33eLBI/FyoCQc3CiZ8
	+wP45qPtKnSxvMmLfvBKZxhyMaJrRZrVW6aocOGfLUy0FC5UVp0q9qtwBt8NPKeIuIeKrnuWzq6
	7EMx1YXqiuF+n3WGp7xPHzQQh+32AbZVumcOAh0aB7uTSp5MaZGd6dpG2SjCxnYUJwIg+wDfXi3
	S9UNPWytET0g7vzwb6cLGweJ8lQq51sxMLuovKUjCnrsvXsV6mHLRu+bahz3xItpiZw0Z+y3B8w
	8vdNd26UvaRgTfuucynFqO2c7v56Bq86m3FN4r3eUu6M9jwMyHwAdqC6Fp3S3eTRdB/lzzbIstO
	5BLzYdbgkK1Zy5VTxig54jvSCnFyhFpGFf3CqyeFmA9V3uCv1Eu7pnARD44lUvos2cJu+D5SPK3
	E=
X-Received: by 2002:a05:7301:e22:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37686c3af76mr31642eec.36.1794333391527;
        Tue, 10 Nov 2026 09:56:31 -0800 (PST)
X-Received: by 2002:a05:7301:e22:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37686c3af76mr31586eec.36.1794333390890;
        Tue, 10 Nov 2026 09:56:30 -0800 (PST)
Received: from [10.0.0.50] ([76.133.89.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm9766790eec.26.2026.11.10.09.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:56:30 -0800 (PST)
Message-ID: <7e7b67ac-7d7d-4769-be74-c064241d5426@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:56:29 -0800
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
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179430684554.3011466.3431045638041318447@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kV_STSUQc_ub8lpgj8F3xofijcEBxt_K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX1X4X5Klo1KyI
 /JSwNpH4IcpYExUIRBysnkWgUZZ3/sqraSNiuYsi0+elGzavWfVZlC/YMyxRrAsXzftAKr3jtjw
 k2XXiHCVXPtmKBb3KvxAANcWmlFb7Zg=
X-Proofpoint-ORIG-GUID: kV_STSUQc_ub8lpgj8F3xofijcEBxt_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXxme8zXa0Co5a
 dQt4HtZ/haUZ+SVUWCa6OowVdr86ixYBgHZlvdrXkO0/VSmsVHsn1ZTc6U+ABZb3FAKlm6t6mHW
 nnDU1g69714WfFzEiJc9kp5miLrkQ8J2ZZrqy4ODLSqIu6lTG6OZrjP6qzfXyR1tFPGRoiGhwHU
 Yl6kMbeSrCQ4tcQkwIaENs/zijZhuF3lJLFbO1gDN/RSlTgmNdoR8E35ahj3+zW0/mAWkzIgC6n
 3KGOWJN2yq4ELotkAsTbmxwzYUMY7SEP7DwnNNpq3NAuVGhzKtGiVEIZqPUEgu4s6G2vaXXOiBc
 Jzk6a24eAMb6Zo/Lo6M0XoHX7naUstw/P5rEwtWwv2Bwr7bOdTXstv+PpedXWyrvi2fJSj0eyUU
 g7pL1HAog7+qdWdnu9X5EvPzb2CJHVmXWL8H7hyBZSYWjFB9+pgqNvyGxoxVnWdAgpPApDuq5vX
 ocgyt0l1+cutvZFfV+w==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af35ad0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=6LbA7P6A7bvUEkAB8wivVw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=iW0bIAoc0toShNrrW9YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

On 11/10/2026 2:34 AM, Wentao Liang wrote:
> Hi Jeff,
> 
> I'm sorry for taking so long to reply and for the confusion and extra
> work caused by sending patches from a shared address and failing to
> follow up on review feedback.
> 
> To keep the existing discussions clear, I'll continue to reply from
> vulab@iscas.ac.cn under my own name in the threads for patches I
> submitted. I will not send any new patches or revisions.
> 
> For context on this submission, static analysis flagged the candidate,
> and we used DeepSeek and GPT-6.1 Sol to assist with reviewing it and
> preparing the fix.
> 
> Again, I'm sorry for the confusion and the extra work this caused.
> 
> Wentao

I am not going to accept any patches from vulab@iscas.ac.cn since the git
commit history shows that has been (ab)used by multiple folks in their SOBs,
and hence IMO violates the DCO:
    Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
    Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
    Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
    Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
    Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

If you want to contribute to the drivers I maintain, submit your patches with
an e-mail address that is unique to you. I have already rejected all patches
from vulab@iscas.ac.cn assigned to me in patchwork.kernel.org.

/jeff


