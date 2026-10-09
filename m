Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60313484237;
	Fri,  9 Oct 2026 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531114; cv=none; b=KBqJScv7tGRwEPh864WZwMJRRhEV3WFHFPypfpDn91fypaNljSliIFcisQOLAxjGAUbDIGPQPcL08U4t+hcc+s5KlWWCGJhBFx1m0dLwUloUu606NL0rMoQvMUiG36EfH+0V94eGcugUg/7xi16gEd++XvDz2Q3bnRvGvSuPfss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531114; c=relaxed/simple;
	bh=1INXjO+Im/ugaM5JZKucTtKwbca9TtSPK6qmT5NUkkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWfcaO4P1Wkb2w0w/MVg5QRVewtxEQHIZltUEnqBiP1Z76MLTczpU5p9rfo7o6ECyZde0g09RWxALSPtYKwV/smd50UmzYwlWz/fOzxZXBB7NQdT6FZH0efOCZYHaM+iKYE7ejPpj4V1L4Yb5jxTQYewdxTcdWXNYPwHgxO6do4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=XUE2difh; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="XUE2difh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531052;
	bh=CQs8yOC4qlgYdYPEE/Hd5eDHwv6uNPSMlM13mTV36EU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=XUE2difhMHCWOiuM+vEAFUl7wdNWq5BVxrVZ5OStLJ0ZBMrnh+347yoDh5diH+nnl
	 BMpd77+6bPvDoqB0DdFlA1I/kekAgbqQ0VbCN7MKqfZspXxrQVFh1JfeFc+ZAS0HzQ
	 UpWB2E1yz3AONX4COYmobIIS/gs3+81TcnUW5Wrg=
X-QQ-mid: esmtpgz13t1791531047td09899d5
X-QQ-Originating-IP: oc4aqgHAGoQrYmTKRGvNlS6HNYUkO7px2SbfHnHElV4=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2933657333901942551
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:29 +0800
Subject: [PATCH v4 6/8] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-6-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
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
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1213;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=1INXjO+Im/ugaM5JZKucTtKwbca9TtSPK6qmT5NUkkM=;
 b=6Lo/3SXGkDR6TVwcz7/maESO/59EH+Pl4g1NkW+NbYLPKuy6X+Q9VAjy4s/RUxbqTdXk29ume
 NTHzBAK7RmpC5IFJXId+US/AS8d03zOAfhewG01Vr4B8/FvxrOmZ4sQ
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OfjNCJN4ic/p4WeznRKJLF/x+HNF5p4qO0vRawyNndec8nqlkUcZQJJJ
	G+kLXi5ldIThOvrFvFvoeYmWFKZBowiSpi7plIvrjLTTMFixiIjPVEX3ahuF/DOSicFdKzn
	jMGsCq3KTNE58pw2FoAIXP55MR7q9rKuAlaGiv/nTDz1MZhu+SSW0cG5AFnTa1INLR6wmMd
	3etexNKNQOBBKL9YtHU2wXb/GI/cKRS2cAmSGSNxRaD67Ar7+x96q4+r+50mvkrScpjREbJ
	IJhqJCshuE66z43OVLs875tcE9D/esW1z83YrZzEbt9PbWz9V1oTzMi4iovXtAyxqaC85M2
	LqS0hP/K/4LlXOmYDUjmMZwwTKzjfD2fojU4INC58VDdTqyOE84jKlU57aywfrdAVBPNtsn
	y5hBMD2Gjh8UDk1ezGI7nkOUPA6sFnbvb2p4N/5/tBFBB9f8qqOZuP5bwOe2VndmYir+8Vp
	b+TPbALGMnN6FpOJ33Revo136Zxd8Nm7K7W36L5DPQDHFF3Tq8ASJ6cz2Z8bku4M78hef9l
	zEEvHZHShPXA70m8dbapMA1bVb64r+pRve4qY22Cj7RyQHezjRCvfWdvQ3gqA2x9R1yo5Oe
	dws2MZiivCdwlgS+oZ2k09T2xJHLktLmxBI8X3ZDVWDFh/+R8k99wvhetsV3QP/knzDefFM
	q6pFDVm/JYe31che+0go+UnTmDkJMNWgJxdCJd1DBbOD2ykaSFAC7TN8LVXg+9rIwtlSEmn
	PAdIRR9yX99EoUdoTOPzKy5rDah/SEJQMCKZizKwGmKLVsJgKXHBy8Gv3oHJwfQFPHpcNHj
	6tnYShDCTL5Z766Em0MUapwVA2T241rIpcpAjZuc6/oviU01V3Mo3RIrb3eXDACgeT8LDeG
	iV91bBAaz6tnpEYDJOuF4+GTdSuVq9YL+u2x06Jjle3pEzwpkKfANlG4nM28rK6ntkCnF19
	VJ5G/hk/p366HHIr51waHsfUsosaq38qIRqQFeReik1Xm5C27f0R53ZRt7Gh0fgc5MHTr+v
	oDP3tTUKUxNmDXlA/60+Mt1YaCQxYAKWeV5/3Eck/eCC1iXm6e/QeMpzamqamzazFDVQmNT
	xPQAzKWa12b+5oi8mkSUaRQzvT7sE1vRcBTaMTnpu6GDNkQsb9gyoM=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On BananaPi F3, usb2_0 is connected to a Type-C connector at device
mode by default. This port have no VBUS supply capability, thus host
mode only works with self-powered device or hub. User could switch the
role in sysfs.

And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
support cellular modules.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
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

