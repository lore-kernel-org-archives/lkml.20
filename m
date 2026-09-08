Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD42931D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851907; cv=none; b=WYrslKKBxGRdsq3qX3vDM40jDdUGXSHCXzerhzV6xrjeNnfzM8eqo13iWIOuWr9HlmMYzZemUCSbwwFQ6oRmspHxUH0IVzRQ2CgCI8ZFjDjy3izXryriOi+jwKKY6CKIt9oPdEkRBos06Ha5LZUaJOR8ry9ZT3uEX4aHtDo96hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851907; c=relaxed/simple;
	bh=awNKVpbba7txbNiZHCmEdrhtU+RGi370afg+wtscxlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEskf4r0w7DUa2ie8CoDQlprWVSscYjNDLWqm689k8He7Bep6nPvZiefk0iu2VdkdMDhWVB7bi8zUqfTZ7FPkmSSeYe6aSEudzCebGdJRSN6PtFYdaw6lFP7Pf82Jcti+Le9rFnoCAxfAdmo1E8vaFS57T+Ydvl9+MH0Mk4mwe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndUbY35u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJgS/4FG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndUbY35u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJgS/4FG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1sf2979240
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yySNJ2c/T3/7UiSJLByUZbtOSSdVDE444k2LE0ArApM=; b=ndUbY35ug66347vF
	2aF7dQwPlR5/Fa5aKgu/jzPrfxpDnTj274Fpp6b40pAGHDftnf5yuCd7I8zb8RGg
	m6utY83nJS95l2aFLRO26vGp+jEgYDPEIr/kG3KKfKKtjz98zh5Q31F+WH7grfGt
	GvmTdzGL8RjQkPta3mRreaJpjqUVJLGG3FBk+uhpaTyfUzZOdVSWDSz8SPFkMMiU
	crMj9P6kDsDQYnQ1k1TM1IWmvgVE+Kk9kXPjBMJbTohBGCELaKD/d9dvRUgDZ0fP
	gvyRWiL4boxFJLAQ3n390Zxo2sVAZ3R76gKefFW67wAHozIIvQUWbk3Yzs+xJ4Ge
	IClpGQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbme4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:18:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so3425228a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851905; x=1789456705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yySNJ2c/T3/7UiSJLByUZbtOSSdVDE444k2LE0ArApM=;
        b=JJgS/4FGlG/1UzDCuXRv1Ygfui3srxFvMALo9l6Min01o+rglLDxeCNOGl765gNAq3
         yIwCDOTGLTIAfm1YjlDqMhDWpdSlxLKdhDoL+8OffA2bP+4YproT1nQD3W2Jf+tdUzNP
         7A1xcARKUJe7xURuv1oASTMhDJelWnnVekQNuYdYo7nDhTpVWBhQ5a3FNcHfKUglX4H8
         cRsYu5iFPr2OB1jeNxKNakV7w74gBEysOFT49MiGgo2oMLPEfJg9XihrIE72zUmbani1
         Hw4/ln/h5+FIN7x09+2TfBeKOjXFmFP8H7zLk+Iebke0+qUI3lPQVNkl3AmTs2X7hpGK
         TEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851905; x=1789456705;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yySNJ2c/T3/7UiSJLByUZbtOSSdVDE444k2LE0ArApM=;
        b=QXlrUbeIsm0RQBg4UNt0EpRDgreQMr5R1F0KZM1blH8ZtzlQesUp46SU9DGIGEsY4j
         XrZhohAGUt+seh2mBiqBhPua7NAxbOSmMqTSr/vX0qmH8oXqzoa9rvVCyMoGUkSHS4xx
         RK4vg6aMvav+USvHa9mxi8K27mU0oN7jc/pabLDbic8UaAs2yFuZcEgskK/QBBb9gWBR
         HbMkYIKnVCC4ydtwZcOB3AdovtZCx+2ZRcYKpHrz1CnkPPt2wz7QGRPt8snVLyg4TZl8
         NpdaqFl9FBjFphWgrRkotC0fMWAmomnM5tnNm8JKkdsZ87mHnfgIUdWsiBZbuzwoQfYL
         Bb+w==
X-Forwarded-Encrypted: i=1; AKwUvBwLMeTEJED+TtsxncGxaaiNLdsxX7LXa3a/S0VjVpk1R5voURPrrOh+gsLGWO3/cXpMZ3/gTh561CiMaRo=@vger.kernel.org
X-Gm-Message-State: AFuF++lXGiTLSNyF09zZqEFj0Dsh9KuL1swMnMWZaAtgyhCzL8hrDOBY
	q+9CJjvCMVwlgXHJc0wD67719/mornwSYM1CW6pgu1gswKXnio1bIhtXP2+7zjQpsLauJ0LeYsi
	K4FQBqxvYNIziMPt2l3tOG89sQrylksIrkJG0egfAraKnW1UCPjLmY909lL5KyQ7jqF1XNCP6DB
	Q=
X-Gm-Gg: AYBFou1OtYphwlKcfCQtolZQlzhW+qTbjwQbyTjIq1cuLaeH5NGqh8//0hgCTYms3B/
	CiCXR/12gQtbRyO6JPHew1WoonG9y5hs5UxuFsCvApTGRasEBhK1DkpAP4vmMxECPkHgdrXSOqR
	t2PDzVyL8khtQWUx74DkfAuejKHsQWcMWtC2VNTQf1ooVeCtzW7wKWQ1ysBDiJmfhoBp8fnlWgr
	lyy+lnQD5PE4yyvkARhgwQ0WaNXIADVV06VYL90D136dvgsNkI33HcRTXvNmjC/EUHmkOR4kOwH
	9F4TxQYtBBLACcjDc0EBcFdSD1m36MeEFYyc2YJAacd9pANXiZvwzcJyZitaxKfRyX3rLIQ5rDE
	SbRD8/qNAT2tzKEzzOt+Hn4Sx2pOzD42s2Lo/LDapmGqDTQFVAim3x3in8GjE+ISi5ifELTQ=
X-Received: by 2002:a17:902:d48b:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dafb1820bcmr307986965ad.21.1788851904560;
        Tue, 08 Sep 2026 00:18:24 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dafb1820bcmr307986695ad.21.1788851903977;
        Tue, 08 Sep 2026 00:18:23 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae36adsm53287175ad.76.2026.09.08.00.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:18:23 -0700 (PDT)
Message-ID: <54f89935-526c-4582-a8ca-4f645257db53@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:18:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: provide MAC address list for
 single-radio wiphys
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902082219.3010793-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902082219.3010793-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXzMdGax/XUIWV
 NenkfgAWkmslIvyYh3KYQySTmyGtHOZN5ZpPK7lwv3ls+D1av5y62JDmVKUKMjura/4hVJ8xGm7
 QnuNCPkwFx2Qn4Ds5qplMDQnbeX+a/k=
X-Proofpoint-GUID: GIt-5kAoj0TF2tr-CsltvH68nfQ6PVj7
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fb6c1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=m8ToADvmAAAA:8 a=8dmAZdvqxf5LAHb2O34A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: GIt-5kAoj0TF2tr-CsltvH68nfQ6PVj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX4rV3hvO+lEpx
 2UJ8ZhIw1eQH6mhH6pUHP/4NTzNFSv5Vsohxv5yrsWw6GwQxUGzaiTyHoFmOcFhqgLf+gmO6/uv
 mRCC0cOOaVIvrNBA34SQURo1WPEfz16y+wjQqquPaFRKd6Dc4WreI/4jw0hZWWiOIJsSLAs5IZ3
 YuHqNVoi9/n2/5pv0VT0OenBPWpvVVgBZYdvUrK3CPauhiNTZ55p51Vw+GQRoo5moySBhShE30m
 3u0MRcY2pEAiXpHZmJumAFv4kSz6/YlYqlhXQVgkiNXT7PZuKADA+9qTt9Atwo58JKbQl72vx7q
 IHO+4Q6drEx+29KwR7VXlnm1ZaXv7hDUIDVzRRSdvgA/U6t5+m4GqNBJfuywuEx2Pvz0BC5iV6u
 i1NSh6BRw4xGhNmaA4v5WI9/XXmTMwNW5vQ83+FWHWYecmBPqCNE24M6ktj15Z2A0I6/IWTMAwV
 H6MkV94bjj8zMBNa6uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074



On 9/2/2026 4:22 PM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> As in ath11k, provide a list of usable addresses so
> ieee80211_assign_perm_addr() can hand each new interface an unused one.
> Keep the first entry as the radio's own MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 

We (Qualcomm) ever internally proposed a similar solution, but it turns out to break chips
like QCN9274 etc. I have forwarded this patch to internal developers, will come back once
get a conclusion.

> Handle only single-radio wiphys. Wiphys with more than one radio behave
> exactly as before.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> Note that a device which is not MLO capable registers one wiphy per
> radio, so each radio of a multi-radio device also gets a pool, seeded
> from that radio's own MAC. I only have single-radio WCN7850 hardware,
> so that case is untested.
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 9a775602775d..bee6701f1029 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14685,6 +14685,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>  	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>  }
>  
> +static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
> +{
> +	kfree(ah->hw->wiphy->addresses);
> +}
> +
> +static void ath12k_mac_setup_mac_address_list(struct ath12k_hw *ah,
> +					      const u8 *mac_addr)
> +{
> +	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
> +	struct mac_address *addresses;
> +	u16 n_addresses;
> +	int i;
> +
> +	/* The pool is derived from one base address, so it can describe only a
> +	 * single-radio wiphy: with more radios each radio has its own base
> +	 * address, possibly from a different ath12k_base.
> +	 */
> +	if (ah->num_radio != 1)
> +		return;
> +
> +	/* Only the upper nibble of the first octet is varied, so at most 16
> +	 * addresses can be derived from one base.
> +	 */
> +	n_addresses = min_t(u16, TARGET_NUM_VDEVS(ar->ab), 16);
> +	if (n_addresses <= 1)
> +		return;
> +
> +	addresses = kzalloc_objs(*addresses, n_addresses);
> +	if (!addresses)
> +		return;
> +
> +	ether_addr_copy(addresses[0].addr, mac_addr);
> +	for (i = 1; i < n_addresses; i++) {
> +		ether_addr_copy(addresses[i].addr, mac_addr);
> +		/* set Local Administered Address bit */
> +		addresses[i].addr[0] |= 0x2;
> +
> +		addresses[i].addr[0] += i << 4;
> +	}
> +
> +	ah->hw->wiphy->addresses = addresses;
> +	ah->hw->wiphy->n_addresses = n_addresses;
> +}
> +
>  static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>  {
>  	struct ieee80211_hw *hw = ah->hw;
> @@ -14704,6 +14748,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  
>  	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>  
>  	SET_IEEE80211_DEV(hw, NULL);
>  }
> @@ -14820,6 +14865,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  	wiphy->available_antennas_tx = antennas_tx;
>  
>  	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>  	SET_IEEE80211_DEV(hw, ab->dev);
>  
>  	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15041,6 +15087,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  		ath12k_mac_cleanup_unregister(ar);
>  	}
>  
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>  	SET_IEEE80211_DEV(hw, NULL);
>  
>  	return ret;

