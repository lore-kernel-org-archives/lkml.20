Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618170;
	b=A4gBRq9ye9DcWGwVftTaokz6vKivcUleXdjLJGD+56gRb6Pu+0M04V98AIAPwY1XcxGk
	 kU2WxQoB38v7oB9Fqk8MV+F39e9nus0Fp/aaWaxH5Utn1/EmA2GkUoG8YxYdrROnMYPt9
	 CE9HFMWvGPiOXg6Ow59Zzs7nmAyz2Ilwh9+84ZcIvQAArkBhooJBKiVfchPtA+09oJlyR
	 JLetsUzmK1Wbpgs0sd8lWKRwkPxoDR+1yw60N2lxTzNVOiL/QVTsi1QR6FLJ3D2o5lzxS
	 1/8hletqe01wQHzrJM312ph8PMoxSTRZu4bhNop9m3ODXjgEJwfaHKAO7RUjMVfRhoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618170;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wP0EsqHQjgsrQXbVB1hh1kUixP0fbbetL/gjkhCcYPE=;
	b=RRcq3dpdmlr+1LKxOMOVZ3fHZWAX57WeQsP1i2e8uhqlosK0qMhU5DsqElSMHK+j8Zj2
	 AviACo2m4Wb5nSlnY2wiFPUM+9uFyBYwkZCPSCoqnOm8xdApOOMb9TUajYRSSOtfMSCjd
	 HkdLgersNLq46x0iTjW70/E6tJ0c2i8WoRnrjW0Wl7ukIkDzuPTytKHzZ2WehJjiGZtSb
	 RXABiGVRIIC8Xyl8xpsE3PPRDR46Zd2gaH8+94TQwipLBvOnzk/GF3kg9l4k9W9ise8No
	 494nflPMLhe1arIvfl4hMNdutg7gVLpM17Lz1FqGo3AgIG6uOFKHowSck8u2FX+I16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AlplqCvC;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783F606A8A9;
	Sat, 14 Nov 2026 01:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5783F606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AlplqCvC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=+715V88lFL2xyfiIvg+gLJGYekEgJMm4EkTZJ8soaGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AlplqCvCVYZ+wKgkHcaKLekzMfWssBsPzzB+J6czVg36oGtc/fvBAmMs+RNiXqIAY
	 iBi1SdwZZ/tQTzaTkKfbl7FGzOsa1wHaBaUuSN69Gf0gEfLknjNIpBkmYDU9Z0tthp
	 PT/2IdbuhWy+pzpNR05wMa4k22yx/bDNE5X4rpYmu/Lo/Fc/BxMjtMrM1iBz5RtGFw
	 GRZtMOLCLTfYo0ZxY84P/21rNA+rQ7TyaR/QezsnBix7YIF3g9BW/HFOonMpxiPZGd
	 eGsdEQB6WktdqQkyIalp/0dea2hssS1PqYknA5sB4K4inQuVLY6Ang2+56hEjiO7ZG
	 zKCI6sCd/XhJw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C40317E12E0;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C80BA480038; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:04 +0100
Subject: [PATCH v19 5/6] usb: dwc3: core: only access GUSB3PIPECTL under
 lock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-5-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3324;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+715V88lFL2xyfiIvg+gLJGYekEgJMm4EkTZJ8soaGg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szU8b8wImR7sGB0lNz/TIcOHZLsFi48Bu
 vFbb7/2iq4uI4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qa1OYP/jRTmHZFSym5VDKOx8YKpWAhMLcRWb9DiUQcLE12MX7yuy8IOP5s2/01QT+eLZ5fs+8
 p4Raimdcn7+P293+SIBn/27k56TTUB0MlNzwxAvrqFOjR0h4wuDFbFDcGW+q433waAHSYomGoy6
 xHt7WH5HFRpTW7g/xkwYk6ONWps31E5mD8OA0T7ICPh1XsN6bR0XW1h9Amd5sKZ1lLk2zebtJ33
 3Tps1etGlBNZeV2TPqylSZFJkg60Pk5KthcJXppmhskfJXZRkNqKAhXwrLtwVRrJ+kvQuGxDxGh
 bHg5a5/DrkG6F6W95XqgauDywGE2BZY6nclFrsZ8cnx0F9uI0nY8haNpcWZ7TSGyYSZJHu6/NVj
 IxK72JHjoyX6G5iuaBEvgeA39rjoO7aoNpIywsHtO2Ycp8TlnK1tln53/5tUuqEogtx1XO460ae
 NB8/C/jNLeoKOC9YDuw4ZUVYR1gtquzUUBlDemi6BnY5pQB/9iQc5qaL6XgFONRVYcwu25DJIcN
 tbP8Wk8lOdhdUrrM6pDBpvoMJDaUtHuswrSYL9np2tk48Vg8HSzITs3Amfs8DUkfWfPtKGVD/Hs
 wNWP4GsVuiv2hynIysUTq4H0xONT7pHZBDcT+5JCen44seE+UY46y5Qc842/lRAe2M7slScqC9k
 WBRnzlpDVySUWg1SKUCsx0g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Update dwc3_enable_susphy() to take dwc->lock while updating
GUSB3PIPECTL to protect the read-modify-write cycle from other users
accessing the same register, which is soon introduced.

Note: technically there is already dwc3_ss_phy_setup() as a second user,
but it runs and finishes before any call to dwc3_enable_susphy() should
happen.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 19 +++++++++++++++----
 drivers/usb/dwc3/glue.h |  2 +-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index daf5aec07fbf..0cb1b33a7c98 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -108,11 +108,13 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 	return 0;
 }
 
-void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
+static void __dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 {
 	u32 reg;
 	int i;
 
+	lockdep_assert_held(&dwc->lock);
+
 	for (i = 0; i < dwc->num_usb3_ports; i++) {
 		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
 		if (enable && !dwc->dis_u3_susphy_quirk)
@@ -133,6 +135,13 @@ void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 		dwc3_writel(dwc, DWC3_GUSB2PHYCFG(i), reg);
 	}
 }
+
+void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
+{
+	guard(spinlock_irqsave)(&dwc->lock);
+
+	__dwc3_enable_susphy(dwc, enable);
+}
 EXPORT_SYMBOL_GPL(dwc3_enable_susphy);
 
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
@@ -150,7 +159,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
 	if (hw_mode == DWC3_GHWPARAMS0_MODE_DRD && !ignore_susphy) {
 		if (DWC3_GCTL_PRTCAP(reg) != mode)
-			dwc3_enable_susphy(dwc, false);
+			__dwc3_enable_susphy(dwc, false);
 	}
 
 	reg &= ~(DWC3_GCTL_PRTCAPDIR(DWC3_GCTL_PRTCAP_OTG));
@@ -1624,7 +1633,8 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 
 	switch (dwc->dr_mode) {
 	case USB_DR_MODE_PERIPHERAL:
-		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE, false);
+		scoped_guard(spinlock_irqsave, &dwc->lock)
+			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE, false);
 
 		if (dwc->usb2_phy)
 			otg_set_vbus(dwc->usb2_phy->otg, false);
@@ -1636,7 +1646,8 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 			return dev_err_probe(dev, ret, "failed to initialize gadget\n");
 		break;
 	case USB_DR_MODE_HOST:
-		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST, false);
+		scoped_guard(spinlock_irqsave, &dwc->lock)
+			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST, false);
 
 		if (dwc->usb2_phy)
 			otg_set_vbus(dwc->usb2_phy->otg, true);
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..3287ec44f634 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -172,7 +172,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc);
  * This is usually handled by the dwc3 core code and should only be used
  * when skip_core_init_mode is used and the glue layer needs to manage SUSPHY
  * settings itself, e.g., due to platform-specific requirements during mode
- * switches.
+ * switches. It takes dwc->lock internally.
  */
 void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
 

-- 
2.53.0

