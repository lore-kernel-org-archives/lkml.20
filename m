Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A432B112
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168485; cv=none; b=W7oMwwjGxYc+mOiUYGxACHcxBihumDuhw+A/Xy6I1xnvAhkdd1iFr1rN19wAnbb2l5PzOFWRqzxUPGmW94bhuhfQyXXLR3TIWU8jbJ+trUAcicVOJqKzeIjQK+oE0Jyw2VIknv309cZSD8m1UCxRmLsR4T7i+KMLzCoAZNdoQw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168485; c=relaxed/simple;
	bh=BQhmcQ8/Z22Yw6lCi4BPzDtsGaWpPHmu4Ypwm/KljfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUzfWCln+TC1Wz4FNOLyTlzd4hODicknZmTm6gIE7J9b7ScI/FxPpjxWTormYyPp/k3UQmOfnqbDRK7U3KEnlOtWJrLa862OFWyeEG2qc75lACXdkadPvYwtEyAYLSeOG9l0KOiWYHrV3wISsYauZBDeSD1tpgS4JXo8y5Bqk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wx74NA7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZOBw/2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wx74NA7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZOBw/2g"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbV9l3772183
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMsXkNbslObm50nmX1vbEhWW5nBdcP9Nry2Bnrgc9a8=; b=Wx74NA7QxKHAGwP0
	hsMY3mR9BqNLCF3A3lZaUQJkKlDw20Xrl5KUQBJy96tF5YpwgJMRo1TTjGGD/8NH
	tGsoGkCsPIhfEXSqrm5+Jz1Kz7rA012tpO06JHzbnGloNbQ5mlZNPLhyfbwUF8k1
	wXw5f2dnnLe1GruVvA8mCvMX3Stf/nsSI8eQNx6TJzMq0kMf67HwUvdXHkDik9Ob
	W+1RIEtRugOHUQMouFMCMDzCs2g+sB5SAV8rhnqiMyKiYFKiWQ/obqOxoEdajPxZ
	LTOiiXcOfXqxKQZMeyYrzyJ0dFC/5w1JB4ziwjMR4BgC1LRkHRRwl5m/HT6GAX2q
	4EmDvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb60ggs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:01:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a03c441e2aso217223a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168482; x=1790773282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMsXkNbslObm50nmX1vbEhWW5nBdcP9Nry2Bnrgc9a8=;
        b=JZOBw/2gcsYEjvlwiUlbhkqKf/6iBmhnMFMfK5NftMTUeZoF1sEtr9G5rQkob8I8mZ
         QCxfLpLZR8pCJAfATkCrxHYOuf+BJXCL7zAEWJuU/fift65Xb/1PNG1FqCfhYFl80/GG
         C8NApJG5bsrvbn8/cVwZ2v78lBCyLJ1ch9lSY19APa2fIPR5lhn5GNbKe/upTUViQB4b
         t9ME7QyuAbzrzaVwmExbuYvegoSPFx8UV/2ui2p5ZKcZtC8Hd5Mxf1TGuOHK6ygMZvQd
         wTK7HRApLiNueMLUf0r+ppkZgPGWbn1J12Ocr9uzbwejWyritYRQVQFmoJHOo2B54vBJ
         b0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168482; x=1790773282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMsXkNbslObm50nmX1vbEhWW5nBdcP9Nry2Bnrgc9a8=;
        b=ralD71T08ZWqRp1T5xCbm7c/l8yHP/Trlg9BbfilP60eZJ3zJr22svUSzeT02BHJgW
         1ivV5/5MjhlUAm41bBkOFX+xnL/rD2vHeBG3U1/dMDgkq/nGwoc6a7Gu8XfLp3QYb0bS
         g8t5y81ITBXsxa1bLG51Iu3JEFENATEqd2dNFZ8rlaXJHazCeu5850BuFGlE0dK1dMCV
         E3nv5S6NY3iknltCpn0sEXEKONr9r5z+E3+Z0ISzOx+eDyyA8Y3xo6eeWMjFtRI3vLJn
         TWspheu7yyrHxEzlEUUfonBbBuix/YgxF3C6om0UK+SK7EfIBRvobYmHSr8xEE8/uzSD
         4Ohg==
X-Forwarded-Encrypted: i=1; AKwUvByOkje6BNKLZlKdJDVo3qGIZYfJHaS9G/DLrTNqNt+lOR6RjgRk+IQEHCt8oyjvXslAIp07QY6dZY3WLpc=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ0vfPXidDhjtIkX+8cnjT1ziN7TAXi6PdLlgYDVNpRVbDab2T
	HSa0f+MK8qwqZY7wFTGl0sPN73UwOgb/MvXw1FzWb0loMgQtKZisF3s9cF42eDSB8BrurGnaTtP
	7Kp6wIAHpWbg8kuDCTwlgGW4LBJ1h679a3hoDIOgGUdGmgxV3aVk5WmD8ifDM9LVfWf8=
X-Gm-Gg: AYBFou21vUJ19WNlIWLob8S6zCkZ2A84ysK8txG9+jY3b9Y4cAKqZyYz3YMcH0abezc
	8sURY+pp+I9wHZ1plnDSqKegCjqYxAclAWxX+meGAx7ZIeK81sH/CaKb8/Xtev6N9BCBGK/M/Qp
	UQuSSCXNTTHCJogZO1pZpHjt9heneWvnrR6J2oXibILx96ENZZ8+WyPtnISDVcmIw13C0PXRASn
	s2hybaSIQQGIuGe946A8OIKigNSdNWWuzVq/gNRXc0b3DqKNa4TQ4D7xN2LoBvR5sESayc3ELxT
	Damk+OfuP0/UJ242NoI5mLgsGkZ9m27AsPABRk++x3Kjf7NBEhKTc+KI/AAGUQZ939+MbsJRN9i
	57vXUPyFb2vEFZfKe0GdGzFMgRKKDzXiH
X-Received: by 2002:a17:90b:5290:b0:39e:261:4e13 with SMTP id 98e67ed59e1d1-3a07e708070mr3594706a91.3.1790168482076;
        Wed, 23 Sep 2026 06:01:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:39e:261:4e13 with SMTP id 98e67ed59e1d1-3a07e708070mr3594629a91.3.1790168481508;
        Wed, 23 Sep 2026 06:01:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6d2defsm113710966b.56.2026.09.23.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:01:19 -0700 (PDT)
Message-ID: <19853f61-70d6-4727-b8df-da628c0b88ae@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 3/5] arm64: dts: qcom: shikra-cqm-evk: enable
 the first Ethernet port
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-3-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-3-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nXQftqOkoXom15u0AqAWZpqPusMayBBt
X-Proofpoint-ORIG-GUID: nXQftqOkoXom15u0AqAWZpqPusMayBBt
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3cda3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fr0nlaHK86MzVMgUQ3gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX6yuWH8sGZyiH
 NRBqs9YcvYtug3cz7krexpFZ2uQ2RWS3yS13Wsmd8VinKM3GDl+xj/LvdfWyU5CjC0uLO4V1qNp
 C6T66C3iKEcGk8UXnhSpPETNmKeYwd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX1YaOSl7MbwgK
 3d9zvJATQBx/I/CAGSCr4n5ZEYwQI+iK6nnl/AX/RG4iEF+x12kHM8+55FyKcCbxQ92i/F68qaO
 ICtDoUSK1RggUgOj3DHMLB3YDdno2rICewUlVHZo4Si9WS+8Q9O8p767i42YvtxK10biAem8j3M
 3xe60vESS5afYW8d3JJzMwULyF6m3jSLBIC04IUG8MdDL1GiGTK/PhQz477NH7syKkoyKg+sGTx
 n6MHpUe7jf+MPVRW+r+kYmRtn13dUUSd/GOS2L+odts1JYlTSYXC1gcFWtuMYInbUNryALBniUa
 u+zwdqUdmEOetLALjaFo6aaO5GvqSoL8b3Rw3HzVs1lpFkiYYSOfYuhOiGQrrf69052cDTwhbtE
 1WEpu/bpuPhLt7L/95GkJdx2mPA+m8QKuW+4PauWD4iAmBME92BLS+iS8U1djmQy5A/A6VcBurO
 tAJ4WsshSLZaFOagfOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> Enable ethernet0 for the Shikra CQM EVK board with its DP83867 RGMII
> PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---


[...]

> +&tlmm {
> +	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
> +		pins = "gpio149";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You shouldn't need that - the driver will take care of the 
GPIO

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
