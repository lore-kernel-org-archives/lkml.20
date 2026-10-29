Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280562;
	b=Ht9PSYQklX6mrEcejGPwixJs30fKq/cr//7xSuWqmP/7tM7MvMZQd80gvYesqZxGDCRF
	 OGldFYaKgeU4ZJeu4aXk5z+wbKn8GZd4Sm7WYaJy6ZKmpV5+BzYfM/tfyzwyoBSL2DWYX
	 KF7Wz5VzSlDRp3Vzs6QnTq16EE/kpo+j+IHUfmzZYfaVvbuTxmQEYc4FZJiLJ+iDIko/B
	 xeg/dgflJ5uKmRm4JWUVf4FCBwfeR+6TXWAW35iBLrhcjipuYSO0yJ7yEwtq6KRFVHK1M
	 DZlpUOm1m4LWFH4pgU0CxVQknK2X5H2bQzYGoUo0IxDxMHdPr7/JUvVYJqo6fox/Ibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
	b=l+V7MGZ3MlVtB06V6eiVUagZgv4H/yW3JoVhp4F/iI/ZfLagCBtCMm2Bt6XOyJKIwsfF
	 DG5hhtCCHBDij09/QKCkv4Qfopbij5J9LKrum1O1iNUBuIdK0fKjFh3tAiY+w9QlEbQzc
	 ri6tVtP4xb1KHe1uxKfNxY2c7ekjEIx7ZG3TkED04ELqofgcCueY4FSMFUL79hbESsk23
	 FCt+jmOnlzu3Eu0Zsnk+QLKJlzXDiAHjXEalgeqeuU1MbumPKXRWHUbeJB/auntkcsjTJ
	 7lvTtdqjA+QkIFX3Mj3fYKoCuCgbgQNdLqnAv8Fn1S1Va4rsabfgR30NFRWAqpiXxfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRuQK3BQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N4SQHm+V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A7B606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A7B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRuQK3BQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N4SQHm+V
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe4Mj610158
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hdNAv1DWvXXl8AhO5BI1RSsK
	l6nrZ5HKBAmEionbXos=; b=oRuQK3BQXyzkGuOzxHBHr2ppzqgCEJD9XPLxut42
	jjOCo6h0q2c2DFNDa4hevb6u7QefiUicMYsGvkBXfyyTjOxGABnJrrJ891jpvkM1
	rojqN5G8A3YjgKjV5fkK729I9ZD7ef+MYbUf0w9K6ctPZ6SVDGkpESGaoBs9rYIp
	ZkpINwDT3vaFzak0hLqAOUwc5v5cOd3Ca6qcG/2gUO6MnpjEUmId4YYINe4AzQXI
	pHCt+jOWsAMALyr4RqPIxiUwK7heHmRM63xmhSnRZqLptZWeboFoSCcM74wO+Msu
	hHqFhtghPFFPkoGlH4A8a5/8ie+noqbAaq42ZeVcEZx6/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmpatbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:29:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93e2f72bfso33256825ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280560; x=1793885360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
        b=N4SQHm+VXzeW4REvj+4AtK1iawDIxgPHVm8sDOafNEVDEyf0byi4UmWMztzXCXzhzh
         82gGwT1B1wsFVstr2rv49/Re73NO5c0cmK1cDpmTviuI2YJb/A3V2uldAl68MbAHYFBX
         9atKPq7+TrCiIcY8wjm5JTZCSdH4g+q/dF0PRvhjHVVtgVWscX35nWHTbwJP20Xzw/C1
         Mes5B4rHFPnSDoEafbb+askF7Jq2pjVhW3N0MzO5fO+gVa9A+Zv9xwdcGfsfzhciTXoD
         j22TYuLUu082Qtgm4pLQb4jpibrTVqjLq/jD7ys5wwV5Ka1w75AOfKkohOwBTvOOS3W+
         +oKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280560; x=1793885360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
        b=cp1UA1kxJ8CtnAbdwyP069awAfVCzK/LVmKeH8aEz5PKW4bJ6rmwWsCC+H9HZkMq0N
         0kcR6GaHAYzXV/oakmsLkU/Z8zmiJbhtQmmPXrY6OX50fj8NTqdpgepJITGG0gy6pD1g
         igAX+5Oq269f32SSOP7cAkt79WaZgJpRazx2o3FyCTVk/ZX5DiQQkBAMsh3Zrf02AeXb
         RNPBg3v/IR1FGlueiXTnZf5g4sY7dGo7n3DOdXgx9vDLIbsSGareiP6ZBb6o7i2RlhaZ
         IgwOn1mo606HjtWKWuEKjIhP2g5Zr4ql3s7JqS5Uy8pXx9i5j+nj2rM0NS34y5mciwre
         rgGg==
X-Forwarded-Encrypted: i=1; AKwUvBxWorRAqNT7OYZNJPmAubAy3Ib2cc8BrfkIooqmgIimgy4ijZcdNn8Mx0tKi0LkLvk8Wlah7JnqSY37VSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCezHMLaBGhQmySh9dH9MgXzTfAnN5EMQ62c2+iSIbeVNAUULD
	ws8ot3YSLPmLZr5x1HjE43/QFjVUKdGQAE4Nkn64L8+QUp0WiukhyHFQzLnQIDO3ZJ/RStREPDw
	dLfiI2/6UNHUP8IZNKCYg2UP/UpCug1aA7RqmpDeO/AXQnXLGmSy+nC6fpXiz0QuKBxg=
X-Gm-Gg: AYBFou3D1bORRr7pWrdZ2+FG4YKpJi6Q94i9E8ImKGZXkktxFZoU/P8rNj84cZ1mYPc
	7fZoQoAgY5FL6j9gDo10vFIw1du/sCL1VHEEhsU43HrIGYfkIYn1co2snbIpkBwyBJdSYfjlLeM
	4wHDGmuWeJ6Nnuj8OzxpD66ZHq4SuTe2c057xQBb+lbSZut7AtUbgNueLvpCQp8d23bpaLGLeVM
	L4cPKrVt8k4d0SIBw/3JRt+YlxMav4V+PmLZrEXwd/UALB+zswCvD1NnDnRytPERoHsY9wKQjfA
	0gv+7S97DSg8Avlw3ybi6nPboh6E+eJF31k6Pbp1kFTIc8ALHv4aujNLemQQI7XSE7jhkQh7PiZ
	CM7+JgNbf8xKqBvic1DN7Q/9OBYsOUZaVNLa7KyuaEUHzQ6CvBTmqtPmmzrne5kkDLERz4RTzgv
	p0k4gxKZ2FbHI5IrY=
X-Received: by 2002:a17:902:e886:b0:2eb:1ef1:f055 with SMTP id d9443c01a7336-2eb1ef1fca0mr22398995ad.46.1793280559705;
        Thu, 29 Oct 2026 06:29:19 -0700 (PDT)
X-Received: by 2002:a17:902:e886:b0:2eb:1ef1:f055 with SMTP id d9443c01a7336-2eb1ef1fca0mr22398775ad.46.1793280559240;
        Thu, 29 Oct 2026 06:29:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6453e90sm34035495ad.1.2026.10.29.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:29:18 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:29:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <auNKJ88kK1_QTPTi@QCOM-aGQu4IUr3Y>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
 <2026102919-confound-remnant-f133@gregkh>
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
In-Reply-To: <2026102919-confound-remnant-f133@gregkh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfXzRTd4P/CNXLB
 8HGJZq32vEDGbiACRigZdAbzlkbeka+xo+LoPWx9KJhj3xSiIeo34Cdyl5/YoZYQuiKI7EMVpWz
 idPg4PNHAN5+5HFxICpNcvCbOGB0/qgjLCKnpBzZ68RrDlvVG0ILD6W2V2hE5LTa36xoeBofmex
 nlqlDjB9yXleRaGUlq+Mmh4VIqitJ6zZYmKSWXVzgWIGA3iuOIVvPf6XlvPPbftviRTeHpMh0EH
 qNAR7r/gbW4ino/4X+w9oq80XOY/3yqbw31RhrEKypnCDrsbZwNRHcmKM+1JNHbP4EHM1IS/U7J
 Dv+gDkbXYnJGwtQyzyxDVVk4Ibq6P6UMl51h9ZUkZKOa1XEcp53enposq7Id8SNaczIWqFql1QW
 b98KSgHifytXn4Z0R5QJngPlrJIOInjC7E9Mk4IpVW2j9YQCOfB4Ayn2hM5viLjgF4B5oHqdME+
 baI+eKn6LLzbsqHXURg==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae34a30 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MGbNdRo_2CZBHlq_cxEA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX9xq4B1XX0y/4
 QcwR1Yjfqb95saJE5DL+PQJDriLUvsOsrmiRMcBZRwM7tORGavgIkrfiz4WqQuHd9rb3guchfzV
 jmrO4r4QL9oy39ffWiAJYFVkilBCHiU=
X-Proofpoint-GUID: tPSIh9weF8cQimwOGul2HhzDJsYQaY78
X-Proofpoint-ORIG-GUID: tPSIh9weF8cQimwOGul2HhzDJsYQaY78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290052

On Thu, Oct 29, 2026 at 11:14:27AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Oct 29, 2026 at 05:55:41PM +0800, Shawn Guo wrote:
> > From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
> > 
> > commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> > commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.
> 
> Huh?

Hi Greg,

These two commits landed on upstream as a series [1], which doesn't
apply to 7.3.y, due to missing prerequisite changes below.

  wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
  wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
  wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
  wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
  wifi: ath12k: move dp_profile_params to dp.h

So I adapted them into one backporting commit. I'm open to suggestions
how this should be handled.

Shawn

[1] https://lore.kernel.org/all/20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com/
