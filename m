Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572022;
	b=vD+p0sCIZPWBbYXS19DQsJPVIy/ODSswjrNlj+WdeDYNPbRcrAVZwOPTB7C1Kg5gRwb0
	 TTqcm13V894S/lG4bRi6KsdyAh3UBE3XC8+rNhrR/2HWmrC4qWTehNxberPTm1AH+XELn
	 EOFYej5XeoENvHYX6vWSW/Ndmdzc1R01bqwJTUmecy3Xe6JDIuchH7fozmOcuTEqnOxEi
	 rIF7dGiCyiA3Ajq6z0H0oRrrt76rQOADGt1QVSJUOrerBKoqFABhw1fjCjHkATWZBRumo
	 K8tBJFklqhK44S1c7mSpiOLjnrEAjdTSC4zozgSbnu1YumH8EqSkpc8Kbk0qGQaxRDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
	b=iyCnUOMbr77GKa9oACuNVjYLVa1qwKZYj5kjzZCXDXTdd/RtOlMvsVom4BtG63bTEH7F
	 U6SKl5TnyeEYs/Cc+ACl/MFy0pYatgtAWnlyVJvyi0D4vvQ5W/8O1XHVvIJ6nteYaRadY
	 sTmhH1TTb1HTk+YD32sRHl1MGWYTN81CreIrCy+dbCjs1jHcGsSuK+2xQfhMX34eDOd3y
	 GJy7njxsf7fM4Ua2/DebewD0yD7xEgJd/5NFFF4dBglCOhCmC0ox0Ryu9josuSi0TiKK8
	 4iHkPWhNnUVmRdaAlkWFLwFFUzN5LgJr8jA8YLhni3qiZU4UXECH2ac1EuwBFLhZuFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5esj9t7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wgqfeq/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EAC60A6F69
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EAC60A6F69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5esj9t7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wgqfeq/1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iuVK3018442
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C5ZUKiEE5SuzhMb9ieLfubEU
	LIpm0CDUWQRF/Xp4ANM=; b=J5esj9t7OVLPLsmrMXQyNvbhBB3cAqiQdfN0X8Y0
	D2w6UGXfEpSaE8rMoua24Yml2+0nKAsdmE2xWVcMBXybcDjcxE+6vucRhm8gQF4u
	0UfQJKIALSV1ra6rDfpHhX4JxUY30blCRYbq91VoYOOLruNWgF9T3QYeudX3FH8S
	p3bJa1uxMeh/+qkec+3pqWAEAKznxOnuII44P6lJ9irwEtBV2a7cAyNAoofr4lnx
	9N2PAnIGXlIVaJ4HM5y6ALPFKN/APvlh+YJn35sNHdTuzawozcYEoWmdwuj1sX3m
	81ciQd8p13o5vkiCSkDbRmPVEPaMDzIdP+YWwvNwm6Aa8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3bnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so97212685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572020; x=1793176820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
        b=Wgqfeq/1lmH9if0teOjeKkxp8HNLVVcG4ba7M+lrkYxzTB07oV8zYhoqT2dMMblU6b
         6iEbDuYqRgG21zebPceNPOWBJJIyPJLx951ElLnS1Squ2Yk+lMmKa6E6Qkr4/G5zCn5y
         mXFlrVrYB/1+F8TESX9pnJg+zXB3EyH7LWFgO+M3XEpktWnLcX9rMy6hGtvns0PDgvSo
         50ayF3u0DlvIdQwbzPYAAV3HXRlbl+ch/7pJIhS5KlBWCHfAZok/if5QHcR8TCSOb2e4
         8u2DrDawluIjNDcxLUmmqvJMg1+qk6EHKzESbIDKe5LQbnMMautCvsEZIr7/qidSdlYr
         hC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572020; x=1793176820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5ZUKiEE5SuzhMb9ieLfubEULIpm0CDUWQRF/Xp4ANM=;
        b=jVxHUSVtTNVGtVWYuPQeq5M1yB2Z11bK5V5SW6sp8NdTBUtgZsdDsswfz1y9Vk8GPy
         iHHNChV9KpeU+DYd3DVm47UiRA7RI6SAonGYt6MtbDQGuYK4BUHF5sh2/+CQiyXZYVSp
         jmc9XmxZZZKZCtuHGDABUgVUOQlc+8KNO+7Fy6jZQF/+mIUiVm18s/VriSt2Cjy2ks4/
         gbfZvz9EW2i3mWz4A0XUiNuFVH5BQET6VendQrsMxhSNXuiPiQz3pv1Sz2xIBW6jN65J
         YpieRAKgkY/WcYPpsR1SnosesAl02Yd61dskXxv73fGOql5U6LOzZc7ZDptFvUssLu6P
         X2xA==
X-Forwarded-Encrypted: i=1; AKwUvBxNrSNsr3fBvRz/sK/gLf4oaQonlIHJ3KK+9/BRivkkub/007/tIIXLCebjmH/6uYPpANX8ad7IKkDqQ/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqoZwFTJC6NHT1Vc5ikqvXzoZm6FUZ4yfIsjDaavNZlSxnACgR
	+EOMThpzWO8zcAY3o2XKnR2wnF+MpnewZE4CTRGc1PBIkXFYo//LwpJXP4cMeB8AeR7bDoTtaG8
	AgbbIst4yILuw5wCS473sUJKXy//YRoWfYGrnNO8L34SNNxUM9OrPeeWdQwKI0bM/XoI=
X-Gm-Gg: AYBFou1MuO1QAXEzRIviYGJzGEJnfd4bo2dAlxZJSp/6vUSePI90qOATHba35AsxHXt
	HgUX7YFK+luBoyf1VBAqrShK4mSyJTw2zQ+JMFDjGuRKRN9CLE/XDjmCuLSu1sbVZ6GNlPPZPjw
	p4ObSQris+T4OyhHWMbpevfHsg1ityDhslxVYjqUPBvDOLVfui3pHsW5U0a6EK9o9/AFl4oxYMg
	a6CzCbSR6Hps9BEolGId2qUI+EwoKQiDuSc+m4vCzGTrtBhC4och7qAKtXSqGoI+DVG+FJr1Qz2
	BTSXtlph5mCYnopVfvTYMsQ7J+eVmqO91q5JBKEdkc3dxk1Bq7v5uGl6p2hCd3+k/i94ZbHUXVq
	y9VO5BIqN7vV+tIpf
X-Received: by 2002:a05:620a:261d:b0:93e:fd69:9a93 with SMTP id af79cd13be357-93f57f84f2fmr278265285a.31.1792572020319;
        Wed, 21 Oct 2026 01:40:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261d:b0:93e:fd69:9a93 with SMTP id af79cd13be357-93f57f84f2fmr278262385a.31.1792572019672;
        Wed, 21 Oct 2026 01:40:19 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm134142735e9.8.2026.10.21.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:18 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:40:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across
 camera GDSC collapse
Message-ID: <lhszemddes3ettau7brxfaiqe7srrqy4mfb4coxtlclxsavbg3@jk5c2s235wkj>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-3-sushmit718@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020142157.1749-3-sushmit718@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXyEzFHdmcpq27
 D1p51IBRsxyILEM3rvk0aHF0RqrcA9cjuMivL//xXTZcOcVJOgkWuIDgTEArtR/yJ8IRQlzlolC
 f2r9Ld7/WGDmGOi94TPXX+bNO5P2zqg3hlNRXr0ra/ewW425refgIbndQSAi2X8G+zHAOpyO9p/
 Ar7FSzsANu7Fh5gd9smGZsF7YR+YXStOgh5oSy0EDNIcID+aa/k/ZMWLXqCEZtuDqtyucg23Ix3
 L2dqkvPW7+YKxZ+j+tzqwrx9U6FP4EFBYUR0zNeZDwUn+TrO/W3MY0bIAfbEU52t1yK7Qaj837C
 tsEAEb0QmCOnp9MxO9uVjc5G/QA4uedNhBu0tIt/xBgcQgW4lAGh6ZB+WKZAuBdr7U/yrlBOCYw
 ZZMN+doMATDJCg/CXlzSPW1hQzEhwnPYMSZA5r1qPbQAJR/eXYjx2bXUgKWpxoX+295cCbKvA/u
 iN3H40SkqT8QovsCqjw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad87a75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cLpk0Fc0Ve9Y1kKZFIQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 6bUA6eOFRwpHM6x95bdL1EqOySSBwp5Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX/WXwJzzYKV3b
 Tp2FnJmJNl4AKQyniJzw25+Nybu0p1+sNMpb9X5oyx+g6w/mbpu4hrKqX2B729Yc7d1jjDPs6ua
 zDBrHX0lhhbLEb2ReG+ZlEXC4knLgew=
X-Proofpoint-GUID: 6bUA6eOFRwpHM6x95bdL1EqOySSBwp5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034

On 26-10-20 14:21:30, Sushmit Singh Rathore wrote:
> The camera GDSCs are collapsed between camera sessions. Without flop
> retention and with the default clock-disable wait, the IFE GDSC can
> stay stuck off when it is powered up for the next session.
> 
> Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
> and the downstream camera clock controller driver do for these GDSCs.
> 
> Tested on the Nothing Phone (2) (SM8475) by running repeated camera
> sessions.
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
