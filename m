Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347951FCB7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867869; cv=none; b=OXDbPvlo2wvs4wX+5LmiZFTXgSxN2Kj/rXkzeOkIqJlPc+hURkv5kkOB2CYwVfkzLr/GueL2QqPCfDFdATHMdx9btm57dZNXEssM3/+o4Jc48mERtZRfiR8pY4EuLyoAForL+JSbSj552NsLp5cjNKXGFjVhmTmp8FC4+KPiISM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867869; c=relaxed/simple;
	bh=8dHYACbENe9zIoAGRhAgln4ZTQ3SD6S1Y3LeTmOnvdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K92wjCHbDAKC4Ph67Z9t/PXSJ9oGleflLwMLwPTDLdp0Mb4Ib0rX8BCEQAyD17DALBAa0+EllYrAAUm8oNcx/n1pY3KtiaNYL2HpjdRg9oGu5a2ax+lVSq4xvB/dKGH2hHew4A0Av/6/X6+aw0dtXDBECNOhYVwWZTykMmrKZWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3pxM8rb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDfIbQCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3pxM8rb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDfIbQCW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Djuqb1304141
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z75d7BZmsuPtkFELP6Lw+MIVZj1WwEl2DQAc6UBl0iE=; b=n3pxM8rb5oirjqrh
	sI/x0fXeRdddLrtPgYuf51dpFq007o7b1KoF3vnqSy+9Lsuc4Uigt6cef86BRR/n
	Mp77f0kgRSS8xVTHuEfNLVBBZ6uqf7IwdJrL212dOkXh7hLkvs2Nb6otGO1BRJ4b
	19Zyqs1blpXSTcEK8IAp9TQuvyRTdfDxy/MkPplWQvzvRM13pEMfPzqesrQ3M5z3
	CVd9WDhWthvKPOWxb9kn4ezcn6Pxw1DFavi31/q05E8bS+X4Ke1Gf0Kgk4/ZW6jw
	9kGWC1SvW/0theLm1nRIhfskRlmeMhsWkWLUdEEI3bNpp8M36Iq0RMnVXs4VFskD
	VJQHPw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5cjw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:17:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34344599f01so7634632eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867866; x=1791472666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z75d7BZmsuPtkFELP6Lw+MIVZj1WwEl2DQAc6UBl0iE=;
        b=GDfIbQCWcWK3pSVhUWgzCMqjBvTa+oHLyp7Y6r3mu2j1KwaVQrwPDp6u6zj6hHyBJ1
         MWOoad9ubmxPlL+e4kUCANhv36wMER26fc/vwe2ffnchMFwWIbjGVIYr9GwDq3amsNmT
         4Mh4wtLbTzstom9rkGsJQ9ovbwIBnTh1Vnb8QGwtXD2Y9RtlZNlVVbBQjZZbWQx5WGVN
         9/cbsgcWDfewLLN3RFMbIF53lIZu2/lFZaj0nOSzhKufwdlI38rqvrcIm3X2STkrb2dw
         ggSfEpC8icZyTO7EsGjKPpAWQg1WdqS5wykgx8UZfgGHmh9Ps6OX8677yvj7V1EQPpAP
         XVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867866; x=1791472666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z75d7BZmsuPtkFELP6Lw+MIVZj1WwEl2DQAc6UBl0iE=;
        b=HMbITQ0RfAinXHW3t9q2aIWdEaq7FxN7EM4waI+nDXkN7IffIbxvGJtpYTFhyt8xo3
         rgY3sn2AXBUjKPquRpd7jHx45+NyZ8M82ee1+xZ1L78otmk0yuguehXIFC8GJllBr2Ky
         +/nulA6Jv86/8A1YglsLdmmnM2TTmfYvGwTc9d0pD8XW9s66UeIpRRko1CjzziyFtBhW
         f/bHRSdG/vRTMyK3lQzsPkkZiCnhp6XT4w/zaMdZc5E/nWCFAXfg09EjKwFC0SjVwgIo
         CugRJSALJz1ro/FOk9Fs4XmAfIaJ/xgGGmJWqI6x7itW3l23tjeVcdq8Ix+JJrNPpQOz
         vbsw==
X-Forwarded-Encrypted: i=1; AKwUvBzDUyilj2L1sC4iaMuy+o6d01EiWQD447jfX10up4TEnyVanzoy7OUjhsqfO8cxnWc9iMoj99UgnUtiQV8=@vger.kernel.org
X-Gm-Message-State: AFuF++ljZAmr8kkjmArdti8ven2qfX4qb72BC/FBO1MKmSjZlZ6Kz7tN
	Eyn79wXy6535mJ3YG/ERkutVWuEF/6T3rwmHqA1B8bsajt7/ViQSWlaQu2v+hLao2agVJyrCmHr
	1ehLH+I3T/12RJyklRB67jT6jEbByMhXJQpxhF5jdHyPWCabcUZuPO7Gke1u14oUeltQ=
X-Gm-Gg: AYBFou193R98kylTWGr0ktQsNSc02iW8jQOPrtzwjVJf25tFouoDCqHUosQOr/0bvh+
	hr+LL+firxzRr6buajKhlP+kWa/SV8QnaEZ/yoBTYzYRRV6PpjsDYXJXKlngT9UeI45Dku4lij6
	FwQBojNl5Chat6ikqXUHillRLxYJ4dK/o5+ghoxZGx2BenNE9BYBubW5h8Lgi9xn80D6cYM9kWN
	AecER5lHFyl5177VV8Rbwgo0pj1uMymcQwDhNuljyAu6YmVY2K4IRYCnC0/pbyPiWOGtlULRfHd
	jsm6aTc5yt5mbJ6v7q4Q5IK3YyZFYduESvjsTPzGz3u5itCzHgY2M8UmyQx6ryDznWaSjnhIIId
	Tj3nDmhm6Hzk4ngrNcZJkrR+mkifHChPSVw==
X-Received: by 2002:a05:701b:2406:b0:149:1feb:6da4 with SMTP id a92af1059eb24-14d332a2be7mr5529573c88.32.1790867865945;
        Thu, 01 Oct 2026 08:17:45 -0700 (PDT)
X-Received: by 2002:a05:701b:2406:b0:149:1feb:6da4 with SMTP id a92af1059eb24-14d332a2be7mr5529516c88.32.1790867864864;
        Thu, 01 Oct 2026 08:17:44 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:17:44 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:21 +0530
Subject: [PATCH v4 1/6] media: iris: wait for vpu NoC to enter low power
 during power off
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-1-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=1647;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=8dHYACbENe9zIoAGRhAgln4ZTQ3SD6S1Y3LeTmOnvdg=;
 b=qI7uh9hIv/aQrenh7s8qnXk9d8g0oBd/jRZobYKoOWZGmFV/sfosia37/D/0XzHURMkKXWwpE
 rfB+CYi2p8KBxKajQR/gp3O0/RdVCbEDvOXzWT8kvFntSRHm8hasXNf
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX0HJ8HZSLypqK
 gixjRhEghtbYpHxZ78XBDACuGCTyWNA2QOY0kGQXHWHa5OSgpRA4mcTnVbveDPgrvJ5BVT/7Xbr
 fmHhs22AbxG8VXl2Vs3DskkB1ZcPxk3BVjmHIaiF10errUAPiGLrNVBBeu/fskPuiWW0F87/ziu
 phgT/gfVannfsbsNhkO9M74T/LUbaOVQ1tjzODQ8BhoZw5hjuIVRb8R0XkXiKsL8qvayTHeVjIo
 EA+8vPrvyNRemm2yq4RvcvDH7yNEDKlkqUfvt74aPIs+K8MF/OHIOjEnRkIGOqGhxpfG7pcRdoP
 ne1UBL7V+6GPb/I+w7V1m1jxWtTU9lWri9qXGQMX1a9dPfemr7X/8F/AwAamRRbK2twecess46P
 Al13VW+uZzimppGO4tJTHQZNY+ifgfgYEhEFLYPM1kHXHLtJkd+TIteuyyT61XpVCup3jpn6sYG
 prGJI3/r4GnKGoG+4LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXwA+6o0UItUBX
 51AqNOiwkREyca7upHQ/piYYBiJWgdsQ6teClT2TX0o2MNuk5QRjt154MJ3EtMtknR6cQuRkdXG
 /AlNRjBlqRLHiclf7ZcbVyiw0K7u7qk=
X-Proofpoint-ORIG-GUID: s-rHvJ05muGloorJyP8QTgiTy0Q_2CNO
X-Proofpoint-GUID: s-rHvJ05muGloorJyP8QTgiTy0Q_2CNO
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe799a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rujDjMnGqJPd5R0KWf4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

The recommended hardware sequence requires software to wait for vpu NoC
to enter in low power mode and then deassert the low power idle (LPI)
control. Add the missing LPI status poll and move the LPI control
deassertion after the hardware acks LPI mode. This avoids any pending
transactions on vpu NoC before shutting it down.

Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu4x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045fced33d7a3545b632cc5f0955233f..32a161c8d534a34eee4e7778426b4947b6c17003 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -316,6 +316,10 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	if (!handshake_done && handshake_busy)
 		dev_err(core->dev, "LPI handshake timeout\n");
 
+	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+			   value, value & BIT(0), 200, 2000);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
 	writel(MVP_NOC_RESET_REQ_MASK, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
 	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
 				 value, value & MVP_NOC_RESET_REQ_MASK, 200, 2000);

-- 
2.34.1

