Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900206;
	b=ZlkaW3I/sKMjiWnT179B6PM0K6ngD/ZiO4K0+Zy+efbEJVQm29rzfvWdsp1KAzwIn9np
	 lHwIK1l3hDSr4W5W6pzmjTA8lo3ra8j7cN+yToQD/Y02dkIel6R2OTkncT6kGiTZOa16A
	 gjRhfWytjGUef6eCjNfIBeGhTSS8HpA8xlGDHfBysDZiluAH8vi3B65KqT+U1QxkmHm8i
	 TXR7d9+U+9k9A9sjI8/4lr+asMZi34kxa7wAcPbZu+jT9+Xlx6YXhFe8+l08f57WgIhsQ
	 Jvu9A9isBjIMFp3v4uraS2xfYkzk6gEkPSZIfD6CpCzSBT1+M9QjCYaKNqYpOsX85pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=;
	b=2JLqQbLc8Go1ifjbNCK+oMgnqIjureMTGiAqHvLdEEMyovhP8LNGU8dq9zwLRIZVghCM
	 sTjxvuOR3pEf3lp1heRGuX4BlwnvDF2lWVaNKHWcvEbxbT1ZYUuZlL1a/hAgOGeJiKDf2
	 ZUnJLKWl8hvKj9TNIE+cx/wS/TlICVHdJJZp0j/2HdjJTtoqmi4O5Gvgz5APP6ApUyp45
	 socVvZeSBt2h36cNYj6YyUwYYdEV3MJDSejA46/BOkx9u+r9W683eRsb4agXbA4GFrbLl
	 xJS8j3qxs16u5bulpNUUbZwwaY8Kn9NVfFOoyysn9+Vkg0gOaLpYnwW4xyapJobM4Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UzPQOUZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyPGfyvl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3D9606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UzPQOUZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyPGfyvl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQLTp1040252
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 17:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=; b=UzPQOUZPwBpiyKHo
	t82syey/EgfxUzie7LDcWi15iHRW/ub2HFhNxz2RjPuqLVcVapvM28nu19iW9Adi
	0f5l6+OQ+2PhupRbUxxqzHl94xVTEfE2qKbtWsMcSmWTYbBbCt3eIYgXU0h4clw9
	QD2De06sEP+0DxNPk2UYHdp1rJ9JXPXcRuq/ms3FQFNdf07MHhHzj2hstZdidsaf
	CkkTUUaA4nGz/R4cljmCGX4FZhiIMGhI0aS43/zNcfX9JpasYmB4FRad0s9BdT17
	80Yjtmfudz9oEG9k47CWX13jnhdWrlRBSZ1V7i9ZnsOUDJw3E2z/1h3F9weAg5Ed
	d5tjbg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdawvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:36:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so4751984c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793900203; x=1794505003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=;
        b=UyPGfyvlNetP2SU2xYMvkm9D1/YODYee7Aqbf873zjnuF291rjRVei3EqFDuxAWwxQ
         +o8itJZEn7YW/B6IzwsGjpn8M32lrZRAvXxJnit3zAnNwiQQyVNyAFhC0cvHs65ldfq7
         rMZaK6n6cejvOujv1x8tBzOFhGSAPTsEHmk/kW5W1Y8bqEPbBeGMWSjwznjVUNDtKyLS
         Op4uBmWIb8nHYAdpU/TBTCBe7Bqhk/i1H9JYD6rXinBUdjjG7sVlpPYPjflRVtXIxhIi
         wSm/YJUuZZKB/LTfEVv6c+o4kEmV1oYizwjcJUBj99ENjCGG7woP0Ht2Ci/vakWwwnUX
         mCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900203; x=1794505003;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APYTMa5wqJKDsloYf8WsHxudYGdEST/0iGIISjyttOo=;
        b=abH2qVui3/LvmkxVEdaz0t21MtHm9ByJArpC6jAvD2SPK8BylyfF7Y5KXUxKXeezA9
         KWRRLh6fhzR5BVFUHYwaMgRUpT582FJIpSW7EWPXjTcx277+UXYu/zT4WmHBATs+t595
         eAGijadp85ijReyb/v7zS7xmcnXbQp5uZBphDk99kR9cVCDskimS2NmdZ4B08/AbHeE9
         rpEo/KT+fs7VLvNxt+Tb/mlDra+akdHe8Yy/1ujehZBVU6jbwWcmiQ22XvLWzZ7nJngU
         2zBfIyZDVR157a2QIsIfYzNxSzD08p0MJO0Zrov2MdHKoHyimdZaG2PCoaGzDcQZKa/f
         ZH8A==
X-Forwarded-Encrypted: i=1; AKwUvBwqwJnCT9Ole9bcd1DEYBw+TVSeizWaAK2q8QGZ5ELPFl5NG8oOKKTZnlIqm21+GQm8gJ8dKaX9Pu+2CUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CU+Azv/wfsBVtwM/WgwO9I8yqSE4SBvFpfrsH9POihzzv4FDb
	e0r22v6dHa0aYcGMAL2Nz1EfbDzrJf0tTtm/S9BukbvFUE4cII1EI/5OcD9OHlAEXVOMEW6e7H3
	PU41/qougKQHrFJpw9AT4LK1/Lwf48zFuSvrYsN8N57m62v9SLe2vGhfpVRrXnkYTKE0=
X-Gm-Gg: AYBFou0yVXkZTM0mQDjP6kU8ID4TmVOFw6I1eSZbIgIQOgmLvyEb36Dm6uc4ll4ybrI
	daxJKgs3zTxdk8e14MRA2fqzxWyCDpdHhWUuyDBOqW+/9C0VZoBCq1sLLAxNzAuYBqujQ1KSVnS
	wK/bFZ2fJx0XmP5cH+wmbkWaxBDf1Ppr/l+MEwLEqY/Y2e15rhgkYHSVNCmMKTC+UNJI5WsyI/1
	hWi9HAB88BmVfOsaR+RQPyBAjlK1HNvMfftKEvzF2rdigbcwKIzMjbkxiZfCrlMtK5DLz2Twthy
	uYAcDJIU6dYtyaIX9ShX3OanFzutlrqgo3zya55nnYVB9RO3e2WOZgqrBWj3ZXrcgXOtVO9zV1g
	jtZmfwDV+trhxLcvviNIHxU7yFOdfXdeOBgMPT+LGn9Gqiy5gT1mLb6SUVJJLtmxiUeOkuzCh6y
	1p2neNg3HGQEYZPuQ=
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr31173038c88.22.1793900203236;
        Thu, 05 Nov 2026 09:36:43 -0800 (PST)
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr31173001c88.22.1793900202497;
        Thu, 05 Nov 2026 09:36:42 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm18824490c88.4.2026.11.05.09.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:36:41 -0800 (PST)
Message-ID: <263ba263-c59e-4d43-a745-cd7faed3c681@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:06:37 +0530
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
Subject: Re: [PATCH] wifi: ath11k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecbeac cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Rv8SPUj7cjXdj5bJQ3UA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: vls3xY3GOTg9rH63YrA--TwfHjzUcjli
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX+rgVWDnxx7tt
 Vd1wLfuLoo4KZhBXo1mEojTqQBAsYr4m5vg7V2jgpu3BdLn5ezt4m+vS7IvJmMLqEjwiH6Viw3F
 R3Xwdj9oBjoMC1hUsR9A5oKchHbLhu8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX9Lbqd+HVNN5E
 03rlQcb3SmcznEVWabaVpSlxLCF5r/uqE6jVGjIiaFejmLet6GJ8XTT4PplqXk5qsmwqdd5TtpM
 RXx3+3Gac98/uukcEzhO1tQ8y5crxNd8glJ1W+1E1FmBGtLhAF8bQCF4+rtXEi4BFcZ1K3bn4sa
 kqBEe3d/YdgMvgpLWWEa3CaVlohwasqIh3NHH6n9QoiTqco9+RdpgXROV1l3YvyxaoM57UJhWp8
 fOSXyV5UtrBRId4OcockGoBw6tEUy5/gS6nrmDnrMhubelFoZLjruGV4dFQN960ys8GshMtczeU
 y/dOrT8Y7QNmWQd08LtGvPhuwH0RyjwueY2zYc0YE4bFoMM2Xll0XkJs08CuAhc6ud7iNUW+9tH
 yiYmG3DiUUm16/2R373dfPKXnKYyQ3vVktPlnHCU+EXhStsgiQpjgS2UuwzNLRZsuE4cNCazhI8
 h6zDid9H3XJyPLlOAZQ==
X-Proofpoint-ORIG-GUID: vls3xY3GOTg9rH63YrA--TwfHjzUcjli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050070

On 11/4/2026 8:03 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: f7eb4b04ce6f ("ath11k: hal: create hw_srng_config dynamically")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
> 
>   drivers/net/wireless/ath/ath11k/hal.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 98bd9e3f0aae..8a4e5042d89a 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1351,7 +1351,7 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>   
>   	ret = ath11k_hal_alloc_cont_rdp(ab);
>   	if (ret)
> -		goto err_hal;
> +		goto err_free_config;
>   
>   	ret = ath11k_hal_alloc_cont_wrp(ab);
>   	if (ret)
> @@ -1363,7 +1363,9 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>   
>   err_free_cont_rdp:
>   	ath11k_hal_free_cont_rdp(ab);
> -
> +err_free_config:
> +	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>   err_hal:
>   	return ret;
>   }
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
