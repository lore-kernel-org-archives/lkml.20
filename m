Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758842;
	b=DIQ7KHseIJRm4fwGXIC4L+XdZ8HqgAnkERWncIsj2STbAqNKSSjxLUinETsd74B51vc1
	 1/mGNVaMX8Zl1/rMPcuvRzRj77HujIk71qXWOqnK/B1QznBO+uGXetZLlQ4RPOgkuY6Nk
	 2b85ZPWRfxlJ/ZTmI0ob9mv9TDncC9pgThZO0zVpevFvBmek4DXKuZbSbWmHijRniPxP6
	 AlqBoJaiESc34WZg5Z6tgKBvW7N/a5n2fBhJRlKYMkvEZOCZCCudNAQYjx/0t81Vk1kql
	 QJBkjj66x0hggzjF1g44EcUZISBHSoMhBGAzPh7cNBC0C2cSQpILd/DWVwgBnkMHmig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
	b=Qw2R7youfVyUhY98lUiqVszVCnmEdobFvUq8wjOVn0tI97cNeHZdmrkZ6tT/PKnRsp1n
	 02Cyh+XB8yLh2W1VCX6cyBlMdSaJWQujHLUrfYWYZlu+Tl9vgXCPmLUKifI740Wcgux7G
	 GYEo6o9yVyRxpTjezGVrJ7q+iHTXvP30a0McXWFA0xeMLfjCRMPeR2aHRtZvgD3st1xvH
	 QjSL6tM6b+yU5vrJL5VO+zs84APy1/zZS6Jor9/q4vRqEWyZe+Q0CbbXBKwh1KXLnHDe5
	 LkokKxV2P0uqXRlHwHphOBaH0kCcsNFA7GkGAHdMsdjsjxIb4J8OkibbIvbzjDyPFkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=pMlORL2I;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E8606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=pMlORL2I
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso495780f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792758839; x=1793363639; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
        b=pMlORL2I6+7rhNHqB8En4FG5uhwxzwQF47m2miuC9rrV66FJsPYjqlo7yAdff8y5Rb
         UrvXjKaBs1IuPVfTNGy7PB3il8E5izR3RNho35cXnFxIAM6ZASelIgsLfg0zIU8GanDS
         QOgY6HDQR8mokySp6e9XnUwVOmSlihQNYA5In1E7/vYyOUX1gTaP2e+7CJfmEzHqtpXS
         4hegguegEOf7uVQQHTufUG5dvGf9isXtLLZPooCltDkrlToJxoRwG4vekDuPdDz4GcDe
         0uOYWV+zoJPTkJLEhSM89XwyIKrob6A0opj+zhUd/dAY0B2Sut1taPxfkyLl2GRZSDxF
         mIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758839; x=1793363639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
        b=isjubxn2WF5grIMMEUwm1UjzsecJLvXOMHU3a3bAP1Qm91m0FxwHer4fimj5gCNOmU
         8p+BUrcNp93CXUGn01+Ye01YN12wEbrAU+cyammNRJLN99O84VPgdbZcN/qzaPfIqhxu
         GPzoZg9lijz10PNi/mmpl8K+pq9wwo26Hj3jWUYPvZ9lgz6d7ZU0a6ZYpPpPvAei5PDz
         g52VrilI+OEvfM0eGd42JQtUZF0x1eqicSapriYzCxImpIjLdSQG2N6cNHpsJ4gwdn7p
         swL2yQ+4bqoIb9xbx0itMc73vNdo7GnBUBd1n2Vq7D1x4MaheyJoPiJfoyPose9QiqTI
         Oriw==
X-Forwarded-Encrypted: i=1; AKwUvBx9MR9+vfyLEexr5gI8oDXNnuUaExmS/IFs3FSXejjTbl/oTjaZKMj2EFpFHWETC+PNh/SSljRkqg9z7i0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0MDsANCoSaMn/83XV1XlFvIXh7D5lI1/6OCK8BPLRjMoQpsYw
	I5zBu40jRSYjF3YFVGM6erINmPiLX3u+JOoVmCiaqLwFrIajjcB62U6DpEgkrUyZPEkKh2mJy0B
	ybzlenjM=
X-Gm-Gg: AYBFou3oZS1pdET1hNUm8/4xZNpFbvxHjg5xOqH2I0rVbc8gbBnqcp6Fa3nVncrGstB
	8vfbjY9LqhIv1uFw+eyY3KjKCjW6BMrtVYtwOO+26UEz9BiZXAMBhWLL0RJbT1QSOyBphztke5j
	bj/ceM2tdCU1VFKooZrAAaINf0/2moYctI+BPGa+VIyf73IkQWaTma8sX3+Na9SEMzMHJ6QBP8n
	6Go9ycESWmDr4/BsEYIu5OBxpS/EKYPLeR73NOgbgncMl1HYS8ttdQ1LpGS/2MZT4UkcFl0xM89
	eJt2xmgRF1gcYAp+P6dYbC0/RTtLwU6vjrq9rtoVVRkKcbwxD6lT5MIRX6aop7IjB4zdWRwGfrP
	tMue7Xo1GDhOM3IoSKCYT2x8/IaTkap9pfNrhINk+CcfyattPN9JrXCbrdjYB/4KYTQyDu3RvMb
	L3ptUgxmRwPo3uDE6QTixkSdVMJtt1/Arojd2Z8ILmmP5CMDn6u4bmQg3OyzKTsoHCuJddBwFgS
	8dGzVTiBstkosZTXnIfWmN2k5tRwOUnpCaW1KnnGvoSbDwiL5WO1k4sLDdBv8zo1Wc=
X-Received: by 2002:a05:6000:4288:b0:48d:cda6:4dd7 with SMTP id ffacd0b85a97d-48e385b4621mr3251773f8f.44.1792758839526;
        Fri, 23 Oct 2026 05:33:59 -0700 (PDT)
Received: from [10.221.242.139] ([93.123.20.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edd26dsm5554766f8f.2.2026.10.23.05.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:33:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 23 Oct 2026 18:01:55 +0530
Subject: [PATCH RFC] phy: qcom: snps-femto-v2: clear charger-detection
 state on entry to host mode
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
Message-Id: <20261023-phy-qcom-snps-femto-v2-host-v1-1-77cf6a5177cd@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTvQjhLUreAB3IqLmE7NCE1iJ
 hal9O5GXf6/eDMoZ2GFfTND5klUYqjRrRpw3oYbo/S1gVoyXUtrTP6NDxdH1JAUBx5LxInQRy2
 4cz1treGNMRaqkDIP8vrpZzgdD3D5T31e7+zK14Vl+QAvmyLfhAAAAA==
X-Change-ID: 20261023-phy-qcom-snps-femto-v2-host-9cd28a6e466a
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Elson Serrao <elson.serrao@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792758833; l=4680;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=c//aO+uFRscbScqkNAvaaqbbKqzdZoy9nP9LH9BBuUw=;
 b=277h+fYW2NZCq8zkRo74BKyfkAOx+NVESfzGX0KBZvoRuS2vkofYvCJnTaYvxZi3/dHOkgswY
 Y04w1TMcjHWAe7UVqbc4p+2OsP/gemCutXE9HhiaPolYK099c3tFaUw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On QCM6490 (Fairphone 5), the firmware runs BC1.2 charger detection over
pmic_glink when the phone sinks power from a USB-C dock. It leaves the HS
PHY in UTMI non-driving mode with the datapath override enabled:

  UTMI_CTRL0 (0x3c)    OPMODE = NONDRIVING                 01 -> 09
  CFG0 (0x94)          UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN  00 -> 01
  HS_PHY_CTRL2 (0x64)  USB2_SUSPEND_N_SEL                  06 -> 0e

Linux never writes these fields. They match the configuration the
downstream kernel uses for charger detection (its "dpdm" regulator); the
downstream kernel re-initialises the PHY afterwards. Any femto re-init
clears the state, but on mainline nothing re-inits the PHY after
detection. When the dock then swaps the phone to host role, the
controller cannot drive the bus. The HS chirp fails, the hub enumerates at
full speed, and SET_ADDRESS times out (-62). The state persists into
later sessions until the PHY is re-initialised.

Clear OPMODE and the datapath override when the PHY is set to a host
mode. usb_add_hcd() sets the root hub PHYs to PHY_MODE_USB_HOST_SS before
it starts the host controller, so the clear lands before any port
activity, on every entry to host mode. The clear is idempotent: when dwc3
sets PHY_MODE_USB_HOST again after host init, it finds the fields clean
and writes nothing. On platforms where nothing outside this driver
touches these fields, the function only reads them.

USB2_SUSPEND_N_SEL is left alone: HS works with it set, and clearing it
has not been tested.

Tested on Fairphone 5 (7.0.8-sc7280) with an i-tec USB-C dock: the
unpatched kernel failed every sink attach (15/15) and the control arm of
an A/B on the same image failed 2/2; the patched kernel enumerated HS on
every latched attach (3/3, with DP and charging working), and has been
in daily use since.

[This change was developed by "D.R.racer" (with the help of an LLM), who
 doesn't want to have their legal name referenced. But they agreed on me
 taking the change.]

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I'm mostly sending this to get a feel for whether this would make sense
in the eyes of the maintainers. This does fix an annoying long-standing
issue with USB stopping to work, so I'm hoping to find a way forward to
fix this properly.
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..e2b9404aac4f 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -226,12 +226,48 @@ static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
 	return qcom_snps_hsphy_resume(hsphy);
 }
 
+/*
+ * Charger detection run by firmware (BC1.2 on QCM6490 with pmic_glink) puts the
+ * PHY into UTMI non-driving mode with the datapath override enabled and can
+ * leave it there. The controller then cannot drive the bus, so the HS chirp
+ * fails. Only a PHY re-init clears this, and nothing re-inits the PHY after
+ * detection. Clear the state; this is a no-op unless something outside this
+ * driver set it.
+ */
+static void qcom_snps_hsphy_clear_chg_det(struct qcom_snps_hsphy *hsphy)
+{
+	u32 ctrl0 = readl_relaxed(hsphy->base + USB2_PHY_USB_PHY_UTMI_CTRL0);
+	u32 cfg0 = readl_relaxed(hsphy->base + USB2_PHY_USB_PHY_CFG0);
+
+	if (!(ctrl0 & OPMODE_MASK) && !(cfg0 & UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN))
+		return;
+
+	dev_dbg(&hsphy->phy->dev,
+		"clearing charger-detection state (ctrl0 %#x cfg0 %#x)\n",
+		ctrl0, cfg0);
+
+	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
+				   OPMODE_MASK, OPMODE_NORMAL);
+	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
+				   UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN, 0);
+}
+
 static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
 				    int submode)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
 
 	hsphy->mode = mode;
+
+	/*
+	 * Reached from usb_add_hcd() before the host controller starts.
+	 * phy_initialized only changes in .init/.exit, which phy-core runs
+	 * under phy->mutex, like this callback.
+	 */
+	if (hsphy->phy_initialized &&
+	    (mode == PHY_MODE_USB_HOST || mode == PHY_MODE_USB_HOST_SS))
+		qcom_snps_hsphy_clear_chg_det(hsphy);
+
 	return 0;
 }
 

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-phy-qcom-snps-femto-v2-host-9cd28a6e466a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

