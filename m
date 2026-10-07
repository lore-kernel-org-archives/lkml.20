Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D0D483825
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373145; cv=none; b=RTbUF9gqb8AHQgnIIjJIkfFI7HoquVoTBUDb/0mjCpEohez7yLeXLVigSmXsaXrDIB4+vqyo34JMIpjjOju0vP+kRiA1JFrQQmFDd1RyD+icIIsWK+/dxl1n0pL/+P/sL1io1jywKj0ikWWKrci175epEh6K/KlmNAChTzLl2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373145; c=relaxed/simple;
	bh=+ROM1Aj/AhDH5vry9cKioegjWCqQN3fynPw55QYNnVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPxgXJGyHYs8Jxfk2VX9TRuGFm+hU2kA6Soqw+345tQILJx+d0Q27IVRqV9PEL2RzjWVGklPJtA5jMfGQN+qcHFb8ZZXlhLvMtQfbGmZm1yrgK+bMnd5DFunQMWprx4rIQRHupo6tO8G3bhhfuvD+UDfUSwjdiUUU53DkjmAtfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkyLmba2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZRzChkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkyLmba2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZRzChkN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVK4g3463148
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8g1RBo+AuCbXvytIoHkXfCv74JEa6vV4LJKShY1+Gr0=; b=TkyLmba2JDHf6/Y3
	wh0l+WQO87uMAvOlt+In3ot5Ya9Qi0m+I5ru4IncM0tf9qVqEwR3hyVCmxkPrwFH
	Vev19BLRIvFNdAXj8y16ziKGxjnm1aG/XFLMb3PoF5gw1YMCqAFYN+D4hLdD75WF
	2M5XkRz2nmQvMcLy3HUXiVUeCKQOahSCVptBBiRYxGF6LcjGB/fjv3xs5dPbnaNx
	Q+dhqJxjaqvzh6+ZPskNq14ZEEkhsdIkR78we9+NE+1PXvr9qzOKIJ2U1zXWGkp8
	Tu1E0c1ci1MN4P8nvy7eq1bH8vGRlDZwt3fLq5GKtTQO2Kx9k8d2bQpYi1LbCV8b
	DW6oUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679upm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:38:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6809099a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373108; x=1791977908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8g1RBo+AuCbXvytIoHkXfCv74JEa6vV4LJKShY1+Gr0=;
        b=iZRzChkNxa+zciWg1Ipn9DrW5J1GDGpFCywf7X9SyPZIh6wWyhEgkqee5Yyo2YnQVp
         KQLiNfdbtNCNRXXZ2jioPOIkrLtDPkybfZww35zNbgp17AOJQyGzTsrUG59wtffDljUo
         nU01VI4Z2RW4h3Nse1ZkWxQHMnPSgswKL/0tSqzLJdrHF/p4f0hiHuuYHr0AmTV30FxF
         qOMHnldOdT/IxlFXs65nHljst3w9+DLWG8e6dCp00x903QpeiSvrNvIB71dzrVBQWeHV
         HGw0sNgxa/8hAhYt1nc7Yxkq+DONZxdqCxjOoDoI7UdFmD2zGuGmIDZeNVvKCB5I2hNc
         HRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373108; x=1791977908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8g1RBo+AuCbXvytIoHkXfCv74JEa6vV4LJKShY1+Gr0=;
        b=z/V+XD21nSBQ1iGnI94cSy8d6HmiGzyXKvnwgEjDcpKIRjJjWtYfgOCyk2nkDfQo66
         COcSaNefJQc1Zsgnx6q4RU3CMWJVr3G6mwMV+gITwgBVNbnVPbr345PLQp3sz+PgCtrG
         zU4AoRqzM0AXnMuVrhB26+wS3hz8o6ehqAsO+T0fUxrCBFrNUQ1Sjrcpf0fLSQyNGczB
         0MKAFdpCR9xzgnbcKsuXIDY/8chdip0TE7zGFTMwCjGy1YAZxNNB9A19ecfkwoSIwuAX
         5VmT1ODMwyZ8MEerWI3DX/Yasl6JWOSJWGS5hW+b7pcV/hqw+FRsJoIt1wRqXzChiZU5
         SrYg==
X-Forwarded-Encrypted: i=1; AKwUvBxZcYaydGSXSf1/5Z2+L3GHSLGDwNaDHZcoQTgi07rW8lzIkEVuIUZ2FqUNum/JeXKhP/o9xtQGIXs2wnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfggjNt2TkHB8tQZy1bM/cZeONQw5qJx7+WrYKHW1xXUQVqv0z
	mu0UHHm1jzRJgMyjcobezwCx3bHtgKdZe3INbRRq1zmHZS5/9UvHdd+CiX+3ePktzQCOqxRbLMI
	jljnOL1vTVVmVCHJ4FE3yMrRjdTTNsBsrNYenrEfMcUiX8FyG5d8ObObxbkdju/4SgRM=
X-Gm-Gg: AYBFou3+mlQK427dv6JTmUGYqDUj2rUc9s4XlNcCLx8lBv9frUSkIoLyCcl33m8Khn+
	Szb3qAi7STP5yfpkhFdFfLWYkV7adR5zneN1low6FbZfMp+E8B+z3K4qT9QHVRzRt78KCQSZ5Ht
	cQvF4PfQoKfin30eDSG9c+XZ8iqwOsnT7ep5c6geAd+B5l1v4gVZNbzq/hf1yG+uPKmUw5lKAqE
	ASicBzlwIUDzI+jAoHnNKGMgVM/JrVOqEyhQ9w5fp3M+o3Gvmv5C3iHuKOH/glI20WCc4ZZGEDd
	MUWqYRaf0DLaV2CVLdk3K0eoqMZ4Ux10TdjvC4wr0cSJb9UfVepUvmWvb0evMyVqKEiDYw96ioz
	BQAZ1TF+D1sz2x0bh7oELPbg8MgRuUU3U
X-Received: by 2002:a17:90b:288e:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3a8a1c38334mr1793954a91.62.1791373108031;
        Wed, 07 Oct 2026 04:38:28 -0700 (PDT)
X-Received: by 2002:a17:90b:288e:b0:3a7:9adb:2a18 with SMTP id 98e67ed59e1d1-3a8a1c38334mr1793938a91.62.1791373107498;
        Wed, 07 Oct 2026 04:38:27 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5e0eeb6sm1454001a91.2.2026.10.07.04.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:26 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:07:51 +0530
Subject: [PATCH v2 4/4] misc: fastrpc: add UAPI flags for extended IOVA
 mapping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261007-extended-mapping-v2-4-5dca3aa2c2d3@oss.qualcomm.com>
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791373080; l=8881;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=+ROM1Aj/AhDH5vry9cKioegjWCqQN3fynPw55QYNnVY=;
 b=FqNtdwvRUINsgp148+2/yrdjMQjLnMMp51dhNE9lidD6KVpQbMnNy0g7h+lGOFCy6Px4p2lpc
 rwMtalpLPjSCFDxPNLQcK9zokppiklJx2vQQiamGvVMt/76FtvaTtNz
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX/vA2stCAH02q
 7PBwv+7UrKIbXicb+tPg7BbzDM0Y2wkCKsSs3AQDQzRbzR8JLs2rZsQCTjrpoLxvzyKCVLVH1Ai
 DeHHhg6dxAM0TEaUNU3xt6srG9qu2tI=
X-Proofpoint-ORIG-GUID: VhAn_Q_FNDOnkNaig8PUlDLGhCy-yFVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXxfrj9Fl6JZaR
 DHU4x8Lmj16fQjKYe86sty/dQfLxAwSFpN8d9lw3+HvGs7EYK8WSAqAu1iQneoDdQv33KYdYH16
 EEAhnMx/0uCdcnRIzEeu62sYkggjWN2WC2eGlbhupuU65GKZZmaD7fYhElKtJ+ZUk56iY4T542Y
 awc0SHRCaievuLpUAo9iMEw3QefDv+lyKyMK4GVwtGAdl+BENQezBsHfM9Qp35xb4VEiv+Qjj6c
 GkgbVDpes+09ZQ3pAwS+kImRE6kUcMcMKKWKn80wN0UJu3kevkR/Xk0cnMq9UYWjIpk9juWcmeg
 cNyDN5aEP57L0YIVqRg3yan0NtX5xe4a/97aKGDvaUoCB9gftWCL5mwG4VtG+mXVMx1bmT+vrIH
 MSm85U+/hkT+TdrMN7OiZ8w1a4iPSO9kPqGj2GZ5S3jYPU9TdUHsJonHXofVZahL+XJnSMyxvTz
 Kzg4rkdIMgCSCZs53ng==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac62f35 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Z3L-hGagjDzpc6f3LWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: VhAn_Q_FNDOnkNaig8PUlDLGhCy-yFVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070046

Userspace has no way to request that a buffer be mapped through the
extended context bank, so large buffers cannot be placed in the wider
IOVA window even when one is available.

Add two UAPI flags:

  FASTRPC_MAP_FD_EXTENDED         - map immediately via the extended CB
  FASTRPC_MAP_FD_DELAYED_EXTENDED - map on demand via the extended CB

When either flag is set, fastrpc_map_attach() iterates cctx->ext_cb[]
and retries on -ENOMEM, falling over to the next extended CB when one
exhausts its IOVA space. The SID offset passed to the DSP must reflect
the actual CB used, so fastrpc_compute_dma_addr() takes an explicit
session rather than always using fl->sctx — without this the DSP would
fault on access.

Store the mapping flags in struct fastrpc_map. fastrpc_map_create()
validates the cached entry's flags against the request; a mismatched
entry is dropped and a fresh attachment is made to the correct CB type,
preventing a cached regular-CB map from being returned for an
extended-CB request.

All existing call sites pass flags=0 and are unaffected.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c      | 83 ++++++++++++++++++++++++++++++++++-----------
 include/uapi/misc/fastrpc.h |  7 ++++
 2 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d40cdcd5dec3..4ba07a5b28bb 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -81,6 +81,11 @@
 #define FASTRPC_MAX_DSP_ATTRIBUTES (256)
 #define FASTRPC_MAX_DSP_ATTRIBUTES_LEN (sizeof(u32) * FASTRPC_MAX_DSP_ATTRIBUTES)
 
+/* Check if the given flag is used for extended UDMA mapping */
+#define IS_EXTENDED_MAP_FLAG(flag) \
+	((flag) == FASTRPC_MAP_FD_EXTENDED || \
+	 (flag) == FASTRPC_MAP_FD_DELAYED_EXTENDED)
+
 /* Retrives number of input buffers from the scalars parameter */
 #define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
 
@@ -252,6 +257,7 @@ struct fastrpc_map {
 	u64 len;
 	u64 raddr;
 	u32 attr;
+	u32 flags;
 	struct kref refcount;
 };
 
@@ -398,7 +404,7 @@ static void fastrpc_free_map(struct kref *ref)
 			err = qcom_scm_assign_mem(map->dma_addr, map->len,
 				&src_perms, &perm, 1);
 			if (err) {
-				dev_err(map->fl->sctx->dev,
+				dev_err(map->attach->dev,
 					"Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
 					&map->dma_addr, map->len, err);
 				return;
@@ -882,16 +888,19 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
 	.release = fastrpc_release,
 };
 
-static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t sg_dma_addr)
+static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t sg_dma_addr,
+					   struct fastrpc_session_ctx *sess)
 {
-	return sg_dma_addr + fastrpc_sid_offset(fl->cctx, fl->sctx);
+	return sg_dma_addr + fastrpc_sid_offset(fl->cctx, sess);
 }
 
-static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+static int fastrpc_map_attach_to_dev(struct fastrpc_user *fl, int fd,
+				     u64 len, u32 attr, u32 flags,
+				     struct fastrpc_session_ctx *sess,
+				     struct fastrpc_map **ppmap)
 {
-	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
+	struct device *dev = sess->dev;
 	struct sg_table *table;
 	struct scatterlist *sgl = NULL;
 	int err = 0, sgl_index = 0;
@@ -911,9 +920,9 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		goto get_err;
 	}
 
-	map->attach = dma_buf_attach(map->buf, sess->dev);
+	map->attach = dma_buf_attach(map->buf, dev);
 	if (IS_ERR(map->attach)) {
-		dev_err(sess->dev, "Failed to attach dmabuf\n");
+		dev_err(dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(map->attach);
 		goto attach_err;
 	}
@@ -928,18 +937,20 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	if (attr & FASTRPC_ATTR_SECUREMAP)
 		map->dma_addr = sg_phys(map->table->sgl);
 	else
-		map->dma_addr = fastrpc_compute_dma_addr(fl, sg_dma_address(map->table->sgl));
+		map->dma_addr = fastrpc_compute_dma_addr(fl, sg_dma_address(map->table->sgl), sess);
 	for_each_sg(map->table->sgl, sgl, map->table->nents,
 		sgl_index)
 		map->size += sg_dma_len(sgl);
+
 	if (len > map->size) {
-		dev_dbg(sess->dev, "Bad size passed len 0x%llx map size 0x%llx\n",
+		dev_dbg(dev, "Bad size passed len 0x%llx map size 0x%llx\n",
 				len, map->size);
 		err = -EINVAL;
 		goto get_err;
 	}
 	map->va = sg_virt(map->table->sgl);
 	map->len = len;
+	map->flags = flags;
 
 	if (attr & FASTRPC_ATTR_SECUREMAP) {
 		/*
@@ -956,7 +967,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		map->attr = attr;
 		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, dst_perms, 2);
 		if (err) {
-			dev_err(sess->dev,
+			dev_err(dev,
 				"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
 				&map->dma_addr, map->len, err);
 			goto get_err;
@@ -979,13 +990,47 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	return err;
 }
 
+static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
+			      u64 len, u32 attr, u32 flags, struct fastrpc_map **ppmap)
+{
+	if (IS_EXTENDED_MAP_FLAG(flags)) {
+		struct fastrpc_session_ctx **ext_cb;
+		int i, count, err = -ENODEV;
+		unsigned long lock_flags;
+
+		spin_lock_irqsave(&fl->cctx->lock, lock_flags);
+		count = fl->cctx->ext_cb_count;
+		ext_cb = fl->cctx->ext_cb;
+		spin_unlock_irqrestore(&fl->cctx->lock, lock_flags);
+
+		if (!count) {
+			dev_err(fl->sctx->dev, "no extended context bank found\n");
+			return -ENODEV;
+		}
+
+		for (i = 0; i < count; i++) {
+			err = fastrpc_map_attach_to_dev(fl, fd, len, attr, flags,
+							ext_cb[i], ppmap);
+			if (err != -ENOMEM)
+				break;
+		}
+		return err;
+	}
+
+	return fastrpc_map_attach_to_dev(fl, fd, len, attr, flags, fl->sctx, ppmap);
+}
+
 static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+			      u64 len, u32 attr, u32 flags, struct fastrpc_map **ppmap)
 {
-	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
-		return 0;
+	if (!fastrpc_map_lookup(fl, fd, ppmap, true)) {
+		if ((*ppmap)->flags == flags)
+			return 0;
+		fastrpc_map_put(*ppmap);
+		*ppmap = NULL;
+	}
 
-	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
+	return fastrpc_map_attach(fl, fd, len, attr, flags, ppmap);
 }
 
 /*
@@ -1063,10 +1108,10 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 
 		if (i < ctx->nbufs)
 			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
+				 ctx->args[i].length, ctx->args[i].attr, 0, &ctx->maps[i]);
 		else
 			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
-				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
+				 ctx->args[i].length, ctx->args[i].attr, 0, &ctx->maps[i]);
 		if (err) {
 			dev_err(dev, "Error Creating map %d\n", err);
 			return -EINVAL;
@@ -1615,7 +1660,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	fl->pd = USER_PD;
 
 	if (init.filelen && init.filefd) {
-		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
+		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, 0, &map);
 		if (err)
 			goto err;
 	}
@@ -2221,7 +2266,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 		return -EFAULT;
 
 	/* create SMMU mapping */
-	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
+	err = fastrpc_map_create(fl, req.fd, req.length, 0, req.flags, &map);
 	if (err) {
 		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
 		return err;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index ba1ea5ed426c..b39c0e197a45 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -36,6 +36,11 @@
  * cache maintenance for the buffer.
  * @FASTRPC_MAP_FD_NOMAP: This flag is used to skip CPU mapping,
  * otherwise behaves similar to FASTRPC_MAP_FD_DELAYED flag.
+ * @FASTRPC_MAP_FD_EXTENDED: Map buffer in extended SMMU IOVA space (16GB - 1TB)
+ * and DSP VA space (4GB - 512GB). Can be accessed only through uDMA.
+ * @FASTRPC_MAP_FD_DELAYED_EXTENDED: Map buffer in extended SMMU IOVA space
+ * (16GB - 1TB) but skip DSP mapping. DSP mapping will be done later by
+ * the user. Can be accessed only through uDMA.
  * @FASTRPC_MAP_MAX: max count for flags
  *
  */
@@ -45,6 +50,8 @@ enum fastrpc_map_flags {
 	FASTRPC_MAP_FD = 2,
 	FASTRPC_MAP_FD_DELAYED,
 	FASTRPC_MAP_FD_NOMAP = 16,
+	FASTRPC_MAP_FD_EXTENDED,
+	FASTRPC_MAP_FD_DELAYED_EXTENDED,
 	FASTRPC_MAP_MAX,
 };
 

-- 
2.34.1

