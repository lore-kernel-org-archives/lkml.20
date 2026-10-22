Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665371;
	b=Tqby7Gcg3qkQGYtTUsHQcjSjATFBksefm5SbN0Yhu+nPtM8xtQwifBZaACuNt51nO3rc
	 75Yhf/XvUjCgTUOzBO5cOCMM0HeM6V0GDj2oVgO/22fxoPINXWSg8+GgulzmxRyas34pF
	 uewicLf3PumDDPu9sHjT7Wtcy8JW48WsRSRPQwBJaa13LRv8FwiRo44aQKYADNUVwV/BG
	 U2uytrAuPDdcQrzeDlcy4tBFoOeELkL5qlrGYLB1npYFOC6fGanMARD62aV+7Eq+ab+Um
	 /sYniE9igyLYowZsPoGOO5DXXVDOu23vbdLZ8HK57Ikgmhu/iVef9BG3Q2p6P9CGnrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=;
	b=EDt0NIv1WzQnnN+GiF2ZEuTuwW/do5wUiKcSY0bJ6LOfovMqVY/seuPc75qNy4qIjwYy
	 IG4Wb/rfJ9JJy1E+JcAAq7y6Y6WAOf9taNa/eAdy6jalLRKKV0pqfSPWGbmZvSfBQMr9S
	 1hS/RrlFil42/dy96dwQgHI46UR0GB3KfPvk2Aag+UB7P4avelHZ3prKJzXyzlTbUPH7f
	 JVVSs9mWpnlcjsaCE28OxEs05tPO074X1I7ETidDyiXbRri+CJX+ZeZzegACMNfdBZLma
	 NwUYXZLzf0DBE8PhDjyofdH/2ZEtQ1idTHWMJuPByf+QcFusamlrl3v8xZ+2ykaTLKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6m8KfwX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0hXHshN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C39606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C39606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6m8KfwX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0hXHshN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xxjQ3426941
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=; b=O6m8KfwX4TBNDVGT
	btK3QlzzuZY7WtgaHax/RcdDSV1MhzX4t0eydcPI4lWT0JfRvUC8QJ+aIWn5ZvHE
	/lK76GnWREeiWcR1z7FfbXMGqWt1D2kVLYP1RosVIXK37/rEdAqpSfuSbXLW65yV
	S6doSrPqkpF7gLrwU9UaHKCVHG3Gl2jEu/b/sWeprSXj3F3D2ITrF03kBLn5h7PH
	XW99uwaYn56uDaWkTvTUgUq9/1jo9Kt5qjwK7oDxQBn2jMd+UUuopo4gDoVHHUhA
	HTSuRjeYIEvJ2Dm63vmBvXh67XikyepMgw1ghqmJjm3ZNAV3h3Mqchnqy8LriRLU
	CkJEnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93at399-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:36:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so45313785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665369; x=1793270169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=;
        b=F0hXHshNkibmtnvU0xFHt80Fc6BFiXhgNLRfJwtFwPuEmXyrSuAyLD1iHicSbEMPys
         SMqAmemA36VsWC4jTrqp5xYpgG5ZtF0oV4lullKnHO9vvNTy25BACtG4V1nZhFAjNcSK
         FPlHfXnIysoOdQQfrarPXDXwSkj9CQMsGYfH7IiY/4u3vdVnL6/Hq3Bfk4t80Uqmj/eJ
         TxkQNLRXLgB7jPa2T1D5Dgl0oAQT4JZwIoJp32RGWaiRxHun/0c+zOpeNSx2uO+mypgN
         XlM6md8EkFOsPyZ7NiGYFDjUiPi5pIEqIf1MTqzkolbY2aZhtmyEjwDExxsenWazds0x
         pMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665369; x=1793270169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=;
        b=hSwGfzcts77h48WlJGBDGifIFKj+aebQH4H/IBR/gS2WSTRQGv0yNyrxu7K3WcaubC
         +NxCYAb0s9xMsDx98V7FzVPIZGeu5cxknp75yLnxg5lcmwqmHB7xVeMVoJPM5civAxPi
         4JprZ8g9Bu0qmmlYAtBmcjvug//D4nQVmbZWZtsDqet7Qr+uVonVjwUFKGE+stfaCFrd
         T6Svxc6yhwNXYQKakp6p6PjGeHuuEdCIJgWi+u0T3w9l2WvXr9HFWUmFZX/Jl+k4/T0S
         /Kw1SsfC9F9EU9Vab+x52FHH8vCyBdDCo8OjTcCqamU5MPdMhLouhxqRJHVy10FGHULH
         ia7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4M2wFuHJVw937+sd0sgXJd1b0KsDXv/KbEg+Ldzw7xpvbJf7sgkHaj+scEs1uO+dg235JE5fKnqORVu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLZdWFsZ5JdpRdhQK0QPxNdkD3RoMxvuxzl72FNJruhMBYCH8J
	W/7wTDGHtq71th9h1xwjZDwfMwWV0Sq2CAhB05zr4nXJXMpZee+GTo69Nnf2tEQ7MnqXknfqpvr
	aYFa2cvbOqcfink4b68w3uSMQsggUKiUgpAgaiwDsDlHftO2VQFTcTX1OV/6IFAOkHyM=
X-Gm-Gg: AYBFou2RsryAa6pvXQ3E7ONEPHfBn3fLJDW0l51fBsB9tn5x4hB4i5XG+qnpi5la6FW
	wk/BiJr85S43JG6D5SWbUak6YWHGKkxfywedx6f+yBXfQcqAS5fZS2WJw4ig2YPnZsKpATvbUkF
	OVltDWx+/KBC5Tm/mGiYjEfpJfoxCei5KQ3CFJAuOhMN0hUMIsc3QREri6CrB0tX9MsrrsV5LzX
	azvfgjrnw843Hy48qjeE0V1Iw0LePcZW2qqx83JV53QH3dK6/Lp5MiO5FJz6bfZkh5kaYuvn2SW
	9U8GqMbnDUTX/sKFqjJnJ9HgJEoMgwMPwF0+F2VOyWe/KQjQHM5svyjuNZYiEvW18AIDIn1BqNt
	FA2HtW3cn73mdPCbdbnc2NA==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1027277385a.1.1792665369200;
        Thu, 22 Oct 2026 03:36:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1027273885a.1.1792665368767;
        Thu, 22 Oct 2026 03:36:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59ac5dsm89387066b.57.2026.10.22.03.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:36:07 -0700 (PDT)
Message-ID: <11c7f9f6-7a9b-4b46-93ba-b74153744a1a@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:36:05 +0200
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
Subject: Re: [PATCH v5 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV
 programming from qmp_v8_configure_dp_clocks()
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX4armBA5NtVkI
 QmpkOTrEdZTH+CSuJR74KLyTF5zsIvqwQtdLipiAqwpRQHJ30C6qLqXpwG1SaTOoditH6OpucTB
 smzwqTeXPWgvt9v8+X4VraJWQcgDSVDQ29/R4qnYFHOb1FCTDgC6Bhsy+zE9myaX1F9k3dGFSaK
 xFvT70Z6uM/oHWJNAnfnD6lMs1Ny796soDQZHNuI/ezPqblg/xTOn4Hhm3cChmKmeSt5sm9UrIq
 epX9H9R1dWKiYIHub+sg1lIYmFly/BjoPRNGgIRwmenEmJlVw260TQLa8Fqvu3Cx92etVSuLE9q
 48jhJssiDYDYdnCJFBOtbt1plNkuHD1uOkBTMRdfDS2rmKlwSpDg7/9uju5hZ5Qst+nraZHQJfP
 YjJTxZDhCD1E8nJ0YCVDV9tAQoHtxVfXQL1I08XQaZ57KGz0otBafCfoirUrHwxQsvrcaeupINe
 gZP56Bi7L2S/0w9mtyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX3SL5uIATvwYt
 da8u/xmEX+JLUiQwO6kONSpfQBCqLnUJfFMmqGa1qA1CkJn/GofFB2LiPVaD1LgiwR7Y49fFOCV
 fz2Mju9UZA5KHUwdtfBi3tkW+FvYIZE=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9e719 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ATBR86yDhrRX5TM_Q68A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pqyXg8czcbEfa14nAzIk0q6FwS8NQ_JM
X-Proofpoint-ORIG-GUID: pqyXg8czcbEfa14nAzIk0q6FwS8NQ_JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220042

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> QPHY_DP_PHY_VCO_DIV register does not participate in the
> divider of vco_divided_clk, it can be left as it is- No impact
> 
> Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

The way I read the doc, it can be left as-is on Glymur, but
not on Hamoa

Konrad
