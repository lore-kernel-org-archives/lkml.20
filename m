Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706051;
	b=qt5YhCu9siKsPJPFwHgMIYaAoryJn2QubVwFb6QwYwkUg2jh+d8FbtlEc2gKJkKGaITE
	 JHIHPuAMAsgoQGIUdjfo0Q5bAYAiACH03YOQQXMWfVcDk4ZeX3hexgSlP3I3VWCq6/a0o
	 qN73M+oQ2mzocnXfympFLAFMQxqeslmNt8I5QS8fo7cuOgFcZyFK6ZKcrQHGkdPhQgRQz
	 BTEUZ/cMRVYUum7zkS9kxVLNB4dtkYg+I66FJNp/C8Qn0KLjmNzUOwtyn/KmmGTpQh/mk
	 d4vQUjaXHDce27/lwoPCuz+S9qdUlmxpougDhb8ZhbNEkh3znAaPnjnj9vTHTltIVKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DdQj1OJsqke15LiuITwTZ1lLiXe/9jhrUAiWS1KivmE=;
	b=nqpAzDjLjeNbG5ZWp1eU6U36p4EWXe+ZtNlJfpMldwIJAcfVH2EC9JhA1DOLLRpgvePp
	 AHBG1UMJDJlvWbSc3MFOrc4JN+D9r5g1VF9jI/9RJ7GBH2lxCy3/9p5q1hw01c/6KCUM/
	 QxaNpLaZkfEaFCGzdIjJMCQ1AGHX74Dm+WDHrYVeOyt3457r5NUdIk0ZW6wHAGxJY6Wpe
	 RMejsPTwDJxG5lxm5dmIUjPyWf51EuaXVeRjU18fHD29tzPm0hMhJTX5V6wwl/ODVAM+I
	 M89G4X43TuYSZNqjnUFcjMHuODJxj/b1wuVNH1B6RCMZtJkyPpcPk1RZ785ppOoKQ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QXnEGN+A;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA26606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA26606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QXnEGN+A
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so188363241.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792706050; x=1793310850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdQj1OJsqke15LiuITwTZ1lLiXe/9jhrUAiWS1KivmE=;
        b=QXnEGN+ADE8QQUEiQIWqXFxeuQbHbcsNdYkoBXoM2EkwZh/qs8fN0nf04m8fQsEEug
         6kgx17aA/Wca+4DjMaaTTwpfZDvRAbWDIIFDVI5bTW+zcpKbIj/NGQMdQVMmJD5ELRh0
         rw0g55c313IbZKM3gBWRydKagnYA8/omnTR0Ksoh90wjSpYI5rs77veYuDRNQ4qpHDJL
         8Mg31sIjIhZDjlWREivjhCoNTv/ubSGdCExnv+x/wt8+6LdQjKPgQ7oilWv2amd9nbbs
         GH7mRBpAY7bHD3HH7nVVnl/QqdEbXAe5ahkvS1MxXPBAp4K6dQcv4eTtOD3QYOVtkSV1
         /3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706050; x=1793310850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdQj1OJsqke15LiuITwTZ1lLiXe/9jhrUAiWS1KivmE=;
        b=Wwg3xzpEvah2egapnwQxauFz92OfWyAHyNKq6MTudar38Hf/Y67QQvxGqtdLtWGn/M
         XcnNgrCfzCeIlwcGNInGuVq+rWEfJpGD33ZQkgWORM341EgkEig3RuKICL208svnGQIU
         wEQrW9DlKalH9QVK9eZT9saKVt5zg3YZZQBhqqsmcPx++inL0wFAPZb5bWtiBdq6JkNo
         ZqIEY+tP8heJJ155wg3gGC7jv06ChBKbZpaLMvhl1lyK0pCO9PaMzSnscZYGtiiIeaFg
         pqDVQsyyteqbOxV/qPclQVB7a9Bo+xXl8BDObrAEf781W9yqhtcHWeQyg9gzY91IoSta
         R3ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzzzveJuiJ4orcSIAZP0IeXElNGkrS47/QHNNJxo3+IY0uUMOlCl5rCDhMCCGxCasKbBY/Yq3MFq17oxqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOCqCBYXM1Xu9VZ1dbKHO2cTY1dB2qLML3sr/osSpzlyPb2KWT
	pYMGhdLgmdA7HTOus8AoSwkEdpmDYy4CGgEGA9Chy5S2K/60MX6Rf2tB/TPrbCsO
X-Gm-Gg: AYBFou3EBShLriuZl/cjz9BNzlGLuuiQ1k0keh+P2eM5+2zvlrXAUyzBY9kxrxTJIpL
	2HYmNgnAcd3uCEE6MtbVC/bx4+pwCTrxYz9ocwjJGE+pXxfYSSn1f3X8OqlIMppTB661Pmvuehg
	HmHQGtF4XotdmqNK2FSkyW8vpCrzMVPKFQSkz+EjXcl06SeI9rpt+o8zkZ8thUoDoJ4rFk/4nhY
	5wWNfMaLRfeRGdGa5NH+MGPTcI/P1YkZID5WQ0KhPkFurhCAUA9gZ6ST1/XWw/o9fSv7hEGz1Wo
	R7MdVjs3F8C+tWYhUAVvyUzwHzV/dFXZxVxiSh+mCwtBo4BZSKx9z9NqEwD8mM3T2Ogu9E6tE0b
	MX3FnSufKYpmVALzLObncFb6EQbY29RhmhB6/9I8h+1SnZmQzA8PjCi1EGkXmjfBubuU6HwVT/2
	nLh9pEt4bFl4vwoiAAsuiH8GJoLTxzMbpyW8X7LkDswXEuco9zdPywdV7myyQmQyBWYBlQYg2Ab
	BqEq7yRbg6IVtXra/iBecJgqz9XF0A/D7ptpbUQ5FhiegZZSRM227Cho9b5SsuXOHk3oPiAl54D
	KI1S8v86wW46RPGiAaha3g==
X-Received: by 2002:a05:6102:6f08:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7ccc32180c3mr272610137.16.1792706049491;
        Thu, 22 Oct 2026 14:54:09 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13eab957sm434761e0c.6.2026.10.22.14.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:54:09 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH] staging: axis-fifo: Fix three real issues
Date: Thu, 22 Oct 2026 18:53:49 -0300
Message-ID: <20261022215349.87471-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Fix three issues in the Xilinx AXI-Stream FIFO driver:

  1. axis_fifo_debugfs_init() did not check the return value of
     debugfs_create_dir().  When CONFIG_DEBUG_FS=n, the function
     returns ERR_PTR(-ENODEV); passing it as a parent to
     debugfs_create_file() triggers a WARN in the kernel debugfs
     core.  Bail out early if the directory was not created.

  2. axis_fifo_read() returned -EINVAL when the user buffer was
     smaller than the available data.  The user argument is not
     invalid - it is just too small - so return -ENOBUFS, which is
     the canonical errno for that situation (see recv(2)).

  3. axis_fifo_probe() filled in a 'struct resource *r_mem' pointer
     that is never read.  Pass NULL instead.

No functional change for the normal path.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3d358f919..c19cb68de 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -148,7 +148,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	words_available = bytes_available / sizeof(u32);
 
 	if (bytes_available > len) {
-		ret = -EINVAL;
+		ret = -ENOBUFS;
 		goto err_flush_rx;
 	}
 
@@ -378,6 +378,8 @@ DEFINE_SHOW_ATTRIBUTE(axis_fifo_debugfs_regs);
 static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 {
 	fifo->debugfs_dir = debugfs_create_dir(dev_name(fifo->dt_device), NULL);
+	if (IS_ERR_OR_NULL(fifo->debugfs_dir))
+		return;
 
 	debugfs_create_file("regs", 0444, fifo->debugfs_dir, fifo,
 			    &axis_fifo_debugfs_regs_fops);
@@ -428,7 +430,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 static int axis_fifo_probe(struct platform_device *pdev)
 {
-	struct resource *r_mem;
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = NULL;
 	int rc = 0; /* error return value */
@@ -447,7 +448,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	mutex_init(&fifo->read_lock);
 	mutex_init(&fifo->write_lock);
 
-	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
+	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-- 
2.56.0

