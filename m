Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A331501F47
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794292; cv=none; b=bQCYiE05sfTd3ST+z9pn8LyddT4dBD6nx9QtuTEP8Jhc+j5OUjaszuMN4W41UEby1HYGRBs0CQndhjqmmwk1WaBeZJi1W6XqyNvgfWCETjcHWwBDDNxs5uyEOvzbCk4iohI62V7YPz1gkR3lMk1j7menSzvAa4TUwTTxShio5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794292; c=relaxed/simple;
	bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/0hvj96bZTJo3s9YINQv0jjOOTGNMWx3upVezTGsgM15Fa6ambQXwm2ms2+KWnypj1fkM5hWZVqWsVDg8aYbudI6ZuPMTm/fyd+U9Ji1IBZcmhVXSrWcO1zUYSKceESvxc4hcxHWfLTyypKCcJkMYWMQtbLXlrOymYB+eYXQy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=RfLUiM8S; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="RfLUiM8S"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f4cc6797b7so1980491a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794290; x=1789399090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=RfLUiM8SVOO3/6fpi3aEeLT5ZrI3Df5mvd5Ss68J3++h2IUWFOo5f+fgDN4PT8L9I8
         V4yPA3kwnKegOJcmnUiQQgUjZryvee5/0iLJExwQqvyg5Zz0wrygl4PR0ee6rUY+M4ov
         DkdAniAZ79ojkQH3qD3UPPUpjhzHz09Dqs5P9piuU6UH2+rTUXWSIp0xvCRcUKHZrhAb
         C/afoA+Np44SzDjE9GcPwvdTjOwxZeWT/XhGFroXTYX53eLo6bJkxh6OimTvYEj/EBUN
         F8+6daWQ9Pp6ejp/rMzTgBEfgC5vkEnxNL6K69emsmnAd08pYqOuBNRLa9Zmk215EHZp
         k8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794290; x=1789399090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=RanIKISsgUmY6NXFQXD4FuMlUnLTLWhbHak5UrTPYw2c4kY9B/1hxopRnHhe4Vc4oZ
         TmxLKtM3G68oOhAhSNXGjrBsV6QCdczgH2Eg/xU2sOX4A+CWRA+QYjIuFO6GxfkOoECu
         jSxiKFArDhAVjZB+ZDg8xC5sshrtnViEL9L1GeVetmhy5yp7Q4+ONliSpQ7TYCQm//G0
         VcZALPLcL4/O/xBr2N/keNzchirdx1RBDeX6sJG6FJ+EEGMtT+OcppcUnAH72zh9coah
         /0It1C4KJrvNOtC07m2C89QKDU77Cv/PjnkN0a5Zt4H7KEvnwP9yvwenw0rtHkEqwBXY
         zrlA==
X-Forwarded-Encrypted: i=1; AKwUvByatrKUziqWqZ/qEczFSbx5wKRoSJC2s/gpOapTI+b/emQXCRgRpqbyrZaK1DLtA3nYYJ/EcsJ0cGKgxns=@vger.kernel.org
X-Gm-Message-State: AFuF++kPJr3Q1t4dbddC6F/ItnSK+9xY4IYQSTzlUjj17ip7g99IZQ/6
	Tc68Yd55FL4F/DG5ZgQdMWJu4AOmLKG3OwA+11fjtWo6NU8H+x8nuFTALw5HODOaBPY=
X-Gm-Gg: AYBFou1uRl7FZ0yhW4o1hs4VWwMiy8SH81ZVudP4Rvlc3pfdjtXlUVfYdj6LIN1Tibm
	cu+1C2obJ05vD+D6WgYUOROknK0IvmwDRtJa2PkM7KzrpafrZd/TvwaBf0c5LFvIH1JZMNRApNf
	eDYjNvBQbBmxwOmj1bcbF0loDZdyYRxbvc8M09Avy0b7D6nF1g/BqxO4ZTlmwMCdapMuyj8E4rh
	L15oVMBN7SYSEUvwIj+RLbc8fMsAutJFlbCarevTAqPhM8aLgEF9jmX+9u+r7+YHlepHniIB1eE
	D2VizqIWV9Gvr0SQ90hofXaaVVJGF7o3WgKsCAshuvLdNP2bH9eUxEqLqRjRPScCcxCmvMUNW4m
	cudmOzeov1r449qPvuUw+HX+e/WVRYf0sdkJlW9N82ZPc49B2CJzJiGg20dRyl1V3lUr8VYHoBQ
	olHjEfDeB2n7vTdTfsRTXHRBE0d1LpD0dFGb9r6KEmg3VgX6/8lym5Dzwsv724yLVSfvWcbt0Ov
	Eu+TA==
X-Received: by 2002:a05:6820:2d0a:b0:6b7:46e9:970d with SMTP id 006d021491bc7-6b746e9a2cemr11233302eaf.61.1788794290114;
        Mon, 07 Sep 2026 08:18:10 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:09 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:44 +0100
Subject: [PATCH v2 2/4] dma: loongson: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-2-0ffe4a007992@thegoodpenguin.co.uk>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
In-Reply-To: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1307;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
 b=pszIBdV0kK1FUCRktbAdGOChrW7kK7Mrhm9RZ+xiLFOk6gHbzZ0byKwiP/SEuuQTnubZrHIKI
 wm5fKOJhDzlDjf8gv7eIzW7XEibz2iIYboaTNCrbKOe1r2p7eKDdhSY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..70880625c6e92 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
 
 static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
-	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
-	{ /* sentinel */ }
+	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
 

-- 
2.43.0

