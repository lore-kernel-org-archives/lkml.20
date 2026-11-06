Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968155;
	b=wEnN0bxdmH3qKEog6f+B8XO2hDZsESkbZ9PswDPSnePjYHjxQ05bYlrcp61jZ2XbPo58
	 3lyaFoh5k3qv4Hs414sxbF3f/CrGuaNvAczGpbmwG6BZk5bL8rKy8WwzWJamUGwaiSHNe
	 jZlLTRM5+oR/MLypMEkmSsxctTp99yeHCUYbUXaImjT4v09iKvgtd5XyLovHtXzgMXlM9
	 synKA/oC603hCg/lcUxlUZxAsbjZFLseV1hFnMwZdBCNcpoShBvUk9kBRlc3O1TAfwy/b
	 SiXvRl6oP6RnGoueHO89Z3UiNSFd3/O67lyenmh9b1ZOEB+BOoDldBR98tyzHDM8EGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
	b=GSKnfJDh5X04Iik5gYtMiLSpi6Kh7KOPkGkVGpBVIFoTKGU1ScE8bgfxj1vnLdJxFlMA
	 iY7OZnLk32j0sn6UGnpz4O4FfoCR76sIzn5mJSbmjBIXsYBfOpcMVyUK70dK/iph641kR
	 hQEHvgkrCWngSfEwH0Z+U3wY0gYghB/goZMS0Ium9e3sBA/blV7GYncQAhpjxj1BY6jQ6
	 9iwh0J26Y7sZtJT/a7WIKMZQzkQRGS1dKpwt1FMMOvYuyXrVqj4uiEY/pWjBAyy7yBGps
	 +B9vScLCeqeNofDHQ5LruOu9Jx/iy5x9WKVihxGJ6MBOa0GRjon+06nMuFmalY2JEJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9R4ngRU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+OFH6MU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40672606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40672606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9R4ngRU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+OFH6MU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJD62593305
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 12:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=; b=H9R4ngRUG/g+2djk
	gHAA5lg8qaVWW9tyBja1g1wFNgobzGjZCWVMAjcUhV4/x3e/qMWqHlhzk392Wx4R
	vVMNwLNbtJ+OvaSEAn/0ScW2psBHKujdJ976kCrVBtu14Bvgd/Xqow6hVBqVR7cg
	j7VsiOpSxkvJd2VuG2tzjm2yUII/C8r14LfzPeUwN2ijEJjcOlViJ4gGFL2erE4B
	+LpvDmTZx+UxPk+Orz6bKwYGAz+cxA4xI8jBnBCFA4Sn357bkYuQFZ8cIoVDHtZ5
	g4wFLd60ixA8Zza1fx75T4tXsaEeMYG7ATj5/VViT9bWg43JJH4zjKoMVJn6819d
	aY2Cgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paaqfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so13596185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968152; x=1794572952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
        b=Z+OFH6MU2mP2J0OGm2Bti45V+InAg2JWcq1zp9FBGcKlvm4Mh4KMRWqyFRobAq9EGn
         CkN949zvakCoBTx0LKdPQIsNFOhG5kjgK6xcUDrbm+aQaYMb20Dhe7KU5KloTu9IJ9PZ
         /ojUfZEorNu1uPW6hi3KWoLUJKj8bERvCUjNV0iVslhU5qlT21/KhitE896G1lHukB5S
         hIDX+7Ef45mbSiTIVXCtdWRJLgCQFVIc35bG3LHMQHZ6S9OYJFuPxxhbiJGvyTG/L42U
         Qb5/AwIgjwhjc4ZwwOHeUPA5sFqSIv2kVfkK2tDxvyDSnBno9K+fQW1IcALbVHOH8VXf
         J3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968152; x=1794572952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTQ/P55IE3fl7mkbvBy9Aon27LSao1cHBb5tYdZpUE4=;
        b=FpRN3QXRw3tOyRY0lEa0//Kwi6xSyjeAAwwWp/biunJhLOTzFu+64sDKv5qQocBRho
         yeY0KRhNGWcdy/4MvCm4GNRn+XYoh9LQKVzNlrd7eKGaOIJdhF51DeFpqQ6sUFe+Unhy
         T0//u/lKRpYKGO2IjS193FLLrUw2ReA6Thi3dNHJaXX14XiKRv7b59Iz6z5K+jYipkNo
         mSdTIYNz3Xii+yL0ywi/Vt2NsgsUTU1G9w2o9F8tqKRR7mECGkO8ru89Xs4wossVu9vX
         7FWoICeEnSjZ+bhg/gttIsCzqWlT9S6d/VL5GCmmyCVP5n3zHr+/rg3hN6dXjmy7pKrw
         5qHA==
X-Forwarded-Encrypted: i=1; AKwUvBzlWrPzHyD/04G1kqT9jxqok4T4qmZ17CGEwBRUvzRKxU/Ig/Mm2fEKEmPC2pEKeaZ3HxX4oUMKlHOwprI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tjof7EPdE+32BMQV7sE09RW+Z7BEN7egi5wNQjWOIzMCfAflB
	V+OGh68UZPs11ICDe8lrl/jSChfMJmk7CZqst2Y2tSg8Fjl4pTti4vSolkRB79ci1dcES/7DaLQ
	mXXW6eZl6OQx2/tH3CGH+WirKnVPkS3TJzugyEH6fsTjcmi5v3ftvO3enoO2Nk3tzKz0=
X-Gm-Gg: AYBFou0tFbTA6LXObrN8RrmipIKf/gzcMoEOJVd5ZPdkyVpw9cOWQDs0Ovzy196XPi2
	kptf1rH8s8/q0sn/1XvjxPQsBs10irICLH+FqcSzdXbMDI5jEOYsBjLr6RET/bvsK1Kt/ELPY7E
	U/gONy92KZ1O4qCqKXnSP8hSD+sno4TpXlITTe6opbwh9Klimt+lfqy7gEtAaJXQL5wv41iT9ql
	1Lrvo8UmubyYMKMyJT+T9JUMkiJXw8k6DS57QcdRpVpox23E98sIZhiQ8Z4afPWVWgvbPnTeC3H
	QvMi7oRwHlRv67i1Sq+jtmWQVFtTXbYQvIrTUX38nXXSgImic2r9ELkso8B3tZ9gYKvIXlGz3Q2
	7gfiY9TDQ+nG7H6BMok5VZoTLoRWXllJPO8snng17WHBEmYXQ0H6oh3Zi7G4zAYg1M+NT7g==
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr325505585a.2.1793968152523;
        Fri, 06 Nov 2026 04:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:a994:20b0:939:8148:1e3d with SMTP id af79cd13be357-945f33c0c23mr325502185a.2.1793968152022;
        Fri, 06 Nov 2026 04:29:12 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac249sm78001466b.5.2026.11.06.04.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 04:29:11 -0800 (PST)
Message-ID: <be2c9147-1c19-4dba-a56a-aae47b838cf4@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:29:08 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix
 da7280 pinctrl state name
To: ivanverbovoy@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6FwVwGFDLSRODaQ1FIMPEBP2zRjz_EQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX1t5vzYfN6Ro4
 +8Oz/HldzwvcsaFblEcGt4Iaebp9KCzv9YFh+MBQqrvZhjtbNcbxIumJzamXxc0WXs9FJ1md3uV
 PQx4BTXuOb6YnuPm7EDZ4wxHXvFS3xnTeEuXJ9fynQGu9RU/LvEp96othdSZGOCHMfyYPn6kcX6
 tM2v+k7mLNFTwMd5It+/XQWk/PmcfDe3RWki070KUmN1I1OYmNmAr80gAIfmt2AJvCikTZousZc
 oInFSWJiFAMvrWI5sP6/nq5um7EmVnSVDgEePp0WyTjiHuxZRVZd5xfl2axMZgh/YBRh0QOIpiJ
 WSsZsH56WdgCdXI7ebjVd8u4k0m+sSSHdwOEoSbhwiKzJVkI4vt936y0Tt1okWgt2UOA5PZ8NLF
 b6CAAdGGCqtSKxAK9EfSmSpGSHrmNRu3ocqZ2Av3Ev9X97mBs1QxuRoh5O4drQZqanJSorMNZp9
 4iodxRc+Ja/CF/FAD3w==
X-Proofpoint-ORIG-GUID: 6FwVwGFDLSRODaQ1FIMPEBP2zRjz_EQ1
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedc819 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2dXNOmNVTs6F5e4hHE8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXy6c3HoU0lvnL
 S8FaPbgs6So7dZUeZVrWSE+osjYa3aK6dOApY2ho1WIu/u/IOL5ul8N3887NhL8m2zKGDhESOet
 uATgG75yOsAAi+uyZ7LBtVYUEMRZ+HM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

On 11/3/26 8:27 PM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> The pinctrl core applies a device's "default" state by itself and the
> da7280 driver requests no state of its own, so the state named
> "da7280_default" is never selected: gpio42 stays as the firmware left it
> and its pull-up is not applied. The interrupt line is open-drain and
> level-low; after a suspend/resume cycle it stays low and the threaded
> handler runs continuously (about 2900 times a second) with no event in
> the chip, which slows the whole system down.
> 
> Name the state "default" so it is applied at probe.
> 
> Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
