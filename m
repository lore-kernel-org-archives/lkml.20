Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F043C07C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543039; cv=none; b=pLmg/MsDJw3Kh0XL26c6JhQVY1BnqhTryNJRQfM2862u+yyXIm0SXbKmEY4dX5MaEWumkk3+SyJgzsFW2gY84/OC+H553Pqsk4PNrU/00lc5Kw4cbDjSBPUWl+qRjR53NL6dC5YapuIxDc2YCnwAbfTcIg1S21DyYNRLSYYZNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543039; c=relaxed/simple;
	bh=dN8oA0rQkrjbUqPHqgIxngtuOVCIQHx74ISQS7DREb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4Y2zZ+N1guR8oRnhTQ5ujVqj6bX2nokXZYTGO0yeRoI1/mf0Z3EnX8jNRPCNUVL3X6DOK6GvlGTOFgqTHF7v1SYDO/rew/gmTkde1dqF2pKk544DpyW518wU6GAKsit8Wfz/FPbrh9a9WkbRtuLM7iGdI3SYFnASEq5GuvIeFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjRCFUD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuGWiD8j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjRCFUD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuGWiD8j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68fir1730563
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEkb3N9+VBdmBk6spQ+Gh5I1o0rBhb+6I3596AWs95A=; b=PjRCFUD/gue+5UwJ
	W1hYnVvLtAvf9j/3iqQiY9yYF7Gc71Z6VzdPmaquRrdiM1GEmS2DnalGO4lgDFuK
	nghqS1Qbp/V2jQTQwuoHv6yk0tU4msCs5RasPiRAjf2gSJ1lG0SO9hP/Oy/gZcje
	OhJe3MsTdgf3CUCNa4/Ue5vzOWPLZ0YYSQUmHV6W4IiFv5oD5PuFAVYwF1dfKIxz
	ahc+y/rkM0vWMSM09dJj41KdvRBISAvffiKqlM7SGnz5Njt2wLedjeyQIi1Yy+JQ
	yMzHfJRRiwn1fELNs6zRC05AFhXDE34nrmRH+yJzuyXJ7h+/FkiHQ4rGgNvXpCQW
	FhHVIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7grcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:17:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so7838696a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789543034; x=1790147834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEkb3N9+VBdmBk6spQ+Gh5I1o0rBhb+6I3596AWs95A=;
        b=TuGWiD8jOJeQk1xddLY5J7YCTxadlY3C/BQ80n8NQj1vzFH3vTdQMEzKJemzJPFHll
         iF8IaFyq45ocgI3S8uMNwtpDbSDH7gapAGa2w26EFCRNiZO0jIXwYdUE3DpQHeH4bxmn
         n4WMRGpTm2nXk0mcSPtq1CQO7Ka4NlhhnqwVdlN678LJPYACBKBSoAdWkuiI1kSuIe7L
         cBrWYzmTiCL5HxgeH61DhKEzvXRbNIpBZElCDYCb/3XXVRU+EWTyxT6NQPzGAyXBxV/l
         u+XLcxrSDZHh0EqVlt/GttltRyPCGElIs+509v5S7qZXvHStgY+RaBgH9RX86Zxc+30L
         IkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543034; x=1790147834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEkb3N9+VBdmBk6spQ+Gh5I1o0rBhb+6I3596AWs95A=;
        b=JKdW3M/5yduZqmdbRUBac4hzIpyR54B0hFVBZSnjn+ErF1nU+tyoqO/EhE05YCqtYH
         OPgaJ348FeRwj6A48SIpgKrf0x6RatclRO5cLwhZV912HglzSj/O88dvRHi4NMzqO9d0
         oqI/mGrMs4PD7arZ4N39f/S4D/38ltyVQ6PJkHVVTFssbktcALw/L4TCAt5LOhEwOcQZ
         9CreiW3KSWYZcKoJmcTdjwarakizessRMQjETSx19RMd7lT0h2MpEM9EEj9gAlimfTp1
         voVKJpvkT+YW/gjtHLn4Go5I2uoc8tuOH4M0tTBz8Fa7e8Py30wkH+zBRSn0rNqGZgyi
         L4wg==
X-Forwarded-Encrypted: i=1; AKwUvBwAfpiUX8p3z0Y7UQr0lzD19fNDHoXduSlfKrZ6PzgUjwjfWHw6ar6Sor2593ws/vG6Wbii/A5Pcxm++3U=@vger.kernel.org
X-Gm-Message-State: AFuF++m3QdWcI4NCXuHVcSBhf1u3wGWih9LH73n0oMs/o92a/yGGBhSJ
	aL7PpIC42bszgA3CYlwtwtUAZkhnLCYtHXK4mpm3AY6kzhQpUyWWbj1uynlPfXxCiftoTdNjSkO
	VY/M4q7UkHfMrJZwbHmjuk4qOTf1Owr1EChRx3Uq6BZH7tuzzojAjCKCVMXJiyQJzVsU=
X-Gm-Gg: AYBFou0R8YxUKmsJXIltj4MNLrMA1rcsSKX81fy7ZCQjgb7qFaVnxwam/r2zJlNKfk3
	OBSuWA+sK1D01UxDx1RobrRctP9ResCddLZzGE95ExHxo9aoknxKBqHMxq8aVGMPwkbmIYxEv6F
	KdhE9Bd3YqTUo/Yz99DE87gKEoN8jr9wBpWBNPJD31buj+recURrnpk8phqrtn70acmOu57MI5m
	h7FNafnY32kc/KVlPLADwT2HGidH++IOd/zr7u3FQG2k73YslB6nE20Xy93wFs3NCgYOx/TSOWP
	L2JJxuzYJABFoC/BrQxGs3BHoCbKyZa7ztkkt0qg380zJLmJWbGEfaZm8Av99PTLwfuPm/Lu+DJ
	mMcpeJ+3z1ikoWE46XQfDZYbvbezW56MEbamqwDy+275WCwfNsPYP++xiqsyvNlZWWM4=
X-Received: by 2002:a17:903:8c3:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2dd8e76d9f8mr34585935ad.16.1789543033544;
        Wed, 16 Sep 2026 00:17:13 -0700 (PDT)
X-Received: by 2002:a17:903:8c3:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2dd8e76d9f8mr34585385ad.16.1789543033030;
        Wed, 16 Sep 2026 00:17:13 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fff3sm6586915ad.8.2026.09.16.00.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 00:17:12 -0700 (PDT)
Message-ID: <5e5a76ec-7aad-4ea4-a07d-19910722738d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 15:17:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: provide MAC address list for
 single-radio wiphys
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
References: <20260915152815.254016-2-ivitro@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20260915152815.254016-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GzSBgS__Vp6HQZRyOxx-pkbVyshexdJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA5MyBTYWx0ZWRfXwODYuM3EUe7Y
 Z1laq/PdQboQLQRSzxswudsoeD+tiYEcb7cVNYQ5ibN4T1HiqjEeC018wlSrLyIIv8PGW7Dxzl4
 0queAr25h2sUmeCKDeaLoO4xZcq2uVnlETiOCoSYSmj6JXWVEmfeVCrsOBg1L/JUqvS+EhGOZ/H
 fDpcrUqKuJBKq10CkHnfnzr8/Te3d4YDbnM0ok9Qrd2zfHmNYFZo0ac0HyZLlwlmdT+0M1/7UN7
 X6WyVqklnkacVVT/kkdUdiCfAY0mWNXBkJKG14bjdMtaiB/FIav7miegTvzBczpBlbA0Py6b8EI
 inpEWzmfaZfS5gOSS1kNYyjq9XLKYGL6UOOu1yO+0gx1rn1r7gucVKBM5/bWEbrp/c26RwYk3oh
 27d9GxtlPrZZNpU9CG2qliSd9d7vEHKOAhsCgFPlMA3wv3kAGRUL7X7QJ4xlOCW5n9ZaKMMwP+t
 42d6VGygjKWODJmPUEw==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa427a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=ihpUpvldzNVQdVzym_gA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA5MyBTYWx0ZWRfX65C739caOE04
 uKQN+NQM6mYocIK5X7x8SsbhtORrUZw7xvrm3pvew6rnUS6F1bMQbTRrmqDHD/MzJJUK7gQpbR5
 RFOGh/TiuZJORnmuzz6iUk9dW5Dred0=
X-Proofpoint-GUID: GzSBgS__Vp6HQZRyOxx-pkbVyshexdJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160093



On 9/15/2026 11:28 PM, Vitor Soares wrote:
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
> The wiphy->addresses semantics are hardware-specific in ath12k: some


@n_addresses: number of addresses in @addresses.
@addresses: If the device has more than one address, set this pointer to 
a list of addresses (6 bytes each). The first one will be used by 
default for perm_addr. In this case, the mask should be set to 
all-zeroes. In this case it is assumed that the device can handle the 
same number of arbitrary MAC addresses.

The cfg80211 definition of wiphy->addresses does not specify where the 
addresses must come from. As a result, different ath12k platforms have 
historically used it in different ways (interface MAC pool vs. 
firmware-provided per-radio MAC addresses). That's why we suggest gating 
this behavior with a hw capability flag, so existing platform behavior 
remains unchanged.




> platforms use it as an interface MAC address pool, while others use it
> for firmware-provided per-radio addresses. Gate host-generated addresses
> behind host_alloc_iface_mac and enable it for WCN7850.
> 
> Handle only single-radio WCN7850 wiphys. Wiphys with more than one radio
> and other hardware families behave exactly as before.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> v2:
> - Gate generated interface MAC address list behind hw_params
>    host_alloc_iface_mac, as suggested by Kang Yang.
> - Enable it only for WCN7850, the only part available for testing here.
> - Add Assisted-by: tag.
> - Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
> ---
>   drivers/net/wireless/ath/ath12k/hw.h       |  1 +
>   drivers/net/wireless/ath/ath12k/mac.c      | 52 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
>   3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index 011bb22e21c7..03cb35071e0b 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -238,6 +238,7 @@ struct ath12k_hw_params {
>   	} client;
>   
>   	bool host_alloc_ml_id;
> +	bool host_alloc_iface_mac;


Please notice that, ath12k only reports address pool, and the allocation 
is done by mac80211, so advertise_iface_mac_pool maybe better.



>   };
>   
>   struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..45be5b08aa40 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14743,6 +14743,54 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>   	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>   }
>   
> +static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
> +{
> +	kfree(ah->hw->wiphy->addresses);

wiphy->addresses = NULL;

wiphy->n_addresses = 0;

> +}
> +
> +static void ath12k_mac_setup_mac_address_list(struct ath12k_hw *ah,
> +					      const u8 *mac_addr)
> +{
> +	struct mac_address *addresses;
> +	struct ath12k *ar;
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

Delete this num_radio check, please use hw_params check only. We cannot 
make sure other chips won't have one radio products in the future(Maybe 
they already have).


> +	ar = ath12k_ah_to_ar(ah, 0);
> +	if (!ar->ab->hw_params->host_alloc_iface_mac)
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
>   static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   {
>   	struct ieee80211_hw *hw = ah->hw;
> @@ -14762,6 +14810,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   
>   	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>   
>   	SET_IEEE80211_DEV(hw, NULL);
>   }
> @@ -14878,6 +14927,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   	wiphy->available_antennas_tx = antennas_tx;
>   
>   	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>   	SET_IEEE80211_DEV(hw, ab->dev);
>   
>   	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15120,6 +15170,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   	}
>   
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>   	SET_IEEE80211_DEV(hw, NULL);
>   
>   	return ret;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index a20c21807344..8658828ea47d 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   	{
>   		.name = "wcn7850 hw2.0",
> @@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.host_alloc_iface_mac = true,
>   	},
>   	{
>   		.name = "qcn9274 hw2.0",
> @@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   	{
>   		.name = "ipq5332 hw1.0",
> @@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   	{
>   		.name = "qcc2072 hw1.0",
> @@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.host_alloc_iface_mac = false,
>   	},

For QCC2072, i suggest true. And you can mention in commit message for 
WCN7850/QCC2072.




>   	{
>   		.name = "ipq5424 hw1.0",
> @@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.host_alloc_iface_mac = false,
>   	},
>   };
>   

