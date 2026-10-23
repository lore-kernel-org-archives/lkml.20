Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742767;
	b=b46/BGg2x91Sy4TmUO10I9KK5+4KwWZ43+2ffkYAbQJTokPzbxSe7jJyQ787wEdf6bXL
	 zIaM7rLhn4MOhRaKGuhlOn+vTk58j9ZbTok4/NYBvZTGKw6brtnNiJdWBvLIDSRvJVebO
	 VPUUz00PF/xISsMDkjQmSqXhN7DvdQBvkzUPCgMUZ3mkbg2bPO98KV4oZzIiRPF+6GQQr
	 nTj9mLTqT771jMEM3z1vc38h/yPx6K0/+s4qfRaO+xODo2p8X0vIqd6hol3izKfkI7+Q3
	 qjfkAR4brjKzwkeVaaGrqz951NTTv2N+etekwmcY6wI6aN+cGm6RItVjLLQoVo77XFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
	b=eN3cJaJe0abJ34AC35qjPOad7tbq+90Lw/XmRVyMgJZdBZQ5bwUX77QZoSlrRS6ZKRyD
	 UdByg+X2rucDiIQrundkKlSnVacBvcpFAad0gTlQzWuOEMocv5hk8qoyZ7/IgESgLehgP
	 OJgP+/iT+MFuhjkvgiO2nax9Yjip1s4uOT+5eIiuHX9sKDyhuBA/ht6qJQMwYbQjgPZBc
	 iGJ15w7yNk9eYNs7lLZzsO0cPfVKFe9MSB2ZN9oNELbDIF6IN7i0YEfYXjvioRMhHMPiP
	 1TYC3ruPyP9hhq5ruuvWxM4GWDFGxUYryv0PNAXh43KGLABddmaG6GoA3Rgs4qIzaFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kG4s0kT2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuOSA4c7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDB6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kG4s0kT2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuOSA4c7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F7Il3153979
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=; b=kG4s0kT21uYk+jbh
	LbLcYMsll56FYoJQubZo/rQGOLrE0wF/AQXBWTQkW6AdTUcdAF/brlzuqJ2XpfSq
	J+D62aeNuNhkSWH5/iKjWcFRuTet9tibPVDZ2JYrJjCinplz1eKGzbMbrdyM5iY/
	7v0ord5ZH6FjxN+bdcylNfBatEDB8ne/GzCQaRe4mPW9jTGnKOe3ND4N3iFmN3rw
	RGzsM36qpKChaDjdhZyFfv+Oe1Vue+/1SXYOSgIiQ0m0Ok6XfW5uzRmRmQfTQy+V
	ZuI/cPo9MQZhRV3edOrsdDcnFE9YPVcMFuU9u0R8QBZR4VbuU4Cj+5gugdKSUTwm
	/5PFmg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmramcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:06:06 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990758837bdso30715241.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742766; x=1793347566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
        b=BuOSA4c7F/KuGEmIim580zg43T6XE3SSKdjayJkqgiCBL5+YRUx/prMD3cfgt7euDs
         Mlb35CcbjLDF0unNIGNndrKgvo5Hhekoobf4JvCND4yUk4OS4v11lWEZGYpjMKsiUmTZ
         Qj/y8W1Awf/GY+1/hccPLOSbwSg1CZmfweIHQWtJBAUSf5/vjFpxAyHqEGGPN+WpEueg
         CJC0ZV0Fs/UcOAWvTA3Q9xL5Th2AYafAlXU7oJYsmLJl+uDy4M4ZQs/+Xlkz5BcWegE8
         cEmUws6d30/q9l7jIgyHHAaXlWRGrolzQPWfHfs48arOMtO5ydoHaND3shOuVnpHls2Z
         yvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742766; x=1793347566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
        b=d6YTU45p2E9BjjZUXoKDzHdJ+/rlLjcdliPGK9K1H7zQtUQNJkP/kV6PLhGty0bT1d
         uaNrPH5m7o6aXEiRxnrGhwLswvHoTjqhMBHusSY8caqf0es8GIHAPGayBV9mnYULArAu
         rXt/EbiibENQyREveTqXk4Ioge2DkTsx638ITboxbGEc+ej2mAIJDHscGtCxA/KWG4qA
         9viIKvDX3hAjGZi43ltGXMNnRLJqbdnHVUeNf7af9uIDfNqHrXih230oD9aB6dtTHfN6
         pIANDiyt8YZYlZsZ08wxEpxrTKQ2fhLpzSZlwH+oTi30IdIZqKy0Da9pn6PGgmAYHab4
         vjdg==
X-Forwarded-Encrypted: i=1; AKwUvBz+/ICw1lYF4gHsjDvni39YFsZ6NO4QGiEdzp2JRzvb2CssHB0uhSbO5DMilU9WBEGFzmHCEYo6nLqhGII=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlkdRTl11BSfTspUxM7JJkD1HahouXWOrhrk6z3TXRKu6ZoeMG
	90zc4pp6aM5EXK52Mb+cA7/GWCB5s+BHlCetS7KfmT8SBFn657cogc8qqBEmVPVCaNQrjc5TpyF
	A6tMM/nZJDm1cqnLOziw5l5bFyfLBKG+PMnVhuAeX5TogGkH1XKtoUcKzSzUBMIHVOCU=
X-Gm-Gg: AYBFou200W1GoN6CJliEdx3GNnEuplDxmRj1OH/aklHKa/T7lmhCaCPN4nEGd5IG6fj
	31nzKTiP8T1IwdFgBw+eT3bFOy5XEKz+Z6Y4S5RgKxE1llNtjWJs9kmMX6V84T0/2h6XlG1egu7
	sR+2g+hOudMY92YC/7EMwa7JU8jkIG9MBxyv46zepYStsn6StC18ScNizOYauHAxOp6Ocdyq8Hu
	lUWq94q7TAaG+KGtJi4e6qJRY/nVpefSI9/8t0YZN2v7I56D7vUEzeFkdwPX6DnDrAmvWdGfMoh
	V3CWV5K+9hYqyJamBvrJCS0h87a3mtq6wO/lIVJr2JbTHrqy3oqHCvLpHKUybSUCRaB5AEpRFIT
	tVoFt1+0aJW5m7MaO435AyA==
X-Received: by 2002:a05:6102:a189:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ccc32bcf6fmr479110137.2.1792742765899;
        Fri, 23 Oct 2026 01:06:05 -0700 (PDT)
X-Received: by 2002:a05:6102:a189:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ccc32bcf6fmr479044137.2.1792742760678;
        Fri, 23 Oct 2026 01:06:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfba36sm74805266b.79.2026.10.23.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:05:59 -0700 (PDT)
Message-ID: <fea00cb9-3ade-44ca-8eff-e2a387074b4a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:05:57 +0200
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
Subject: Re: [PATCH] remoteproc: qcom: pas: Release DTB firmware after load
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ED_cnqPw0yDNr5JnlAaiDYT8XM9v0dgk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX36Gzoz5JIomA
 CbEYyHzM7mMHlZuTrg+A6g2t1r+zMXxYbeMSzSwsjxHHYeJXe8oef3wPO9NoLVVEVuR1+UYFW19
 cYyX0YYuJNon9aW8hUDGlGgP32pynAw=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb156e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OpgpJtwNEdfdaaOfhYsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXw2cO5LhCTcFw
 gvp88MkJ+Os8cU6wsbFH4M9hIIWWHJdvF4uqETEG8AdVrL6S3jRnrg6ingAscvd6k9yRDDmFKDb
 arppF3nJ8fkUGTXgCCDuCCbrhdSWSaeAvtfYYa1rSW2pcd6ikS3uL4y9FDXkarCxfDA8k/NVg+T
 BYPfYCBZkPSd0ukyrjBJ5jj13hPX50HDfUPZ4vh13XCJaBURvG4NmJzknAfK/iCD8WnvnmhUEkG
 LPnK1aBNJfWYdYGsI2R41owX14j+v9LNW6MzaP6QUetjG7nKN06EelQEAsfLTu7yYD1MCNTPOS6
 ChusW0GkeZ66NaEdRJiys2XOKfNGPtepHqVrgV66dcIgVXwy3ZGJjpxtkvO0PQgfxH8BppKln2/
 bjcNH3LsKRC2HwaKQYyLyDvzHcw5xVLEPwrMZ0PfdfOjbim4bJlaCnTN15N8nkpAvcZHk7jLmY8
 oqms4TEa6HQRbPjVO3A==
X-Proofpoint-ORIG-GUID: ED_cnqPw0yDNr5JnlAaiDYT8XM9v0dgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

On 10/22/26 4:54 PM, Anup Vishwakarma wrote:
> qcom_pas_load() releases the DTB firmware only when
> qcom_mdt_pas_load() fails. On success the firmware is never released,
> so the DTB image stays allocated, and each later load leaks another
> struct firmware and an extra reference to the shared firmware buffer.
> 
> The firmware is not needed once qcom_mdt_pas_load() returns, since the
> metadata and segments have already been copied. Release it right after
> the call, on both paths, and clear the pointer.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

nice!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
