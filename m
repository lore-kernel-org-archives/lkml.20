Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA844E67D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111591; cv=none; b=PFW645G88Rz2IXAsGXOfTDJOYYcv+nLbrZ14YcITr07sYWh5Y6e+gN7Nnehyou8UV9PQMLsuJQ+jDTEr7D5bsZyeZ1BxCLytxfVNBjWLPWPLGhBJmQ0KvJTwLNbPjaZmOWl9/oMJxMu0y6m8E3BLlyosjhFckhRe/3orfXZf9OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111591; c=relaxed/simple;
	bh=rZo4kyY0Y76IEd7jHHFyN/7oZ08oGYKJsxlI6R/hxGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgLZwYqpa7ViqxuTxf0BYiz/biMq5n9tgTblvud0wZvQxEuP4gtOywJMwR085kh2NF/7aG4iB5opVrQFtJtxgkUCcdEREbk1OvxxcS0wGC33969dTfSBh8HVXBvVD0hww5RtHXx5QPrzM+9hUezq301ZvcSl08Iy7A2WV48w3kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE3pFWmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlRJw3zC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE3pFWmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlRJw3zC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kQtj3551408
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t9Kgo58xxN35B1PorN+OPrTr
	ld2F+horzEBlznhVNT8=; b=aE3pFWmd/suJkMvhi7LibpjTf9EAzPP+1o38X2A4
	caNxZ6+X+oSPomgRDPW1gmOze3n/o5Hzh9km5aSB2yOa9jH84mUyEamHrV5w810+
	znEbM+7mZJzzKXp6GS2Qq47IB62192fUYnBetkvXDIA6YnIp6IYMJKf6dJ+MuW3t
	cCkMHBOrO9JMj2UbKf5MQ16hV4INMwuXAc4wJRuHLfvnVaBExQVBCq8t7HmBOLKB
	pNTmO3oGIvMBAkJXqAYi3HbbOqivVkz4xeDW0IrGSEqiqNPcPqPRufX36QoS/Wzk
	EIswpg0AOYZUltbFkerekLoY+qRyfJqvsjqUE0MfK6l/OA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0n82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:26:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso1176539a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789111584; x=1789716384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9Kgo58xxN35B1PorN+OPrTrld2F+horzEBlznhVNT8=;
        b=dlRJw3zCY0lJJYHu9hLtpj2uz98uoKQ05vW9jGy93Lz6p1DpM/Zb3E1faMPG1xtNQ/
         gkSfMmFojYAqjWVFcOlQxu8XpT6BVqM3ufgoNBNL7reFn925XKL+ComHGURkIcXKqXDN
         Zg7gj8wELG4KfMN3S4VAv128pq6Uytdx1lGjbVtA7P280yyb+C5FF54oAHRFcrSUPvhS
         jpJSf0bCvPy50rcIu/mlqSMXE6WXqCObBGakchwZdSQ3VWmVSVyqZc4Vmk68newNSYr9
         MygkyYTKSoOw5WkDVyN0l2c7l+Q9ge4vQ++IwM0nx+qiHi4e9Xfv/hPk2OJCY8cxyNzG
         lT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111584; x=1789716384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9Kgo58xxN35B1PorN+OPrTrld2F+horzEBlznhVNT8=;
        b=VA7bEQU7a7GQvRu89V/84jQ/Ii2Jxplrp9vBm/Tyn0DxcbDcCujVXiowvuDEm+74Hz
         2Bt6yG9goQGYPY/W07WlhL1SAAgZxWYuLfY/ZKTiZb2H/bTT3WvfNlaIOjJnUDaIXfJt
         Tssem2sVw+f8RA0AIkZSgpIHC5YQKS+kh6PYcqT6jAD71PVJ6H0MdCcbFyk54C7vTwRJ
         2shwyxulCxyaa0JHt32q8wr1A71nihkFxpT2iIq4oPlwgocRXkYvljGtMtz/LTR2Dh7O
         NEuvxPMuJGrrTqeSjhIp9ORH8S0abHDKB98ux/8SQPDFn+nTX+EfQSdXHwG8Nm6pCf3G
         fMkg==
X-Forwarded-Encrypted: i=1; AKwUvBzmn0qOXOBEVcmA9V6HBnu2Q/3ztIf1jaLtcaVVMguWpEcjSaOzRrNk2tRKlIuR/3KH3hUvCem2YfBUeOU=@vger.kernel.org
X-Gm-Message-State: AFuF++nzg6/OVRZPEdDFzJX/YHqOhxMLZxIVKfz0VHxS2dG0Xf65P3hk
	aeN63SSrm3HboIm3lsoPKLLsv656D7T6KOIlivtzO3ykswKf8oKgAgUDoGfdUcpP3KYYGZtMh8L
	QxShrmv7cdFm8cc8B9qlGvBZQNXCc/86r89LYTtX3ZYGljHuVuil9gKskvgLsQfMQHV0=
X-Gm-Gg: AYBFou0d/PNrOUHyyawWVhVV2Y1cabR5G80Z4HC2yXmq+L31uzaF04Gdz7F2taUsvTu
	MQu/brN90kTf47ptlHwTlqLIcbv2Zr76rlUCJkGzykupmPRks344hNLZL1ObDRHRrFvKN3CWz+/
	hgmXdMwHvQdy+GjvI4/khKskhZCUCJhOWWVLsG9gb42Y7pCcs90vx7kY5bIGGYpQJcRoCR0Cand
	ZkSAFd2PP2In23RxdnDO3oSVYu56Vvkl+FbkK6DbHNgpFqe5lbvIkTRI03kFpNmcLi5HpXWmw8B
	NSH3T/M+Wm5w7ohq7wqKcMAFXVkfkFUb7s8wxtbTZrEbCGdDmZxQipoDQNI0ufRa14lcKyCvs+J
	b+8oW026drS09NYJ27JVXGL9VUiJ3qeWmxj0S9ZuW1iU=
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr5704270637.24.1789111584006;
        Fri, 11 Sep 2026 00:26:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr5704218637.24.1789111583593;
        Fri, 11 Sep 2026 00:26:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm4632504eec.16.2026.09.11.00.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:26:23 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:26:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and
 PD controller
Message-ID: <aqOtGbCUP8CsYknV@QCOM-aGQu4IUr3Y>
References: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
 <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JWF5ylWPUJ5h9l3YEWf6wPucwvnSTe-y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwMSBTYWx0ZWRfX8DlkQBLlREKa
 kyvAaGlmhvW1i70BclqCgKNHaH8S6cXrM+R7DEs/I28uLAd4wyZKFdpameBaBjOdTTnXppi3lUg
 tPurKq/gSlFttAaKxJSrTtFwTxR6ZJ4=
X-Proofpoint-GUID: JWF5ylWPUJ5h9l3YEWf6wPucwvnSTe-y
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3ad21 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F_sypk6m7XziQz7B7UwA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwMSBTYWx0ZWRfX9lxgA5uFG4Cb
 3nLge5bDWcNLMm2pKHB7At7ddAQX6//7xJfAMNWrSgcVKTGpPo0fCPXTQ5nS7hF0JLTg6uTIriy
 Zby+O4v/dWKSSkd8BXeTUXv/cpsletlgT2Adps3Yb2yIaQT6f4zkchNgfkOYw7QKh8VeI6mtSsF
 hd/svDR3C6/z7jvbWLZnIBYIOftXnjdJxqWVeR6jkUPNXjRRKxkl8GnQH9zDpII2315VUpzMGHN
 ADe3YYTy+gtaiTnhTLSdfl1dMfztdRW473DZ+KDDmgxAr6PSwt9BeXTWPBtxPjTLMjE5iDEsUcp
 lzLDbY8xlUGVAJOv5ikcACLvGa3GgmNKNZ8pGvIZcsOOw+QyCQPmQwPw4f/0igqo6Utgk1JVnwH
 e3wuo/KrLllYGWgJD8RHA/PqfqATjo+R7hBODVOnfAXLWDi9ngM6l9f9YS54seMUNHg52ho1TnC
 M1AYa0Zwkrti51WUt6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110101

On Thu, Sep 10, 2026 at 05:17:50PM +0800, Shawn Guo wrote:
> The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
> controller. It runs the Type-C state machine and the Power Delivery
> policy engine on an integrated microcontroller, and exposes only a
> status and command interface over I2C, so it is not a TCPC.
> 
> Describe the two ports as addressed connector child nodes, so that a
> board which wires up only one of them can describe just that one.
> 
> Assisted-by: LLM
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20260902045938.184221-2-shengchao.guo@oss.qualcomm.com

The link line shouldn't be there. Will resend.

Shawn

> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
