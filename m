Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF049B5B3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553936; cv=none; b=YfKf+KrZSJkJm//RKJH9aA5Uyl0GxXivgEfujwYFF3qLQ4LW+c/uQPrHdMeRHMKNGKLUVlPubeD6mpymgrvcjG0McKscmOaX1FQVMdVjsA2OiVpjEn8Ohi3WXbbfb32wgUNk6tJ8QkCPV4+1QYVgx3L+z/w94HRWZU43wJm4KA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553936; c=relaxed/simple;
	bh=PXQghjwcSP8cjms7t3b+QdUxG6nrt/Om09/cGvTeVq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fbmn3xzyyNn/7sKbDL0unDvBMG+3IrdtUxZPK8pC1LQm/+y/L2QGAC337XelgYiIeF7qc+CjhYQCdt12ITNKePdqNHEMyBPaJzSWlwPfFuLYSqKyF314WKqXMbj/X3nNN1DVXKdU5XXNnEJQ3XwbZWVnDk6HBUECNBuhNPsZd+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLbFjZ8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=au7S6Dk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLbFjZ8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="au7S6Dk7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKBbo1754652
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eow5nDAkyvY227WNXu3zLt+s7l+RZF4J7TBYixptpkQ=; b=CLbFjZ8oUEMIw74o
	Pr8rBbHUU1nJ1UwIS78zyGcjQnVgg5Xt0tw5moOEGGn7+XXn96RzTAWBFydnfrNJ
	6NAspX3sOimeQsh5KcDbxUDwK+PbT8YDuwzPUOBlC/8+0TMhqU6D2O/eAYKaKfa9
	vg3FYsZnBDyL+mWC7M1+snmaup0HnR1OTYWiY5BaUHXIxlvyPEtJcLUTOyLOPWWN
	BTjfBCFllrehXwWpXmMRPqNGFVGG5e8VE5XBxHNzKbmlbjrZJIyT3BI5di7M7WUN
	svlke71y/HWAbBh2cZskIQreHmkf6sGE/otz6McUYNlPmRSz6sM6YkUabjp6ey68
	emx08A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgruy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:52:14 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso6731172b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553934; x=1792158734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eow5nDAkyvY227WNXu3zLt+s7l+RZF4J7TBYixptpkQ=;
        b=au7S6Dk7GPZlksbdBkNpElNbhmhFVVFEJg7KxWRTNRCLPr+fl1BzOMu/BevfHVN6UC
         WWcLFLATULjdRtf43P7ZAcYYEDtBXralepfL7bScw/PwRrjVnG+Pal6EcPL4745xRgvL
         Qd5X9H5f1+WME5Sgat+G+SpB842yWvY95VF3R8vnPtvoRoFWHzDpuf/+kWvO1ZPC0gXS
         f+WWzktJB4/n1fOfER6vux69Pa9a7EoKH6ERoqUA9XMTCg31Ba+p5rwJeyQxOefhGoPf
         NG7Yvfxx2PN4HlVPrxmYq1nYQ6Eu1qeoucjaa6aLhinf+qWBzdrWnVDn4ZhoD8ysKv7H
         Zqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553934; x=1792158734;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eow5nDAkyvY227WNXu3zLt+s7l+RZF4J7TBYixptpkQ=;
        b=UXr63B4IhOY3F955UdW7ncgVBDNeqNK1FYUTFTYayJzmM83MguCHwQmqUNaK8WCQLe
         IAU8Kr5jpsbnIcKd/VdcEgokoh85NWunpLRywW3K5BYFLX7W+u9/fOc9SyucjiDPe0OP
         zQ/NIlkkTwsractb6MSKsHh+D1saOKfsvtSaLb7tY/MAKsth7F3A4c9KLElV8M+tgHJT
         TC4J8SH1Aj0RFDk2my0bcIS1HuZdAUNhW0yQ4XL0ZKN3MY0nLnYc4WxnXgm37B76ot+S
         qjKO3I9wqWRpHS2Aj9Q0WWhqx7akZk2NJEcscj3FxKTjmYrqKCxsdo7op+DCgQSOtxGv
         iU/w==
X-Forwarded-Encrypted: i=1; AKwUvByZHNwDfkl/at3u3x3FbV1odLo6GebQqaQXPnyyYn4AEKgpkfay2gXfG0YztrftSp0OergE36hho2CoN8U=@vger.kernel.org
X-Gm-Message-State: AFuF++lACeszTyZRbyHyQbgcGFPoVF5FzxKNQUY6uMdQiBYMZoAP75LJ
	K7qFeMHAA0cIORBHx+5nuf5oj8Yqg+sOrZeJqXE1rY32pOxocKZuG0WLq1WMH+wRYME5AUvKqvn
	YqwYJ0oHf1LHEdLG4GWPwBBwRcmqGn5HBgqDAl2Rom0eCR1Bt5Tw4DG/hAm/nLrguYE9KnYYbnk
	g=
X-Gm-Gg: AYBFou3FBDRowKkT7G6/s5QyTYdM7YfetyuyzXeVxVFx4tqxKzyCtV2fQjZanYvZSFq
	RPNtvvxP0cWmI+LPakGnnRNJy4EjU8zc9UQFXdYGeaJ3KOT+umQ7hD9c2zd6/GVErVWYPmyoYe/
	VUh6IFJuaZwsZbJUcOW2SduF20QN6EFv6uzvaREaA/pqo4q43nex3sL8wfCZcgyAtSqiTjCPkRX
	0h7/zhxulYVKNr5wEIN9rimphxVnbEcla7BxgtCrnFLtSViQ5nW6QqaFnAUMQ3CxyhuBYzzQpJO
	/BwXHu5VqL6GAt+xG/x5uS3VfgJt0Z7RxNbPKmLgunvdLQdaLKBd2JwUGTXhadXqYT1d5LRRpEk
	6SgZWe+QcVRjd1ZT4HXoO8Wrbai8HUch7CqzxjNRMopQa3UqkTAmCJGE=
X-Received: by 2002:a05:6808:138e:b0:4d6:90f3:74b3 with SMTP id 5614622812f47-50c553c9e9cmr1325762b6e.51.1791553933937;
        Fri, 09 Oct 2026 06:52:13 -0700 (PDT)
X-Received: by 2002:a05:6808:138e:b0:4d6:90f3:74b3 with SMTP id 5614622812f47-50c553c9e9cmr1325740b6e.51.1791553933478;
        Fri, 09 Oct 2026 06:52:13 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c16755587sm1949024b6e.5.2026.10.09.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:52:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com, kang.yang@oss.qualcomm.com
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
References: <20260922200643.1133491-2-ivitro@gmail.com>
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC
 address pool
Message-Id: <179155393169.875832.17468268809769517120.b4-ty@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 06:52:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX12XqhL5o75TG
 Rt5lPjKpl5ubeqYnacCY/vdzJ6K/LR6nDFAN5Xk3r3jUF4XwMqavLsHXsxQzQab2uweTIQ7PAtd
 GIr6wDHNrbwui/kJ7FMQ1n0snpTlJ9A=
X-Proofpoint-ORIG-GUID: jFdIf7VhC8TFwrp0g8J0VAM9BQs4QD9M
X-Proofpoint-GUID: jFdIf7VhC8TFwrp0g8J0VAM9BQs4QD9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX5+ofX4DB89K/
 PT8055HwsB9b+ookNgwNmg2u0Yh6Si0eQqDOgjZDlRjMPhN/y5e+griL+rAC1w2UnFDcMcaD4F9
 xY9xojwxxgcV8uXvNiam7smiCzQPe7RjGrHWWXCBuhhDMNXID5pJpiBnE1s+wciIu2rbvRBE82c
 Mu9mLCM4KVZpPbId06GS1UXdsAS9JRuokWvPJe6RLNiG/t0JY1FUPBkxkjarxAPcNBlbGCGl4wd
 hx1Z5gxcT65Exic5Cx1zMAs+MtLC3jV9I8rBDxtoZTrrcaC4XertjbW5zu91vQLlUDJPOlE4mbm
 JmS0cm67Fm3YAS5lNkuSeOKThcaJ9EWkApWMMAeYPLQSTDnOWfBZrqRgHBidQ5DhVqtbwoZvKpU
 4oB8w8tz7DohUgTLH0qzo/Bfxh1xr0VhR/GuBV1v+/qHyxv3mJWeOU1LGMyJ5evU0rLUT6w1QF0
 a39ZppRiUcCll5SwLMg==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8f18e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rRgXgv_aqFsOssekQl8A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055


On Tue, 22 Sep 2026 21:06:42 +0100, Vitor Soares wrote:
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: advertise interface MAC address pool
      commit: 4b2f8de21708c02203a31e2e83f8240dbdc702e8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

