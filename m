Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7825B206
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430130; cv=none; b=lKaAhrCh8u5sGOKX8rH3DL0RvpPz3ByDwInhZboBWSTbHjEnCGJK92jkBG3cq+LorMVjgf1CuodQMOH7D84+pczjysISTHRUwxcnLh4kfvdwzVKP8cU+/nHt9ZiU5OjIe0PP5ltR9DMTVsvOi1GlUceVjrdqU0EueQjbZp0TXMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430130; c=relaxed/simple;
	bh=KK656IR0L/qDoa9cvBPbElzGR6ihtiMSgVhGCtT9uo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWfDDRneF/I4JXYsyPrtj2B1tIIqQykXqVi1fIBOTRlJ26aqHT2z+R7k6OZ2GoW7OmQUA1mCEzU4pv639SnZmjxnSSY/Cc0yZyN7q9Jt9dwOipSHjK2Dj8AHEC38Ia26ns9c+agzl/4NWESSanuEgRpkSJdsEniWZb5AtvzlzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZUPGItB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qcp1J09W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZUPGItB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qcp1J09W"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hXuS2575092
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 03:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=; b=FZUPGItBETjdAzRL
	B5pYQ0wdEFStWX658zzZwawaBvk8UQqPRLzn1gdXOjsQH+Y6RpJxIhfx+RXHVq1S
	Q8ujP9tKCD29Y8tfRQ7XwoeDMimSkOxCFvbWDg+KXralawm13fxaeCxcNNHSw9k7
	/Z6LCq8fKQ8j4lFpSIuWBiqS5YkX4KH1bgvPDfB/R46dF5oyICNfUwFv4LT9s00U
	SWpcuQ4WJGRkkvp3Jsg/GXA+7qoYWD7sHuz1GCHfSvmoJQddbQ2XejRgc9d+cBQJ
	HtCHi+RpC1dlf1QcSwoy0HvQQpIs4xnDcqfa2HiooqNTqSNY1JAe4CJ9rBBFrEeY
	yTWnog==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg8fph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:28:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef0362d95so8988439eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430127; x=1792034927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=;
        b=Qcp1J09WjIdIYKS57UpRFLNradcofhfk9rsxIWyG8OBqyRhS3bBRSF1TV43LUoSdb4
         xjR8rwMpPAjOjNTlxNXtR1V52ntaeCbj/AsvxqLW8nVezb0TJSV6DbjXJ0BAMjF/KLsB
         au+pUrojN3uVPZvAUDCDx/RVc0Ys1DShykjnHEAoD7BM4fQBbOVICwt6WYl2YfWDQhuS
         KA+t+9+i7M4sAXpdfBZyfA5crO0plXewsHoOh+bqf8Qk9E8Ki42zHeDYwQomPHawxr8P
         Ih7J1nrY5Nrg6VGuxnTbsMiJKAXbna+7zwQg1amxIEb7ESke6WWXDE9AIf68+v7aD97b
         Kz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430127; x=1792034927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=;
        b=ZEOIfrv6b4yhh8qqnBthYJknBZcdFtrG46zVcJ2J2Hp0BSj4BNXIayVGQ+7WHf4CP7
         yTvLBMuMFMFKcQoZXcyOWNcsFJzqoaQiJ2W1BEZKjnF+TC8HC4QNfPg3eYSZBf4+qL2m
         nY0ifmOe4Bp168ObEzx23PTo6sjTem5pWlVHKLLm9uee2TmfB1HB1iYfZs18wjgcsddN
         6kc1VggySg8bpWq61YObYhz4GmlKD/+DCV238qabrxdVDEvEXaCjmqprZGL49QWNqUz+
         WdjSuC3U58EVj5PRdfQ63By3uWtVxxv9EfWL+uhq/d1Gd2AvDwyN/2M1IAG0XhWuwPLj
         bJdg==
X-Forwarded-Encrypted: i=1; AKwUvBwwZ9tIDZII11VGyEmfm79vlUMLHOvgO1RtOC7C0IGdrTZc/2UTX5jdoVxu3OGwC8KgPdDbGUHiS1gSROs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2Sl+L6tasgQns0q/M6odiiNvWt1fTsYP+TNutx3DiRHkLEPPg
	9CUxDQsH/Omei4MnFjCBXPK79e5jSkO/ghbT6bhbaVSFaaQxWyG/oFInrRwh2HjGsovRtB0U1P3
	uPeinZA+QT56dn4rHMfdBU3Ugx5RUjzbRn1cTN+XEV4Q95FldPX9XzTyqdF9Yr2n8gQ==
X-Gm-Gg: AYBFou0PA3AWLCl3sY9aeVfxVpf/ji35sMtnSTSe+YffwPwKy08Ih2v2xvxqtjodRwN
	GNCtxpnPoBTfUe1hVpDv5irVs2s4IG7MBlA21TNd4KSs+ZS9ZWKfgiwowxCmh8rQMw0QOWi5jZl
	g+9h4/G/zWbu0dCFLwAErPUSj2+37R4etMyu4F+FPNx52GQuiUkG1hwpzm7MoQn6cMW6QdWsRjr
	NUlfeqGW6d848H138Vn1hh4oySPSn9XB3Na1X4rpD/Aa/VcFHKy6XywH6NpHuvTRN1hJQbRE0kt
	ombvZwAhtAbsuAlSuP4hZkH7v+bEoayLGSNOlvO2G09iImxtIA/6nY3KPkJGyWJvLfgt7MdpjpX
	1LVdaxxdKx4JMevf45Iv2YoqI/Ho1yVd0BGu8eAmR52C/9x2mwl3Y9cStug==
X-Received: by 2002:a05:693c:894d:20b0:34c:3ae5:c280 with SMTP id 5a478bee46e88-3515dd030edmr4864983eec.10.1791430127166;
        Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
X-Received: by 2002:a05:693c:894d:20b0:34c:3ae5:c280 with SMTP id 5a478bee46e88-3515dd030edmr4864931eec.10.1791430126393;
        Wed, 07 Oct 2026 20:28:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:45 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:10 -0700
Subject: [PATCH RFC v2 04/10] dt-bindings: firmware: add RISC-V RPMI TEE
 transport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-4-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: U-3q7D7oHwseuO-3N6bunc4CYnITpPnD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX1OAncc4KHyWC
 vORW2lYjapYv1MqxfI6Pq/B3p/eeG8iNdYy4hWroyfs3pxUHmTYuJrE66Nu3eFLH77wW9mrhCLu
 0R0klwMgZNPQktKdoCkQtikh+mEA+Kk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX0cD0Lin6L+PP
 9I6gqbbhKWUq+uH2RhxgefAd5G0baq7TSUCY/Gxgqv32aNHXFH258OFtquEjkCOnfw9G+HhYQP6
 CdLfg3/sL8UTRxYlLCxLZtauw0qCYmcLnUJslrIqC/AfqrZKZqU/MeatpyFwzP3wp+zroO2K3cs
 DeYQhd3IhbC5G89alklUlCtLHLHHj5CXfZLQ1XPC7xVAIpugN4qfbksE6s27Z4OXB0SM97oiU1I
 uU2vjY8H/clW3NKDGmwe/U4Pj6V0C5I5z5frw1loSsiVpTuaoB3xoBzQtUltiBMBbQ8QXj7CxuA
 7jWbJMVislEdF2RHySORKM3Ks+RW3L/hFBmhPhOtj1vICqII73A+Np5tNMY9BwyRQGez7GJbgmn
 x8gHb/sJz0QsNJG/7aub0TTRHejGYQlLtiSa4ix+0ZCPhz/9QaBRVrvNnUoqlo2l8sryOfcQzzi
 LiC4h7XgcJUzGmHvUsg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac70df0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=X9k_jdDNchH65YliorYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: U-3q7D7oHwseuO-3N6bunc4CYnITpPnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Add a binding for the RPMI TEE service group carried over an SBI MPXY
mailbox channel. The transport uses this channel to discover TEE
endpoints and their services.

Require a single mailbox reference. Notification interrupt information
is obtained from firmware through TEE_PROBE_FEATURES rather than an
interrupt property in the TEE transport node.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/firmware/riscv,rpmi-tee.yaml          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
new file mode 100644
index 000000000000..b7bbe8893e56
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/riscv,rpmi-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI TEE service group transport
+
+maintainers:
+  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
+
+description: |
+  The RISC-V Platform Management Interface TEE service group is carried over
+  an SBI MPXY RPMI mailbox channel. The transport discovers TEE services and
+  creates child devices for their endpoint and UUID pairs.
+
+properties:
+  compatible:
+    const: riscv,rpmi-tee
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmi-tee {
+        compatible = "riscv,rpmi-tee";
+        mboxes = <&mpxy_mbox 0x3000 0x0>;
+    };

-- 
2.34.1

