Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BEA3AE1A2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765838; cv=none; b=I8IxL2DwSUGiCGxZQROu13mh4PBbCy4SBxVN2Y+quPPdZik660hj+I+quZEuKWK/HgSfJHT9B9Mazf/hDGYoYnfktfUbcyEoy4ZLIjoUMkaJH+WM/BaYPQnFJ1uRZryg0j2H40kjK4RDFnDKDu4K8wTqQS8Nw6CbHevU2Ek1ciY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765838; c=relaxed/simple;
	bh=KxMqKpP4pT773qfgW11vDRiBR41pjOdpqBHigF4X5oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGjyPdaWmkBAkuqsuhgqw1uuIwoDEKPjApCrzsriz6o9yNxS2ZfzYFHKuqugRW+iHS3aThZfU/eEKHwSWxZvUjsfodiNtbFnGFNWAMArX6UoRN7utjuKAbusbgD+AdPHEpD48bTrZJXJ65OJYXxa7X788uGH2z+EjKYR/N715iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkCZwzII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvuWTSSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkCZwzII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvuWTSSa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777JMo4161125
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VMX/yV6LzUMzO3mW4OB10xo2hXImRBI/wgtKMD2Jbk=; b=EkCZwzIIA5UgcDks
	V9fU8GiRgieVDTZaVUJeMU++AKNDCzUuBz0Gj1ii1/hCgAQQ61MrZwZ/CzyiCRcg
	5c03+INUELu7Qs1lfiVhZefYouaFVlJoFGCkaD8PBoWUHI0zP/z/DjvBJrWenUbM
	UA1ut2aeTHp1c2yefrK6osO40nz17wBwe9qsGDuqtel/ByE3VRUxQQc2jE52ahZy
	bAdG79TUTsqDSu88f5yO6PDcmNn31RJ/FPOjghbKcySZWPkvVYGzvbeAf2IVCscN
	U1vjUOZoz/lwHZxO2F4i5UxPN6mR8ooqTj0H2Ug5J/izlP9533eC2U65lo5Aq2/O
	LdAdOw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhd3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:23:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2383621a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765774; x=1789370574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VMX/yV6LzUMzO3mW4OB10xo2hXImRBI/wgtKMD2Jbk=;
        b=LvuWTSSangnkCnjs7RV/KNmZ5gKD9HfNRcYlzlvwUyHrHAqZ4J0SuYWQWwqQFegwJV
         VnBmdySuwl0Sp19v/Ea0VhpF5cPLUZbFdVXqF3ibPM58js7R2TuAMqTkrUnjxpAsirFl
         XOItU5FUeep5csZSikRaISrbYacYsf9YKaxtcoEMQUWLSLOLUEYrmpCdP3bE1UO0KN7B
         9zUN2hX+lT8kV5T5wat1/LEV+NmhHKs+3/zoPIJuSWjgxfx1P7lP7iSzgFgBHnReokt/
         pkV5xhu/jK2skCo9imeahnqAn2Fiql+xzNKczrbfC31cIw4IzQ/Uvn/aAr2H/tFPUSHM
         1dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765774; x=1789370574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VMX/yV6LzUMzO3mW4OB10xo2hXImRBI/wgtKMD2Jbk=;
        b=Sccp9BjEzdFVs2gxTWE87Hgq/Hpq4QDmtZZmWH26G3Ei6lwBgdTGB70wJDNbIULHwA
         nD/gFBL96FwZDiKtck0LFsnq7VMJ5uj1E2RzxKXeKE4xB6fAooB/D1lRXVSAVYhNi5Fz
         Ef19tUr4UylaFInROspRiVPugIfsgV1KYveydpjkrDes64kVV4yW61ThdxNWLBLPFx/c
         BhE2Ls4YMcIIzAV7VE//CS1wuaQVkyE+fj0+qdvifIDl8lX7OTBtDNjSUy4HCHXTljjH
         axZCyD/xkJahstpQyrYdZwIS/7Q29FY0q7X5FQ06auWRYmW0PHR69SArCfbEna0xiVfi
         Y64g==
X-Forwarded-Encrypted: i=1; AKwUvByFj8oqUqIa0e3+DfdPnNFot1WCWrqt415TR+BG22gD7LYzpK2Dcdy9IWMk3DXVIDBtyeg3naXgUYqlE+M=@vger.kernel.org
X-Gm-Message-State: AFuF++kGH6bzxAPeJo3sXCUuRGbIGMh8MF2QuFQ+1g0BQ39R/cJxE8Ot
	4XHIFxLPlb+mxb0dzw8ignJdgSX4Jhwfi6pGel0RuiL8NAODn8zjpdzwB0YDg4MYynJJH9fj3lM
	oIL5JZS69mcRq9aKR8/LI3MPmkQzUieND0ZPXZlFIWCx5iFrgwXn3b8TEYvXXZxXAEBEC4o95cW
	Q=
X-Gm-Gg: AYBFou0nCyda1OF8WVpcRQ2nj+/wYQAlZglzvSBzKIZ15j/1+fWElo40BH28Gu6yDD6
	BLFV8tGoylmbMg8er8IR72NiB8JJc8R8DaZmTdNoYywb6Q4RvaQttI6JGELoILJRsIzC4mkqQ/h
	SCCtz6/6rYRDFiQQL3OnF4kxrQyyGtTfNjTcobUTP4jarwwub86tSNJbjkCMDzckWf3RTJDqUTR
	UWir8HzP0Oz+B/iXG1pKAztRkjXPOJTFQ9mEdVteUr/DNuWUqait7MSskXWY1GA2jNEVAmxmSW6
	v7MNwSoeHcupsYA3bLUNZPn7v8NtRG3G1lInlImf6aZYgEr96MaO1nf5ElbGiR2psw/2aOpQ7Y8
	8j/HXWepKzhdVNSbL25k0zYppAZ7vJMgqhQ==
X-Received: by 2002:a17:903:1b0b:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2db12620112mr364269545ad.15.1788765774196;
        Mon, 07 Sep 2026 00:22:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b0b:b0:2d9:3083:a3ac with SMTP id d9443c01a7336-2db12620112mr364268745ad.15.1788765773598;
        Mon, 07 Sep 2026 00:22:53 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3385c056e13sm1775705eec.29.2026.09.07.00.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:22:53 -0700 (PDT)
Message-ID: <69e25f54-80a9-4f17-8453-c74b2e346585@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:52:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
 <20260827-master-v8-1-596bc81c5cf9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-master-v8-1-596bc81c5cf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfXx1h8HSF0/kLh
 YuPNqBSMTi0P6cI6U7OHlAk9GJhOGHrVqN26iqpCG5c6GnJhEzbqoL9beTRkH5RcWc1F9RSMc13
 a9QREeQyZnqgbLhB18egX+mXCx0ra9A=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e668b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HGiDy2AwKuRvI8HKZgoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 43gzV5G_inBJ4kvg_S0stpkjB9SzrkQ5
X-Proofpoint-ORIG-GUID: 43gzV5G_inBJ4kvg_S0stpkjB9SzrkQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfXymtdMZFQlrGI
 tmbaTenDviJvlhGg/T0FluV6/skPN4u1jHSdzaDwOecUOfzvACF1Lu5FCq0omKf3Tl8z8s866cy
 AsA0qXzXNUUrcLGSjjWDeGAmNvXW8flHP/0F5XmPHIB8uxtBi5fdbOSo/5r7Hx869KvZldkmlAH
 i8Bt+u83BGgWUYPo1w6c6atyobT7GvLn2idebZPzmDb8aTaUFfQurKI+tZd28jRB00B+3BWJHdX
 qewo5srT5EqCp2H3pj8ESXxdHUvSYWj556YbqjrnpfhOnKUj9WR3V1UuMEi0pdZTSZU8QzsoQEy
 k4gXRDCdd1hNv8BK8y0QWR162vWutlB2rtDbmlSoXUYYrtyDQG87hQRcj5FEdSHyHpmp5LPoMAY
 J0Io5H7yk3nIExvxpwrUYBlUpDPCeAatAxHg4TB2Tv7onMxLF3ARvQvpaDGDnRkkDixjm2BK/OM
 8P4O0RphbwLABOcUf7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070078



On 8/27/2026 5:57 PM, Aniket Randive wrote:
> The transfer timeout for an I2C controller should reflect the actual
> message length and bus frequency rather than a static 1-second value.
> A static timeout causes unnecessary delays on error paths for short
> messages, and may be insufficient for very long transfers.
> 
> Add i2c_update_timeout() to i2c-core which computes a transfer-specific
> timeout and stores it directly in the standard adap->timeout field.  The
> formula accounts for 9 bits per byte (8 data + 1 ACK) at the configured
> bus frequency.  The caller supplies a safety multiplier and a minimum
> floor so that each driver retains full control over its timing policy
> without those values becoming public API.
> 
> Storing the result in adap->timeout makes it visible to all consumers of
> that field, including the arbitration-loss retry loop in __i2c_transfer().
> 
> The function is gated by CONFIG_I2C_DYNAMIC_TIMEOUT.  When the config is
> disabled, i2c_update_timeout() compiles to a no-op inline stub so drivers
> that call it build cleanly and the existing static 1-second default is
> preserved unchanged.
> 
> A timeout explicitly configured by userspace via the I2C_TIMEOUT ioctl is
> stored in a new adap->user_timeout field and always takes precedence over
> the kernel-computed value.  When userspace has not configured a timeout,
> the computed value is used.  The ioctl keeps writing adap->timeout as well,
> so adapters that never call i2c_update_timeout() continue to honour it
> exactly as before.
> 
> As i2c_update_timeout() is an exported helper, guard against a zero bus
> frequency from a misbehaving caller with WARN_ON_ONCE() and return early,
> leaving the existing timeout untouched as a safe fallback rather than
> dividing by zero.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
