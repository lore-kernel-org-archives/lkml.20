Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603939;
	b=p7KP6pfK1LkrvJRCqtS3ISdeOJ+pcte8VfAtsnvRzXVU4m3iC3sLWUb3rpdh/I4zFqnZ
	 aXyn1StpOWv0wnVR0iYrJzxOAv+7LfLL/n4y6HV/XB77fOTA+sRoT5vbtuk0H18L3+5LN
	 OAPKlh130J83gLlfFjdX8xHh4oUPoT+orn/mT0+McqIG77pLSCJOrrqHAbUJYk++DeBJ+
	 Pf3Qh7QGNY/25tamnp3mKSAFm0JA6wcFl9UN72cWMYKQayrAubua2hJ9raBBEzyGwvQ8G
	 vXPDaiRLZU4BzvGHkbnhUR29n8D0KDuzWq7vqSqGAItJtwfb6PmPMfcDvUH1STzF9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
	b=dsQXPDzrkgFyXim2QsrRIRHXKH1KRa9d4C+/M3r8a7i2WCrKnC/mSgL0vIAdPWj1pwwf
	 a4f1EAg5899p29+CVYAb3sRjQBfGijBcOIfknZIimGlako35TVlaJB2Vk+eOxGr3M1X9L
	 5E3NI1mIOdwhXhnjh34KjT8DyYy5IsvBERkQQ1mErQi/w40xPJ3zsVZ+tZ0eKOnnBvKNy
	 Sm+bjyMqUM5SXsHtxfdjWxAxiQOaKOdaM9XZzZgYPygdL1ETBlI8+LXIwavUoOpZWfiN4
	 Z+YqLCOP3aMySan1Brly81u42p9WDV+FxMXGPfJ5ZaHNZGF9cR9bRZ0sUVzdYmBhhAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgLoo7Nm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1FHtjHj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD4606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DD4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgLoo7Nm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1FHtjHj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DOMZ2433826
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpIVie6xF9j8ExIQhEKGfRaZ
	rPU75x2Pjf04bW71EhI=; b=kgLoo7NmGPUMf79aclnVC7a+EIDKD553uM/du1vM
	C8z9NHnE0PmvA7RUiIoeAoA1VN9msGaoTz3e3JI0C97bzFgV1l9efDDOJwKHs5GN
	Wh1vHgwqEPVhr5F5O8jlzZgSVtBGzehKrIxKaXaf1Dq6IynXubHXgW3Z8N1Fc0Ga
	y6P2BlqNcQMLMmOUM6g+EmZF2nopEf3xuSEkZmwbdAMr/8jOeKiJjMCUEPfbrGo3
	WmfksX+LjCuKm9rMTTpFGYZgmwgQqqHL8ytDKI8YK6PQklT1XpQUH8m18s2gTpMu
	aCfpWCdOgKJKbjptp2ehl3Munn5TBMt9KCR7TO9fATRlWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60jma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:18:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso2886548a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793603936; x=1794208736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
        b=j1FHtjHjOqSNLuVzO4AR+CGjBnQFQk5OOVq7NAVmtK0hpIhIYwdStT6or/T4EtlBY1
         jn+3xEqKoo+O9fvVXxBHwXI6fWU1jK3Wfloo91ZrViV3V0LL2HD+nELbPbdFT4JH+2Jg
         r0dPkwWK1ywcqv4m5ivMGwzMmu7ujO0Vd2LIpDYSllKXJ3t2FJlK/1tO79JUGsh1Fwb6
         FAGtgUKoZH0CQeFEejk7X2D+TsXb1q6tlN/fOw0OsCCikF0bs4WBF2NMc0A9IwrX0MQq
         MOUQjDxT6P3/qR2SoqgbZecX8wbes3uyDGdri46waQ+6+O2R2eyThvaAdW67Led/llCt
         NzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603936; x=1794208736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpIVie6xF9j8ExIQhEKGfRaZrPU75x2Pjf04bW71EhI=;
        b=h51eTmOR1Zm0U2u+5nfbeW8bknIjJ4Sioq06kR0E7Eoo5ksx96N19mIBW88iRqsLz7
         QkB2059AIBRsAFGvn9SDkw5z68xqJW7ntuGAe1UX8pVZ10xCPpzcG8WvruxsNhEOAGAn
         DVbKjCIZpOAO46QjuPl4GAke0E+RLWnyLZNC5kHrL1sqs0eEWb+hGlwitfvoROBMMP0h
         ON73vUNU9RpinD6ykDNJCKiU33yVfSX3xqv70/XgQ4tZfTZZfgfhgkLi0pxfefKS9kd/
         3TMsBQPzd2c9Ldt2dVDHzZPDIclHd0KiUK6FXqkBcgT3QX0p2NWPJ+sR6+YxDa7G6/bm
         3jDA==
X-Forwarded-Encrypted: i=1; AKwUvBxVCL2BPhR+zVA3LDEIcVXXYaNEudVzCZ6EeBE02OlNYHuAcLjx8DyUBkZWnzAprzlny4l9Ddpy/2cV+d4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F6y1Be7+t7lZKryPQZqgSEDqSaG8cBz/zPCCTsoCG5norn3px
	tq0h5zphzidh+cCWNtXXbG+RlfRiTbvneBRAzCbacmK3THh6ptuqdeMwBKvwYlY2Gg5RNixBvNk
	zAL8mthpEpd7w8/NWFSEmSAnNHkY/TERY9vuIiRG6ivq9BJaCmjJSstDWQ1ei0O2m6uU=
X-Gm-Gg: AYBFou2eN6KCzxd7xXWZzr3Ykdnz7+zYI4JFeSlJqWEfycnXdoIj5U+yKv5ywWCQl4+
	uYbG7U70ewS+Vxndqtd3vCtX1KUb5Y6zem1zQ6W6wpKgHtCQlF9EfdNyy8Qn/xSV7lzoO1/Q2qe
	kPzHoIKFwRTYiYRwe3z3hl5/yk8obzoxnvvPWUGZwvQPo0tE6eSz4gbKMpRqv6isqj/fgsF1Exy
	rr5iLhH9mxKEgINunIg/YnJPOmAJW3LCFLXxwQ7BtmPl81DSHWI7FKR16S7teW/tMOtxNs1sQ5r
	vbz7j5myzr5CmIQLEPS5GhL9YujYU/3CAQhd6ur8uAyg1jFmwdfCmH+LDncExapoNkpWi4k8ykh
	B/t5KFhWyyfwFgSWtosGROWfxQoMuJwf3cyi7udbtOqFCA44ioZUuk6R9Cl5m6pNRRWM9mammrG
	+4rmKU9XK3rKB9PA==
X-Received: by 2002:a17:90a:d008:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ae89188f68mr7619723a91.0.1793603936059;
        Sun, 01 Nov 2026 23:18:56 -0800 (PST)
X-Received: by 2002:a17:90a:d008:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ae89188f68mr7619707a91.0.1793603935564;
        Sun, 01 Nov 2026 23:18:55 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880b1f71sm7419118a91.4.2026.11.01.23.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:18:54 -0800 (PST)
Date: Mon, 2 Nov 2026 15:18:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Message-ID: <aug5V-E2p5IvZIi4@QCOM-aGQu4IUr3Y>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
 <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
 <auf2FHHbto8lAf47@QCOM-aGQu4IUr3Y>
 <ada2ca7d-8759-4e30-b945-f8d0ca05b74f@kernel.org>
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
In-Reply-To: <ada2ca7d-8759-4e30-b945-f8d0ca05b74f@kernel.org>
X-Proofpoint-ORIG-GUID: Qb6bd1Q6mie7Y6BWmIanHTlcNfJlu8wS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfXzGhfWYPCPUvS
 t8+bM5ktKA9/YVcVRDtjsNFbbuX1NBhJsbMuUEM/6NN30qBK2wfNYE34LPZBdO4KpdF2JQQ3phb
 zNbdcrttgtVmOPopmLcMo8Dt20jP7UI=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae83961 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=L378qgYTX3ev7UouER0A:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfXzMk4hvExtSPI
 taTA/s3yuGnBIDn+jLJVlNAv5EBa3ZJb2EOl9G+Y65Fayml1OHCSTzEsDVeCAhrBBhf2nXQ5VGs
 BODMR5oeRoNPpAjQ2CIh/30BsrHU8ZM9oWO+R/rFp4jx1wK2eow4o/iiWJPgPWwBQQYVntxwJFs
 KzjUtPAnZyql+mT8yYH9ndEBe51nJe/BD5Mm9U+AuIUtU81zPToREqDeNcuwkvxWATamkDamSDv
 QbY7AP06ENKd2/QxKW79OsTwTmZF78fje7zz2u1SwZOkgSumxDS4QRj4eTgyCsNn1IJKOrUgbfs
 C/ITxuEvwuxEsqvaFg3tZ7qRCW8K3ms1K5LtbbZLSR+39lHlr2DJ9yk/e700ABCQKOB53sbC2S2
 Y9ABNxZ4YZHsQBF8l+OcMA8DHM6111+tieS7HA3Yw4hZcDl7+Gc0H1x5j0KdjEk0jEQSLQlz3W/
 pYWytEpIzm428RqUruA==
X-Proofpoint-GUID: Qb6bd1Q6mie7Y6BWmIanHTlcNfJlu8wS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020028

On Mon, Nov 02, 2026 at 08:05:04AM +0100, Krzysztof Kozlowski wrote:
> On 02/11/2026 03:31, Shawn Guo wrote:
> > On Sun, Nov 01, 2026 at 09:28:41PM +0100, Krzysztof Kozlowski wrote:
> >> On 31/10/2026 14:10, Shawn Guo wrote:
> >>> From: Nikunj Kela <quic_nkela@quicinc.com>
> >>>
> >>> Document the SA8255p SoC and its reference board: sa8255p-ride.
> >>>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> >>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>
> >> Drop. Binding cannot be tested other than build process.
> > 
> > Ok, will do. I thought dt_binding_check could be part of the test.
> 
> Since when running build commands is testing? I commented on this way
> too many times already...

It would be nice if we can update b4 to not pick up Tested-by for
binding patches, when the tag is given on a series.

Shawn
