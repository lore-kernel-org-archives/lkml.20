Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D576725B08D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940809; cv=none; b=LmuWP5GqDsh54VlXHG6WdtN16dsCNPGy6b2BL6uPO1dTWUEP1rDjWLolbRDEJ7S1FkuYEJ5XZqlvZK0+GKxeamMHzfRYdWy44gnXCV4/mL19DLt6x48jzfFm04XmaErBwzSROOB/PZ162u3GncgFTHtL2Oh0WNCa+SOLVcA0Uhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940809; c=relaxed/simple;
	bh=wYYWSG+g5rJxNGdLsHvUT8ALBgROjTho7i+pGT1YCrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AJZzZi98Dt/AbCB9JBn7zT+hsbshYPxGswugF1oVob1eLn+ew5j2/2EV7AuuU46WdZfjIF6e5KkoTLnWOA3PSqDv3/wP7KHVRKSi3EU8mPjJnbNpHejJjRc58UVI//4GMIzT5jwN5BOOofsH6RrM/mg709fVF29/UG/9J756ams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jr1l7avN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd1gaxhK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jr1l7avN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd1gaxhK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGJscv3545938
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6wyeLvY0Aww/5SEbMa6o+A
	s4j34Z6vghChaACXvQVfU=; b=Jr1l7avNibfrw4kGsGnI42wmSGIAInxEJzxfg6
	gBlLqvYw0pj1hn6EG2TI2zlPcE+WvZcx+PONTjAaXQd4kMJ3mpng/kYmyUwZ5TCo
	KTtIjDaOllU3IZO0FEdPGghslH4mu1z4Sd7Nncp+GGaODU4MCicn2N3u9sGm6Ucr
	xwk9SeHYJzdB1YVSRrI8V09HCyazX2bkaPlGPRuuRo6XRR3HgCN3udW38lY2nksp
	xNPoGH/35rOw5lacQr6PRxIa5ndg4eYIXKQiwklKetjYM6CjNadQnimIiN2o4r+k
	u8Dz1daQqKsy5sSP7cYFxkpMPSKmKZbiGq/RTUhTOQEMAWDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh1yc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:13:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc15155cde2so1657958a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787940806; x=1788545606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wyeLvY0Aww/5SEbMa6o+As4j34Z6vghChaACXvQVfU=;
        b=bd1gaxhKRQgkzyN0rzDGg7XB5lmcA38u7WzK7+tallo6i4JAw8kSfP+HU5s3DLsnFb
         LtGHae3+czppRsxJI5TsIGpiSWq5ARwTDjQOXD2XqbnAG2Ktn+j9jVmxkIZSqzWyIHT1
         T+JwgGssxxujptaJUJxUjYj8y8pAlBdCEAVUHv6L75I1ZPcXOmfynRxmojC9jw22dqWS
         ApN+voCYbCW0sVZTC9uUMi2ar4FRdlE3CVgyeujR90eO5MucDMosCs9w7raWsT3ODi0f
         GHG1VHSV72phf5tc9QvRHgTNirMLbf2I2yg1W5rn1trES+klg32h523BlTkDTybY0exs
         WmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940806; x=1788545606;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wyeLvY0Aww/5SEbMa6o+As4j34Z6vghChaACXvQVfU=;
        b=o1ckldhOR4Oz6doPDxJEkEDXstVQhTL0KRqf2EfOq6ybKAUealsh4AUXp+wkgR3b/N
         FuKYsBkyUvlDxaZYbx7kzCcc5aVvYmVxgKAo2RWSYW8DxrRBgXVGv6jQh5QHftyIqrhN
         IADNMsIyDw62bOvD8yr3xLRldginX+8nza5NHZ2iE4cBWDgzNnGwQrE/OwOEJx2/RF/y
         S8SC1lyYSST5iJFhoJF3YhoZ0JBF5SgpZv+jYw6hdK3mI26eTMrvu2iZNOqqYGKP4M05
         w5nlOyrIGeSV/AKwWxoZnyj3KgWpHuKMj6NTby2kL5qW8VJEX2IANdBAfiQCNwhgG6b6
         0AEw==
X-Forwarded-Encrypted: i=1; AHgh+Rrtw3NEOFEXNrGtUxgfVcrpxZnPgLJZ+pe6nPYfpBtKUcsVbQyINveG5g7Pa7auyuHMYsteb9b34S5LTFY=@vger.kernel.org
X-Gm-Message-State: AFuF++kYNlCrZpioAoKAIdxBRY4atYhAv6BAey+qJF11wXORoPnZitlO
	FB0wg5uigRy/i8JZb74vy79T4xMifrqI9jhcn4Vt8EHl52p5EvYWEDqoGfrqRHcCx538iy7u6Ng
	F87cSClLHBvsIzisESBAXWNqWJI6CSHeHnOx361GWv/wfSus09RMEf8mJ9Xtf452y79g=
X-Gm-Gg: AR+sD12DNGVcOmjIOpcaaJjyn3ulVaqwqa/IQUEIwlKISyimXrSMEI1DatzziUFwqKn
	KBhz0VLKMducPadQXLBpuO6r+HAbyULGonrPQ0gEAtOliSnv8+Dm+GHCllfzy1m+4Q0/nI873s0
	hUqF3wqMCxr74M42Aar2Glph8szhbFTYEAMeiUfwg5MSDMuN1Sw7+I0Uc8uLEQ/mSK51vaipyD4
	zg1vtjlD+5AaAe5wkLNcvloxD4JaDT2WsOVvbejL3B0OPvN7ujemFX8462e/kSKbP1646OVIAj8
	9b9b7cpDynxNNhTkXpFbgSTHakPwfe8cLdTYYBeTRXlL2U2PwFntPQ7aZhGvJu11YroMmBVkDiV
	XBP+yq27ycUCjpUvXpLyJRS14jTw=
X-Received: by 2002:a05:6a20:244f:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3d26839c4b1mr17128044637.16.1787940806054;
        Fri, 28 Aug 2026 11:13:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:244f:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3d26839c4b1mr17127949637.16.1787940805478;
        Fri, 28 Aug 2026 11:13:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784845sm8575600eec.2.2026.08.28.11.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:13:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] remoteproc: qcom_q6v5_pas: Fix unbalanced enable for handover IRQ after attach
Date: Fri, 28 Aug 2026 23:43:09 +0530
Message-ID: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iMJzSmX7dvUUwP-iRBnc1gk0PMhnboBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX+XVjIn5vVxi5
 WU4PO8yPBa8Sa7ULuRtHC5RKB+CE8kVRT1gVyjfRVJKw2psGgLUWDcM27/GxxmfdSmDwvcaaly5
 8aq+Jhm6P9A0hyE563d71HqZEnL94dWuZ6Y4N7GMh/O5lswTjko+hhTh8hUZaYAGhaujwDlpH6m
 H15nh8tOHfVBXroyvqiOy+q5I8kvX+JF33rxVD++H76EDVZDNT32c7CDHfuPH/n8qJoHJhLnw7Z
 JllVXMWg1L4eZd+N+d4H4sVwbwEf1l+HJjKPPPV4Gew5dJ5b/1FfQykzeznMEzwVHimureNyvFr
 hqtJAzXXxTjzRM/6Z6uTeLH5B0utSplvKLgPqQLFVBWQC03NwqydiyP/Ti69cw4pRQiD1ORR8oq
 l/aPLWu7m78lBL1vBPq9ftj4lumlgzLJVrRYFZ30Fvvgy6DEmyRRACXNwgu0rWUGwZGrneTUPPv
 5xeNvUR4DsM83I6LQqQ==
X-Proofpoint-ORIG-GUID: iMJzSmX7dvUUwP-iRBnc1gk0PMhnboBA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX6SRTQAZyAACC
 W25lDXvzsEQsUoDoLQeGoi4KA/zQvhuhe8tMtft13zsR0l5+Wms6YkOg5pTQmBnNes0/9TIxy1J
 W7SUH+NLFr30QcAibr4u2bc4R4BcS4M=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a91cfc6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YWewlzZ8vdepzDDFAG0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280159

qcom_pas_attach() calls enable_irq() directly for subsystems already
running at kernel probe time, but never sets handover_irq_enabled.
This leaves the IRQ physically enabled with the tracking flag false.

On the first stop+restart cycle, qcom_q6v5_unprepare() consults
handover_irq_enabled, finds it false, and skips the disable_irq_nosync()
call—leaving the IRQ enabled. When qcom_q6v5_prepare() then calls
enable_irq() on the already-enabled IRQ (depth=0), the kernel emits:

  WARNING: Unbalanced enable for IRQ 239

Fix by mirroring the enable_irq()/disable_irq() calls in qcom_pas_attach()
with matching handover_irq_enabled assignments, keeping the flag consistent
with actual hardware state.

Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..25942200ba03 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -524,6 +524,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	int ret;
 
 	pas->q6v5.handover_issued = true;
+	pas->q6v5.handover_irq_enabled = true;
 	enable_irq(pas->q6v5.handover_irq);
 
 	pas->q6v5.running = true;
@@ -570,6 +571,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	pas->rproc->state = RPROC_OFFLINE;
 	ret = -EINVAL;
 disable_running:
+	pas->q6v5.handover_irq_enabled = false;
 	disable_irq(pas->q6v5.handover_irq);
 	pas->q6v5.running = false;
 
-- 
2.55.0

