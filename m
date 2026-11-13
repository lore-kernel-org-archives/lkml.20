Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572669;
	b=V5SfcCwRWF31A9MKUGuafNrHZ2qkbyUhnMk6BQ/rx6zXkS9yvYA0kDqCMCb7e/aqfsmm
	 OSi5ENvtr4wi+u+MADgctHMbL+sQVSCAGs2pHhX/nYv0DDMpcFblIeU3btPhMwjCWIRMu
	 kQUquF1MHz/MSQExeCcBSnljw+6Mi4oHtcvbmomMc5iosvhR+zEiCU//BFyXAZsxEeJ+g
	 VRzUJiy9uIQ9DcArzMsxusdlWR0ZYD6XuTO4szryNL0wKzjfKQtjJ//AzmB8mlXOcbQeb
	 md/1WHXjVZ5jRqF4PUnFXr7MjMLEweZjMcV3F86RX6hMwIWDWT3x75F3LRnfv8f+vnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
	b=SYHono2mMlxtC3ChdaG/2ehHb2jjNRtT/acnV2gIagkFBF8N5cSRSDptB5YOm3W0qDZu
	 FIVtJYLUe/gM1TrHW/ZEeDDffn0g51eZySVhkgesGGZO0WjAmy7bAig6y9+4NzZRUmMXp
	 gAYvGEt/KuYKl9gUF98pEKUakyesFSuzmlmKDIP+pcRc42ZOLa4SbJBBUpzeW0kKe7/vg
	 Avg/zlU8V7VmtGBgg9iEROQAeYkNySpTtSwTvsgoQG3j/2l3wHLGiuWOcmhaSzPIKxBwE
	 lgwdIGLagojo0KE+9BfwxdlMlP4tFspOjOLaPow20FAGFWxJAxaq7Ck0jx0E7hOHI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3411E60A3823
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3411E60A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyQkST7o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gzYttcDx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJTUp033897
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=; b=YyQkST7oKc2WT7Pj
	TZoWHWDmlAPaolZcs8yXyqWEYxIkeQx9qbwqhrlAgc4qXogj28cEWjcUT6i8GqoD
	jcpzatO9oCm7ZO9DDVf+Ezti6kjvyHKKLVyUv8qo7KVbxy6Mp3OxGlAYyMSS7h1k
	qzdStdJkcbf1KGWhpPqgKON38xqaEpxzwuEt2EjBiScoNMuqebhjpiEbDVUTYIE5
	v2neLr64JhebMzs0wKepJGPWXnIadC5TR7rBgD9u+2S365F9va86t1TvuDQ5BPJ1
	1qadSl3jpiOZq7qDcHwz24v5LnT00m5i5J2OmWBbzJ79m3DYEEuYgIQ1o4qhb/Me
	KAAXMQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9b3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:24:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso366739a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572667; x=1795177467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=gzYttcDxpcpUg49YzOiBplA8oG+Or+4U5zT72aGuG/wxcKCz+bRtiBvyly60VBovCt
         TjKa1nQ2Abx2ltQ2/J8ZyVTmYheiP8UFXV/u9yt6fZ+qmP0Wgu+G9sjsDusctQh9MFjh
         nZmzAhQF1UTT/GSW2iYUIsGxOEWREcR9hLM1k+t9UefnT2Vui6uR5e9L3B+7ngJZeCg5
         /tvBBNX0Fkf01tsRWpjLbCZX3vSl+ypqGeLHGyvKtdXFFh1u4E/Yibbm3KBRnZetYI5U
         JCFjOGl6TD0GYTGdOSlDz4rbyoIRDtzqizWE95r9GOakwzDlvifXIw7nGT3nMvMksN31
         Mpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572667; x=1795177467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/scdRl794sOjK34mRJAzq/iqnQfL+PQ2xCrXzi/N0k=;
        b=DfdA6TdD4n9n27oQN2B7GzOqHKb/5gOphKeb+dkEclBMKLcEi/z0Rl3XMl+IbLppPp
         L0nlKe/7iKOH0V/vjyVC8rgHE293XSGOhhF1xifbqJ/uP4M4t6QKj5f7zA469maXL+8B
         CICbWNyQ3aHgGsrYVOOOgQzgLHKckKsNaYt7jPv5BUBsG8q6JvmWBzWczg9C1misX+pq
         c7TVVEkxJqi8pI//cPGZcu+H5Qyq935PfquNpaFKSqimKUEuXBUd0qQ2dIFv+oS7sGC9
         OP2IS9f36WblDAJ4pIqTX+EmVSS+vsC0dtywxsrXndXFfoWlBrAZ3djtiyVXPVHXXJ9f
         CFxw==
X-Forwarded-Encrypted: i=1; AL+hErFpUGxKXaiEbGKoTpRgKhvEstQnPO/4JibyU2Kc2so3splLePGG2k+FDScDj5P5AwTdB1dwLiZOTa9Hn+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+td1IFE+qR5jZRUiHAmvXrQtfQtzj4R+itpfYYFPVGBA6LlWHv
	egc7EXb4tJDQqZhQMFIlbQfcDxc4CN+ZXG7TtcfUYJTQ5Zty2IaH+KtkXrHhGvMJTKgHlwYO8Cp
	NouY+3uba1jjXL8rXfCkhdkd2CoC3/ikHgpI6oV8kukev/2/n7oEuNDVudrHbOQUtNjix+v9DMJ
	J3jQ==
X-Gm-Gg: AYBFou05arkcmAw7clIHViXZQU1FFAR78+RjFSjRA1oBsZFWlBNsjFH7SizP2XtUdV/
	uOB2auSVwCMHVnp04ffQdM6XMcuaQ4YfupFjWOBOHObjSvkVh3H9lk2/Qj840qycRcp9dp2Qyk+
	5H01aiwTG8K6CiPYv/d67U1PpA1dm4WcgSkBK9AaV99fOv2A3tLHWNw7Fok3bUcSZWmxNP/uKSB
	CjyuahKXYpls5T+tAlnJnMgfRIWmBPtUc9CE3cGDxdU0DMBNf2/TUQp2tD7B/K3wqY13SbeFlOL
	s8/3+SgXi8arLjmJciottf/8hjshs9P5gUemJmUrUXT1KQUwZojhoOU5anO7+MNb7LwE7ULUJIA
	tFrKYH82xP6UT7K2KhcoLxA0z8b316vOKSRgH1jjRI6uoiQq90XQsv/XB9c4rkjzxbeY8VP7DbW
	+pk5HCMZYoxw==
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200508637.24.1794572666801;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
X-Received: by 2002:a05:6a20:be8f:b0:3e2:9025:5c50 with SMTP id adf61e73a8af0-3f7a72ba21cmr2200484637.24.1794572666380;
        Fri, 13 Nov 2026 04:24:26 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:25 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:54:12 +0530
Subject: [PATCH RFC 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Allow 2 IOMMUs for Nord
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
Message-Id: <20261113-nord_embedded_el2-v1-1-48f717e97066@oss.qualcomm.com>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
In-Reply-To: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: w5meuyGHygp9wFTzOQt9_7rKM9asmImO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX96pUHjZYM9BR
 xnjLXoFC/lnmyHJop/gO3l+0XRdnD+j2ES8HJuxv+Kn81z9uO9vDe6j1LJ6vuqjszPSLDW6QLWU
 z6njWu2KvbCNpFBuxdjr6ipNGf6M0tk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX7gXyxrul7gmD
 1+9Yu5Nu7gdEwBt/dpjDvD2vMh8zMOB+xmQU2KEbNK7CkbyN3aC0K5dsBjtyxZm2coXFow0pd7M
 WTJvO5nG8gyy7hBeY+jlvBUZJJuu4Z+AFbxPW8SSUOzZYdlvHsrh8DlTEGU6sfQACLC8yLSlSYt
 1Ah5S5jd3/0/MOIcjSqdggNz7fFuxg2f90VlsycJtX7rAN4TY2HWp5me7OKhhU6xE38311FGtxz
 4FGfGFIlI/JUSmehq+14TEJ4T1fluUHpwCkLH8DqrxHG56fNGQ25hLQVCEWzEbOO2+YmT60LV8c
 YVESzFfONB0aJN9zZWLRgSet+KInkPlK2DKnVm2/J+yY2AM5m7KIPKWk+NO++MHZrf65I4jg+/a
 y+/B3Q5nIP+M6dIo+Uh7RLraW+oZNYiKoxYuaOo97RvTWgTZz3KDgaZk/h83RoA9sfoTAgUlvKz
 xnXvt6aY3Lw6UR/9noQ==
X-Proofpoint-ORIG-GUID: w5meuyGHygp9wFTzOQt9_7rKM9asmImO
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af7017b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=K8mYBIOISTU-6_9uHSoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130048

Nord SoCCP needs two IOMMU streams when Linux boots at EL2, but the
iommus limit of one inherited from qcom,pas-common.yaml rejects that.

Drop the pas-common reference, describe the properties locally and allow
two iommus entries for Nord SoCCP and one for the other compatibles.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index c1911124e073..405291c769cb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -55,6 +55,10 @@ properties:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
+  iommus:
+    minItems: 1
+    maxItems: 2
+
   memory-region:
     minItems: 1
     items:
@@ -87,15 +91,27 @@ properties:
     minItems: 2
     description: The names of the state bits used for SMP2P output
 
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the SoCCP.
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
   - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
   - power-domains
   - power-domain-names
 
 allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
   - if:
       properties:
         compatible:
@@ -111,6 +127,9 @@ allOf:
       properties:
         firmware-name:
           minItems: 2
+        # Only Nord SoCCP needs a second stream (see top-level iommus)
+        iommus:
+          maxItems: 1
         memory-region:
           minItems: 2
 

-- 
2.43.0

