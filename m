Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C994F3BF676
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574607; cv=none; b=E2PvjzfQMCB7T+nhgg5bxF+O71peXhrsHkFZYSAVhhcczwv/0kXAQ+ZY4eFyNL1gJMoetwj+s3aeSvcy6nQDKU7T0F12g+CKyp4vf/j6Euz5DAYQzJhyRvuwIcLgjsd+lDfIRkM06LQTHdmrv4NtqK603LVVVNwgMPEscyjLN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574607; c=relaxed/simple;
	bh=PvxMW8SITH1t1gSUYjYZPnBvawebufnDLNleallhZuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qz6MuY09Fv8SebsmQR52XTTm9hsezCqhE2NXTRuNFKDoMFFk2KsSEEiqbJCOO5cJb5AcNq+GXcvqzx5vsjYpDb2jKdzOgAvNmyA3W7VENla3J0sKHYF0SmTW1as+iMDist4ukb95JkIH+2yMAB4T/U7lJXZDhWhKkmKF5ZDrhvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbnMUt3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnlXzE9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbnMUt3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnlXzE9p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5P0Ej673922
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJNlotP/6/HHnZicU2LMqHCQHPmviWTeBFEUH89dLfA=; b=FbnMUt3ycDfdq3q9
	9ofioAT2dYyptlav+P7LhQ/qoXIGdVgq4LhtEi6hF370NEvIhDT0vdCwSQ8nSF3r
	2NNp26XPFUgw7Z9FnOCpjy13eC5HVsM2kO1KmcFyrniVM2YoK11mypVCfQhlBN2u
	dWOxKUe7DijOn9g02ZaD3D6xrcsNZZojBmB0RMEsgLarKOORs35uloCuec7UPW/T
	W0jdrYrVakHDp5KhgbSge83XOWl+DUJmWDUDqzS2LTEfljqc+QLczaRPGdhh+PUS
	T+fUhat3F3C0IVtFsG5fUQCl4VNxQD4biLgEHAnRHVD23OBNdbXuNzXDXqXPo4xg
	QQnYJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s02bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:50:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4800082eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790574601; x=1791179401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJNlotP/6/HHnZicU2LMqHCQHPmviWTeBFEUH89dLfA=;
        b=dnlXzE9prav/5/++vbRQ1xDEQLZxQrZtPrNA1+ZeFx4gSNWuHU3DSPhyGOWqei9HFn
         sRpnQprDsK+0UYg2xqu0YHCi0RLlHjp/c07ZikqQlRUtaY8Q61F0X2+waF3zNMiEv/pz
         YcAeLbE/1YpdbeBmyOJKau05zW1NHQKYGgxMWmbI8vvWjfpF+sPV//QGfPU+R2eW+u1U
         8oVRgdT8HuW5ckVo5Fn6Y/Ib6r3LBrdOPFBLGugDhc0jZpv1uBCPf10apH75UE8FESgz
         V23jWWFWuJFrAITEvo3SWqZHX7LaTaqrpWKYZmLm0CRxTjB9GTWgsUqGXdT1tgekkpsP
         9bVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574601; x=1791179401;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJNlotP/6/HHnZicU2LMqHCQHPmviWTeBFEUH89dLfA=;
        b=mri6WkCfQOJWms7OaUJJqPkkEif32+1uxNBcC0GmFafVlUxdxlyMrgqAN77A0GrKze
         mYvg7333wwhUZ7aHQLLTVXsAVC+fLX+Nl1SVZpAYPIbSTpOjOQkAOjlxDs5iQaRBYE8X
         AVcAwQG6tjIdMVJHmsBE70ttK6WM6xPrstHVReYRfgRv4xbFXi3/3Z1L65UFGHBn6zRO
         7+BDAtKcJ/vSwqrkJdB5+lqRHLBW0yI/yzX4C7pVt4KVrBwObzM5WRg1nleHDZnGb1QR
         Kiq7Bxi0JrMDC/wcxE0vRxUoiS3ksFetWK+uQgL/gpEgINB8wteHDv361RTy2ghQiqsl
         IXeg==
X-Forwarded-Encrypted: i=1; AKwUvBw5OWtd4Vtn2nuil+CpVYJkVA49Uw+OaLm8addnwQX4qXXFJUH64XzQmS6mslJUe70Hags6bmS2O5VV2qI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1ccBbBEAcLZL34gm+D/xXSYjdFNeE1FID0fDbjHKxO3LeMqSJ
	BZCw1xBX3Pz1z9vwv9awsiiuJMD3fNe1P+ADs4e5VXCshc7vmBQwu1eLVmGjmQ5UNTwkrXDZMvp
	SsCnNpPmVtRK8QvM6YknbpCL5ws/qyLfQvTmUnZCrPFnqcnFrHABx7Qx/z19adUorKYk=
X-Gm-Gg: AYBFou0rgW1IfdBJPg3a3Xf9HHAYB7NcLyglP6x0yMKOGjHdE7P4hGriK4qUMtvAESX
	6opcc8RtSBfMMefmZwnHDBRHUr0kHDMS+cWqOhPUS7lHHTpNYx5N1ablrnC2PG6h8aFKg2NRxdv
	QmK7pM9jEaJMqBAtFVSAtjPpN89JSYh5RCwE4vSE/5mPvTdWAJrICgI7f41rni60bHtPa9b4uH3
	jLSE2omP8TWoRlr2Dl7NKbFPkR6ocOSD9AnGN3vJh6mkGuUfNTe2BH5nxtyZy03sZ7EokodsTFf
	+9jBFsOc8yJ2LPhghsjp9lL479+M1qru7L32ZBjOcziEMToWfHdZriKsDzTN8MXUyA+bHLadN/o
	LpFmrHZQU953hUdZS0guBZM0j7j8L7Pz2dim0Rx+6
X-Received: by 2002:a05:7301:678b:b0:33a:f8c8:1d47 with SMTP id 5a478bee46e88-3427236f831mr9001076eec.28.1790574601419;
        Sun, 27 Sep 2026 22:50:01 -0700 (PDT)
X-Received: by 2002:a05:7301:678b:b0:33a:f8c8:1d47 with SMTP id 5a478bee46e88-3427236f831mr9001051eec.28.1790574600831;
        Sun, 27 Sep 2026 22:50:00 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm27014719eec.1.2026.09.27.22.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 22:50:00 -0700 (PDT)
Message-ID: <773e57da-a9d3-41dc-805c-cb38b38b1dc4@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:19:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: avoid IDR mutation during pending mgmt
 TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926154824.75224-1-yaojiale02@163.com>
 <20260926154824.75224-5-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926154824.75224-5-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfX6mKVKABmDnJX
 ZNA5B7MV+rZOjI5NO/o1LQe265PyPqI9qqb7aZu/AHjkWhZklApUL7WaG0huzqUom56GARZIeac
 RHrj4AO01xWE1U2FXHZoKR6DbwuJMXXQRROtkrib7qYhglQ2UpKQN41M9ioEMO0g0VBonNZqJy5
 EnbaGNYth3KfokNW1oTMdUDyljml5itjAECFiTNPCmd0D2Kepbtr4DuGp5xmZEdiD04wYhRrDBN
 jP8bnQuYCpsgPBOT+Smd5jDx9hhTamvMv4Wog1Ls52H04Wf41uX6o492kxxxgK0r2TuS7nm8/TB
 cR7nvQT/gt4Dq9EAxzQNtBlEsXVS6y6zPGObtBbE/+kh/ffErUz6j8gx9WUanInTmhOfKCpO/QB
 PwMjfnwMbiVysuzFs3eU3mQ0UmGUkUBYQZuilvF89BTGC6+bTcj1QImQDXx7uytCd+2DbxG2grE
 6NGNme+HmF2Gc1j9COg==
X-Proofpoint-ORIG-GUID: g7xfhWFLI110_t3H1GzTtxdSTMq2uX6K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfX15y+PWICYp7I
 QRgXcNVlQK7mQy+X89U2a5A1sTbFW9QgjsW+JcsTm7m4T9D3dA5cvqDSnQ0FXUUcYJLcZ49CrxH
 IFunJ6TJxSKZY1wSumTUM89RblMjGBg=
X-Proofpoint-GUID: g7xfhWFLI110_t3H1GzTtxdSTMq2uX6K
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba000a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=X_UHSqtvQJ_SCcS1l9EA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280023

On 9/26/2026 9:18 PM, Jiale Yao wrote:
> ath12k_mac_tx_mgmt_pending_free() is passed as an idr_for_each()
> callback and removes the current entry from txmgmt_idr. This can
> invalidate the radix-tree iterator retained by idr_for_each().
> 
> Both callers destroy the IDR immediately after the walk, so removing
> each entry in the callback is unnecessary. Split skb release from IDR
> removal and let the callback release the supplied skb without updating
> the IDR. The following idr_destroy() tears down the IDR itself.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 99bf5cf79d10..7695b21149d1 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -9166,18 +9166,11 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>   		wake_up(&ar->txmgmt_empty_waitq);
>   }
>   
> -static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
> +static void ath12k_mac_tx_mgmt_free_skb(struct ath12k *ar,
> +					struct sk_buff *msdu)
>   {
> -	struct sk_buff *msdu;
>   	struct ieee80211_tx_info *info;
>   
> -	spin_lock_bh(&ar->txmgmt_idr_lock);
> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
> -
> -	if (!msdu)
> -		return;
> -
>   	dma_unmap_single(ar->ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
>   			 DMA_TO_DEVICE);
>   
> @@ -9187,11 +9180,23 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>   	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
>   }
>   
> +static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
> +{
> +	struct sk_buff *msdu;
> +
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
> +
> +	if (msdu)
> +		ath12k_mac_tx_mgmt_free_skb(ar, msdu);
> +}
> +
>   int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
>   {
>   	struct ath12k *ar = ctx;
>   
> -	ath12k_mac_tx_mgmt_free(ar, buf_id);
> +	ath12k_mac_tx_mgmt_free_skb(ar, skb);

this now keeps the freed skbs in the idr for the whole time 
idr_for_each() runs as opposed to previous implementation which removed 
the idr entry as well which looked safe.


>   
>   	return 0;
>   }


-- 
Ramesh
