Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF7448BD29
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846915; cv=none; b=YS3DezhH7kbBqMqzigFLqOjVyLQzk5C9t/FTUQi6GPuuK/H36f/vuMA8OG1MUZzzbHKOCiVohK2iT0s5rAbA/hRDjmSQnV6+h5zzOpWEr0VFJQFja+FLSd6890BWlBv1cuehF2VxXoxNcco45WeyAHaqlewKiuy++2m2h4nAyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846915; c=relaxed/simple;
	bh=Ro1Tw7bimijLX+zSbVZzcIcnTuF4NWioN9yBfIv7fvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7b+11/ryVncGVgjo4sbBVpNPfVLgcH7JcahvdvpRafzoDlCrvJrQ7JJLe7WdFsvF/33UVuiFYYdiXOcE69LtPW/KZMiz/+Hh+2dz76zcvP9PgG22yThJOgC+dp/wI1BuJPUKP2X9QTTR3R+ycPqpUK2fbXeQTdDCOBJ0gQPWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2BXcxZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGVbwW77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2BXcxZ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGVbwW77"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFcmxJ359178
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=szEkNwgY771
	Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=; b=c2BXcxZ5dH6V7p/j2Ymmx/kbwuk
	5ypm5J+Gy/Xe/Rzmh16ripn5C4xaaNvcWhKVxilUrwSyL8ZaX1EONIWOJxKjHI6C
	9r8+zMkdIft7vyYF67XPAqAb/fze38RxCGxangfO7+n4KFZc/us+ZyuwC1j8Pr3q
	nXuWhE9t3ykQ9oKvWijc/LsP+z+xEZF0jnxEn6d6IoUsbP/bqvHFOuCzr7iOGEzf
	VCs/kF+aS58KXOsQVJPfBiAwXVM6ag2XRg296GLNCNw+hk8XAYYcFSzNfjV+8JVZ
	KwOz7DPYZ1w7iq4y7PTnCS311Urm9TKF4Q9jj4hYpivdxTMopVBqWIF3hQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr68r1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:08:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso122469a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846911; x=1788451711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szEkNwgY771Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=;
        b=KGVbwW77Rzan9Z3Mih582giN4wv0ZFRi0j9yXemCvfqWrD5Tb/6cKsbyLDVholvC2I
         tZuBtfN8lDvN2hXhOXJiPtJBNmVlb0v0P4hKl85Sg508FDQYBQrzu6dqVn8giK9hiBKE
         h0znI+S/YUy00THiPfJIK9CMXwcZkpuhcTB2kRMZA/KdeCUQm8XQGOTflYbaai/SnYRg
         cCkWEn9mHJK5RQOXaSqh8KqTIJRAy0ooGFrvC8vRNcXzgj1rAFZ6C0P7oFdGRVVo51//
         bNRMOL0ny0cLHIO8CHWVJL9bRu7gE831CNRCmV99smR8L8vSnO3A03gp0tWcX2ev3gYm
         wyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846911; x=1788451711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szEkNwgY771Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=;
        b=KPkcEQdq3dfAz3yurNNLareh133MuScaywsrH7D5Cu/2fU3nrnNmaERjB5Ub1hkKjD
         gVrm9sYOwZcxcKq+Ay1OEOiTXTTmThRbGZJZoljh3C7euJCwhl0Fk8Ct9iyEMnZjFu2Q
         4GyMif4rH8wNBiuAKOPGBFjbgHEY7QC1bAKPDhgcc1ruf1JY1+GNyKZldDwiFF8/+K4S
         6lQk1c5BlCrw9VtsJXFj11y8uo1+QsDU7TX9EwJv6Kv3vZQOa9Xwa2r43gT8dH9e8N9E
         bpay5XTAW6zcOhoteZwawWN6W8h4gzVjKGhEB+tveOAmGoJPvXN9Hzff6uj1lYtnfFV5
         sUEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQE83DHb/Qv+p8ay9SIfjmxMBo+Gu8dhA+IB/PlcP0A/YBgDR4tvPUgCMMj2qHe5qTMEwhHWwkx87x2DY=@vger.kernel.org
X-Gm-Message-State: AFuF++lqZ3ALC92/RAtsweIIe4RlIj3abS6JF/WsKEhDDvj1lRsl3W7H
	0kE0I9JGw7qC7JmCHFUHFGNwYshH3rLEmvkE97Kelzttv7fllYT6skMiwRvVzhHrNmf//KAILke
	OFr2912Xp+lQIYGd1uB0PobsYwRWODd1mBC490Wgyq4U3jy40RTXKiyQM3K63LYL9SDc=
X-Gm-Gg: AR+sD11GCepab9whibOpmXlWUVncvKJEzTYhiZLiCLICoSet3A+vaAdwlftwLGu6xxn
	ZjpNIF3hZdpuH6ryEyowPLyEYNwxsxZ8V7trms2w1NEF+4IG6iIi45RtN1/JSDaqFEShvB2O01Q
	6gSPKVv8dipS8/+UQOs1mD/fxCJIOZy3D6he1+taINeKM0k8skxsUhKAkOtfcOkb17xJ+oH5n4g
	ohP42armYlrQvkFUHz8RO6EyC4Le0CG4F3r8BJLWpYuVFoSvC9LeO9Qc78OPDxAZD/3nCRL7qeg
	o6gGOxsPJHPOt4EBzYVUteuDC6woF3iLzEGlpnopivIw3iF7T4K2cScFK/7ouYlXxln14GRDugB
	Pj6jRdZ35RzJkQ4GWLiMxW/UODUkcuVfh5jl7K3blZV0k2uW6MPwfDjehxBk=
X-Received: by 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr634861a91.1.1787846910209;
        Thu, 27 Aug 2026 09:08:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr634645a91.1.1787846909524;
        Thu, 27 Aug 2026 09:08:29 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:29 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/11] dt-bindings: soc: qcom: add binding for qcom,crypto-virt
Date: Thu, 27 Aug 2026 09:07:13 -0700
Message-ID: <20260827160806.1295313-5-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX3l13Mdy7o75V
 BUksQPO/PTiG5pfLiEk7gVqyeSxL4Ru946BrSLHXQnwwOqUMiFlCWyizUIgmO73z3AUmYb/WHDA
 rYWtVnUQAIEwrwCyls4Dmi/MCaUsZwqUiVYqQl/+ZzbO/W5+5VhnZ1s2RkTD/J3sNvVDyMdjBsG
 Cm0zm+PMIiZFp0ichHZapYMjqtlics2aP2Q4E0K7H6d8w3j7t7pNS8RPF4Le17pmjbWXTOEBsct
 aQ1uqapw1M0ccKrexBtupqOGSPCUbuoJxAC0rywqTEdYd9UMTZQsPnI6c5mKDWCcojFS30vPAW4
 4bwRXbD/jZJ4QfHp6a0vnB+aDf3uz6WuvBAsODH9LFVJA59I7/6EQplNzqLwH/RfHiU9cViAVrg
 ng+DRtPz4K+ft1Rn4ZLbRo8R7aYIVfFgzcEUcBKgUxzK1Wuib4snrQVBOuf7/mjaujCYTOjVUC9
 gstapXsFmUztftOxdkA==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a9060ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=S71HXAmslS2k5ljwlz8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Zf-9dRdEnv26F8hkUqwkNXRJuh_DGwej
X-Proofpoint-ORIG-GUID: Zf-9dRdEnv26F8hkUqwkNXRJuh_DGwej
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX8Rkff7QjP1zN
 MICOelgGMaCoDSB0MgtdxmSMOa6IZ7DvzbJoF4Wii1ajYrk6R36oEVDW2tXIYd5TsDjWySiuDPK
 9AYsW7nnSmnx8JNoKdu3bL5TgD1iWNU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

Document the device tree binding for the Qualcomm GVM crypto-virt node,
which provides the wrapped-key buffer size needed by the QCOM_CRYPTO_VIRT
driver to perform hardware-wrapped-key SCM operations backing virtio_blk's
inline crypto layer.

The host does not report this size over virtio, so it is supplied via DT
through the optional qcom,wrapped-key-size property.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,crypto-virt.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
new file mode 100644
index 000000000000..5eb204f29762
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,crypto-virt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QCOM GVM Crypto Virt driver
+
+description: |
+  GVM-side hardware-wrapped-key SCM operations backing virtio_blk's inline
+  crypto layer. The host does not report a wrapped key size over virtio, so
+  it is provided here instead.
+
+maintainers:
+  - Linlin Zhang <linlin.zhang@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,crypto-virt
+
+  qcom,wrapped-key-size:
+    description: |
+      Size, in bytes, of the hardware-wrapped key generated/prepared/imported
+      via SCM calls.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    maximum: 128
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto_virt {
+        compatible = "qcom,crypto-virt";
+        qcom,wrapped-key-size = <100>;
+    };
-- 
2.34.1

