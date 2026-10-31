Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453014;
	b=CPhSnT2pKf2pzc/W3MLtNOSizBZAqggVuV5DGLpEqGXkuExGrkf2NP1BkIOKl8sbVYeB
	 68TOmkT1osstLnx+84a2D6IhsE76179vvjBlQjZToZfhw8OApN5A/BXAozXufzKoDQc+V
	 pp7C2ukwKbJF6WdQZpHF6GzeDizhCYu8iI8+xYK8RvJmNr9knwJbq+kUL+XQ8dJ3skIL9
	 NOg22a4jZMWuhovRcsHzZ4JNUysEOPz6uWZlXf+L36LMMQdpB38QH/a+TeTGUQyiXIg1a
	 9Slv5oP+yV/PveZsBU2esYWf4jubnRiCbZfP1btGrRVweY5ZJELcWcCeg0QakVxLQwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
	b=d3ZZE/lO6ud8zL2Yf3K97GpljMd8azsIv5ITX9azvTDTqaDj7koU6yJoAmHbvOjnv0VI
	 LCLd8gym2j/uj4plZOSQEA2zz8cLormuHmXENQNLXF1vTMfhDGtcLsXWKCObj1Eb0xoyj
	 T0SiEHhTXtfReXiZGHGs1f2C98GnT8MQ9pNhv5pDRGXH9HbdDo01rvkZxsEG7c5bu+cz7
	 BW3IsGS8gm6N/NED51+kwqxoIAGpWnS5lQDRkdUqcSNDAEWfzyat8Z7yXSP7SRV3QWblq
	 EhKV7LyArCwEELE+ijHgHDXY18jUdXiKvovIcZur+Yt6lo8/Dw69uQUPIQURMCrnwmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2rYv4TF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cfWAd/M9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60572606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60572606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2rYv4TF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfWAd/M9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0Uq51233826
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=; b=c2rYv4TFvpuDjNPm
	KvBMRy+iSTWSiOtIftr04F/V9HhCFxI/wLZ5yRWabtjLd9wLXBAl/7Vc3rZn5zCX
	jXXIvXn/t84nHzBCkyF8HgPNwXnG/Y7eJENNVAs5rwB56+KB4t0xPNB/o11hxQYN
	Oh12Y0z8QJTPo6xKslvcRtLnOJEo+7Bg20vPDnHegfJ5pF+9FSelZliEdrQc3x7L
	bDNLoD0keSOm77meQ5U/l0vdLdSZTm+Yfz1yXmOy6/vcitj6cwse7bR4yP94pwGL
	9u114U59lxpImBxyx/ZkVU0pQhl+OQBFvSfcnNG+L5U47rIkyDvu+aO6N6WVVrjv
	32whcQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98yum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:23:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3649764eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453012; x=1794057812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=cfWAd/M9XiKmc0YsI0jZKS+fXOdzXm40BCLWHLhBivjVDra++ShmAjQcCr7slyqC12
         +7slbV3+R8iKXAtcCOvUyEJsgM62mwScqK/iHHtHksH5fONQvEwAIfhZD9uiqoYYFYrs
         xoIjQHA56kH1xiQuraYyXLSdiabtBpLBoRHHruceEdQGH2FrsrKSfaaPDUjpoiwiaUTH
         91PGt+OF6JWMHQ24+FLdOjQi6xDaYNj5Y4WKn7YThB+0ZsPIsTp+5di7pyzanIFvB40H
         1GsLG7NJL+3puyzwmkfIbrbhwv2CHFGCw/t4H7WZt4IYA9+AHvlJc7oZ12BoIUF5l21S
         OKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453012; x=1794057812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=LQgp8F9lrD73FCDTthOqSLw8jOHGA8Id34qFQ5e8rCw+voFmLGlqjM+Yc9zXtntHuy
         vWD63IcEPv2eMPShFeGZLLSDQZcbARB4Etrjh0QAo3+UMtF0ZjDVU9hF1Ky37cCT9/uH
         X8WuCjdX2BHy018xqoDriizHvjCmAqRJmmjx0aT8lnYWi7h0gn8NU5M4EQ0ENP2Hk2wf
         SoeKM1sJu+W6ZPteSbAT079uGC/IsoN7ah5MCvEe8TbwxKhJjCSLJjbZZVQtqr8ztu1o
         750LPOgtoIiKPd8ksth85rsEhvIEuP0fr62Cf/MjnlrpnZhgI4Bbm+1IV9Rm3Yq9Kdu1
         aZ2g==
X-Forwarded-Encrypted: i=1; AKwUvByi1SEVCZxSlhvxbcLfjP7ns7rLYPcPpeMgU0CIWWAopD4es6INsH+2fOhjnLQYiY8EwkKY+fOXSK4WtaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrrrIeCRzMoKDUnz1UONJEsNw5T9r1lJzfLr6Q9xuGeofEXrrk
	wXe5aw7/azh304WBeKEU3arhxVgFEbynFtZlBLvaWt3wGAXYm1gLgI5kxtvUWpmFxNEMB/wbIsk
	FqbFimEDbWX7TFYtQRiJZKWVSAhNzNKaV+7SgcQeKAUTxiC7rOEa0xc3TRKAGl1Lbsjs=
X-Gm-Gg: AYBFou0j3LHLDGbz5cHAvj1v1V/5aa2q2RBPwNdX0pFkCnmKJEq/Vk8c8z1DqF4XfuY
	grcH0GGMoyA5YlcDoduCdtlnL2dW9tevPb+war6CGVl4U6xmx0hmE40Wkguylcteu6KnvKSrHrf
	DvWFxEAShOaKEXmAty/Z40/abPZwCzvSk7A2F5DXQQq5ShbikJvdKb+7+jyOvbifzE0tYAP1B27
	N+XZa34wz0TuIEviZP06IxZe5ibybwgU+kh9EgXInIV1UT5hkeXgtlISkg+lBNNanchNnm46W6F
	iIMynLwk5UBmpxJUsuLoftqacgPmOUvUSr4M95vCRSJMmz4Kdw3di7GXivwBHB2YLowhbL+N8LS
	MZmpGTD412q0NR6t1HeH6DzUWnRMUCUsfNYMBnAOsctSkFZ3CYhP2UGPhPbV+pJRLew/rz4oLw6
	XI00w=
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr6447671c88.7.1793453011897;
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr6447639c88.7.1793453011363;
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:49 +0530
Subject: [PATCH v2 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
 tsens
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
Message-Id: <20261031-thermal_bin-v2-3-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=1770;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=TcfZeA/waj0J1JOXR5aaLYuqHVj1MdThFVHzlUlOpuM=;
 b=3Y/Y8DbkZHHp3RmsPF7huUN5sZdXxDlrfYSb4AnGAX7ah8k0vgRRAhqdE3cqbDQfR5sGu2+PZ
 7TYJIsaVQ5PBy0wh7txpYwXCTPVpNpEBj0EUwzhS/kiaSbYPtHjVPLc
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: 6SOeraQtE_YD_KmO8hQ88lDdFirOBGGt
X-Proofpoint-GUID: 6SOeraQtE_YD_KmO8hQ88lDdFirOBGGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX47V9Sqzu9BUk
 edpk5bELO1TSNR+ioQUci3sFWmLMO9aB8aH0pfRp4rhDO4lY3Yno+k/L2H2OJnsh06mUd0JT8zD
 RZEGrl2iq8ClDXf1Kkb0tVkq7iIOXXWc4xd2nb7fClbD121ys/5pG6p5F7wc3Lya4OVrf5A57vF
 A1oNT0yQe/wMgrkp81P/mREYO769l5JTlRnUVwYB9wI1Rxn6RKRMsRcW6bHROudq8xxffftbNwj
 gaw2MIZ6CorokFLUob4w744BriMUKRnbzO5ftG3j+J+FTEq3S9Msf0NMeFx3tSegHo99OFAnfdA
 OvoVMqqzHagodLWimDSU1hgDRXC92RHZPJ38Pn8hy1S5+3tUfRo8AvuNl8WqjIhgdhlyFbnccZ0
 l2McnULdaXPr2hJ8i7jJhvfYYBQxW5IB/oBFtWHlWoKqd5wXj1aO3h0fb4Q4Po7lIluEEB2kkhy
 i1q6l05stz4bjKS3DEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX+duscW9INmsx
 DL4FyW0LAmzhQ0lf7sUx0gD/zAiDfX1P+hk7ot5HxSyEvo3mNEl0n0QhbdMiCqmOKUC5K1zCarZ
 m2h68lXo9rayuwLWULMDZBKas84MZ6E=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5ebd4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 5a8f7673e730..6899f07ec218 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -65,6 +65,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -244,6 +245,13 @@ properties:
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
+        # hardware-binning fuse cells: a single i-temp bit
+      - items:
+          - const: i-temp
+        # hardware-binning fuse cells: jtag-id and feature-id
+      - items:
+          - const: jtag-id
+          - const: feat-id
 
   "#qcom,sensors":
     description:

-- 
2.34.1

