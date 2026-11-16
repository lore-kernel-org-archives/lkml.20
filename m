Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798269;
	b=TIxkIU6MZPT1rXMf7ewqb7svbLwBbYjd1bzZINqWk7n2DwLoBPkgkLF0sDroqisX70Jz
	 qSBNZlsofI88sAdwE+A6Rstl2VkDSAT2rtPeCYW+yrT4CA+OLJWNNYpjWyQsKr1kDWgZA
	 SDCxteoPXGtxUMG8AQ7oLrk8Z/dl+y9xpQgUY4E43cCsVE2TlqbcaQ6zsLNkBmLT5Rbkg
	 AJ89xPKIIsnIaORhVdMx6ZYA6YGPGh5gRBe0WyoBq2Z/Xj0Zi0LbHjcL/tNTNQMmpHbzN
	 vYhCH1M5Kpt2KHCUUgVFMXp/ljW9AhEaa+zgYgOTBcuhhy+XTlB/0c9kyAThY3T+r+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
	b=FBR+SBNYkRZ3x6WDf6NU7/VD/dpFYodAoRqaEd5lu8aoB5JDiPyxjN2UqEzbeVqWgdCm
	 qYDVZKjN1cVZ4pRFHJ3bu5Z7bm2c5B2rxFOsf+iArzIiCxhwI3wBIKplvhBIvInw+EMhq
	 lxm3I3PYtDdbRougcLz0xE/XuL/fuCXKPSg0OAhHigKFbnfDOo2ySsmC7y5mvuVmRPEOv
	 PZHlvTjiHoTDrV4C1/wSvmo4vKPd3Jfz1so61aHkxEE+77XULbgRsLouH4QwCWxMriWU7
	 J5j2g71JC4JttysETuztbyxOX9+2DbSD69w7xmK5RsFzEpcTaG6xD8PqXf0ScjEDnew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ0mtxA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LFpxagt7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C242606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C242606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ0mtxA2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LFpxagt7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1KvUv3890758
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=; b=CZ0mtxA2DzDQ8HYl
	btsGnnbN5VpMegPO5gUYmTzsj1r9EEiVKe86NMJMsCYYsJhw0YNb4GsXJ5R6A4SY
	1Hu3xDFmP6SeTGSt7IqUQXjocQ0GvPDgN+sab0flbKYSifp1TsHEjz1B5JEJYT91
	Qw4PCh48QDeTEo+lbMcTUUbRlnMPEZyQm1z94DRvSFG22Lf/mlGuZ5nk7FHoE7nV
	vLtwYw581V0yY1eSmjMu8OhYX3p4mpZGriZwWeExHm1kNIPhynx9facweGSlEd2W
	uu2/Tv/erq9mStoUM1S7JwE2FCqdhRd4FbYfcSuIwboCtTghQKY24GhaDIFl/nc8
	f18aTQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqmkyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b19aa066afso2875640a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794798266; x=1795403066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
        b=LFpxagt7sYrRirvIGb9a2MKJIB9qCihkn/1bF929xyPniTdIV1X+ddN6wHA6izaUxI
         d5+ARI/AQO+bjdKDumYtG30ot8+boLQPDElO6VhAleKsVlrnQuKnjGq4l3/E3pFn001H
         83R+iWZhg456jXsT7SdRZs8TFBEonS8uyp+ESPMsvrKRLLrqkIlrOhcRuwM8EOAATsSQ
         PajR+B2WVIxdzbTRhYZ5JrB5uN03hUQuaa927UrFh4SDWq/hu0G9yAcjn4SqaqJBluSI
         26Zdd/WDIVWWmipTLrWur0o7iabWyiDDSsdTm88H9gyOf8cgAj0gSxkxFSAZjPTw0Y7p
         7ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798266; x=1795403066;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+s/YqkfPu6xF4OVnuCJWP5RfIw0rp2fVL5Y005kWSU=;
        b=kyYIevBfl/7mt7oTzO0tCwRrdZuKuVABgZSw/C9HwiECI0ehId7CCKHE/JxMQErhkF
         ma3hCmWjx6qGiZWb9NB6lxrh2nADrAJvY9rJQ/ZhVsiVdSiojxnf12V1YGtSzevX5079
         u5MwXSOPxbQjgAGsDryU+NDkN18QNaZ9aMnRQQaLETKqI/BwIE26EO86I/LoyzYU6jdV
         re2M/Vg03GYsjPlnDQ2fDnLRSEz/SeckIEPv6RBipyafi21sQu7Y0YGsOe0htfwpjZxJ
         W3m40DqweDn4DRQDbpKcmoPqVjTLCS4Cqe4G30cOanLIK72hCDdhV4LYgflIvLwJKJQ0
         XnUw==
X-Forwarded-Encrypted: i=1; AL+hErETb/9fXEXeGo+/h6dwqH7frbaYJQfyeDd9jw32Sq1gOZnXY/Cq6ghWmfKPt4+hfv7G7iS+uEMLMSVLxzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mxjlRpzUb5tuWn1CLIBbKNILDJAqVW8Yfbq8V2Ds00njK631P
	V9Px/C4Z+iLMpz9YA79Gv4goPvD9bCroemoAfoabKiDsgQSZpIFam2l6o90th8DRYwwt6xQvSx0
	vfBViwUTOc2z8SHx2SjGUUEwr7RkHrYdSObP0jDbFD6S0SHIe+EgINGrcpqH/1yOuZcE=
X-Gm-Gg: AYBFou09mgyUNidcKq/UxOMCQB9puV8/y7XmlQtTiNtpZSDfGx4Y5FUxzXjxUfI3pck
	JBU1OKVZxVzvjPVZo9laNfA6cOdDiZ2M/bXxRsgPcSwJU2ZCHzYI1w+O/8iG7GaKA21uZ6G8sqv
	nyaSULWV282L36cYfbIMsKtTNgqKJM+zNAA/xaayhM8m7PUY+QfQ7XBcHs577QPjBwyHVPkNGkd
	XFZa1jlxOA2e/Vgvmkr+3ENuTbwZfS1GP531uB7dpgxu3wOUPGxbJy3vPHt6qY2TQ0X+sYQFbuT
	pbS50O1wMxeY/qTIFhKxZHUD3sumNtlmYIgC7b+bkrAg4mMK2Iuw63xqg65MrcIVsglZYgOy1JK
	ZIoer3q3M90u5rqUQTISSg/2QtBbJZf4BX1D70Mg4Z0IzHtYFieRVZRx6M/eMpBzgW9XZC/OGQP
	Tb4c+uMWLkc/ZhCrIRuXMb3J+pzKOJbZnauyLCPWh6/RM0
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6099336a91.39.1794798265656;
        Sun, 15 Nov 2026 19:04:25 -0800 (PST)
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6099319a91.39.1794798265100;
        Sun, 15 Nov 2026 19:04:25 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6dd2dsm18994350a91.2.2026.11.15.19.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 19:04:24 -0800 (PST)
Message-ID: <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:03:59 +0800
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afa72ba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nA-HWIxgkZHMIsNwmeYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfXxvfEzau12VuP
 TgtEheXkQHdHOKC1gtNrWwj8DdycIfqNuXlF01tzbqk+OGWW2CvsV6blHCE/LV+hXk3xV4XYXjw
 ZoE/e0RtkMBo/QHKC03dz736QSMv+Dc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX2OuB0IeMkURw
 WggdzUgAIRrPZEiQSBxtmrZapymPWY6NfHELhIgXs5Wt11EIafdV4ZurNZuIzQOuEBAG/f66fC/
 dnd6mXfSkjsD0pQ3ofIf83CaUcXhKB0nx36AVM3jUQERiC2FrcNkjrrvWp+033aOzcfNclzeBFB
 /7fqo/VVv9F4ZrDXZ3o9+PTvEhrtDzfPo5OrLyK0z2B/60C5L3hCB3cud2VgLse7XYFiRw/1Hr/
 j2+WJPFtbUyMYulffzs65stRfkhL3OBxCzg+9d2BfGfXig7hJBwN7f9bP1Az4K2YTl/T6K+r7sY
 FSuhihzUTmfwWjR1qu5FTzDYA2m+0ynKk7TcGF1itfRQJ7V4O0l2FZG4O5S+2oW4xiGkDFZYbQH
 Vr71fz+/+pp6LfEXXn8B27W3lQegSbbX/xyWHwILiaUKAQlq+zTBIwNwHfDhu01kkvTlX+2HcaI
 2LgSTy5iqTwpz3aogdQ==
X-Proofpoint-GUID: ICUaJ2X7ifgEbCKu3V_KByFeZsjmBD6D
X-Proofpoint-ORIG-GUID: ICUaJ2X7ifgEbCKu3V_KByFeZsjmBD6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160011



On 11/14/2026 10:34 PM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_update_per_peer_tx_stats() and ath11k_dp_tx_update_txcompl()
> rewrite arsta->txrate under ab->base_lock: they clear it, then fill in
> its fields one by one. ath11k_mac_op_sta_statistics() copies it into the
> station info without that lock, so a station dump that runs while a TX
> status updates the rate can copy the HE flag with an nss of 0, and
> cfg80211 warns:
> 
>   WARNING: CPU: 3 PID: 30429 at net/wireless/util.c:1581 ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211]
>   Call trace:
>    ieee80211_get_vht_max_nss+0x474/0x868 [cfg80211] (P)
>    cfg80211_calculate_bitrate+0x1e0/0x4f4 [cfg80211]
>    nl80211_put_sta_rate+0x50/0x1230 [cfg80211]
>    nl80211_put_sta_rate+0xa30/0x1230 [cfg80211]
>    nl80211_dump_station+0x4b8/0x7e0 [cfg80211]
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
>  drivers/net/wireless/ath/ath11k/mac.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d76eeb1ca0019 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9425,6 +9425,7 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  {
>  	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
>  	struct ath11k *ar = arsta->arvif->ar;
> +	struct rate_info txrate;
>  	s8 signal;
>  	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
>  			       ar->ab->wmi_ab.svc_map);
> @@ -9435,18 +9436,23 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>  	sinfo->tx_duration = arsta->tx_duration;

arsta->rx_duration and arsta->tx_duration are u64 and are also only updated under
ab->base_lock, so on 32-bit they can tear the same way. Since the lock is taken here
anyway, moving those two reads into the same critical section would cost nothing, and is what
ath12k_mac_op_link_sta_statistics() does under dp_lock.

Not a blocker, fine to leave it for a separate patch.

>  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
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
>  		} else {
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
>  		}
> -		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->txrate.flags = txrate.flags;
>  		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
>  	}
>  
> 
> ---
> base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
> change-id: 20261111-ath11k-sta-txrate-lock-50b530be39c2
> 
> Best regards,
> --  
> Christopher Griffin <christophergriffin05@gmail.com>
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

