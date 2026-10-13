Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949803D525B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882849; cv=none; b=dT+9KpqH8zW24+kJ2ydts+Rqx1yOqsvvnO3pYGpoHHzPctKnV1Ahw6qabnidxsgkzZyEslYzNNZrPMZtV6mNWdItdVXXoWLVqlda4OuWVZp+8JcbAcGCr4F+u17OmhwG/aYgzz6R0kh8B0pX4oSpoDXsc7p1ru4EPBu5i8/Y6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882849; c=relaxed/simple;
	bh=9t1LfwP+C0V3WkdUIqJJulzQNJ66T5GzsZqb8QyGXNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyRnEPypTnmIka5OgeXaDP5OMQG97B+IlQ3EWZHkQ8RtEJpxtw5soK1yg8CAkhp08Smue4EdjD8fo1s/wlnCyDjxGtM2SNcslrK7XVyL9BTBo8wLzHZIYPOOu0md0MjnFjqeL+o+W8vd3UISI5/8sPDK+cg2VrktbhH4DW3uYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMG5hYf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gclKFj0C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMG5hYf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gclKFj0C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CTrx949419
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4iSugGS1p1Fu0QiaYnOql6lHp7UYNFe+58/RnRtCOU=; b=GMG5hYf7up+Vl+3v
	cWUG63lH68sYoAdAYb+aJoD9xby/yKNj883k6Z9nejdI3eI3FP19D2tMZHYAMLea
	yMxTwRadGTeVLYZZbYi98HML9lWNn1Z+I5yjmACWYAMEnAi/NYyARop+MPj2q9z9
	4i0h13r5NyQOjSs/MK77M3nEz3BP4m64L+SqKnTgVTT6NF7htnC+J9bowJ47L/ck
	e2YjT4MRjn4Sap30l+2lLe2MCj9gcLAUgeYOxqWCT/OKfYXjB7ahL8P/s8AtlvZ5
	hIZX6I0/l39J3zB71zUibRrl4d0O0htus2E2C0xErS+Hr1JvnwF79+2bqASif/WC
	yjoAuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628qpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:14:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so47254185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882845; x=1792487645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4iSugGS1p1Fu0QiaYnOql6lHp7UYNFe+58/RnRtCOU=;
        b=gclKFj0CCVJOYFZdM5LWdSfVHPgKJyabTV/brrB+Ij05uGrEo0GBYWzf0Bx3/x7XWY
         7XGa0SkR8v7JkTyu33M4afnrTN90PstZvt2RXB5uQUk7/rT6JmtnKJLeplJRajRHItHy
         ViQp+2Pqc5SwFbPKRhxaXLPrHuADeP7RJIdjNsC/uPyygLIEiiXD0kRbks6weSOKAgn7
         Mt7vdNuxhVXU35PcVuGZqigaRrxaWnLv9YvJQg/LbHUFjNlgmIc/kI5qMSnye9LVrxys
         lqw9ZM5gtbpwOPVfXe9rD9PY269/9zwZP9mBDR2RyYqrqYEuxRWxsmRzivIrbAPXeCVS
         MbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882845; x=1792487645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4iSugGS1p1Fu0QiaYnOql6lHp7UYNFe+58/RnRtCOU=;
        b=YJ7BgG6It5OZ1JU9qgVF8D6r7GJ8kWTNhm4wPp7jGFrcTAsoaWxGjczYGzZ6jm1iOT
         lwFSxV7sBy0WgixqHKoDMX81o8S6WSMT4s8lPZ8hcoJqKKJdNm0IxXXM9H/FDwdlkDDn
         e1IVWb2aVbgvTDtLNHCkUZ25VSZM/91/EWwIOKa9e4suIYQtyOuIO63ovkdVa2wblqqj
         sEszrRHah67nusrAGpZZ49vG8YUxzx0TfzdelrI2ZntcYMGcmq/0vyBmzL1O+4kGkPvx
         Z50HNufN8iYmIc0YyHJB7B6a8BcQ6IrRdAPpisIZPlMlxzrfwFzGh0yhZFJEClsuU5gq
         Rf5Q==
X-Forwarded-Encrypted: i=1; AKwUvBykkTjuaVrs7UU+P74CZra8yfS5kKkL1TQREmRb1TAjfDoKQBlD+/ygYkrdTzl8dWQBn/OpM34ObAkUQpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3FWQWGKEKRZGIOiype/0ocRv+FFXp7dyIobaT1O3ARR9cANLd
	+51J8zqa4HFbzUq9YKeZRof9Q/j835MK5IMKqSGekYeWA2bSHF1cHiQZBfZ50wb5GjgNrHj/fjP
	VzjR2iMEOEOJ8FM4dBv9kMQQbk2h1ahbWGx8/hVQq1+gbADl3fZUvyNiX4MtF66IEEsc=
X-Gm-Gg: AYBFou3BmWjFtehKg1elABwN/7LZ+7bvsBgp6UuYU2lS6EdLCowz1Uyjx1optzDfV9F
	UvwAyLE3EQYc3lCS3ConDCGw3pKPgZ8Gb154o/dSh+5Ix4U94AzubKJRcmBbvkLP24lOHI9J088
	BAWOS4dWf8jrLD0EwVsFF/u9V/+gNWE2p3Ij3ZJO4LfHVLVzG7vH/wshLk9dEm+HaUWhwXukDtE
	0FMAh+J4V9elq0+Ct4ilyHGxwH2vd+TTDQHtMY6VDOFnDL1s+SEiHPAhJNE4WL2sABsk9kNZxl+
	fLU+EwrJiqWP/9urTsC2eJgd2552ZyW15p3PahkrEqRvVWoHDF3b7oxeXvBkH+H3BhVQ4ED21Wb
	VPIITWfrA6IvHXHtabK+S7A==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2350661585a.2.1791882845523;
        Tue, 13 Oct 2026 02:14:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2350658785a.2.1791882844985;
        Tue, 13 Oct 2026 02:14:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c366707467csm105224266b.76.2026.10.13.02.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:14:03 -0700 (PDT)
Message-ID: <9e3ded68-ed3d-4a64-b26f-dee50b7e00fe@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:14:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdf65e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E7-qh2Fnl_Ea1JZtUYsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfXzdSaCzbjfhwA
 RT74wy5vRBvq+aSEeWEyRYf9/qFPoCZbn+/0Q0F2/VZXyMhCiAK3MKIc0cpNTM8NcKYk4pyiI48
 NXlubc1w37T5/ocnghEcyo3PE5KPxzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX7BL/sBYrsZhh
 Zy1qfGg5RzcclTtjyw6aeYHsbOG+4uHx6wrFsG9KUoBhc+npW9PhO5u6y7LjmGXcgKz2z9xDpSo
 hYhN2f1nFxM6axJl1uOcsJ/cjkb7nflKCl6+B5IKPaDDljeKGRq144/CTLRB7JDt+4ixPP2o29S
 bBPrmd2VJpkg4UHm7Zg+/KXa0Co6iDzVLp+Uwlo05NHbHJej3IKic2q1VZbSjIjfXOFeyMeGSYX
 qoNRxUEYNn/XCPDfwlNSDJUquAFGjzUjryDJ7q+EduoXCS0XXTGOWGpHyX7H55ZLrPTG5PVAoZm
 w1a9ummcfB1K8qZH4MhCbzfSgrT8xT1VwCAYUQo3nnHC0fHXhzGIJx/OfKrku/mS4RcOL69WBry
 9UdqOsi7sRFDXTA8WS0q+yAAOwD0lGVxunGlaeHx/jz+vsXsGcKy/yZI7HO4XZdbfk+5dh5q26V
 ww/lKezhCylInRG0GzQ==
X-Proofpoint-GUID: f9BSo1Sgpp0Y3njQisDTIE1eABOErF3v
X-Proofpoint-ORIG-GUID: f9BSo1Sgpp0Y3njQisDTIE1eABOErF3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130036

On 10/9/26 8:08 AM, Jagadeesh Kona wrote:
> Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
> the additional clock rates required on the Nord platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated few frequency table entries to align with pre-div reg width [Sashiko AI review].

Please make the generator aware of this overflow

> - Picked R-By tags received on v1.
> - Link to v1: https://lore.kernel.org/r/20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/clk/qcom/negcc-nord.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 68ce4d6278baa5888b277fb34a135d7e5beb789a..0e33737475d98f1c37853a5e234831d03dd50aec 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
> +	F(144000, P_BI_TCXO, 16, 3, 25),
> +	F(400000, P_BI_TCXO, 12, 1, 4),
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 5),
> +	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 4),
>  	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
>  	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
>  	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> 
> ---
> base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
> change-id: 20261009-nord-sdcc-clk-1b23f4eb4177
> 
> Best regards,
