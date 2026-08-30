Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC36C346ADC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093118; cv=none; b=uTA0bpiHEoViFHDOjTYG1WNyxe8/lgpC2SDVQkFuvAR4Ke9WItGc6RWbwa4t3IonuBMppwcA1B3LtcoQ7+pxW/C3DpnEMH9r6Dh5CYSxoD2Tu3nuyVv+oASkAADb940b1XtwbLiZAWsPb/QWSQpU7eV8593EwCyR+ey6pAWK/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093118; c=relaxed/simple;
	bh=rXr6ALkiHMHf713Iew4k9Nwjfd2L6V40hSe8JbjfnkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZLKdYKPK9Rd/E45APf8wFGJXS9syU8lO4Lr8zh/N5h8ycYnrFejWlJr8lKTWKlRzP9GQQHqkjNhGsF43Lggs6AbOK6xpiF1ptYrCT3sVx7U0J4pRxJi75NAFTCYeLVVa99qkSnueT8MH4PrFxuQ89W4TqmESk8XcmSYSYEsj7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9HvTas0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GC1osOw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9HvTas0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GC1osOw5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7xTH346868
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=87UiTHIpsbJI0MEwi3jZC7kB
	bzVbhdVpOgM75F6ZNAU=; b=Y9HvTas0eG2nUXeLARoIJXIZRH2ESGSZyfFXyDxA
	U9x9Rzrunb4t4jbR6OBKAMifmIUW8DnAtODR4+t7REj8d585QvhTKTEFrN0dRUb9
	6K4nPKNZAvi9JInF7/4Dsy0p1iRF02KYVotVW1AWVqi9AIXzp/OZlaLei9uaxV0P
	knjOmCQHllHvciBvP8GH3BARzr2HKothl5P5kRuJhiaRf/8Ec4CUpPxWL3BNlxqg
	/5ZAi+yUfjileGFMZBVJ+Z/V5vzmxQosN75Vw+owa1dR49L0z1n0wSCHkUx6xINe
	hs4yFnTQVVDIWcEeU/Bd7YBxjJ1AkmXKsz0FDBFs4WU+HA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwayty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:31:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so52387901cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788093115; x=1788697915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87UiTHIpsbJI0MEwi3jZC7kBbzVbhdVpOgM75F6ZNAU=;
        b=GC1osOw5TmSNyyv4QAwvI7ctbdZM0PM0U6HZ4w4r6xRkQgpEXDyPXb54+Ar5kFrv2n
         mVaS1CiaALHXknMT4bOPLx//xFHFvVHV3cfGziCoNCqWHt2t0s64E3LbfHG//taIToD5
         Wq2SkTpjASlLxHnz94jzSQ/NPVbyrSH+wSCZ2mMNb26V9iiRKS5Xq7K71KG7HzuOE721
         urq1Z5YT/VvnAwQDzt8uhyDdA1pjslCzM2pDFla4Ej7V82J53fvH9xuoSZrmnq7390UX
         gdRdLF0ZWkM6YFjJpb1euzsynNp+RpkkVuzGhgA5lwBa9P+jXvaUSM4Fm21y/VLD/wsw
         Aw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788093115; x=1788697915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87UiTHIpsbJI0MEwi3jZC7kBbzVbhdVpOgM75F6ZNAU=;
        b=XjcVyBAmEa3o879WhWf32Y3XV64wSQtxgx3zw0HFdd91s68EjzBzuQn4I9f6N//SgR
         2d4x4L9jzpPq3ZXNX1en66gmoMJ6DrdHesVoZZBJDv+d/x8fLwWX8qN+QSeL+1Z9pVLf
         7+OhOce+dHbMKzqoIhXrck0QCoV/0RhEVBxNTYACpcWHgVRSwqTfFpqp8Pqv7G3SJTxU
         7nmcUBTf+tBt/Xn9yIkizFqhZhmvY6xP9Jc+UkLRtTKFgR+d91RHhlQ9MtJi6n8lYnwX
         y1fvPJ3023Fg83v8HRouLjnAWspnTdeVualeK3TTjL9U7S+TJKR6gqeswbRTNqHoF3lw
         Z6WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8fhPQRvsHvNjHeRyzOSOEFLkkry73Np9JeDU9tWJVuQI2DLwCExnh2MSSlaWaGamCjkJ/9WQ8quknU4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l7kDWmV2okuJDHqRo0ig97SAHsahc8OWepokdt57phr7OHBa9S
	FnS9/vRa7gczCERNMpru3uP/XPNdBECtjy+YfyC4/0UBmH/Z2e7cBSgrD1v7Xf8/UFn1JRVWq7W
	kwTAgIYMmVSr0HnBAm4o6IlAjekV3A0Eq3kkYCwDNpOE2J7lTOvikv/QVlUXZvS7M2SE=
X-Gm-Gg: AR+sD10WUdX344daDV/oCIesl9teFnNDnoRpgnKpnjYjbgjwYONk2Bc4cJF4KXVi4Zv
	zoZ4eEPSoWCGYmGg2wsVrvC4e/bSrDtYoexpqvteNzAQ82PaT6cFC+CBL3i6jzX6+0jCpN9N1E6
	A+s4D+CRTFClI+lTNxF1bxnowmrofjfoP9R2sBOoLrwy1FHnLqcYSCd6zPO69yIevs4hBO8TTRG
	w9jmF3fWDNrslZkarTBnZ2MSSg+0M74RtDETJMw1p+HSn3g/e8ZfeWSKrCjm8Ia6S0USuQs3YSq
	vhe+wWni09TbgagyPVy79EEk8K09YBXRZpXgd9Pc4SClZAhVW4oXdjVI/AmD3YpstOmSH2zl17g
	i58TOtrtQSbWOCQ==
X-Received: by 2002:a05:622a:581b:b0:52f:b77a:fdb4 with SMTP id d75a77b69052e-5300b74845bmr22446461cf.2.1788093114921;
        Sun, 30 Aug 2026 05:31:54 -0700 (PDT)
X-Received: by 2002:a05:622a:581b:b0:52f:b77a:fdb4 with SMTP id d75a77b69052e-5300b74845bmr22445931cf.2.1788093114428;
        Sun, 30 Aug 2026 05:31:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm91156865e9.3.2026.08.30.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:31:53 -0700 (PDT)
Date: Sun, 30 Aug 2026 15:31:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop deprecated qcom,bus-id from SPMI
 nodes
Message-ID: <3sjdjyd6xgy6il6dsmhd5uak4fms3sh6ltk4y6abvr6gh7gcsx@sqeodm4js5wq>
References: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830122633.203250-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 2NMHpmJf-NQrLZZPsi1R48tBHcGtZQGO
X-Proofpoint-ORIG-GUID: 2NMHpmJf-NQrLZZPsi1R48tBHcGtZQGO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX3Fc/ezrNJFLC
 YRExoIUT1JYQvZxI9OWprngkbCpunmxjt6SvKBkUXkGx2QgkNzqVs9l0WsrnuueKLlJ23hwuiaR
 XEqbLe8fXkt09y2lGS6XByllqk9JHvA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDEwNiBTYWx0ZWRfX1smte5g8pjBI
 ieIuVHsH1woQDyjems9/xxepZf4RADVK4uKj2XUoQS3lNvBmTWweK0m8lp14AT9Bvyo7xUmWgqz
 kQ4dZHLoJZB7W3eMe7ZnaQwpP1dgB1xUxGnCW5wRx3Bf4mbNNRmw+PAq7BYau1ituIFiWY7feR1
 zZnKiwBopPxxlNk28V/A1xPJUXZxEREO5mBqXOdYRCTWCfe5bydUfE9SKEnTqZoBPQ5zPmYUbnM
 EzAYZWtZV9145Ofc2ytZgBp8Da1H8sTeqVJ4EJNXEvM6r0BES/f08Hstuhr80uJnMzf0SIDfGBK
 ejiMrAuqu/bjbrP7dNENZfY8XheWf8qzzELBFpv1xOkFY3SppqqzGoAKi47at1VQQNLIARFdnG4
 GKVgXoWJcJOUaxEE/yBN6KQU8Bw3aAOGXD+UeRicy5dzIjSz8CZaOurYtHitjqmpQBkJtWAjAyZ
 Msccu+6/37y3m6zuXaA==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a9422bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ptejb-WZcwQgoGJDpb0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300106

On 26-08-30 20:26:33, Shawn Guo wrote:
> The qcom,bus-id property was deprecated by commit 345fbbca3f76
> ("dt-bindings: spmi: Deprecate qcom,bus-id"). The property is not
> referenced anywhere in the spmi-pmic-arb driver, so the value has
> no effect at all.
> 
> Drop it from the remaining users to avoid spreading.  No functional
> change intended.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
