Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3890C481241
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363764; cv=none; b=TbDBPDdC2ylyelSe5COIX/1cYAr2Om5oaTS3AS54Tl5y1TIcCnq7IKBog3FOELWo0N4h4gFgb+gD1U5R0FAQI//LxVU3+0f3fVlq+lOoeLwPsdtKph1tIg8uIP1Y7pAZrY8jsxT5eANLxK/IeBcRv4YgMoNh3iD9iwgmWmJHckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363764; c=relaxed/simple;
	bh=RuhyOjKQKg6pBFbp3gU3ApGTv0VXjIXo8m3P/9Wd9Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NiboOWIyDH8zg8UiVdJgNZ4qJLHBBeClPWYpOT6+Lz5wBd1qCRvgkP4jCSwJJ+J9eI/COlLoB3uPQx92oySzRHLBb54eT5ySrAMLJbdLe7zqbzlwZKLRxlH39Au+I7yHI5ozWYL/029/ZBsyO387w5HK8YWDNgbtZwEu9qEnufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLyPETOS reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLyPETOS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jlfG3686127
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RSFwFFRmZR1
	WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=; b=iLyPETOSABKLVZ5ZARQo1uGOZIP
	k8iVfaswVA0lqLUo0yhZG/tXkvfxyiDWDKGsR5p7ByfTwH8WGAPCb09FOrMLHc5v
	C2IkI7mEKiSUlctwAJh/i2us0c5Wxjl4f2YvZ5A72scxj2UMAJJq5pEYLEZBjiOq
	VqsiDT3sWKXvJQ/ZOutBsY+RT2D5IZr1nva+TsJis+w2hURPTrbEnPmcI6ZZaC3g
	w6CHg1ZcOsQ+PK1ZWtgJ55AUNAd/NDQGHS2vV6dBcIGz0eygcpBSo3WiFsoWmM1I
	I7/MbqK3+2EJ2nAOcVQWZQz2BuLrxE4ZyUnNDSMdRft4Zg5FewjIQVXqStA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609c6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:02:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so641236685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363735; x=1791968535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSFwFFRmZR1WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=;
        b=RDvopEjqo+G/mqHmE9zN+GM4siMBj9w4ZvF6DLxhw8Mxi4A+8/HH198/gZHqnT8HTK
         hq+oODT5SkD9WQv+lObJYzlRvD0JgT1LTZBItFiKG07nzMxPy5kWGwJEyGMf4NEdNyI8
         XaSx1G4nYQ0v4mkbEWcKMR8EU0pDbS8Igt0EEGX3X9Lr7XKjbhQwh9Fcqzb+ewQhVdEx
         YnibfXOQb7Jgnzu/4X0IQniijWkGVR0DKDjdHA0BNI9j7zYYvXPqU2Op5t+0V2ai8pmT
         Y7dhUODZ5/C71ukPWG+yWQzZeLbw+YZLlK/vMtQFoldicnl3MoJW1czUccB2fNsJ4HEo
         mccw==
X-Forwarded-Encrypted: i=1; AKwUvBxnw9e0RFEso26r4/sSvU8sgGZANb9uKdHBEnnpEqqKW5TKWIMPORRDbCuI9s0WnJASawUpSFSvFgKSX3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lF9XKKDWmGxRlPo7t9DBakINk9tRBg4b56dk4yPiunAD6QE49U
	PG2O6QVUoxhCKAMthC7ZgVrxXOxPBmIdHKzrPLarU1dAh8fh0PATcof42FSCx90CqckQLJ3Niw4
	/aRq48f7CI763MKdu+kHArSQ1+10nbUNfrRR6A31VCJoZZMDuDuwZI/YgSbPrW7rh1GU=
X-Gm-Gg: AYBFou0FlQXX9i4ELDusmOolwrXXUBWrdkF0YgQMJ1DoS2LQSxdNj5lJYIV1qLJepQA
	V4BN4ky7dyZed59vCGZXrRgMdS9iwwVhkONC4c9du/NgAoFc3RMBqRHcNGJdTKkCFTChfhtC3ev
	iUDoAKBaOj2ZVXFNVUbpiyltukboUPq370hJehxXQbBxSl2SoXo/05BXhOvUMRn/YF5KixGCa1X
	1Ar8hA00dSHdo6Rm5yLSS2+03kuZ63lher2C1hJciCIe5CqOmK70cY15DvunXFGIsr31Bj8pfxR
	j5CliQJHWGqCenaPnBfNBm7FyzIu0PMx5Nl4awM/QMW6mjvmlL0R5iV1bA8=
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312959585a.74.1791363735375;
        Wed, 07 Oct 2026 02:02:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312950285a.74.1791363734638;
        Wed, 07 Oct 2026 02:02:14 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:13 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 25/45] dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:21 +0300
Message-Id: <20261007090041.3732717-26-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: utfTscffSXuqOOeT6H_M5cJt9jGWLwAw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/TM2v5gP3GIU
 j/7HDHm3W92ulcLkk2Tu+gai4PqES/bxsXMYjJ3eEf1LglQ6btyjxPgB/RLj0/vxu08L5Igi0C2
 skloiNeCydOvGW7d6xYuuYz0ly23hi4=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac60a97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: utfTscffSXuqOOeT6H_M5cJt9jGWLwAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4HIhjNWUuwz/
 YU8d5JaCvntlisvU4nzwobsbaNRfw0VVBwpHBApK1SLE0OQ+Rg3CA4KdRWPfCTEPmQwQ51xVBYh
 IKwOFffo8bNwYQV0QyVykj/G+U1zE1V6ffVSyv5pSBd0vD2rERkAhefqKmVwKWvG5M3Orp2TApo
 ZDjtLFDl5PkixQzQdbo3708sRDnAYBR60waWbpeCEE5gKSObQ095YOnSkKP1d/7t6XP8olr0Ext
 eDfmKpMI9H8NS0rTbtk1V3G+8POo7Y/NnqXDgqrG4Gxe/iJWFmsaXWK9RPcM77sdtwONrRM1Je7
 CCZc+6ScHX1AwmnhfYEX4wpA1yT+dNcK7UHYP3REqxB6NIWyXwu3O1ynyh4D2YF90JPPffiGaRi
 nOaFrIlAJUupvDLguYSbHja2AzPEZMOEpfTiUSfkorraJaWX/oCwMC9DjbQJRmM9kbMI12yO4BI
 cuQe0q1yki0zyq5GCMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 48f280e99809..9206c7cfe197 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-camss
+    enum:
+      - qcom,sa8775p-camss-pix
+      - qcom,sa8775p-camss
 
   reg:
     maxItems: 22
-- 
2.34.1

