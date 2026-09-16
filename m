Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96282466B10
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545534; cv=none; b=kvAg2h8QHmXiKjSH+y9fqwJPmjFMH4PuYIIhPxhil3+sHuZZHUS2emI5AQx0Cy2KZbZX7oYfXucDvrbC/1cKP+MOPpvZHVxs2jG5uENnlHFe+duCfhGW3yJpC/FOxvuPIfOyhwK3Yr0rUymW0L2J44O55l3VWaGO9QI3q9pi1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545534; c=relaxed/simple;
	bh=L6VSMNKkPXg4l9VS1SCcav8nfu3ymTFtfF0ofUQlcoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksIXElghXuzPGav/L/RGElCkDxB03hWUVN+shGBOFDNfamnJO8+nWiX/9nJrUpLsnmFGfjsHAX4jlgw5k3k7t0+weMfGLcptujTthBXwCQSm83B9W9SXjHMv0Sa3C5h+O4apQbfv+1vbrqAkWs+9s2T0ipIif2b7+7/s+srGBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GBzusWew; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GBzusWew"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so555825a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545518; x=1790150318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=GBzusWewVtBHhHke5RksqATpbU0/huc+d336SYPaxyosNfiesaXKtV1JgWg0Jzote7
         f0roi3BJSDAhn5jtc4jwhwyBeYGHfyAaASrTMR2G8i1AtFJNbyzNkh27gYu5wvEWIyZC
         /AasNZCngh+Vrs6oFwRqMyrj3mTU0TGUCj3Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545518; x=1790150318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=LbUsSFahculNn1Rqg11m/U6UYtXGYwiY6OIMVuyq0gda7FeF1w6FHi0vV/gLoYsLjb
         52/N6qhVT64YOWkwFC+3HSX3WNh5gTaf2/SMyuUDEPf+Cfq0Fym8iif8H6DyMEOxkpXt
         ZjesdwUdVWU0RcGZi28Vp7GJM37FJcveWKnVCHnIlPmyJvTzelxMlQRHwLkvy9Uaplws
         ua1uyWqJDIeg53riDsYl4X5aUjg7m53KVUYmomrUGZEnToNJZzEkw/CbXaQPEpmHUMal
         sX8li1v+NyvmPucqBr4p+qmUyXwwgKGqi4Nf78/WGXOkTHrphQkpw1P2kI+/1wHbHmUO
         alyw==
X-Forwarded-Encrypted: i=1; AKwUvBwqjO2hGx4jd5jtt4x8pjo6/Yh8yfbLR37rB2K1o8Kz4YHnXC61alIAM5BMbiOBX35lvBKwmOLPqcp/tTA=@vger.kernel.org
X-Gm-Message-State: AFuF++n7uOyRJDCxmHlAogC3SXJoSxws3oi0xtJOIXia19eSR7pdqhyO
	PIrR/olvwt03M6MMzKjEgq3Tsics4wRqiPxm9xtitGncGEHSvm4v3+cXvjCnoFtzBg==
X-Gm-Gg: AYBFou2t5oGhQwoLqwDBymjamvMfyog9oqvvCdjoNV2Xn/QebjzNEQVQy0ek9mW5DiM
	wRdM7ELXI5GzXJn7HV4EwNu7hG/IVCcCF1lCU2c422MnyiQxhDZu9M04j+MktEoSlscU85p7LQg
	WSXCONIYCtkyGxQXs/dU87TdxnQ9ktREK5xhXzQqHR3h7o5Eenk1KlHnExKCFEyZKtiUs7sGUj1
	YmoCRC/gMaaakny7GgVBfHWluHZiUm6liQVLaBsfpXtFpzp4qixE7yna8NtQUTxd9/urnMIe6rS
	Bi8HC4TJ+QETowO7Gg9H7+JXe4uKcYJr/wYz4uHWRzCsseG5yQrpFP5aZo0ZF8xcF3p8bVu+ijv
	yZrZbg7SwNNtu+oYPwoAlFfU2+9r6wrwe/+bSQKowg7Be/JzYKZdT3YJuCPJdiZLnFrM/UAAaCJ
	AsBv4EvgED5gCoZseB6dy5WF4uks5MamsJHSaeSrxsLrWKEri3LU/PkBlvn8Dk221yfF3Yu0hnX
	Bpr7aFbuPxKDem1W4TX916btTIFZ9mvSlldQAHrdrKNoVoenftSirxunQ==
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4064349a91.21.1789545517871;
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 03/15] power: sequencing: Add pwrseq_get_state()
Date: Wed, 16 Sep 2026 15:57:29 +0800
Message-ID: <20260916075745.3549953-4-wenst@chromium.org>
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_get_state()
so that they don't have to reimplement it locally.

Instead of just on/off and error codes, the function can also return
"unknown" state. This is in anticipation for "uncontrollable" power
sequencers (such as GPIOs left unconnected).

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- Adapted to pwrseq_enable/disable() rename

Changes since v6:
- Changed to pwrseq_get_state() with enum return value

Changes since v5:
- Reverted back to returning -EINVAL if descriptor is NULL

Changes since v4:
- Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency. Bartosz wants the change on an
immutable branch to pull into the pwrseq tree.
---
 drivers/power/sequencing/core.c | 19 +++++++++++++++++++
 include/linux/pwrseq/consumer.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 3076b3879af9..8e06fe77fd6a 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -971,6 +971,25 @@ int pwrseq_disable(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_disable);
 
+/**
+ * pwrseq_get_state() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, PWRSEQ_STATE_ON for on and PWRSEQ_STATE_OFF for off;
+ * negative error number on failure.
+ */
+int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
+}
+EXPORT_SYMBOL_GPL(pwrseq_get_state);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 16fad5f3e3ab..e2a2991b20c2 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -11,6 +11,12 @@
 struct device;
 struct pwrseq_desc;
 
+enum {
+	PWRSEQ_STATE_UNKNOWN,
+	PWRSEQ_STATE_ON,
+	PWRSEQ_STATE_OFF,
+};
+
 #if IS_ENABLED(CONFIG_POWER_SEQUENCING)
 
 struct pwrseq_desc * __must_check
@@ -22,6 +28,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_enable(struct pwrseq_desc *desc);
 int pwrseq_disable(struct pwrseq_desc *desc);
+int pwrseq_get_state(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +60,11 @@ static inline int pwrseq_disable(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.1032.g73a4cd73de-goog

