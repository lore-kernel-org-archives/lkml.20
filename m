Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49463493646
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870119; cv=none; b=MQo5TMQPuv3yX11TRDSinacAnentGtkYndgLDce5YwctvHojso4mmk9nqFts0Mp0YguvHQNcIZFYhIfd2+hKqvY0oE69tuqRRsHM+q3dbU1vMlzg1/eGwwl5w6O5t+qHQLOtAlxluUcaYwcuHBP6b8FznAlSAN9eAh8RUZqS7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870119; c=relaxed/simple;
	bh=7Q5nRa43hWpowrs3WTtfQQ8c7SPGddet586Xp5YmbBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kt3bjd08GwhyiAt00CKLUq0WQ54gpEUJQpujmUJJ0OaJiLd3JV7zZslI4T8mosMrW8qfCi6640Vj9env9oL0IKpMEcRW6WmyGrA2vdE+jg3MtiEkBabv5csqELkNB5G/GTP9VsrYYuNq8Y2zIHZvm9VNe4b6IwmLDDkGPKXfZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N64wzUaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4eWgx22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N64wzUaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4eWgx22"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21Me83509541
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=; b=N64wzUaJQPWl7GrO
	o2Y+P28Hfkq5qTYerT+VjMf7hTj/co8gaqJdwraY6hVP4uhIpmeZ0FvGjum454FL
	6KlFVbTIIJxsDXtPHoeqjV9idCktviSbAY+2E2CCWzcpS9xcwZ+4CKjs0DoUVwy3
	Y0k2wYRtTK6Euzg+zwosQ2VBUJDGLtFra15XIOYxh3MQr+KtwY0P/XW01vfK7ofV
	/km00MnWOkcftyL70IeeC9zSsCrl1aWKHeGU72j+vPpGJzL8UkJeqwAGN5cz5NJR
	u7a7h9KPul7kOSqyMm9JoJI5czruSxvt66Qh5W1ukGuLRAxNQM4YFcplME6y2gfI
	rfK2og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc4fd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1122505a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870117; x=1792474917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=;
        b=g4eWgx22sNOzzKizpaqYlzOBp1K56SCIhDT+pZ8/E24QmnalyxLpzvIIw5n+hXdDiO
         mbdD/HFIsya5FPog4BdYGesUuNhz0OhNFiQ4zdYDUaJdYk7A6q2ugXAvC74PMQouevVV
         x+YjmwyODO2PCrkoZYEzQtFRPq0lTdbnlt4xpZf6Uxv2XcSURgoE4W7ZQG8WLJVgRnA1
         I19YsstkfEDE4hgsfiFptUkhUNl/fuAxKDsL8MboJbInMWTZbko+W5iu4cmNXjJORYoK
         GzhQIA3+09x7AbQFF5DT/htbJ6xwijos8JHHCkjPP3BUFpkQo3+OAmT/pQjD3+Ouiq/k
         TJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870117; x=1792474917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=;
        b=ogHcsfy5jdDV7U7N2FHGsBgYcjsr2L59jl75vPVNyLfpmAw3T9SeN1mIr7IxLT8VBK
         3URVG/oCKjDquTcoO57XWVltr/5YPqVxGjIni0dLwpGrI+LtlSASqdkOrvSKawdsD+Vg
         avmm+lgpOJreGA3rGP4SzRC51UldJxmqWDERj/faoaZHYxx+4Bv1Ir5C5IHUwj2WKIfD
         dIM/c4B0NLaEbtS/2/RhUoZklACM0vNK8wrqEZ5pYPKdb+2YeJsugUPT7NFHsmDm99Cw
         6I25J5H7STqf+D6IMgHfvFtCDkYPKqpCxysluAHQvP/26a+VjUndU/CHBzJsSTd5cTHt
         EE1w==
X-Forwarded-Encrypted: i=1; AKwUvBxxPoUd/W1cdLqmJXhWKcQ+9fLaVQXaGXk8VSveTJvYgPyBQiTJ734+qoT9XQsXulU3b4rHluCIGuAs9DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcOLZpAExmyY8S6FlsgaxnC22g5L09xsL58/RTBticCZtfRBtI
	NnD0cXgPF+fAY0CbwAvN1AiqfjuZJD2C7c27hpzBCjXzxtdkGGvl5AYfW5kJLfwWEiswrVmlNCG
	MjbinKU0jhMAlhmA+xLaH6uuJjiFxF3jVa8RFwOsYoEOoPZVaR0eDi9ABsicXg2IMnQ==
X-Gm-Gg: AYBFou2KMNo+5P6aAiwSsnsPhnr6k/5En19DcqWc6FRcx5mPalt12CaKhxCjviLKbTe
	leLJRyoIhUvMRxVu1KlL4A70ZifLf+1pXfLW1Xaj22LIRm+uG77sDLZBjap3dcmEa6Zua2H1/JW
	mHwW8z1iD4G1s0hxJLI/SmfSiw3cQOJcj3Or3mVX98OL4RLSZnv7dLHhVTwY+M8zbCRQJiyIjB+
	7aPXEgj+Eu1ejAQvAEyXeUUm9qcKpo8cC6UmnzFAFhnJ3qd07uTIVuh6jIwWrdSK7Ya3Ty5Xj1t
	0U6Y5sZ0/fnGeve47wRWXpOYkcbDLS47PT0L1mAHGYfUVkBYIYWIhzsFWdmusCQSi9qHtPveShT
	rsX08COA0a8pCwl1PcVcK36t+/BLcdPmm7nClODdnoDUCyp27+ZzgyPJxcA==
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr10687431a91.56.1791870116732;
        Mon, 12 Oct 2026 22:41:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr10687396a91.56.1791870116192;
        Mon, 12 Oct 2026 22:41:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:54 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:32 -0700
Subject: [PATCH RFC v3 5/9] tee: optee: add RPMI dynamic shared-memory pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-5-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX1LiZdr0KNgvW
 o0P4r6fZp2k9Zc0U5aaW9mgQjn1F3eJpDg8s9wN5y2NZK8HCDV17HghuUDPTO8fRw2//eAdup+E
 XQV8+J9PfjP1RXaerdMiAmvR66r5qNM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX3F60y3Ve1JwP
 utPYJccc+Y4rrP3UYP4pX6mwQft58igx+B4YhY2GvZdz0wD2Bqs5w4Sa4DXnf9o+vWS2nEvP3d2
 gDOMaes0l6ibZuQwKojgR/VZNyqqtMjcpcohF1tkJe7SAfGq4GZsCeq+cAknroUpot/nWF1Z1wr
 l9fw9/BtcQVyIvgla3izw1cAZaH/kRuZT7wYeef0r8SWqPf32gmtI7riwTwrU/BaHRZO60pNPsx
 fY/Se6weApNpCTMk12bWkPbHrLJVj5wodN1DL9ScPTVEEY3cqpukj8ax4PtbFm09cFmWowZqgn3
 Up9zbx0+pEFFbLcIdRnn5M6GP4Ej1vGopLU7SceuHsn6cMhFEDnvt2SfIeCHLI/lG/62Cylky5t
 x/OCKmtmCcuezLbwyYIrjgrs80WG06YfMV+j+yfvOKnLnxDMTgj8lOCYZoGsblTQqqnWblA4P8J
 gy83yfMU/aJZY5NX+BA==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acdc4a5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: YR08bhAQtlm4ZbUF0q4vPw2NKjfD32TA
X-Proofpoint-GUID: YR08bhAQtlm4ZbUF0q4vPw2NKjfD32TA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

Add a page-based dynamic shared-memory pool for the RPMI backend using
the common TEE allocation and free helpers.

Register allocated pages as RPMI parcels so OP-TEE can access them.
Unregister the parcels before freeing their backing pages.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 940676794280..bbb219ddab38 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -183,6 +183,42 @@ static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_rpmi_pool_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
+				 size_t size, size_t align)
+{
+	return tee_dyn_shm_alloc_helper(shm, size, align,
+					optee_rpmi_shm_register);
+}
+
+static void optee_rpmi_pool_free(struct tee_shm_pool *pool, struct tee_shm *shm)
+{
+	tee_dyn_shm_free_helper(shm, optee_rpmi_shm_unregister);
+}
+
+static void optee_rpmi_pool_destroy(struct tee_shm_pool *pool)
+{
+	kfree(pool);
+}
+
+static const struct tee_shm_pool_ops optee_rpmi_pool_ops = {
+	.alloc = optee_rpmi_pool_alloc,
+	.free = optee_rpmi_pool_free,
+	.destroy_pool = optee_rpmi_pool_destroy,
+};
+
+static struct tee_shm_pool *optee_rpmi_shm_pool_alloc(void)
+{
+	struct tee_shm_pool *pool;
+
+	pool = kzalloc_obj(*pool);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->ops = &optee_rpmi_pool_ops;
+
+	return pool;
+}
+
 /* Convert a memory reference to an OP-TEE RPMI parcel reference. */
 static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
 				 const struct tee_param *p)

-- 
2.34.1

