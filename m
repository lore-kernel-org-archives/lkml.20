Received: from sonic310-15.consmr.mail.bf2.yahoo.com (sonic310-15.consmr.mail.bf2.yahoo.com [74.6.135.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA8200110
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791260287; cv=none; b=Y4AeiZGzwzNhUxEBbbqK/powThmwfGIW4YMpVrEs5obFW1TY8OQ59RwquDogRLgYFq5AF5+pTYencCAE7oDZS/gO4ruCRMaVPB3t0T4t5b8Radmrk7fEE5rddohhELUbqptrUDoU9fIe7/E9yAMQVT1GxQiScIHOfxLz+5SF8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791260287; c=relaxed/simple;
	bh=o9GEaIpo4Tk/4/pMUTALBMy9vOnA6rh/r9pgoPzbjz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=bxQOkTvZXeN5/4eu524OcwonuoTyX8ft6OXSnNcKfv/17IsWhJLG6k3PY659JVrOGr12onOaDdw8kPwUD95/9z+G+dVSOdisymLYrFm0ZEfcKIS78Qa0/u/R/lIt+GCqy/hl1TODqy58/savGIaeoZCLLcsemWENttslVMuagxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=amKDQDlU; arc=none smtp.client-ip=74.6.135.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="amKDQDlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791260285; bh=w4I8ZXaJUUT/qNwcfw4dbGwkZTp3g2dvFI/so9RtbJw=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=amKDQDlUzM0B3epbtBHEZ2t/6c9uh13LqYYYJ1WsAu15e8c/3P7dyOnQLJXoVDweuAT5WnIZbtYfH16NHVXJ/aarvL8hcQTv7uPfsT6I5yu/igshC69shOEN9fmbff7lSkJ8KKmtkwbhsktvzVMMbCxf2+Ps8dp/wCQSAQNMrrttG0aPZr0DBv8X5i1H/kC6Lq/Q7EhFV0r2zTh2fLaBWOvIj/3JHfwhcnpnnOrBj/QWkdhO5kB+n7P2Ru7NjWfZb5A+IE/ZVV+arlKLXou7zMFfvNNFEVgVIkpu+MxoqkahltLZX4fHWpJPIfKWZ03OpGiVH1lwkKPW1GkMzqXYhQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791260285; bh=wFets2S9GGyRwMSe0FTK/NRESqyJlDYDxR4qi5dz1O/=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Z06TqNJg4z2jqAagp7IMxo5M0qV+QmzvoFUzmTEHdB3MlZr7wuySUP80ftLUCFoJPD+OEaomBtJmVtVFnpltF7xGqt33PA7NRNUWxVV8ASXhBcXVwtKS7b3ZGVL0jijA7nAQ5y1Z7Kost81AZARXe+R4Lty1Foc3l73VfLcDdSp6OfdLcGArzbParjlIhnVEhKG9SirZAFpUYNZ0qdRy82KVB4LD9dF2SrWc+Ig9BjIJHEA4rlkfwokbnDR9yL+1SgeNz9Pml54moqK+j9uNLEYWSYxW0N9gbVqGyBqL0sfZ+oHRqXTtgQGujuaPDy+qXTVaA6ET6+buhSy2wKYGOA==
X-YMail-OSG: Uv1RxzgVM1nnIh78FtrYv2sIGQb3waRwmGU67JJjEOTkN6lY.ajYrwGevyu5oJo
 GxVz_vjSZe_zyvLI5j6iCYDSHH6vJI_MAhHrggt.alVlPZSb8MYg..71GeUzO3fdGw6VD1aLwO1l
 MLAYnnedHtOC6vow539AW3MinepNgL07hvb76pgS69OQxdUaNZcn2RZJb.7WvBIw0XoKUG4yuBhd
 qOEdYv09I7QAwzvhdT09TbiY3OvLrwwTA0umuz5scAfDlYo5TobhFZs1Mz8izR.VvfHIxll4fUvr
 fBFeBzEmAFFMA7_d0lEW4BEQv_OsDaRZDkAqVVTk_p.cH_igcha2j7pWsKY1qDKjUUyq_uJ7YyAu
 mTsHluH51i0i7JNQX_juk4zzZGd.S4etJ4uU17P5vl.dS1IO8FAN3nF5SHwtgaBSiwf.IK_IhrHN
 9En6zgTZMRiV.K3O4JQskRnCP7piubRHGSmjUSMIWPlOacMr.uB0.PW_CvjQG8_.aeqyRkgWkbao
 jbsWrPqcuZXkG2wZtt5ynfEq7hElH3nC9HiJ1Gvdntzd3ilnqKA5oBmfQXI8LwHghbiOwvkujG2v
 P.vkGVkFKy2gYZZ6h7ncdhLsqWmYghsuvmS5C4sulyDCDLnmBLDL4vVAxZqv55xKBAUxaMX1FpKu
 5pLOkhlf7ZR5sD0_kZaIsDh_YT_F225009EVmdpGSd9lfy4V4pQhcxYCDNGSgqLGZ7pDiPpbY0Af
 be55ZnGFkrlCO4HFK_jPImR49BdgU2rk._uaQrdRXwEA4AzDRX5WjF32SaXMm_KF9IchcJ5AJvLB
 gowZcfebch4TmkymmkC85QMNrzLCxBHFdvNCOWhjvmdbQDDUzzenHB_nhlI4KO.24Ohcb4QImZFI
 pcFSK5JuiZv5PJ6wdYzx6yhQxQ_5PKVBvo_CZQbHCAAk_yMa2rOQRjnW9jiwlWGun7OYtkK5qKhh
 n7CWfPd06yTIxRb1GoWLqLUyufDbnF.I4BE7TSKom_NU3itASRrOzfNBjnKBK6r72ykciWtyhOq6
 OXd44QCqMD8y3AhVIkZV2DF4NvOB3yut2g8srUbYkAc5btNOQbfxtVn0AbgJG_o4YWI04_GXJOIT
 qVd0qezJPFAsI2yF6uDeVoMiqZzqY8Xwcgg1Gn39DpxSk97UIqbt5IyBPEafq0kNdrnWS4KIBlQM
 ybkdI.GWT0nTtYvceoCrUCWTJIO_WesVN0zPX0W4bwW0IleRb0zR5oQx3H_C8D1RH21laqdnsHSe
 uiHqkB0H5PPd4uNiS8n5bV8aJXVNRN.5V8t15c8cqzJ3.33LAIH2IwYmhCBx_tm0tiDb8DS.jQeu
 9RQUB4lngNHQl7XQigaLxQYhFpcwrH7pBhZhjFQQ1XBFNzXw875NFr792NmFL8dFYvP_kVzjuon2
 EDKrxoKtu1w4IIs_oD6V75o.qoP_oNMVP3654_L5iBNsHoD7EdWIPK8NktM4EiyIbh6T53m_PQZd
 vhjARTdCcPWUHgYweGcC_eEuWtCK24hbisCAZ08t_x2EKG_QdoNwkCx2Zs6necFIv0qgPDkZHhAU
 7l60PXXhxjlhAgr0Pf9spmpBJrmypw59GPQGgrNm0O2sTDtL8bf4uSpDCOyCjyUQ477WYwAof1TK
 6D8MCHX5SI402xyY1ZLkMp6Gmsgxq6u6K7lyQ03oHLadsbedHlOfD7.3P_dYX0brYBSeeP0Seefq
 tDBSBtV46u4oRTta5tnYVPKrBApOy1RsNORC173WgFSFPGKQxZrrTH0nZ1IHWA7sdkFuhiydnxfn
 wChiDsyud.Q2r6NhjCxPSSa6EGPeoLMPmhq62OKAz1dwmAIkmUEUh7.33f8SkqaeUceQl88Cg_6R
 WSXCJ3uaIlzexxiQxZk.mPqG7wR1crWQp3aGywIeqkG5UoHaYRXRqu6j_Gdv1dkAq1_HWSClgS.h
 k8DvyzJRUY2sHtWmLigIgXkhwXc6GVo3meVqmDgUNtBgjG.qp5E9Vh0Oc.Gx37KBgDKh4GqYBKd9
 nUACF0mqHZqylJjaX9agzGSyM6Dsb8B0p2HnCJikH.L8z1L._MB9GlO7orLJfVngp34VhRbv6yW3
 fxpWft3gobFA1auF5q643en5ylKGy7pr8b3PRfrnh2XRv1miP70_FxYV2tUxFPzo69KWWOVi4a1W
 SA7c8hqh9akxcX8mC2HLIysDwRb2NXKWzicDd09j.6aLbktjnyLNGRBhv1UU.k.46AeJtzVQp8VK
 OY11nTbF7M1.AtYmxxJhth_pRa21pTgBewIjINqQ2eNiOfJ8ZWBMMrAkdgA--
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 4e63f676-19bc-40cd-beef-4c4f5ba32c5d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Tue, 6 Oct 2026 04:18:05 +0000
Received: by hermes--production-bf1-6d6877594b-8262h (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 119945a1ab88cc8a53fdba40fa374bce;
          Tue, 06 Oct 2026 03:35:31 +0000 (UTC)
From: Jeremy Dean <deaner92@yahoo.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremy Dean <deaner92@yahoo.com>
Subject: [PATCH] dt-bindings: pwm: Convert NXP PCA9685 PWM controller to DT schema
Date: Tue,  6 Oct 2026 03:35:18 +0000
Message-ID: <20261006033518.34332-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261006033518.34332-1-deaner92.ref@yahoo.com>

Convert the NXP PCA9685 PWM controller binding to DT schema format.

Changes from the text binding:

Document the 'reg' property and make it required. It was missing
from the text binding, although the example used it and the device
cannot work without the I2C address.

Rename the example node to the generic 'pwm', as required by
pwm.yaml.

Describe both cells of the PWM specifier, and state that 'invert'
and 'open-drain' apply to all outputs, as per the datasheet (INVRT
and OUTDRV bits in MODE2).

Assisted-by: LLM
Signed-off-by: Jeremy Dean <deaner92@yahoo.com>
---
The schema was generated with an AI assistant (Claude).
I verified the properties against the driver source, the PCA9685
datasheet, and the text binding. Passes make dt_binding_check.
 .../bindings/pwm/nxp,pca9685-pwm.txt          | 27 --------
 .../bindings/pwm/nxp,pca9685-pwm.yaml         | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt b/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt
deleted file mode 100644
index f21b55c95738..000000000000
--- a/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-NXP PCA9685 16-channel 12-bit PWM LED controller
-================================================
-
-Required properties:
-  - compatible: "nxp,pca9685-pwm"
-  - #pwm-cells: Should be 2. See pwm.yaml in this directory for a description of
-    the cells format.
-    The index 16 is the ALLCALL channel, that sets all PWM channels at the same
-    time.
-
-Optional properties:
-  - invert (bool): boolean to enable inverted logic
-  - open-drain (bool): boolean to configure outputs with open-drain structure;
-		       if omitted use totem-pole structure
-
-Example:
-
-For LEDs that are directly connected to the PCA, the following setting is
-applicable:
-
-pca: pca@41 {
-	compatible = "nxp,pca9685-pwm";
-	#pwm-cells = <2>;
-	reg = <0x41>;
-	invert;
-	open-drain;
-};
diff --git a/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml
new file mode 100644
index 000000000000..36b312ac0be9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nxp,pca9685-pwm.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nxp,pca9685-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA9685 16-channel 12-bit PWM LED controller
+
+maintainers:
+  - Jeremy Clifton <deaner92@yahoo.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: nxp,pca9685-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+    description:
+      The first cell is the PWM channel index, from 0 to 15, or 16 for the
+      ALLCALL channel, which sets all PWM channels at the same time. The
+      second cell is the PWM period in nanoseconds.
+
+  invert:
+    type: boolean
+    description:
+      Invert the logic state of all outputs (INVRT bit in the MODE2
+      register). The setting applies to the whole chip, not to individual
+      channels, and is typically used when the outputs drive an external
+      driver stage.
+
+  open-drain:
+    type: boolean
+    description:
+      Configure all outputs with an open-drain structure (OUTDRV bit in the
+      MODE2 register). If omitted, the outputs use a totem-pole structure.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pwm@41 {
+            compatible = "nxp,pca9685-pwm";
+            reg = <0x41>;
+            #pwm-cells = <2>;
+            invert;
+            open-drain;
+        };
+    };

base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
-- 
2.43.0

