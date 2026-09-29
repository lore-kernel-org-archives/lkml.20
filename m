Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A5031F99A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649365; cv=none; b=RqCbt1KWWsx7T5tSF25H4eQ/N9eb+CZYv0no4W8BWs/ZmDGbsLoKsTMKIlfz0T0/VANyVayPPNmv4GGvWGHtp/QLfYR2WiRrY2/V1F8VcQzibXyEorc3iq1XE1YQ3QsrcRRdnnQemLFpPkJ6lVOVczhmtY3KwsbslilqEGtBW8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649365; c=relaxed/simple;
	bh=FphuLZ/UhsPZ7xGO6NhBIs8kkcdXJvtCZJUuTCiwKjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nFa9BrtUF5gQzNR360aUi/l1NHFAL87sWCHNjNMGCVTpgoSgTE5QkddGukEiuONtobry2eI88mn4T1+Urlj6eG523DoVoWsCRDvBGFaX0tENGnySkvA8X1B5ljo1a0Jj5CfevBW38ExujcvUYANK2hn5HkzwxBewdWZihDLVarA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0bOJ0r8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjE92lFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0bOJ0r8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjE92lFu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0ikk22959382
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OU2a1AVipIhoZQb6GLRTapvpusNfuh9B13CGCk9KrWY=; b=c0bOJ0r88lZFhPWv
	MLiRK3z2GoqJWK3Po+4zFzM9an5A4j2W6zbNzgKVqngI/TfDvjjX4A9GOii6ybcv
	/wbRXZvAU5PHhhPoPqc8K7V8zDRYl9I5IrK7RuzjIe54KHRwZjnA0vdcdSgJgiE+
	ykWvgHmUYOXZnyfHsK+puRpgBCVErWOFH1uVa/50RxZIXpTl+Q3Ge6AujszeG+qC
	ZjDo/4dEMz699kq1aXYLp8cvk1f1zeU5ZqCVlEk2ATyWcZUo9qW3hb8Vlz3840Id
	Vn1f5a/KhwSlyfoV1NZ4daAyl5KSSTcAsFWd2KDbbv8vYXu1WHnPpoy9rUKB+Zhv
	HIVLUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkghhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:36:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6498086a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790649362; x=1791254162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OU2a1AVipIhoZQb6GLRTapvpusNfuh9B13CGCk9KrWY=;
        b=OjE92lFuz2fuBAathOjCBME4aKLOv9FK/57GCyktqkdjif52gO2ek/gOHG8Xro5/ll
         CYptRlPItZcjzheCHqIEkozgLvcQCkAseDuUB8wDpaxJ041N5NoMOOhQZHoyKGdyA/ct
         3Kt3c/Wi7j74zYiKsSL6eSXNufamg7ENng+hsjdiqAJ9RFC4OtQYeV9IIEjDsrCcblGI
         owDgfQnAZICPoe7UfEIzvfpZLOdlv+PYgufUflWkpahmfbjP5wNL3H7lIEId6Hhmopva
         Xu9bfWCGIGi7g67CPJttLxbVJO1Z9BLskuTMN5Oz5IYk1W4y3qFdJN4q5bqy5BPo002q
         WQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790649362; x=1791254162;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OU2a1AVipIhoZQb6GLRTapvpusNfuh9B13CGCk9KrWY=;
        b=mmDW4Isi3JIXSF22v8kewJGt5gESCdgpIbA5oK1kHYFs7+P8OSOLZ5tMVOMRJak16P
         zSiWj2lodXYq+XEPZz+5QzYSzbs0y5u2t8r8U7V0uncG9KvtXhOKz3nS3PrAOjDgJzC5
         qPCqdjTM8UU82kRKN+bbv32yQFLAKip9JaCu/jUa7hrqPEwPodp+WNH/RxCXTQZVFK0R
         /73f8XK6PhpA/D7LcotAf7Gc3ZqGMbczB7yU8EDJm9L8+BQ5RZXeVSX39m5beX1DOxs9
         sW647v6gF17tvctmYnzqSHZ4Y+A8P+5+Y1r4pbm8VTiaaTjLbX6E6Tevb7Gcfluu7ej2
         zZaw==
X-Forwarded-Encrypted: i=1; AKwUvByUrhQoISzCGspyVdn+7rL6xd4hVJzlMuO26Bk+yPeeqaR+MPAi/1RdBSuHBsjMYKMcFZ3eHd5kSyfdGnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7GsCr56O75f9cR/FJ8/+dR/w/ZgTx5ZGe5bmmuxXsIZGmo+yk
	YP1w88ewCe7JF4Fi0re+Kvjg1VYGmqwKDE+7uj0Ye3IcdmdARfbq6EuKNSalr1xHHVaUbGrxR90
	Pl2V9w6Oy9k15o+vxc3HHzTHCJmV4TZFaiarFLYRj9SoSChuoDushteHi2B6FXPEYNRk=
X-Gm-Gg: AYBFou35FY7spCegqlKgw4Z/lVIgm1r/1bAKedXq+P4s08kfbKgSWw8engwTGCZGvDo
	NJmLUhbGLpRdiGK7m98+D+IZToN6DpTwMEFHow3tWJeinQpzSFgcQDLb28/FI80KiwD8x60+e30
	cqxD1ZuUWEvwyByEbBOtI5YYt584NU/60vAOx/DipE1Gfu0CaMmeiFQi0rcQG5ttnPdCZRbaIgM
	K7+op2AJOMDtdpc7ReSjl9Ib1VU+b5+GgnnhFbj4rJpRWyKOGVTaq5taX/DagFEBr0Ge8HsOrgm
	oQM0TzAQO4+8EkaEF7ZN4hOeoPQewpuq5iEpOOpo0gASe8yOEwy7uyxIwhMMg7+0iXSmWmat09q
	/wTKMObakVNaQodXzSxHGQhA/TOe+2RpuXhfgou18mOxVqsEjGzzGfKGX56ylqlilM+h+Zu4=
X-Received: by 2002:a17:90b:2645:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a098e05151mr12783756a91.48.1790649362166;
        Mon, 28 Sep 2026 19:36:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2645:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a098e05151mr12783739a91.48.1790649361707;
        Mon, 28 Sep 2026 19:36:01 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492da42a3sm1456652a91.2.2026.09.28.19.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 19:36:01 -0700 (PDT)
Message-ID: <0f66a04f-18e0-488e-b6d5-aedead2f82eb@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:35:59 +0800
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfX1/MzNrbAZr0F
 Ola7q+UYqqB55vEwh1pfudgDQIC+JjTJ1ScefvIZCVfXTJDlSXe2XlL3PI69mVoYzx6rYSDqeJ0
 7l3+/G6dh+v1uCg9TNUSG98exod1iNRFIrwHqfuW2/3EJsXMJYmgreodbtLOmpZCOV9t39NNISr
 wrayWvgIBJAZGBkmLI7rlqb/NTDk4ajQDrLU2vIXNmkFM769YwFXKd0i0jYy5rnwAxpxHjpVnG4
 V1ddRfM8+UTYcAA8rwN5+/MydBOxrcv4FIpB8jxpfj1sWPaOmGouq07Zf9HUJnEDuX+GPAqgZAo
 ofvbvOkvhvACyCg59kI5sR/tEVkp4XkeBoervi0RuYY8bHEx+pkRyvJwCjhfAe/GyVt7YOvlEYp
 9va9f6C/1QisByLZbUKAuZ4suOfy5yr8Nae6bVPeCQnYKxdrEqMcvodaHRpOtzlMAMthfMm/dnn
 oLjdk/X7WxLw2yj59Ng==
X-Proofpoint-GUID: vzvAAQ1dk1EawrAxjNjZFSvuxmL71Wc-
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb2413 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=JhsGp5YEgYEiw4z---oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: vzvAAQ1dk1EawrAxjNjZFSvuxmL71Wc-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfX+erFg4JtKYtW
 XEVoDhOC2fT+hIaHjhVTMzGsxagLa6yTIoXoaACAG+KI3RKYZoYqtr+OWks+s38v99I4y9r5KCo
 RKMNpAXnu2WplKm1jq6yNUBnESVgyBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290010



On 9/26/2026 8:12 PM, Jiale Yao wrote:
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

