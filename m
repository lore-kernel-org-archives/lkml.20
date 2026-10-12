Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620923A0E80
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782094; cv=none; b=fYURxFbJV6xC1Ev5vn3Ef3wbR04pGU+9w8h5UMdSn4kamf67OQldVnOWL4IAdD056lgNjRohPTLC7X1NwdVPVCa6qinx2Z5wUl767ctrpHL/mD0EdNSTiNjNxt2Fg7YuIoiMgSWM2w0cNS/HBes1CAdSMhd9C/7LWcqg35hF96Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782094; c=relaxed/simple;
	bh=tc+FZHUoQILT/xiH5F/4ZsRAIm5Xbqbhpocu8LLiN/g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=RWHi8NrwlHV7HrHRZJi/AtYbXOVJm9eD55YPuedF4xICDK9PeePXlH0gd1hqRnbXtDr6EkwMkqSw6u8SUlOO6yChhf4Y+tZjjrtxvKnihLi/GZE/CNAiPwJHk1IBrwI4DSFG/zbk+IyPhhTLKl/YL48WKe9Pc5qK+dxQuQ+A874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMCfjwSD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Grkh+v2j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMCfjwSD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Grkh+v2j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C569MU1002452
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkD4JY1ZO3pJQ5gfIZXunsLTb3XXMRhy176nFx/Ifb8=; b=VMCfjwSD2eIutGaZ
	CCljrb0FLrDK7+RMxV40hYQtSH4R4F8bcx5YN2+o4kwvM3rAjVdrtgQek35Mq8zQ
	aAUCizHTY5bKhZjmqXkSEKtUFAcLEAW0ekcxDBvB3nri6aPWcPZ94KdmrMkpR5rV
	GErMRmZrbYf4tjNephwZU1vfEjISQdAtqJ0AjUcs92pbrdQ3uHucC/PgoZaWeCX+
	6q6VM/OHcvAEpVxDZM5qIDpoCYNDXJzHMXyWEJPrB2gE5B+BUUQXSX60dQiuu43O
	0veUEf2VXAvCulQw61K2z/yxvz/K/lh9UlOgcxxNxlDcDDayxQ8UgjTeQyUDE0f0
	qAGIiQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkg7qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:14:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so4196854eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791782091; x=1792386891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkD4JY1ZO3pJQ5gfIZXunsLTb3XXMRhy176nFx/Ifb8=;
        b=Grkh+v2jqEhgEPNw3M3t0K0/l7WAzMhnAPvHuqLmZdy9M7CWmkvVzp+H6xRqUEm5o4
         ZP9TgQSrZiiiYFN5YcGgYKB23KQeNwLkx2azrpmt6+tv1zzPOz3HkVpBqdWgIXhpLVjp
         J5P9H+sH2mBI131RuqRoC0UCP2buxm9acCQxtcMDbFRPfg7atrrlJMdtdOUQTnhLUoph
         SHcJckVhKRK7bWAQcwymKnjIK45lU5K+tI8XcjDQwpb/VYCfUl104XjrLrsOD5hDnc+Q
         TscsCOk+IUZSo2tuhOXpti/ZwpB9SZEG2biIPck2nd+3dW5HvkhiSN53lYXvdc0desBg
         TqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782091; x=1792386891;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QkD4JY1ZO3pJQ5gfIZXunsLTb3XXMRhy176nFx/Ifb8=;
        b=wQ1Q2i+Fb8+EeUukY4Ms6EpP4xobcz3/ZGjNfPoXS2zG2jHDSBzBYGwHO1meNeaa7D
         zCzPcLhgT1ypJKH478aost1KUYLR6xrnm5iGonE6yKzOYztrbcrjowf+7N/m3u77jKri
         INA2fSd3PXU4+N11nLugMuHymv9/Xos5ZT/gLGuyStQeXxUpN9WoQAiIQD0biKNn4Mrc
         nEfxDlom+CCtJ3UGRBWI4stLdw3kSFJ57SH9f/sAJu9/4Q8rXquIFVm3yI5bqT3S//Pj
         NaUmbXU8ort/6CCT2AXlZducMBZWZQnZ52WIV9ShRrhk9oyOwECOCMoePkbEADmrFxaX
         8Gsg==
X-Forwarded-Encrypted: i=1; AKwUvBzjXwGIlemreHk8V9OGh/6ekD2Q9NUcY61HMrEnfzUqbM9PayLMcKhgbjcoivNgnSVRIQ3ACzQYAs4ES5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg6tYjwLmrfysrDOzjqfnn9NY6r2gueS3hftnQ0kjSI2efgRPR
	pGavLtfFJX4RLvdGIJEOz2KmFKsJn/QuGwvHBetv5oNe0+iBk1I/rkOBQnDozIAwIwP/Ff8ZTR7
	ZZmb1axHSS3MReyaPS24xBkElV+hOROX3hrsp3Iv2MaijXhSIO71NwIIVzgEqOk4QyHQWY5sOfG
	o=
X-Gm-Gg: AYBFou2Qlm4jDhewBeVKqB/ss0rwJGKiJr9cjBw/SX9SoveKUMix/6qt+VtoRR7jcky
	M/4ZydstzzS+Fgm0Xh1I28O4hxO/YihkyvOyU5tysg+FTXIH1hbSya/CbmveBTiHtSqunnaY1YT
	dt3oUoGfFW+/IKO1p3ldN5TdX2OfONG9GLJ60hWjk1fWn13rHn6mvh1ou7iOh8BSkkM3LTMzelB
	6awWztW7bsCSHvW341yMshppM4lTKzdFvlvIWKqT/k1zr8QIybb/A3xFBtW5gb+F0nqB6YPiQM6
	iF+KQT9PtqJGnFqwJof1UoTk507inN0Pc+6DgpEoItxVX55obLNTxlWyXgjJBjN9y6o68fnlGX9
	IyVsiiOsrDOBGTzzpgKWrylgr31jYj3XgMgJR0X51
X-Received: by 2002:a05:7301:fd8a:b0:351:5151:95d9 with SMTP id 5a478bee46e88-3537de0069emr10295468eec.3.1791782090719;
        Sun, 11 Oct 2026 22:14:50 -0700 (PDT)
X-Received: by 2002:a05:7301:fd8a:b0:351:5151:95d9 with SMTP id 5a478bee46e88-3537de0069emr10295432eec.3.1791782090130;
        Sun, 11 Oct 2026 22:14:50 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm29526794eec.16.2026.10.11.22.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:14:49 -0700 (PDT)
Message-ID: <167d7bdc-05d0-4d77-8bb5-199a1f8e6aa8@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:44:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] wifi: ath11k: avoid IDR mutation during vif mgmt
 TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Rajkumar Manoharan <rmanohar@codeaurora.org>,
        Sriram R <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <20261003092104.520135-4-yaojiale02@163.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-4-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMCBTYWx0ZWRfX3f8m/525wpvS
 hp5nA7pjW8sR+AwW/I7VeS4hu/19sBOAcNjledIFwKDVN8M8MD5nlLwoHy2rkQO6pyS4dcr4IHO
 1ek74WIu6SuyeEpOHNC7MxDA1iRzeG3lv6aBbRzn1xFiXEhmHg6XOMtFO2hECnzBh6qnjDWwyGt
 0cPJJ0Y/pcQbjv194JAJLhp+QmvZVL5VIJ6qqdr/Y4HgBeUE+8gYxQ12YVTIvvAD98UNoOu6oKb
 1Q7C8OVD9VO/IFyFSvFpUxCOL4WpIBXsmxyIZ8Fq4mmjKeWvTG1+Hjz6slXeBxwwtx3Fs+eSwi/
 J2hdUiPOPdajdNbpMiumD3GhikqOcd8JyWO3XDq1M4HCjRP72J56uDccbw+jxx2vTFyLhINqHYm
 N9nc42Ier6PC5/Ewwz7HQAREyzBZQmSwRMdwgT9cfVs45i/F2Gc+HmncPJtHfiSZc83SINJ2S2W
 ZbW3gdNaz6d42hWTavQ==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc6ccb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=kRE5jT5O_-UJYxJXrn0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMCBTYWx0ZWRfX6HHdRevZscA2
 naiwGMyrJ+O+oHV6VhiI5E3YnC0g9UKGO0spPCOghmUozopmyb8KpAvgRhiLZ+weMdVNsuMCStB
 jqdS7GrF2tefyayRyuq8wdsGU9XW2Qg=
X-Proofpoint-ORIG-GUID: pxozPX2hfdRx3vrpZKJqpiyJ7UD8t7F9
X-Proofpoint-GUID: pxozPX2hfdRx3vrpZKJqpiyJ7UD8t7F9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120020

On 10/3/2026 2:51 PM, Jiale Yao wrote:
> ath11k_mac_op_remove_interface() walks txmgmt_idr with idr_for_each(),
> and its callback removes each entry belonging to the interface. Removing
> the current entry can invalidate the radix-tree iterator retained by
> idr_for_each().
> 
> Move the walk into a helper that uses idr_for_each_entry(). It performs a
> fresh lookup for every iteration, so each matching entry can be removed
> through the locked removal helper without retaining iterator state across
> the removal.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index f9af403a2f0d..e7ece258f142 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -6176,16 +6176,18 @@ void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar)
>   		ath11k_mac_tx_mgmt_free(ar, buf_id);
>   }
>   
> -static int ath11k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
> +static void ath11k_mac_vif_txmgmt_cleanup(struct ath11k *ar,
> +					  struct ieee80211_vif *vif)
>   {
> -	struct ieee80211_vif *vif = ctx;
> -	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB((struct sk_buff *)skb);
> -	struct ath11k *ar = skb_cb->ar;
> -
> -	if (skb_cb->vif == vif)
> -		ath11k_mac_tx_mgmt_free(ar, buf_id);
> +	struct ath11k_skb_cb *skb_cb;
> +	struct sk_buff *skb;
> +	int buf_id;
>   
> -	return 0;
> +	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
> +		skb_cb = ATH11K_SKB_CB(skb);


The skb dereference here appears unsafe. A parallel WMI TX completion 
path can remove the entry from txmgmt_idr and free the skb while the IDR 
is being iterated, leading to a potential UAF when accessing skb_cb->vif.

Would it make sense to hold txmgmt_idr_lock for the duration of the 
iteration and remove the locking from ath11k_mac_tx_mgmt_free()? 
ath11k_mac_tx_mgmt_pending_free() could take the same lock as well.

This looks like a pre-existing issue rather than something introduced by 
this change, so I'm fine with fixing it in a follow-up patch if preferred.


> +		if (skb_cb->vif == vif)
> +			ath11k_mac_tx_mgmt_free(ar, buf_id);
> +	}
>   }
>   
>   static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
> @@ -7416,8 +7418,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
>   
>   	ath11k_peer_cleanup(ar, arvif->vdev_id);
>   
> -	idr_for_each(&ar->txmgmt_idr,
> -		     ath11k_mac_vif_txmgmt_idr_remove, vif);
> +	ath11k_mac_vif_txmgmt_cleanup(ar, vif);
>   
>   	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>   		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);


-- 
Ramesh
