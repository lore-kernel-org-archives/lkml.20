Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322643CA4AF;
	Sun, 27 Sep 2026 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509285; cv=none; b=SoVEzg+IkO5icEgYI4I09vKlWkQG0ahxXoqyjyUGup1R0CpZQ2OSLN4fyKO/AjVY6k5Tg7f+CPsq4BB6+QvqAE6UcJrnUZssWDzZuKuRne4qiqpdw+RC/M54Il2c7fgOFcmkAIYLkIYIOZqz+dShDsxYCatABW9Nmk/K5H+5Hcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509285; c=relaxed/simple;
	bh=Gq82R0zDuBMGj73mEo85ZnIq2UG6k+AFR85weF5q928=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tj73bgAVtdKZ5KiILAGIaAWrHR4VdSzDoWE7COamwgV4Qehs21ILYNhlNL7viH+3r+/XsJRVBOkPpnQ52G90Z8QmOMRi1wS1OMKHQijTAzolr72xtnsV5dBJw3HBY6fdnMqj1KrlvUIV175T5lPwkFRLRVZDbvTz//P10qWLxcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=SmGue80v; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="SmGue80v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509231;
	bh=oR06D+ZcaQvWH0MnFS+nSqjeGpcZkENK5HUull5Mmh0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SmGue80v389DAbkpkV3QClTpXeTCzszFgiPj5nDjIJ/PYIRcfoJ2gVcmGxhMWmd4a
	 0EEH0OAUWaBMmthpwfw8+/8syYIlHAPKjIOLEhyDFuY+8QrJIPQ9uYSm6XdVu5yIG4
	 fXpzixwXAcsgcbBAZ0szFE+Ko+i+vI0iA/fejYsQ=
X-QQ-mid: esmtpgz12t1790509225t73997ce2
X-QQ-Originating-IP: UgwSbd/867U7UVU7fvgs+CHBjPwaG/9WA9Mw1Zf7H5w=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12199500076802695885
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:08 +0800
Subject: [PATCH v3 6/8] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-6-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=1213;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=Gq82R0zDuBMGj73mEo85ZnIq2UG6k+AFR85weF5q928=;
 b=tTkkeWl5EfjxPDFFvh8CFv2/FG3h/MtVDN3VVNDcAReQQ5jJ+F+D1z4Mi6EutPEjCCd6uLkZ6
 F86e6YgznB8AzI1nvW4juS02Hr9A6rA6rQvbc1eYXPn++sOFLaYFXAy
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OZgvCwcXPWQtAMlp8dIStTUT1PCUtPYP8SyNxgscll4T9Z4lGuYCP/5A
	uMQR8s5gF443m4JbFnVGTQ/8DeMtaO8HK9BRu0Ayuo/pAtqGLGrCF9Ju42d+GtlpWpwVHNA
	JkIyQHM96d6GZXH2G6iVZOy34YwVkLcXokA8HN6WRFaLW9h7Bwz0h5XWRwfN9I6yEC+Jiv1
	LKac68V3wCOXSBNPK7XFI5Y+sFICPiWM1mVgnOYhsPHMnQVRv+1gYoK6/RP6JhoSJFwQwxq
	ir6NcnYIZFmtytBXVAOGVp7VAGCbhEphe7npIR9tIym/arOw7vZQejCCwhvlx9aCKb3oSS3
	Z9v34TBzftP/lTqY1kmx3p9ewGA9zMKE2SAyGLuowCpS5aO2Sccy8FLKMeswaM9qxjZn+8q
	zZ02nfY66fsZ2+75QfQZPpsOEzw6kSKgMSqLx/vsBuT0IHy/JkUOMsvfbkjYsA0nenlfZtS
	Z24LRmYAtJDJK6Y5wJ+IiDCTXHOf2LsH559WgKJNe1zschI6HwMUgv9IGuXIEcf3xl+3JVj
	gDAlBiiY4AkFuCnlwUo7dIhKDfNJqOxPoc/diNyOQQfHDEDaEYmTbwN4So6cJq8lrNjUxuX
	kCFyjda0j6t/x9FaRP2nklsG8B0HtBf9Nzu6zbnObhi7JqTMDownif8IVMAhofI9gg6f9JJ
	jfOM71yzD6YinKH/9502SnNKiNjgRU1kOeg7jrINs/VWjK1jRQ8UAhugKf5IrQWD0ZEEnu2
	BAONvygQcSaqEQaYi7SXXoJamM7eg9ttYgyFHIgi6Z0wlJsOzN1UcZ+3+dOl40JHzVuQSjm
	dHvgGn0asygxLDJNUZCMnsysp+kZl/wEsIxQo5V/zGqNWQ0sjpzd1Wc6/XxV0CZPPdUronl
	cAYk5SaXdymrZ8THDj4XF5EsVfx/aGaZt5cPjmTdWOa0Wfa4PD69YWFW9LByJ9QriPnXUGh
	N0fKmYVDqqIBqBoiMBX0EWx+ffLf6lEJEHYHlaR8fv+tV1SqaldTtm/C8bQW62P/0UghcmV
	LQJSScDWQkN4ckrDGcExzY1+9/R7N5kTsLFigGzxLI+4D0oRcsq+6030Bp5HQaCq9ZGqppm
	t1M0Wpoirlci33+sFsiTaRu6rQvsA14Pv1OejGLH0U6trna8PJwRetH8jBB0uSKJGTPq3zN
	idKsSZ6iRWOfRlFEIQPxoyxI1lDlnYbMSpKt
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On BananaPi F3, usb2_0 is connected to a Type-C connector at device
mode by default. This port have no VBUS supply capability, thus host
mode only works with self-powered device or hub. User could switch the
role in sysfs.

And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
support cellular modules.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886bf6..ce36250e2deb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -383,10 +383,26 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };
 
+&usb2_0 {
+	status = "okay";
+};
+
+&usb2_1 {
+	status = "okay";
+};
+
 &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;

-- 
2.34.1

