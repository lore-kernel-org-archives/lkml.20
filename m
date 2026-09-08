Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2524EBAE8;
	Tue,  8 Sep 2026 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861009; cv=none; b=iESnYFbdZ7aYNhOQC7gm9Y4MJpguAy+8xslJNxbaCkhGg0XVKhl+hTb27UL5q8SgF1m0M6SJZONfW8cJi1kTz2OivEt9UYc8dee39o/8sxTUkbkiF8JPTSclO5vNLa+bR6CTz2sGvgte7vjeRfpiLl6p26Oy8eiv+oA/YLWdTk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861009; c=relaxed/simple;
	bh=Dk03C1Ofq1DHFOFMa+0x/K/3hWeLs2f+OrehTQUIJU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+/Ofjwg5FA7Ok6i/znhL0pv2bC4WPn5vfgHzHR0exuMlmpZ+HMm7L9p1/kXL8y957u2c9l4lOpBDTT+xQRh+gkJbIGXX8v2NdGww26h+ycZZMMzHVTsfCWWYau9IXKTkXlaE7kICDAXVGpP26163KjDnDPUYUjiPYc5BLobLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=x/UYs/IJ; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="x/UYs/IJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860952;
	bh=I+Vu7fTqPDS7uHl1O5LjwEVmP9LuWPbD3w6IaB+q1tg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=x/UYs/IJ7j1KiMYGON+8/Q1RkbD3mWTc7ZaKnD9dFjlXn5NBtotEhF6nHVFo/bAwE
	 K/FlVZmRhj/iyKbdspJHgIdiGaxj3ou2NuOK8Msr7QqInD8Fkn1eCMP2Lpaf0g/lNl
	 EDzowgSyk/7GpsiaF8k8irrBDpNQzpLJ9NbuRW9o=
X-QQ-mid: zesmtpgz5t1788860946t3bb411f3
X-QQ-Originating-IP: UPsFbPPKTvUV/JKdVFRKrciHZNpUy3cUzD8ChJOoVIo=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:49:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8338871879744466596
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:44 +0800
Subject: [PATCH v2 7/9] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-7-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1150;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=Dk03C1Ofq1DHFOFMa+0x/K/3hWeLs2f+OrehTQUIJU8=;
 b=XJsgp0QA2Yl6QC+Laa4zgll9PbvBXv7T4SioUrFdB4EpemAkrRk7ug4yWss6YSv4MsEpd08gg
 MnPGiullYNqBJzOVtDugRF7gFN0yA4tEILM38INSuU7EaJqSqV2e8NQ
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OIAhyvcErFZXgJ5Lz5nEBiq+vBkT5pmwffoZYJBjj9irusbZRIdcJnHh
	PI0Ls9b2I5PeQMN6rtGegcFsOzrwV03LMXUutUV0vrTu7Njtqd8NjieIatBnw3RpTnw1BHL
	LTOyeb9crWYUtebWQq5iqC3ZX8TeT/UbJCPzCSRig5XAmbIzgCwuVS1vqp7pHu0ywnRFPsZ
	uSDKnuXI12jmkzhVi/kfC3o9RDF8tJOG6KLbRAPoyLTp3FSxQkr/KM43Qv3TIoTpWrJq6OO
	BnBt81f5i9jsx0Ii/zfW85TMj3QoEqJBOyk8nEYyzaQlgrwc5UY44xCiB7IXYzqVqwf4KHc
	pO7bt7OjicI4cfZ2IFgtV8VbM79QmOFaIxM1taIvqzarzdT3knHKaC/JaWlrMr4M1qNZO6h
	vXYz8BQu5yOTZPjEN8ew3Z9elZqVPGq1WweC5A3E5u/hMKs/x+9LhOGE7fL5wHjhoJRbcj+
	mu1Q/uzPfydNxUJqEhvtvhbRNqeR0ENbpg1CC4D+0j653pbM0TFEpeGRM4mo4B6vuQAvzEz
	Tkzq+iBwYi037YAgzka3YEWhSYGL2X3px24FzMw93Ly5yuEzGkfqwLOujQ3Mmy3ELgXhOc7
	eFqE5v4S6u2+YquKA+Jxswg5D0PxU/JojMWeEPx1huRmqvtKZxZk/kGVw55QVbNl4neItNK
	oJIqHmv/l2GkRS2fFkgZ5xKeEly59uaYjt936yLwnu9liHjJODCZ7eJ6cXm/ZIsHmtAqiEU
	6k46XbQardFj0QyWncLib8CiNoYuyIUfnZdWkFYVNq5mCusUDzaf2bmAEs+4WeSdSR9f2yy
	td3RkJz7h9OKtaUdHDj+WJ5IJWVta8Mx0WBjnW0YsNBESlrHemJFRTuFtIpu0NaN2DUCKr6
	ee+grCHl+jan+2EuRkuS+UH/lQQoT1djoXFuFWBEJ/j1QrUQ7Hezp3ziP0NpG3jTVxZo2Jq
	EzxeHDzxRafatgI6k3j3w3kFWwUfd/HDd5tpNHn8c2BUZdSz9mTQKfxrSVlaOFZU9gM4ql8
	prrLw0RHsoAqtmR0MyZXk9zBsK3htMc/JejpmB/V+Iy/KPF67pPQmLfVy3TA2WiTC7FydBM
	kBByM5a440Sh86QaFijRraKqreZcN5isiy+BX8pcWPMAM/ZZO3aJ7pWUfQTKO5sTL9LFEy/
	Tn11lsmTLz7HHdNIvq6tg7uaH0qJef55bLMdeHZqByvRHHo=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On BananaPi F3, usb2_0 is connected to a Type-C connector at device
mode by default. This port have no VBUS supply capability, thus host
mode only works with self-powered device or hub. User could switch the
role in sysfs.

And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
support cellular modules.

Tested-by: Ze Huang <huang.ze@linux.dev>
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

