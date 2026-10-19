Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA550500359
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419496; cv=none; b=O5y1z9lgCcXmFyh9qULfc5ZzV/SXD70DBXpIc+haZYhp+xPeGHKj2EKLZnrfw6iqeVE5GTXmyGc/QevE1qLSs2+fhKbyX+TELKtlv+lFPF+hGUXo3qWz6HWhkPeXrZiTmcWfOWa334u/hCzcLgdrvwI+vJXicqmTl76DfsBj32U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419496; c=relaxed/simple;
	bh=o1LIOxVpr/1oZ+zQn/5uQ24QCB9UMm5+1Q0bvlvsIM8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CgYoOnXiy8D3lLCPI9aeJ7lzbY0elauL1Hswm1g0L7oZkFvUCBrFIQdXnNk+Tu3PG3ninweLO/KKCmjKypOLu8nH2pmGV5JNkZCucdcdjhFL2p4KY17m+nYIPn9pP0R0JEBiJwnLFbJNH1Lt4P4dpXJJtv3T42FX3Hg3uE81eQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ngXmdZJj; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ngXmdZJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792419489; x=1792678689;
	bh=vfhb/pw7ZRssM1iSnmUYJHw+k4HI9miwD0VnZdHZ0vw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ngXmdZJjjwxURfClkly1Om92g5hGnWIfdUkG2j5zwqw7Uh9/4UnURQMZE/16Dc6jD
	 Wb64qEFH4D+PbcJW7YQz2Ul8GfvaKWEizKAvkXx7RM3pIbeSqrIDx0lU4w7rlTxFlx
	 gv+vjoOLEWtV5VD5GS82xKmTmvSaNAKSZZ5mU7+w4L6QOEm2QIULXsWjIJDjPzOhqf
	 SRFsRfaHKXTWMB6gmRaqnjDMFhlowSSWXSA1xhto709pylV3tXZ4Yiem4QACXDXukU
	 B/oH+HrMKOPWVwzPkCDBlgZjdfGArUhyynbpOKuhjRRNgPqYnuA6JphuUMins3fqTm
	 H/92m2YglBa6w==
Date: Mon, 19 Oct 2026 14:18:04 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <20261019-milos-iris-v5-1-2b3181876b2f@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a1d94aa0b0875273cccb46d6216dff97cefabfd1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v5:
- Rebase onto next-20261016
- Link to v4: https://lore.kernel.org/r/20260706-milos-iris-v4-0-119cbe0a72=
62@pm.me

Changes in v4:
- Update firmware name to vpu20_p2_gen2_s7.mbn
- Drop mb_cycles_fw[_vpp], unused on vpu2
- Add mb_cycles_vsp
- Use hex for iommus
- Link to v3: https://lore.kernel.org/r/20260705-milos-iris-v3-0-8c1353530f=
24@pm.me

Changes in v3:
- Rebase onto next-20260703
- Switched fluster tests to use gstreamer, ffmpeg ones not reproducible run=
 to run?
- Update milos caps to include caps introduced in tree after v2
- Correct iris opp table to only update the MX rail values
- Link to v2: https://lore.kernel.org/r/20260529-milos-iris-v2-0-7a763d7195=
ae@pm.me

Changes in v2:
- Rebase onto 7.1.0-rc5
- Change firmware name to vpu20_p2.mbn
- Change iris reg to hex
- Correct iris opp table
- Update cover letter with new test run on 7.1.0-rc5, add -s arg to v4l2-co=
mpliance
- Link to v1: https://lore.kernel.org/r/20260406-milos-iris-v1-0-17ed0167ba=
6f@pm.me

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++=
++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index ed994c2170af..51c7d3a06957 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,milos-dispcc.h>
 #include <dt-bindings/clock/qcom,milos-gcc.h>
 #include <dt-bindings/clock/qcom,milos-gpucc.h>
+#include <dt-bindings/clock/qcom,milos-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2271,6 +2272,90 @@ usb_1_dwc3_hs: endpoint {
 =09=09=09};
 =09=09};
=20
+=09=09iris: video-codec@aa00000 {
+=09=09=09compatible =3D "qcom,milos-iris";
+=09=09=09reg =3D <0x0 0x0aa00000 0x0 0xf0000>;
+
+=09=09=09interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+=09=09=09power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
+=09=09=09=09=09<&videocc VIDEO_CC_MVS0_GDSC>,
+=09=09=09=09=09<&rpmhpd RPMHPD_CX>,
+=09=09=09=09=09<&rpmhpd RPMHPD_MX>;
+=09=09=09power-domain-names =3D "venus",
+=09=09=09=09=09     "vcodec0",
+=09=09=09=09=09     "cx",
+=09=09=09=09=09     "mx";
+
+=09=09=09operating-points-v2 =3D <&iris_opp_table>;
+
+=09=09=09clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0C_CLK>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0_CLK>;
+=09=09=09clock-names =3D "iface",
+=09=09=09=09      "core",
+=09=09=09=09      "vcodec0_core";
+
+=09=09=09interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE=
_ONLY
+=09=09=09=09=09 &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+=09=09=09=09=09<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+=09=09=09interconnect-names =3D "cpu-cfg",
+=09=09=09=09=09     "video-mem";
+
+=09=09=09memory-region =3D <&video_mem>;
+
+=09=09=09resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+=09=09=09reset-names =3D "bus",
+=09=09=09=09      "core";
+
+=09=09=09iommus =3D <&apps_smmu 0x1960 0x0>,
+=09=09=09=09 <&apps_smmu 0x1967 0x0>;
+
+=09=09=09dma-coherent;
+
+=09=09=09/*
+=09=09=09 * IRIS firmware is signed by vendors, only enable on
+=09=09=09 * boards where the proper signed firmware is available.
+=09=09=09 */
+=09=09=09status =3D "disabled";
+
+=09=09=09iris_opp_table: opp-table {
+=09=09=09=09compatible =3D "operating-points-v2";
+
+=09=09=09=09opp-240000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <240000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-338000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <338000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-366000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <366000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-444000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <444000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_nom>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs_l1>;
+=09=09=09=09};
+
+=09=09=09=09opp-552000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <552000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_turbo>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_nom>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
 =09=09videocc: clock-controller@aaf0000 {
 =09=09=09compatible =3D "qcom,milos-videocc";
 =09=09=09reg =3D <0x0 0x0aaf0000 0x0 0x10000>;

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260406-milos-iris-d1a854e4cb75

Best regards,
-- =20
Alexander Koskovich <akoskovich@pm.me>


