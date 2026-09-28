Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD92D29C8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567756; cv=none; b=DzmseHayJc6yxMwciKY++ys4y+Aph0xoxVrYl15F9hJmw/obG+1iZ0EykQCTGTDdOrMw7XmI6CIIgcXhU//icajWvoKLdfsyluDqpwIX8kXe0O6g0rcIWZ0y45Vi3zoJs+UtHnxNHNPX5cOJNV8eRV4sfBYzTuTdmmv6ygsJj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567756; c=relaxed/simple;
	bh=IZcAabwyeorI+PfxCVfb1Pf5iolJwcSyaAM/XpwMu8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OU/1LPiD30WfMGsGtm7oKbsRzDNKklAuEmuNC1HAVTnCxGsyWaPotyVWq9waiWw5l5CIih8BiuJAEhgdHaxnyK8CDShhzLFw83WlbC1zR9WI4e/eakMNtuVTOajmaIianPOqnHiX0Tzvdyvgc5rn3vPXACAMnIZGwX72shua/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEckSgdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxx7E1Wu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEckSgdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxx7E1Wu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1BAT23455871
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GYkc7pMuPhIl7WUzz6I9Wd
	3ehyVSsbYAi6I2/mvmKK0=; b=jEckSgdjx3Efmthto+jOd6LOdlWzACow6NXQz6
	sDFSEGoGe5vEz2iOS33n4BuuTq54WEATNmO7kTQtci2lHokxELgt+DhaDcTB5mIg
	7/G7wIHCabPnR10yBOXPv2cTTUPj5MypxZcIlaxsRLY0DjdjfThI1c7jqsqmpo8m
	lH7N4DRbPzmR8ihlBVC1Wz9A1CMzoJlU/vMBOro4Ha7NL/cf9KO7NSE0UpJcZngB
	HnruJ48MtJ9FhLsruGmFWXEUAmAl34viCNcYtMcXjGfwvjkib1T3cOmsioznzHFq
	xT4MhWWOO/4GgSBCg1x36ZpjCbV1IimkQ2APLtM8m+BJRS5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq0cx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:55:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34344599f01so2584396eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790567753; x=1791172553; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GYkc7pMuPhIl7WUzz6I9Wd3ehyVSsbYAi6I2/mvmKK0=;
        b=Bxx7E1WuAIKiS5NZTvOtNmex4Y6Y1LAt9G1Ib07H4TozBy/rMT8vHhUsohzxcC6LwG
         TR5OGZbjhRc3ucyHR251CIVg92cIKY2NWs+7IUZNTujWZU0WbPY8MOfox3nK1UCbhJBN
         F6dtpr/FwYK4ZLSMDEyg00wLxyo0bIkHknD6jaHHC9AbGThjPNcv1bySvqmsG0eQQMxk
         Pn/drhaXrg04A4I2XJ1CNtDADW/0WGumkMXTco62+gvVFQp3k+9lVmettGrl+xw7B+ZP
         qeEe/qF+DobDhYZKamzghNc71NujVWaY44ZuR2CvEwwbiDAdvvSW6meVi4hmWuE9Pq9+
         RFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567753; x=1791172553;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GYkc7pMuPhIl7WUzz6I9Wd3ehyVSsbYAi6I2/mvmKK0=;
        b=MsHioet7OYuSXe7rmahDcNh+gsxi3Vi6KW+AcrMKBW9CkdArCNMKAJoBUvSWUb3jjo
         FZzbKhewXYlaJwsv2M6Bx2/WRSEvfwsKNSIXHoRqEy3gQTxz1x/U0NTFJcT0Z3xrrceV
         HQBCkHTZnxhAggz3tImRc0+QhdBSZsw2ZAGznwFAhso6OwFTEBWrkWQUtC+l/XbHaAs7
         1hu7yPUoBkcW+kFbAISiSfbX9i06NbnvMbyJlDLsQ7oNHcws2fM5yHy8+QzbXQULOeJg
         TGFW1Rci/bdFhgdNVjiE8owBDgskpzSeQ3gCuFVdlaq7qg+RWFy88vqbZ2h51qZrlEMC
         etUQ==
X-Gm-Message-State: AFq9FYIVwtx5vVO2zbVmDyO+/L1LGepO21MT74WiAWHWWaVcJTOqWQtE
	VQC3kUyyM5FgU8bkCm7Oa/SxNfUdvBUvO0OjxpFqH1+cgf6QLw65721GV24zK/BYvEmncR8TT12
	IIGzNNYC9/kwAZOJHpWFuKrqvwaytxvcqTU3WTwVAzweNAG/Kb7ReIYnUgx4Ej4piS1U=
X-Gm-Gg: AYBFou1k1Lz+muM64YQk8OIZuFkVH5zIk3E3JTdRlDHgBZQ6OJlm4tQJyQy6PkQDJ6z
	Td685i/5oiB3TgWRgXKIvDsGTfc3SkV5sNkV/iI/LfoXUVYLeOpDu2W12lTTdncf8UgxTDjn5rA
	1phlmjHUrlQgcU2u4iYLLiy+PBq5ciOk7Bi/w4zMCJEcgYRp3cph8M3QKd8Q/jwCEBJ5tu1nUu4
	ghm9tVkqZ3qHECZLch0gFVJg0L7gg2ykCMnyYn14hywRn+yYDk7tB0FJqDKlnayI5t76FhVsoVH
	lbqffbNm13KWi5ILCFOkYy6roomnrTxLm06OHDVAu+tNgryj4Lh+HbKFCPMoQIZ2RbqngYFZmjN
	IFl7YxFpAEduZb8o+S3s10kAi3zfkDcuq
X-Received: by 2002:a05:7301:1a3:b0:33b:dd20:f78c with SMTP id 5a478bee46e88-34272e5e6aemr9183641eec.34.1790567752964;
        Sun, 27 Sep 2026 20:55:52 -0700 (PDT)
X-Received: by 2002:a05:7301:1a3:b0:33b:dd20:f78c with SMTP id 5a478bee46e88-34272e5e6aemr9183610eec.34.1790567752371;
        Sun, 27 Sep 2026 20:55:52 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm20863251eec.10.2026.09.27.20.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:55:52 -0700 (PDT)
From: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:25:46 +0530
Subject: [PATCH] workqueue: Fix NULL current_pwq deref in mem-reclaim
 helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-wq_mem_reclaim_fix-v1-1-0dd37125cf47@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEHluWoC/x2MWwqAIBAArxL7nWD27ioRYrrWQvZQqCC6e9LnD
 Mw8ENATBuiSBzyeFGhbI2RpAnpW64SMTGQQXFS8FQ27DunQSY96UeSkpZvl7ZiXtbGqsBxiuHu
 M+p/2w/t+WWZ/DGQAAAA=
X-Change-ID: 20260928-wq_mem_reclaim_fix-39b357dfa4f0
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Mike Snitzer <snitzer@hammerspace.com>
Cc: linux-kernel@vger.kernel.org,
        Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790567749; l=1539;
 i=pavan.kondeti@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=IZcAabwyeorI+PfxCVfb1Pf5iolJwcSyaAM/XpwMu8k=;
 b=dGCWUDos1qxLYOGsA3K7uh5VxvgtO/VKbrQKK7Ek/En2iSxphnDOiAzKZmYeXm17lzcuQbRjq
 2z0ydHV7z4kDUv9SF/Phgjm/JrzXvSeXES9l06JHSsnHbL5kPIjC2Xi
X-Developer-Key: i=pavan.kondeti@oss.qualcomm.com; a=ed25519;
 pk=Pdl9NnQpMlqbYaAGGkgBGpURTnZFe2de5LRZSGHkbHY=
X-Proofpoint-ORIG-GUID: 1GshTRKRk2s1dFsURpslguM03T1RHtQL
X-Proofpoint-GUID: 1GshTRKRk2s1dFsURpslguM03T1RHtQL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfX/cuoo/YfTR6V
 IBFdHW2RoYGmdyO8ypR8CMAByOztqQjvmnFd8Hb2YOLjCHwPvbrKsfJOmx35SwYr+D4B75WX+63
 u9SC1VosNKTT+5ApTuO4S8ABTHj4r10=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6ab9e549 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=deh_Qxz_fmYwX0_qHPQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfXw5sBOKNfeqLy
 AOVncbt8rxlNVxSHQ/PGtBffB2ji62257y4E8L6/479y3DST8LNNK27/k7hlrcTf/mIMqr0/Yf9
 fMvc/dmk82iy00QEQIi+ClGo3gO1jIU/EbVsGjCtZDGZmFP2mhHo3TILbcDQ7m8ey/LUKExtQAf
 g4MV34NriheSb6SkDKDwFrynOdLvb6oa7yaYBJBwA841brHJRb/FlLQnJ+aOV6wyiBek+rwpgWz
 Bm3oLT2u5ctQb0Xnl5PCEY1df0NT9Zyl9mwsbn3CmnB5iInf22/Qy4jeLEhSxgyupysKqsId1x1
 jFZT1sOTWX/zXQPERIo1fsJR5K3HpE6c1Hj2y6bS+L6f/c2kSJT3/9dagEZET05GTC9hcKGMwwK
 tILFXacFkflDeEhQokKTjDdk0KyrI+t8f7HkPl8F4939xmFsKPPNBKSXNTFgTXOFM/pZqKLI8hb
 d9llfJnI4CEvlOQPw1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280015

current_is_workqueue_mem_reclaim() uses current_wq_worker() to decide
whether %current is a workqueue worker and then checks the current
workqueue flags. However, current_wq_worker() only implies that %current
is a kworker; it does not imply that the worker is currently executing a
work item.

worker->current_pwq is set while process_one_work() runs the work
function and cleared afterwards. A kworker outside work-item execution can
therefore have PF_WQ_WORKER set with current_pwq cleared.

Guard the flag check with worker->current_pwq. Without a current_pwq, the
worker is not executing on a WQ_MEM_RECLAIM workqueue, so the helper
should return false.

Fixes: da729ddd4a1b ("NFS/localio: issue IO inline when not in a memory-reclaim context")
Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
---
 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 959525393739..3d0497639e79 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6320,7 +6320,7 @@ bool current_is_workqueue_mem_reclaim(void)
 {
 	struct worker *worker = current_wq_worker();
 
-	return worker &&
+	return worker && worker->current_pwq &&
 		((worker->current_pwq->wq->flags &
 		  (WQ_MEM_RECLAIM | __WQ_LEGACY)) == WQ_MEM_RECLAIM);
 }

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260928-wq_mem_reclaim_fix-39b357dfa4f0

Best regards,
-- 
Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>

