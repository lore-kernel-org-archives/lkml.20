Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FF83AEB32
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146484; cv=none; b=H6e7pxe87rtO+PPpYupbPVvNnv+kzNQZxHjMtl8N1lJM7EFG1j2PBhKJeN3UScuc7qzXhOuKgpnXrnRW0/Z+YvJhy8I7B5Pk9GlPUT2osXcBLE3S4wKOjszS27jpbddubUFoisHBJZc8gFqk6xef8LR3sc5YAcKlom6rQr6/EDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146484; c=relaxed/simple;
	bh=vFEvPO/XE+XouaYcVLQvOSzpzZZ4PJnz0oNxaLBLves=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POFHb6P1XJR/9QG9uJMq37Kmd7dq3Kv8/DTUAZVofxY22Lf4MWHhPBhp7HzZ01g0qaQwt7X7BArFIJjuKoN9J5QzS6gFsRgG9oAEc1UtKHXlYH3/6P+MGgLi9KZ+04B3HWFisnDqZsLuiza6+dnCjqH0l/stmiDphRh2lTb1T/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz8HFuKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tu93wAa3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz8HFuKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tu93wAa3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bPJq1496291
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=skvBLVXtv37
	xFG6/3642pFujhn/nXtf6ljPmdlTf+Jo=; b=bz8HFuKg3kY8H92sccfToswqmzD
	3X28cy1e6orWLibEztVG03wwJhiZgH4JW8FrVgU1cc8rusN0ksGkT1+WJa///H8o
	wIR8kV58+ES1tZjZXcyTSxOlBx41M5vMha35RQglidZ5XNw8r5l/lRLjtv9qKwN6
	H4e50RN8TpquiHlZvNDMvl1Fk4k2ZWuQTPDHTU3smQdZGXFt+PIxBOFKxLHMIHg7
	UFzKuywF/KJWfeRCLiMOHc2C5VgGATprhFbN33NMKnEfwyLLvkDK6OwVLypeQQWR
	x+TRCRe89X1A3Tcq6WXY6DJ/QdKqqctrj/uvbEv2hebZHAqp2ZpXz2T/bLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq846c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:21:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d52734fc41so64280855ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146482; x=1788751282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skvBLVXtv37xFG6/3642pFujhn/nXtf6ljPmdlTf+Jo=;
        b=Tu93wAa3161wtNoDK8ulK4X0gPJa6L2ephcuvk2oeH8EIsmHRYMiIShYnFgLUSSkxU
         /7lXTDNbShuryY6ieaBGNQy0rHmzydEgYtpRH3bBVm59oRV1ysVDn7lBuhVYg8/LaNfR
         vm9K4yH1l+wV0z6Jb2cGajWXG1zjyauHEkMjjTrAsf0ECcxsaMWGuKZ0yhSAo1PtoOOm
         +vf6EjsuITInznC5y94pNJ8CFUflGII7QBg0kJmOlAUGgT/omOKvKg6Vg61pmHp4kr+k
         3a/mJIS+f7m+vt+frS29l2Fr4jbga8WTQkXLZzHUbx+QhdYuDxbwKplXEB/227lPttFY
         AHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146482; x=1788751282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skvBLVXtv37xFG6/3642pFujhn/nXtf6ljPmdlTf+Jo=;
        b=Y34PGfxYiHRwod3Hsn65XjK0C23yNm2Z434n8oM+I5iCJxdaeqNelX2fE0l8G80+d1
         81TkkUft6VDjR76aXb9/9ZCWFSzHcHpmGfx8RD/asx5MhABvzg+TQ560VzBcQe/cL8gV
         z6b3/1JNHdK3lYp4tmxUEee2pHUAS2mFVQJcmUVJ12vSPC6THIgX6ZINput+Y0gSksJv
         ZP00wSneWdGd7vSsS4CuvpOrZJA9OkJz1rVL6bH6L51A37ATPpf22YLwLBu1OoKUzx+X
         GNPRABxoAXYx3HhmB+Evv6pU8lXHiABBkrcC9rMk/57Ml/e7Te3uFxCXumkqMAHgowaS
         I1+w==
X-Forwarded-Encrypted: i=1; AKwUvBwdSkkXiNEdsr64M08UMFTO+//xbHFqiVkGNiteNNc4Ir/t8+gBSmPfyj0RgpK++VBs/w9Wr819OUybyTs=@vger.kernel.org
X-Gm-Message-State: AFuF++lWGD5APDUwNWo8njpVDX72mLhjFs3plDXuvqlqsOup7b4aTCyG
	T425qcEnGNcN9LISGgD7n1qU+qZxhqd9wPnUUe1eI6jeKPNPNEFfmwPSTnPwXqIKzjprcNUaLPu
	JVmuz7Ec1r94kCSyCEJwf+IbzpmJRBpNoXhFaDuRl04+CMmKCLxOOSWlIyfvZ6qzGcco=
X-Gm-Gg: AYBFou0t+VnSjb0lgIJGWwC7mDYjKYe2yJpLf+Xh5lYVRrNL/oPE5sHPZCTHL5eSe+A
	yKhbYDQ4DMgQtNK6VyoiMtmy/kosNTHGe4cXB8872CtZbcpURgC+31iTvAUDwAaFbkFvLK/SazR
	7N1ISq+xJvB3HsuHDRZ+WLwHxz1QR7pGM3t0Ib47sAQc/5ID3t0wDrqZwWupclqmH+HCODSIo1i
	5mBjjimjDGxldXTNn8b8w6JWaYi3rHuuI6JkqTt8D3ZJAKne6QjLyOtZhzclxzfzB0J62/f611v
	W7AV8lWwF44qeUee/l3G1OugLSydQV8efU0H/ay8gbvHUB5Fh55a2qUzjqMYj7msHGUi8yxmhMN
	u5lIkjCf4ERSLuJbB13ojcW2d2nLFHOsvtr+0Ipwu5vRJQ7XefA8c9pTtWrS+
X-Received: by 2002:a17:903:4511:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d74dc83cd5mr299096075ad.6.1788146481724;
        Sun, 30 Aug 2026 20:21:21 -0700 (PDT)
X-Received: by 2002:a17:903:4511:b0:2d6:ede8:51c5 with SMTP id d9443c01a7336-2d74dc83cd5mr299095765ad.6.1788146481348;
        Sun, 30 Aug 2026 20:21:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Mon, 31 Aug 2026 11:20:59 +0800
Message-ID: <20260831032103.341633-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mP69-X3OVSVGgtN2KIsmpxjjB3Xk9vcG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX9UcLQGGgY3TM
 g4hvA2q87mE02+vDva+Iv0h8QHUliKFh/xuR560CG54BpFblRaEoQoduL4JornELYw3bNC2mySj
 bwPhX1B9KYVVQy/1X+XP9m7arxvDEKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX85G+ytq9oU+v
 BNn8t/HTqmMVMVLXB6XIZOyeqDlarpzkYCF4N4UKWd5ZTHIyV1rg4xEOtIBTII1jzJQ1bP4j0sZ
 PFOR84Ak3hIe8ciNL4gDef6Qk4qN92W780Ka5mhh95vy/ags6WIugipjSQZhaawWk8ur14cxmQQ
 q4A+GUnZs2tzU0fEWOQ/Vk9qdeIVd0WZBGPqq1ZOzPNBt+YJWXMCXug/txDOyDprq7tsw+bLNJL
 GGcWIToS9HZEbn2tms1RtZpsvhDuYc7rU+gPFza1qwzVibA6hgde14EeVAwt85qZ+tO5fCExgVt
 AHxVAoaMSe02cUO8e/TvBEyMVwRmgtlb07155Jw7zSzWKbTsuogZBajCU0pyU7UW8UtyO4LNnEO
 CvZ6BDGtX1WAslqPfrzOqqnX64k8GbtuP6jgzasnI4BoJPcIouqcPeRWWGoLt6Lr0LdzGKrxv/a
 uRdvYVQk1GvAgdmoBPg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a94f332 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JJ9q3QTBaA1S-rdQf8wA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mP69-X3OVSVGgtN2KIsmpxjjB3Xk9vcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310026

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index a2a19f2304fa..c25113676008 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -517,6 +517,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

