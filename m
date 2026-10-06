Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307A34752F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791257801; cv=none; b=t0osJH2Q/0uMBMUbx5JC8sGxnIOFS03RQajNR2SBJtaZB6/SBL8DwezVOcRNvILy58sRpHROKMcSAaLE7cFvzzyrGh4cg/poP8tWvzEtgDXCxZ5pOYQ0YG9/+MNGtv/aqr8NG4282BbCDFxtUwIe2DmuooUw+lO0FGTO5h7MEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791257801; c=relaxed/simple;
	bh=h0nWXhKY9t2Fj7gupgLtNSERpFTp6IVroebKjR1xLnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjIqV7jTzvsZSG8Okt5VlwGr4YstsE9FEE3It+65CUa2wSHaistdtAJ9IUHFe1wmWmThCRMQkuoGXIrXadkvRMdIeFvos5RUvQsdi7XfuqkdeJEnLzobyr3msfVwEI9zj0Rps2y7simO/5IcXn8sw9v0rh1kLINjMVSvipWyl0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0c6KxEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1rZQXCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0c6KxEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1rZQXCU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AVpM4157824
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 03:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o+HNJj3V/gQ
	7ZI+UzIbijjdSZZ3RGHDWXuoW7x3+Cis=; b=F0c6KxEXQDXXfZmoVO9I//bWdmI
	NlRWQXG3QyT94sKRprpbbjI5WcZIk1fds4jnmfI7xU5QRHfPLaCwJ6Zu+yq9WZSz
	xMx0nypq9nbKZFk2KPkpjJhX0FugLzT2YksqGSH/fgw9iH3nVsKHVUsnHIiX8hZF
	AgrEXqchw08m1MDL7810OcODk2qHZ6W2nN8zhEuGPGk7AYoNYXReQsZCKuYdDhS7
	eqjXgaB6co1UEQBaqOdaE5Aqn2YIwhBtuMWPtT1mjwtQZ9VwSqg/Z1wyQOFcBZMG
	Yuf84qSIwRCDIWX+6rWRBYxCjJYgg5sQK7zVPsJ7WxWmgcvsf2PfStmUohA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg373j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:36:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510562ef98so3087917eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791257798; x=1791862598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+HNJj3V/gQ7ZI+UzIbijjdSZZ3RGHDWXuoW7x3+Cis=;
        b=c1rZQXCUMI2gvgoxlBokcCOLfVbimQISozSYPJ8VYmDWljb8i1td3p8spfWMjBd4ph
         osxhsYEuzHqlq0G7k6otSm/V91LBz7VWBx99ZcjQ6eLTnj0mNpqYvxhr2LJv1FSlEDt8
         WipkAxKCZ70jAfzew2plFAj2rKxjnhYZg8EtwNruhKjDAYnOuOfQFrANmSRFcNab4CB/
         xzaCl/WVzzkX1ArI/ICuDVsU9/xpB7JMWrRb/0xAUjdLDkXG8JLtMnIdFBrxcLONOp9H
         Cjuay0Zt2SYvepmnyCaBKw7JyVKmDuSI/4AanXVqFHA6Xp5bJn8Ye1MZXMDMVrZu0Y7v
         v5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791257798; x=1791862598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+HNJj3V/gQ7ZI+UzIbijjdSZZ3RGHDWXuoW7x3+Cis=;
        b=VyyofSGGNmf6/mSC7IHgBEvky4+tseRgHu6+L49j2ID9OKyex2uboawKQsuKbxFGk0
         nx7LbN78jTuxWHT8fOrz2ugJPpEqSei5sHJ1Upk7YpkW4oZqWCv/fSS/+WICWfALGeUA
         3xzZr96DUDon2yXzcxn1PkvCMY2tKE9lVofoYs45dNGi60nuGjGfshn20PBWLhr9CDp+
         eLatXGeUnGDf49/To4J2C0KJOYJ+X9DAw5C86/W5x0PTmBQsjiRkBCto0QPIkbYsVDIi
         nd9tEIcK0ceXNh1fSbLkH+RWG6j5vWRdifU6O7UOjdKwwln5JIqU0hdTNYdLooOZKbJa
         iUdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb8EwffmLFaltTi1lqpabHz1w8ag6kpdyC9zFNNM9h33Rln6B6mGWK85Ao0Rm1bdG/dU/TTbItTcHA6k8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzWW6NC6b9J8zi7VYYSm/pOBgE9+upYMJ7mTnuwJ0DEWQNSBR1
	SUGtTbQ5Qo1krC19g5357hx54KXn4P6ixh94R1JM6uj18oNIiOsU+vOOC51G+e+/j9BhLy8YlQZ
	Ea84c9rnf2pz3JjaIJUC/cNL0OfFaf+vxPb+V445YypNi3vHDd1NjX4A65SCX7ufqAmM=
X-Gm-Gg: AYBFou34YetDklJqGxRfDerC/xwuhvP9vKD87SfLuYidYP2C47xgF5rSKkdZN+sJkHU
	GqnTus1sO6axiOZmfM6FXddrq74mRDANFehdoMmGtoaq3Zmvgm+dXqgUad+ygdsVaWc+ynR4yr7
	tm0DAg6vgfN0GpbaSVCBZFRw7hH0qBl4bbtOxU3dCnOEoQypsQo01EsBEiaGauCpwVWvZh50tHQ
	sLNwN4HVgEzRAY1ptUe3T5igsHkPlcAThBDDbO5fzghN4c98FdMEgSs2novLU9htnBaK7l5Q9xk
	IlizmvSSmlJXIm+cDFzWUyjS5VIAMuxiIrwmVpqhapXgTtkGT7YtFn2z10rfJ8T68ZkN3yTkjGR
	YjOgesNX6KaBFsiM6Gx4gfAvsJT7AxaGpZUtkGz0HFsE/oN2lCKOW2GYTKxI=
X-Received: by 2002:a05:7300:1c13:b0:351:672:6803 with SMTP id 5a478bee46e88-3514e2a84abmr2945eec.22.1791257797623;
        Mon, 05 Oct 2026 20:36:37 -0700 (PDT)
X-Received: by 2002:a05:7300:1c13:b0:351:672:6803 with SMTP id 5a478bee46e88-3514e2a84abmr2905eec.22.1791257796801;
        Mon, 05 Oct 2026 20:36:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm3279736eec.6.2026.10.05.20.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 20:36:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] remoteproc: qcom: pas: Don't fail attach if the remote has crashed
Date: Tue,  6 Oct 2026 11:35:50 +0800
Message-ID: <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZnKHASX23UZpNjAvFoHSZciR3QzobS3d
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac46cc6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UG7d_Sik5HcDt_3cTb0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfX9QTEYlcdKJX0
 DAcQnypkrE16iCaEj7cBoXhK4lzJs69AvTo/nO4GoC9XG82S7XncBK3MCyhXclhpUfXxhqgYMhI
 lYfgpXtlElPuEp1ocO5m77no55nU5K8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfX9LUbLfhNaMJy
 kf826RMU+CaxuFYrC6ZxIv9h9leSh1o9q4242R8gW+X+8Wmvay4fSkmpKNjBUnER/dQ34wRIYMM
 BR2Qz3+4Q0J1+x4xQ8kqdrWBDrdjq+rZYNFeG8YARbQdnYwihjAv219kZAWFL2s/oxcMcP/M6KW
 2ZyArDVJDf0mtaaLg5bE4c9HR3Jv/SbkKbcBUSZuNdkazt+lBk9jSpm/o/RhRnKTmx9UA+xQ6IA
 H/yNMEuiSwXUC4Tdlc9xM4pscds3EOymjFh+lcHNb2f/oxshi+g80HPgzbSNYO4y/vuDWnqnknL
 EUnKLXYyLEgmFD7MnUbHH3Wp8VbjMERnazHK0pt19GzhtH3orh24lpdoIRHrH256F0zo3Ac0Cmz
 f3BmO2ke3NZ/U96tIDrat3JioLNksVuNPiw7t57gzCyUh9C9JJbNqnCMiaNVLwF2AkGNxLgG//4
 Ay5puHSWwFmDVcX1JEA==
X-Proofpoint-GUID: ZnKHASX23UZpNjAvFoHSZciR3QzobS3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060014

When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
a crash and then fails the attach. The core unwinds the attach while the
crash work is queued: rproc_boot() drops the power refcount back to 0,
and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
the resource table and disable the IOMMU. Once rproc_boot() releases
rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
torn-down state:

 - the subdevices are unprepared a second time by rproc_stop(), so SSR
   and sysmon notifiers see a duplicate shutdown;
 - qcom_pas_stop() and the subsequent rproc_start() operate on resources
   that rproc_attach() already released, e.g. iommu_unmap() on a
   disabled domain for rproc->has_iommu;
 - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
   "stop" via sysfs takes power to -1 and returns success without
   stopping anything, so the remote stays running. A following "start"
   then boots the firmware again on the running remote and fails to
   re-add the still registered subdevices:

  sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
  remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
  remoteproc remoteproc0: Boot failed: -17

A crash found at attach time is no different from one reported by the
fatal interrupt right after attaching. Treat it the same way as
q6v5_fatal_interrupt() does: clear q6v5.running, report the crash and
let the attach succeed. The core completes the attach with balanced
bookkeeping, and the crash handler then recovers the subsystem through
the regular RPROC_ATTACHED -> RPROC_CRASHED path.  With running cleared,
qcom_q6v5_request_stop() does not wait for a stop ack the dead remote
cannot send, and handover_issued already prevents a spurious handover
on stop.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8f3d45c604c9..0ecd7688a54d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -562,10 +562,14 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto disable_running;
 
 	if (crash_state) {
+		/*
+		 * Complete the attach and let the crash handler recover the
+		 * subsystem from the attached state, as for a crash reported
+		 * by the fatal interrupt.
+		 */
 		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
+		pas->q6v5.running = false;
 		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
-		ret = -EINVAL;
-		goto disable_running;
 	}
 
 	return 0;
-- 
2.43.0

