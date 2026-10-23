Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725407;
	b=I0LGvZfjIqyomsFhFWBjti9+OT6QuvX6DhAiGrHYq1Gz8mg1O0nAC9b6UNHCwhxYdqj+
	 ZlexiFfcE8/jjKWcqXTcCHMUsY+6OUlH0fEcOUcmb3m3L0VfFlQ588Iox7cgjjNCWmbfQ
	 ITW2+EDiVDRuRL1itcq04IbmxW44ReP8Ix1hHQZEqHe8i1Xn6lDXmS1YduWHwVppvFbvv
	 g7X5kWyNHsRDkKiyZ+6WGD79M9Nu0Lgc4yrygkvHUhOqv+gx7Wlac9v/ecAEaF8MpdSN6
	 1EMVIX7qsREeEBDZKa99oOc3h3RkIrTp0H4MFp3eo4I7MonbpNhoR2MrOEeOFsNO6tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
	b=HlSpV3QMzoSg7OOx79++w/B//kdoHa73trcSBwo+Ui4DY71/ch+IZQ3OeIAZiPVQHwCG
	 sFBsWqGgF/VxaE96uUcsvHhR0RMruEhXPRLOj0KyBv9nRK9Cj+nYflUWtDTW9+oQ2ugFf
	 MHl/CcDGpE8r9qDwmy3eKWDRz/dLpuDcp5X3extPbs4SZQd6dmF637kb68j8SFEjzG5K5
	 +bEYcnub71O/1U9TokEONDOI2MVCx2XE6ZWpSYskFE+xpvCTMmISOJ6KHzvnqhDQ+aBl+
	 aWieDWuSev84JWacVcnoA7m72EoxDEExrFdr9JJDHs+h0DL9Ptjdtu7SGnemmiWIa2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWp1UHT2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQKQmI3t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56890606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56890606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWp1UHT2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQKQmI3t
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EtLj2389426
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xvq0tv9LAvfgk8g4T2nNFc
	bN/IDFtiOTOPum7364YBo=; b=bWp1UHT2MeTe+d70qpBPFP2HUINXGhWOinXciw
	CMJS5VSlicK7ebfvRcQff3QpextvSlyujLeC+vM0RHGiW0wVWjujFmK7g69M2Zr9
	EbasxSeciRuufRK1aCcEMt93pXDPKHSHHVuU+h3XvbG4UyVxWDZz8sC6uNrhRJA9
	7EH81NYVTLmJtKXv8nNjzXRbMzA0i+vKt9F2tuf8WJQ7wyWOi4Rx1KBJko+2CVrO
	vI7yqBCsJVhv6iiPoL6OOuVH1tkTwVGoBZtTtuKmHCgfa5f8QOc0CUfH/WHiJFNq
	fiK4pmn2qRBcFr2uRBLzXN7BpoZma8PqQbBy027QyIQkCd1Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmp9mr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so1459766eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792725405; x=1793330205; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
        b=eQKQmI3twdXmw+v31npwo7oOTcJmjdSI9qGV7fhllMZyd063m3a23PQQxsMCqyBYhi
         hJu3kt9A0zpU5jp80tn2f65WEzRkvMgQjGC/a29iqVMNShsKyX04shsr3XlhdHo4EotH
         gR2AFzK0F/6C1p0LsPUeaO2dG8+2lHfNZ8zzHqo/v2DLHOrnbEh1mISOR4ac/BTwwCso
         lRt0/BXe35+JFYzeVYUnuqYukg5ey9I7g5t1768BMrbOldDXBeUQjOTtBPdUUtG1y/DM
         CQjL8lAPN0+AbLL/MZQjqUQ3jZwHr0g97LakFzzXydUrSpbracoIT3rtGhr4WnoLLQIy
         W5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725405; x=1793330205;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
        b=IE+gq73i8iRolbFnVJYe2dJsdd1Fvp7gJcnXBsJwovfU6Ut48BYPQsCV9CdxWzQZQ/
         ZPU8qkocmcqP368ueCPnTej0LnpoPrqUdxitNJbteSxz5qfWLBdj27BiEz4nS3m0Zhir
         tgIJmW8c45bB73WpeiluCuaSkgny439LDz6RGasyS3SZCQuxG2/p+4mG3cp2PK2MQYxN
         /dm1Zu9/E6LSrsg8x5mJ0Bys9yOiruHf/K0C/KQ3wIUAuKZNmUiFqmY1lWnR2VnQFAfG
         lnCFZvUMju9OscFsItP7W4Ryy+GZJLbrIx4QPkRzIlKQGI+MrUSlQo7UZ7OClMEBSqkK
         xeww==
X-Forwarded-Encrypted: i=1; AKwUvBxiPeeiRl6F5GJoVr8KKNS7me6hJzlJD04lU2U+Cj44Zwz9c6KQMU2rO3Dd1S5Lwsh0/gC7vcUDUKz2StA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZT30ggY1svun8Hdv3g+oyiTki5M0oDOH97QPIuq5cfuV38+Nx
	VhV2cgbhcNAfpLIw9HAJKixcc/c3nO4fUlxx0KPbzy/76VLzf9LaUWhrscZIR0JGg5YNQ7vSbRD
	OiU5Jzt+9VH4dwP7jeW981WX7PkhAC3q6wqBG98DzhVf/YhQOUF4GOIEX74TBsbwlocI=
X-Gm-Gg: AYBFou3tpiCVDDqpeuJswaHuszQ/0Gf8f/g00VaMo+/C5GCt0sarCGESvEZohxJfgXE
	doBbBls87K4aqLGxDZnJRqHisDVNMUeH0rwW+8NlsyzK1jDHo5VWGM60AMEyNDFeoQzQyYhpztp
	CP7saHiZX17JydHbaw6giG3/V3GvAckwUFhbHxw38g11YUa38R5C4fRlKiqpkNksZAb+t2EA/CP
	sTjRYccUT4+uzdFYimRiVS8UUNC8RcmB28L3Az2Y6UrlnuOyToKFqrX5VS5u16H8EDkiIGqkzhL
	euGMUW8wpJJLDSErrSNliRDHeDv0gpuG/b/b4d78aksLkY51xnb0tWAGC+LTogM0eqcMFwNwiHz
	m01DvaFeemyvlicZ7EMwH8C1jkUJodA==
X-Received: by 2002:a05:701b:2517:b0:174:cf1b:235c with SMTP id a92af1059eb24-195c374b393mr1403060c88.43.1792725404803;
        Thu, 22 Oct 2026 20:16:44 -0700 (PDT)
X-Received: by 2002:a05:701b:2517:b0:174:cf1b:235c with SMTP id a92af1059eb24-195c374b393mr1403034c88.43.1792725404193;
        Thu, 22 Oct 2026 20:16:44 -0700 (PDT)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e5163e64sm2374454c88.1.2026.10.22.20.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:16:43 -0700 (PDT)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 08:46:37 +0530
Subject: [PATCH] media: iris: add cyclic intra refresh on AR50LT encoder
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
Message-Id: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJTR2moC/yXMQQ6CQAyF4auQrm3SGUASrkJcQC1aQ4C0QDCEu
 zvq7n2L9x/gYioOdXaAyaau05gQLhnwsx0fgnpPhkjxGijmqKaOrZU0LGkjv3lQRuFY9EUoiao
 K0nc26XX/dZvb3752L+HlG4Pz/AAtJwKbeQAAAA==
X-Change-ID: 20261023-iris-ar50lt-ir-cyclic-ec24f4150077
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792725400; l=1711;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=uh9KbzTFh8CqA6ntGZiEBYDrRo4L39Sm+dHQNG584XI=;
 b=QoR97ve8BBTOSE4yP8AE8ZLF2mcGhVr2FuaKGB4k8WbCteoRH4lLf16mKc+mYUWJzoxrSOggR
 fKN0PGZUQkCDJnnIMd84WzHiObiDqlljpyxhy7KPj6zgl3CGvolpCxS
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX8x61WjiwALwE
 U/4xgT/9w+McFvurBWCeegUjQwH8eo/sT0T8H/ZVOrQdOPOFzc0g0XRObXlJNAvciI5kzExJOFh
 LIvuc06RBDk1iuwZe6A6UvHICWrVj/0=
X-Proofpoint-GUID: aqj1ZIbj8-RpJFKWQOrzE5OV0S6yQxHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfXzDmDJp23nhUZ
 6YuTzM0x+NPL4SWUZuC9vVeRQAWfRFbWdQ33aKKw0DrNgOggu2kpu4gmYbKBFOoTKZGaX1tMCYp
 7p6sVBhVN03mvB1aflI/wCMmSLwt+ZSm8DpbPdVp4wzcYpQS2X7XCvZ8CebI7D6+jNlBeNaqfh0
 5vAkBtJfaMkIRntzKMChE0v3GySa2jLojjeNLbsRDTTkKbr51LrPVt4pC16qspI82rRZtEeGaPZ
 Yal3S8HQpVZwzZac1B54zbkvPJdHrS1EyBdpZUXtx3cKsz1bP6Se3YIOektC1bRl+DUqmLTpoWB
 uxvSEXz3WzPJGpCIHJDUjD0926gVDvdziazzlao15T0MJJc7pBTQZkqgHYTjN/jIjNHRRVbQ3gn
 jGmhWm/znIh4LCiahMxK5WhWRVMoK3isELZv1D1gBYeVdyQMJLYMCF5DXAfaqp0eWCf65Eoxr3J
 Vl9G8qiRo0OHhEKxNZw==
X-Proofpoint-ORIG-GUID: aqj1ZIbj8-RpJFKWQOrzE5OV0S6yQxHv
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adad19d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XSycHmPQ-ps1G5V6GkMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230012

The Gen2 AR50LT encoder capability table advertises only the RANDOM
intra refresh type, so V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE
exposes a single menu entry and userspace cannot select CYCLIC.

Advertise CYCLIC alongside RANDOM in the AR50LT encoder capabilities so
that userspace can choose between the two intra refresh types. RANDOM
remains the default, so existing behaviour is unchanged.

Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..794c36d222d3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -2600,8 +2600,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 	{
 		.cap_id = IR_TYPE,
 		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
-		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
-		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
 		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 	},

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-iris-ar50lt-ir-cyclic-ec24f4150077

Best regards,
--  
Gourav Kumar <gourav.kumar@oss.qualcomm.com>

