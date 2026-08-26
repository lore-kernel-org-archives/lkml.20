Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987AD431485
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752000; cv=none; b=s4swH3P7VRdYK0SAnLq3dYVwRlI4P0SLEJMivxV/hbiZgtS5kZ95pkDtLJwpQm1zr6pY0p2PMazqZnZPWoaq0g5o3y5YK9vP6N09BVy8npBsBnkmX/71ZtkNemk+2ds0shub6DXuUItI7MuSjtwndmsjQZpQNf9VKolrXxYaxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752000; c=relaxed/simple;
	bh=uiIZuwO5p10QZ2Fwu25eLmhT5zkNnRxyXBK90PHFhnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4ieAvJDWb9Po9gqmAWBQrWaJYlLV24dcNFGP5ztsiQ4CqXyRxyJuotbzzboqoAiwEBMi72HDadORYYDbdUdsv0hcFTjd4muc+q0UyZlQdwQsFH4jh429t+tL63j+hGov9QNGc6aKSO9nXvkcwnwB6pxaRYIAQxYbOrmOXwiCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/zMGxU7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwiVcpw7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/zMGxU7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwiVcpw7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCFKa1223065
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JBRtmRYqTLQMALZTMnqF/HwOuWRZCxhN9n2QVCbJ84=; b=L/zMGxU72sIuAhNS
	jnYXA7EJCfh594Ri2B7JC57Hevzcy64o2QhcNsSgiH10SiGiZf6BF+q75wLK4Oet
	w2MoX8oLAXwD/q3DcByk90W8hojBWQ360s0uxxblOpAzWQ56esR2hQnR48unonwQ
	TiUM0jFPy2qGBv2TW3FoZhCTBgsdxD7YlH+rbZ/qKCXHfwwCRw66GxkpquqAm0mf
	7N+XBzkKiYz/lOGotMaHiMuFmAXJpO+Aaj2uThyJ2RZ1evZNGyHbGzGzxjQ6N90A
	z+eqdm54w6aMWSnicl9n+4P5zayNohLXTzqhMLlbXISDt5kHtVKTk4BJSk9JIret
	gdXHRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gjb07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1482049a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751991; x=1788356791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JBRtmRYqTLQMALZTMnqF/HwOuWRZCxhN9n2QVCbJ84=;
        b=NwiVcpw7+77PJuibQ8nyim1v7Jl8hjwcIY4HOEdidl+mMsKR4iWXNgEir3CjDtZzog
         oqO1SJhT0cHF5d6ijkXLufqKcXNSu3w6VsvAjMEr2zT5n3NqyqCpXOACDQfq31J6+ZH5
         c8FkxXWHZmPb9Al4EMWr0o+bKcQMhpQfQ4WHUBIK50M2mDY++7ESQqUPLSrwsJ7wKC4F
         8hXx0fxs2fgAiMVYiEspE/bFgXEPQNyNxvdFMaADOzmAo7xU5yoJPZBSs1wIzJGP9vRx
         c2WkgPLF4UnVANX3zVpvvmBEF3ZD1/1NPfJ/78ZidYbqAaOzJtvJClcXN3lJFspOjbSh
         vhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751991; x=1788356791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JBRtmRYqTLQMALZTMnqF/HwOuWRZCxhN9n2QVCbJ84=;
        b=AOSO+k5+wtQMobHgrcMcDgw4Q6+lw4jGQRTZs443e1WKsk/LBD0Qq6FcmevgbByZ2I
         CNrmUXltNBKMbxtoT+b+VbvPZ03D7AqjGzuh6gaHIT12k54/SA57tbpxaNPvElPYop1A
         rQWYlWJRyb346Qc22vixtJRgZGdoc3RopqClP+ZWXZ2keibTtwcO0jVbASsZs1kU8BIF
         Wxd4Zy7P5QAghJWijxS9/IZMIVZPr7j/QvnCzkm4WqlLDFUwkgCtZxwIXv+tfnN2rb7T
         +DR62VtxiXPSgZ9l56BbHl8zNDx/DTHnPIsFq7cZTiVh/8JZLINhgFLecaLzT62YPAWy
         CmhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7mGXWf1vGCmOwjtpAlQYVmDcqjGGQxZQLx6PgtiwvEBDm1txxCdFDMm2zXfgjoB5X4uBSmZQqXV0Ehm4=@vger.kernel.org
X-Gm-Message-State: AFuF++m3IVe6PHu5XDRzO599R+OStJYxRD//zWcpmkn9WYBgH2QigP0O
	/W0pJ40+J3kDtC8AOZbOyjavBNQiVt7h+YXJo78VLBz6IoCh//AJZzjJgDv9dKmBIdr0HwhjHWJ
	P6NcT5bix1o722My6/piHSamMkkzZGCxq+Hbs9i0M5MinrLnyRL8UmFvAonICVoqGroY=
X-Gm-Gg: AR+sD11Y/gZk92V7qUl9Bo4EIs7g/q5dokTPHlLz7Qrhb2uNN09YkJNJ5xeVohOxUe8
	h32/iYq0CN3xaibEtrZSjcC6MBjg1AVzxO9pCYmX3i/qLQPRkKGJuxc6jy7d5cYa3u9Lo5f4ctl
	GUxd1ea7snw7FGMh79a506qrsDlnXaJefzMZTMEstBF6XYZTCWhWSSWFZj0gP7wNyi7koaeH4oO
	GxFkcE7YvmvTdeZAvfxWSsJFXmjSkVxviwZLs4aVoCLT4GYMBYIzQThJj6q/qkiX6056UGwwjLt
	NLt2xC87I9zCP7P3/g3xHlnPHQuM+wVf7HSplD4K4RvPVmjP7PcncoQizPLtPEIvzDhHaTCIicd
	XCeQio9QP/5NgfoZG+aY6UNIUPGxF/wmJZg==
X-Received: by 2002:a17:90b:5107:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-3966d9e5ecfmr15275583a91.15.1787751990790;
        Wed, 26 Aug 2026 06:46:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5107:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-3966d9e5ecfmr15275446a91.15.1787751990244;
        Wed, 26 Aug 2026 06:46:30 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:29 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:48 +0530
Subject: [PATCH 6/6] misc: fastrpc: Add UAPI flags for extended IOVA
 mapping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-extended-mapping-v1-6-d046c1cb9a9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=7568;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=uiIZuwO5p10QZ2Fwu25eLmhT5zkNnRxyXBK90PHFhnA=;
 b=b9udi084KNRmlYbIeP6jwnTsfea6wsIxWybCbnvzc3OJEpkNRvRxvT676jCz9Zl/51wnZtShH
 BywBCrbVmaCC8yx4DC4zE6Zj8lLW7OBzdu0KQfIiabVk2v/fDo5EVbW
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: DtnNSiNvDIF0Tn_RVqEI05E8lDdbE-4r
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eee38 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jcsToSEUEPbHcpESBJIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfX+u0AIzCY16Q0
 fstrWVHO7Hw7/o8J674h6HxvuS+hHycwUONwYtwvmYkbOn4yDe8aeM0fOTzEKhGnVHUBz1pIhT/
 4Ib2OYLatC9tOVAUUgWVPl5mavGjXUo=
X-Proofpoint-ORIG-GUID: DtnNSiNvDIF0Tn_RVqEI05E8lDdbE-4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfX1V0lClRHy8nY
 8yLB+UETC5jagHJEm5A4IVItrFGY1uGBfoczdza0RKaeVNdu8BDcd8hswjr2lPtxlSu4DAi3y6A
 5gKS3hSPSdegk7xcySyN5QTSEHJ5Lj6S7E9Dk1AMvai+0TAe4klyyrdy2l9tb9CpE+9xsaPRYJY
 8y3Ztdh5aHukBUyE1cObxdapKBeyC53GbsEjW+nCzTIEnxrHK1vpvK8zfUaiczAPqarsUt1xhS/
 NBFEhrauU0iZnqDx+xrmeZz+ikQ1zI9trhYkNDI2Fiy4nt+cSEttXUKjs1Qy1GeeEV8Uu4G5Hd6
 K8m5E0biBxUK6W6ypS1Xad920EpYeNjXAQMTXSi0Svc0fDUKBk+XU/J6DwfF6QwTDpz1FiUz70I
 KmOgO/lP1x2hJA2WRTVyhcIM4CiVJmlM/5GCPTrkrUiqsh7Y/rQHsHIhYiPTdGoC4kmflP/aAW5
 TFS1t6iXftDO9LHr8ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260114

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
fault on access. All existing call sites pass flags=0 and are unaffected.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c      | 64 +++++++++++++++++++++++++++++++++------------
 include/uapi/misc/fastrpc.h |  7 +++++
 2 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 28d89fd9cbbc..2f248667e734 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -83,6 +83,11 @@
 #define FASTRPC_MAX_DSP_ATTRIBUTES (256)
 #define FASTRPC_MAX_DSP_ATTRIBUTES_LEN (sizeof(u32) * FASTRPC_MAX_DSP_ATTRIBUTES)
 
+/* Check if the given flag is used for extended UDMA mapping */
+#define IS_EXTENDED_MAP_FLAG(flag) \
+	((flag) == FASTRPC_MAP_FD_EXTENDED || \
+	 (flag) == FASTRPC_MAP_FD_DELAYED_EXTENDED)
+
 /* Retrives number of input buffers from the scalars parameter */
 #define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
 
@@ -880,16 +885,19 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
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
+				     u64 len, u32 attr,
+				     struct fastrpc_session_ctx *sess,
+				     struct fastrpc_map **ppmap)
 {
-	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
+	struct device *dev = sess->dev;
 	struct sg_table *table;
 	struct scatterlist *sgl = NULL;
 	int err = 0, sgl_index = 0;
@@ -909,9 +917,9 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
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
@@ -926,12 +934,13 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
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
 		goto map_err;
@@ -954,7 +963,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		map->attr = attr;
 		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, dst_perms, 2);
 		if (err) {
-			dev_err(sess->dev,
+			dev_err(dev,
 				"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
 				&map->dma_addr, map->len, err);
 			goto map_err;
@@ -977,13 +986,36 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 	return err;
 }
 
+static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
+			      u64 len, u32 attr, u32 flags, struct fastrpc_map **ppmap)
+{
+	if (IS_EXTENDED_MAP_FLAG(flags)) {
+		int i, err = -ENODEV;
+
+		if (!fl->cctx->ext_cb_count) {
+			dev_err(fl->sctx->dev, "no extended context bank found\n");
+			return -ENODEV;
+		}
+
+		for (i = 0; i < fl->cctx->ext_cb_count; i++) {
+			err = fastrpc_map_attach_to_dev(fl, fd, len, attr,
+							fl->cctx->ext_cb[i], ppmap);
+			if (err != -ENOMEM)
+				break;
+		}
+		return err;
+	}
+
+	return fastrpc_map_attach_to_dev(fl, fd, len, attr, fl->sctx, ppmap);
+}
+
 static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
-			      u64 len, u32 attr, struct fastrpc_map **ppmap)
+			      u64 len, u32 attr, u32 flags, struct fastrpc_map **ppmap)
 {
 	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
 		return 0;
 
-	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
+	return fastrpc_map_attach(fl, fd, len, attr, flags, ppmap);
 }
 
 /*
@@ -1061,10 +1093,10 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 
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
@@ -1628,7 +1660,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 	fl->pd = USER_PD;
 
 	if (init.filelen && init.filefd) {
-		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
+		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, 0, &map);
 		if (err)
 			goto err;
 	}
@@ -2251,7 +2283,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
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

