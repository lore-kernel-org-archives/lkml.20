Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1021A2F8EA6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567357; cv=none; b=FBjP0EpOBc9dnAATg2SZu0MiArrznRQnDXl+ygDJFkEtStghq1jGtQJu7JYs/0xfXgt44XTp8QRgro+ItpeKyQAfzG0ZVcikRubGq/h4CB8P0QJrVXYpU5dihfG/4UjR7hMspQIRl5idevqkyrsSv+Wtfju2cif02sr2JLtZnEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567357; c=relaxed/simple;
	bh=GHNxxikT9QLpIgUS6EIzH/MuGFh+3LkjORHTaHUKBao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I1X6jfq4dxyP4PWtG8dKwmGgoCXMhGXryAFUDsiRexnRUK3NFKJyTz/279c1nj+nmTqzvrz0WLKdifSZlX2bvDtGCyqP2IbsWi9cac52eKlNk5599lD1fQpYDbRGsPKuz0cW6SuA9sXeS43fe+jGNs35DRN1drVsdSG6k1rAxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ot20cZCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbuT7Gs2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ot20cZCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbuT7Gs2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RFRniZ3413316
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/MsW5ZbkUGJ7+lrt9HRCBx
	yFPvkCAOM57yQ/PcA3bow=; b=Ot20cZCHPnRFmTG5HLoiKzPiHPrA/zsXXDDr/v
	QZ56g7T2YsPSn0Bhifs3npsbKrwKG+rBAhKm130oQvZmJbLOzYAjCPDHKE7/JXtE
	siCrEt7SGMbAN9REbg4575aLj6AeIBu/sX0HjWCFpPTBLMFq2BjtB/VnPkF66hAq
	HQ3IMblZCBwEPYTpzesfrYeDpRuwTuk3judlEfrLQia0wRUczHd6C4zsv4QWU6Of
	TV1AYxOIzQHqjNgB30ejOsHGGMEKKH4rIuzTrk+MSpVww3aqnXRSS6SwbWbyNmbp
	o3KUE69rwK6KtMTrNFgy3rmqd5Kt5IEvXBfmaUw+b3LuIFsg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526mfx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:49:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14a62326b51so26057c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790567354; x=1791172154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/MsW5ZbkUGJ7+lrt9HRCBxyFPvkCAOM57yQ/PcA3bow=;
        b=AbuT7Gs2K3U2HnoyAG5q/pmyp3rudpLx08qgk+L1q5puQNoXlsXyKvDcWhWs+A1geO
         AJEWOp/48ZvMibizTjs3NV/TaXO9HLDvxeSaATQv4gQDbC+jLzlSbY8ZTrp4lctog7Lr
         UabFuGblhkjq3k21Js9n1L52IrMrBNtr/yP9bw2DXdoaKDD3iCMaxadxtsU2P2w2s2sG
         U5ql7C6592/A7l6TsXKTwHCCMzJrvYYLyMOGw5abjMtuXSSnvfrtt+gIMg+S+MBHQ/9y
         FPL1jucW/6kwP6u0TwOWj5l/kP9VbM1Sp2RAq/g2BH8EfvycG8FABjVIUqV7iV6avVKa
         smMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567354; x=1791172154;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/MsW5ZbkUGJ7+lrt9HRCBxyFPvkCAOM57yQ/PcA3bow=;
        b=W8CcOt4C9fwAXwizd33DH2QrHOSHWo5vnUqpRwnxSqFGRAhn7CFP6oeF3QVmXLD5lI
         mtnmYxWSPR6xVhh1PhpqKz5JI03YE/cXksnexjDUkGT5S+lyIB0LwOK/KCiA04wNNj+c
         I9x+4W0yPIRY8IBCIPXhad3soDkF04N3qdfPTj6dckiS9XdhiP3hcOM03oX9r2WqHd3U
         nEoboR0sqNKQ8a+vgsri/ho/pzKe3Z9ooXZozOq/qJR/DBMb9fTLRNDd4HogANDoO5ma
         8nMhJyCqcTdRyQ1FnTFjbixYB7tzCCVrzAPtJzTFuvi3iR75/JgJjP/xJppxFqmfDQuU
         RzJw==
X-Gm-Message-State: AFuF++kqKpApMveIX9z3FCkZZIEKrfqQuwov7KAZkSSy8bnk76HnAIaW
	SGzUBlb0vocepVADVdvaF4EQsXHp1MNUHiWk4IsMw260jbmT1Mz+HuGiQRtSFnbKpjATVzcechj
	hzWgMlrtoFTJ0pcgmBgBEQtBjRjzknLpL5Vp4pS0uYv38LfAGjSQs1Wqd8FZePCmsTVs=
X-Gm-Gg: AYBFou0eZBezcpHRIyl+/e90dDcoivj0hytLU1sZ1R0NLap73t6ifV+rOsRzOeJSCNy
	mHPwS7UE34mIg+9jghJFe/060+D7d3H0ugjWQJRHe1w6+bq693ZOqGLMO0heAa0LyLJ2DlSbqQe
	YuN0gnZTleNRB87u9rd18pZne/TCPUzLcYlodc71i76LyJn0/15RLeLp6xRB1K4HaEjJ1VhUvz7
	lzful3HWsdng7R9B2WGiQjlth/DpT7jtsX7QtUyLm9jJxGC64xR6aYyjv/LzRsEXHdcHpn0nMpb
	LQoIzi1LRjtgCAgJKZy0LfSR/tf+APpB1fchBmZSh3pLMLp9Wt/2LZMJNOBX6woL35nvyZAsedI
	P74IgYe1FlPt69bNGXS9wVk2c5z+TgD8Rx39eyW9/m4m/
X-Received: by 2002:a05:7022:5f05:b0:14a:94d:534a with SMTP id a92af1059eb24-14a094d5631mr826091c88.12.1790567353825;
        Sun, 27 Sep 2026 20:49:13 -0700 (PDT)
X-Received: by 2002:a05:7022:5f05:b0:14a:94d:534a with SMTP id a92af1059eb24-14a094d5631mr826064c88.12.1790567353213;
        Sun, 27 Sep 2026 20:49:13 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm27564961c88.14.2026.09.27.20.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:49:12 -0700 (PDT)
From: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:18:56 +0530
Subject: [PATCH] workqueue: Fix NULL current_pwq deref in chained work
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-wq_chain_fix-v1-1-e2f1f117d1f7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKfjuWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyML3fLCeKBEZl58WmaFrmWasYWhiZmRaZJhohJQS0FRKlAYbFx0bG0
 tAInQ2h1eAAAA
X-Change-ID: 20260928-wq_chain_fix-9f3814625b1a
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790567350; l=1698;
 i=pavan.kondeti@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=GHNxxikT9QLpIgUS6EIzH/MuGFh+3LkjORHTaHUKBao=;
 b=6yaq20KX3YOJgagD641GS0k+ixXhHdTqex7fem7xuAHONIYQLJZuSACKEFHm8Se7JVFyz1Prq
 T8ioFWioba+D/k2w3bxjQKWB6GHpbuGqJheFChWPhjWJwhB9Kx0MU9/
X-Developer-Key: i=pavan.kondeti@oss.qualcomm.com; a=ed25519;
 pk=Pdl9NnQpMlqbYaAGGkgBGpURTnZFe2de5LRZSGHkbHY=
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab9e3ba cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e4W3pGMeCwio_Ou-9lQA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: NwHUKT7n-F-yFk3H2v42HT-9nVY2MCWR
X-Proofpoint-ORIG-GUID: NwHUKT7n-F-yFk3H2v42HT-9nVY2MCWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfXzJzMuVZOAtLy
 k7rDyKUPEE+Jg93qPwDPkz1WXlvjoqDBUseCuMSVQsoVuKWAbvQx9RAzI2F4lfIm8Ft60jYuzCE
 9cP7T/2GZbEePzGF7TyFRr8XYzpx+h35ylvffKBBUh1dtjh2pBsFsw2LddhCHrqrNyt4h4Aix2b
 MMoqM2sfff+Stp90oQ4QztRCtVMxbNIeeJP/yHGGia5sI4T6PBEEvP4Qv0Jq9tq97IXsEmaebvL
 AnnkFuzhsRnf2SpR8Fj0bHKNZHpMG+Q6GR6VibbroUbAqe4ZSd6/l3rAhhKsiQjwrKyMVfko7Mg
 J5g1KwU+CzVvxnqQB7O88YBF7ZX4gx6L7AmR5GqMNetNLJnrweHGIDBuKOLiBx93swBEh8gFOfV
 rcNRUbQ8BovUme2mKDxMk2aj5C3Z9JMtyWsFD3JNWdpUWlTgTUVptiuhNII6c5OsmqYfsSdxrfS
 OPS4SwBAI6vmOX5AbLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfX1CWo75fAiuyQ
 ypANKwV+Sx61Y2CNV0v/FU87yx5R5y32NJdTptNYPF9v8UnTF3C6sXR+feflJWhH/lMHVI0X/Fd
 mYnHbYeiBdjyzs8mKNtzdhU9Dz8oSvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280015

current_wq_worker() only tells us that %current is a kworker. It does
not guarantee that the worker is currently executing a work item, as
worker->current_pwq is populated only while process_one_work() is running
the work function.

is_chained_work() can be reached while queueing on a draining or
destroying workqueue. If a kworker outside work-item execution reaches
that path, current_wq_worker() returns a worker but worker->current_pwq is
NULL, and the chained-work test can fault before it emits the intended
warning.

Guard the chained-work test with worker->current_pwq. A kworker without
current_pwq is not executing work on the target workqueue, so the helper
should return false and let the draining/destroying warning fire.

Fixes: c8efcc258946 ("workqueue: allow chained queueing during destruction")
Cc: stable@vger.kernel.org
Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
---
 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 959525393739..c56c042d1c35 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2290,7 +2290,7 @@ static bool is_chained_work(struct workqueue_struct *wq)
 	 * Return %true iff I'm a worker executing a work item on @wq.  If
 	 * I'm @worker, it's safe to dereference it without locking.
 	 */
-	return worker && worker->current_pwq->wq == wq;
+	return worker && worker->current_pwq && worker->current_pwq->wq == wq;
 }
 
 /*

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260928-wq_chain_fix-9f3814625b1a

Best regards,
-- 
Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>

