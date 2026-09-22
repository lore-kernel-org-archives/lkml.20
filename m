Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9284A0F13
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057651; cv=none; b=m/Ipj1N1dvtQM/VJYbR3Kbd/n+ajaXu/Neq2/JUrQzUF69Aa+FhEiCll1URlvU/mGfCYrt0X7t1TrlAAVXzCFFqdTe0CDrDVYvkyas22olRFN8xgXktJsa6swzeS2sidYRauNLr932nyL21bnJMrvvnLOjquSi6IS/Ep+76vYUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057651; c=relaxed/simple;
	bh=3KpkHDgGN8p72VL4SaR+RE/c/7NAHTdfk4oMrpstcw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTdnyKYt8TYCn96NfoE5GcenBuB0ZE5+il/+zCAu4Ar2yttuCCFBSzKqOikHm9yIfftUXlbISzKCJAStb0mVP0FkE94kMjrbH+0/1LlmJH4/jUDynBQ16eRIsGmxQV3kN2eM13W1AIM1iclOfGAWx8RbjSp43WPle3ovsP8Jzhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Np2i9P+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHjHKVO6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Np2i9P+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHjHKVO6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M5ZfPp3539770
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7wjgJuF0n0CBkv3BCSg5e9sd/k9j33jADqObLn+WFpg=; b=Np2i9P+fcuY3dSkO
	0iIYiYcFq7gAcEu74BV8uYScuDNd7vVgIWZuhpNY7Y3FsmDlSGcBZpXcccmllrmI
	1RpTNGbQmX7Mja8fFT5lYGDPOCjW+8iJdzWy0P6Zlr4qEJiiHgIlBv4gz2ntz8jP
	Vzdb3c8DcwGMl49yzh+5/Sv+Pcl043SEm+rWboWPzoMbCTnEFcV1zcPmTmBc2T8i
	xNiMcubmdYU+wjlF8RIOVT+H7g/xZYYKu5IQY1qsLBMGoVi2J0hF8MtqhVt/FHru
	qGLodJ4WgE46KozEgQigB+AGWw+Qi6GATMPbOPhI3UFrIscJ9XDoMvNtlPrUvisX
	YREisw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8bdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:14:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc7337e2a7so46736505ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057648; x=1790662448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wjgJuF0n0CBkv3BCSg5e9sd/k9j33jADqObLn+WFpg=;
        b=FHjHKVO6CtYqN6ZkisLXFvktHh3W1M+Yd6WnUqjuU6CsGV6446SMY37Y/cDssMKcff
         fNB5YiKmcOe9gEs0g5xo9dAtDI28AqcxYPcH+zjXYzeuBL4uSxDAn20HUojKK7polQh0
         bXM5JwptD/BBAuwBOh0gxWrG/quipHetQ/2jtst6HsP4+Pn2owk3ghhXY913s/xt1FYk
         fPCCdO8dv+xeiQblNKesg/CqDs13Sn++uzoSPA54lbQOV/ns392jImqD0nkkE2NNyaGl
         dxSAqXGUuk+Piaf9caQWyGPKaRw6PDizsw4Yz7I6pgrvyhPtWWxGYCiONsm7uWnHQ+BX
         Lo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057648; x=1790662448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wjgJuF0n0CBkv3BCSg5e9sd/k9j33jADqObLn+WFpg=;
        b=FBL55Ihu7k0PO7glAIxs1J8gxZdyLn2OLYqlp2HDDwqYqjWFvjxNANr7ACfsUbSj+S
         c6QhzV9VyEK9ZDZBcaiOGJTSYi6XPg9nLLOMyeubRuuWFpFWz3L6SB0vuH0j2qv6q27y
         6JNlvO4yF4Fmar6lfgOGdFkPRAV2sfwYI9q1GjVfTanDi2BYVrZCB4y5bEWrCd4ZXkBk
         afu7kgH1H+cKigDlNNHvAg+YNl81EqF5XUs4L07AENUfNFvZ7cbrldNYydQpOO5UkgEY
         85KLpAFw1Q5WHaqbv8Nwq51z0yy+UAsC5RJUeeShU8gy2y+4a8y1+6BmD2KHfU57/CQg
         vA8g==
X-Forwarded-Encrypted: i=1; AKwUvBw/t8jYFVQoaUYdd+WA4+CEd8McZ/xupPQ98XdgL/AJJMSiT7D7+j4/xYxxnOOdTznfZ7I6HbFdjhnBXP8=@vger.kernel.org
X-Gm-Message-State: AFuF++m5KXrrxKukywYQoTwWQSGE1OAMpGUd0vuF2XbB+AJ9yxdXhFfP
	ro23C8uq0bz8YsUpwYYvf1Jz0Z3q4wOHXGykZfFxuYVADYB951ZpCY3WAsewTWHfD7MSt98cyl+
	bVJJUIxXxzqt8gCNgWPbRNQZLFAHrOddyDOjzMh3BmFWnA9w0LgeytdKLFG3+9anHSy0=
X-Gm-Gg: AYBFou0/g2Sd5qD10xTrcX+mrx/x9pco6cWsd6ZbTbHfar8+/EZhXIg+GH13n9NZEnY
	1Tdf9m7g6Uq7w8WbCUwGy60PJbXtYnafL2h1zGbLEBu/mmlIYP4LfpnhJs0hibyksZ5masrfHnB
	bjAz/oC18qj4kYaaUTQ3C4hxvJ2HGFOQfIDOFsMf3TvpIkDIaJcBti0C1GaSQ2xff9gQEpTXvdc
	JErDSj+6U3uoKLKY6Wm7/8w+4vXf+3wnYPPY4blHPBDaC+VjOo/8dtLhUYlHnkL0xqirTYatzKu
	7YsRTKa4pJtw7Aixg1zPuHJFmdYXj1TMCT2nt+Xj5nghagBvAF9ERQcDeD1nSvuMVuPs+guRjYc
	J5AbnFyK9Ltg59fi8QKB8XYm/qt43fKIyug/L7DqBIR3dnZtlBK//zNQ+Ja9YeTdEEIk=
X-Received: by 2002:a17:902:f550:b0:2dd:c100:80b7 with SMTP id d9443c01a7336-2df60b66cd8mr1402345ad.50.1790057647961;
        Mon, 21 Sep 2026 23:14:07 -0700 (PDT)
X-Received: by 2002:a17:902:f550:b0:2dd:c100:80b7 with SMTP id d9443c01a7336-2df60b66cd8mr1402095ad.50.1790057647398;
        Mon, 21 Sep 2026 23:14:07 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d056dafsm4005045ad.72.2026.09.21.23.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:14:06 -0700 (PDT)
Message-ID: <974e540d-d6e2-4ebf-8714-98e4056083d9@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:13:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com
References: <20260921173033.846332-2-ivitro@gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20260921173033.846332-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i4ADPJid8IdnS2JiAbewbKglFOatp3LB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX+AcmhZ2L1pcT
 VIw6Q0O7eztXBbHAn9igPP+3qAgubhMUE64x4Rs8w9fZjzQG9adpqfSFsk1puRtZNp1l5tLmwoa
 0yEgASIvsb5ad5Shz3piE7crVyxlo73fBv82zvtfTjAqUO+xukKbgYRQ2hsqNK6jtvJau2vZpbY
 rferaWn4MpnSR3IbeTpMfZeyytz9gZ+uAfIlUu89cFm3Y/P1sPHNV6244B6ilbEyxPocoMVCAld
 p/RAbWTvFig0oJDCAAsY4OV61VviuPjMfUZp5lUkK/Pwsb0riGGQjBV6HJcI1HSU3I0Ws64iRI2
 XO03Y7ftaWqUajU5d9W4b+MZJCd9mlx2Ybg1TboIZPk2iOcoghRr43i9Zza75U7tY5OnPXAQMiW
 ufKV/mtJFeBz2ux5E3IlYM0aShmPvnHJXJQDHV8ZXA/6Ef/Ep03bD8KP9ZlQLd5NgO6WFup+X6+
 +VVTze8zGpBbn05GAbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXxelH5w+0TzYH
 inDQc0To95Qx7yeC8mFdhj3vO+yKJPlFZ9C2bG/lRdpqCErPbm+qcH1EDp8/yR8N3eeG0WI8Ulq
 Zw7G9apw0p/OmczPWjePNrV4aglCcfY=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab21cb0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=9m3d3nHKyyb8iBbjpxEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: i4ADPJid8IdnS2JiAbewbKglFOatp3LB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088



On 9/22/2026 1:30 AM, Vitor Soares wrote:
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
> Keep the first entry as the wiphy's permanent MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 
> The cfg80211 definition of wiphy->addresses does not specify where the
> addresses must come from. Some ath12k platforms use it as an interface
> MAC address pool, while others use it for firmware-provided per-radio
> addresses. Gate the generated address pool behind
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 



I just did test on QCC2072:

root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo2 type station
root@yk-Mayan:/home/yk# sudo iw dev wlo1 interface add wlo3 type station
phy#0
         Interface wlo3
                 ifindex 6
                 wdev 0x3
                 addr 22:03:7f:12:be:cd
                 type managed

         Interface wlo2
                 ifindex 5
                 wdev 0x2
                 addr 12:03:7f:12:be:cd
                 type managed

         Interface wlo1
                 ifindex 4
                 wdev 0x1
                 addr 00:03:7f:12:be:cd
                 type managed




Tested-on: QCC2072 hw1.0 PCI 
WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1






> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
> v3:
> - Rename host_alloc_iface_mac to advertise_iface_mac_pool.
> - Clear wiphy->addresses and wiphy->n_addresses during cleanup.
> - Drop the single-radio check and rely on hw_params gating.
> - Enable the generated interface MAC pool for WCN7850 and QCC2072
>    (QCC2072 compile-tested only).
> - Follow kernel block comment style.
> - Link for v2: https://lore.kernel.org/all/20260915152815.254016-2-ivitro@gmail.com/
> 
> v2:
> - Gate generated interface MAC address list behind hw_params
>    host_alloc_iface_mac, as suggested by Kang Yang.
> - Enable it only for WCN7850, the only part available for testing here.
> - Add Assisted-by: tag.
> - Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
> ---
>   drivers/net/wireless/ath/ath12k/hw.h       |  1 +
>   drivers/net/wireless/ath/ath12k/mac.c      | 48 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
>   3 files changed, 55 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index e790de5737db..c58db8482aa4 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -238,6 +238,7 @@ struct ath12k_hw_params {
>   	} client;
>   
>   	bool host_alloc_ml_id;
> +	bool advertise_iface_mac_pool;
>   };
>   
>   struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index d4116ba0da08..46f5f338f44c 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14743,6 +14743,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
>   	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
>   }
>   
> +static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
> +{
> +	kfree(ah->hw->wiphy->addresses);
> +	ah->hw->wiphy->addresses = NULL;
> +	ah->hw->wiphy->n_addresses = 0;
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
> +	ar = ath12k_ah_to_ar(ah, 0);
> +	if (!ar->ab->hw_params->advertise_iface_mac_pool)
> +		return;
> +
> +	/*
> +	 * Only the upper nibble of the first octet is varied, so at most 16
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
> @@ -14762,6 +14806,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   
>   	ath12k_mac_cleanup_iface_combinations(ah);
> +	ath12k_mac_cleanup_mac_address_list(ah);
>   
>   	SET_IEEE80211_DEV(hw, NULL);
>   }
> @@ -14878,6 +14923,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   	wiphy->available_antennas_tx = antennas_tx;
>   
>   	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
> +	ath12k_mac_setup_mac_address_list(ah, mac_addr);
>   	SET_IEEE80211_DEV(hw, ab->dev);
>   
>   	ret = ath12k_mac_setup_iface_combinations(ah);
> @@ -15120,6 +15166,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>   		ath12k_mac_cleanup_unregister(ar);
>   	}
>   
> +	ath12k_mac_cleanup_mac_address_list(ah);
> +
>   	SET_IEEE80211_DEV(hw, NULL);
>   
>   	return ret;
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index ae8df80928b0..ad362244ed9b 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   	{
>   		.name = "wcn7850 hw2.0",
> @@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.advertise_iface_mac_pool = true,
>   	},
>   	{
>   		.name = "qcn9274 hw2.0",
> @@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   	{
>   		.name = "ipq5332 hw1.0",
> @@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   	{
>   		.name = "qcc2072 hw1.0",
> @@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = false,
> +		.advertise_iface_mac_pool = true,
>   	},
>   	{
>   		.name = "ipq5424 hw1.0",
> @@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   		},
>   
>   		.host_alloc_ml_id = true,
> +		.advertise_iface_mac_pool = false,
>   	},
>   };
>   


LGTM, Baochen/jeff do you have any comments?


