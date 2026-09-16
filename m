Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860345FFA5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545586; cv=none; b=gvOjbHG5MJuHSAEYozXg/gm6weNHUpTi57XYmhu2RIlvdw15J5xiVXV8+dgC20gr4eSm7zjP4R73+H9hdN34L9xuWcgffoChvXDq4O499vcbMupUC4yb/tSDG3W3p9CY40baNikuPKzhkZAyAOYkxGhgnXKGmoKH+kvVgdOmPSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545586; c=relaxed/simple;
	bh=KzBRa+RHmHfvRkSmrTiTEZJDRCsgTkmMAnZOypFRNhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPnQeBA56b5mOpVW0a1NJ8mazMcgsTUG9CJdWAJcE1yq31KdG1s0saqJ9a0OAWfAxFFI1yakq5t8JcE9IL/ylPOO+nyW/u+BGcHXSqcs2EQ0tG9OmcrrCu/zxNYM+eNbrZmq25Fh4gsVyDqQyz+EDkCJImXvF8z6jmUc0UVu7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MPGm4er8; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MPGm4er8"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so4446675ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545566; x=1790150366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=MPGm4er8aa5ZKi7sW70lq5LixCUx77tzPTczvaXQhr/j87gnZaw7ymIgxEq0oLQns/
         RmahgFk5Nf2BBfext2RpCNYAAL+Ra/eM0SAjijf/+BsIoGTVktuCbTCNqzBCl0HaPTeb
         5esJFe370PFwfXgtV+j+PsTzrcXkRRtOhZ6So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545566; x=1790150366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=V5lmdK7wp5AbzhC/LqiV61SE1qKQabL69o0TNp4wU2zQmfUm70FfKdp52RBW1mUjxF
         JlcnwOjeWghWqko5YYtw/qwm0Q4hPJKiRpH1UswgPFWD6lRuxziLqvYjE3NsgLqvjGoH
         BuqbZ4JJcwTpN1VdjlGP0diE11sYcz6Kcshy1QM9Kwy6w13x3h6VLxA2rvDmZWlrwh95
         yqx1MuGtq74/Q8qa2HNeQjUX4XLJ+ZisWxa1wxTQphYu2Ga0fSUJ+VYuQW37AmMSK1as
         KRnJbaMx4VkFTD01GAKahf2QK7vAwgM82iP7N6Xx5TAuhEOTkneU96PQVxPWHV1C9h1J
         1WQg==
X-Forwarded-Encrypted: i=1; AKwUvBw3PNGvnKRGKUoXxCf2clT4zEIwLNrA8JiOwXnbJQtdam1gQHkj+au+cYdjIyvjOtfMmuX4fRE9D+DRqxk=@vger.kernel.org
X-Gm-Message-State: AFuF++lyM/eIjodH7sBrVdB8/QXY+mLv1Lty9EdhJO00zb2pW5SN5DsQ
	GLNA+r2dCoioxDt5tGaOml1BJsbV6/6hH5xPpb9RQ7i1qB2yvAASYf52E4kQ3GSWzw==
X-Gm-Gg: AYBFou0Izu6KX2lLioxeWuUFHnX1BUzGD+VPHIsjKgoKhkIngSDKJZQcxg0m7r1ajvr
	XiqDG+AQZKzCo21/GiZaWFq5CRkzKHBIhTTeXlfN/YuKDpsXtdcDJGhEtY+yK072XIjgv0RCbzx
	tIaE4fI34aRP7zbgmyK07VccLq8YS1TtqMyxd/X8gCxo7e+vaACM4SXyTUm//1+5Hdb58+D5DDG
	INfmtTck2/lL+Wp3cFx/UQl471sIF0fGnXQgheAWxfcZBCfOGL9YKTGsS87K3d7xOzBN7/LK+eP
	FySHpZ14VG4PWQ+2LZwRUQp/Qnev61hR1KM/+vW39sWqZlODR7bfyeHtXuP7NaK9VH3s3Y66zdY
	of3UwqZ/kJHNBAfds/hUHJMPpNUxaZgkOhBB0ozZDX2GTV1SSPI93Kn3JoQHiE908xa7X5uRTdV
	Twp8vafeqBxv20iXct3Br+vIpiuKkSJZuazqw1RhpvH9dpFjabrZllnPYfqxCYC9FnVQcViBipZ
	jrxfN42w6uRqQ8Xdnr0QYBTgPfho5TVgCo+zDUxsBNY+6tbAh0I0Q0F2skDQR1DSWOS
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr4028912a91.11.1789545566189;
        Wed, 16 Sep 2026 00:59:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 12/15] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 16 Sep 2026 15:57:38 +0800
Message-ID: <20260916075745.3549953-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. Currently the driver only supports PCIe and UART.

Add power sequencing targets for SDIO and USB. To avoid adding a
complicated dependency tree, rename the existing power sequencing units
"pcie" and "uart" to "wifi" and "bt". The existing target names are left
untouched. The new "sdio" and "usb" targets just point to the renamed
"wifi" and "bt" units.

The "unit" names are internal to the power sequencing framework, and
should be confined to a single provider. The names are only
informational. Dependencies are tracked with pointers to other units.

The "target" names are the strings that the consumer uses to acquire a
descriptor with. As these remain the same, existing users will continue
to work.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 350a4c8831f7..499cfd291a39 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	NULL
 };
 
-static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
-	.name = "uart-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
+	.name = "bt-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_uart_enable,
-	.disable = pwrseq_pci_m2_e_uart_disable,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
 };
 
-static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
-	.name = "pcie-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_wifi_unit_data = {
+	.name = "wifi-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_pcie_enable,
-	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.enable = pwrseq_pci_m2_e_wifi_enable,
+	.disable = pwrseq_pci_m2_e_wifi_disable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
@@ -130,13 +130,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
+	.name = "usb",
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
-	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_sdio_target_data = {
+	.name = "sdio",
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
@@ -147,7 +158,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.55.0.1032.g73a4cd73de-goog

