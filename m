Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95B3E4115
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318251; cv=none; b=Gjhgy0DWqjfHsQUoncHnwaCBEKFtOCAH6KBfs3INPXIYgZ/ddT5u+5q+U1GOTGlKWjt3ifH/8U38FAGVZsEgj0y6dpe1RRMzTrPzBR5/RB/x9orEHhFpWQmr1j9t5r/4ZTvAf7CipxcV0WcHaKNmREMUDEDrD+ofXbZuH550NA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318251; c=relaxed/simple;
	bh=gHKcr2g4I0d5u90Rdi6RZ0iLgXiTUXVdMNMBQaoNWK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6aNqRB5c1EEeoBYWZhpnEIiQ6QAxm7V1B8NA1kdYAg94Sm3JLlME/1JBZDpiwSXAegfNRyYJaHLeo6v2EJwB26YqmgnilUZefISjtqEeUIBRoliMswJ9Z0ECSMOpqNYbfuiKKuxUa7koHgqQk+oAoRpJOcxe2xyG27aCHwzIFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY5bYadG; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY5bYadG"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so664688a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791318249; x=1791923049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+gSUQMIpsKIXX7t+u9My6lMpgjE9k9aEX93YTXgwoM=;
        b=BY5bYadGZhbK9aZbn7AlXCkr1tbNos+U2bwAgoJhCzr5Mrc91HxWrxBgL3pEZV0UFl
         TSHeHeXtNZ75A9LNl+7a/MM1xm1/p9ZrkVQkg5ExlnixG+6QhQ/VShovEvVjTM27/5hW
         MSliZztVlvAo24tDzxKN1qtND7EPonQF7U7tLmr3Qyv4xmNboEvKBNzaY1Ge2kYTfYFc
         PJVKBvqSPVO0cHhQEC0M6OwbZ/d+PVrOWpVGdXdYdV2gYxdZn0h4caNRXijGgm24WcJs
         QAlyEjjEg082IEHR3J+U3QeRz2y0DlMOneuozSG+XbEybibsx1hmSgN7CGdiY5lLvy+c
         r1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318249; x=1791923049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+gSUQMIpsKIXX7t+u9My6lMpgjE9k9aEX93YTXgwoM=;
        b=QVvfgMYh41ytZscuFnAQZdTRbfFTxzJx+zh+hPLl3mES7YquoBwrE37i3LbWvKsgki
         vncwgZ3gs1pSQtPUSYDF9/d505z6XTxTyDgZat8wqicbJ4U+VhYa83MryUZRc8rzmURs
         JkUXiGf1ffTUPrxxP4sc976hpZwPKuxRngnhI7fDzA+66FOuqn0JDQGVsPyefOoH8JbX
         zGZOqGJPHwZgEeE7LedZzdm5IztLvesrb32A/hSXDNqLsEPlCaWKOeGBKBB7+P+3102x
         rLVjfWw7Fs8jIVN4jSiGJqpqLDGL2Qxgp0KL3nnITqYm61CP00aVI7Vpw3Zwp+WF14iF
         ZfoA==
X-Forwarded-Encrypted: i=1; AKwUvByxgMiPwSOE2X/VZNG0hshUEDjw2FZU0E9vkCrSY4CEsex/rDqi/aHOoOBeZhED05FxumsNbWBgssv7/3c=@vger.kernel.org
X-Gm-Message-State: AFuF++m3EGT2c5iU2i811nD+3m2sgEDDUC7pGMEBhDTbAky7+Y0e3qcB
	G3X0o5FXxhYVP5SDNkOoilh1DCgdF/yJ0qE1yuyeTnVuu0HvD+AEuLt6
X-Gm-Gg: AYBFou2AUAyYgWEUAwbuZPkaYmXggaO2gy3xGpnVE43FQwlSqBl+rQE8kGvrb6cOjUJ
	nocCyzaPowJ5TKQHdfaIMiLnAnz5ZRqLVvuNtdNtHU1XB2vGp+8xXuV63mjs0EsCyMgYoNPmkBj
	9ON1DPjai4OkzZVLG7JqKnVjTIaG/hyf3HAyd+a+mGJlhHqjoy805Ztqak9WUI5mkWwuEkzSfKq
	D1TgMMNCYCtpVwL2M4qAJ484yTpLpOSEoBoN9IVg2AK4tjTCWL/MZsHkMZfLcG8dwM2pmeUOTXz
	xaCmUcMYzedoHzHBWDozNSkSR/864sMk+jIA34cz9AvmIo+tNHr772FPK9Lx+JK25Qc6gREOKnK
	s0nGkE79unz7dgGQJMUz3xIFCSOyB0GWovrx1X958Ah5R/o16oIEUwJoLQICAb/cVX3vmDbcHIy
	aHQ84wP/KRzDAwnoIW1cAhtUqMehqE7spcBQl+jRxzjRReQHmMCxxgi2xpDCInJBD3GrZOXhBFV
	f5q0bZsCWpDnYy4C+/ttGJ3Tw==
X-Received: by 2002:a05:6a21:608a:b0:3e0:651a:d13b with SMTP id adf61e73a8af0-3e1340625aamr136583637.17.1791318248756;
        Tue, 06 Oct 2026 13:24:08 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92da735sm383218a12.17.2026.10.06.13.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:24:07 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank <Frank.Sae@motor-comm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: phy: motorcomm: Add cable test support for internal YT861x PHYs
Date: Wed,  7 Oct 2026 04:23:48 +0800
Message-ID: <20261006202352.1616626-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006202352.1616626-1-mmyangfl@gmail.com>
References: <20261006202352.1616626-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TDR cable test support for the internal YT861x PHYs, reporting the
per-pair result and the fault length.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/phy/motorcomm.c | 113 ++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 3ebd911f4400..2a7af80d7845 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
+#include <linux/ethtool_netlink.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/phy.h>
@@ -300,6 +301,19 @@
 #define YT8531_SCR_CLK_SRC_REF_25M		4
 #define YT8531_SCR_CLK_SRC_SSC_25M		5
 
+/* TDR (cable diagnostic) test control */
+#define YT861X_TDR_CTRL_REG			0x80
+#define YT861X_TDR_CTRL_START			BIT(0)
+
+#define YT861X_TDR_STATUS_REG			0x84
+#define YT861X_TDR_STATUS_BUSY			BIT(15)
+#define YT861X_TDR_STATUS_PAIR_OK		0
+#define YT861X_TDR_STATUS_PAIR_UNKNOWN		1
+#define YT861X_TDR_STATUS_PAIR_SHORT		2
+#define YT861X_TDR_STATUS_PAIR_OPEN		3
+
+#define YT861X_TDR_PAIR_LENGTH_REG(n)		(0x87 + (n))	/* in cm */
+
 #define YT8821_SDS_EXT_CSR_CTRL_REG			0x23
 #define YT8821_SDS_EXT_CSR_VCO_LDO_EN			BIT(15)
 #define YT8821_SDS_EXT_CSR_VCO_BIAS_LPF_EN		BIT(8)
@@ -2563,6 +2577,103 @@ static int yt861x_config_init(struct phy_device *phydev)
 					 sleep ? YT8521_ESC1R_SLEEP_SW : 0);
 }
 
+/**
+ * yt861x_cable_test_start() - start a cable diagnostic (TDR) test
+ * @phydev: a pointer to a &struct phy_device
+ *
+ * Returns: 0 or negative errno code
+ */
+static int yt861x_cable_test_start(struct phy_device *phydev)
+{
+	int ret;
+
+	/* auto sleep would abort the TDR test */
+	ret = ytphy_modify_ext_with_lock(phydev,
+					 YT8521_EXTREG_SLEEP_CONTROL1_REG,
+					 YT8521_ESC1R_SLEEP_SW, 0);
+	if (ret)
+		return ret;
+
+	ret = ytphy_write_ext_with_lock(phydev, YT861X_TDR_CTRL_REG,
+					YT861X_TDR_CTRL_START);
+	if (ret) {
+		int err = yt861x_config_init(phydev);
+
+		if (err)
+			phydev_warn(phydev,
+				    "Failed to restore auto sleep: %d\n",
+				    err);
+	}
+
+	return ret;
+}
+
+/**
+ * yt861x_cable_test_get_status() - report cable diagnostic test results
+ * @phydev: a pointer to a &struct phy_device
+ * @finished: set to true when the test is complete
+ *
+ * Returns: 0 or negative errno code
+ */
+static int yt861x_cable_test_get_status(struct phy_device *phydev,
+					bool *finished)
+{
+	int status;
+	int ret;
+
+	*finished = false;
+
+	status = ytphy_read_ext_with_lock(phydev, YT861X_TDR_STATUS_REG);
+	if (status < 0)
+		return status;
+
+	if (status & YT861X_TDR_STATUS_BUSY)
+		return 0;
+
+	for (int pair = ETHTOOL_A_CABLE_PAIR_A; pair <= ETHTOOL_A_CABLE_PAIR_D;
+	     pair++) {
+		u8 code;
+
+		switch ((status >> (2 * pair)) & 0x3) {
+		case YT861X_TDR_STATUS_PAIR_OK:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_OK;
+			break;
+		case YT861X_TDR_STATUS_PAIR_SHORT:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT;
+			break;
+		case YT861X_TDR_STATUS_PAIR_OPEN:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_OPEN;
+			break;
+		default:
+			code = ETHTOOL_A_CABLE_RESULT_CODE_UNSPEC;
+		}
+
+		ethnl_cable_test_result(phydev, pair, code);
+
+		if (code != ETHTOOL_A_CABLE_RESULT_CODE_OK &&
+		    code != ETHTOOL_A_CABLE_RESULT_CODE_UNSPEC) {
+			ret = ytphy_read_ext_with_lock(phydev,
+						       YT861X_TDR_PAIR_LENGTH_REG(pair));
+			if (ret >= 0)
+				ethnl_cable_test_fault_length(phydev, pair,
+							      ret);
+		}
+	}
+
+	/* the reset below does not restore auto sleep by itself */
+	ret = yt861x_config_init(phydev);
+	if (ret)
+		return ret;
+
+	ret = genphy_soft_reset(phydev);
+	if (ret)
+		return ret;
+
+	*finished = true;
+
+	return 0;
+}
+
 /**
  * yt8821_get_features - read mmd register to get 2.5G capability
  * @phydev: target phy_device struct
@@ -3205,6 +3316,8 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 		.soft_reset		= genphy_soft_reset,
 		.suspend		= genphy_suspend,
 		.resume			= genphy_resume,
+		.cable_test_start	= yt861x_cable_test_start,
+		.cable_test_get_status	= yt861x_cable_test_get_status,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_YT8821),
-- 
2.53.0

