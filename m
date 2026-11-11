Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386142;
	b=NaJNenfPFnh33f+f4y0cNR3IGSvYxGPIkgofQFrKIzlVSo8H0AI5S4Yq3nklKaAwiVm3
	 bl3uFKoALVrTKlrprV1VWUuwbdbTMtgiDFpqtenPMXWQFghH1iH+j110jl5b284ZhyDV6
	 226vRkT0R4hoqXAzF9LKQ48RUgCZJouCzcj4mbk7P4ZED3mU00vRq1pz4H04vbnXCnbik
	 aWFkCL/rr2e8fxS3U2h9Y3OCf48qNXYu2JSvHX4Uuk9A+H4mjaxYxzT/5zoRyCJQ9TFKN
	 O9ZIZ8zEuN3xyjvb7NZxY0JVu5LKS+AxvUhCzeAmkSlZ/AdrHDQfx3cpbENL1xgsMtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PnuzJFSDFZI5wtxrxG5vIo0Sw+blHrEArgQL8+o/p1g=;
	b=u7dcq5dMqX8PIkbrPF8NghxvkGmMNIClM2dZsrws8mtUGL8B61pi2R5lZ0ZZ6RCpbSzj
	 9+YYfLseDvZdI3/rktWcuZ4CAl11e0pTYI0ck/S+vPmV/ptk7MjkjlY+ArHySffAEmPO7
	 KNMETL/px5OK2DnjCU/yAntnvhfaKFm31ubYudGDhdAwJ6LcOizVppxHtwpF1PBdVftl4
	 Y2UDlcLx2a+cI+zD0hx5MR/mu96OjCzPWTAI3z6iM3sOcwdzZRCq79N8P+sGF59YFeN22
	 YvNvBzvllsoQ7t6rPEgYH1CmX+QyuTINwTb6mJ2X2YrIjyiLJ2dG6y2Y3tRwjvQ6CsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TpSCIbY5;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF40606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF40606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TpSCIbY5
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E1413FCD8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794386139;
	bh=PnuzJFSDFZI5wtxrxG5vIo0Sw+blHrEArgQL8+o/p1g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TpSCIbY5r+yK7NXloqUdGqYuBp5GgZfw5GI7LNRDBvkr6ZXOe/63h7NH9U4JZeZWR
	 wAePnMthaxi/hsFTkEu8dT1wBB6c/3/ZJLxafpgrkBnMHXwZyfAcy3BR6QyUwaUXJ6
	 2nHzkG9vpfRksB5SbReMaVBjSWfnmtM0tDGTULoEAGHh/ho2gb364xdvlmAI0qh9/I
	 0b2vByUyn7HP6nW5epFFWRwRBfBLBvL2Rf8TBWRkQc9Sf52wFidU4iG45D4I3bxxSA
	 SrzXMgjeewHhnsF31s8CQgh0wAgqkvOHciZe9PsLOZsCcFbO+rxC8xSa24UPjqYhNx
	 C5WjVhRkJd8a8zkDDkChVcDhUeF/Li/I7SqqC65DKZz6KFzIh/T9mVvHnzXZpVy1KX
	 AJf3qfmNF2MUc0WPM2T+Y94uTo9B6ai46ILJR6KvX54mmZOosN+wYSwEC0LWmBKKgd
	 5hiMyy1bxbjp0wIIVwCXxkGWgr7yFsfA6fJmc+wb/P+wtg9M72XIrni/QsFL2086Fo
	 vREs6bV2c8RumXmS+I/lMrhvmHrAeoRK6Vd5Nb+UQzX/KfRbshMTc85wzN+KK2sOT5
	 2fh9r3QTa/N5jBEoQLingYsexMrh0yhoC5QLaoMXG+DlGQ1XW8n84cNbGPuq0wSQ0z
	 pG6GoAtYJKqMaHLhvi03OrGk=
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5867350eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386138; x=1794990938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PnuzJFSDFZI5wtxrxG5vIo0Sw+blHrEArgQL8+o/p1g=;
        b=mgouHsHSrShPZnZxuQI2enJX1qmaw870vvLdlIPL+rFdjXYd8Qa8c3lk2cXO9YDjBp
         X9M7luhoKwKbusBUk3xMj4PYYU/1ky+skkemdddBVkdLE0MWehJk1qCOD32eyrV5idco
         FSyosBmYIuliL/wgoTFYSd9IXlh4gvJDSRru0Dj0WFHoq7ScevOI2XAZaivRHNy0D3OQ
         69zhrCbZ5igqUnhnmvU0a/AnR5eW+AXgvP5P2G6y62/OX/ffv7hz/NhOJ3fT+6vDaSx4
         d0chQ4CpSDSCPkPTiZS71hxazDypShE1XI7z6/h33/aeVslzD6IxhrFdpFKs6gpZVx6X
         hamw==
X-Forwarded-Encrypted: i=1; AL+hErEUfb5juyOUDYucwuXbVnn5ntxnh2gHF52yhJILC485isOybJXQB6KG1gvHGzbmocxiNjRTQyMbWQ/nQcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fRhJC6gm76k6YScAR7ZCRWxMF/tcaEmDrrdZ9bmMYBrkSqyyJ
	XIookNXUtUSlEtTaB2A9MdP1bsX5qWHo2cH6RHManzwFnRHUt9734FkHmSaKAc6q7i1SbksZeaB
	ECRWBgGPsnTiXNZh4ycvJ/mE7EiVOcdP32m42nTUF+EJICj3ffwBypb44VroUbPdkW1JJJ8wFpx
	+3seQQhA==
X-Gm-Gg: AYBFou1emB60L59pUJudATlCzjqjNJ6g/mJQzhpoVSRASsOA0kCnLUKW8+TRNv13G+r
	L6yROBkxSsTveaKXTQDy1dCGKmp8bVqEtZkGY0la4WaSTjLzQ2zJ0P7Jj38A4h+HWeoje3+gYTu
	gCH7bRYvQLBndPL/9RGY526eIWgyCyDG42f+7CbSiTbL0w3caG5mTuHBbrTZcL/OOYRwphluWM7
	/NAqD9yl97pHl8gMBy4mlX0j4baof1fnZVBwAkmhghvC8/l86SxunPrgasUkwDu61kvzk3K8qQR
	Tdw5wubRQSJYry42IwZTd5tPDtZcwENDRRb9TV5SPjtEKCnbvzl7bDvO1V2qAxJ+6PsmoqSq33Y
	LaFuEZiygfujSBqq1fMWArbpFB9EROjTDq95drD/Ei+uQZO0BjvWdus2xMjU2FuA+QR2xyzAexb
	PkJxExkMJQHS/wpCBrz4UiwxbGdKKvXjZ2T6Byz1sw9WODaIANAis1cmbA0TmwEKjqoJO+hwscV
	OogNdz1v9aAnKR0da8O42ujL6/UgkAmMZlKxAfd9jbhe6V9p12qm44kNHe6px6c9cr73+15PZs2
	05dHSeax3TC7ZA==
X-Received: by 2002:a05:693c:83d9:10b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-37686859056mr2400663eec.36.1794386137407;
        Wed, 11 Nov 2026 00:35:37 -0800 (PST)
X-Received: by 2002:a05:693c:83d9:10b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-37686859056mr2400648eec.36.1794386136843;
        Wed, 11 Nov 2026 00:35:36 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm5866706eec.1.2026.11.11.00.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:35:36 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Wed, 11 Nov 2026 16:35:29 +0800
Message-ID: <20261111083529.727285-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ThinkPads expose battery charge thresholds and charge_behaviour through
thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
charge_behaviour and charge_types on systems advertising those WMI
capabilities.

When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
duplicate charge_behaviour sysfs attribute and unregisters its battery
extension. Conversely, registering or updating any power_supply_ext on
the same battery runs sysfs_update_groups(), which removes standard
power-supply attributes not owned by power_supply_core and wipes out
thinkpad_acpi's charge_control_start_threshold,
charge_control_end_threshold, and charge_behaviour files.

Match the existing ideapad_laptop deconfliction and skip registering
the WMI battery extension when CONFIG_THINKPAD_ACPI is enabled and a
ThinkPad ACPI hotkey device (LEN0268, LEN0068, or IBM0068) is present,
unless overridden by force_load_psy_ext.

Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..6175f1e6c51a7 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -909,8 +909,9 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
  * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
  * @priv: Pointer to the lwmi_om_priv drvdata.
  *
- * Checks if the ideapad_laptop driver is going to manage charge attributes first,
- * then if not, hooks the battery to our WMI methods if they are supported.
+ * Checks if the thinkpad_acpi or ideapad_laptop driver is going to manage
+ * charge attributes first, then if not, hooks the battery to our WMI methods
+ * if they are supported.
  */
 static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 {
@@ -928,6 +929,15 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (force_load_psy_ext)
 		goto load_psy_ext;
 
+	/* Deconflict thinkpad_acpi driver */
+	if (IS_ENABLED(CONFIG_THINKPAD_ACPI) &&
+	    (acpi_dev_present("LEN0268", NULL, -1) ||
+	     acpi_dev_present("LEN0068", NULL, -1) ||
+	     acpi_dev_present("IBM0068", NULL, -1))) {
+		dev_dbg(&priv->wdev->dev, "thinkpad_acpi driver manages battery for device\n");
+		return;
+	}
+
 	/* Deconflict ideapad_laptop driver */
 	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
 	if (ret)
-- 
2.53.0

