Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705739;
	b=mHQHDw3lfzI63aUKyX8KuwD0o2QrHhVdk4JyuMdYIqSdYZUVyOoy1ioMjQVLeTzniShd
	 RABT2swm7Kb7i0EJTvXiZSr5Rfigk6GAcWYGpSroPE1w1WAvMoGBilXAbyzjNOyiwWGLp
	 4Wslr45jmEdNMnlbg1qeyHkP5x84VLG79dCCZfxigZ89o4cXNhfcFd+DVVhQUeufniWX1
	 sNniK+9vVtZ3g72TUboXpKmoWBs745fz9f+cAn2KXXuicmdolnsp0sVjKel1ngxGRC/PZ
	 GjSPnymWuREpZAN+D3hWW7697sJZY3oCz9m5aqEgBXuWwkwe8IhWVAqN+5KH7PrMjSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
	b=VK9TL2VIcbB2ssWcTmbf1uig7vsDLn/i/CDvQ6U3dk8EIlCB9alF3sqm8xUs1TF3RO+B
	 4C7Nb1Dh8j2xZXvkTUO2a8ecFaPQa3axFOhYl0RNaUz5EJ81rRUGXyscnAd/foCl8qXtg
	 OF3Qyygkr2k2mttNSCYxPChIjOUe6jDKIi3KJeGMv4FVTk53snXIwhXUlF+w/rMRvzlfD
	 1qrzD/OGBMOL5GKd2Ilubgb5F5tK5+9ywjGmckExpyZNhhCqQXm0rjMjWo60UMJu1y9i4
	 RYCeVZdhi8uELsKXtOE3uiU6i7gsuNQRS4e6wvOABI/WHWby2PRLAYtWScYaqeFZfvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKc8s69D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSb1gsKM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11898606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11898606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKc8s69D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSb1gsKM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAS7t1594055
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=; b=aKc8s69DSW5Ycs5j
	jJHnaaQA1Qm/BO2HMQYM3VS1zS8PUbT0qlYLBaeucsZiCvGRqHwzTzR1CyNKDltY
	5Px0zMSxKzmT86JCJe5e9vte6ketF6TkfuHzwjY+n8ELYKE3hgIQ5/kQq4u/jvaC
	F4c5g48M+PVW7YF+9j1O5MGFH1SaC1Oyh/zt9F0i4URDmPD+sw3qWjjFh8MGp2Zu
	Csz4URuqDwbTmDyu2Bf6frVEiVhdq0EYxHwcZbe6RdvB4qUHyrXRMX12cE73yBvQ
	WofBam+1jS3XpiHaeSJao+Z9G8tDPjUJAxeOSKKNvzKtNJStvwIW/P+/l5H0igAo
	k18SZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081ugbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:35:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so62984355ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705737; x=1794310537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
        b=TSb1gsKMn5AElqC6j7qZNL7HmDnLzXTh6SX9nG+dHPuccp1mFP7tAjCIPvCvEBMTGM
         7BnBkgk9sJ59d8oeKKP3YdiYBd9OUDUeWMkUPyCWyb2CwCweQVLou9CODzb50t8UJJAx
         +iTdV5xYYtmRCu4Osc/hGtNqjbWZEnvm019W0Xt5qx+1GNdkV5Jo6H2czh2Bt0fmahQq
         EufO1LKQQwIU/KWO+w/lkTIQa5YgKFSw+G161rtcjCbPeEGXmbwY+6xPrl9QseiT8Tvk
         AI7Ufricn4l3kMgcKdC4AsLAGJIu03yjBAj8OUOFkuTznowGQ+bDmnfk7OXl75yVENQk
         zbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705737; x=1794310537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
        b=dG0vuE5NS0wPOWWBdKc6WjG1P0z+Ig69TzrMtpkA1AgRcSBBOPgeaEEWH4Ca9/Ovrs
         EdXvBCbgzdhOskFqSS4DqyeeovtzduGAXE6cBzaRxbQhuvR8ykOhvt3bCK29dqZ7OfRW
         FHWLH5ZH5vrysKGmesHgos3PnKENbvkj4OGzpjvEVxqBQGNikOS+eme9r0aWa5WJTKRc
         s56w+rFcI4tipVEO0dyJXUoaJsGAkLHE5mKWxx31uiyVN369gMgBx6/fyf9PMJcMpOEM
         AnMR0Kok7zuv4BfzbrC8me6AC9QAhzrNyFCYjwPoilR+jrPTyA93AJ2O41jN1u8OABLa
         t8Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzUZ7ZDrUPvGFCGUuSgBCZy+G1OyywThoIglGYZ7dsFlc7s74V1XqbWUHRJRMWcLvxobU4vTsHczM2OYic=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Js9+3X2uHN9spyrXEDS8MG1RyPFPw8Zru9ynRQ9qP4ohwlgBM
	Y6JHrFjiARvtyc5WeJfyM5TO4kxptcCG0VJIGxDS6fQNz61TwW3+09oEt1IKlrrcykqWbbHtpjN
	GyvpkneXBZKk4M9EKrgr3H9c0q1jYzA/oJ6gsYhEJ3LwMPOAoBkbSwHe+E8VTRfgWsis=
X-Gm-Gg: AYBFou32q+N12cQB5XQqVtgr0pe/a3LxbSxpItIqRqTjyND4+ZYA48bf3yrTIkjLOy2
	Zqwl1lI1PoWtIH72Dgvv/b4Cw1Q7Nzt65nz+on0ZK3BsCtvyVfXVAv15sj9P13NUOKJoMCxNRjI
	bhGL15t2D0qsW530RNORdfGDgdvK5Rj/qGZuj0Xz34kMobwn30dk664MLppBy75k2WWIqEelwvE
	iAmV2rdV8YKFEOeWlanP9Rqr1bE529f3C4kLDhTJ26Pd5d5MYxFbg1aBvBsGu+BkjMB2CvCNLj5
	RpZrDcFnEEYZHr57Q24HCHonVAAodfzZKF69uOEw7HUmnfGwzuGETj7vbJ2/C5bpSOEs1ClYRl5
	NU7fjYr+ykIGwdfVEsQlW6S2CApvzaL8nmKHBuBI6gaHu36DCeu1l1IlU+WQt1c8Ci1Fz/7ihtU
	pYa6sW2g==
X-Received: by 2002:a17:902:f645:b0:2e9:734c:501d with SMTP id d9443c01a7336-2eb3649bc22mr127001805ad.16.1793705737407;
        Tue, 03 Nov 2026 03:35:37 -0800 (PST)
X-Received: by 2002:a17:902:f645:b0:2e9:734c:501d with SMTP id d9443c01a7336-2eb3649bc22mr127001495ad.16.1793705736865;
        Tue, 03 Nov 2026 03:35:36 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052effsm39802075ad.3.2026.11.03.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:35:35 -0800 (PST)
Message-ID: <0b80b85a-5a56-475d-9dde-0d554f8ec8aa@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:05:31 +0530
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
Subject: Re: [PATCH v4 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX7uageh/Kvueq
 ZdpFnaa0lBvhaWf5aT+PaXB+H8428GSV283rBRbWHpqaA0Hp3Banhb5EzRf2l8xo6UQPRl2PDRu
 ukGopieKdz17fmwWRhPEJttiqnPVyq4=
X-Proofpoint-ORIG-GUID: qNb9Jq1aWOxjJexPifrDUJ84yeqvpZsH
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9c70a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kinZEuG-tb8UP0AvViIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qNb9Jq1aWOxjJexPifrDUJ84yeqvpZsH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX7VhMYvveBEOA
 WBGBQ/duAAB5ShX5GCjU9pWf1HKWrczezJcW6aBOngbk1CZLz2Weq9K8uYxnN1sChhqxCqrmgY9
 Zt9hc51TRwpnQBCb/xfVZBIlTtL+so65flJXb8/SXgFqwryrfB6B/zhIiwOPkZpkCnti19QNFUs
 /vEgz7G3I80FhlgFq9hlRG3xr1yjKtxgDotj6A8ZxkdDw9VRatWsqQRWE0plTTPKAwf9nzsB5Y4
 l/wibgm851Lfb3VubNnPHG2cuTtSYGNAIrWWg8eEL00fzSMQWnSOiKcbfwq7I1dNqVme6sPy9C2
 eFpZ+ooSh7CyKPJpbAYezRjKtHW2f8+d1wv35m7RSROqIp8n8LIoilpgWNm7PtTd0VqoJuazFby
 eYmToJZM8a4zvhb7RuyvUonfSaaBw3RbxqUwkuTiqlZS3UQCVBT4CUb19I06x6JPppInUFhTg/c
 fzQoV1AA51e3+8E/5kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in FIFO mode can fail with -EPROTO, -ETIMEDOUT or
> -EAGAIN when a target holds SDA low, leaving the bus stuck and
> preventing subsequent transactions.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> hardware opcodes to restore the bus to an idle state. Check the SDA
> line state through SE_GENI_IOS.RX_DATA_IN and skip recovery when the
> bus is already free. Trigger recovery automatically from
> geni_i2c_xfer() on -EPROTO, -ETIMEDOUT and -EAGAIN (arbitration-lost)
> errors, and register the recovery callback through i2c_bus_recovery_info
> to allow recovery via i2c_recover_bus().
> 
> Use the adapter timeout for recovery commands. Configure the serial clock
> and bus timing after runtime resume so direct calls to i2c_recover_bus()
> do not depend on an earlier transfer having configured them.
> 
> This adds bus recovery support for FIFO mode only.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
