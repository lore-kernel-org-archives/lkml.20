Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36193B8D4A;
	Tue,  6 Oct 2026 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286230; cv=none; b=OOKZ5cQvqOQP6RmcrIvgA3VqZ7luUwxreHU10xmA7UKLU4noTi8fH+I0OuQqnkuduTvdArcgc/4qXzOCxyve0MLa/eU1s7zXALlWMOLPudfLoo+vdRLigZrgUVjFsL7oDFtduhi7D3e9xHjTmFZkDmYsi/m3HI38KxahvITrUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286230; c=relaxed/simple;
	bh=clw/mYYJ7/5ar0llSvUgRQ7lTfF95zJMRXRTEOGtP0Y=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=A5fCYYMfkbY+QPh1gBRu5c+gpPb6THZxdL8ytrW1C/VmpI2xsEI/KHOj+f4zEcMfc0Nw+mD02rGEM9ULfwyzYYzm/oHtA4ezp5TiTbEWbyM3Ekz9aDpA6GdioWEvKUF/k1z3bTJETmp14X0og5N7TLeZlmGg859q37uaymWoWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mdfH7h30; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mdfH7h30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791286219; bh=kVx5sCTnm96q47gYQvIJ4STQnqWmYPoS80LM3gm9rdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mdfH7h300ksdAnss6igKM+nC2EzDc0zyX4PnN74PIyZsUkVfCKiD5Pdn9ou7Rcqyh
	 BCO8EJ4s+qY3zyY8wINcTdBJsLcBLleyLdCvrUsIGYFtqf7fFetbRx4atCTuka1LvV
	 hu1xfKLsEmTijAH34++aBvoRjz7cZPYSevM12SKY=
Received: from Amphoreus ([219.130.186.218])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 788B9EBB; Tue, 06 Oct 2026 19:30:08 +0800
X-QQ-mid: xmsmtpt1791286214tefm4xbz0
Message-ID: <tencent_DB7D53C376BBFA9CB0F63ED6E7FE56C6B906@qq.com>
X-QQ-XMAILINFO: MapnONytPuzikYTQTd48/EiaR1yFSBj41nAQLZnkA57MyKsugoWmjXlU9IAgAX
	 xUhy8hUouw6SHp2jodpoxsfCFcBBzYzPuiupKev6kcwW2GQCv9vFf3UdUsapxPO9MXL5yxWBYHrW
	 c1D1vHbo3aZ0KL29yiMgdz7jcvMPbyiwxhpIHaXHcstAeTbRQA/3egWQFzdlB1GXoECzZZuGsEst
	 YhpOC+PCJN1T4QL//8Gzk/3VJvnUNCXAGkbMOFpgs6G6EuoHdxpoUwychU44GzK1vTu05ujnMnja
	 cH+DI28PED7/YtEFCEJ43Ug5RF5I0xIGwu2ZUQdqzCcx7iSoXGuXdQVcua7vTmRXnJJPy41BJZ4V
	 Oep+rF86mIZnCb7hmOzaVLy0SR8dPgdtDzEZwbP2WmCCbWuCALpbRtB/TAtU6OtAZrrHuUuLES5d
	 8G7LCzp93eHFUTTseaEQuTWtLnRTaDprTgQkwNabTN3WnoiD19cchWIZQqwrckfdAQ/xcXFjWSL5
	 xGT3TdfRw4yfMshWwH5VNmUwWkuOyfs8wuXgbfM1TPKM/eTKRC8uf8faKF/cOboC3yVK/m6lBJK+
	 dnTxDmHZO8MVTO38NqeXluyHu+3IjXPNZGRs3jrnEiDvzTteMXq9xFKphK50EOapzGqHiaULepA0
	 4aHEixM7mcqAHH3TmRXm3dGaVO+UZb0YRs/iVbElOabkGaMgrkhwreq2lYNk/qR9AelGNbhHjVS9
	 Y1rQ4TbRn4SAM472P8cSPk1KRHGZvF/Sb1nxj7ZqAAwWBE3ylekeqamiG+sarDxQ+OpF7cwjPO9N
	 OlVflQRxCTKrnWxlA71dqMgHAzMn50KQps9HuZ5xgrDWOlVCNBOH/tJwEXDWVY/ITS2rmF+cHGgH
	 CziGN2vfjP4nxTNexFydiD7aYFDyM+sbJe8IuVSkJfNVRLuXN9OZFbs9lFDc8phP9OQpOVZXqbtY
	 rktOZ0YR5sQCkURn32HMPT6Ecslv3aog9baHJUOszULzv2wvmcpYuCJV6qJHRpI/rq77bAYWSpLf
	 QXw1Ceyg6r4HzosjvMSxEkeW112Ku1ShGAEaJy/SwhmM8RzZkKtTTZKXXfJF/WQdH+HXTT1KWQGA
	 iwMUhi
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Raiden Lumine <2557597107@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ovidiu.panait.oss@gmail.com,
	jacobsfeder@gmail.com,
	Raiden Lumine <2557597107@qq.com>
Subject: [PATCH 2/2] staging: axis-fifo: remove obsolete text binding
Date: Tue,  6 Oct 2026 19:29:55 +0800
X-OQ-MSGID: <20261006112955.208744-2-2557597107@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006112955.208744-1-2557597107@qq.com>
References: <20261006112955.208744-1-2557597107@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding is now documented in
Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml, so the
free-form text version in the driver directory is no longer needed.

Signed-off-by: Raiden Lumine <2557597107@qq.com>
---
 drivers/staging/axis-fifo/axis-fifo.txt | 96 -------------------------
 1 file changed, 96 deletions(-)
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

diff --git a/drivers/staging/axis-fifo/axis-fifo.txt b/drivers/staging/axis-fifo/axis-fifo.txt
deleted file mode 100644
index 413b81a53202..000000000000
--- a/drivers/staging/axis-fifo/axis-fifo.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Xilinx AXI-Stream FIFO v4.1 IP core
-
-This IP core has read and write AXI-Stream FIFOs, the contents of which can
-be accessed from the AXI4 memory-mapped interface. This is useful for
-transferring data from a processor into the FPGA fabric. The driver creates
-a character device that can be read/written to with standard
-open/read/write/close.
-
-See Xilinx PG080 document for IP details.
-
-Currently supports only store-forward mode with a 32-bit
-AXI4-Lite interface. DOES NOT support:
-	- cut-through mode
-	- AXI4 (non-lite)
-
-Required properties:
-- compatible: Should be one of:
-    "xlnx,axi-fifo-mm-s-4.1"
-    "xlnx,axi-fifo-mm-s-4.2"
-    "xlnx,axi-fifo-mm-s-4.3"
-- interrupt-names: Should be "interrupt"
-- interrupt-parent: Should be <&intc>
-- interrupts: Should contain interrupts lines.
-- reg: Should contain registers location and length.
-- xlnx,axi-str-rxd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-rxd-tdata-width: Should be <0x20>
-- xlnx,axi-str-txc-protocol: Should be "XIL_AXI_STREAM_ETH_CTRL"
-- xlnx,axi-str-txc-tdata-width: Should be <0x20>
-- xlnx,axi-str-txd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-txd-tdata-width: Should be <0x20>
-- xlnx,axis-tdest-width: AXI-Stream TDEST width (ignored by the driver)
-- xlnx,axis-tid-width: AXI-Stream TID width (ignored by the driver)
-- xlnx,axis-tuser-width: AXI-Stream TUSER width (ignored by the driver)
-- xlnx,data-interface-type: Should be <0x0> (ignored by the driver)
-- xlnx,has-axis-tdest: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tid: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tkeep: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tstrb: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tuser: Should be <0x0> (this feature isn't supported)
-- xlnx,rx-fifo-depth: Depth of RX FIFO in words
-- xlnx,rx-fifo-pe-threshold: RX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,rx-fifo-pf-threshold: RX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,s-axi-id-width: Should be <0x4> (ignored by the driver)
-- xlnx,s-axi4-data-width: Should be <0x20> (ignored by the driver)
-- xlnx,select-xpm: Should be <0x0> (ignored by the driver)
-- xlnx,tx-fifo-depth: Depth of TX FIFO in words
-- xlnx,tx-fifo-pe-threshold: TX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,tx-fifo-pf-threshold: TX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,use-rx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-rx-data: <0x1> if RX FIFO is enabled, <0x0> otherwise
-- xlnx,use-tx-ctrl: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-data: <0x1> if TX FIFO is enabled, <0x0> otherwise
-
-Example:
-
-axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
-	compatible = "xlnx,axi-fifo-mm-s-4.1";
-	interrupt-names = "interrupt";
-	interrupt-parent = <&intc>;
-	interrupts = <0 29 4>;
-	reg = <0x43c00000 0x10000>;
-	xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-rxd-tdata-width = <0x20>;
-	xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
-	xlnx,axi-str-txc-tdata-width = <0x20>;
-	xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-txd-tdata-width = <0x20>;
-	xlnx,axis-tdest-width = <0x4>;
-	xlnx,axis-tid-width = <0x4>;
-	xlnx,axis-tuser-width = <0x4>;
-	xlnx,data-interface-type = <0x0>;
-	xlnx,has-axis-tdest = <0x0>;
-	xlnx,has-axis-tid = <0x0>;
-	xlnx,has-axis-tkeep = <0x0>;
-	xlnx,has-axis-tstrb = <0x0>;
-	xlnx,has-axis-tuser = <0x0>;
-	xlnx,rx-fifo-depth = <0x200>;
-	xlnx,rx-fifo-pe-threshold = <0x2>;
-	xlnx,rx-fifo-pf-threshold = <0x1fb>;
-	xlnx,s-axi-id-width = <0x4>;
-	xlnx,s-axi4-data-width = <0x20>;
-	xlnx,select-xpm = <0x0>;
-	xlnx,tx-fifo-depth = <0x8000>;
-	xlnx,tx-fifo-pe-threshold = <0x200>;
-	xlnx,tx-fifo-pf-threshold = <0x7ffb>;
-	xlnx,use-rx-cut-through = <0x0>;
-	xlnx,use-rx-data = <0x0>;
-	xlnx,use-tx-ctrl = <0x0>;
-	xlnx,use-tx-cut-through = <0x0>;
-	xlnx,use-tx-data = <0x1>;
-};
-- 
2.55.0

