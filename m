Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469160;
	b=47nyBytiLw1Sk6xesF7JKT8Az3UB6uAAccCqmvcYbhc5vqxytK1k/ySRfpp3d57A3t5t
	 Ig54l3ecL7c2275QoJhGJLuB/7ybghiRiz/cOXi1BWXfG/qWjsfoBf2gggypagYoIBTSe
	 gfK2eN7oha14pqzCO8UU7q2IfHDpX1kfZBoX+dUwh2BbXeRfI4w43KzD8CJtM888XHgwX
	 WdMKM3lG7xr/HF5oG8zv0gsN7reDxnSBlo350SGNlBoB3VfBKnYu10MYa8OV622VDDxzt
	 hbUYOqvadDK7CIAXQ+R5ZCz/i8ogAoT3utXy9sdgvhFuIHj0BZjSfPb4sXK5CC/KsPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ROwj3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=;
	b=qHvE5F9JbZHsZKNNdkZqxo9wj0tk2M5SCYFBSOJB463Nt4ua7nr/WanixfCdWPYbiOT9
	 7gWwH3vnUj2MyU0w7emFAexwwBjwR8G+eQuqgJyTth6YSPySTR2CYb4hn/9ZYVIKSZD7b
	 YGvGK6ttPm9A+B1G3E5FLjGiNcvWLP10q2TG6tThkXvQw1CwaSpZvIlXvjZFgJ/JJUkpa
	 tHozPK9JB8EM/7TMMofwAToKPvmZF0f5oEztUpMRcQKRy1NzM2N/XmYbLFS1aads1GcPx
	 OzU15MfnC19/1ngAwsC9W2KfssMIe5sejCp/AG433uDUuV85FP78yC3CWq5e3p3t3kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="qkCp/46B";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=q6kxp+8H;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8A606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A8A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=qkCp/46B;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=q6kxp+8H
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDjme0084653
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ROwj
	3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=; b=qkCp/46BCbH/3caJFFuA
	BlnNlJICBKE02t0EV/Yl+Mf7VV9idaFusWRBluq2zCneN9cFuYDcUqf/l31dOHFz
	iQE/bzebwLC0BQlLbQFOhaGuXCSXB9ohJ+JrZhC3uP0k5aAlGo04caSUWLizbGaD
	Q8fyoMn/BtmmRGD76UAo0PUtJ6TOiHx5Ym7NhY0x+SFdXqbKcsz67KGCd+fZ9VEt
	0BfGicaIcuW0A06wOcyT3GRe2sXfrWAVc1vzKBHPy5ZgGVEYhfv99FHBHwW/CcLq
	ncYCO25VgOnxXlWsafpBOv2cliC4TAu2kei/Vw+CCZpk+X8ivtNyQX97QTFnLSgT
	4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn9wqasmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:52:39 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so356582885a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793469158; x=1794073958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROwj3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=;
        b=q6kxp+8HWrbaFVA4I82oIyiGLIIZbcQk0+A2o4GDRXAiCu+3rv09hZbfO/8+wpFqd8
         c8q+elHb/wc566gDkASvJRv741Vu84QxAlj85WjeAbZ6XFmsdvAtUXpuB5GJpRUwz2hi
         0M1Ng4waIrfA6n8qTR0BbQuIYa+nJpRfIvMapY7ju2gC3hFayCRIFtyIZQeruKECvH4p
         bI96KZpcRf+S4dOGXffLqcHfGlZQsyKx7/t8+qKVeM2wvUAt9QdXCIW8fjisPgt1hXC5
         y418FSGwngUVtPoYmul6w3UEKD9q9BI/uVAo6sNMYkYk5CDTO6UkFeyUi7Dp1fTEjtJa
         hcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469158; x=1794073958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROwj3Rexs8Y9gllQWi0CYRPzJsmyOmh+Ba5Jprxs8nY=;
        b=zyWAVsPkCNQR6LSlNom8p3Hl6Ztc27clz9wAvRO3CnhN0t5KsCV/b6j5N6K6aCfU7I
         EDQ/qylyElVt2dCzqmGLgs6+3+6kVoA6KOMH9rJyrr0TXAassDDCdjlZN/99qOZn4/f/
         tSst1XF3iD2a06GdDqRU9GuOzq8Ba2CKUf0gr9V1IUedoQrXNg1STtu7oqR66TlkA+Rh
         l4MnitiB8xWUVL1bFbMi1zn9WPfDc20VfDB5WiQ6HaJb1zuOzW2op7WymZbY2Y5z7WX7
         duMWvjHjB62vGvKiD+6RrP3e9qm03MSeaBK0aA5gWGAOVuihx8JUK2N5pJk8nEwviY0z
         Fnvw==
X-Forwarded-Encrypted: i=1; AKwUvBwbV0sYHkYgRmiGphLdF8a71A8gdHQtM2ooO+a+pk+kqeJumZIfIMdmwuJfrUV7/XMP8vHOmDNuLuqG4bI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF2iQ92H0MXxvsI24vz6BzXPYaQgutFWDBiG6H7fEGlqyePp1b
	uANMmtuXjkG8u78zb9ru5vsI8whuX5idAOOsaWrKZUww6xlnOtnn5QVmwczkJ+HjQDSXsDmVmus
	EgE9aqqJX5uPDHdr19sA9aGRdqGzQbNCN9zamrKtPlQDc1/+Mt+VzN0YkwUoWNH2RNuoCiQ==
X-Gm-Gg: AYBFou3898/U/HrU1v5ZWGkhjpZs6bTiKmmm0tD0Cpssk5pJVpZWBWBrFOHMRCY95TB
	KOI916d9a6rR4irN69VqmhJ89yZW2PEzQgYD53XIdiHx3C4N7bLN6sw8ewEHiruyRYLTZCFVxLK
	cB4wSd220sjsnH6o1M0UCvVRGZ6rbADHeKeCRxTgRVvdoNwR6OmQawSV8Z5Vnb63IxaYngjVfa2
	+2J2HST9vte5NWPjoRtdMmLJ3t2yNr1Tt6Qt4TFZAWaS32iMVB9XN/aDxpx/V2TQqkUk8QYVhzd
	Y6r5P67Z1NmkYfOfGkWXgu2I6CEqSMQzW17nMXUU71pI2EAZHWt5AG/Q8qYTYpcU+fAGKkHKHVM
	VfO/fHfDPPY0HsSilDVLtJGN3V8MnZQFIrAqyQt/jbLSlPzXolFrzYsFHkw==
X-Received: by 2002:a05:620a:440b:b0:93e:c12c:f127 with SMTP id af79cd13be357-9442187b1cemr848579985a.83.1793469158691;
        Sat, 31 Oct 2026 10:52:38 -0700 (PDT)
X-Received: by 2002:a05:620a:440b:b0:93e:c12c:f127 with SMTP id af79cd13be357-9442187b1cemr848577285a.83.1793469158126;
        Sat, 31 Oct 2026 10:52:38 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm249158315e9.11.2026.10.31.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:52:37 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 13:52:08 -0400
Subject: [PATCH 1/2] platform/raspberrypi: vchiq: pass FOLL_WRITE to
 pin_user_pages_fast()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-vchiq-unpin-dirty-v1-1-632d3f1281e0@columbia.edu>
References: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
In-Reply-To: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793469152; l=1086;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=764Onyu+ULetDc0aDFVUsgf6G2JQGNpiKKz83VozlGA=;
 b=d+Aavx9jgZQmcn0Fc9zP9OeBSSQKOcCNxLSftJiDc77vgq/4fndx9V0ZAUcCyvkSwTV/LT+vI
 soS88tO8T0sA4kpFKpxWObAIRYb/3qiKPqgCkO7vduO28udqi2XSQpj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=YpWa1IYX c=1 sm=1 tr=0 ts=6ae62ae7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=qauuUkPFoE-8jCmVUdAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfXzmcXx/fCzq42
 KWdcvfD8v9l5BeUVoWXLOS1w+01nCURZRjSUHZhz1R7iN45oWFlIBEkrWuoe957ECuZbVRDgLem
 Z7iQtUAJ0/zN8F5c9YIA09BG+pjPnLJm1n4NHJK9rAW5/Oc1INum
X-Proofpoint-GUID: ct9XPukfAvpPiKJU-DcUWkZpBhRzmxP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX4OV3PIQDMCkI
 Co6WUNX13h8DFk/ioYGmIQA6B6Fw5AiygYLEb8U6r4LBEXRdiQ6w8W+B4XBCme527qn9MxFreoP
 /4pDxLIIKBkA9wUa4u7cA9ymiRxbEhDD01UtOnxokAEWB2MntWKxF9TQlTTnOD8ctxu9I5Ll1PQ
 pyyT+fo8z0y1EgaB0BbZ2gjQf/0KY2s2YXnppwO8ZSDHPLk5dA57plTo3E5FcaP0rjruNqjq0TD
 c+EhFaAe9Lw+UpSDxXAoT3wGA81MRlt3xJrlz8JUYD9AU1HVktwg92PAgjN7cfyehx58HH2sGV8
 WzaW6YSRuDU6SjhT19kLSfJ34Zsorc4dL3HqrzoPhOuK2SpHCB2ZnoACmDeFhena5Vxw014PFrT
 feiIhulyT5FrJcLX/sG8Jlxf3HP3rXPWB4q1+cG1Oc3jA2nRKkqqw4IQedUGUv4WPqUhx62+GzO
 Ngar0w+OdnIRuTY65qg==
X-Proofpoint-ORIG-GUID: ct9XPukfAvpPiKJU-DcUWkZpBhRzmxP1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=10 suspectscore=0 lowpriorityscore=10 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310071

create_pagelist() passes the result of a comparison as the gup flags,
which only works because FOLL_WRITE happens to be bit 0. Pass the flag
by name.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 48d6b1d74329..3ae4ee2973de 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -1592,7 +1592,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 	} else {
 		actual_pages =
 			pin_user_pages_fast((unsigned long)bulk->uoffset & PAGE_MASK, num_pages,
-					    type == PAGELIST_READ, pages);
+					    type == PAGELIST_READ ? FOLL_WRITE : 0, pages);
 
 		if (actual_pages != num_pages) {
 			dev_dbg(instance->state->dev, "arm: Only %d/%d pages locked\n",

-- 
2.39.5

