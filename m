Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE43A6B8D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575828; cv=none; b=F0XMobyEr2GHi9jDxCGNYT0GlwDv6GTDSqktkdVLvlUek6j89lTaPma9hO875ZRZ8cTKQHdtx7R/DKea6298FDaNd/EGIUxqakJYVJeh/lWFQLphzinXyMcxMnGlwYWdQPcp7rJwZcmJIFxODWpJZ4J4MxUTcpsi+NDkvDD0Ymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575828; c=relaxed/simple;
	bh=X9KZJr7kgVXbU9Bx9ClV9IK6kpd8uGbGeYXDcH/AfOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+/A5adx5eUh74Ynu3WXPs0CgFPLIubLV8lhxVTROPYXT9aICx2W0ZkgswPPv/spJrtRdflTOo4+M4PsVVSXnz+sqxarGdo9xH63mIL5EBNI1BkNfEDTIpfYIF82efIVrB87bJudAlYXg41JXhJu2mgXuVajbIpTmweXjtRgWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhrrnYuX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9qvren2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhrrnYuX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9qvren2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLNPAx2368898
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/CZep6ohxgA4WGMpffaOg6jtKktfc2ERETEgC6f1UA=; b=EhrrnYuXXGQSe2j5
	ZBmFs6ajGq2VD1QuqCFPMgBGBsRoagRPlPtUAXxu3JliojS/AedzfixtldV4Azor
	RqkVenio3PDtmQf/A6nrgwIB2WUqVIxOslanNkbOZAuMQCxd+2Yf03XJKkqJuFm0
	ADQyM4eHLa7w20xQFNWo8h27Q3tEmBNtCOkWQXU6PG3eRIlbqF3wTTAfUuvuwljT
	Fdoq13YCjDhYoOPX9Q0W4qRZC8PeQ7+gF203bDwZd6D6EtVqZ4HnM6uNcHwolyBT
	kE0zzfbmqi3vHg/SkfXO75AzzsruuhjLYodMbZzcE04i5UP/dLhy09DOawnjEIV1
	lBjOug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jvmf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:10:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2886418a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575825; x=1791180625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/CZep6ohxgA4WGMpffaOg6jtKktfc2ERETEgC6f1UA=;
        b=d9qvren2Umldo5FCtTn0myGzwkJ801LSgpXOS3bk0rMg2Gs7gh9bSzzX5XCLRBQCEH
         HlkkJDjfXrVKaKrJ8qv66LXlT7UIBXYcuF/kcy6IkUguLBKSmfWsbYB9wTmJ3ls6q85D
         LSddJErsE13LVk8+sfJx3BzghxFIshDVh8ViuPawYgkJP3ZLHdJK1ppNAOtMMK5HghIP
         Xb4iePCbqGNV63N7MUItSSPdsPnyTXC0EXOgfx849F6lEY9m/m6+9KNRDtKIBXdDOqgU
         N8y9W5yag1PVqEgz0/VfsX/ZAEf6PRJcUcutYrveU1n9TXOkWZOopodyPIk9NQRPAPBf
         JJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575825; x=1791180625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/CZep6ohxgA4WGMpffaOg6jtKktfc2ERETEgC6f1UA=;
        b=xEgDwvp5zUbcOxIB7yeNb7UhXBO5hjkl2TZYtw4WfJxi3MwquPYOIlZE7uPsaYIm13
         JeE2RDkrnZK3tzNA2Z6CX8ySQ8RwM5vFUIgtjr5SW0ZVnQvR925i8IX7DLjs2Jdv1jar
         AkI0sdJTyEcqpBRRN1KxUKjeTE1ERohe2leDcipXqx/b1YDWiZR7AS6ekdwv3rKVPBGK
         aWeGgMlXokWyYTKDDw+U7zQeGPsEhzspjfWbnqVRQNOJTNEO23zz9KTdRXZ9x0jMQ9dH
         SNoAs0LOA33FQBPCk+pO8Yov2lLpuaR887RBZUc3GZrv0K4FwCNW2sMyZZoHV4b3FvEG
         hT6A==
X-Forwarded-Encrypted: i=1; AKwUvBzFXsjS5Q1gpsaiGXoQF8BbAJVOBbuEKGHAFvkrE638cUiz1bpAPn53Az2X2kSwrODBr1/dK6uJAgeSWmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9esexhjOZLHbCKTI42+zTp6kQ8D3qKGKNJHi2bEZNUybfsf6k
	7Y5JfxbfpqEfTXorIKqoB21WTCHvoypCqXgVzl2TG3Jko5od6ZjIYlDj5hu2DXZXkD5uDLDRFXW
	4g/5NVU7OuMql3IEIHwqLcU5Ar21HRNXvdeJD5/KYoWtXbFiUyFZCc+RVIz731ejnHHM=
X-Gm-Gg: AYBFou3p6SNAIRuP4q+XZaOKT5HjlIm88QKXqxtuG0kaMPTVYH2uEs9WnB9YyGsegb6
	k5wGO7W808OPYjF+7RBaKpnmo2XznyzCZWA4weZHsfEyjnO28zFfiSGr7d8k+sfHIwqK+mYgTHU
	KB9TBLDofQgQN4r9r78hBJ2vUTV6L2UQcXRz3R7oZ5Wufd0sB2OTxuoGNfmIkt/Ry1irY3O+xpD
	YIqUMM3P2w5wf51d+Dl8e+syOQCttlKE1zIPCL9O7rrgHFrkFhzbtVvJooVnE0RDkrVynyPOwaj
	3yt7UY96S5/C7t97UyP+gxA7S7NnFx77b4rT8Dv8tVCMmxJaOVV/U/f7Ps2rBEuajcShy5OLGaK
	plPhYtQRvGuiMbQzxSAgmS/+xhiYnbeZvuOU2
X-Received: by 2002:a17:90b:2d8a:b0:3a0:b959:4472 with SMTP id 98e67ed59e1d1-3a0b95947cdmr7634976a91.41.1790575825524;
        Sun, 27 Sep 2026 23:10:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8a:b0:3a0:b959:4472 with SMTP id 98e67ed59e1d1-3a0b95947cdmr7634923a91.41.1790575824896;
        Sun, 27 Sep 2026 23:10:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:17 +0530
Subject: [PATCH v26 05/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=3059;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=X9KZJr7kgVXbU9Bx9ClV9IK6kpd8uGbGeYXDcH/AfOI=;
 b=5901wfsiP2wM4LURUGsDnb2W4ctDY1mmhAlaROpftYaWoGFdJydZj5l5XbdLqRnvkbZJ52h9Y
 kCUyy0nJYo/D3YQUokIA/EkT/qcy51K7GO1xEIEPoTFPL3VGT50qV6r
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfXz98z/RxpIRMW
 qPABC3o3LBiHtVg2i0XBqpqmLBSZLB8qmECJ8hHfM2iR8ui4CWgwr9L24qB1D695nAZSY915uDJ
 wRL41Uk54qBSzlh/h/BHhhcyAm+L8hg=
X-Proofpoint-GUID: XdDEmnzgIvnmHXPUhUMyTtzAuYQXg_l9
X-Proofpoint-ORIG-GUID: XdDEmnzgIvnmHXPUhUMyTtzAuYQXg_l9
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba04d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MLL7hoemGGfarhQ97J0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX2KFPwQjqaQfw
 j7az/TCPEiaH/sAWl+tlBwoWr2rq6gL/m42ToXs8Nw4TnZdVJsAjtfi6PBTe/tPQy9C6yEjOAC6
 yzfv92pyJoFYC3GCxSzSYqFWUPvfQ15DQy26uA4ifjv9qo8iByLdJEbV+3MJOUgrd/EQTj6N1Bg
 +pV3HsJWMhHFaeylniOQG5tU5x597OCgwgm50fcThhEBEhyw4ILaqH7Sv8qDBqLj3wS6yGcSEh3
 FMybBcGePvjsUz4vp2D45OtXMrOlj+wQWuWEqwZm8+j5PB+BnC10Gj1ZI4sIhIZ+Fa1/Guw8DXb
 D8HOHtfu+RunHpWf4gXKH/9fU2oU6JfRpw64YsjKmMggeLLuQ4jkBfyH67dQWJFW1JN4J+cQrd7
 J/Zp5l3UYsw1KHj5bw9qgnHo9QY9rbgO3VDyzLkWGCCgR96J4v+Pq1R47g51q5FD8b2SdTK/b35
 BeYBvmQumwd8nVD9OAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280024

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..82ae25e7a338 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
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
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
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
@@ -137,6 +170,15 @@ allOf:
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
 
@@ -260,4 +302,18 @@ examples:
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

