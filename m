Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF8C396572
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 23:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791068421; cv=none; b=VFtcvkNDU3z69/ahzJDC4+vuz7s0u0A4cPfloKf2sDKa6LO47P8aoyHT3chqtQK0l0jD0f5jDKbNWxsdn2zBdf422svlBTUsQkG8gpMIne5JCVyCeyOA2/QAB4jLQ5L6wrDN6S+KFDZemHPRYdhrmZO+LCnXJCArM/OJpzkyhG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791068421; c=relaxed/simple;
	bh=pMi/GbpIcB9dhvmEpmplerT1p9kVJ0FPcCAxiGXuCD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMnY4R+NIkaEDBgEEDgi1f+RmigAaTd+eptf3IqIF/VbrDmOSFephcJnuQzyLnYX1VutJ73009dfD6O4j0PEKlFv2YjMc6dEyRheG6pPKANSH8OrlANu3DcQMUzVJUrQCy0IMKRUx54LU5vfbEC0WUIV/nvsI0mE1ykG9ZOnukI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2jyHK4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJvO+txf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2jyHK4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJvO+txf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693KoYXP2193384
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 23:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bZnp1l5Sf0+DvNXCbo/mmmPSmEpfl+U8dXwsWmNIH8=; b=E2jyHK4ieCgZoZ0I
	rz2YiPk9LkphLR+JYFMGvd51prs42UANmr9ZOHmfgJS8j/8uYz2L6Xp/cYd/UyLk
	wJNGbYcQDAuVjur880WRmiM4oU0ddOdrABR2FlSTWqXnMYZVldsAfpIMO9nStCmV
	rVMNoMLr9CtUI1gfvG3pSC9+q2IdcoMtN2ecCqkx0EDHzFRlWRmjCn0yDzrcNgIE
	dQQFAp5tcFvXpxcT//w0Knwkl3vAQlot8AJ6v2pfsDrSERQXVJhtWYP0UmxULZ6g
	CPwjs6Y2zrvzTJdon6Lxb4m1mOqYtZGVB39s9ly+BUCe58bZrsMzqI64Pj1e82aV
	b3M/Ng==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr69ytr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:00:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d80ca2184so927429eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 16:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791068419; x=1791673219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bZnp1l5Sf0+DvNXCbo/mmmPSmEpfl+U8dXwsWmNIH8=;
        b=HJvO+txfeQRb4SWuUzmftq6LUAFvhIVFaR8aXfGmHZgZ2WaMRxNvpcBij+TPXDK1P+
         7xD63+CX5AIvNYdXT/aGJ3oADew2MmopshrHqkxXgXPf5x/OiI0BfDshtOWYGjNO4EvE
         qmR2+dVViV6HOM+0BE6OEPGbFzQe6z0tV6B2t7gdICAJxrr38x+11/6uBktmMkqSVmgC
         HygSsIczktYKFf+O8t2ep2SP3kHxrySNZn28ZuOBa9cI8F+1Irf4pidLxWDscKl2V3H8
         6Lvq8alQXVLq/sYf8BaQj3BPZC3tBkDlCEdoY1V5Ub1vRZiriCf8WZ+buxIEl9x7t5XA
         l9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791068419; x=1791673219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bZnp1l5Sf0+DvNXCbo/mmmPSmEpfl+U8dXwsWmNIH8=;
        b=HsxZ5NVwSz5urxX9tcpDBCQCsHVukp3WcEh5SL8y0yOy8g3fsmfeaU68afND3EgBXQ
         8bE0o8Yz5YEn7jrZAQbATVRBHuAE0bLDTw/kKDK571lqUe1uLpTw8hmTBUJDcbhBP/gh
         5/NqJdF2e5MuPaa3CuCymzeGnCRi3gceUbLm3Di027BVPfX9cCN2TLtoHy+z33+eJAsi
         grnC5evdmDFw5Q9963UmpbF87VkKwnzvRbmU+DOahDAPztAaSYNi+MGEXdQXnPltToGa
         hdcRvpPBz3o7FbYn4poYk/RSgDFbWz3xA3pwBukU/tMJ+WZQAUtR0MV4VLeoFohwKuIg
         ZKWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx74VUd2AxR70q65RIcimi8+AnaE5wh3/GKYss4r2ssNT/hUFayyMAgIaavzElWwSp3GsrBlaXSuIkr2Bo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjRVPw4AiN06hOyUOpxO9xhM8EdMHTBr33/e7GudZvEUdzNNHK
	9SKiuf/qZaTcc7nWwSmfsfo3e8j5IyFJiXWIHWOxnM/vntLpg9h8ariTLnDqMi2rNVk+cL8Neyp
	crIQ7quAF5mkKVZSJZKItIs8bjtPcnFx4J58CucD2dyBuzTDWWqz4dYd99YW9Y2iR2wI=
X-Gm-Gg: AYBFou11nw39Yrjcy1Hrxb6FmkiolfYrpTkcsBZQylzULQeTYL0h10mtZjGuH8ylLnA
	YLtVZex3OIUTdTupCYfw+nNDPRbNt5X5CLMCiULSFSXXrigKJLHXtLKJRpK3lCNgXz21h20RFuI
	yCghVJBkpHC9ELURc9oEqEbDFeLchX1r1r8kPzn6LB4QeSmO8fz0WUIMw4O1cidVtgCrkNzcPSw
	iSMF3LKTOueiGYrOeqGaXiRiQC7pclXTOZmML5vKCrmQMLaSbHULwcgEpfvjLyi5JGWTuDY42yd
	npy6im5HuBJZlAhSvIJNWJAKCkqCtN05pYDG8RGPR/c8CKaLh/3xSt4tMTYcMtHKTib1Mj4xace
	JuEqwC+uPX0Mlt/1+n6SxZaRQwgs2I2kKy19WPTloj7voamlzn6B/STe5aQ==
X-Received: by 2002:a05:7300:ea08:b0:34c:e77c:f928 with SMTP id 5a478bee46e88-35111519db8mr4820809eec.35.1791068417145;
        Sat, 03 Oct 2026 16:00:17 -0700 (PDT)
X-Received: by 2002:a05:7300:ea08:b0:34c:e77c:f928 with SMTP id 5a478bee46e88-35111519db8mr4820753eec.35.1791068416453;
        Sat, 03 Oct 2026 16:00:16 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f1500b59bsm18150132eec.28.2026.10.03.16.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 16:00:15 -0700 (PDT)
Message-ID: <5c764600-4e22-4827-bf4f-1ba4ea4fdd50@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 16:00:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Reserve space for a string terminator
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261003095913.575108-1-yaojiale02@163.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261003095913.575108-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA5MSBTYWx0ZWRfXyo0VD4AYGhzf
 gL7KJY68+Uqayb4j2RcQthqE4/T1URmzFpBORtr7zPZdkNSwfzcReoBbd/+AWjMb+qEF7ll1Ytv
 oQ+700r8PyFRAUnH5hs1gJddKZsdjr4=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac18903 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=JhsGp5YEgYEiw4z---oA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: MqjIcOPub6-0Mkc9dqPhXSwld4ho9JEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA5MSBTYWx0ZWRfX7UTLQ7Ego2qG
 aroKsazUphP8fr/rBkg1dXwk34yc8w88Qu2nxWvRPJAnmDyff42XTEh6TWIUDRqlQInP2GIxVZL
 9if8M1BFkpXwYnpNz3UYbyORmpjWQW7Re2EVtggjmPpYe91uU5GeI70Ep1u8qXtWtr3AdtFSp4G
 e+qIWCaoGF/0Qtt6+yjbAF6BU125GmP40YgLWZBfJBemRilwRouCiExn/OUjluOOmok8NXEdEBq
 dyvbPTKsivZ9VRT+4vZ5qY5iMEKrRGI6VoNogzjEGYn7yJDs3NX6jtZrysOcJyZIzP6/wwdN8Bg
 bxxrBD8Lph/FuxVtGdnXeSf7CsySxxqWcXdhDFBC8mcgg6MO4n1yYfVyQX/+PnFh4RLwa+s2nVh
 el/4ZDgqIQqel5Fn/RUVsTVJ/nrTWYoMtUUwMJSEXZH+eaezrloJLgXdj0lJQhFHW5XeANHHX3C
 9TJe/ax4Pe9a7SUroeA==
X-Proofpoint-ORIG-GUID: MqjIcOPub6-0Mkc9dqPhXSwld4ho9JEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030091

On 10/3/2026 2:59 AM, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Documenting that this is actually a REPOST.
The original v1 was part of a 3-patch series:
https://msgid.link/20260926121250.3258285-1-yaojiale02@163.com

The Reviewed-by tags came from replies to the original posting.

/jeff

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

