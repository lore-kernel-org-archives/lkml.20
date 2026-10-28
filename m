Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200874;
	b=25mFLVhMs4XL4WJQMzHjT4RGoKzm1rxSRv1ykUzPyvs00m9MkTm2ZC+GB2AxSNU+gls9
	 FuWtxyLCReIw1U3wSP63rouTlFLbSxCU1K/DN0oARWtu7BL9Qj+EeQyXR6il5sP6VIXOr
	 U2R3F2qm/NpmUwUWRGW+5Ma4P9/pIBcE6K2Sry+obmpRs5UUApnzT9qvG9xgKp/Uv9S3o
	 Prtz4AyykQs8fkgx9eiChbPejVd7r7WJulIcZhU7Bim/f64SQYy97y0eth7ozVPnDHEFZ
	 LF8khHy6Xqt99ukiIJMkrRLZUKrN+0SAfwpUCmweKZ6x67kiJElxnnpIgGUgHneW5hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
	b=p393csAuAG6NPzXcr8i6fwbGasNm/gTAHj7vrpwck7hMFIRcEfQR+U2cz/xoMQQvWy4h
	 xaYznBv5p5FysKii/CUQLd+lvSyLsOwSbg0hXQbMNNzztohz01coFafka+k3kelsBpcJP
	 GH9zLvMwey4G1q71Cq6Vzt4a1G8PEhVtnWMA/+tyF247eB7n40g39Xy3QSmA0GDDobJDj
	 ScMb8W4cQyglbhHnBptIpEGy+QDKkfdfFsOn8OmjpwQudnVQZjq/tYby3M5e/PimTz0OZ
	 zsm9i6BkNOE83Bqk0fTbk8fO6ABwla2brPs3x360qePOin3fhx3EcjCI2xrLwjiq62w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LoDc/5XT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbdXhZkz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F298960A2617
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F298960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoDc/5XT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbdXhZkz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAg501459329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=; b=LoDc/5XTmMBooxcy
	IfTPwVAISSl8X+sMQCuLqyCw1eBNgxRbZMIEMdCtT0aL3lGJ7T+v4GJ0gRUNfHXE
	2Lm6sxG1cr6I7oIJVWoM9AtRe2X8qWExgfPAGfUKVrVC5j19upkd2qGgct+8Uz54
	tpdjwd2iFkQzUeSREFrQM8dmbiTJfp5EbZvkd2pRQS6rVWwFeJ5nWuGgfhstkHkN
	RIA7Yz31fwRanknfdJZKPUrO2tUt7JyE709L0vuQqCBaI0QjDFslzruXhuO6gQOf
	H9prJ/sg9N4kHm+lnmWZzuenAiOI4rLs5w8Gc51dsjMmz1ht2tys5GRdN5wniOvv
	0091xg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttrng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:12 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6799288480dso1942170d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200872; x=1793805672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=EbdXhZkz17UjAsEzSbwZjXnuaYzpBSGpi3OSAvmJymq4xypEC+8P/LvUnBA3/Q0ZuQ
         ph+tT6wPdkt/65AbgvBj/IQc8bApJr9GMNUqux2MCzh1DbYXuZ2Om0R8pT3jkOibQbTV
         mWGjjAIRQ6VVbhza96LMJjgJM+FoECxk/avcbDMXiZAnFSawjrRyTt53HDkO9ORUKAcb
         68rUL4wm8n+lpmGIIzNIB5/CeYtYh9/IfQ1KgR0ATf1Uzm+8DJuQgVWuAy7U1g1jBQ84
         Nxe2XXk6kgfZmBu9ktllMpet3SFAsN4fCBk6VZ4x7mEmKuPpS1ZvkAo4q3LJlcxU5sZG
         WSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200872; x=1793805672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=pZqcagW2a7DVTIpBAd8Hu7bDQa5C8pyBk36T7SbGuEN8iwUahEvy5YPNUPihG5qG8C
         fy3HNUxPU1P+4Nv8g1tpmPg+eKIVcOp0kjSZ9vFeY1x0LqCJgNL4nhaxsttUhbIJC2QO
         8tbCT22k8PNIbASN1jH932Qh62MBVThPZxJCmwhaGhnJe7fLoV9v+YvIpw+y2wN2tzIx
         9+uJULz7vOpFkNMcvDdrerQFR6zV5jk/ZfmrMZOpAhQDUMEEyQS5y0Ih+ITyw6pseP4l
         DINlsYC1c99UcCjdm71Mi2nJ6MZ+FSeZhAWtYA2vmZUbDxccERBnIXagHrbQCYi8i/xH
         hiFw==
X-Forwarded-Encrypted: i=1; AKwUvBxoXcw7dVjBatCosDQ2DWVYZfMsnV09kJdXJPNwVYp8VxpYNsL0caXfup/755c6fyOf+NNIEiKCLUcpC4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4XLAQKtzWlylmW9jmeiG5USqIsL5mckrYnxT3z/Kcv9Oxim+0
	HsctPFU3qpMKQQd7ouMq4bYfTxUjxknQ5sGGHJYxA2aEmN5lOGQe4fix7jHviWkDMMnfrjH0MRN
	uimIZwKuGKJTlLdGhhRnMP9oAr/ZBW1qOAuQxenlQ7xyBnLsWNjczvT08nZkVQND23ZQ=
X-Gm-Gg: AYBFou3yu9CuXPJHB1vdMTCkIYxZ2l0KMyNihzp+nqUgfCLE0CHalEidXKSpbnnnidM
	eVdp3Hx23ItV+H77MrT3a5dKou7/WsV8IuySCWYMPCs4s09lkUbDQsgLoDG9uZ6v97xqYW1DV20
	DFUNPyKmb/surI0MSjkyBvOhBN/cApTJjcwcetrBzz5IFXVJR8JqnMFJ7+DEe5PP0pIOTVhH8cx
	LMPnU23vmypWyHGp97iBqqkke9neFovG0GkOKOmFdQcTYvhnFDT9eHjLEsBNVD0W22asJQ09sOY
	oNbWxlZ5c8Xflv/EsAQD+SsmqOamAvlJ+v+Pu36Yak1v2ySXFBKRYkFbx/MeBi2Us48TbLLKB6N
	OVebNf4S6F/NxZ7hjOIQOBUjAPUANzRFh0UVbiLQABk1vM8MuMF1xEDBhfr50BAphVFZ97mJY3Y
	X96ans+/TKv598qnh0cKECxETKMbMSvYl95biEmgGoAEua/HdMgMRUMnkFNtx1
X-Received: by 2002:a05:690e:1248:b0:676:9262:e743 with SMTP id 956f58d0204a3-67a7bd7dfd0mr1878877d50.107.1793200872162;
        Wed, 28 Oct 2026 08:21:12 -0700 (PDT)
X-Received: by 2002:a05:690e:1248:b0:676:9262:e743 with SMTP id 956f58d0204a3-67a7bd7dfd0mr1878836d50.107.1793200871586;
        Wed, 28 Oct 2026 08:21:11 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:10 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:38 -0700
Subject: [PATCH v23 04/15] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: mIOKahMt_e_bpQaCIOO6HqnKi9AZAtTI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8r26xYW1uN7V
 NI1fpo9jdtgvoGTZHNeIyYw4dAxqVQrQKjAp5AExk3Jc+hFuncGgIUDiUQIH8y5ctxEGLBDbHxt
 MDNrwPwKEd8gtOIMWPoh3vJ31Ue8JxU=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae212e8 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: mIOKahMt_e_bpQaCIOO6HqnKi9AZAtTI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/OqLDJ80/NHf
 088GHqiSD/c2AeAw0XyzdvVnfNLe75oCZ3c4JZRziIz3uswhylj6mIA0hfzg80jePlIzgM3jxwv
 KswmJs6ikqG/e/xDLhUkMfEJnbFteT6chuvuRzB1191tB41KjuwDYc4KRAxfcxg0HKvL+sTuRIp
 mMknnPYebhUB+S3MNbTkZwhXpfNvwJa2EqB5YB16axV5AExuosB1TbQgxIUMFlk43emk3mEwJtq
 gWsqO7rhCmCk68uGTo28lcxsOExIElTcBROktAHW1+HtYO9FZIQhLLu1nPO3sVVYSwHJRwIqS1W
 EACiXfotCaWXzrfLwF/p9FoBz+OA6BfYeiJbgdYtNxqyhU9eyDTmIt8RSyXqSh6qgymplSZaiNT
 1v8uRZPh1GTMeOlGUe/sBTgDY04AweisxpqYiPuVGMzms4RtaCN3gzRaQSW5Db0Q09wnLl8L6Iz
 h7TYifKdxCW7fiOLCQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

From CSID 680 on, CAMIF was moved into the CSID and the CSID became
responsible for issuing RUP commands. Starting with CSID 980, RUP and
AUP are issued separately, and each command must have its corresponding
SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.

CSID 980 and newer require a specific stream-on sequence. After the RX
is configured and before the RDI path is enabled, the CSID must first
issue an AUP and then a RUP. A RUP issued before that point would leave
the VFE without a BUF_DONE event. Therefore, once addr_update is set,
the VFE must skip the initial RUP during stream-on.

Add addr_update hooks and camss_addr_update, and make camss_reg_update
handle a missing callback safely. The VFE keeps issuing its initial RUP
during stream-on and behavior is unchanged if nullify addr_update. The
skip takes effect once a generation that sets addr_update is enabled.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h      |  2 ++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..2f7e593defed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -137,6 +137,14 @@ struct csid_hw_ops {
 	 * @is_clear: Indicate if it is clearing reg update or setting reg update
 	 */
 	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
+
+	/*
+	 * addr_update - latch buffer address update through AUP
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing addr update or setting addr update
+	 */
+	void (*addr_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..4f8867daea4c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
@@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
+	if (ops->addr_update_clear)
+		ops->addr_update_clear(vfe, line->id);
 	ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
@@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!ops->addr_update)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..8312e4c91e98 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,6 +99,9 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
+	void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*addr_update_clear)(struct vfe_device *vfe,
+				  enum vfe_line_id line_id);
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..be58a39f4a8b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	if (hw_id < camss->res->csid_num) {
 		csid = &camss->csid[hw_id];
 
-		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		if (csid->res->hw_ops->reg_update)
+			csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		if (csid->res->hw_ops->addr_update)
+			csid->res->hw_ops->addr_update(csid, port_id, is_clear);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..431afeb381aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_addr_update(struct camss *camss, int hw_id,
+		       int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.34.1

