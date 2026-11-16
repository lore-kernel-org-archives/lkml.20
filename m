Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821663;
	b=xiY/M3RHyqGmvJoYZcL/4t0uk4A+03m9byXXisTpfuHls2YVQVQuE1r2F4lo0pb00qxi
	 H6OCn7VKDJhW7bvx+ubgOEvxXiArePa66hO/Zm2bBR1uMRIs5P1H2vqkQXYj7lJYzcS6a
	 5nA5It3mERZca8inwq/Hqo7wk9WMwEoZ40vCjclynjp72Nyxpjk5uA+lIH7YaYcDG4c6e
	 ep5BE3Szwvw5ANh3stolJtd6G2j+Id0lQJ8J4YXZiQKAxRefvZz3J/wqBaebXYhJexnZu
	 MEokdS7MSD0s2QdDMh6hERG90UVq0giGdhN2yNu+qyilirzRQH/jB2JwQYqXmZ+0BFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
	b=QRupb9gKDIRyLWIkMRJbuxE3WX11uLUf7DOeuA0dEiusBWsnKAQGdAy63oNfAnF4+DtX
	 hVWy7pXXe4HteeaaaUuiV81j8P+O3iqPlLFGmNQuuxWDRWWaXqA51jrsC3g+VIZgDTu1n
	 H5bEp7/8MZrlezNEqkip5seeYB32QXEsOL58JX252NUf1jT4wMM4qEY4bfk0muCTjRp2+
	 SaoyHODiRcvOFe3rzZ0hFg1/YXA0+89AxsDYvCTDNi/i3GHm9zC6HTAeqkENBW/EMzkij
	 nSV48Z1OkpNG5XHTte7ZhN5/nTQ9q+On21SImMGKNSJ6wJjYmVk3Y5vRtOZnRQSZjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWEht0kS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="S8kla/XZ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD8606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAD8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWEht0kS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8kla/XZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ew853488770
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=; b=UWEht0kSmwCIAN1i
	vf89wzG5WssBH3FqIx0wVC17aqTqMf5CR+0Gm0ieo4n1tboCvqOImpEdr580vM+k
	ShnrOj1cGeymCmHM9PXDJawkXUrI6/piZoL1qMHuXwqn2wh2+882xVNssA+fXiri
	vjZ31xJcij+8arPeIpNSVB5t9NrHax4k5HRspNud9mdo1gBEcE8/uH7dbl9vaSdG
	xEE67Q2Qn+IHTV2UOXoaspf0sZY+Dpaxujmy5aHOP2AAJbgtL9wO91pmfFsFLEIu
	TNjRWAS/kVBudFprplsOXU+AyMkqaNWkzLeBM/KhXUGy78clZdWcZ8LpFyrikltl
	H/XcOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcdr9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:34:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4797865eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794821661; x=1795426461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
        b=S8kla/XZAaXOrKlWzbSRn+2r6+sFFyHjP21rM86IToViOZabgBSQtCpoAgct7UwBkm
         brySwrS34nIWCX/fH6YuMV4E47kZ8SZLrT3YYsjNtdQtSiN4Trfsd7QucQq9Um2/4qdu
         lurPCIhZHcnlQInUBpi49omhuTm+wz8hY4N4adXQRgb6w/uSc1g26CF+oZRPOLWqULIb
         wxzvx6/afcF8Vnm5AP6y6+X0vzSO0fVVT+6IDUCuBX4e5IVKXnsXWs8VOlcxzNO8rKJ+
         8yIL8IUHs9fz0G6zbY3O0dMJENMnjyv2z9DMyAmH8PPNKR9l29067bs8H7by/CHCR/eV
         9XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821661; x=1795426461;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGy6b93BMabiFW4YE7hFTHDKndizv2Qb5AduPJ5ZRN4=;
        b=23n+wVGJu0tuxBhUGEFWMFnj3thGG3JtvpGkzPlMnoN8u21H/D3XVIRqtQJs0D195F
         crHZfHWgFFlAXN9zMR0icrwpDDrxaB1XgWCZGYwBxbrFnv/xKgfBY9hpjnYpARNV6yvN
         oIOJ81na21/4bVK9oUR9X375sTlmxgINqj7ggy1ROIIYffdGsT061mrc6bpJSqBl5GC6
         dNLe1SOQ+KsIK3D24Ru7eF/lG+RFSANY/gt4k+Vs6RwuqIYyDCwvOMdh0K5ZN7gte0ne
         hHovxu0INxQ10PNqZT+E5o+hYilM6rnuvw/0leGlxdYE4WuEHlDpflQN16RE89HkFbqC
         hl7Q==
X-Forwarded-Encrypted: i=1; AL+hErFCbrCSBKPeFWDyM7Zt5+6Ujkg15Rsh2l44Sm2VJWCy+vohXGFp6U5oBWR+2ipa7uW31Gjty4xZMh68crU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ufkf9jU5eoXwZbAUla8A9Kuc9QCUZvwYuOl3SRHHbDfRzhteH
	/iMDMB0qubGHNElug+3Q36ZKemQ2Zlf5A8VMJ67RG0BevfEpvQ+zQt7WIxBa/6cGtRWe48UcOiy
	9vT3fEGycqKdwK1N/phtcADWVutEAdA4YxjNWCwHp0JU0+QGyDU8kaHGxrLh3jPfOoVU=
X-Gm-Gg: AZFdTZdBhiiP/LbvYe9XZ4/sf0k2vlXfaY1tE89Hse6JOISIIVUZMvmnA1Oe1petgBq
	KqdZcNIk0cw+b/MRszG+qcAC7OEKzzruerZ2R/wWtQOG7kucCmYeYQxiE3HxIH1PNgz/vou47zj
	MHpS0ilcny7JDgvFDwXBedOFa3qOyuhV4MtRcSBOLRYfDeoe0KUXqzXwK6vipEzXb78751RDqTS
	vUhLNRYEsGjrDBs2dVDu6SVCBjSLkxeewo332REiii52e/5si+RWXm3NZTUvuqia4i/5uDdiafU
	zU0us2Xh4wssrrXnhhJC5FmJo5UAlx7TfpJ2CY/tLirirbaDalpqLJcyNXKLFOgxMEpApFlwZtu
	V2mAWs715+teUN4f2h7qIwzFkNQrE5OjJ1UjP0ur7Ng5JBidYnrsAn1jTU4A94E0fWs0DIXLR7d
	jBHOGjKAsd/QYK06xu
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5923282eec.4.1794821660874;
        Mon, 16 Nov 2026 01:34:20 -0800 (PST)
X-Received: by 2002:a05:7301:b14:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-37b4a3a4b7emr5923263eec.4.1794821660346;
        Mon, 16 Nov 2026 01:34:20 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm32461561eec.0.2026.11.16.01.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:34:19 -0800 (PST)
Message-ID: <f2347531-afa4-41fd-b0fc-4a150c728a0f@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:04:15 +0530
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
Subject: Re: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing
 pending mgmt frames
To: Changyul Lee <lcy8047@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Praneesh P <praneesh.p@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261116021037.538128-1-lcy8047@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116021037.538128-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfX1pRAdoujqxKf
 UP+az1I9xJbO6Tyh3nCgyN7raPe75HNvlerbgBfZGA07F0Arxroy34qognrgySBTv2yV6jp5Nd7
 xZZXTgxwQRWnxoF0IENuTGi0aPMgDsU=
X-Proofpoint-ORIG-GUID: Z3JINxDpVXOzP35HDpuVxin4Q9uKS2qj
X-Proofpoint-GUID: Z3JINxDpVXOzP35HDpuVxin4Q9uKS2qj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfX1k+oLX/UnYST
 d+1CJzl7G57HF+rXyBpAbwEj3pEc9OHM5kpQ6HE31geH9GOPyk9uerEf8Li8IWDQsl+cMwHxaxQ
 DeCyRpru45pBmB831DuCB7ZkRr0ODocTwtNsseA2DN+TahPDB2hVsQ8wXjblrwJ0nq6dVBnQbOw
 ff9oKzFqiwC1KzFfWjilxmKOxKz7ZmdRoGqmUsIqUIONoRXS2JSyJwl3Xpo5Uv62F4jakPzOIUm
 RmNPS2xRm2jHvHnhtaP8LHepsIQOOPDCZZH8rzWYz69ZPzEndpd1t3henS3VNcXs6ulCT+FvI3K
 Yejy5kSP4gd07mkjuYl0lqQISQeYNnvr0uP+YVsGNbvPPHsaBckvU6cLivogNmDunPk1kdT0OJq
 i/T3hnlMqc098QP34psQk3DhJ16svlThdqjD//XY55uEr5B7sTSHbfdSvRZM2iT7pQwMv4seeOR
 LkKVDYiVc8CCKglrGKg==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6aface1d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=U9V32cEEDgW5s8OV8dIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160037

On 11/16/2026 7:40 AM, Changyul Lee wrote:
> ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
> walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
> completion can meanwhile remove an entry and pass its skb to mac80211,
> which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
> from the freed skb, and both walks can read an IDR node that was freed
> after an RCU grace period.
> 
> Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
> expect it to be held.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> Compile-tested only, with x86_64_defconfig plus ATH12K and W=1.
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index eee3f38375ae..bffb2edd0531 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -9220,10 +9220,9 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>   	struct sk_buff *msdu;
>   	struct ieee80211_tx_info *info;
>   
> -	spin_lock_bh(&ar->txmgmt_idr_lock);
> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
> +	lockdep_assert_held(&ar->txmgmt_idr_lock);
>   
> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>   	if (!msdu)
>   		return;
>   
> @@ -9241,8 +9240,10 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
>   	struct sk_buff *msdu;
>   	int buf_id;
>   
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>   	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
>   		ath12k_mac_tx_mgmt_free(ar, buf_id);
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>   }
>   
>   static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
> @@ -9252,11 +9253,13 @@ static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
>   	struct sk_buff *skb;
>   	int buf_id;
>   
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
>   	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
>   		skb_cb = ATH12K_SKB_CB(skb);
>   		if (skb_cb->vif == vif)
>   			ath12k_mac_tx_mgmt_free(ar, buf_id);
>   	}
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
>   }
>   
>   static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,
> 
> base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
