Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EA46A604
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365734; cv=none; b=cs0WBqWLJa9mR8a7Ob+u2M2cFgal8TjdkevhC+1NWGqYrX21hcMO1dmNeZ/ho3CiFEAfsehGQ6XMCnN74faH32a/vucoX7/n4nk3WbZhx6AtBTqHdqLDailceLWD8J8c0PgXpvQUVtcskoUhzu13cNVfIi87aya716+QF9jPz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365734; c=relaxed/simple;
	bh=sukgP5Yz3NvqLS1QVziCClY+uJh7JmyNTFZNJP94JnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCTk8UtdjgLTjLOLVoo1Uoad+Xy14gGb0sefWT4oBBLPWKrzDZZwKJmbVCvIdiN7k7FEGnYiN22AWwBtuYHPtWkDUgbkIRcdHq7LJkTGcyVJCmhjiChtl6GFzT2IM95KFXQg3vyCQRJdV4f44YUXIqm7gXfcPj5fIrwSnUK+jOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kj116TiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUrOYCrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kj116TiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUrOYCrd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977joFS3686164
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWHBpKt1zMgFknbQah/VG7jCcJ0lGDysyv+pzjzXw44=; b=Kj116TiJ1liFsAdP
	EPU+WEWBIHdO1GVW4MLVqZK8qsjfeqw7LLRPlscuIYy9UE3V09Av4qHBWVLrG0iQ
	Al2go6ZFr+priuiQov75UVvbuV1VLd5WgmiRbmacTdxxE/g2jFYofOJejNWEdtl/
	8x9uu2gPiJWLAqXnWpzoMOoc/5OydJtojgsrRTFDrPAUE4zVrMw0gWnIJmD4keQB
	xAsDkV4d1NTQQoouh2K72oeOfybyOxecxSlQhJi3T6DCwMvrPgxLn9BoK17F+QyN
	8uDuEsQLDY0Wu3xSvKJX5n5228lSbni+M6GokcePJt0dtgUf0/drhqVbNvbgSCZU
	76rGQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609g7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:35:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510a481ae9so7485122eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365720; x=1791970520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWHBpKt1zMgFknbQah/VG7jCcJ0lGDysyv+pzjzXw44=;
        b=hUrOYCrd2fG5Cl4xziWc5BMJJT2ADA4iso0jVYC6BoZSSK6uPZvmaHU1OC5LfoNRco
         tMHEQSJqt4L624l1W/Q1lPTOPglAR1jChrapCNgMwCd2XzOWyvRvaW8o2rqoNoVYOZXr
         x8lzxm94NG6pJhHQYW7g/MfsYVd8/q8X2c/lW//T4vvBk9Mhj5m4C2po6MYWw6aJqNcu
         Rxra7+Zgtz3wV9ZZ1mwZEREk92K/EoXOHG1N2fYxAS+zXQsWLjFYfse/aq4mfiwJX4Pj
         9EVMXaAm/3PR6OjR0SYLCaZiKjxLfcmCYXy1pKZ0uf48y4VIDx4TYhUk3bu4OHg0nqnp
         6XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365720; x=1791970520;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWHBpKt1zMgFknbQah/VG7jCcJ0lGDysyv+pzjzXw44=;
        b=KocwWttUYRIK20YFC3MqfHyOmXS2NtTRcEJvi3SmkFLyTkWFoCaAl0EKoU0uqaPFL4
         iel+bYOKY1RHZaQ0uyNI0qbBXaRTEPfLUZ0NiKlAWwW2vxYz1SNsEQ5HpUIDwVNPOP4x
         dpOgZuevKwbCnNOJysXWv6uf0NO4V1VGgDTT6cmcrO9+rkS0aT2XNvGocT8+RALLLYTB
         M46MIvrdndf7C09Q60GxeF9GAFJZ1Rkl0qFjRcXnTG/DOzcuSzKscpeo8K6N/rOdd5IP
         79klbjYZ7mbmI3+q3S0Kne1nn4+hO52c7HrgET8hEwrYZNMBkb53oeFPi5rW5Fx9GPzt
         XEww==
X-Forwarded-Encrypted: i=1; AKwUvByKR3q39sbUeORcwPgV5g9iFhfwqdFQyHfXUiIFlQ1m8jUK990xpcar06ADq42FKPQ3itdk9KVoylYPgLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu+kaKzbjo22MGZIukx0etEKxYIGW7NNL2A2tDzbWd3dP6Caac
	3nk/83UVTk2aFw+0Pa6tGq39MH3Pha3jIPsIHrbfmehAT4ptwZVDZPf4mXD5gQasNYcErjit8Hz
	s1FI5YFxxNCvHBhpxkdxk33GEVjihC6gVtIXK41qBkifmUaN8VqUaVtAxiq7VBiOheUdcux3kDU
	E=
X-Gm-Gg: AYBFou0OQsjkJcP5G59WzyZBAuFdibr1eZIiF50XvJNpR83e15/IM5KSzQxSBzKARaB
	1X621PRG+2YGmc9LSDjGL5tF4cQ4Z6phtG/XOBn18DZdZeEqNmCplx17iSHGPz8PbdZKMz6aCkv
	yDGM9kgfmdJbI+L60X7sIcm9tlat92//IeN08OlKCsOBYZMe4qgtl61hAOv900dvLhuFtGWyBQV
	wC3VXB8xYVltvjIlhJptobaKCaamdF7YYzRAL+yiPoDEgeJ3UlnKHb2or05hnGGXXFNRpBpWNxB
	ukxlOcylZcn8HmaqbDvl9pZToC+qimLpm0aYPk0/u8XWrLNlloFZeBbfWbnDhZYYI/pGUFDB37x
	3OFS/u+UnIRdDf3yJYA2D8epIkTRqIWIlexPGzF6a
X-Received: by 2002:a05:7301:670a:b0:351:4d03:c6a with SMTP id 5a478bee46e88-3515dd4c790mr2842506eec.12.1791365719601;
        Wed, 07 Oct 2026 02:35:19 -0700 (PDT)
X-Received: by 2002:a05:7301:670a:b0:351:4d03:c6a with SMTP id 5a478bee46e88-3515dd4c790mr2842036eec.12.1791365714103;
        Wed, 07 Oct 2026 02:35:14 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm7406692eec.22.2026.10.07.02.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:35:13 -0700 (PDT)
Message-ID: <6f6efa34-8e87-49db-bef2-e552c9abf0fb@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:05:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com, kang.yang@oss.qualcomm.com
References: <20260922200643.1133491-2-ivitro@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uVexr6HPnr7J06uRwFA6dIEIkHBq6RbT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfX4gdaqq6s68gF
 07ycd4SGq4BqcDOsRzIlJ/asElxJpj3MpMZ1pb1pkJUFSuCGRYjx6FOBnhgefp+NGDz/om6WaZS
 cOKR5Ydf3IPgDylPs4hmhqmbDu2j8U0=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac61258 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=PJUtwoy5LLMsS-UO4yUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: uVexr6HPnr7J06uRwFA6dIEIkHBq6RbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfX1subwzO9RVgJ
 li2YzL1CJm6XHnQ9Wr40XsdolKsIYaSE1wih6LQmavG16H5WdBBnFo0BGq48SQgelwMT1H9Vid+
 bo7/1K5rWUmneZ0DCMtIK6SC0HppggA8UENM0VfrXzqF4yJXUCJ38hUZFhGJuRHD1yWR/9GlJWW
 GZ+WOcBPO945MLwLKZpzpwTyo0jJnGyCxp9NWYd6VhiWWnVFf71nHOXxrfNwkTR3HeM4aNfAN6B
 tkmqyoLRksyB0DAYUyBzhBNYEkhpMAtT7cqZ6ghO/qHCY8kQsFzmMropaiOtecBGpX/6hpV+e9N
 AIdnlc8G0vcYkQ/mXIO+bUoHBuNNOC8dbqLtlqk9PBX8c5CVw6o3M9ApLNuGAqrG6jKt6Ugnk65
 9NzrriNL6EOl7jK0KI0D21uiGgWzD1lcrhKu1X2RuJULNr/RtuFg30Y1+Ikpqq3aUnCd+BMiziz
 20VfAZ/7jtdsHpoQXcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070038

On 9/23/2026 1:36 AM, Vitor Soares wrote:
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
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072. The flag
> is read from the first radio, as all radios behind a wiphy are
> expected to have the same setting.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
