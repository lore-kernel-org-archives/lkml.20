Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C8D4252A8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378846; cv=none; b=cUz/JKz3JEK4M0X8DTzU3f57v1CJD2Syas3cI0QnYUNFlKG0IFbYPnSRtaaLxoDi37WDlltWxsL/UhhJVmIpXMUY315KW+IByXwZDhSbI9Y2vwexecdcv3mc9/lTHKvDqJ5zZkUSLm6MvX7t1l3dNEvs5xAumbnJyXYRUwZ0cbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378846; c=relaxed/simple;
	bh=/QMjM8kIgdElOSlo+HE58P/0O+m2y0r6yoGjhktem2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hv9DvtIBrdsqQk3espGTw71vIRV1xZxvm3GoeQDPipwODVxs8MlDY6uglJzG2d7EJieY8qpsz/OjpXX+ZmhtNkoENImshMLvCpbPb54hkMuniIxleBUqr2E9A+XcB5n0pbAcnLkMb1nWbLflk9Z9J5e+4RzicdlGy+fv6RHNCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOzJuVlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0cC/M+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOzJuVlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0cC/M+M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jUbc3740843
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=; b=IOzJuVlXZwQi7EQx
	u3HlG79Z5W8Y2MZkriR6SxnBX7PotKni36qWMwYPLal62jZguM+M+gzPLGI8D+hU
	eg6QnTaGq3P6ntTOMcki41FXQ719ph54t7T2/C2UMxxQx0shE5TASJv2ImSZrkLG
	ko2BjoJNR89p6lZTfFKfmBVP4Jd1oZA8b82SM0nH1A5+Lo9+mVMXqqUaFWDRWkKx
	A7qJVJa3tmXjq+7YDHBo21Rc1mZD7aVsfTC7ATleaOuer+PH57sHetaMDfeE1H08
	SZLKvQSLjZhrcy5X1F0Vx9NmVrxdjlGApvuBHeo0J4ITDSr75aCCLk/B8sjL/L+4
	dOz+vg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddyx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7864160a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378842; x=1789983642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=S0cC/M+M96Y6RxJ3Yjnl0b6pIdEpNsMSp1YZawZ4sbIPsQ9+22IgImi4B+qoBBCmuM
         mJ2h18gKkUzJHYCekHRaFo4OyfkGrty5D7R/2m/SJRiyMub3dzyouDHX1wZZ3jEER/0e
         p5rGSuqIBJukbtCYQ+Lribz2diU29+YwPoA3oM0knGFpBsRhjO6GZ4OPqFl/9AUeyvXw
         do68jYITnmpTn0bl2HXacp423zdfUWMneZRJB/RrT7wpA0qxQqLmGPSql3U9/Qri1twH
         nYuUpvEGQg1Zt4IeFJEXQhQzhhOB5ZS84GwJIBGR3lpY7FvfPweYv3NRUlRri92SSLM0
         +9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378842; x=1789983642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=QLjFfrp9JrlE5l+cTIrnQwYbkWGYyo3QkK6zpgZS+ZhSJtM9nRQ2wN4/z6POLivDTj
         Qgww4VtQ8c8Z/pdC2inmtep7evOAdLnVN7a/xv5vwuEMvur7a0NXHD0arIPiRovws8hW
         qQBFFD/ZYkf7WkrdHJNXpafyEUTKdbvc3L0wS1bf4/rePB8XM3pF961EigIRB7POZhu+
         OsvNPU0S+Mm/nsFu5jecVuUirXXqteyWhAFwo1MEUBNUVJ6P5Setc39dNyEaetbuJy8E
         4yikcBZ+157uCVg48RF0+7t5ajJknr+jYteBUNg+zfBH7iJotACUXCGUJQjIXLFNyCb7
         eMDg==
X-Forwarded-Encrypted: i=1; AKwUvBy0zt6ax9U4Ucf0GNFNEdkH/Vxw9jVhe0OcNVLzTqv3h3f3KTN4LI53J/77N6HQoQ3dAvHVnBdPXp+7E9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mTEUxCOL7txkXzbyDJjztmtibMqnIbo3GEvrCNaE4SkrEmAM4s
	Zqhcg47eA0xJXOyJ7AHP6gyhwXPMBr0Z1r0Oj5dH6phFaz/YfOXpnzX48+4Zk6fuyzkNLK6olQS
	zwxggAo75BhEQoBKm78fcsaj2qEVJnjfBElDl3cWtGgJZPXrWuwy0Iy9ZrY6350L0TKQ=
X-Gm-Gg: AYBFou1Lw+j5tgWhWw0EQJ3YCRiqVs+nNQ4MxGqyhehoDkxgA81t+wr/CzSiEWREit/
	q90MWs/pAC1By9guM2998MNX8W7LgVhebh6MX81qEBTAsjZ3OLXRcyBvpgvd9PopQaCW346lTVR
	TNw27ZHS9pTc2lcco5vV4qdZMe4kWVuatE9GT44GrDyjAIEke/XaKDu0+R4+68KQ//WdGZCr1Fi
	vE+IlULUP/DxjpkSzA64AQfQJAeUbRCL9rdZ8eZ0DipSh0ZahZthuoFCoWK/w0o5PC6n4+UkY7q
	kZTUfGcm3lP7uXguqsvlRe5Ak+lPTiq/Qxx8rB0kqZwFVeH/iym5qlW72L+OxQ/arvh97p3id1o
	ub9tm6ZF2xQYAxe3HQpEJHydphaiLSb+K5+wNU7xyoBTmIrxNhCm5YnEw
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr799670a91.15.1789378842259;
        Mon, 14 Sep 2026 02:40:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr799596a91.15.1789378841750;
        Mon, 14 Sep 2026 02:40:41 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:41 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:56 +0800
Subject: [PATCH RFC v2 08/10] dt-bindings: arm: Fix MPAM MSC binding schema
 and examples
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-8-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378766; l=5185;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=/QMjM8kIgdElOSlo+HE58P/0O+m2y0r6yoGjhktem2E=;
 b=8GP+/eE1ihxpjc1D5+JwaI40o3SddpMHij/oEBZPzRJi9AlEFwTF+xGKazd6CtDo2ECYdzsxk
 ayDwgtPlrNbByU4vyLNxTZ4wfQRSS3cI/irRbXp9iHYlbYInj/lLwdR
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX98xtJpbr8CiB
 aTYH4TfxJudm1C3VlSmWpZVeiCbgC2+Hqkrau1i89kB214l3RTX0nYa/wEj47tKlddmkNUYh1bL
 SbrxWxluV0OxX3NQYVaQfsImbY2Nz40OXWZ1MNS09VKsm1+XQJAsyf+Q9bJM7Q3gcX+2Jnu6pr/
 OGErBJSRNGH+h3wF/d5uNhVPO8NgNNcujtlgKKsXuNMcXRYROmZXj0XznNkHO8NdyvaqAst1Yph
 qLXV8lxNE6TE95ksMUrRGm+NX1g+YUNJ17r5dONnTGpRsA0Qd11o2V/K8FNabEuj7t5jSdTvo16
 3Ba2HK08Gujf9Ip8MNH30aUr/vM01NS6qMghUE5pf9vX+Hdh456ofctTW0D2L6Iqs84SxlDWRzX
 vBPWLzNrJLpgTpllVjTC7Y3/2l9NzCy2A6DECxcjahIjNJNdKaOMwlgA6AtWGQXzWOGg/Pr5c7X
 7BH3mETCfVwrlfLFUVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX9pL8YEbwjHLo
 cCWxs3bt4/a6kaeYViT2kjVf2aVPt3I5167QLvGcnPHAAR0/ysCFTY9On5HxFVHy/pEKea+B3lE
 QAY0x4jO7MUDNkjpMZIzEDQ1g09qOyI=
X-Proofpoint-GUID: yq0fzqwet5qJ2NkZPd2_pQPzhFUn8fGq
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c11b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=d9rEuZw9YcPYe4YaNdcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: yq0fzqwet5qJ2NkZPd2_pQPzhFUn8fGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

Fix multiple issues in the MPAM MSC device tree binding:

Schema fixes:
- Move maintainers field before description to follow standard field order
- Change compatible from fixed items list to oneOf to allow both standalone
  arm,mpam-msc and the two-item arm,mpam-memory-controller-msc +
  arm,mpam-msc combination
- Constrain numa-node-id as uint32 with description instead of
  unconstrained
- Add phandle-array type constraint to cpus property
- Fix bracket spacing to pass yamllint

Example fixes:
- Replace arm,dsu-l3-cache with foo,a-l3-cache (no upstream schema exists)
- Fix msc@41000 reg address from 0x0 to 0x41000 to match unit-address
- Fix ris@2 reg value from 0 to 2 to match unit-address
- Add arm,mpam-device phandle reference and remove TODO comment
- Remove unnecessary blank lines for consistency

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 39 ++++++++++++----------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
index 53a6fdbbf05f..3c7b13a23ff2 100644
--- a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -6,19 +6,21 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
 
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
 description: |
   The Arm MPAM specification can be found here:
 
   https://developer.arm.com/documentation/ddi0598/latest
 
-maintainers:
-  - Rob Herring <robh@kernel.org>
-
 properties:
   compatible:
-    items:
+    oneOf:
       - const: arm,mpam-msc                   # Further details are discoverable
-      - const: arm,mpam-memory-controller-msc
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
 
   reg:
     maxItems: 1
@@ -34,7 +36,7 @@ properties:
   interrupt-names:
     oneOf:
       - items:
-          - enum: [ error, overflow ]
+          - enum: [error, overflow]
       - items:
           - const: error
           - const: overflow
@@ -44,7 +46,9 @@ properties:
       accurate after a settings change. For more information, see the
       Not-Ready (NRDY) bit description in the MPAM specification.
 
-  numa-node-id: true # see NUMA binding
+  numa-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NUMA node identifier for the memory resource this MSC controls.
 
   '#address-cells':
     const: 1
@@ -72,16 +76,17 @@ patternProperties:
         maximum: 0xf
 
       cpus:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
-          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
-          device's affinity is used.
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
+          parent device's affinity is used.
 
       arm,mpam-device:
         $ref: /schemas/types.yaml#/definitions/phandle
         description:
           By default, the MPAM enabled device associated with a RIS is the MSC's
-          parent node. It is possible for each RIS to be associated with different
-          devices in which case 'arm,mpam-device' should be used.
+          parent node. It is possible for each RIS to be associated with
+          different devices in which case 'arm,mpam-device' should be used.
 
     required:
       - compatible
@@ -92,14 +97,14 @@ required:
   - reg
 
 dependencies:
-  interrupts: [ interrupt-names ]
+  interrupts: [interrupt-names]
 
 additionalProperties: false
 
 examples:
   - |
     L3: cache-controller@30000000 {
-        compatible = "arm,dsu-l3-cache", "cache";
+        compatible = "foo,a-l3-cache", "cache";
         cache-level = <3>;
         cache-unified;
 
@@ -109,7 +114,6 @@ examples:
 
         msc@10000 {
             compatible = "arm,mpam-msc";
-
             reg = <0x10000 0x2000>;
             interrupts = <1>, <2>;
             interrupt-names = "error", "overflow";
@@ -145,7 +149,7 @@ examples:
 
         msc@41000 {
             compatible = "arm,mpam-msc";
-            reg = <0 0x1000>;
+            reg = <0x41000 0x1000>;
             interrupts = <5>, <6>;
             interrupt-names = "error", "overflow";
             arm,not-ready-us = <1>;
@@ -155,8 +159,8 @@ examples:
 
             ris@2 {
                 compatible = "arm,mpam-cache";
-                reg = <0>;
-                // TODO: How to map to device(s)?
+                reg = <2>;
+                arm,mpam-device = <&L3>;
             };
         };
     };
@@ -173,7 +177,6 @@ examples:
 
         msc@10000 {
             compatible = "arm,mpam-msc";
-
             reg = <0x10000 0x2000>;
             interrupts = <7>;
             interrupt-names = "overflow";

-- 
2.34.1

