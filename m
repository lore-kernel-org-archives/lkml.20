Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F130F7EA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532279; cv=none; b=tQYEBJTw8V/EQAj+W1XpE6nTvw6w8lbKpYUwe4dblHfRkMvkJ4LNb/nquCzaOxYAHwMC/0vtfkriG+G7C58RCJMr7iGtHD/n0WXROGqQGWvUnS4HLUj+gi/S8x7GKqG1SrE6QG00rNM2nrV5aH3cjvOXVJbx8SmLLVH1jVb+S30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532279; c=relaxed/simple;
	bh=0Um5hxrCDnA6hJBMs8PXT66TyVO85dEsGiGzP6yZCbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJNXA1uqwSYlUuGffyu37l1zQCLTGu2sX2Xd0m2P4S6zQHaKSKhpOgY9+/C+DBN7wG/ZeRbvRP1eh1FNGQUN5GtLnQvMh8wYQTV8e+C37rQ4uqZytuu0/K2TU+JESd3tKqU5IIfYJThyUBAHYZrRd2pV0uj3ZkNZZphGYkMoPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ht1JxI2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eE0o2f/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ht1JxI2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eE0o2f/a"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYowd840776
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFyXjwf1vW6dWLb9NnJHDFBua+RxW8tDX7Lmq8HoTrU=; b=Ht1JxI2l10OWZ/Ic
	/kAmtifwpte+vO0gL4njqrp0FBiq2yswUHCnwJYmhBultnP9jxvE0hyNtHuE7qYJ
	6Hdtj9yf+C45Y0xkExzWP48pIHHo2kectFCGfUSLdEyUCiP46YyauXJfwhLFMr3u
	z3QC6KmU8XCiu781QibzYHE+MHrTpIciDwdZU2+Dio9ACVqVoz9s2XlDMNNfiJkK
	+p88G5QRqZYsLtNwJwd6dPY0dhb3hb638W++6ffRs30861VE/xgRtol/ckeaHl3S
	UqcRz9yhEX1dv+HbQR7HWFLUB9mzOgUxkia7VcZcMXF/rfgnnx3GStzVGWhePvsP
	fBCxwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw98m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:17:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so92397885ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789532275; x=1790137075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFyXjwf1vW6dWLb9NnJHDFBua+RxW8tDX7Lmq8HoTrU=;
        b=eE0o2f/awQRquFbHrBv2LqET5wPRtIXMxiHzpn5pS8UpLl0Qn3w3cXPpMy9oe6V4OB
         YxIaWsO/CQONJ+B/Spl5oB4o2hR/r3xyVi9Pc9G+NMvd0UQdqJ7lt6p9YB5sfoIGl/22
         J34Vlr/gBEj0u3Yx3Um8LL8Y+jQN/N+SgfYryFRM9SwhtS5GstxRWcd2eCk7SqpdMrng
         Q2i6q3oB6JEIMsE5Vy4TIAsrF2j4EUWZkCwtRPDnHoAq75tuBdPOTxfh1GOPAWWK7AKb
         3jfNaNbj3HLQgoMkbyrxZ8d12kVwgoE8Ppr+aYCJ1u+ZdRKBwXG6gCw3pjnkF4mJ6C11
         rYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532275; x=1790137075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFyXjwf1vW6dWLb9NnJHDFBua+RxW8tDX7Lmq8HoTrU=;
        b=CxTFDj6L+8wFUL6u1uQl8KLCGSQEUkl22sCpOG07gmw5SfA16xY9M9tdQfE85RpNcg
         baY5bdc+U9YrakU0lsuA7FnKeqrv65c0AePprTLnBtWkv2LXeWrMPNMGl3VbYt8RfL1M
         6oUuyCUeW8UHOYDJrgoF9DQvb1Y3fWwJY7s68pxGK712BQ3Tv3eAPVz/sWF54T18Oz/J
         KRgWRSHtcUJnQVywkIRvnrmksS4vrJnsuqNJanqT276c7rTgDZHQIdNqkaplsa0TQxmt
         Q3hmX07A50I/dbOFiyT30S3j4Y+siaQm6zS7Ju+slqNBrTm6U0DSUSuzT7nRltr0pcnP
         JcNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn1iEHh0NDW3PkRZK5JRCqEYxpLJ8LtYiDSNFnGdXLH8wB5AvDoknFO/ex7chtouULB1kzlSEuol3K6z4=@vger.kernel.org
X-Gm-Message-State: AFuF++m5/f4nSFxVVYOykNIQzJxlrjeHejmKbTXJ1aTNDkzlrV64hJbX
	4Z2xZ30p3SU9l7CxWAWVGvUNJo06XJO4c4KTEX5o9R2q0khrEKUgntWJPHbx0Ahomnu7bVm1aNl
	jk0t9WJWc0UxZ60UWNfNqmkOXSg9GuhlvvqdU6JYWnycpbmFP7hCl/GNaGWIAlbnH398=
X-Gm-Gg: AYBFou0vs/u8O1fOsCZa0KUG8ePA/vwQb0PHW5esm16V8iMdIIBvbHYS/KgdTPdvuR5
	AeXUFbL9LxgkgfpSPZGbGs7g3ePgtEIXILhzZZU+G97S2K9yzyCIkfi/v5rCJi054VHXPJ8MPzv
	A2VQw+oQ6OTb1cQ+1m2s0BiHWugXj/WpL7iC2IV3KizS+SEvDZndye5NEUKf8MFk7eGzTxRlo/0
	AsywtIi/Jj0bus7rxKDbhzqcJ2tpK+I7xwh+QCWI+M1NNiMGuK9l2jdr4LRV/0nziAHGCbPRPym
	CNWq5KkK63KmfdkFuuO/Gx8ftick7GBn9AYqTC/UMyL/loB6W9tDPsj1VQVJaxfJRmsm99r66/T
	n4LePOflf0D2HWpUF9Io0mV/5Br8=
X-Received: by 2002:a17:902:ce81:b0:2dd:64:12ac with SMTP id d9443c01a7336-2dd8e632d3bmr19186185ad.11.1789532275514;
        Tue, 15 Sep 2026 21:17:55 -0700 (PDT)
X-Received: by 2002:a17:902:ce81:b0:2dd:64:12ac with SMTP id d9443c01a7336-2dd8e632d3bmr19185755ad.11.1789532275081;
        Tue, 15 Sep 2026 21:17:55 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aca3fbsm3951906eec.20.2026.09.15.21.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 21:17:54 -0700 (PDT)
Message-ID: <80971c66-23f0-439d-afd0-a4f0211d2a36@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:47:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops
 for GCC UFS muxes
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-2-d0aa1c60c269@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-2-d0aa1c60c269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wf9436I45mYVjf_FiIfNzNXxy_Ffa6kZ
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa1874 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfX76m9O1zUhdfB
 2693hLApHB1uesOIh+Rusj7GBXXk2/RSkGW9OIhQll1T9b/x6RwiHKWW8dVWQbrx/uZZESzMuEU
 iaurAc5MzRO+KDEzlX0QFhrPTCxuFpzYCXvHIkxphCkIvcPVZcoUdg/nGWIGKgdxxCplSgnqJKs
 lXsHWbITaID8DXI48opU+Mb2dLKqvQ59rGhf6zI5SMlvE8JnQLqSoMaXYgLZ10bOn/PprdI4pv1
 qmRzZY0Xk/RY7eks1teAEdDug5sm5fyQdWpLhAIBAAuxKU9YzhcFV6+4L+htaMOlOwWo/57vcrE
 uRIJVLJ2zCF+kETyQ2rmJQdplqLMp/wlBq53LuL8XFPMJMxzkC7KXH+qdLr0caCsOdkxiMwYTj9
 HtzB9ZXHNIxc/eqCvGZC/BIk5scDnEFwXlTON7XbAg8vMk5M3CzPu+0VCSZkcxUgWRol8tYTKcb
 AjsArX4CHuGRcOJmdQw==
X-Proofpoint-ORIG-GUID: wf9436I45mYVjf_FiIfNzNXxy_Ffa6kZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfX2kPHcEZ0DBlQ
 HHqf6uKH9LBTDAnxscKc3FJiK6lAd85Io3u3/RmmcW8lSvYyiHCvqXsiG0UNJ+1nUMQUW42QOlb
 nwvt1shlYmjDlK07QB1t8hiQ1NMxJiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160052



On 9/15/2026 5:37 PM, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 69 +++++++++++--------------------------------
>  1 file changed, 18 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 2ee4820b6fdfb1ad2cdb15366cf746651fc1a36a..a47a2c6b961ba01edc69be91e299a190f4662c3e 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

