Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FAF4F5E01
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369518; cv=none; b=Gjz9LFP08oJPDiLkTbC4eKFP4K3uw0gu2zJZpxsFoJ4jVqIF4qK9169i5nhxythtgSQR6OIdpf2N1msicHmgd0NLgsPGrH2odvKAKS9B1ttP56yaesx6LLnl09tIQYNqkPBeu/RRfkCGIrBan3J+TPbw3T0UY5WiyrH9lfnrwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369518; c=relaxed/simple;
	bh=IBzKwuEAw2IzSX3BSi9sh3eWLeU2EFMHDvkG5DZOjbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PW+7TV8fb0VCclYrHznep8yAJsFNCj77xks0hImOvEn9LzQj4TJ+l3Egwzo0xGaCug8k/8wozaXvwqA5jbVhtd932nJbVCQ6ozeri53oVfkXB0rTUSGSf0XTpRtvAzatkIbwoEpruqZgEV9z1rLNfRKVlf+/rJZN2bAjTxEPiXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTVYqV9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hB21yrg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTVYqV9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hB21yrg6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIne542034768
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZQSoAYjcp8FM4R9KKzLNu8MzgRqTqIgLzMBLesMe5Q=; b=UTVYqV9vIh/P43mY
	UWY+FRv9epQk7Us/LrbAFjD+yL6ar6yT3RN9UmvWVKpEPLpttZVIrDg8NUUnPXE6
	Mn0E11+7AisiU+rGjeoXF3Ryh/dM/VuYSx1e6KDA6+uXk1jWOO5eWy3eAeWm3VAS
	0xgMwPG8xnc4+3d7VHC6FSzrC7skK7EvzbrYtCdme+IsiJul2ebEkAsCbdc77JH2
	83aO6ZTZjIvusjz1U+pU2+7/tPsUxu3oo8AlLIXCF7UU7PD6IwzPL+GcdBoKS6HF
	Qbia2klKmAAgLGZbrwFeyQ2FKSW4gWtp0nl7rS8WhZQlnEG/f3iD5H9PdVn3jWFx
	sgOR4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwvd3ryd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:51:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3286d2bac04so1819760eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790369514; x=1790974314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZQSoAYjcp8FM4R9KKzLNu8MzgRqTqIgLzMBLesMe5Q=;
        b=hB21yrg6LwvgZuCpDATFWXJ2RVTJUfrt5vHnKbKTklCjp0cLMqqppIab5R57BfduuI
         kza5oVR0RQWwkK+UCy8ppLpe3Cm5IDC0anE2Y8LGkT5MBD4omzzVQTfKxQj9pffKjAyJ
         EzmA2axfB9esU8H3bzLWk59s4VttF2YMm9CReRJ+fjfpI/6I86P7tRpkc/OTLEi08tBu
         rN4pFm7ZUcby0P4AOCeiLJ3IcMWtwE66FmGrglJwIQuBchkOsYxFQWkiEXRNzKKVv+yv
         0klCgNkneC8nmw/ZI7YeZbDYvAS5TFyB3ZX8X8mp5lgEuRlHyrM43jEL9HxXto/KklOb
         NR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369514; x=1790974314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZQSoAYjcp8FM4R9KKzLNu8MzgRqTqIgLzMBLesMe5Q=;
        b=IcMfkkEwuYQ24blukfTSrpjKdvjVfi4qm5ETuN9GKoFYNI24eMUJTZO3LeJqiR9VFk
         L5zEOGVYD+7iV5QACGaLMzmcIhIxWCgu7hIya0y3M4ET5jwKUeMZihmEjFbrvscfv12Q
         wSA5nWOo8xJMpPJdfbJzgCr79KBkKcLUuCzCyoon5lZU509P4qQD3WO2nq355aWKQ0xs
         PJgexLL1Uaa9HohV1uFmGwWBjDTUecYqd558RaoyY566dURc1j4sSjoiO2bhRvod17tX
         BKf1GvMpreognG9WtfPDDGWDuanXAjJcTkYH7GsPv+P6OByDOZDGlRVTq2NUmI1Ezsme
         WNUw==
X-Forwarded-Encrypted: i=1; AKwUvBzCj0mKfboWnZLfSEXcyuxiRT7hKBnnWRlyOEafy77SvO9JQu4OKon3AVf9DOKNTgvChAXqOln2uvRev1o=@vger.kernel.org
X-Gm-Message-State: AFuF++nyJMa6SrYuC9Oyvotj3pZ40EKm9Rc+8JIA2xPthw93syELRhUA
	i9n90W3qmib74uh72lkjBjJP2L0o38TlEk7yxPs8KcK5VSada2ifs/V2QWtLIGF+oTvp3odfJCL
	LQ/SO3cAq9ynOblT6/wG5zglxNYZOGHe/NCCKBtPxcSZ5P3T/1RQ2U4vXz2Mc24cUl+XKSGbnKa
	c=
X-Gm-Gg: AYBFou36dwAvq645bHpwBRjEDojrpFAnpeRAxQqkFg9872sEVQ+uSFTyEkJh/G/H/5G
	bEq2WX+Ea7cnPwEjxJj5ZLhV+4WPE+TxRBu1pJ42aaqkoPhhzl3fPumcBAKBS+ZnPJo8fSxULUI
	WqQ5stCGwJiNlGS5+JTTzj/wfxH+j+L9GLcjGzYhLUAaOhHn1YM4c2JwooORu/6GD5eeWuWBAlq
	+GoxlpJ6gyY0vJK+gpPKzWU1ZA0hR+q3LLnojZfClOm1FiDIG5guhGJ/0GyTDGpr4ufVTcYvgkn
	DJKrwKfWMnQQIU/6U9VEyN76oPZss6HnQ8hkUMN0kmV1lxhTcVCGnati9ElR0u9zo7w9uItkZ1S
	Hw0QtI+Cv2ncxB8Y8TCyCEtHMY7p5HFnRVBu7VO9PdPo=
X-Received: by 2002:a05:693c:2a08:b0:33b:7fff:dfea with SMTP id 5a478bee46e88-342700bf366mr1168087eec.2.1790369513395;
        Fri, 25 Sep 2026 13:51:53 -0700 (PDT)
X-Received: by 2002:a05:693c:2a08:b0:33b:7fff:dfea with SMTP id 5a478bee46e88-342700bf366mr1168056eec.2.1790369512668;
        Fri, 25 Sep 2026 13:51:52 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm13085734eec.14.2026.09.25.13.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:51:52 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 02:21:36 +0530
Subject: [PATCH v3 2/2] dmaengine: qcom: gpi: Convert dev_dbg() calls to
 tracepoints
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-add-trace-support-gpio-v3-2-8572bf7456b2@oss.qualcomm.com>
References: <20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com>
In-Reply-To: <20260926-add-trace-support-gpio-v3-0-8572bf7456b2@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790369498; l=7464;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=IBzKwuEAw2IzSX3BSi9sh3eWLeU2EFMHDvkG5DZOjbk=;
 b=kWa1HxqLG5GpSXPv03O2FAd72j4c58leYBHJkisUNw+YbrNXn5v+3YVmvDkofVz6nVACoBb2W
 dEU7/3Zi6R+CCF4//W7GjcVHTGUaDnAELs+EIh2cILioWv4irhwEbxr
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: tZHnq7KIjI7tFZU29X4KVBO9PQyjSIcV
X-Proofpoint-ORIG-GUID: tZHnq7KIjI7tFZU29X4KVBO9PQyjSIcV
X-Authority-Analysis: v=2.4 cv=YL4KWhGx c=1 sm=1 tr=0 ts=6ab6deea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aSNI5RSwOxee8bqK_isA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfX7K7Qla1oqGD/
 lQaX7RjK+g+g99R6Y+s7P/lp+t2u+PlxPlCM6oF9PbBvUKSF7ONjjBgLXW1GdQe9kAcy/h1x+Xx
 xQzlxDGb3jnIH/sMdLud3eI5/6kmbLurmRQyPdoHf+e/i4inhQI3+aBX3A+h7tiKEViEL499bJa
 UMGA5gxEV6SdHmE5cfWlBt8c4N03TOGIYSOp1AHVYfFgUGVVJQcFt+5N/AqjJd3M00kxmQjN8hY
 1Oyoqx5d0t8z/QFVT/unf6qfiPhmBR7Kf0hzjHLgc05zQnqscBcSobPRss5WSsN3uByyGdhWvN3
 LpNUBUb2pnFVd8WHTS15/w1FfhLEfcZA/sno0akjVeTa5dHbwGIp5r1henBCldrgvrj4Dk1wl+z
 rViVAcOXyOZO0xu20Ap6Ob6qvwvndyaia/9WIvBLDzVyDpbZLvEex6hPiQVOfUKtXAIQmyXO6k2
 tn1bMcTtY3I2Zk1+QZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MyBTYWx0ZWRfXw7nUwUfQczxh
 C5jrMNC2U27J+WfQ7j+UqUEOr2zjspKi6HgEJmMkdzj55ULA/z60szsktvW+iSIVYhe7aCwGr4u
 UT3Qmh57+DG7Rry0Mm/HpFNdPOxo0vc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250083

Replace the remaining dev_dbg() based debug logging in the GPI DMA
driver with the qcom_gpi tracepoints, providing structured runtime
visibility into GPI DMA behavior without requiring invasive debug
patches. dev_err() calls are left untouched.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 58 ++++++++++++++------------------------------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index fafe6ac848d9..6aff2a0d5416 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -684,8 +684,6 @@ static int gpi_send_cmd(struct gpii *gpii, struct gchan *gchan,
 	if (IS_CHAN_CMD(gpi_cmd))
 		chid = gchan->chid;
 
-	dev_dbg(gpii->gpi_dev->dev,
-		"sending cmd: %s:%u\n", TO_GPI_CMD_STR(gpi_cmd), chid);
 	trace_gpi_send_cmd(gpii->gpi_dev->dev, chid, gpi_cmd, TO_GPI_CMD_STR(gpi_cmd));
 
 	/* send opcode and wait for completion */
@@ -797,7 +795,7 @@ static void gpi_process_gen_err_irq(struct gpii *gpii)
 	u32 irq_stts = gpi_read_reg(gpii, gpii->regs + offset);
 
 	/* clear the status */
-	dev_dbg(gpii->gpi_dev->dev, "irq_stts:0x%x\n", irq_stts);
+	trace_gpi_gen_err_irq(gpii->gpi_dev->dev, gpii_id, irq_stts);
 
 	/* Clear the register */
 	offset = GPII_n_CNTXT_GPII_IRQ_CLR_OFFS(gpii_id);
@@ -866,8 +864,6 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 			u32 ev_state;
 			u32 ev_ch_irq;
 
-			dev_dbg(gpii->gpi_dev->dev,
-				"processing EV CTRL interrupt\n");
 			offset = GPII_n_CNTXT_SRC_EV_CH_IRQ_OFFS(gpii_id);
 			ev_ch_irq = gpi_read_reg(gpii, gpii->regs + offset);
 
@@ -887,15 +883,14 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
 				ev_state = DEFAULT_EV_CH_STATE;
 
 			gpii->ev_state = ev_state;
-			dev_dbg(gpii->gpi_dev->dev, "setting EV state to %s\n",
-				TO_GPI_EV_STATE_STR(gpii->ev_state));
+			trace_gpi_ev_ctrl_irq(gpii->gpi_dev->dev, gpii_id, ev_ch_irq,
+					      gpii->ev_state);
 			complete_all(&gpii->cmd_completion);
 			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_EV_CTRL);
 		}
 
 		/* channel control irq */
 		if (type & GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL) {
-			dev_dbg(gpii->gpi_dev->dev, "process CH CTRL interrupts\n");
 			gpi_process_ch_ctrl_irq(gpii);
 			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL);
 		}
@@ -945,17 +940,10 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 		struct gpi_tre *gpi_tre;
 
 		spin_unlock_irqrestore(&gchan->vc.lock, flags);
-		dev_dbg(gpii->gpi_dev->dev, "event without a pending descriptor!\n");
 		gpi_ere = (struct gpi_ere *)imed_event;
-		dev_dbg(gpii->gpi_dev->dev,
-			"Event: %08x %08x %08x %08x\n",
-			gpi_ere->dword[0], gpi_ere->dword[1],
-			gpi_ere->dword[2], gpi_ere->dword[3]);
 		gpi_tre = tre;
-		dev_dbg(gpii->gpi_dev->dev,
-			"Pending TRE: %08x %08x %08x %08x\n",
-			gpi_tre->dword[0], gpi_tre->dword[1],
-			gpi_tre->dword[2], gpi_tre->dword[3]);
+		trace_gpi_ev_no_desc(gpii->gpi_dev->dev, imed_event->chid,
+				     gpi_ere->dword, gpi_tre->dword);
 		return;
 	}
 	gpi_desc = to_gpi_desc(vd);
@@ -1064,11 +1052,10 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 		dev_err(gpii->gpi_dev->dev, "Error in Transaction\n");
 		result.result = DMA_TRANS_ABORTED;
 	} else {
-		dev_dbg(gpii->gpi_dev->dev, "Transaction Success\n");
 		result.result = DMA_TRANS_NOERROR;
 	}
 	result.residue = gpi_desc->len - compl_event->length;
-	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
+	trace_gpi_xfer_result(gpii->gpi_dev->dev, chid, result.result, result.residue);
 
 	dma_cookie_complete(&vd->tx);
 	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
@@ -1100,11 +1087,8 @@ static void gpi_process_events(struct gpii *gpii)
 			chid = gpi_event->xfer_compl_event.chid;
 			type = gpi_event->xfer_compl_event.type;
 
-			dev_dbg(gpii->gpi_dev->dev,
-				"Event: CHID:%u, type:%x %08x %08x %08x %08x\n",
-				chid, type, gpi_event->gpi_ere.dword[0],
-				gpi_event->gpi_ere.dword[1], gpi_event->gpi_ere.dword[2],
-				gpi_event->gpi_ere.dword[3]);
+			trace_gpi_process_event(gpii->gpi_dev->dev, chid, type,
+						gpi_event->gpi_ere.dword);
 
 			switch (type) {
 			case XFER_COMPLETE_EV_TYPE:
@@ -1113,7 +1097,6 @@ static void gpi_process_events(struct gpii *gpii)
 							     &gpi_event->xfer_compl_event);
 				break;
 			case STALE_EV_TYPE:
-				dev_dbg(gpii->gpi_dev->dev, "stale event, not processing\n");
 				break;
 			case IMMEDIATE_DATA_EV_TYPE:
 				gchan = &gpii->gchan[chid];
@@ -1121,11 +1104,8 @@ static void gpi_process_events(struct gpii *gpii)
 							    &gpi_event->immediate_data_event);
 				break;
 			case QUP_NOTIF_EV_TYPE:
-				dev_dbg(gpii->gpi_dev->dev, "QUP_NOTIF_EV_TYPE\n");
 				break;
 			default:
-				dev_dbg(gpii->gpi_dev->dev,
-					"not supported event type:0x%x\n", type);
 			}
 			gpi_ring_recycle_ev_element(ev_ring);
 		}
@@ -1409,10 +1389,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
 		bit++;
 	len = 1 << bit;
 	ring->alloc_size = (len + (len - 1));
-	dev_dbg(gpii->gpi_dev->dev,
-		"#el:%u el_size:%u len:%u actual_len:%llu alloc_size:%zu\n",
-		  elements, el_size, (elements * el_size), len,
-		  ring->alloc_size);
+	trace_gpi_alloc_ring(gpii->gpi_dev->dev, elements, el_size,
+			     (elements * el_size), len, ring->alloc_size);
 
 	ring->pre_aligned = dma_alloc_coherent(gpii->gpi_dev->dev,
 					       ring->alloc_size,
@@ -1437,10 +1415,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
 	/* update to other cores */
 	smp_wmb();
 
-	dev_dbg(gpii->gpi_dev->dev,
-		"phy_pre:%pad phy_alig:%pa len:%u el_size:%u elements:%u\n",
-		&ring->dma_handle, &ring->phys_addr, ring->len,
-		ring->el_size, ring->elements);
+	trace_gpi_ring_info(gpii->gpi_dev->dev, ring->dma_handle, ring->phys_addr,
+			    ring->len, ring->el_size, ring->elements);
 
 	return 0;
 }
@@ -1542,7 +1518,7 @@ static int gpi_pause(struct dma_chan *chan)
 	 * client needs to call pause only once
 	 */
 	if (gpii->pm_state == PAUSE_STATE) {
-		dev_dbg(gpii->gpi_dev->dev, "channel is already paused\n");
+		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
 		mutex_unlock(&gpii->ctrl_lock);
 		return 0;
 	}
@@ -1578,7 +1554,7 @@ static int gpi_resume(struct dma_chan *chan)
 
 	mutex_lock(&gpii->ctrl_lock);
 	if (gpii->pm_state == ACTIVE_STATE) {
-		dev_dbg(gpii->gpi_dev->dev, "channel is already active\n");
+		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
 		mutex_unlock(&gpii->ctrl_lock);
 		return 0;
 	}
@@ -1703,8 +1679,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 	}
 
 	for (i = 0; i < tre_idx; i++)
-		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
-			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
+		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
 
 	return tre_idx;
 }
@@ -1797,8 +1772,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 					 TRE_FLAGS_IEOT);
 
 	for (i = 0; i < tre_idx; i++)
-		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
-			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
+		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
 
 	return tre_idx;
 }

-- 
2.34.1

