Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2163023E25B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339235; cv=none; b=T+hJVdD4F67ddHYjqEolg5d1fxyjvcuM0qLJfZ4DSJn9w2/F0Z2BXgeKIJtmo4qcFto8Q2mmHcwi5PBwyiwkkw/te4YnWBGX6Bx30ToRRN34FtEg/21D3y855wi04rIIHfA+FgkVtu6cuXpDr34TiHECiZZnBYsz+c8hdgari58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339235; c=relaxed/simple;
	bh=dLNPvtyLfzJQYiYO1+leMhmhyqiin9MHtSdwsymE+90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9mngqcfbcfNfASi+MPHRMS5FBN4FsyN+JTmxp4+8WRuaob1elONS+70enKmURdYGYIc27qgN0YRv+K4cMJkEztmkJa92O/EBUyUb29rnWjrQ7WH/K6V0XkZvIJOqIdG1EtUQazNH7JTEcvCmlPwi3p2AShUlhS6NGvDjsdiA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLQR9UWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRnWOwHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLQR9UWG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRnWOwHz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VZ2J143099
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=; b=MLQR9UWG/RYTDl/g
	LlIxDSFUIfsVHOosDshPqn5D0kS/IaxMD4ukwvBe9qclL2M/bBK/YCZBwiUc196M
	sre97ye8MnVuHRYuU2kQfm4xJtsEkLr5FocRxjUwEHz31e1omWQt4fAA8XbTAL/z
	aaexd8Z4ZRrGn+KFJyLW5aceE4il+/uyQymZWrj3vmSWMukpF/3SvQ8s8gOwN/KH
	S4JWlbPsJD1UKuEUNYUUHDJ0AXOwtqX4Uv/9hFK+HDuZJWzn1ilvfzhZOaPj5LVT
	3qhghN3/lpYbvZGryQvGJSxBEmGy17pmKx3w1BG9lw71dsRLwqIskN8YawrytD5e
	rWGjsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397b2qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:53:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so1882411cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339232; x=1788944032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=dRnWOwHzJ8/1WzvPiDya09etPqyiJTARMs9Hsdc6GlAdD/KoyzJ88BOAaCHI8lSuYq
         aE0BMBQddlE5LIOygvmeJ00uo5DRBQWIPDx/4Ncqw8sQj9y19mX20W6ncVJzzBhyyfMS
         67Lx+ibA7VfS9X+MxdUnZ37Z7DHGjS/U6+e3o1QXUA5D7jWmxq61bA6icvBcyG2+MI8j
         2vWKP1izo/xP27X6wgakZZL0QuCmeYIzZIwhbu812b8on2J08RS46H9rfYLWiuLKNcgh
         0Fsio8P/Xh7+T9WHZhEMarRbJZ4Qmpmmp0dodpEy7aCEvBjp5KYCVIh0bV5/5Tqr2m4A
         BTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339232; x=1788944032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=IHl0Iru8PSOvyNMPP2vo60GJEcWlcSACt7s/r3PDcSVD0G/0vXAoLdO/10FjNrR75z
         Tza+W3opcqvEs9T3HCSWTfeYn3tAuSJVYwfSusXTanFZwP2Po3S2mWuTRVCj2hyrxInl
         Gh1NpAD5DpB9zF7zWQvNFSxUMIezl6GZ+Z1mZWTJgzPNLJQ/kuZVvfU7dwTdvXtMnu21
         uIp9KFxxrvi1nugzn7RcUYAQkJhqdk3RztHYH/I5F5APg8Zg+yZ7NkxOTgAlcPHyYiqj
         rrW/hXung1CGrCtckU2YgkfQE3Lsfsk1ZwNrhWrg6odOxDPdnZ+zeIXartSul1PtGm5P
         2AiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdcCoICgfyw6gV2hBIRSCBoEMAOeO/KtgHhGlLVfFtVq+0OkAowLyi9nFdMnhFnwHFSfx6JEoWbsZ4gDI=@vger.kernel.org
X-Gm-Message-State: AFuF++koQEsItdvmibhi+KkRlGeRr14FRtgf2bRndprkfoO3rxeGD9Ym
	8mBB9UKUHZdZ5UYa8p9MInqOMsJOsChm6qXXPj4dDzO3LaxM6NuX2hfipgYSsKMmWeNzWCDqNa9
	KDu5/ScnnH2bAJpWQO9ixb1MJVOjcLmppmSnZk0t9KsyUHu4FAYaJVg+bKDoJxsznkIUh4w0w6Z
	0=
X-Gm-Gg: AR+sD13/iWEReVDemnz18WOeiKsGsIN3PJu7FrLfmB+2wIJxKPsR5A/x5zEWqJSMIdb
	2JLN3Axhgp/v+aodaTK7+LEvhh1Um5k3hs4JJYy8TnrhB1gjOy+WKHEXsfPb4fxQdVhyUrwIAun
	GHB5lrFpD4nek9Hc2OXDnY2xVYXD7e75BN9f7pMN1v1E9tod4Rh0gfjSa65kIKuHJoYHZAAMVB8
	dtgg7QtSc5ohEhgPZQjxh/Yw002/Uiz1+C9GLK9EuSA4515JeKwj54ZImlks8kYIQFr2hex9a1Y
	DgBJXlsw1WiTbPCGyv10/PTVXv6XwiK5ENDtnaO50T0QnJR5DbR4KDgF7MY5wEWqsu2gSu3vviO
	g1xnjaW13RFalYO4UWcx78g==
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17656251cf.1.1788339232513;
        Wed, 02 Sep 2026 01:53:52 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17655961cf.1.1788339232055;
        Wed, 02 Sep 2026 01:53:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f942fe4sm715364a12.25.2026.09.02.01.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:53:51 -0700 (PDT)
Message-ID: <857bdc72-fa8f-4dc5-ab9a-16ecf2903a24@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfXz894uswIPT9P
 DB33Uj/0hvF9wM9K3I6S05YiGts+6KGKyKnJ4W0bLBx4j1WnEjCT7/Z8qMTr6rIntS8E1G9f43F
 tfVCR3yfmfYsBwE9vNslQWKNIUgMHJO7FipOpClUUhWRqjh9RRNEOl52/btR4LQj1l7MfCN7Qai
 X+joNahHeatmCZKM2U6ADRVvqRFk3rdR9sjR4GOAObNdcNtV2yC/2ouEvuZdOImgTrNHA9B+UG4
 GbJ72oxNWD82k17yYmd1uX999RrLDYgRt5n4sw6DMQ+cms7W8kNGOSj0KLiVmJFS469hdXcpSv4
 kLem0dSI3QAaBup9CdGJesCtNwkcNtHVISgVPpOVQkEpACZ8w4msV0QaMds2G8cBN+WPb4sCck4
 rLlefEx0fIkFRZputrKWOHoxLZtFu+tW9QVgBzYIY1MUFrWId83pLaqMipLDRbCo4TTozyRfO9d
 Bykxn5hM2gCgWr5TD/w==
X-Proofpoint-GUID: t6cI6TJEHHWbJNB2SF_YxGmpCbmt44dW
X-Proofpoint-ORIG-GUID: t6cI6TJEHHWbJNB2SF_YxGmpCbmt44dW
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97e421 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fBQ15DjUyzdVHG486VYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX6QwdVhbT8Dyt
 AxZ/i61Ys2K3cwiRxy8ie1fwfVKRJtq6B4gqZ6pGz1SQQX8AiQHDYeNW/FNqSsB9blCf5Tf7Wvj
 g2sG7blclIw4nCX//VXFD+eP/A4j9cs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020078

On 9/1/26 10:58 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> The regulators s4a and s6a are a bit special. They feed back into
> PM6350, but are not modelled as regulators (or anything else?), so they
> also can't be added as vdd-*-supply. It would seem to be possible to add
> them with their "Default on booting voltage" from the PM6350 Data Sheet
> in the dts, but I'm not sure this is desired.

Yeah they seem to be strictly intended as being part of the internal
PMIC power grid.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
