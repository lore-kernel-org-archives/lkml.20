Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE164CDA2B;
	Tue, 15 Sep 2026 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499031; cv=none; b=kRyFKGiShfRiaZzoa8UGpuBLxoigEKqX4wDZMVmToF59iccuvw3SBspE3a2PFvMbbuMVgh4ZNR5wDeLsUljxaT4NMJX2tiRMvtDUDqFLS6TRnBNP68GCSWRuVULp4KYn7BMine1tPn/11Rlydw55T/ABILjRJFC0ixTaYovjkcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499031; c=relaxed/simple;
	bh=y5SNs7l/jk8bTIzMt7jraNin7ZHE/LSfpe4FJ5n2R3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OuxqTmdGT2YL7lbJ7D/vPg1d55YcuPvR9wvRBScRUTu8f8CYjIGbOvAlOZY38U63y+fO1e6HHxw41PpNnRUQ/Xuey9WbWB6GxSwk8D+ccRWhYFjHy4aq5mxoh0a8iEdeyy9jo/3ritebIcIWqBUH+lPJZXHOoZXZH9+slVNE9s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQ9Tu7pI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQ9Tu7pI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0817E1F000FF;
	Tue, 15 Sep 2026 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499029;
	bh=5KxryMeb1Ocmy+M7IHksKF/pxc5lZK+dtCBc5bjMoRs=;
	h=From:Date:Subject:To:Cc;
	b=WQ9Tu7pIIAVOBAe9HTFXADX658FhyPMIhWXpvDxTTQyYyauiDI7KCo2yrNVjoajJd
	 GWnb4niovwyoHCooPN4GcrkvRDbEYMNqqO6VhRsLlwNtj6VPeSqVT4lVkq7DeKix4F
	 1uG2Ao4w8rNlJ2Qn0lBDQhNERhcVGKWoUtiDffn7iO5fXQex3UlRMmY50MYTiTKTOn
	 L63ym4A9Ch1FBKAlIrkCDtYgIufqUpUIeR5a7m3btpR//J9+M8YafjybQnHnal9tUQ
	 9uS14OfZ27PC3oauQW5LvOpC5f9uw3JhvQNQMM6p1FbnEiXB9e4OIMfGYXnNVMNErE
	 GK+4ak9c8/hWg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 15 Sep 2026 21:03:43 +0200
Subject: [PATCH] usb: dwc3: Resend full Data Packet for non-compliant
 USB3.1 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-topic-usb3_tunneling_fixup-v1-1-61264d3103cb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqDMAxA0V+RPK9Qlanbr4whNkaXMWJp2iGI/
 75OHw8X7gZKgUnhXmwQ6MvKi2SUlwLwNchMhsdsqGzV2Ft5NXHxjCapq/uYROjDMvcTr8mbDu3
 k2ppGwg7ywAfK4Zg/nqc1uTdh/B9h338+K9u0fgAAAA==
X-Change-ID: 20260915-topic-usb3_tunneling_fixup-8c0fb73edec8
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789499026; l=1673;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yRf08SWLCsUErE4YnN8eGaODSaD5BjV4YbjOkIZeuso=;
 b=S6oUfucIfVrw0gauW92A65KZQJKqgGnetD6KbicnjNjaMhPCMtrsSrQBsVrqiQu+UneqV30m2
 xpDDlgDpLVOAZ31o40tVxrvBpcLyOfmVaPoa1xKf/weSxhYyUO4TxkS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some non-compliant devices require that a full Data Packet (and not
only the header) is resent upon LBAD. One such device is the USB3
protocol adapter within the Qualcomm USB4 router.

DWC3 has a toggle to enable that behavior within LLINKDBGCTRL, use it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 8 ++++++++
 drivers/usb/dwc3/core.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..d375ebee297b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1514,6 +1514,14 @@ int dwc3_core_init(struct dwc3 *dwc)
 		}
 	}
 
+	if (DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32)) {
+		for (int i = 0; i < dwc->num_usb3_ports; i++) {
+			reg = dwc3_readl(dwc, DWC3_LLINKDBGCTRL(i));
+			reg |= DWC3_LLINKDBGCTRL_RETRY_DP;
+			dwc3_writel(dwc, DWC3_LLINKDBGCTRL(i), reg);
+		}
+	}
+
 	/*
 	 * STAR 9001346572: This issue affects DWC_usb31 versions 1.80a and
 	 * prior. When an active endpoint not currently cached in the host
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..6af644a9672d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -180,6 +180,8 @@
 #define DWC3_OSTS		0xcc10
 
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
+#define DWC3_LLINKDBGCTRL(n)	(0xd058 + ((n) * 0x80))
+#define DWC3_LLINKDBGCTRL_RETRY_DP	BIT(31)
 
 /* Bit fields */
 

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-topic-usb3_tunneling_fixup-8c0fb73edec8

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

