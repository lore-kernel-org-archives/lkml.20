Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF454825D5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398020; cv=none; b=EKmVKPmfrF74fCtoG7D2pfDz5cXqPxcbsN0u5nop4rNdgX8g5fSpKj4b3M4QfN7Re7Slf5x1PriBIhNBXYASeG6DBJkjyqTNkOfUQycaCD1xFMJss9U/DiMiHD01KPiditjuCXN0b3i0EuacJsyHdxDNE4S23PyrGV+QQiTRVP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398020; c=relaxed/simple;
	bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccDbZZCUYK4ZkuP5yeFqs2GLC/sIvErlb+FbaLBqxkeUl8CrL0QTBKig+vIyMFrF+HP7f7GG40SugIlQ3CKlwFNUbDRd4Xtf+gpJb9HjOnwbPLxU4VmRh5vujJRNOBLavcN3+2NCJUjjNz4+TOZ+qkSbl1PBm4tHdlkiQzlbCmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9nrs0NI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIzrBMKx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9nrs0NI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIzrBMKx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0TFa1761392
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=; b=S9nrs0NII51EzlaS
	oPQDWtpnPaQQRLUIa8BGGsCw6DbMcjf6l2hropH0DVPM361GXEM7Bdfw8uKwdZot
	5dOgiLl6tw+aB+VWElqzrMmfCq1GH88Sa41UbYxNA0bYRzwTWYmxS93DiKmTotia
	mQ54DderMnj43hGaEWqkAwXXi3K/j6rpsGhQRXwbjH04nbzWP0BZhZza/lfcOIMp
	1pNrHYjjo47G5xuwQBxuKPBIzyWyFqSXimgw7Mm5av/gpzxNL3dG3wV6JYUqHGlv
	Nz6KPv8wCjTyjO36EN3wNZEWB3aExOdQV2sjiMZ7alXNteBk+XLP6itFWwR5O76z
	BZFdTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex983n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:00:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3d832827so41687655ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398016; x=1790002816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=MIzrBMKx71YQWFvwiPg5eVpOOW0x8WjsIftntu7X1boylJtO4xTXk3expAgmJAeuEs
         UQFQpMKJ8DYGSm90EXcBWaR0lIvio28udV7WQNWXX3IBX1XKdIdgmKViZIBOcehj97WL
         e2UixoPfex7K2616G5dTsS02zuHD2mVC7vK5x3740bxtkYIrB9z33IZ+R7Qmq1ejYweu
         Li6U2o/X6DYsbC20dQIyRX+G8WeZpZaLmIXmSM+xnPdZpCkjPm/Zn4SvNzrM0AjUMRD5
         3+hHXkjOwm2E2w/8JSASatQjMJvZzpVg9mjbETWYu68ZTELJTGEJAFgMz03fQc1mQgnz
         WJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398016; x=1790002816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=mvoi65JMJBOpEKhDSO+jMmP7x+weerGxSrka35FaOr4Ce95TKwQHVafCwG4D69PfHi
         gdQF909Mcq9ggdKY0oiqo10cZ5HOB9uAHZ7QC1rEL5zElYQnD/yGukqFzNQCGrzZazMi
         W5Sx8gdW2nqzDVz3VnUZfXBS33XsNnoQwKs87RY8Vgr87hA/FAfZDhPmyHj2cOFye2J+
         Lwic/dgebpBzRSwkFtXHVak9nrA/PLq8g7HcxMYn5QdwgKQljFb4qqxD3zjMFc+AfRyY
         UE/mwQYELOjlcBpVYgcoZaGLxJEe7TlJyu5hZWERCoMb9Augg4UWnLCJL00gF89BFIkc
         0n0g==
X-Forwarded-Encrypted: i=1; AKwUvByW3Al09mW1TjBLX80sb++k/al1+oFL4yPmxYDeN1M4ske6jebnHhrWWRUUcUIuDTw9MfEDvH1xbVfGIaI=@vger.kernel.org
X-Gm-Message-State: AFuF++kOk9YPj7XdwgHfRS79kwp3A+XNjRNopqv9eZj2YCtvxEJRYfRT
	HSP/k6pvF5b/ndc6GzjrlvPPVaqHpf59IpTQai/6KYafGLDNUqmc9wHNsS/Ke+Nco0e8xN8sfyM
	/D/18PE+gD7Ga7/0K+3yAeRmGr9Xf//Y8rV4CDBr3yROr1ul8Vrk8vrFlR5umV17PQoA=
X-Gm-Gg: AYBFou18moK0SeL0qEJDt7zblA25PWUhocJvaO0gCX3NaxPnTsHGV86DSKOFbp0YJer
	MsyH0qswvs0BnilxrO9r3KXX3mgzmi1vL9F4lje9fPomrt6XWfS9XjuVrC3+xVfnF0ns60xX/Jz
	eBjgf2NCtSVdd6LoGtBHrBNnmQQyqmnlRoYK4wp3IqyuDh+jTB6KZgdyKaKA4wrRWnt1wksREmB
	JtORBSvN+/+SKEO2T3n+GRuPHiSwvbn+UiumhrbIi/w+4oMGFacjuGLajsPH41xVRE0lDa8U/VO
	xaxmgOsnI05nPngjYRuLDYkI6J5SKgo3avnG2+wSoD49ASpKwDcB2LxMTg6KdOCyN5EfaAWQj+V
	dTO41RYxan7EBf9bjChHVv/LKRJ/28uR3g6Sy
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64686835ad.21.1789398014974;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64684915ad.21.1789398014250;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:09 +0530
Subject: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=3255;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
 b=9f7VltXLt86w6F9+EGr8WWpUIDOdDKEqN7YWpUaS4nIV6sFJpeL13CNDFTmp4mRqRZO347vQt
 fCuknKj9CbwBQX5SYiQx+DzSwdtAWrzVzAFYgN2Gc7+Nd//a8CWe0qk
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX0TNSm88UIoF6
 2FxtjdMFlN030VaYAjGRsp2HnOFTAIdf+FlCoBV3BxuOVWaWA6FRUgeDNqOkwYHkd1nBcpvC8Xr
 J4DO70/FYDVw2S/U6MaieXS6YxK6pMhuDDrC3DTuDWCrMPE3UPEdbu8BdYLpqDbhtnDmIoXlTxo
 hEQ1BRZ5aPxnolqtmrVo8gZo6TXDXJPPXnVqA3iUZRZQjwAgWPPcc6WtKzqUzXmFPA4nDkUyu2E
 omt1ka5IMVMNUvK/mMrKDBFHc8Kc5RgMVvRTx4RgzMSUzpM0CcVbSoXWokqoeXvE9KbzGSOnb1C
 msuyODWs8HovjGw757T95IbLXoalidwNNakYtRKJX4eW/kidl/zn23lST8ebc9eik/zu3x+yI3Z
 BAVMoDErYPsnioslLnofUczN8P4t/VQnkbIdJtCJ0v2gioIXtQdbRxN/7cv1Ahn209C1abG6kvb
 GuY3WjvJWUhJZz8eOlw==
X-Proofpoint-GUID: cOq61vb0A_IO3SaQwL2bCNRbvg06Uxkx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX5gq4nNBO7eLr
 VGwXq9GdgGNkH4Y5e36mEJhz20rvev4NGUMP6Od+z6LYlKbpmiKje4ewPpwnGXmfQEuTVmIC1Jy
 j/3TdOYSGJey2s4UJUjGsvV/Ge4i8KQ=
X-Proofpoint-ORIG-GUID: cOq61vb0A_IO3SaQwL2bCNRbvg06Uxkx
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa80c00 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VHtpXdJELXZ9Nr0wy4oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..8b6a28b81ed7 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,43 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0x80000000
+          - description:
+              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+          - description: arg3 (cookie_lo in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +174,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +306,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1

