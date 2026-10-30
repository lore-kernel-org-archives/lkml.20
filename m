Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345693;
	b=WYwoWM4hV9ZC9T+xVGuBzDJGc1e09nMw3cb08MjmP16uTdJJk4fW39LFhpNHDdhfDL02
	 N6pQj2bPR36N+U/Yy7bUkCvj5STGid10ALB49bXOlo0MpxzInXhAMd3Z7W20pv/JRBAPS
	 DP+EoiQvsdKf1YZAu9nZthgMYpNXYY3mBPKa4jzDAat2lE51zsxxW2oQINblrL+X4LN3T
	 Z8KyMTvSq257xwW/XF/WFg7fhtuL2TqMLyyv6g+fGnLghcpYUbJdryffLDNBE4sP90LMi
	 HpntWdESzMTGzbmnaYUa0oGFSIs9UnJioxuwYiiIgi/XD0Jxr/u6EmNVegYWlB8ES6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345693;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=;
	b=a+7TxsbMtk0+c/Vbfl6sHkmbF30+OMzsScf2nBOmzzWVVpkhniYlQMFwbEMlrjCEAv7/
	 Nu8v6TrEPlkjPN26dd8yj6CN3ioZyahxWNLpFZupS4CyHUS+Ku04IzWbdimWyOIop/hJh
	 FigjlzNmskUKRcuK+Z5SgiX4QSap2/hB/TrWBQQoQh/Vj5d2XKKWFW2TOvBAxU7NvYXnW
	 eXy5/kBPUDKXVLghFR4Ykuq+aM6vIWKSvWAuVQAKviwrKSod/WdC3wtF4Dzl8A+ybJyXx
	 iiXAPchDNGSBU2cjWp26Lh3Q/ROWMgw11SoQgL/AmI00JJJxLzr3y3cFjn4ImYTqD4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMTeE8OH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VaiQx0HN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDB4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDB4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMTeE8OH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VaiQx0HN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0fF1266510
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=; b=IMTeE8OHKfv3216t
	6fKdjiaBuH885AeBMd1k244iLgxqtwc9gN7GWtOAx2Fl5Gj1YZvJ30x8lSJkFFRj
	DbhCqvljbCaZ8J0eVvnIMOhpNTYijxigHRsfAndbHd20Tdi6/WorqdfopHH7k4ps
	22Wd353VXT3f0366wkhpUJg4hK2BWsxc4/56cfmMYb3drrNOc/Rr5grU3V9lM52M
	5dUtcah4ag/7uWcfRYWtwyOs3rSxXQzmW/yRIPhQfEhvFly/vYbQK+chS/s5eY7z
	5Xk6HLOj9bJP30+h9vBzbIDf2h6jqKB3MZ+rk/Ny6Jqskrh0bEsnR350bNDavmje
	DvEqag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p1ujj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:34:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so64813385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793345690; x=1793950490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=;
        b=VaiQx0HNF23nN3L3absG844/xVougskYfmh2h8Mx8B4fHKWzhCs5x/mCjnjp9Ci9D5
         PjKleou+NRJcu+i2jiz92XsRQBgsPPIIPj/DmrQdNzajzn76PNdA6FuNoZuQwrX8hMgp
         7RouBWJllyDy6ir8fZWo3i3EJdOorqbsMt/6qwJyS5bx7QNxym+m1Ix1xZAO0a8pNORo
         LVS+IJeESS8DcTMP58/VHy1pneEfYpqD8QDlkRixT05VOtkDoyRpNB6rj0vqz/9qK5Xq
         8HeYNKpy41Qrvhnkx2jpee1vDygWay4gp+ovKF2JVP89xQ743XwyS98oL+8WxUILL1GM
         xSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345690; x=1793950490;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ufjNbysHjlfzLzm7FGJ+bKwvQEv7gJQ501Y0aDOU4V0=;
        b=JYv9x/PSSyMWNs1V8qC6pNDkAw/tviqy8MFJKZiQmdgUYyDAo//jxx8kzGCsZwAFxd
         59Dccfu7nseBX++jO71NOIl55PqVWOV9myOaiVF4ofevOpAiqZrKKsTypZrzQU8tSPTJ
         us3pOcUQWs3Id6WJBlJ+igXCsEQnA8p+/BldWcaGACir7A4tLNZn7ur+dpriMWlMx/Hn
         FWUVF4tTrD8MFlEfXtJXqKJQwyZUgaW/fnO++4zRZImBTgYRYhmABHTH9ijqx3gYIXU6
         FRd7Bq4Z8/lnty5p1R/fEtKXGuIsAuFHIFdxFrZMUI2mUeHpHnzsFdZgEmHtmEXkmdpL
         hQUA==
X-Forwarded-Encrypted: i=1; AKwUvBx78pKJ7NUNBywm7OoSeJu/FuMuT0BoS+A0HUQ/DnFc0Cc0kiM6Zy2T5AZgXOQSTyVNOUAEikNZ9U4Ubkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIADTdcCMDj/wam1S01DyZ6N6cZDVRjAPACLdM+0M7wuxFtkm74
	R8ecGK+bgc1SZ5j5eGFbdcw2utqc11IYdBITH3SpG3bpdIPDCenuhHV62ke9NvudyLLk0jCoByy
	0zDDpIdnf2NsrcwEVwQqltbh4H3LMZoUTm19rClhqP/iS3w0jIvun4vjd1npoX7ZiLdU=
X-Gm-Gg: AYBFou0gsJZeSHnBQMic62UjZakfcizzjZRa1wq5YV1jsvpa5AgYjT1fue7h2Z8M0JS
	KUlVoG5UVXfZK4YBeWqPZriAvqM7Y5Fsj2472R96so8N5RpUCsG187fXXAlON6NNiboMS1Uizrc
	eOR2xwXHTGTtwgkzwKA899j4+f8SytSI47iXFXuKIip9QgihPmF1s13aldSxYA9dc+dA6UiQtQI
	0NbGAXQrJnoo5LGvo20p/3cYw2/aYuUzaE70REWGkffIixY2vk2wNSNMvnCc3+W2zE4q9zjiysl
	XUtRxn+OGeuq8Yz0z3j7RVzte6ZgXV3+f6ckM9pcKg7OJXG8tk4JUXd/EqeXGsChtgWFnHLLphL
	bBSHRd29MsX7sY1YVByL9YBh84Ixt7geBCQt8kDiWJs8EVQHiK4QjmnRW7h43WCQfrkwBDp9cOr
	8=
X-Received: by 2002:a05:620a:1d06:b0:93c:7f48:8f46 with SMTP id af79cd13be357-944214d0ce5mr244551785a.4.1793345690347;
        Fri, 30 Oct 2026 00:34:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1d06:b0:93c:7f48:8f46 with SMTP id af79cd13be357-944214d0ce5mr244549885a.4.1793345689914;
        Fri, 30 Oct 2026 00:34:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm132997395e9.11.2026.10.30.00.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:34:48 -0700 (PDT)
Message-ID: <54eec1ce-5c47-42a7-a793-8c9f4619203f@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:34:47 +0100
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
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMCBTYWx0ZWRfX4pY7adFTHSI+
 a4WV/OU1KM4DdHJ0/72LPjs13s1auQibsgk52W/hwuiwn8LOpn2ZO/9gIM0szTkMyYXav+1rfkO
 KYBWKgBY5zpMqHAoOjRad8ZaU7rs5BVeOS2OTiVAlutB75sab/sSU2y4WNB+pYkfV9lrQ/er/XS
 dMnjGZwtf4KPKDXgeQdhnAlHUtTHmdHbHPoLbILiP16gZ4FV3smOg1Duo7zEl1LSF8PBhqp+3+8
 QAjRGs26iW7Ogz0adDXuDcnpJ58iyCMv5GBYlhRUFMhgvk3a8tYSG7zyQBEiJkMmIj+MNaC7Hv5
 dNef2dQh8i9qrKloJypLc3zveRF2PwRmDL0pMYjwmkKFICk0iTkjhntHSWE67LYkzRzpQCV2xMT
 BvRS2YC+JULwhRo5aIOHv1oSe9+B9aE+SmizLpG2LVLVsJf3lSI/g213PyFRr+z+crV57vqttI3
 jraLyFqr6hGw3segEiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMCBTYWx0ZWRfX/GpVBLr3Ko7b
 DDrzq98LXw6tqUFCaYa0DX55oCP9hqL9YSHaHzsv5AcJxdZoMC7sqeTxN0209JEfQFNhMvjWg7r
 x/2CjHU6iiBmOMT6GMRsvQWDZbfxQJk=
X-Proofpoint-ORIG-GUID: EEFsxNeb_u8WWYE53bB-U0PhAlblKmbj
X-Proofpoint-GUID: EEFsxNeb_u8WWYE53bB-U0PhAlblKmbj
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4489a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Yg9iZ93C6t-IJzi4hqEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300030

On 30/10/2026 08:19, Krzysztof Kozlowski wrote:
> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
> Dropping them allows to remove bunch of other code referenced purely by
> these ararys.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Fix commit author.
> 2. Drop more stuff (LKP, Jeff).
> ---

-ENOCOFFEE, Subject misses v2.

Best regards,
Krzysztof
