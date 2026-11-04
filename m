Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807217;
	b=kkUpT+NVyj2u2ETMEHXC5FoyCc/xPHzYWAAzTKf6JNuhtMTPEPTy6t0XATm+2iAkbnSK
	 KvXkncGJ5YYqzrsB+tlitFCmlmqd51rCAeP1k1pswlFG9XhdIpqNRDNmU6Me+8+m+sOFH
	 hpghMUEkTJk6o8r9BY6xPJ7yO0SciJRMux8jmYksP7NhduMjKcOBtkKSNRG/Wg2PuWXvt
	 Hy5/V+y56SP7PWNrTtQog8I6PqRMjyLeJAQpcS5hqf6bkijKjoG98n/I0aY8f6szC7qN5
	 tfUxqrzdOi7a0GtX2qhcp7pFnxOd/J9TzmhEjSx8ONliHNwnbViU0m4hZvOuHofC0OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ZtoVpi1gN7tNnAF3gZlJ/8Uzhv/+0rBLH8eXepcNcg=;
	b=PpA7MsNGjJ3DOSYKEc/AZFpaMwINYB5S+rxy2GjKzyE4qsGJ9u77SbPCm7QykCiDe6Bn
	 hYGI0dU1G349r2JZmP2kl2QohHiIYIypMkjvr3P+Dr7d7G69a07emunw03+hbLBCb31dg
	 8c7mTz+Aa9RPVwSWNobeeLF/dk11CrcHSEIk6meqMH0rhRUq22opr2y44TH3Hc2rt3oOm
	 9rxVEBtEIyUmswsVnUsmy6RFXXCoKAMVXXmSpr7GJaFywLh5xcrVE5gaztYKWJSH91K8a
	 O5TUZ0vo/vXD4VDeJ4SqLTfMvq57I8E+u/RanSv384vpzyXe5Ic/xkTT/x6CvYejtHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qg5M8x7p;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738F606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B738F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qg5M8x7p
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a60f90a924so417770b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807216; x=1794412016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZtoVpi1gN7tNnAF3gZlJ/8Uzhv/+0rBLH8eXepcNcg=;
        b=qg5M8x7pKnkEWIRPnSieYl/u6skDGtffHNW0BCOLkfSheL/FIhnfd5TXZgkZ3zxbLb
         QUIUuKHni0Y7AyHBo+hlmYDD/KrJCeH0uIcpaOjPvM+J8EA2Kx8ydkL0dj2SQH2jRzLk
         c5JgIswVk0CF0cYqet0z9Z6SLR+fXIXzWAQC5fyr6+A0QsLyI3nUv6N6YZHwiSUPRizY
         AdTLMeaQVcwIdmmndzD0b2GPcbEnwbz5u1Ad3u/E7aPXrWD7deKDSkvw+Xe68okvsQkX
         kPOJBC3YZ5WDaSPpe3SDQ7l+QeLPq8l7e/dylczhCRawdkp8/EilC8tX+VwnaA5Ngral
         BzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807216; x=1794412016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZtoVpi1gN7tNnAF3gZlJ/8Uzhv/+0rBLH8eXepcNcg=;
        b=C20Spb3Mbp6+CNh5BUHg1TgLzrsmNgP8GPrLS9wit051sRN6B/MK+49VUHc0yaRs1z
         XG1oh86ha2tpJTr49qZDaaWk/VWtS6LzPF/yFOLlIeXcPCzco2EibYWBOWb3ngdZzyCm
         5tkZ+dVdfsBhfYBD1TYfla/ssXjlIK9+A1MtG3j2KPO13fnFn4AExXRO99QNv7Ob/+0M
         MQguNbOUR5pxhDqnXv8cQ1pM4ZL8kw+rcxofqCRE8jzRK7q8nKk780T5AxybVgiyKA9Y
         ZqLDcFESS81mL9qvNOXWpws7F/0PdJQzgjIwZHMxAbzWUgMAjDWc/cycsBwRy0wZU2L1
         RW+w==
X-Forwarded-Encrypted: i=1; AKwUvByvMI453mSITZ3n1Bis4hxghT2WOMoCKcBwFtNZrENJ2eMMeIKN/nS9WWdvl3RPeynFZUFet4njMd9fY14=@vger.kernel.org
X-Gm-Message-State: APuU4Z86rxFSu9tQx9eaImFapj0utu/jaHGlOF3YYdPSyQj8M4iBVf1N
	vcjyMk3RQbv5gumYmOk5kT0woLw5ILGXTR8h0WqywjUf5VeBLJd0LGRV
X-Gm-Gg: AYBFou1Hn2LDHlApxA7jU6hrCfm2b+t9jgIwEtACCXsmuI9awKNoD1rI8v2vh1twu0T
	fuf4odd/h03ICqBa6x9HvkuWHQuzSFRVhFQuD4CdZ3jhqD27vrWq54vIHJxmIVkaNqTexggIjqe
	Sb7/L0oly5WqSdah2YFep+nnE5jqzGzehoO0/Xq8O3EadSI4OvBCJDHuwzHk46xx7cQRAXSNCip
	yY9x4KcQBsOC0pyp7UbLp+GoKHHgKZIMVRl2d6zJZ3vWF4B0AagtOqVxiB/BlHEMUdEgPeI3uuU
	5P9uaJ3b8tQ+exdUJshnnH+egXKKKln4AyCCVdoGtnFUpg21b/cxkRlAwqimSxPQU/sTlG3L1sY
	WkxjdUEGLqmaST9GFBggaV2TI2f4oD83N/xCslphF7fPKNhfoDpnlsUze+r1rxbCvi2NhuzFI6u
	foLsDaSLXXXCMRB/INuuZUHzTQWLbKa9psc3O4owQqs+GJxyMv9OlraUhd1juCI2Kf1N3s07RxU
	L5dJ2OltTatUyweGdbrCs0H4K9GtH+zIjs6gkJF+LH1MFV/srr0N9yhP4CmIoJ2aSQoMLdR+8a8
	6v7xNC8Sk/Ff2B/cj2G6qZRxUf6IXhBKuqDT5FYeI/Mg0w+GzTlR
X-Received: by 2002:a05:6a20:6a2a:b0:3e2:b448:ad49 with SMTP id adf61e73a8af0-3e929025a77mr14264569637.68.1793807215744;
        Wed, 04 Nov 2026 07:46:55 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1372632a12.20.2026.11.04.07.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:55 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dmaengine: pl08x: Release the reset before reading registers
Date: Wed,  4 Nov 2026 23:45:38 +0800
Message-ID: <20261104154542.3131916-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104154542.3131916-1-mmyangfl@gmail.com>
References: <20261104154542.3131916-1-mmyangfl@gmail.com>
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

amba_read_periphid() happens to release the reset. A node that carries
arm,primecell-periphid never reaches it. Release the reset ourselves.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 543c2eb8cfa8..33ad6c42cd7f 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -75,6 +75,7 @@
 #include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/amba/pl080.h>
@@ -2695,6 +2696,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct pl08x_driver_data *pl08x;
 	struct vendor_data *vd = id->data;
 	struct device_node *np = adev->dev.of_node;
+	struct reset_control *rst;
 	u32 tsfr_size;
 	int ret = 0;
 	int i;
@@ -2725,6 +2727,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		goto out_no_ioremap;
 	}
 
+	/* Release the reset before reading registers */
+	rst = devm_reset_control_get_optional_exclusive(&adev->dev, NULL);
+	if (IS_ERR(rst)) {
+		ret = PTR_ERR(rst);
+		goto out_no_ioremap;
+	}
+	ret = reset_control_deassert(rst);
+	if (ret)
+		goto out_no_ioremap;
+
 	if (vd->ftdmac020) {
 		u32 val;
 
-- 
2.53.0

