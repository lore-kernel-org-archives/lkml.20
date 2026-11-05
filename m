Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875366;
	b=oCKd/t/E3nhrk+vMlD3YbfRfgpq8DtoQ5tQhIozjMdzLmssJ+TLe3Sinks3n/m4Lk4qj
	 v2jYVnKmBIqztsntP9aqqRZjCVAN+VkwrStJjLWOayyVfeVA44/yhBdFc8eX2FWRWB/yy
	 vN79V6cvHWnKrrMlseHwVcfwBVf7jU77AM2T9tZL1ea86+DGB75LS+FS6cfC/WHvx3enB
	 JoWihn1lBVloiXsWlAKEEth7UDViCmIxIcwJgI3c7Vm6nfdNpZdyhXvx1xEkXGcD0/hm0
	 O1U3G2oktRHVf00Dl0IsTygKXX7XMKf9MiQdwvg84oI1IgZ8eM6pkJtu3iK5zBa3Epg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
	b=tAnJygXKFpxPNr78rl3/D7JufEKNSNILmTLdd0CqyokzE5jkuVfyPaEUKVxKPzQ2u1fh
	 j24Qbzu9pUGpr/y5kNly75GtFpH/diG+jys/A7dkzBGW3+HHfLfuZUIBbvYCqBvsL9M9v
	 glyAUEP2PjRSCjmR/24QeiWrFD99CoOXfdoRBYmgz2kGOAFoCU6OmWat7lWcpaSu8/94H
	 ZqaP9SGYvqi0vbpk+5Bsot5lEjN8NqH5gu0b+KwZovWI8XUgRTISjetdZUErvu46sYo/t
	 h5wUu4c2jxB+EKS2tX+4JnoDbImkWQajrlMrHT0lzmZKaJWARGAL4LJPUiVKQPnrGBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z76WYQ0f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AcbanGyT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6A6606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6A6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z76WYQ0f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AcbanGyT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thVO3532007
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=; b=Z76WYQ0fBdzKMnZ3
	EBZSU9pKtzCZFSskDI10CiRrou9s3Z6q/lP1Ix0YFRvUuSJkxOFB0ZenXrepQUxl
	WiZ31reclFnicFhH1/DzmqlhkA3/+XFw5vz+biznjvCAaLa7PhAsPWkJcQ4YqvtW
	X1iwXDRHLpT/aWq5uGrQRYAsnwXOoToltRVPPMW98LJJv/gpEoG46pe7urtU/uV4
	Jyy7svuk1fJx1popWTYavkFLVKFimLYmmUfp1AsUsIgbAklL6MR72PwbYf7QU8/K
	WSUpptp/Nw5JCyJUmZo7vjkaFrVlr7dfwTxVCnCDmYOCMp/ATTmCqilZt2VekW+e
	+7E4Gg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq96s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:42:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1921585a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793875364; x=1794480164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=AcbanGyTO8uea2hJ4ChGjABtXsFUuoG2Snp8/xDTaqdZ50ho2hBV+ZNKY6ILABr4Hw
         aSAEbyXtA03LX28u5jstp0WIlc6xxdJZkWLwYpkCGT/Svdx84BjcAgFU6+und1Bw/WC/
         0fuR14GF4C1eGMwS6pConu5C5gV6jolnY5NTjVpLyvfqbkYi3Jl0D1klVhjWx3fwMtXI
         00XHHOUZXqEhldSW+lkyCAv6w2w+D1GFB64Qz1RGj+AmoqJnzE8bPpJEJbOsaRZYbE3e
         Tq9pDAZ0ZdkqMcmUF1CecXUbAbQbk5BMuFyRqeQ2oLAzZlfTZ6sj2gd/D5SSy67FLbE7
         4EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875364; x=1794480164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=vnW5jODhCdwBWne+n6OXjqG7p06B0tgaPESE241saEnIvY3Thmy8SKBTwG8eYiByPq
         JWIkrmZyaTmf8j/sByrrAXLzH8r3ScBbWAzFCHgUTePbrNxKVTqPZ/wKOGc+4DMp9ULq
         sowowgg4eO8anpsZFqR0/J782E5CiOSB1bmnsftftiOBKpsYm3oO1ghSilMQnwJ5NfZX
         X/HMf/7Ae8fG5T7jwRpQegPtEOGU6j9Pofj8LHQDcpznURi4KKqdUmjD+liPJVAG4hl8
         9zSm4OZL1gyhzIHgkgNndrtpe+Rz4b2zyT3bcPQzyNH5kVk+N7Wwb+PXybSsrvSrErV9
         OMsg==
X-Forwarded-Encrypted: i=1; AKwUvBxbKoGk5ape70OAM3t/i1BorzOJwPotxZw4rAStEqp2qnGn3qRBkUPtNL6hPgtRLOTKAUKoGoBSAZYtsa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SYgg3q2rRB+sZOjiDZR24nEjCWBwuHodSlLL0r1IKerXjq8Wf
	v6+R8ahQAO2YDLiNZr+7T0odzz80JAY9yXDUiLEwZXtRZ3jatTCeRwaoruOeQKVHrLIkGlFW+pl
	Oe6Y0FWfnfs8zfdsh6tJ7tkYTgiAFKtjAiAOW7fJEQcVCApsNz9lx4ocj7Iw/fMQhWas=
X-Gm-Gg: AYBFou36h0RlWYn0orLpSl+z+QledAQhsl5zrSSz0UoSC2TT+BFczPo4rpKTfz+6DJL
	ov58eSU4RDNoPzSLYcLjLucELv7uwXhuaoGfSAdMguuYp6aZuA4neZ58sPjjWkmVTaqKjDL/pqp
	KLcilVHJdYmZQaGji6HxjxJa66obsHGBCv4OWpsIggZKmTGH5p2D/hKcW26JZN46Rd4TR3Rq7jA
	RojFERfNcFnex5HDfX4BvSHNe1rIBbnNFnACj85yg+fiL/FfX9nhLw5zDhXlnDatWraXUDIlVrk
	fm9FLNYZAfhf7PEC3CuzX6/Lzf6YD8xrshCotgOAfszTcjUdLkwX5v5v9bbtoFM+s5hpPmmdzP7
	/srNHPbiQ6vKGDIe5jNxBdIwZUhBe6yb1z47lxloeypohceB4cOGSLDiHb4qY3hu2MIPkoV8Gnb
	P6vRz/WkNM5Q==
X-Received: by 2002:a17:90b:2549:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3ae89847e94mr14658818a91.46.1793875364181;
        Thu, 05 Nov 2026 02:42:44 -0800 (PST)
X-Received: by 2002:a17:90b:2549:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3ae89847e94mr14658781a91.46.1793875363347;
        Thu, 05 Nov 2026 02:42:43 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm3266934a91.5.2026.11.05.02.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:42:42 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:12:28 +0530
Subject: [PATCH net-next v5 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
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
Message-Id: <20261105-qcom-bam-dmux-vmid-ext-v5-1-5c7903385b4b@oss.qualcomm.com>
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
In-Reply-To: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793875351; l=2657;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wycrMmj1886KQq8u+EMdY4E91b1IT2gBezsXLoyMxGA=;
 b=++srHVGYAxsuO8yRzG17Spf6XaKyDo1uiCMYn50ssudGPTYszu4ot+UelVTn8sKq+HlijIzHC
 mwZMxar2BKND5RA3RABcE3kd4/L3OOp8Ov3BJlM/DaqlZzMNjWLnhuu
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfXxml7y4IxlDcd
 wfQxJ1EGByvZa6ifEDsyk5kn7/VjYQk4Td49ELi7uzRjT4euQlu8ux0Nl64eiG2zDroKnmBY86o
 SgK+1x25HuN4kPkUdS+0V9hzO0hFZaIAOt3oFhBqhozdJIgrTJXAbOZUHe6HnDFagSjUSMNCEsC
 Yz2r3UsF1/vC79mdWx0dAkVux4W/Q2mcRK5VVsuVlCYQ0CRbR1FsfYaU4ICxUmBwYtF2S3eq+Dm
 hrlHObNlkyKXKhbAj7Bl467UAv2/vsYOXiW6Y2FHujmlguCctdEWivcL19POupATF7MsxifUbGm
 gFqm+Xqa/94ru9C7pJ+xU+Z3DJNtjglpw9HeIXcqVhhEj74/xxpd6rG1wNie+p4vEdGrCIUtsoP
 e5oni9I96G3T7/HRQj9/TK1793Bme+N49otYaXxMsfKAIShSD3AT1uQMNzMG0SgJOurCutsOojp
 xhuheQ2GbVTjneASnRQ==
X-Proofpoint-ORIG-GUID: 35MoTcD60RZeX3PBP-8QugdHro1R0_YR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX28/AyAwKeTh0
 02YvoxTFRrNr/XnMeX4Cca9xCg+gCNMWzmcVOuOLApX9RfSdf79EMoLXfwWiowABtY1CWt3qgCe
 WoULYhO2IcTvYP9N4DqB4LAmjrbEnkg=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec5da5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 35MoTcD60RZeX3PBP-8QugdHro1R0_YR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050042

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Add the qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
and require both properties for it.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..f7388d24c8612b5a99d5d0e66cfbe2de3b1c9e0d 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -22,7 +22,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,bam-dmux
+    oneOf:
+      - const: qcom,bam-dmux
+      - items:
+          - const: qcom,shikra-bam-dmux
+          - const: qcom,bam-dmux
 
   interrupts:
     description:
@@ -72,6 +76,22 @@ properties:
       - const: tx
       - const: rx
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM-DMUX device uses the pool for DMA mappings.
+
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM.
+
 required:
   - compatible
   - interrupts
@@ -81,6 +101,20 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-bam-dmux
+    then:
+      required:
+        - memory-region
+        - qcom,vmid
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

