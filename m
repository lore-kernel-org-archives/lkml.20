Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817815;
	b=1CSJMkkkueVcc8iUp9hhpYaxEyBB8c+HQdQbYWUwXw+AhXxFqTJtoyxyXsHvcWHagxbB
	 R2R81oEud/KdCoWUMcpdQu8R6dipiwi0apwlAgJbHFa4ZNjGSQWPozgDqrK3NZJNMVsR6
	 BYS3k4Nba+l7bHsOkk+vC8nzglCj08G8WEShc7v23Qn1cJt0xVnzCVELh1Mwfv7k/MQYA
	 j2PfTvx0icDOFNcVWEVd6b4ZIUpQKmhFCOd0WIB0DYsWlfHLxI04T6AU5quLYvlFJof1X
	 TA0fU+2MAeZkYNjMxLLjGZ45DAWHOJ8i2VNFmFpjkwhQYozz9te4AwL4CyXTeRnxkRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XiH4baBnWC/m3aRdIMCh68KiTniU6JHIqlW0xB64jDY=;
	b=Ete44lTzonwwIoGc2KpbvVvJATTx9QMdsLeP0CDqKyIKYkosKFarTV1CvYb/I07bi6I9
	 5ov3QtLcUU/lNx46bmXxJ+d169nhutdDXt++CEVLhcLw94Dkq/0WlvglbEYqoI5KmUiee
	 En3H1+w8vvi6ohhmifJn2jfnvs/XEizIA66gw9Lllh0oCF771KMlSySxhsQO/lwCG51X5
	 lVQ0h5519sRxnwwu+ncPR++mDps0+N4UhltEmPLD8H0wjDBGbKz+RgAdHvGsU13uJJMB9
	 vrzYwW0kl4xc1ajmLHX06dfQ9MYXm4cmuES7kptoRBPY45QeYIY5JF8wHNWsteL9Ksw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ojKfRVVS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhyIPJXv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6A606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD6A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ojKfRVVS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhyIPJXv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FipWL3272812
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 18:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XiH4baBnWC/m3aRdIMCh68
	KiTniU6JHIqlW0xB64jDY=; b=ojKfRVVSpWvqmUUr1V0En7hZRSwDJG+sd32w4V
	qLtPQsDE3DLnVe0Unwa+HC9qqntrfFarpxcIV89P/yMQ61BBfEK4YdRgsyOygZP+
	nT+tDhQahE5Os+T3xhDPlZgP8i977HtXq1PfeenxreKJcThA5InSMDDtXra+A9ka
	trEKFnfX+rbAtbsPv8YoLbLdcHYUsuF2EAtql+kqvwbhCkmmjD4ht+IBPf0Cg1V1
	WJ1QJUbwYbqAaXrILDZeTTp3k4b5HbGG2xTcvykPwIaagjRVJfAkaFo8NviQ8lP0
	sO0iYuDdaY7UKa/fAFpiY1cRMq9gGkCve+PhyvmhwZQ38oDg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnh531-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:43:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso80231e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793817813; x=1794422613; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XiH4baBnWC/m3aRdIMCh68KiTniU6JHIqlW0xB64jDY=;
        b=fhyIPJXvVjJoLvUW6Nu4GkPEUjbFg4C1JwlqrZc+1dt78g1S4AgmYxtAFJv3us+jXS
         CnXA6macUIEnNSNxu/tqa13DV9RH6fdHZ91JlqYKfP21oARkfvHJfZThMtqO14HDrgf/
         Bdff0Uvdq9+JtGiffelPRC8wPeo7/7zlW72VHOePjKwhsAX1MbA9jWvZXl/kiH8tCegE
         5CyRx+kgTnFK+fwjx/cvhecP9Gh4DgAMxcg/+ZcUIYsiQz9jh/cg4tPL6TbQY0RezckF
         0+xGuo39YJoILt5nSXvHnA75ymxVmSmJWrizX2buyhhfYXrU+KG7eGwUzqEiINr34rut
         mc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817813; x=1794422613;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XiH4baBnWC/m3aRdIMCh68KiTniU6JHIqlW0xB64jDY=;
        b=Hujh4V1H0x9FOk81ajvP5aKpxwhSbpqdTJMrGY5o3At8yXxpZv52m+JKDi6RuCuTbC
         RaXauus9hdwJ3GiLBXP6TIhSjHEC50b5R6u9oGkByd/b5r/RYx2y3sOhJRB3nzFmYPYD
         aVuuI9i//ievnD+Pd+kv5Vtk2CtFnoJsfaeafJScuZ0PacvvXye1FyqBr09TkbxRI10A
         LDmvmgrFG/C6CdZaK3+RhrcLJ0DErGFrJWBmW/dbCguU8YqoEyEVFYLtwdOfoTjYvEwk
         uwMT+yhzRq2ShZf8iq/vVPLo79hu/TudayNoBB4hJpyEKOoF8LdwcUVPlZcEolmDnKyd
         xDBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMUA37smRRf0Dz3m41KlGmA9tOyWENyPkgkBWlcDyCPrAow0yTXo73ktg1qhrcC9mYcGPl4uGTDxqMTdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OeDX36KNBPdc2HvWnHZIfZlP6M67YdxfSk7XlZylZq4mKvtxe
	gGs9wwH0xAdMits4VyTB9pjJohdhrNw43Mh96E9YUP/aRAi8QLNTtEIfBEovkuuCm/XI0IzXpnq
	kZIck/jGI2VqygifoHFibGEUamjRyAYtJm9kWklH7uuW9gUQciN56CKJi7mj5IObtXd8=
X-Gm-Gg: AYBFou3YYH1nSdj87BSebcmkVnM0bV+Lxm1tIhAhZjrBjUs5QHw2HkwMGObDxy5ptqJ
	HwYK0+SQkxty7DnIurHEFo/T0081/0vnesCNqfY1LUJv95AKEm4ovOU4Rkob3a2Rl4uN3VVhpiR
	e+erL3mo1Hwkqgfvjh6o3DVO1ZPbcUfg2V4uqsqIDLwOXrWJPPwa+yRykhT/JbUeYfXmqFNGATb
	2fGCkJPExkJzX46KjhtlEmF9l0F+W7XBxxvQ+cDjPORxebM5IBFF4aEaotQjaPQd/wPHH5h/miP
	2EMJ11c2SWQGPR+XSD3AWbx1ufDEm5ZlFGSupla0QmiX2ZRpWTIVyQ7zMjh8OCYeiZk8W+jguTz
	N9ZUXnVmmRuvp7YE2oq0Byba6hPmpVGxJVL/IzNy5IeHeZCqDTO9fAtZBzFENgjLEj9dGVHGmSu
	NyeLg3hg==
X-Received: by 2002:a67:fb85:0:b0:7d2:7784:23b5 with SMTP id ada2fe7eead31-7d2778440a7mr1372989137.1.1793817813305;
        Wed, 04 Nov 2026 10:43:33 -0800 (PST)
X-Received: by 2002:a67:fb85:0:b0:7d2:7784:23b5 with SMTP id ada2fe7eead31-7d2778440a7mr1372981137.1.1793817812662;
        Wed, 04 Nov 2026 10:43:32 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:74ef:10f:2593:5b70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm5318152f8f.56.2026.11.04.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:43:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:43:29 +0100
Subject: [PATCH] soc: qcom: pmic_pdcharger_ulog: Match on SoCCP
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
Message-Id: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANB862oC/x3MTQqAIBBA4avErBNU7PcqERHTZAOhohVBdPek5
 bd474FEkSlBXzwQ6eLE3mWosgDcZmdJ8JINWupaKWnE4QOjSB4xTOfurehmrIzWsjXUQM5CpJX
 vfzmM7/sB8TOogmIAAAA=
X-Change-ID: 20261104-topic-soccp_ulog-9ac5422084e7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793817810; l=1048;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=A4QNvGeDnGnWPV+GaiObrVZ6WsDEzvQTxETsMkVh7Jk=;
 b=23KhUZseQ1KUlSrtYr0CZLwlHqYkTsW8AvUoPaqyaFCHzhsssWpTHjoOX7IRA8qjQrOZDITRh
 jSct+3Oje47D4j/PhvNYzATvjpN3TUPepzxJBFXX8tVonWKXCQkqMJ6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NCBTYWx0ZWRfX7pCGTZPN9D08
 0P89f5MZGgMPm5V7Q0+WS84IGNFt5sJU0Z5VQYYkH/gSPfcfHpLYzkj6HUZLJUMn8PGLDTX8sih
 mpudVDt06Ow1Atwyo8VlHOCUvLhKi8sDBaDFrEb55pZbWlLzMMakiOv5nJk2fyvnIBt9e74rqxP
 lHiuV5fSVdP1h/yq/J1dX9VSdARsEUWlYNnhaajxyZzXQEGDn+X/iiGXfJ/Y4vKIaZFVaB6Cws7
 zl1JuJWj8JZ6OIEACZw3kuhbuk4XV2EdlJQ6o4Bv3e5pN1QzJPWU1Cm+DorbWiAXfQEBnviW/QQ
 80ElXZ2ToGG2eQdIVW9si7up19taXyCZ4Djetx51xD6jFCXcc0VoEn1Viskd2cE+7ZOkG+EuVxg
 HDh0l6UvfL7QKzHj2mxvOA1Skg5tby4LLASODYZ9RQ49jE2zcHXhjdsHmMbb1mn2w3Z9U5fjPZw
 WSSg388/k5UVjLYyJog==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb7cd6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=08rFbc9rCsAaUF_WoO8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 0Vb0AXxxpvxqfgg03-uHKSR6IsTC9ufA
X-Proofpoint-GUID: 0Vb0AXxxpvxqfgg03-uHKSR6IsTC9ufA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NCBTYWx0ZWRfX/Xm2J03+ZcH0
 +xWKenWUJTKU3AD71GiPinChdgdwWSwXhSEXHOKELOeqONaD66C7IuUK9Dtd74pH9hUiVaGFuW/
 xusJqfDrquiRvIbqJiyynUeGtlgjLnU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040074

The battery management firmware, as well as the logging service, is
provided by SoCCP on most SoCs that feature one. Add the match entry to
enable logging on such platforms.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_pdcharger_ulog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.c b/drivers/soc/qcom/pmic_pdcharger_ulog.c
index 06cd9c4411c2fba0f3657b7e4221c1e9c9e898ca..b063c32957080976d8e6428c43663009f05f8ce9 100644
--- a/drivers/soc/qcom/pmic_pdcharger_ulog.c
+++ b/drivers/soc/qcom/pmic_pdcharger_ulog.c
@@ -148,6 +148,7 @@ static void pmic_pdcharger_ulog_rpmsg_remove(struct rpmsg_device *rpdev)
 
 static const struct rpmsg_device_id pmic_pdcharger_ulog_rpmsg_id_match[] = {
 	{ "PMIC_LOGS_ADSP_APPS" },
+	{ "PMIC_LOGS_SOCCP_APPS" },
 	{}
 };
 /*

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261104-topic-soccp_ulog-9ac5422084e7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

