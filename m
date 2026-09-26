Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C059372071
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440515; cv=none; b=NpgTKXEpQpqYj9Em2cPgZiucd4AtDiLCpLd4u1vXoC7Q8uvZr5GhgBq7PujV2srVUZvKWDinsKjVWRxedDCscD0twsDl8Ah8jKe6oW8gNqCfi+L5Zl/GaivGE9TiZzLQkhUN74QuHwqZpx6RdyE60sdosnnVQBPkoHJGyoaH0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440515; c=relaxed/simple;
	bh=ZVg9bxqPxMdWSnt3gVsmlNcem8zaoQtHe+2Osgh9lqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LF5NuZK99dS68otG/E+NTDCl/baderqfE/3aKxiIo/fr3vQvDGRhIl1h58kruWANHgk/bZ6l2EroOrzHTnvtug+IqfzjBlv0H2GCNcHqzLGYZs8mZWfC7B6GRfKoCSaT1zppegX0duCwpIQeyqtL3Gj8A1lyvW0ZSTkEo2sOxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaokSbxU; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaokSbxU"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d06a12d360so1057227eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440510; x=1791045310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=teOH1PedO9uc8B4td73aFmI743ZwvMaIOd8MGTSTScY=;
        b=aaokSbxUETeqcgg14lRimL4c/M4RngAb2JZihXdrLNUiT4F+AFWFAq+bCmI7/lwFYy
         XrsAwSb/M5q545gDryj6WU25SNHIfqi5mSXjXCDEDTsI2/Z0UstwREV+l2voSI3Yx465
         ixIsk6SHjFm5oAGG7bPljrXnb1VMUYrH8kF9awQEXx4smymlDAVa9JjwVPhQUXUoMApx
         SsLH9SZ5yQ026ypG6hjBHbxR0rCLxchDPUUEYCUDXQsddfuAVr5Z4ksEuIWRkJFOQRcB
         hpEA+h3UA2z/8edWIIbebs/roz6l8HMgsdhykOWhRLRMZnC9SIO8i0zVRxZ+gGubD9ER
         +Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440510; x=1791045310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teOH1PedO9uc8B4td73aFmI743ZwvMaIOd8MGTSTScY=;
        b=u5lO01yn3sVGFiYHOIy6Aw1kWcsjtzeT5zt1xp01h4hu6FgsaZOZf/es9H34M/nLDH
         4rw04StCBdevoEQWcPlTjBJLKE2T398UFHWTkcgtXmsy1oBTI1PoQ/RUJ/7g7hV5+0t7
         NEU97Zd+uejmSMucjkN3TOqlZHYVK1uFW4bwa5r/M4w1lqrDUOUFNg9XM/ullpFtV+Vg
         xKen4zirgMbEM6tCyWL8U4pq7XlXENTX0t2A0RLWrP3oLnOk4cEf4AiCTSo2QrE8FDTp
         W39qNeljgdY8yyxwVj1E9Jrii/8hsg7VbDRWFKWkDue9/YUDDPh4eA7tkHs64XV8EYrp
         zP3A==
X-Forwarded-Encrypted: i=1; AKwUvBylfmPu+1cp4+NLOoAvn7Y1LiJpfjTadGkJWDZa2e+hTeseSu2BLQVIXXkkx/SFi9JJ5Nrtj0W/UZQq+Ic=@vger.kernel.org
X-Gm-Message-State: AFuF++lMCLkpCshYwvGhvUTt6LIc2E4GovPH0qhLY4AjQwRYFGlb6psr
	FkCBWLjmqEEfgWueBwt5L9QPB9ubuayGKDaE0rOthoMPABNc7cMvQLuS
X-Gm-Gg: AYBFou1JPZHlIXDbQFK46ZUa7+xKluxebSOt/IhFK9QH1jcLgT+F4uLzaXYAQOBnpm2
	PWjFoII4j+071RaDj9+Pj+45lTKqvA/YL+SWHcMKzhgGrq/3fkAbGop/jH4F8tvtNcWHkCFnwfK
	T3EXB0PABeiVy5LhhrvoTBjcnQAQdXONFJH531YFaWkgGxYypoU/VM1R2S2w+tmjoFMq2WdoI/a
	56tcjxzVA32/BfmY6ixRTXMBsNAip8Ps9IT/QKpDabuLYbL6w4SsoEwH0RmdZkxKkoR2sMui5XC
	q7Vu3ZzPu0/fjKetsXjQ3Qhet42ptICs7hD3cBdsd8Gt+vNrEEgWSVVBHId7tBmwEiu+eFsIXzD
	4B1+So8h4ddVVxFVEzJUqGzrpIG6dSzE0WKwbi6i6/po7Xl1q2kQuUqfdK6xMEpciIjp/I+oEky
	H0MMXYyE2xI5g1Nrm3QDXI5Jp+WqkhxCZjY0E3Vlx56neBsBT/le0JQI8IKCOtS3ngSFpu+QlHF
	wIG4M640t0YDlPUFJYlSli7SSi/S46U052Vdm/l
X-Received: by 2002:a05:6820:1524:b0:6ba:1356:2038 with SMTP id 006d021491bc7-6d440eea797mr10087219eaf.65.1790440509673;
        Sat, 26 Sep 2026 09:35:09 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4933501183bsm4462176fac.5.2026.09.26.09.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:35:07 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: u.kleine-koenig@baylibre.com,
	andriy.shevchenko@linux.intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] serial: 8250: Fix section mismatch with CONFIG_MODULES=n
Date: Sat, 26 Sep 2026 11:35:06 -0500
Message-ID: <20260926163506.487201-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without CONFIG_MODULES, __init_or_module means __init, so
serial8250_pnp_exit() and serial8250_hub6_exit() end up in .init.text.
They are also called from serial8250_exit(), which is __exit, and
modpost warns:

  WARNING: modpost: vmlinux: section mismatch in reference: serial8250_exit+0x2a (section: .exit.text) -> serial8250_pnp_exit (section: .init.text)

The exit code never runs in such a kernel, so nothing breaks at runtime.
But a function that is called from both __init and __exit code can't
carry either annotation, so drop it.

Fixes: a300273c458c ("serial: 8250: hub6: Add cleanup code")
Fixes: 4cf187f9dea9 ("serial: 8250: pnp: Annotate init and exit functions for conditional discarding")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on tty-next bf961847813d:
    - x86_64 defconfig with MODULES=n warns for serial8250_pnp_exit(), and
      i386 defconfig with MODULES=n, ISA and SERIAL_8250_HUB6 also warns for
      serial8250_hub6_exit(). Neither warns before a300273c458c. With this
      patch both build without warnings, and so does x86_64 defconfig.
    - Both MODULES=n kernels still register ttyS0 through 8250_pnp in QEMU.

 drivers/tty/serial/8250/8250_hub6.c | 2 +-
 drivers/tty/serial/8250/8250_pnp.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_hub6.c b/drivers/tty/serial/8250/8250_hub6.c
index 4d4c54c951cb..848d9723ac56 100644
--- a/drivers/tty/serial/8250/8250_hub6.c
+++ b/drivers/tty/serial/8250/8250_hub6.c
@@ -54,7 +54,7 @@ int __init serial8250_hub6_init(void)
 	return platform_device_register(&hub6_device);
 }
 
-void __init_or_module serial8250_hub6_exit(void)
+void serial8250_hub6_exit(void)
 {
 	platform_device_unregister(&hub6_device);
 }
diff --git a/drivers/tty/serial/8250/8250_pnp.c b/drivers/tty/serial/8250/8250_pnp.c
index 7decf62400ab..a6257cd6e246 100644
--- a/drivers/tty/serial/8250/8250_pnp.c
+++ b/drivers/tty/serial/8250/8250_pnp.c
@@ -531,7 +531,7 @@ int __init serial8250_pnp_init(void)
 	return pnp_register_driver(&serial_pnp_driver);
 }
 
-void __init_or_module serial8250_pnp_exit(void)
+void serial8250_pnp_exit(void)
 {
 	pnp_unregister_driver(&serial_pnp_driver);
 }

base-commit: bf961847813d9edcb5a9c089714069428d141fa9
-- 
2.55.0

