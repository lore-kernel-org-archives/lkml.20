Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F253A39F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177160; cv=none; b=tklLnoglsrl5VpKJ5TiSpp+onCX85hwe7wDSgY+9ZlvlHitHCbU9DC/KOc/pi+7qakROeMp/HI4/6CLISt8PH+ucjsrr2OzXplnnSufM3Gbg5WyLTaLh3UHwMMrRXME8/y3yVvETiYtcKKMBI5F/dV2ZDEbpTgJHJppWrhe8k58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177160; c=relaxed/simple;
	bh=OSt2luTi2lemu6UTtjQoBucfgz6URVjePzM2Zt5GFQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJeZNmAnSaOmieK9EHWAHo+kx3djTGu4ufme7cFUUM+YI+Zi08w+LRIUOumHaVFRUtifz/k5sbHLD9P57zjHlQk118QmSUFjtWOdlTByh73kZmv3AOlLOWV0kM/sray1naLc2Thj5KG7EYWmw75aa96NUUGyK4HWn6+49b8Pae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akao.au; spf=pass smtp.mailfrom=akao.au; dkim=pass (2048-bit key) header.d=akao.au header.i=@akao.au header.b=PvfRXLC0; arc=none smtp.client-ip=91.218.175.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akao.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=akao.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=akao.au header.i=@akao.au header.b="PvfRXLC0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OSt2luTi2lemu6UTtjQoBucfgz6URVjePzM2Zt5GFQ4=;
 c=simple/simple; d=akao.au;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790177149; v=1; x=1790781949;
 b=PvfRXLC0PcTaRA9DpXT4+sj4CwkixqUPo8MqGCTqPfpyJ4hRdVyIUAcmoTmgDa/fhWSEqk27
 5p1WTPAE71xWCDYC1EUaIVyi0uQ3rwD5w0zPJMXqvClQnx2LE6yM7WLIsr4goWQ1p/Wa/PhEYqG
 NwPR+2WbkhWNFdvGsdmhixy1WP/tC9J/ks932FWlRmkbYQv902IfZkLmy2plChO4Cf8FmNvgz2D
 NVbZUMYsxX2ZekMOYGFlyowoapXDdUDOiLMpG07PwCRsUdifr22kQoP4odL2dFMaN5UGgxoGUpT
 L1NchPr4WaL4RFM0eiVhK1kR7R1Gc6n9lZG+tGXP2xhyw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0f537ef4d91a77b4;
	Wed, 23 Sep 2026 15:25:49 +0000
X-Mizu-Trace-ID: 0f537ef4d91a77b4
X-Migadu-Flow: FLOW_OUT
From: Charlie Garner <charlie@akao.au>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charlie Garner <charlie@akao.au>
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: fix touchscreen i2c address
Date: Thu, 24 Sep 2026 00:55:06 +0930
Message-ID: <20260923152506.44989-3-charlie@akao.au>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923152506.44989-1-charlie@akao.au>
References: <20260923152506.44989-1-charlie@akao.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The touchscreen is at i2c address 0x09, not 0x10. Nothing responds at 0x10,
so i2c_hid_of never probes and the panel does not work. tlmm pin 51, the
touchscreen interrupt, is left unclaimed as a result.

Scanning the bus shows only 0x09 responding (0x28 also ACKs but returns
zeros, presumably an alternate address on the same controller). Linux bus
0 here is the GENI I2C controller at 0xa80000, which is i2c8 in the DT:

	# i2cdetect -y -r 0
	00:          -- 09 -- -- -- -- -- --
	...

and 0x09 returns a valid HID-over-I2C descriptor:

	1e 00  descriptor length 30
	00 01  bcdVersion 1.00
	6b 03  report descriptor length 875
	...
	bd 29  vendor 0x29bd
	03 11  product 0x1103

whose report descriptor opens as a Windows Precision touchscreen:

	05 0d  Usage Page (Digitizer)
	09 04  Usage (Touch Screen)
	a1 01  Collection (Application)
	85 10  Report ID (0x10)
	05 0d  Usage Page (Digitizer)
	09 22  Usage (Finger)
	a1 02  Collection (Logical)
	09 42  Usage (Tip Switch)
	...    Contact Id, 16-bit X/Y, unit exponent -3

The firmware agrees. The DSDT describes one touchscreen, \_SB.TSC1, on
I2C9 (QUP_1_SE_0 at 0xa80000, i2c8 here) with its interrupt on GPIO 51.
Its _HID, slave address and HID descriptor address are placeholders that
UEFI fills in at boot, and on this machine they read LXST2021, 0x09 and
0x0001. Nothing at 0x28 is described. The Latitude 7455 DT already has the
same LXST2021 touchscreen at 0x09.

The original touchscreen@10 node is identical to the ones in
x1-crd.dtsi, x1e80100-dell-xps13-9345.dts and
x1e78100-lenovo-thinkpad-t14s.dtsi, which the Inspiron DT was based on.

Rename the node to match the corrected unit address.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Charlie Garner <charlie@akao.au>
---

Notes:
    As far as I know, no Inspiron 14 Plus 7441 has its touchscreen at 0x10.
    The 7441 ships with a single touch display option, but the DSDT address is
    filled in by UEFI per unit, so please say if you have one that differs.

 .../boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
index 5779a4e84522..edbba5101b82 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
@@ -37,9 +37,9 @@ &gpu_zap_shader {
 };
 
 &i2c8 {
-	touchscreen@10 {
+	touchscreen@9 {
 		compatible = "hid-over-i2c";
-		reg = <0x10>;
+		reg = <0x9>;
 
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
-- 
2.55.0

