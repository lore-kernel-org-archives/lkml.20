Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5547C0F2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935960; cv=none; b=YSqzXd0tBPEaDt50c9dm6PjA/WCn3dH2/EoujkecNC9WEqrwbqMuyZ9A8DYEQIhX4FPrDESO96rZdkZOviAcsJo8ZOrDCrzFdRMzJLqa40QlV0JJdfM6xaYWjIVC4UyN+rBrVxSj34dn3UjM+VpktB1nkxFk5DXqhEsTqJTH+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935960; c=relaxed/simple;
	bh=B5fX1NUZL+hVJgVRjIVdI6YCk2Nek1XvofR+LSluCN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmDIDot77ZHjWYykf7MOjsJgwzS29g2r4k70i76JYiq7LzmNSxeHu0107LqOd3CXjU0FW3UsEhf1o8wh51jJQx4vccGi7d4HzN/JvQSDtXUxlmHV30NyrtHgx583ls4U/wmm96unRL/dq6bmTmijGSvLGd6sKO6AL7oQ8kNLXAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXtRdy2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gafqksQ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXtRdy2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gafqksQ/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nU4M206804
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+9Gf7Le8ssJ
	BQEljUcs6+njQi5ShhKdlcuxnV+fQxXA=; b=cXtRdy2AZbO3tKigNUB4AIPYnds
	a/9AYHcBZaxQLfBbHM6lF3N963BJGnkXuXXwdGHTeJc2UebwoPrUgosR3mStHoSb
	0saj52JSyukV/8p8TYkjHLH0SS4rYZ4mEn7aHles5TDpgCG0+jOHS0xJGJbphpTh
	6qssdOmweq6aJJLhxKZIDI5bPYX6kzewHhFDovnY6jqh0rhCpYf3T173nzXDxFIU
	GLzb+sSmlqI8jiVB1rMFl8TzihhFjUJdttsX7B6cimt6KIQdg5JxVz4KOmEB1bct
	tDZLzPi/td9A29JR3V6/Hacc20j1MOUvbwrI2sPB+Bj2Q6AJ3+Py4SyWdBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v0331pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:12:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so212033385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935957; x=1791540757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9Gf7Le8ssJBQEljUcs6+njQi5ShhKdlcuxnV+fQxXA=;
        b=gafqksQ/wWXw+IWSMA5jY5PGkMCgXD1xyWea/vcnZyxx4OLGeED7Bpm9ND61oezNKr
         XNREk961tcm43NwEYHKaEZDjgia47Gk9iyyn8gwaeN8k07BN3ZNraw29ANmuOl1TyOto
         5LaRGuQ7pDiPlovOS8+n90OgtyokyhCse9qlyNuxP1R9cKHVw3JmEMiKUMBGHlcD4bN+
         YgCOp5akOsqdJTrwyALXkCEXfOLCu+jpTZkeqzprtHGUqLK257b8hDlFJv8vXQVvzCcG
         24EM2BuhRLW6vEihrDl/wK5a0PEP6wm3jRI4tCb93E2bPOBEo26L/Ze3SMAbBei+zjwW
         Uk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935957; x=1791540757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9Gf7Le8ssJBQEljUcs6+njQi5ShhKdlcuxnV+fQxXA=;
        b=HePWxeAiPoMlIbrGBPuvYinDLEQeQKEeFHiSlOm6TjGQsLpJbCKQcNPIAYzikgv80e
         dFzZSFWrlfs7CoQK2LPvvX9RZsIsThYvXYJ8wQSOwTwk2UWHiRGqLCaC1QLhTlbGvrjI
         ei7wETTsV4yYjzto3A+yGDTUiaxfv+HG2iuWP3hUBceoF669PSf1iS+XNDU4YInDhRjK
         SCUraWHmPUb6lNrjMLDRsWmcNouLZEbGpkL23N4NvlC+DEAtmhMGs0pqB07I33H08wfn
         Oc3xJkAUG0CPqmC/gMKZGxAo0tgSy5BL8XxBl+7OcLG64tZr0f845miJvCI1GvpAr1DS
         RcbA==
X-Gm-Message-State: AFuF++nLoFgQ8Qsm6yaB7hpOA+AR+HvDqWCORL/AVulFZw/VTevztOw6
	9O4hwXjI+01LRjo6cf1gt/ahh1Pj6apPmfWof2ryFHLiNuob0yTs8qdwRucwv4vCci6z3xiMdOa
	V0PvwJf533xgMKv1dMuMfF4OVxUEHGAKn1U236jwxl1X5gEnQ5UwQLuZiHiiJPh4Ligs=
X-Gm-Gg: AYBFou3saR9dxqM0iiBYx1RBQxiOWBo10Sw6DU6CzOmJUG3b/Q3uQlqxohCf8a7RxMq
	OyK1nKv+wFetrPLjbwpGXFD9cQFjTW11Tku8pT++RLWxnGXi8gVKJxMEkJdniktvqWLWa9ZSpx7
	wo4vnWHBejA8MeIfyhB24YxI+ow0IomFROCInMudJ8lhwQQKE3dpabpt1y5OMhtePHujxB1lQ1g
	fTw93u2wfekPlX0yz0/345XDlzMt3hArsmWoaiFG4XyCnVu7hhPL3xrGGP3MdjDSOsxREk4Ai7v
	WzK8uvFqPyxlXxoiOWI92/tlIpxAkN5VKLasH7JscRmzA4PABPEaz7sOQgnCyihvHWQmiEbTTy3
	EgEbuF1UeL7Au
X-Received: by 2002:a05:620a:2b8b:b0:93c:a45b:b07e with SMTP id af79cd13be357-93cf174b1afmr329199685a.38.1790935956782;
        Fri, 02 Oct 2026 03:12:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8b:b0:93c:a45b:b07e with SMTP id af79cd13be357-93cf174b1afmr329196185a.38.1790935956167;
        Fri, 02 Oct 2026 03:12:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm39689195e9.4.2026.10.02.03.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:12:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, Yifei Gao <gyf161023@gmail.com>,
        stable@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 1/2] misc: fastrpc: fix double-free in fastrpc_map_attach() error path
Date: Fri,  2 Oct 2026 11:12:19 +0100
Message-ID: <20261002101220.1084101-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101220.1084101-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002101220.1084101-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX7X8umz7RvZye
 /vbM78T3xvwMEMq41/gaC9TyC7Y8nlvsy2epMMZx2HMnXDmgeJWvvEcon41vzPk9Etyb0N+t48l
 tVDMsuGMVJ7m5KqqdjryglpTvQ875uA=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abf8395 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jl5AnXupQmoaVApxsvcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IeOdqEfBeaQ2TxMS7tDoobXcX3yd1Z3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX0jZkvonKgteE
 ABeG5PbQxXp4W6pvxK60DO1DTrxhTkvoCaLg0bmt7CMG7IE8Mg/3fbPTOAHyHLheuZZo5tNWXnX
 eZhZ+GA/gz+Q0ORYgqSxaxhOHDlPWlMHGzSnT9rg9KUEAhy6keA6fsy7C/hXeuyMDiGvWq0DH3H
 SUtZpjUrmcYdbRPMuRvvpcKoN3zQm7piKEOXTlQrZv5FN7GGZXKGo1xtkZ/mRH0jGCR6M4noRnY
 b5ejiQOEn/diTsC8yjz1UN0bBOA2oOGzDDQAwB5x2XdE4FU/0juGRO6Rz5SPbixie+oMW3mG5sE
 GFKiQnQBW2Xn2lTggeWyOf95B51HwLKzTRmaCJZ7mr/38yCQ8E/BZHSlgVmOAbg2FJL5knRQa5D
 2rgA068+TFoicqpRvZpIiq1FaU2zQ6r5rcvT3wnBbcWyT3jJA0nHwzPqFiEm3X8F2uXoY1Aao9q
 tLMxu3d/TdbuuCx3RsQ==
X-Proofpoint-ORIG-GUID: IeOdqEfBeaQ2TxMS7tDoobXcX3yd1Z3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020040

From: Yifei Gao <gyf161023@gmail.com>

map->table is assigned right after dma_buf_map_attachment_unlocked()
succeeds. The two failure checks that follow, the len > map->size test
and, where subsystem VMIDs are configured, a failed qcom_scm_assign_mem(),
jump to map_err with map->table already set.

map_err manually calls dma_buf_detach() and dma_buf_put() and then falls
through to fastrpc_map_put(). Since that change the error path tail is
fastrpc_map_put() -> fastrpc_free_map(), and fastrpc_free_map() already
unmaps, detaches and puts the dma-buf whenever map->table is set.
The two operations therefore run twice: the second dma_buf_put() drops an
extra reference on map->buf, and dma_buf_unmap_attachment_unlocked()
dereferences the map->attach already freed by the manual dma_buf_detach().
kref_init() sets the refcount to 1 with no intervening get, so the final
fastrpc_map_put() frees the map synchronously and the redundant cleanup is
deterministic.

The len > map->size branch is reachable by an unprivileged process via
FASTRPC_IOCTL_MEM_MAP with an fd whose dma-buf is smaller than the
requested length, before any DSP invocation.

Route both map->table-is-set failure branches to get_err instead of
map_err, so fastrpc_free_map() is the single owner of the
unmap/detach/put sequence. map_err is retained for the
dma_buf_map_attachment_unlocked() failure, which is reached with
map->table still NULL and an attachment that fastrpc_free_map() will not
clean up, so its dma_buf_detach()/dma_buf_put() must still run manually.

Fixes: 334f1a1cbe03 ("misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 90fd669636ec..4a18081845d9 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -927,7 +927,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		dev_dbg(sess->dev, "Bad size passed len 0x%llx map size 0x%llx\n",
 				len, map->size);
 		err = -EINVAL;
-		goto map_err;
+		goto get_err;
 	}
 	map->va = sg_virt(map->table->sgl);
 	map->len = len;
@@ -950,7 +950,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 			dev_err(sess->dev,
 				"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
 				&map->dma_addr, map->len, err);
-			goto map_err;
+			goto get_err;
 		}
 	}
 	spin_lock(&fl->lock);
-- 
2.53.0

