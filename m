Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FB735FF6E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208150; cv=none; b=da8TI6v4mUkDlznS4CPosE4FZpjO4B0kdSiS461QQrX/B+YMJG1IS6Hl86yoan1+nNSfIHiaN+z6gArPJub04RGaVEd6z13NZhz+5OaJ80ZgGlLKTjV/+EflnZgmB32f4BBH1rb+aEtM/FJG5Gxz5bSak0os3XC+LkthdCBdJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208150; c=relaxed/simple;
	bh=nbmyEVTc4+Ww2tjJ+SxB0dnh0CfPx4aQRKXHop6+iNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mr4UyId2AOuiKv0Dy1U0KwqIzCS+N56XdcaAZrpokkyffjjc6OElZxykhHlKrAJoAwXbz5X5jF3ihxdMp6amFMLEDr3k8wgGmaau29/aeFl6Tm2U5L+sBXlG8Ll4lRt85pddWpjxP5wjDMPhvbTYJZr4J6Gme/Ea9UyUgIowvoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKhV9cEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQbagFJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKhV9cEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQbagFJt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C853ZN1803905
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=; b=IKhV9cEworVEOEwW
	gk6s/AjMqe1VEHdXDf6OW1iibkSxE39kSVan21oa2dvnbSCWnDHoIjrQ2diJxQmY
	YxfYT9yfzY6U1+a1grvJUlkzeWwZnosPxX0ZE3OXoZXOfNTyBrvl4ZqLW5Y3Z/h0
	ggOEKIPlLrs2YU2oGI0YSBvre/dgljMoYrgeDJ60MHeN8pun6EP8vvXA65/a6z72
	rVrsmCe963u+12MIiYuQY3RSPDsIrakxpNh6jN+rfpMynrU5paHAavftKC24lJ74
	mnlPtLyAdqvKVO6/EV0/XjcgW+F6b3rLapZ2viLj5AiLF8JJxN5sOGsGOWrVohf+
	JDl3Aw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8nyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1819272a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208132; x=1789812932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=VQbagFJtlxJhM78N7lsWS7c1lE1VcaF4UfnuJhlQHvUjbQrtS5EVCeFGCUfBI0qSqD
         biwB+0nzADkVpMhH6ccng7HZVT3mf3CC1i2LUgR0kCP/FWulqn0Z7WGN229cexfPTFLj
         m7JtGzbyVjygqOQFI48Tj4cZwUHrSKYIUQMul0SD0UzCLBxsaQyqGjoVJJ9RAexENo+s
         ko2xcfKgME3HVIynIcLtlomMR28XrtZrdb3E+Y/YWeAJ6+xCoAaMCi+V8ndoPvFF9Sgo
         b/RfHGrtNlibVLb2PlYpyCEAYDM5XrDifd4Hv0jZP6tqZHEvAmnk3how/rMA357Y5ce2
         jbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208132; x=1789812932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=jZ1mhhRyHJEuc+B6oEJQTUmiOsJvzrKhUTi5tECBS/VaeZae18vhHQi9FImkm4KhHN
         rBsQ44ygC7EigyV//A6Z838dV3sIKH2APexjxevsW5nsP/DTSuU0vrpRUK+E7P+ZouRa
         Yyz07v0PmeZ+5iAiFGVlfc6O0TT1DBQLBcuZVFby+ac8iZ9RTbnHsug6lz+bUhX1Puyl
         0FeYcJuv82w2XVtHhCHyf7CRvWE2pHkFz+P51XIZVm9L6cmNdnChJPi29MNMCzFbXJiv
         ZITD9jiVtUQPQItyKfCDoK3ET3aH251qHl9VVFybGdt0ygO3yWOPQ89AQ8Qu/ZC2gNVf
         MQdw==
X-Forwarded-Encrypted: i=1; AKwUvBzisGn8fsLeLBJ1vC8oZX/L5nRR4U6AS7qxuSpw6lsFn68gYj1G+OOEr4FcftaeIKi7lcyezIdpHBFiR2s=@vger.kernel.org
X-Gm-Message-State: AFuF++ns/BTusdJjiijM55pWWMH6QCHJV3CcF3kbsy5lbwRoLP2vv8Mw
	bOTASakP2AszPDZbxS3MIzb7QFaO8Iv+XkkTtuI7Q04M+GXsQb982gXQR+Hp5M9AYGSRNgjOPi3
	Phqt3VJScYdZOelraKxIb96FQOdDdTmU3E5lEShSTXZ9bUAY6czRQHUb/HvoLw0byfA==
X-Gm-Gg: AYBFou1e8e/zIZ1/nrk51P8d8Vlvdeo7RIKuHYJl1F4yUNnWbsh7GKguGWwYbiLjVWi
	5vXiokArA/BdPir19G+y8Nv1DRaJXgllyHZ7I+aLQcYSukYwX1cIsi22W67Ln7Wc/dty3RTEQkE
	Ag2t95mfd4OKXfn84FIpiPPgDPA1C7dlMGw90NaY8uNIIkMb0k7Qbq3SQpKPFAWsyC5NkLp6VrT
	XX+Vq49tSKuyzyM7xQu+/s5yfTNrhz6ICayUSi+h8/XwQtXHUJt2Bos0f1uwyjnsUIb2eJPUWP8
	fgpDSGh6F5ntBtTh4KdyZcDwnvq3aQcuZH0qrldcWNKdM78FbTlz7cLA5idaEsR2A52erqIJAzw
	KzMNTXB5Cqozrq1PlAbfGz5losyZSQ5ttDHCUHC3rIbZOkjK6eKrWZ054/9w=
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249278a91.14.1789208131969;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249221a91.14.1789208131506;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:30 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:14 -0700
Subject: [PATCH RFC 3/5] optee: riscv: enable persistent shared argument
 cache
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-3-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: yi62RDfjxrSEXMGehQEqRYw1kCNq4IYo
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa52654 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX3YX8y4PPGf2k
 HBXWxHe3f9T/Xs9qvXtMjFzhDYQV4Jp8d8++LGZwyKg1ttn/a63DNwemuvP7P/dwjmblGLxRRC1
 eEl1XZ1h3eFApt0nNUWW9FjNsKxEYM8=
X-Proofpoint-ORIG-GUID: yi62RDfjxrSEXMGehQEqRYw1kCNq4IYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX84ecNDv7vDay
 svJIrR5K6drQ0AWEms4cfy6LvUfSvWrzsPBq+Z1u/dHshTJ43WlDBacSmnzIDDz/JRao7e2Flp2
 p/Htrev6Db0WdTxZiYrMyoazkNX2Pmllt/Q/5Z+jgRAdjAp0eJ2xOONPnYz2FKALCmIB0EEnUBm
 rvE463acJysTQk7IM1dYU2GPtVj80pxiAUL/NEK8eUaWiWqtM10k24rk4kUrDSoQLAzcQRjFum3
 2k4F0uR81eYv2I8Vq14bHXPhY2cYxHL4e2T9J+8AYPB0teKD68Z6vDK4AwrPOJ4tH7CKZux4hny
 7R+0U5SpqfZyBfYs7FT36Ddx7+k3gR+LDMk/ydNPVGVE5XICwBWssSx5Pz5h18YPStVjlHuifkN
 OVA1OJpQjxZ70DXBBcJUXAgYGQ7B2l5FQ/ntT5T6WqJMoYW8Hztsi1/KVU3CI6hy5tagmoWZ2Im
 egEwZ+Rn4dRiLaD+0uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120146

Use the OP-TEE shared argument cache when secure world advertises
OPTEE_ABI_SEC_CAP_ARG_OFFSET.

In this mode the argument structure can reside at an offset within an
already registered parcel-backed shared-memory buffer, allowing the same
buffer to be reused across calls instead of creating and reclaiming a
parcel for each call.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_riscv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_riscv.c
index 36115326486d..72c9eb85f4fe 100644
--- a/drivers/tee/optee/optee_riscv.c
+++ b/drivers/tee/optee/optee_riscv.c
@@ -1149,6 +1149,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	struct tee_device *teedev;
 	struct tee_context *ctx;
 	struct mbox_client *client;
+	u32 arg_cache_flags = 0;
 	struct optee *optee;
 	u32 sec_caps;
 	unsigned int nr_cpus;
@@ -1219,6 +1220,15 @@ static int optee_riscv_probe(struct platform_device *pdev)
 		goto err_free_channels;
 	}
 
+	/*
+	 * If OP-TEE can read the argument struct from an offset into a shared
+	 * memory buffer, cache and reuse one buffer across calls instead of
+	 * creating a fresh parcel per call. This is the persistent pool that
+	 * matches the FF-A OPTEE_FFA_SEC_CAP_ARG_OFFSET path.
+	 */
+	if (sec_caps & OPTEE_ABI_SEC_CAP_ARG_OFFSET)
+		arg_cache_flags |= OPTEE_SHM_ARG_SHARED;
+
 	pool = optee_riscv_shm_pool_alloc_pages();
 	if (IS_ERR(pool)) {
 		rc = PTR_ERR(pool);
@@ -1266,7 +1276,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	atomic_set(&optee->riscv.next_nonce, 0);
 	optee_cq_init(&optee->call_queue, 0);
 	optee_supp_init(&optee->supp);
-	optee_shm_arg_cache_init(optee, 0);
+	optee_shm_arg_cache_init(optee, arg_cache_flags);
 	mutex_init(&optee->rpmb_dev_mutex);
 	platform_set_drvdata(pdev, optee);
 

-- 
2.34.1

