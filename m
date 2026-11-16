Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820215;
	b=H5A3tYmdOk6NMPnxP/Fx6ync5LUTn5OtSByBZTVDV/XGRcmFXVflKKjakxL06FTrnHxU
	 QYdGp1uOszM3GO6UhIYeN1jXWog+KKqoPaTFSAKTCzIgHua/ZfYI6PeJUXJP5WHhQpnHQ
	 5ionxApK2fJ3DRCB2y0z7CA2g87puCZGN//ZLFdrTSsGyItEVFjv99MtTYQ+cpOeRyEHS
	 GVVa/5Ml9Z86AIx97XOI/omCgqTOfowXVcg/pL4MphAzxHfP4ehUTrQRoTgC7PexpqaJO
	 Bop3OQ6OgY4fvaY9vJkZkeceREV0XyemPRhlOtEk1cK2pDP1DN1+yCYvHJ+fW8QwEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
	b=aaA2skut1RqQx+xQ++nVSpgzfD6O2nbzRM4/Xtrm0xxIFul/J/AFK0BIvMK1kGqHNtmX
	 N8X/9oVWqOyaCwnYZH2peuPGfQnkDF4o8DdKR6eU0JMhiml+4fv+HvqLj0rRIx6wJggK1
	 079IZsY1wsCvltA48DTEpNLp1feiQ6hICAW+VEKWflb0zu4zGSoF/pVmCeRsoooPasMm8
	 yeTZw8MHksN5+VgPP1bX0MpylNzYyKGYDOaCsilRiZwmJY5GepirWpsZJRgVKpiwIKSXk
	 1CPoJtp7JaymGVSDAlkj3ukIuxgm5LMHzZjwX5v9Jm3B+cDqjlG58hnqpxmpaNBj8JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtUGcIrM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtoRTYpv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E1606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF9E1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtUGcIrM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BtoRTYpv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ew6r524976
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=; b=RtUGcIrMOLhPSsmV
	HJcV7OKpdZS/fg2APPLOwjveAnPwLPCnyhFydoM060UYiCnKGrmKFzgNvAjlganS
	4MdzQuea4533HH3m+7O54E4EAJE88Vcl3XX9NReINHR4vCRhzD+O7YbIcpMJelEe
	nkz74XMR3QhWxFeOuTmHmXHOj5TVUJtaZ1PqSxDy01sMgriNgcDLjm+tbu4QtKjX
	ev2cDnStjBDmQTILoC569/tDaFT2+h0HxFgps1QEQ95nAeJsNY6m4DV/XSONoENZ
	PoGFPztFxMgs8Gk8QhJRCkkF6tsIMTE+RKNnCHlaZbXH6Ch0cz01OifSWCN/6mhS
	1S5xkw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqnt6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:10:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so4471627eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794820213; x=1795425013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
        b=BtoRTYpvvLz1RH74nDuUVt7+3jAkCpbjpxc6DZ7lKRhPsXsjyXrkR7LDTkLMXCJP/W
         jzE5F0bBE4Z+C6yWfo0mcHCi5ou5KWrLYjwk8I+S8MSyjmBhfDG3720YWGIivHW6al3G
         04dLCJAsPMHSo9za4nUeHBrUcdm5iT2wYiucM2tvY+2k7/qyir6RNOB0rbaydIqnjIZ9
         V/G1qpt/+s1S8WsB0giR6nwHQ16yztpF/lSawx6cXWwKWJktXbUn+LWG9ndCz1d6U6Dq
         vmpxx4EALweg2ugo3WRM1HdXvCqkue1Q1fvsW3x9kBoq6OZfsZdFVyL7cYZ8ZM6bR2lZ
         XASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820213; x=1795425013;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHNmOrV3/wje2NqVn03EqzZH6Y/T/Hl1kXkBQsrwoDg=;
        b=wxkkF37PHH+igItRmdouatRrZhTDfDYdk74SgGcIkCwhWQgYXN6VO/6b6Sm7fEAn9T
         68YeDywl4b/qnRbbmqBRS6oRto80g6SLbL1fCq5iI964eG7dL3syxe8F9dvrvQZeXsJB
         ggccMGxrafiVfguz77V0pfy7WJtvLB+IDZ2mnbd4Xs/riM6PCjL3kT37RlgbNn/2ecXo
         oC6Lm9pOhxo2/gJDJVR87HdWoA6UUuJ56rjHxJD81ZaVZ08+6NCD3shmoHoo+dm1+YUz
         ExQR16++Oh9hjB1u08lWyZWDezhSXYWo9YJ70Z6ccppFCZ6nXseS2UWLmnxjhcXjVkU8
         hyTw==
X-Forwarded-Encrypted: i=1; AL+hErE9PkJKLqkrJUQwPIAgwHJYHD8ASVNLkiWDo/w7ZFtIc3UdNGqdTB9kZiccPZ0aZZwAu0ZOOx8beZm5uU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DZrwWHFMm1xhZhnGOmJnW0wZmujtBPFNafH6rfWEdR9IUH1is
	Cp8xe1hEEZoWXdp0O9JyKceV1RSFHEgx4E3BGyybsoTaDyFvw/nSjNeKH/icdG/T2h8AAdjjcrA
	8/oCCSbnH5mRVTm1N329NZh5PE0Auxod9Ayj7qx4K5Kzv6yDhm6VHwlRP8LuFNbmXgI4=
X-Gm-Gg: AZFdTZdHVRWPHnxpTSdj20ULo8rYud5eBjbeDTDLtG5S5GJErl6JvA9jNFPT1QEhuwN
	56hBcck0kxCudt/XX33gG83vxLU6lag968x2R76dyrlpcSIr1PQthTPPoKmecZHau5oZQB0qnWH
	xb3BzbaS/GMgNlwxgfnGdeqME7nSIazm+dA+gzcM/hFcugr3pHeShOGD9CHKfIZdVGCrFsCpCNd
	Bj+1IOOz5CTS66mDIHrakliCZGEq389yQdRKIi9krV8Ac25KbhyXyY2WGaQoSMPjhBGkD+ZIDWp
	C9uSp2W7OfVkhtBDTQZFkiq+THPdKCiULjLNdXVKXh6t7+saDl6+68eqv2HKMxCKtGeGleQ8RER
	KjaUObeglgX08z7m4hiM2EkkF2K8aNxz3Aj96R/V9FtMh+g0d4dkDY1sLJkTHxKw9kNq2O3OfPA
	blQBFnfSLSJywCyWqI
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr15704790eec.13.1794820212767;
        Mon, 16 Nov 2026 01:10:12 -0800 (PST)
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr15704764eec.13.1794820212247;
        Mon, 16 Nov 2026 01:10:12 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm49500055eec.8.2026.11.16.01.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:10:11 -0800 (PST)
Message-ID: <a2313350-7374-404c-8a8d-998acb934bcf@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:40:07 +0530
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
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afac875 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nA-HWIxgkZHMIsNwmeYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfX1DoosMbkYNkK
 jWrzB76TMvMj3YCU+63hR+MelhkH2plizNWJEeX5Pdq3YX0D1VfP+SR4dRt6qY6//jpKMh0iCe+
 ibiMVs1sXGzm2LHbJILs3R5ApUgGl7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNiBTYWx0ZWRfXw0U5E3vwUjtd
 V5HqMZ6ni30KZiaQ85NIOWUpBEKZ4gvjgcWSmw8slNs3JYH2aOLqK+nZiHw4tY3JXYERri+RS6h
 CsXUv4JWR1rg/Ath/TD6xXeWzW+Y/ZunKf3z4UJX5ZRtqt2FFgzl0eqwEC5Ge0FpTppsKnVMtxe
 NFP6FFG4sGBrWiGZW/Edkhg/IVcm1WHRo/ftDGhhgeMcU9nv2V3mNfBOjfuO9COsztrIwJU1pe9
 KieWhs6OoCFvKGo31wg42Wb8ZQ0/WIjXayvt48brraw1zIbUQquhZYBNquLkJ8RugWA0QE0OzzB
 bECEVRqiLATesWuNsx2/V7sPixt9qR7+G8V6Wzfkgqep5KMqgMaAsStHmX04zRuKi//oaRyNKDb
 lZeE4HngWiZ6CrJIKbKT2UA3+5LuKznHuX9Rl6+tDAxNvBfNi3ZE/iZyJGUNwE4AU7KeBkvrX3+
 3fCy9Y0QCeQiw8SRDcQ==
X-Proofpoint-GUID: 5xfT60awB6khVKvn4c4lMePIF8STj1nu
X-Proofpoint-ORIG-GUID: 5xfT60awB6khVKvn4c4lMePIF8STj1nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160036

On 11/14/2026 8:04 PM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
> station info without that lock, so a station dump that runs while a TX
> status updates the rate can copy the HE flag with an nss of 0, and
> cfg80211 warns:
> 
>    WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>    Call trace:
>     ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>     cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>     nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>     nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>     nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
> 
> (the line is the nss check in the inlined
> cfg80211_calculate_bitrate_he()). It was seen once in about a day on an
> IPQ8074 AP whose stations are dumped periodically by a monitoring agent.
> 
> Copy the rate under base_lock and report from the copy, as ath12k reads
> its peer rate info under its DP lock.
> 
> The change and this message were written with Claude, an AI coding
> assistant.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
> Found on an Arista C-360 (IPQ8074 + QCN9074) running OpenWrt, from a
> warning in its kernel log; the cause was found by reading the code.
> ath12k already reads its peer rate info under its DP lock.
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d76eeb1ca0019 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   {
>   	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>   	struct ath11k *ar = arsta->arvif->ar;
> +	struct rate_info txrate;
>   	s8 signal;
>   	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>   			       ar->ab->wmi_ab.svc_map);
> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   	sinfo->tx_duration = arsta->tx_duration;
>   	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
>   
> -	if (arsta->txrate.legacy || arsta->txrate.nss) {
> -		if (arsta->txrate.legacy) {
> -			sinfo->txrate.legacy = arsta->txrate.legacy;
> +	/* The TX status paths clear and refill txrate under base_lock */
> +	spin_lock_bh(&ar->ab->base_lock);
> +	txrate = arsta->txrate;
> +	spin_unlock_bh(&ar->ab->base_lock);
> +
> +	if (txrate.legacy || txrate.nss) {
> +		if (txrate.legacy) {
> +			sinfo->txrate.legacy = txrate.legacy;
>   		} else {
> -			sinfo->txrate.mcs = arsta->txrate.mcs;
> -			sinfo->txrate.nss = arsta->txrate.nss;
> -			sinfo->txrate.bw = arsta->txrate.bw;
> -			sinfo->txrate.he_gi = arsta->txrate.he_gi;
> -			sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
> -			sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
> +			sinfo->txrate.mcs = txrate.mcs;
> +			sinfo->txrate.nss = txrate.nss;
> +			sinfo->txrate.bw = txrate.bw;
> +			sinfo->txrate.he_gi = txrate.he_gi;
> +			sinfo->txrate.he_dcm = txrate.he_dcm;
> +			sinfo->txrate.he_ru_alloc = txrate.he_ru_alloc;
>   		}
> -		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->txrate.flags = txrate.flags;
>   		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>   	}
>   
> 
> ---
> base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
> change-id: 20261111-ath11k-sta-txrate-lock-50b530be39c2
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
