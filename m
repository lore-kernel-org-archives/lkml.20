Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E017C3C9EDD
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255563; cv=none; b=aoVnxddpBS84lFYnS8CCRitR9mlemb+Jaqa59kUrXMMQyiH+XD/4p3iFM5RfPy9gYTofUnbS70zyn/Qd/Z1qvYy2b0PrcHuQ714z71vCT4zRbF9i6TRECmRDaox5o9LdmRCLzD2ovwy5j1jchA+0fFOQxbRBOgYIjB+iHHH5JNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255563; c=relaxed/simple;
	bh=y2HuiGmYrkMQakMkx7nn26kY84ntqT7z35v0kkfuiNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjyjLGWwGzmg0+6y29Kdp3IWPe07ldp/tU2b5SJtRtxTjB9cbhGKJogLvX1JqbblOBny9ddgm+Hcbe0Ck2fg4iOEpCoIgV6UIgySRxd5kYXNvSS1RWKT7zczBQd7mXcDVCVHUhIe5zUFRtycmRQWe2+pHsyz6nFQUljrMOW0lY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjS/bVKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjS/bVKb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9pg41520531;
	Sat, 17 Oct 2026 16:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iDwZ0XYeLmHiFhJC9QsPhKAtQJHKsWuIwvy
	0duUn8Ts=; b=DjS/bVKbiVSla4zNdykHjdTQ6WmemDkfSbWQRqgbHb5ULORbvRe
	3Va8I7POIvbTquDubAZbboJxahq978EcAA45VUi3CBY/ZoY4FKsMcR8352+3oOVT
	QnN7HZYetcgj5uoxx1mhma3HvoP9DKzcyPNBThrh8x+gO3XHF/sj47TXCHg56BlQ
	dBJLPasHyY1Jk1L/lvKdTr5yzrbXHBiyRw2LExU1plG9e470DugTgONjeayz7fvp
	l1PY7Z1VUcDFt5VTzgLLMTQ/vr/e46Xe49FJkswE5/ionuquUvJ+bMsqCLgirszK
	c1Ecs+csGHdkLrXZihXfqwTgcIToe4YypxA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839bm6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 Oct 2026 16:45:51 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGjmAr1160759;
	Sat, 17 Oct 2026 16:45:48 GMT
Received: from hu-aalagars-hyd.qualcomm.com (hu-aalagars-hyd.qualcomm.com [10.147.242.11])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 69HGjm1v1160735;
	Sat, 17 Oct 2026 16:45:48 +0000 (GMT)
From: Arunmani Alagarsamy <aalagars@qti.qualcomm.com>
To: jpoimboe@kernel.org, peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
        Arunmani Alagarsamy <aalagars@qti.qualcomm.com>
Subject: [PATCH 2/2] objtool: Fix typo 'teh' -> 'the' in warning message
Date: Sat, 17 Oct 2026 22:15:45 +0530
Message-ID: <20261017164546.2992581-1-aalagars@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXxhy+Qkdaeazo
 nfy7kqpBaVE29rTDihuZcH5fcVphiciRTiqC1emEgC1JFW2qkfwpUBQL9r5Li+YB9MKUerhkyQ/
 rFziVuEpzgxi+wibmQS8vrCESD+LVVE=
X-Proofpoint-GUID: E2fHOqRkkgcOIp2JVGoORx5jn6VuBxXo
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3a640 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Jb6nx8nps2OUH1VnlMkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX8cFYd9yjkrZU
 nQ8dLhQmHX42+qrmIrQ9SEgRdLyOPhXQE7g31GVKuheWgxZZcl9PQpgyrcTMxSCAEGRbNr26zhQ
 XHRBIEbj4KgMR4wFGKQwuitmfWoZfcDi/GGDuUCFEJlOeisYaMp7cBkBPbM7rBmwxmnsLQldxIw
 tvTHf2KVwAnlUWAUcRwqfTnVIXc3YH4afHkTt40Fu0Uy0/vNF9YcnI2dr/mDDJkqmTDmEJGgPG2
 Mhuo2YNktPo5fZVEjL1Rnlpl5ZKvktnHPC9Pm7cHBXzcndWpVxXC9Lu3hr4LhDwuHnhw4xwWTS0
 GI7LpUaItszSu0ddRIg0RIL/Zcv1Sg49Pa9LX9YKg7UVkEbtIZHt6d7NFcltRcQs7VNRTmwhPWR
 P0yqtYJgeV76KVbx+3OEFbHeiw+Ruu6xulsfg3P9jNZLiBe3cmJzDhO+cCecQFRsYTiNVcG0QPx
 R2+clElDyxDFCMG/tMg==
X-Proofpoint-ORIG-GUID: E2fHOqRkkgcOIp2JVGoORx5jn6VuBxXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066

Fix a spelling mistake in a WARN_INSN() message inside validate_unret().
'teh end!' should be 'the end!'.

Signed-off-by: Arunmani Alagarsamy <aalagars@qti.qualcomm.com>
---
 tools/objtool/check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 464f6c9d9ff0..29222d12db15 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4122,7 +4122,7 @@ static int validate_unret(struct objtool_file *file, struct instruction *insn)
 			return 0;
 
 		if (!next) {
-			WARN_INSN(insn, "teh end!");
+			WARN_INSN(insn, "the end!");
 			return 1;
 		}
 		insn = next;
-- 
2.43.0

