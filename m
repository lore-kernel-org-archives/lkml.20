Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1C93ACA43
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940812; cv=none; b=argRr5XuiE63nHd9eEvrPKljX3voYwb3WkNw9DTo6RYxSWdwJXjTsuKfH6yTfDukA5swIETMt52IpiRYocCrlKuugAM9IlRT089GXN9fzRQIuKLb0DhshiWnmXlv/ncbIHiOQ/ME8A2SlQRKako83XRScfuDgA+K92PaHCCAYmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940812; c=relaxed/simple;
	bh=vtcYHy2m1MJJoXht1OpyQ+fLPocDu3s2AQvO5UcaALY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiM8dQ+AquaxWwM2pvvjhhbmX1wCXohFHjFSf1h4VXc8j7qKTbRghkfYxWPug6g81h46wWQ5Ac9rw51e3dur72PxtvwZi89w/vRpzaBKLbLHs8Jhd45rgKCkJdRNcGtog47kzmQNhRSAAmwsDO2Qx5LiCFaf9y+li3Gc/a6DaaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgWBun9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aq+hQ5+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgWBun9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aq+hQ5+Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGJt9w380104
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0UzAoBfsq6o
	gZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=; b=jgWBun9dg6nFeb+Vx3IXWrZ/TLV
	lajwsqx1YLyWQMxansxfzuDYNzvSBAS6xRlFoo+vN86E7Cd7/b+W9ao35hW+eq0G
	ulqUEqNeiasqZpWDBfJhfm0eihtU2DhrM9z7OeVnz1Duv91lPO/PuXkN/OX4EDOo
	1N37vvOzTCSy6iOTWdV2AYkvEgwBR0pZ/odzNNAY6JF2ZbKxD+WZ47nRUGMq8n/W
	ASYRUXImrC41mpzoHWbNrR4P0TVameE4agFiNxG1zKizzqi7850TiSbQ1ajN7SJd
	O7PnVM+jf9HS+9oRAAJ0ESV15WPRHCphO9sEn3o9Gqtq75X+mT/UydLw8Bw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afhsew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:13:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so2075907a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787940809; x=1788545609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UzAoBfsq6ogZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=;
        b=Aq+hQ5+YXzaB0HPGeA8ANMXKNq+DoOd8g1Sj3QHfenhJHr9jYMqMCl0MKznHyiYYJ9
         3UPJUIRdKZxh3u8Ei7dIn0zFx+Q/RRibVp1wWGLcvstUjHKbJq/jaQ3/HoqPzKGskCiI
         xky2E/Sp0rtoI7B9u/+lMiKJ26P/P8GKXz/nnFdrEOxORFAyQdJgTeproGy/il4Ko57y
         T398+MpXssTvf03mls6tHGQdE7Ni87e3v57PkVcGA7OkJns3/IZbHYcePUHyFJMYXPOF
         PF0HKaHXPthVwoZ0OV82tB8ksrvV2bSKdgfPyREgT+7MtBChj5C3V2A8Dqnr8Xlw8hGc
         bpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940809; x=1788545609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UzAoBfsq6ogZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=;
        b=POKpGvCHjmaSThDbsO7WXMERlDGp+8tDhMrjqM2Ij6t/KiWSX1qjZQzLGDuTxXWiXe
         zCYgSDVm85Viwgu1ndriKGO5b0coIifTrpo5lMMVVzHAgTpmVHo2m/323aCUkoQvCxZa
         J2/InmS9WSCvu9f+Z7UFfKJNUYw1uacEo4R/BvRiKBc0uL8YhbM73A0zsbc9QXixuFK9
         sfMHzYa2JJzc4ndsDRw61LJz+a90oV7Q+gqz/UYqT75NaBaw3AU8yMYsM7KUnNzbNHDt
         g6TbcFiofkDIzTy9eHJr+xVlRv6hW2qIyHxZiI1mVIoKU+lSh0VLzOZa8jBbU5hQ7CiN
         Epug==
X-Forwarded-Encrypted: i=1; AHgh+RrkxeIfB9cDh2iaALKqSq0c3Nx0irJt0ombmRYkSub49+DYGrzTxBRjVY9cOx9ggLA/BPmPgeGloet3Sa8=@vger.kernel.org
X-Gm-Message-State: AFuF++nlumRnrd7WOtAN5nICuTwBE01kHwGL8d2x0e+61aFZ1QNa67WJ
	L4M3/jnKXhy3vcwnM+ISQwfuSVAvVZio2/b8lQ/+wmOYnRCpB5AjFcht632+FwOGE6CUA7u4cLn
	HJyTJYI5oz5BZyp0UmFc03gyqVJXQMblj1TmBfiulsyKkDCU1pHEUyvgNyWna/HC31+I=
X-Gm-Gg: AR+sD13gp7AtbBf7oBxW4gfvb0cmo8YDyYqHydCjwezXm+1IfpmZJb0lUzx1SNHWKYU
	i8sI0ih4YBHuqFlZXn6OIf9cwg1n49WNCP6wiJQlfxXXkNb83h0BAeqOOBywvhawHID17AL70yT
	FeY7Bs31paoGhuV3PKNWFW69ZC2Oeeg/hiqdMOLqMzQmUt5cPaWXUEpPtgEzWFLlmjlxfToNWnD
	IpFxUmZebI/8t+QSUcQswy87rH2+Np9pnaKDeztH26ZwVV0J1/tWAJKf+IcmDGuV+zEvyHoFQeX
	YXYYzeebv3gfVFkmPvjyjRwPY+moGRO2VUDTEdsEc3HbJCF18oY9VFgO0EpNyaVsrT10nqEqCTn
	CgNzZqHwqA0ZxNg7mY5aHQjcfbzs=
X-Received: by 2002:a05:6a20:c784:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3d268cf77bemr17891572637.9.1787940809373;
        Fri, 28 Aug 2026 11:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3d268cf77bemr17891508637.9.1787940808861;
        Fri, 28 Aug 2026 11:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784845sm8575600eec.2.2026.08.28.11.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:13:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] remoteproc: qcom_q6v5: Skip handover callback if already issued
Date: Fri, 28 Aug 2026 23:43:10 +0530
Message-ID: <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JanikP12Sf3L510dnVXcPTrlcGH2XCjV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX+RwM+3hpdzxU
 mmJw0C6rpdqsE4gcwpQ0eI2iT2Gj5GyDQCS8c8Ymqi2qlmlxUbHe6FqfHTeI8SzLfT2FWqk7oLu
 sHU0b1Jf7oqLjKBvbQcx/Y6grhqLr1w=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a91cfca cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GHr-1HkMQwPlg4gqiLcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX+ia7Npeokd9E
 IooIqFR4HbLp0MDzDoJCoHEO/IRMCYH28vgILZVekxMx8uzKLWxCNCpsdI0arf9yiPgVPFG44bB
 xxTK+dkqXfmsAM/TxCqaPq3M8VIrhxutHRwtDS5MZ3AIkJsogRyinwsb/SfqbmozPXvG4ComtuN
 c6PWmHetWFTOKBcPRqvMzhGWdZS+CR42pCsD5lT7C7R69ufG3pu/KVd2WGbR4U4yA1eHyANW7Fj
 B/Yiq6lNUC+eV+MLb2l8xOaVaP1nyUQsom+wIV30/okwp6J/1Yy6Byu0089eY0vzypVshtmBSvo
 TMh1Y1BU0Zh+gcnIs0ZMN5NnJjGZFvJNacFegfo2/nSAqXHlFNlWEZL+O9vLJKcqrxwJ60JXeoX
 XKlrgYDcdYZCx6jIT9z+JKvQpueKfv+bVlPB2NOvSwGAeBtUdLixQJaX6o3QZFt7ZgiLYRTe/K/
 au1eI2vf3Y8ywr6cjng==
X-Proofpoint-ORIG-GUID: JanikP12Sf3L510dnVXcPTrlcGH2XCjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280159

When qcom_pas_attach() is called (subsystem already running at kernel
probe time), it sets handover_issued = true before enabling the handover
IRQ. The handover line may be high already (from bootloader boot), causing
the IRQ to fire immediately. Since proxy resources were never acquired via
qcom_pas_pds_enable() in the attach path, the resulting handover callback
calls pm_runtime_put() on proxy power domains with usage count = 0:

  genpd genpd:0:d00000.remoteproc: Runtime PM usage count underflow!
  genpd genpd:1:d00000.remoteproc: Runtime PM usage count underflow!

Also, because the old code left handover_irq_enabled = false after attach
(fixed separately), the handover IRQ was never disabled inside the handler,
allowing it to fire repeatedly and generating multiple underflows.

Fix by recording whether handover_issued was already set before the IRQ
fires and skipping the handover callback in that case. The callback
releases proxy resources that are only held when the normal start path
ran qcom_pas_pds_enable(); if handover was already marked as issued,
those resources were never acquired and must not be released.

Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..12ba0b80ad3e 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -198,12 +198,18 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_wait_for_start);
 static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
+	bool previously_issued;
 
+	previously_issued = q6v5->handover_issued;
 	q6v5->handover_issued = true;
 
 	q6v5_handover_irq_disable(q6v5, false);
 
-	if (q6v5->handover)
+	/*
+	 * Skip the handover callback if it was already issued (e.g. attach
+	 * path), as the proxy resources were never acquired in that case.
+	 */
+	if (!previously_issued && q6v5->handover)
 		q6v5->handover(q6v5);
 
 	icc_set_bw(q6v5->path, 0, 0);
-- 
2.55.0

