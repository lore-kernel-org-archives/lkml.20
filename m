Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30711379EF5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658968; cv=none; b=DYn9YH9/+3wt9BRl8jWCkOjx3faMWzT6FwmGAPY5IYl/GWvihXZf3y+XO2o1DWQcmKNhAKki9h/wsdEGLRH6T+nt7LWvIt4aIRxUigJh9tSAMpxrhpl3z95weksyAwxw+HY+lxJPAl0QgxMcePi9Y7Zwh7nzbXQIb5oSgoSVMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658968; c=relaxed/simple;
	bh=TlMRqQ6L0+W+LjZ003OtT0C1xwK4kdjOBRFHg4mzq5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdwV7+W1WeUV/v9V1Bfx8nNPoMS8dU50jhlTvOnNNgSXhGHcgCQhxVcJGZ3/kfPaHICdrgoUN92CzfveJiIDgpC2mYSVBrB31PddN/MY5EZSvJ+Uv+X00K65lln6XToxwhvVX1sfezFzfozVwFSXeGNSjGfInyO+mtM48/1P6rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okrG+hUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPY2Gki1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okrG+hUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPY2Gki1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDirDI1137898
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hk36GFpcKUAtTar/b083caQq
	YINIKpMqKrsbZbYUlBk=; b=okrG+hUEVUELGSxU2Q7Gy0F0NIDgLQdkasDpPTPv
	/5PrsfZv/no8tWk5cA81d56Ckf4IbRnjg+JBwaoOh3O+F6y/mqo5KfTIy/kNx/WN
	nUPfkg/cYuaZCQdbwrEdX/6Rc9/stSWbyrGgRC1ISGIvVgYmNlMLdWLUrkSYDZ3j
	eucRk4qbpco0a4yP9IYtDVMfcV9RpS35k8kDsTsnjdcdUGQHp9LU0Zn0KQifjvbj
	gS1zx9+IKGpbZY4H07Q3qdKaO/nsYdQz7pOIw04TZSv/Y4MM1jBgrXet/aBs14wC
	rgKjZL7TLostWY87EuGbPRj8/AV/9oIlshc3blyAkcE9Vw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2vsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:29:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so178199085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658959; x=1790263759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=gPY2Gki1IqwIN7lJcbyQFuHOHZDMJDzjXH0gao01KFLnoxzcdn+uItHbkEB1AzpjLE
         HH64NQKX5fi5kWRA7Ao/QqDKl53OhrWKodN/Z2azWtuXiJWhF2jyihXjSw/XJoVGdTFG
         nq3RVptG9CLlYIN1iVXxWIuo0SJBG+nDzIv1bm00pBFvIkw51UfX5lHAC2UYrWLGR0YO
         uxemFZntJqk1a2lAlxOC4cvnoLgbyBqCjbPjH+bKixf27spj0pgJzubEww7wfPjGIoW4
         ZteSBxbYwo5q1kmKGrNxXxteyuRimbL+utu80Upi0n9/I51PgB86NY29TNFKWv6oWGBN
         QTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658959; x=1790263759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=NTWGh2ZEBuAtaeb3szkwkl8pAYiL5XO4GE7Hax/UzXXYMrBHgco9yIdlB5gjzVtDKi
         avCUu2alN9+ibG2fcyTUa4wzAoTFDZ6B7DooJkB8H1dRMFMGJcHyVMMS9RxAXVB9iBS+
         pbcso8ZvHEnwSp4erdiSHICfaR+tYTNDMvYhhwmRujJ3V+beE9fSzlIX8FrOfvXURdbP
         fa9oDj7er8kouvMyUY4V2Bot2U+tl1BkhWFRgFa6wUBOvBAhHFyR/mpfq7KDRKs/5+ef
         hrl9yyY1qvm+q+4PDhSWpkK9PAGxE1V+4pP8v6gdtbFnm1KKV//Oqs1TWk4eeK/j8jRd
         8uaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnLSYqNtoz9aRkAmmhJl4LPVCf8ume2Z1VH0Tlo7P5aSl4gFUkhwO3rbUOmY/lBtJqezWLlmufC1YLR6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n45n1E2SlDsoT8dQaucJH2UDFqi5Evpu5ueq54X1alJKIBYriB
	g7QOIIafZ4oqgi+7Tc1UqRveQMW+H1wa2gn2SMYMSjTGn9F6hju8e6sY2ptyVj/CWSGME6fMS8e
	dIFqhZFuGebU9DfMjzMdw/Cc2zFREO436BmQg8a+be+uEVgn5hoLWZiDegVx0etCkHms=
X-Gm-Gg: AYBFou1KshhSG+s0cb+WRjI09lZAQ2soZDgbVNYX12Gv2wrPnEioJbd6MaLEhvLdNTP
	4fEpoGhO5j2M8nMMJujHuuRCYOJjb0q3dIXPnsuZ/OBbPEqW7RvVG3Nzj48EqL3pkLMp/5VDIkU
	jsYkRje4NMfdyTCfJ5zDfv/z/yVHYNycY80ri/7FScfJIBtyuFsOTK0wnePRhT5Ppdnq15rD9l3
	0/QHjW+0USYD9gmbKDw5cTYBsBDvTJpEI/j4ytqya4acAnUAv1pV2+4p+vl9y4tmfC0RFLLU2Lm
	SCwULTT6OMhDcILOYlvPJ+FwvpwhMM5ZTBvbFGq5Vswil6lCQEn4FWHPFAP+civYnxQ21ZNFCWC
	thrNxtOW3vOwk2Q==
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277600485a.0.1789658958649;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277595185a.0.1789658958112;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm68837795e9.1.2026.09.17.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:29:17 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:29:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
Message-ID: <z4usj632ovj2cadfgp2zvwue6vuvqhifzgjb2uvfikitxksdvk@4k7xnyojsa7e>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BDxN1XL6s3tgj-yRFQo7URaWBJoGZ42e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX+4SGFFpQQK9g
 wOEY795u/GOmflr5YsX48gFnpcdgOWtRCmouXgfTN0G1q9tKvCTOM5sOvFubhUgMai8CnxhcohO
 BFBS6l/A0BWLFLDDb4HRMu8Du4Jr8cAdM25IyJt7FbBSiSEp6T8eD+zXjlc+1q8UUZFbrm9mD9j
 7gmvaKiZkr8C5Leplp6CrqWoFfHuTHh0uUFjl5pU5p2skehoEkS1LAse4ePodL2PAlZQwYBN3Pq
 76yAhHaZu4hdl2ARyHMcPiFL2NqYDAozgN9MCEZFlh/tXr8Hkmvz2d56PKEZVzMfXb9QEEvayEE
 aa28+vj1JT6e/ztNyXbmb9WOFKU2Mr15WO6+9bZP2+LhjYeAXfiXpwd+AinroWNhov9TbKigSRj
 IB6p/86Epi+IztRmUIVC5QYjHM0LDbhErtFcc1JQrqnvbPNJddzuCyMGAqvZki/KbAF0HWOBAeJ
 7FLGIQnrTD0ARCSq3cg==
X-Proofpoint-GUID: BDxN1XL6s3tgj-yRFQo7URaWBJoGZ42e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX+WSIrjJX69o3
 5PoZbpAFnTkGax2lJ+RGJpbN2nXXUPEgB2bF3LBHx8LKPMkAJDKgD5rfxEaymxSRdNQo2yjsPXo
 YZz6GbesA/s0aL6k6P5bdchEz+MHRm8=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac074f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170220

On 26-09-17 17:11:03, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
