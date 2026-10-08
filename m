Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B941140862F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493646; cv=none; b=O2pJ36RFHYPqGP92dARpnQy/4LNzW6JLyl0GN2HFspnYXDfQoWpF3WmOEasJFPQaN3W7vMN4YjCApeYZw4RInGv1O5WKKP1TTmCBODxAjRQKA+zBc4rerSM5UXhHepXlnUo8ZQPBficzTQ6AGjNHLvwQwM4bFWXEYEQWlcmEhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493646; c=relaxed/simple;
	bh=QcvKbgxjM5PN6npOCQO43AveYmWO425QEU+m0C58+SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7jIXBW2gXsevMqBQHkBOJdrlqoYWgPP47Br1/K50nCXODYtotouT2/Due/+F7fhabnY3GigYpU2VLHUAS+AGYR/3dFHq2Lsqdf7iBd8A8Y8HM2aM87aCEV/56AEdlXLT9z+Hss/etHd+J5bUtLc5WjysOgVl8Tv5ueqIbux46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URsV+fOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjihPwfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URsV+fOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjihPwfV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L05nT3648678
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 21:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkAYEYOJ47Err7LXItBpqjbWE5AbOyqqq/B4n5EVcNk=; b=URsV+fOfLPSAFsuY
	aB7s5je3lOmc8kUIpZMG2wMnhVa4NwMSLYa09tAyuLoOIhy9KJbwYo4HTOymXDmM
	wbwHnqLVvSXxnJmq9G7rzktH32UgZCRimFtsgd4u/jHme4elhLdQ6yHx42jPapex
	XzGMpXWzKGfsMgQ1xpIvDutXPhkAzFyZNwq1fHE19MMAcQDwU8Rq/A6CgVIbl5Hd
	QISFr7uYIJxCzi309EEMxV5zv+eZQDxQfkYRCwL2p1qlDlcpUPuoXGNlLmoVWmFr
	6XyTDKjmrwMBD1wH/uIWhW2xH4qqlJe/hmBLOsR7vY4RgRix1dKhCUM/fntVOG8r
	iLzAdQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqrqds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:07:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35156644c96so2803457eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493642; x=1792098442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkAYEYOJ47Err7LXItBpqjbWE5AbOyqqq/B4n5EVcNk=;
        b=YjihPwfVuhMH5lnbbJkSt/Vq+sWctDqFoP8toH+5Wh8NR2iPM6EBPnw2z44X78Ul/s
         Y6zDZopHDbHFcr1XLVFSW93viqDBJW2lDof4MftNuP8y2tLopJsJyz6b3tSOJ9Ye58e5
         uBXlYL0PHeNqNd+gIxh6yAva7euUmKeXRQpINem5s8q6rrgBvrBgql0+tuRy+lyRrf31
         LTIc5ts8EQcRnumoZAalDWXQbcx38K33GPS90c1ZMZQesKrwxvA81r0kvyLeJROXr0EN
         /dnEMsZRCKPAY4Q1iBT4kV0PaV6gtn/iP3QrRUUv9TrbJaE4/6s7opiWPpbzASrr90xd
         2xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493642; x=1792098442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkAYEYOJ47Err7LXItBpqjbWE5AbOyqqq/B4n5EVcNk=;
        b=DEwhYFpDok/RwmvCT+VhMySH9a79pOJcP6j+FbROhteS1IIbzM5CzKR3StaWlJYRpB
         RzjfWg1C9OAKvsU92gVDhu/1bEIZHZCPYNySBDJwG4D57VablaEMwi0nQ2rfE2YXaPgv
         7J7SkHDkVJNulkNxRQg5M+Z+0buI/RsB3pa7NoMKgKzNSaTsWCD+/tdD/qukXJFvMHFw
         8tV3t7kc1cLmYTfEBqkoCgKeoxB4jG1kyKD6p0xMBboQD7+PbVgQXvMJDVLEan4QC+R4
         YSCgzmvVc/HOLU+vwTH5Dn1H/PEcBTAEVvh4EBnm8hGUeLXTQAZc3YB3kqKj6QlW9iVn
         94qg==
X-Forwarded-Encrypted: i=1; AKwUvBy6J1QIcjtEzAY3NJ9KsuEZENA1PZk40n8uQh4Y9LNF8cv3Xwa6dlj6TWtI/yc6fHLrqLk2bv1YC+pnyXE=@vger.kernel.org
X-Gm-Message-State: AFuF++kcpAHC+TdvI4TmtD7O6yDK9aCCX4ZapDVeGPvaz38l5DYLKPHP
	PTPg42N5/t/MJH8d3NmGywhAc4cbFAAKGhbH6UQPvdqEr0OszPfmjfpq847JMULxoveQkvoXA7m
	7dy5CmRxLbmAX4SN/BQwOH8p/Cze7RQfwTErxhi2lp26falBGHMh5oNrBhFECezeqv8c=
X-Gm-Gg: AYBFou2OoH5S8RRA9PAm4eyyHRpXBV/ieCyoEHUqaq2RBSKdCVj1vHH1QEORjAcsr4V
	wGcz1hgjUuVPtd1G/TOd8wSNjiL5a2cCEOTOOL+jXcN9Dn/eK0tyl4y7/vWtt89qsYUauhC30SF
	2ZEgQ7PZZWIxAbLi1ScVNcb9ktTwWmXPqSH3Xq1LTkudpAntZzVg/gPq/NgIj1jk8MdniHidWFs
	vl9VEnbUnjwpRcg6cggI3ljOxZufF0M8C8Md7z6ybChFwEbi38zLRfgkYzDq/6haDloKZ5UICI/
	Zb6fSlV/w1wBkonokaZ3NuEKqeVI7Zf5Mkzk+9xOaYz2kHl+jQvSkRnPVuTtiSvQyP/FzC+Danx
	peATvSe8ZvhcGxl+JJ6mahvQ=
X-Received: by 2002:a05:7301:29b3:b0:351:77a3:55f1 with SMTP id 5a478bee46e88-3536c593e65mr645343eec.19.1791493642229;
        Thu, 08 Oct 2026 14:07:22 -0700 (PDT)
X-Received: by 2002:a05:7301:29b3:b0:351:77a3:55f1 with SMTP id 5a478bee46e88-3536c593e65mr645284eec.19.1791493641467;
        Thu, 08 Oct 2026 14:07:21 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:20 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 02:36:36 +0530
Subject: [PATCH 2/5] dt-bindings: display/msm: Document Adreno 753 GPU/GMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-gpu1-v1-2-a06a6c57bde7@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493618; l=2602;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=BXsPUKrXl82KNwO286DM3lf5ULQHmjN1Oo3TDDxSoTY=;
 b=pbssSYLdqZgtTBavbt/SJM+8izct9sA/O4Zks5kh75xyOPxEotLYhCEpckT8zrNwuyNHEhkT1
 DGq9WfiwZUoDGWQEaFt4fE9dWDeCA+iSWtwIPyqR8rFrxaNGtMG200v
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX4iZxbGYnV3P6
 aQzLmA4j5J3v6O66maT8u0BjN2vHZiAa/ar0i6KYAXKqUsIKbJ156CmNG5I5t2xEqFq1LP8CYDy
 kqarx8jaYzItQaXxQWcHxMDwH9t5DIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfXylTF1vXEQj9K
 HH8qhGqxx8q6HOqMgB4+9aYEJuj54ZECupLyNG1zfftEuO9qO02FiMbvJ+BF0/LWEvSrk375uln
 yWmBFAs+Ob7aOA4kQCf8chMEFtLVh5WX+TbIhz8ZDr975goeU9iV85KvYhH6BaDhhVzyMHB+97L
 6b9l3QR8hSouczccx2XWT6tzJSTEVS8I3gUNggKDbxDU5guILSQrl3kBnaifnR+8kQ33cFzLsce
 XeGTNwwwmDxe2OnVwjE4ArnSomid51yJnGh/n+LbBoJqxI/fmZatD9wz1hB4BBCLbqjuLU+Ees+
 uThEgKwquWnIi7Hydxq7njsbY1KmKoiTllKKH2Y8KtlDhQimXcYt6/23Szdfi/sHlMrobgmpzfk
 UEc8RDFJKMSRxzmupESvQfsc8CIsAAgTwavEK0LV/TPFCPpi9JBXG5ok+UYK2+2a3YqX0r5aiWF
 5uzlwQ/MakeQh4y2UiA==
X-Proofpoint-GUID: MnR_eSNqlfnqwaSZwsUobPOa9hpKRUI4
X-Proofpoint-ORIG-GUID: MnR_eSNqlfnqwaSZwsUobPOa9hpKRUI4
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8060b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tfb5_1Jyd-QlxhXfLoAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080084

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to the
A7xx Gen3 family. It is very similar to A750 and has the same register
layout.

Document the qcom,adreno-43051701 GPU compatible and add a separate
constraint block for the qcom,adreno-gmu-753.1 GMU describing its
registers and clocks.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 33 ++++++++++++++++++++++
 .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index bc97d0706861..8103973908d9 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -305,6 +305,39 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-753.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index df21e3acee4a..12555530af5d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -453,6 +453,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-43051701
               - qcom,adreno-44010000
               - qcom,adreno-44050001
               - qcom,adreno-44050a01

-- 
2.55.0

