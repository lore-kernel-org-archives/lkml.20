Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAE54DAFB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653324; cv=none; b=GwmJpQ1hVJFtRLAzjjhc+KgGaoVtWnPuKu2WUhEa4DDIt0NMdSE+6kFIQ4odVKmF790Hbh5xhek5IBKs/PtNmNygVcT90eKWyLqjPsc5iN3QQYiIgeFQ6+KwbDbr6It506pNUeLjq18IulfsdzpcnqD3mjImBof0wED0nACXzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653324; c=relaxed/simple;
	bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dSdFOkoi2fNIwmJ3rP7kFpwAqH5zuheVFboQCs3/lMByYS3x6p1QASWHkoH/vtfLkJfd0qYKKS3v2gj2oexScfAybmK2rele/4/K+rXzLcDrB6u7xLmetEGR0h3pY6MDA/VcBxT1cAMbwlhU4cp0pGHdwo7e9cWi/zxOdmYBNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8ac57Jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Reb+1Udo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8ac57Jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Reb+1Udo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDkHt71714782
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=; b=d8ac57JvkjcF54Yd
	2ivhXqRcpnFbhX/acgkvMWhvab8FzZfMcpDcKeGH6k0YLhncwk+vZsmwnFDHycXj
	au12eclPKbBlHYpBxbgPhimHzv22QE89X3FSHRWZwg29Ol1mnmTqIRrtGLazTr9V
	pD9TbiESQp9HkhK/qdZ27cAqKJaVpdrhOHhkLun4HSECE01vjLiHJXz+GwazZ7Cq
	nihkHh5fXeEzArc9LrN4FOO59fyC5w4UM4S3ImpMh/X7aThfMLtiJpu6NvlpqYbF
	0fARxvfK61d1+NTR1Jtck9erM3CyL7vN4mBZ5fL6ewn7YMHPsb7pxw0KeHoAMex2
	M17KWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w9d6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:55:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so1421622a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789653313; x=1790258113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
        b=Reb+1UdoIuYU125ckbNUgp3P8VH2ZvCGt4faxZ5dirr2miYByueP2GGmgml4OuZvNg
         JQX8LmIxVrAwJ+1LFURLTJsX5oYrqhzMK+MyRN3auxLAipQJ6v7qPfeU8VxnsxtcC/mq
         c6ou1bl/pLJr4fhG3/+F54psZyXGpr0vkIN5HvR4p1qCm69I7d05vp+BikSaOcDYuwV8
         PyVqeDi7KOvFgcDkXKMiuxyh66gzVAFL7ky59E8uZ714IJ1P8i+ZiQO8jOtmL5+nb1h9
         S7yNmGrZzygFMp9sTp5o8rn9FoUqbDqWOWKXzGxNkFK9fY+AHh9k1c783BTdTrBB8DNN
         Rj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653313; x=1790258113;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0bgiWaUA6YETVngXrhL1+pIiEs+bE+wPZfJodolhEQ=;
        b=oZnsGn3kJCC7KxFzhVKWjvJisWoCdStdAFmqEjVLuYF8Ted6ePb+Sw7HF9QiSHHhEt
         Amsg8DEQUBUELN11CeVc9JBtwU9SIJ2FADE6HQPKiS071cyYaiTW7n7Dy6THPwlPpEba
         3yclAkoWPwYXn7ylrv55Z35DIvA3yNie+7wRwNHp5HXt/+xnCusfHNqnrp/9jLpwP8gn
         Jbm6p3WEphYInQAOZuWeJSnmdkGcrozzr6YjIIn2SSPMtW3P2IxFmkVVGHgvI+aBJ2fr
         FXtdCYJpF1ZCm1JWjnpHxwuo7NFSBYPTT2NgL/0sdvS0691oIHZjEXMyB3gMh3QInf1e
         V5MQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/+viB9evEfuKiEurEQN4ShaGC6y+PWXH+pHEszpgJdsg9nOUC+bE8X4LHx+vJmKKOa+IikKOaO8rXY7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mxXxRKbbrbcEyEwX3YjW1okU/HVEx/g2jqs1po7cxH7g1WgRDp
	gNlKe6vsZq5TbuM/Gi1BafuC/I3gm0yBcCjbAVypuNgxDZCkskKv1+39erLJ/V67it00f+sYmNh
	NKVHYTLYwqQflHKKNqriE/u2kv9EuSWOqxxbgzGWEA0xQ1OqdPLCLQzYLKf1+VdgQzR0=
X-Gm-Gg: AYBFou3qSJzM3VXVbs+zZUf3Uy7SK50Q5gDOi9LFaFRIMT1k0ckway0dZpXEEG4TuqY
	YRyDrRJdyZrBe1XPOrkb4L/9YNbAp1nnMvSML8sUnmyjH3bvwFp2QeRxoVwknQGqJUwQdsXUmGg
	xPKWzrT6nZF2HjD3Be2uCkAFks7XImHlg8r7GqAtvD+Vo4dy2h6iENJwQVCROJNzaJbqk278lDI
	WBADb0lw/QzQcHR5n1ie2bh8hg45p359i5vepj6pDchoIu23gvGB34BObkEeqQ/hnlz//e2Eo36
	bZzqHyOJiH0pkT/N0/JIlt1D+3ed+wu43Pxi1BIP2UDyq/SM7j8QtwJmpK4eZpnzpeTtFRXGqLB
	nGU4YlXYY01dUT7xh+A==
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr23561379a91.20.1789653313118;
        Thu, 17 Sep 2026 06:55:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr23561269a91.20.1789653312596;
        Thu, 17 Sep 2026 06:55:12 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d771e5sm14083961c88.15.2026.09.17.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:55:12 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Thu, 17 Sep 2026 19:25:09 +0530
Message-Id: <20260917135509.2760476-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dfcdf1bd-540c-4294-9e41-1dfd9ec16be4@oss.qualcomm.com>
References: <20260831-heartbeat-v7-next-20260828-v7-0-e3ffeac46a51@oss.qualcomm.com> <20260831-heartbeat-v7-next-20260828-v7-2-e3ffeac46a51@oss.qualcomm.com> <dfcdf1bd-540c-4294-9e41-1dfd9ec16be4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE5NiBTYWx0ZWRfX7dvXnsHPc56T
 lj0oah0aJQx7nHTOsJ+lgvj+ErMW7UsYTSxzZ8D74kcHxfO6bsigBPQnDDHn161oi1QPe9qWm+r
 DUBrWHSx7aFTkCd4qG8Y1CEToHrX1MwllWYOzqUcaCsQQmEpz+V0PAqcHXzDiMh+sF3QZgDtt4V
 JzieWS7pYEHLEvOHyaSEFPv+NVWSlrPx+Z9v4GuxZdDlwY8FcITi1mTfSvWce3kC630W07EnUAJ
 zso9BQo3Wo1OIsQDZnx6GAV6IHVjJDNi4jRiUDp6MdNYFDGd2cKVmg7mTX3jMGcI+IH4DbQ5nc0
 7czRj/ludw+ywQdhxn4AEKxXSwA2GXASnyX/GThK5zxo4g2bj6cQVL062LCNpMPmKxWBAlovU46
 5UoZkVwkwcaVltNdwhiLfH8IcyST8lz6O4veBNjt2l3Y2orabmV1B7mRgMHIgTx16rIn4rDX48e
 zXCPM//WXnAaF8DN2nA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE5NiBTYWx0ZWRfX7Zg+hJ3TUbKz
 pvs67cjn4028eXFEL9iBYTG1WWDwCkXJYBHQB3PPzlrJno+M7FAZjos0P03c7ctPTXUdkYfRZgK
 Tz2dDFSimULMfmAys7fxUrQIOX0x/u0=
X-Proofpoint-GUID: 0y7PKaChP7wgwNRZIIjWda0rdC89o0Mf
X-Proofpoint-ORIG-GUID: 0y7PKaChP7wgwNRZIIjWda0rdC89o0Mf
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabf142 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=1oU9jGvioK67i4IjZRMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170196

On Tue, Sep 08, 2026 at 09:29:27PM +0100, Srinivas Kandagatla wrote:
> Does these two registers need to be written on every prepare?
>
> if we need to program just once then we can just use clk_regmap_gate_ops
> which will implement pretty much the same driver.

They only need to be programmed once. I will move the counter and delay
programming to probe and use the qcom simple regmap gate ops for the
enable bit in the next revision.

> This check will never fail as the device gets only probed if compatible
> matches.

Ack, I will drop the unnecessary NULL check.

Thanks,
Sarath
