Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFA629E116
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247202; cv=none; b=AZeIC+PEOui1JQocoJlEjC5MFhkIS50p9mystNcT3hozeQ6cyPY6aHw+bygRIZ+zd3t8Ed87fLjBojvY6IChaW8bY5Cq8VeUW8nSOSyqPanfsMktJIM6pcG6JmKfQescQDCtLS+Jeu7fKWwb9CUBXutVeq/Yqjzp8dnsidx35IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247202; c=relaxed/simple;
	bh=m/Jg1IBzk1GaLMkEQ8ygyVkVct/4HGDOSskLv6CeLfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IiGIXrqJKNc4DqyrrlrJWUckShht5sy+q9+Cn1x5CjxHFIfyPLdI9xNt5DWfywvD0Eftw8Y0s+jvvbJ15c3yWT11pj0SZ0TxLywvgaZXVY7KLh1SPJ/h9U5Ql41Myr/NM9K94lRB9bUBvD4fYfi9pZFTx3m73m5YLh9iiR+8Zik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9Dd5gz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeE9tsjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9Dd5gz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeE9tsjX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMkuZ1971567
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 00:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=; b=M9Dd5gz/Nnd/BJS8
	eGnnCEQo5vqfju8HJkoU1j2kCVHwJc39UFE0Q861MvD6H/2OFRKVnDv827tH/5xh
	0bDA2y6zGz9ra0EyfcEuHc9RD492AUh5ENZ2rklBjBsIE3Zlbs+dZ2JJlBRV8b+n
	DtQgcMvBUZPwu8JBIBaD4BDddBzeK9Q107tIkZEkrhYHWZttbcuw2NSkZTltfV1+
	Y9NqoTQR6IfzZV4syo5ZIx91NhhN83n97FP7lvT0iHANX0oEIMS5o15yFkDrrD4r
	W46aznv//895zEe/3Q1bJPof8e+nvtMeinXAQhmYY/p6pkaEHclyVlOlyzXCq232
	SYGWJQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkuhjf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:39:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so5850265eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247198; x=1791851998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=FeE9tsjXo6oFWQupD1ESJ4WPpux+PH8yjs6LqD6C0HdqCUoyE5xnajUSEfzCY3Rodd
         xkTUEwAjqB7bcCiTGmn6paDBuF+GFgofc1crlO7+STT2iKy6lyAmxPeH4ugHRAayPc19
         FGJ7Z+qXdTVrOEmVrOsBRQsdvpBUkdPF4It7qL9FagSJrUoHUgrYK3VlRYmroXgSevUs
         kYAb6lY6pUYAEfXwtWKH40Hzur8lquNoDTpX6box/IV5Om/BGs46a/vvMLgRawpznBMb
         t7rrP4E6gFzyyw/y6zCvdRBc/7TxxUjKTIc/yRrKY03YWa9APYosHPy2rS7gzJ0ar/kj
         k2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247198; x=1791851998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=egl03+ftbsihVvctBi4qY5j0zScCH0nPMEYUh38b0limWB61D8Uh9yUD1d4lx5tZac
         nJM3tl6xqK9U1Dd+APFCqkTkKSBqJNOksSn8l5fRHcthfxL+KQhUNx4j/1FjqJp5nHK8
         poLpQOc9TCLcq6lXA5naJH3qTQUEFeYCtbpNPPATW1vPoj/wAZIiToFksNtOrVYT/gzd
         rHV76zx62mJ7+wUUQKpFWBxyb/cQrNd9reocuEsoxbvV2Yz0U1RCbwUvitaSaMy9mIhE
         7VLJYQyxeFwozrHoT85nb4bMn4X28eDfe6rKZmdzgzFRWCYZzAaKiYff7LGoRl4t7WvH
         xYaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2NrY92dQFhOFEkn7p0Lk9yem3iVthXs08s3PBFiJ/WzBAYBhTonqB/2/iMg2E0sr1a5Z8zCStfBeDK9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7kRRODqIV+S1YhFfymQRhHPwnuzsX+hEsJXIbnwNMQ0B915K4
	BZP2Uuf2djxpdnGgyJwF9EdrneVtgs5hBrZvzPckBt9XCvCnC1h6kOW0O0JIvCZlwusmPeF1I0O
	KttYX5uZj90mFaSYQdlGJa05ihFOI6ytH/nzvViNiRubSoIzK/hLwRJRR33HymLqBWg==
X-Gm-Gg: AYBFou04NNO3rLWRntelOWcVEaZs5DcFDdTJpIlSuI8RzHYwFckIfAZ64nyKWqUgbh/
	ro3pZLgU54w17+mHV/HP+Orpyj2qugr/hMmbQWW0RkU6uhZ8zuX98GvlgwhRTOz0rnXZPGrKFvH
	UPjb2pCbaF/ie19waOGYkI1PDUHortQ/l71hFPk3OwX0cIn+vnG43kt7H2UGTkcJCRTGT74QWUa
	N1kQ3f02mrtFHmuk/YxCh+gkzxIKntMCXS3gvzOeS99KiZXIzfWHSAl2Ki0H3e/dA1BSjOOxqzj
	I5mcD6XompRVSwnEu3n9hpAGhr0gewwUi+BwCcUDgLtHBet0I5p3rhcSpAw6XHWDMK0LoMAtnao
	MjpgGHGqggnqL1DAmZnnlopR1r+Dl+TfIM2nTOvtC/DSJCaW9YhLX8OWDsA==
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947147eec.20.1791247198222;
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947118eec.20.1791247197525;
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:48 -0700
Subject: [PATCH RFC v2 4/8] tee: optee: add RPMI dynamic shared-memory pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-4-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4435f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: APWWakAPjasfNDsbW3UmtJh1ti-nP_hB
X-Proofpoint-ORIG-GUID: APWWakAPjasfNDsbW3UmtJh1ti-nP_hB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX1E79t1ULml3h
 f9PMelMSNqOPafCDGZ3OsgDMBVcFS6yzjwj6WIsYyrKN370B+E211i8FkoUvz8W7wD0o5VK2fYU
 tvKygUE2FwKupux023ylC34TYg6FW1o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX62IMzPAopNRv
 KnsSkqZmjytQ67nQ9/ikb7DZhMi9AQjGWz7R5VcELmkFmB/D1SQqchL0+g6MGtJ0rdXvQSxdN2B
 xQP//Qhlqxi7tIYGVxKA3A39oH7/UMs2K7g5HM6kH95p6wxtovk97n0piT3XJo0tnR4UwARHA4/
 ceVZhbftSaW6P/WM2k9S9IjRatG1Of2IzwTis1lYh97ZDLI19g2X7NW48E8hrE8rAuAN6l5pG+j
 cVjvDXVfAwNAmwri2rrCi5leIJvFqQ5kCF/0BPgDsfTMm3YtOwmRTj46y4Pi8EJM9DcVFpIQFoe
 bzWUn8h9AiveNWzr02PqGLO4O234JtFxHzQWggXcFBKYxDMqjIXh/4R0xS3syDHw5dXGcMui+Sr
 fJv3bMKhjc/Vi3wI7LYshW2prlFUSXyPCcxWjAeZMBon7zN2GOINFPQMXpDn1mMGcllSLR5NKCY
 +Di6LOP76j9u+tlsXbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060001

Add a page-based dynamic shared-memory pool for the RPMI backend using
the common TEE allocation and free helpers.

Register allocated pages as RPMI parcels so OP-TEE can access them.
Unregister the parcels before freeing their backing pages.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index e7fc853cfb15..c29b7ac4552a 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -282,6 +282,42 @@ static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
 	return ret;
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

