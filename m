Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540E4AE108
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378068; cv=none; b=HBdpsHH6cWtX4hpmC2k5KDTVoMsJiKLsxLSajek4ImT2mMMUTKMwiD1be0s/p7awfg6rcEyAgsxx9BYWZf/IZhmThPyDy/On9MoUrNqCugi+1IWxd8syDDkopvx5tR3bF80WymCXzWT2jNpNi5UaCaZrAY2qPvolU3bckerYzrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378068; c=relaxed/simple;
	bh=L8/bS4ZeQfNNlInWDRNA9f3NF2qTZmNCt/3/vvmuChQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbY/s2gbWSV5GoQt8CjZA9hW/e7E9vbmtpAXf8MaCW6TjPSNSBK9Fmu3grX5AQ5qgh7mqq5y03aC4Vos5bFb52xZAxLn1d/lj5zstRuvh76PYIBco3r9n+9a/q2aPytuS503AGreDlRKpqhm6jFBzmU9UhsjA41g7oQllAF8Zew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDqjlIYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMEUn9Mk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDqjlIYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMEUn9Mk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrwoJ2731243
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HcBBgWhUa/fey2yq1Yy4HHcqCYRd29uAL6v
	U55hKPm8=; b=SDqjlIYfsZepEy/U2IDe3PsHymz1seGb/9lY7sGIdRXHOfQS1XS
	dOAnPRWPBv6e/A1556MBtCDxnV/9FJckPuLHYsYfzyggFJMyufYjevXR7LsV9GkB
	x1wJulBrYUBxiE+SZZGAk1HgCAs2SCeu39WWme9thm3uaV1GPxT4iieF8L++xhV0
	SMg0geq8s08ck1HocycDfLa6MiK0aS90I1NzEQT2jefV1MBFvYAvIo7KOSFHFyY9
	dCHRrFiRg9qgLdtgT+9kY5yDEV9apgljUZ/RFP9ydc+oTDNQxibSeMDHxmzYFuSY
	LiV3Z9+hw0UPkLR2txlr8otQdbNpxev0g6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2p6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:40:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2333427a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378049; x=1788982849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcBBgWhUa/fey2yq1Yy4HHcqCYRd29uAL6vU55hKPm8=;
        b=PMEUn9MkJYyRw3ft1f/5+giyUviGh3ZR0t3dRsJnjW1a9Wb7NtaacjMzxJUJlhBjSE
         PVtz7G4l729AlCaf5qR1QQ3orGyOWkCkc0FQ7V7G5eabyYv1OjFVsAc6BRyzmZXpqyil
         WqRKojsVrbESZfx5jFtQkz42wW8J8Dmo22vPwSrikFI/HOXIVC/NSuqMSrESaUNMsjFe
         Lkg1JjInPYP7dRg8p4PN/660JAPXuXCrwE2WNIiZweefPbZHYKZ0zI5m4hSoair0DOOh
         lNUE7dkwUhCnm52IOkMmp26uQKi/ij6k82ZG05LMLgNB65HI8bF4gniQidjmIP53JTtx
         H6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378049; x=1788982849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcBBgWhUa/fey2yq1Yy4HHcqCYRd29uAL6vU55hKPm8=;
        b=WA11x1BR/AT6x9HbL9kL4XfqOuFrCMd3nXEPcNQNjc75aP/yAgtN+bp8FgZutqSm0a
         m6dOPd/58YcUa9Cwy0HrLXeABKWLIHXHrHPsTpWL/+/yUJDWfAM/AbFQi9tZLpaobxTE
         K6lFoOFd103MBNUC8CYbWaqT6WVFZGfS5T/kWKg9CV042Q8AObrCJz79HVWiWWxwX1n5
         Yi4NYnTKGts/YV6fNGj7J8q8GEkVo3+AaXpCa5ZOQ3ZtNRwEsKbD3AR/1B0hntPJ/flw
         /BQT65Nz0I5QA11FSmrX3SGq794WFnugJrS+TVkTt3ymaRt2QTvcWiUROpPywxXPEzbT
         MHFw==
X-Forwarded-Encrypted: i=1; AKwUvBz0YfboclNrwdgGr2LQ1iuUnaRXntqkLM+z2zKGOngpOgvs4xZC8HvnXEfQX+/SmZn8+6U6ZR/7gVGCqgA=@vger.kernel.org
X-Gm-Message-State: AFuF++me53FyjWZIhNW00Q/sGM+MiaLEdEBlDrPPg/lQLnUHsLV6Fns7
	YJURDlSR2mD8MviZviRTO6bn86Pp8YZAGO3cMD5Ld2CeU/f5pJdW71JhRAOAfCLDL4F6ZUj5U/J
	86NDqQt0vAcRzNEHUAI++yb+1EafOdmnS1VrFnLOifGDNCIWNEC+anGu0I7ZNMEd8ts4=
X-Gm-Gg: AYBFou36TbF4j2J72fUsslx3q0W5hCy/8NsJBNOyQkQSOvh4sjvtua01HINs67MjKsn
	Dp1LL4whpFsxs11bCySJfJoK95A1b6LFDLLMYNrGd7JiKrZJJc6Wb6R04IMbmH6NbZPFLy1Lw4M
	e1T40mi5DsRbVV2gajVLs3xIKYIvlDsRDxxyJxCDbTIlD14ZxVMapDfp2RbFkrSN4UsEbVqKRSx
	m9tg2cFHLZfCZgfZewtOfg9eCAaEmKdSnKkMk1vtUTURnPg/lVK8eC8qTGfBNxzqmtXyirNtKZs
	VJRu5SlddC8URNkFimTqdbvU0R1qKcuCxsQ2s/MfFVzNBFo4xwSMFIncY5saDjKzTxmvba0sbPc
	xkF1Zg2+QPMz2PcxBjrQxoxLGJws=
X-Received: by 2002:a17:90b:1a8a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39aee0e5de8mr10045287a91.14.1788378048657;
        Wed, 02 Sep 2026 12:40:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39aee0e5de8mr10045240a91.14.1788378048115;
        Wed, 02 Sep 2026 12:40:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319875cc0sm304877c88.1.2026.09.02.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:40:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:10:41 +0530
Message-ID: <20260902194041.1999834-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987bc1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=12ZugxYpoLeGVrRS1ywA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MTKVFXZ91Sw_NtOVpD9vQLHSi1fzQ9ur
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX6baFnmB0LRnk
 HhysDRkoy6XhMTYubv1VmLZx2/UGDYJbRctkvCU4NwXHlogYbPI6Jand4/vpbmcHaZUtqhFbhk7
 RMzTjhOJsX1S3wECTb8Ib0s0/PXLin4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXy8y3LGi+sgQl
 LgCD7bWoWgv/kPB4DHUZdqeRiqj7iip3xNp7pcP19RVQfnqsQItfQTvuiJehnxW1EqCbyNCrJI7
 6qcWAo5ZQzHYDI2kWzk7LdCCclg4xCKMJS5BUwp8H7DOFFReNoM2gH69KE2S7r4dCTtSiXD20Sa
 pELBG+yjpURXp3XfwEiNV79GJ42eqk2cHk8W9qGstfkyVW3aRA/1+wq0uuqPz3o5qGE1VvgbOGj
 yx7jUGKbmw9amI7uJZjFDHkJN2Da/BNzkSyP5mr5H6g9k4DqaoP6vjaopMJpm4ypCrZkp/kUjH4
 Mr4TMctRGHZ/a4DLhz5jlCAFlvkYRotozZVKh25SkQNca08Re7jEN/jJpkpxWmLWucWKFiXg5n8
 MjGtY0QNvBWoB2W68TOsspPNTEVRBrdeP1OQXSulUdHzTKH+bR4vQckYKxffQ/AlZfHvogvCycE
 3vp8Rd8AntZm2G/NwjA==
X-Proofpoint-ORIG-GUID: MTKVFXZ91Sw_NtOVpD9vQLHSi1fzQ9ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried Reviewed-by tag.
 - rebased it.

 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..ad248e12fe97 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2558,7 +2558,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.55.0

