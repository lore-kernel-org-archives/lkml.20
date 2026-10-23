Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741988;
	b=mdhunr3OpXXhT85Jjvgsqh2IF9kx2aEGqC6PI5QjzYy1KVLWVE2RBhowYASY/mBHtjv5
	 D6APbVMPf7s48rYa0cxuNr8bRa1s/8qcag8m4WLPdWRkjM5zRMUPy5cbDqEKvpQSgRnzj
	 4WU/Ho7fSx7Y+nDg7h5syXVvbhkwyFiBFc5b4lnoJF9kI4wywChoh8guhTMAmdL4wjYeR
	 uHS1OebOGBiAzz0sD1l+Rf1m4pC2m5gaYWWYfCW2frP4+M1oRpYytF1+FH9AEYsC4XdEV
	 HAyttkR4taftYkGbFclMx3FP9ORKwMIUPTavn5Va1oO2XvuRtkeH83aWTnXxwSJ8rpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bqYeLPaggZUFXZv738RSupX9Fo/Orf1YlGcPsK+V+Xo=;
	b=ibuwGnDCQ/UAGuaEanbvv1orGVX9ME7QPCw/hsDv4jJgz+fwTeCCVRdMTCyWiwQe5l/c
	 Nw30xF7sOfVxfe+JDmwwdraiaw7T2fUQF584qIQQNfUxh0xKKSGJk6SN71J5Oli1lCDOR
	 WNFKb/6axybLLzamJ3eq35Rm8gpf6xA2Jzc/YibJ1wpXWtkTsE+HdLF/438IaUqoQn6AO
	 MCExzcXySjVSTuGT2Fo0+CHV+wc5kjuZsR93BnKs5htEHb6T0FfG1YQf/xUfpDB0mu1Wq
	 Z1oaFjRvNg3dgEzKSb+pkuJ9PvwhQXsNW5m5w3WaHmlsAuGA6nfvWGkyBPvqGckwx+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fl6nkG9e;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD64606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD64606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fl6nkG9e
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso537161eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741986; x=1793346786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqYeLPaggZUFXZv738RSupX9Fo/Orf1YlGcPsK+V+Xo=;
        b=Fl6nkG9eO+9ZdCCG31R5kM9BNLWZpzgyaZRaPpbnO/xUDvAN8pm9FQHAK/C+RcSi2z
         rkM7EGqEjViZw/A5JpqpaKS502EYw2HX+7DpIdLm7FGQFQPm934HzFCmXPclJh3p/rLa
         KyNJmlm97DpUfGHrOnwQVwDtz3QvK6sculmcK2qfoGmAQmAQnWlOZq6B5mFCrZIpLcPT
         EfkINCnzaiuWYezuGueqe3UJPoXlN0TeZOYHfWbTWzJ6KJrkH0MvZYq5JmEgPsNemIMq
         HknBqSQp/Yyp8Zaxms/tF1j0k5j3XFL1jOm3fd79Ie0Kw1XgiWSHiykqX4GIs2js+XhX
         hdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741986; x=1793346786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqYeLPaggZUFXZv738RSupX9Fo/Orf1YlGcPsK+V+Xo=;
        b=y9eH/is8g/VOk7KX6SBIbeB6PwaiEq85+YoxsD0nXLZgILIJVk6DRH0pQ9k2nb0qqT
         l0u4r/L8jEixp5aDYgMs8PE82DdZVuow4QFhX8h5B4Dex48M5jlJYBSrJS04XJ6BuVKv
         r0K2YgpEJbmmJs5QqR8iYZgFnYJa96p5sm1pfbys0TxoNR0lZnZEisb5nAdAEyWa1Uv7
         1D6EdPqVBOsOZnrMzQXa1QJrGzQjLAiYbgJmkn+MOs4Qh5NrWJ1vWiQ8tiUYp+pd/4/p
         EM7I7Ui+nds1AFoBpxaEGYQxrANmoN3GxI7Hhmy7wxPaKhnFQtQQpu1urjsUvpfJSSDn
         nQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMLDh5M9zcvqIpbk7mvVdscDGZ8V2JGmJdkvsIo1RQVaBazeTyHxwhoX9S5xw0/E80iSpxhYFkQ2sEXB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2vcACOojDu3MIXoFOfZtQI2ble4NeWPcpM2o73oOxT6DcUXjH
	V2QC1JcFJBNdUHxel27fq6DKnQaSpJgoD5z/W0D9O99boUlGufMhYJ39
X-Gm-Gg: AYBFou2GCpOVtvZQbnQnDPkUAfxKT+SAGoG/OZgiIKjvAQmk0Ozm8BeXh9UzopIYLSl
	z3cF3GHa31YmE3pla+6wwRHWgli8m+9Pu+f+ZaEDeLL5vaOTCtp3PYAhZktl+vPEFLGWdhsQzaD
	5ZlZZrt6AJaxdVHfuQVfTAndo9ey1sFn4WfNyw2I0/1MZjntXtCeFci2sVMrn2u6VrkRkaaFpbA
	mHEgzJK42fb81itM0MOGRO1dmqO7oI+/+63O8wuvRnXcXH1cFc50nM+2OEAXDh44XIpo542Aqqn
	v5gVKOZQ66Srh+zQ/4dOPmsI0qI7gmAIkifxmttLSImZcFwr4J9eIg2A06WO4aMaqqBMZsicYte
	Jl5nQCn6u3zlOtUA2bbBqq6khibyI7BA6BunnWwjridQFzowQUUKOlSzr6gdZJ2hb42GB6gmkbm
	wWiwVcVp+cQ/UVVrITDQG6is4N4bLONIZ/Q3uHMU6jjSXp1200eJiIfllsfjhSZLFBOB106ua9D
	IA+doveJh3vF7c/P1CXY2QN9AnVhpnnvBGmoGNE9CcoKv1Xrog8gwDg8lZZ7H70cEAKMdyC7Lo=
X-Received: by 2002:a05:701b:4512:20b0:151:2e62:fe6d with SMTP id a92af1059eb24-195c5ad2b3cmr2019767c88.22.1792741986205;
        Fri, 23 Oct 2026 00:53:06 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:05 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Coia Prant <coiaprant@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/4] net: pcs: xpcs-plat: fix clock lifecycle for !CONFIG_PM builds
Date: Fri, 23 Oct 2026 15:52:13 +0800
Message-ID: <20261023075214.1793922-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
References: <20261023075214.1793922-2-coiaprant@gmail.com>
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

With CONFIG_PM disabled, pm_runtime_enable() and the runtime resume path
are compiled out, so the CSR clock is never prepared/enabled. On
platforms that provide a real "csr" clock this makes register access
fail.

Handle this by preparing/enabling the CSR clock manually in the !PM case
and disabling it in the devm cleanup action. The CONFIG_PM path is left
unchanged and still relies on runtime PM to gate the clock.

Use RUNTIME_PM_OPS() and pm_ptr() for the PM ops as well, so that in
!CONFIG_PM builds the runtime callbacks are still referenced and .pm is
NULL rather than pointing at an empty ops structure. This also drops the
__maybe_unused annotations from the callbacks, which were only needed
because SET_RUNTIME_PM_OPS() expands to nothing when CONFIG_PM is
disabled. Both changes are no-ops when CONFIG_PM is enabled.

The CSR clock is optional (devm_clk_get_optional()), so platforms
without a clock keep working in both cases, and clk_prepare_enable()
on a NULL clock is a no-op. Because the !PM case is handled in the
driver, there is no need to select or depend on PM in Kconfig for all
platforms; keep the current Kconfig as-is to preserve compile coverage.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 46 ++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index 11c4239bfd74..c4404500bac6 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -275,6 +275,7 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *pxpcs)
 	return 0;
 }
 
+#ifdef CONFIG_PM
 static void xpcs_plat_exit_clk(void *data)
 {
 	struct dw_xpcs_plat *pxpcs = data;
@@ -304,6 +305,39 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 
 	return 0;
 }
+#else
+static void xpcs_plat_exit_clk(void *data)
+{
+	struct dw_xpcs_plat *pxpcs = data;
+
+	clk_disable_unprepare(pxpcs->cclk);
+}
+
+static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	int ret;
+
+	pxpcs->cclk = devm_clk_get_optional(dev, "csr");
+	if (IS_ERR(pxpcs->cclk))
+		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
+				     "Failed to get CSR clock\n");
+
+	ret = clk_prepare_enable(pxpcs->cclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable CSR clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, xpcs_plat_exit_clk, pxpcs);
+	if (ret) {
+		dev_err(dev, "Failed to register devm for xpcs_plat_exit_clk: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
 
 static int xpcs_plat_init_bus(struct dw_xpcs_plat *pxpcs)
 {
@@ -408,7 +442,7 @@ static int xpcs_plat_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused xpcs_plat_pm_runtime_suspend(struct device *dev)
+static int xpcs_plat_pm_runtime_suspend(struct device *dev)
 {
 	struct dw_xpcs_plat *pxpcs = dev_get_drvdata(dev);
 
@@ -417,7 +451,7 @@ static int __maybe_unused xpcs_plat_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xpcs_plat_pm_runtime_resume(struct device *dev)
+static int xpcs_plat_pm_runtime_resume(struct device *dev)
 {
 	struct dw_xpcs_plat *pxpcs = dev_get_drvdata(dev);
 
@@ -425,9 +459,9 @@ static int __maybe_unused xpcs_plat_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops xpcs_plat_pm_ops = {
-	SET_RUNTIME_PM_OPS(xpcs_plat_pm_runtime_suspend,
-			   xpcs_plat_pm_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(xpcs_plat_pm_runtime_suspend,
+		       xpcs_plat_pm_runtime_resume,
+		       NULL)
 };
 
 DW_XPCS_INFO_DECLARE(xpcs_generic, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_ID_NATIVE);
@@ -456,7 +490,7 @@ static struct platform_driver xpcs_plat_driver = {
 	.probe = xpcs_plat_probe,
 	.driver = {
 		.name = "dwxpcs",
-		.pm = &xpcs_plat_pm_ops,
+		.pm = pm_ptr(&xpcs_plat_pm_ops),
 		.of_match_table = xpcs_of_ids,
 	},
 };
-- 
2.47.3

