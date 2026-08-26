Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3E42A14C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752002; cv=none; b=rT18X3N/MwiTZgkSUEfhVm6agmij4kP8xn+ZV3kxLeJ0W75FbyhoBRv9S420OHUe2BrR/9jDSBu5FOs+nPLD71DLNrr1OjLJI9pCvG6P2NikY23OIJi/3TtGVYiWL3qyEaGrCkxHkaM72F04vw+rUPAu66z8MBnceRsi133UlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752002; c=relaxed/simple;
	bh=7DmLl0ksHTt+4g/zhx1HwQyTDE+jC4CaVjooDl20Glc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbBQJtMdHR+Zx0dECNCecG4i/CuDHotUfqtqNZsDeCZQNd9KrT9BX79LyaHr5qqO5v1eRwaiODO4vkAfcuXZKeSo6q8khFpf5HEtUZt7eseNaGSA8fo4prjh01Z8fYKErNa0AO6FuU7wY5cEKPvFoFO+ukfGLXn3sBSBVtVU75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtdrn14t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiFSvxlp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtdrn14t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiFSvxlp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCM4Vf699328
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjJpwZr0X/rEPVNLxx/hrvAZWJJ6N6W56ZMy3AjrV+c=; b=mtdrn14tf6yVUBdZ
	16DFhyOeDo7Z1akK/FUPqYuJjVMlGL3K/RKjy3OsPp+PhpuPAsrhM9QxokOZkDr/
	FkXXk5ZGHK1aUI+6/IZjZWbzDI2zmRWTJOF9LrGUHhlEZgi6iNOGsZidWB0wb8MN
	NHJUAnsRvfjwJIGzpZgFbgJvrZIbNnEsjXhs41xdYYTbK5k2812y64G27FVD7xlY
	Bj2nLPnKCbKU9iwvADYBkYcDq0+eKk9/B/5KhZ0NCCHQTWHRbILNIRsu4Sa9FpAc
	TK+VV9/O6Qof2sqpqg2YaRjRkzNEiYs+XBtpHQz0jWjYgdjOLRKJfwYrZwH8dakV
	rBwP+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a8b08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1587246a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751994; x=1788356794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjJpwZr0X/rEPVNLxx/hrvAZWJJ6N6W56ZMy3AjrV+c=;
        b=FiFSvxlpU+BPIxohIiknb69fM5Nj7qZLf4U862k8IC+0Pqk9EEYQAp503ef4z+rvGL
         ctDvISspe1n7W3LGuyLJ2KLn42p0i/RwikLmu0okSqFX1XDkm5pMmfXhtkaedcK67M17
         Qd92bbKxSZWQ1QsAGnBUflnsEKdnUiKhuVvgBNGMu5OIxeGYXx24RXX6fQ+eqNWeuSO+
         5eTL5euYjYYoJLz1Qptp7i85KLpBXq2MXlkn3azWzhhRygd0/ZyIL7ZFmlTndpj6kecY
         z6sTTfY4b5/MbGW9A6yRIcpi9FOTIbFxfMLVgsj6kY662Bnq8qTLmDEnjK77tUCSdLoN
         ieuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751994; x=1788356794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjJpwZr0X/rEPVNLxx/hrvAZWJJ6N6W56ZMy3AjrV+c=;
        b=e+P6e8cBUZIWHSBzywOTSV/zOCbDOJflKYf3aeuJX6GqsQIVdNHRXLfoaVj6tIlSAk
         aumC1T9oeZitdgi3hdwBBizIViii6PSZ5amjNfeB8LlV5NYkpnyuQCLnaHZ053OIaXfj
         YzfF+eK6OYJ5fjFpervyX0Cbf5KxanEqlFVMGlX+rN15fnSeK1Xm16h/HS84lIQSDF9K
         5vYDIeE7/nqMhsGQOepfLb42/qXxON7yDTLmAUtMmpqUfl7GSQTE6KkwOCx38yf+eXj5
         /gt6azmxnqsc/JuDItNOZ7VA0L2CRyJgodUAajaS+U1e5ITg3MXBMXTlhml1fGkaw0e1
         +S7w==
X-Forwarded-Encrypted: i=1; AHgh+RrOshnW6P7c+T0KI0r0QOVKsJHhioxAL3dRm9DGJn5m67An7mMLnrNu9judZW1iOO7FSgByIZtXT2srHPU=@vger.kernel.org
X-Gm-Message-State: AFuF++krJZJSEd4T69Vz5fEuCL75AjwRxUJbJrzphvUijmXkQFMy1AJc
	iCqzQQu5EA0RYhU78WGKZUkc+MpRbKQ15JXANYedz2X36JXzwOBy92bbappup/XwpDbOAvDZmtX
	+q+yyhvd3fie+2XrUDnlwwTYMulUhwmU34YT0HR7TvHB0tYAHHC9AM/g5U8K8h9xrcOM=
X-Gm-Gg: AR+sD111GkSeIO1j/NLgLBHrebQ7azN0oaM1hJfuWflHgfcin89uQHE3siqaxE1FA6M
	ujWr7IhHJXp3h1dKltwymVVzEx9Nh5NofbLnLtiBYgTu1H0uBMb7V80tRwnCzG1DK5FSDdXr0B9
	Tjyp1uQmOqelAXOtJbpsmVifR1qVDc/ayQNNDSuRptCNzDJMr0QWDqINDlGFW6Uv9BIyPYf+REb
	cg0wMmPo6TiE2AEsj5ZHwFGpGQ9/vMNUURf8w/h+RnwwNwKbsk/hfviyAQGNrFrsZH4m2iM7wpa
	vhMXqQu/GkIk25qDFgfcbAy1CU/ifvp280RVG/H5kkqidaKRqmtWOhNMQt6lyFntN9gLcKlz8/n
	mz3me+FzehByowTiqPBIhRgxeZR5R/eUfuw==
X-Received: by 2002:a17:90b:5890:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-3966d83231cmr15765873a91.13.1787751991842;
        Wed, 26 Aug 2026 06:46:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-3966d83231cmr15764798a91.13.1787751984994;
        Wed, 26 Aug 2026 06:46:24 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:24 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:47 +0530
Subject: [PATCH 5/6] misc: fastrpc: Add extended context bank support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-extended-mapping-v1-5-d046c1cb9a9f@oss.qualcomm.com>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=3115;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=7DmLl0ksHTt+4g/zhx1HwQyTDE+jC4CaVjooDl20Glc=;
 b=eLDthfmrsR+fwIgIfMaggDJuyvAv2B3Y2sgoB+KV+fWPIJ17X/egI/M/27Yhh4jZRbxxJv4cW
 92npmr17qpeAtMfX7EI+2EoGiTEDIS5HlO6ZpeqWRzQj4FbF73KVslN
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: xZzsal3iYU4V-yF0OPX3GlBbMFXCrAIT
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8eee3b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K--tOdr6QUUB7xZ2f28A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: xZzsal3iYU4V-yF0OPX3GlBbMFXCrAIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfX5GuNaDhvjlwx
 Vd2lZDp0qV5K00F5RDVO3CP9gaV3Q5jGN3+nUXDSCYZLgDjcTFiYDRJsgmKfU2jGce7ZO3V3TxN
 ykUlK1wbn2U4DxsScWMm9TZFmCCEzJw6b9AA8q4PQb80adP3Aub21OI8sMS2ZuOnbU2T2TG++L8
 GxuFaoJH54//TdwA7urb20gAkLyjzb9pT82lPGWf5mTu33N6FzzehTDOBoX+Y9sZeQoiGJT6FGH
 WvbwEts5EJ+TJCHnj4lqW1Nj5WzZ7/7FUMIgrv00q70JGl3kr9cKSVMzALFssH5zrZmVpEHG5x5
 K6kbLSzBpDKyjCc6CwuRlxn7aaV8KRNtR0Ctr5LUNTe0J6KUcLwhirBioNuhTys9r3zkmmMX87x
 Pz9JWJ/MfCYIOUwN9J75z2+JoaEF3rOpyROd+1CVK2R8/9pgbZ2XNK0CuDZVBZy/fCZxLmOekMs
 yCgCN1w0lMuvqvTjmjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfX0nloyFLjDWN9
 HaH9hZP9N5U0+w3GQNmHO1UlnJqL4tTN9GhrrC5bsbDSNDzuLrt17Q9ibXYk30z/HoLOT+aD2Z8
 gaAnDwI+NdkHvqU75ffO3ZMFDe3pEuM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260114

Extended context banks carry a 40-bit DMA mask and are shared across all
open sessions rather than exclusively owned by one. They are a
fundamentally different resource from normal CBs and do not belong in
the session[] pool.

Maintain a separate dynamically allocated cctx->ext_cb[] array instead.
Extended CBs are detected at probe time by the presence of a
memory-region phandle and routed there, leaving session[] and the normal
allocation path unchanged.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 07a0f2b229b4..28d89fd9cbbc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -309,6 +309,8 @@ struct fastrpc_channel_ctx {
 	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
 	struct rpmsg_device *rpdev;
 	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
+	struct fastrpc_session_ctx **ext_cb;
+	int ext_cb_count;
 	spinlock_t lock;
 	struct idr ctx_idr;
 	struct list_head users;
@@ -536,9 +538,13 @@ static int fastrpc_remote_heap_alloc(struct fastrpc_user *fl, struct device *dev
 static void fastrpc_channel_ctx_free(struct kref *ref)
 {
 	struct fastrpc_channel_ctx *cctx;
+	int i;
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
 
+	for (i = 0; i < cctx->ext_cb_count; i++)
+		kfree(cctx->ext_cb[i]);
+	kfree(cctx->ext_cb);
 	idr_destroy(&cctx->ctx_idr);
 	kfree(cctx);
 }
@@ -2373,6 +2379,8 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	u32 dma_bits;
 	u32 sid = 0;
 	int rc;
+	bool is_extended_cb = false;
+	struct device_node *mem_np;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2382,6 +2390,45 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 				       of_n_addr_cells(dev->of_node) - 1, &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
+	mem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (mem_np) {
+		is_extended_cb = true;
+		of_node_put(mem_np);
+	}
+
+	if (is_extended_cb) {
+		struct fastrpc_session_ctx **new_ext;
+
+		sess = kzalloc_obj(*sess);
+		if (!sess)
+			return -ENOMEM;
+
+		spin_lock_irqsave(&cctx->lock, flags);
+		new_ext = krealloc(cctx->ext_cb,
+				   (cctx->ext_cb_count + 1) * sizeof(*cctx->ext_cb),
+				   GFP_KERNEL);
+		if (!new_ext) {
+			spin_unlock_irqrestore(&cctx->lock, flags);
+			kfree(sess);
+			return -ENOMEM;
+		}
+		cctx->ext_cb = new_ext;
+		sess->valid = true;
+		sess->dev = dev;
+		sess->sid = sid;
+		dev_set_drvdata(dev, sess);
+		cctx->ext_cb[cctx->ext_cb_count++] = sess;
+		spin_unlock_irqrestore(&cctx->lock, flags);
+
+		rc = dma_set_mask(dev, DMA_BIT_MASK(40));
+		if (rc) {
+			dev_err(dev, "40-bit DMA enable failed\n");
+			return rc;
+		}
+
+		return 0;
+	}
+
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);

-- 
2.34.1

