Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB3488235
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950064; cv=none; b=iJdjlJmv2JzupGoGP3TMM2hgzKQih0uWjaeyGMZLShSGdspL38/elNUVKyqHyPlWCZfBHQvc90yiGYSCQlhy1vp3IUpSlCU93g4NFNAnzi8IiZHBj23XkriPKowL0eHrUPUHQggPj7rTqPBzEJDvshzyihpGsqpMjuw9x1Wu5F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950064; c=relaxed/simple;
	bh=dUlqe9MEUz27qflq7f/DsZEf9FqIZOQScouBJJ/wyzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4G3RFLe29DsJ1j4rZ/RP8TN383ZQBEeJ0gXKrwOgf6OSLPwsHRsuw1l8H/dVc/kME029pRjYrhOzeBbRhDVMQ48+8kmA4K8mli87gsAno7+qrNyCp9YRSibTLmwHMqvy42P/NsCqopeN7spU9yPxzr7TIqkqaP+BpnqK5jLOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=rXnaD9V9; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="rXnaD9V9"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5338fb1d005so12676721cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790950061; x=1791554861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWlYe2OgL5D3i7spKyZyNdCmWVrX9IvBIlGbQmrDIIQ=;
        b=rXnaD9V9IrxO6z5prkR5lLHFw2Lrd9zmHZiWcZ31ZlGZbuyZo2lLI4RXqadgHXNfNB
         NVErZvuhMSmAy4oUvZD/GDOPUE0RwSqQQ4uFS3cpeWwd9HO4uEYNdmM2ltYGQgUO13hh
         d6GyHD3v553MoSEXRnsFNakA0GHaYQVM/fgp+vr6wuEmVqapaz88kW/9OlDLiF7/hhyp
         hwQ0Kb3sp3/tEae5KIctPd6yM1wKzOqqgmjilVKbi7JmhEJhVwIc4VQ0sd+O26o2mo59
         ZOTlIWAMc0i+fYf9vrw9oOHySRrwIt43ifbw1FJG3XEWuqL1jnX4Kj+BH2oKuMCE6Uc0
         5q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950061; x=1791554861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWlYe2OgL5D3i7spKyZyNdCmWVrX9IvBIlGbQmrDIIQ=;
        b=2vresdcLSczjWbOg87NAjG7Gl6G992KDAwEZfj/qHE53TpM6fBR2pZcEgiduZfhNBP
         XlHKPYod63LqtM6rPIjybFcYAOuK6Ry9LQ6PTaBPw5ZUhSuP4IEY3pOt37wrANWyn5H+
         93eIel1QZ8oAiXy9dpPRHykp6U9v1UQZchjSw03+E8GCAIGk6FnEIQIxt0ha1qV22sU4
         SyGa4QvMGdHDUiG4z8R7+0sTliLPvX9nBXm+dDs2M3peZk0zEUZND5lFy8JVqE+iEfIp
         UapDjVdugzHkhhZplSKVMGM5yS1ybDX3QsvhyjdnaoyTiyVxEsN4xqHew6WC3SdfSZPS
         TtVw==
X-Forwarded-Encrypted: i=1; AKwUvBz+4Lns0jmWtL8UrYKt3ScyAWKwcKq/lTeHuMr2eIbNWxhuobYkfYuBA8Swjuastb5GqQ1jcr5Fhu0P/Nk=@vger.kernel.org
X-Gm-Message-State: AFuF++mtZICo2kIsDgvcYCB1adwhDmPM4spfsv3y+3ehx8ihhm1UxN+b
	mWRefEK4l85fWxZv4VUaFfEudT9CZaarWPEhvkKjabgoIpfZEIm5aGAMaQM2HuV+8ik=
X-Gm-Gg: AYBFou1O/kO0kAxSggJh/hF/ag8YRK/nMt33HVcKf3ornMRRd+1xCu2RlhhpApZ8XNt
	pKBJSzPE/nz3k938tl9b/196eq6F0iKZUvTbA33wL2o0wdkAyuiMgstBWpPvF5wSZ+MpfsR0x5G
	JPm5Rxvpirj49dAv8z1Oo3sPXr60K5b5NKRSmh10IfuOpkd98WzBU2U6utvb9jWBv01RALBqJI9
	xIWUF27VcV+tJNQr96bpM45NnZeMrWXO+85cVw0m36NxBhF+UHpEYCrslJ81E/77UVWiB1TjHdD
	mtyQutPbQjTlX3+Uql2IY4ysl4FbadzMaRpofu7aUCs/lar1oNopYOc3+ZTWhyxgkbimELt199b
	As1UXN3Dgcw33e7sxjmI1dhOlYQTh1PLocd2omxtnfIdxIF9+NN/g1/t7y8JrZ+JJHRZZ2yN/vS
	Vs2zKTQUtqAjM8Rrn0E2Dl+1eqB1aDAL/Kkj09fpHggUGEfpV0pYuwc0aEy8w/H8WkcbeWNQ5Tr
	poLzlvDL2/yog==
X-Received: by 2002:a05:622a:aa81:10b0:534:7732:a15d with SMTP id d75a77b69052e-5347732a417mr28075001cf.54.1790950061576;
        Fri, 02 Oct 2026 07:07:41 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b1aef0sm20821166d6.12.2026.10.02.07.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:07:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: daniel@riscstar.com,
	bhelgaas@google.com,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] misc: Kconfig: tc9564: fix and simplify dependencies
Date: Fri,  2 Oct 2026 09:07:36 -0500
Message-ID: <20261002140738.393453-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564_PCI config option selects PCI_DYNAMIC_OF_NODES.  But that
depends on OF_IRQ, and TC9564_PCI does not satisfy that dependency.
Simply adding "depends on OF_IRQ" results in a recursive Kconfig
dependency, so we need to satisfy it in a different way.

On the other hand, PCI_DYNAMIC_OF_NODES is a user-visible option and
should not be selected.  So switch to depending on that rather than
selecting it.

PCI_DYNAMIC_OF_NODES already depends on OF_IRQ, so we no longer need
to depend on it directly.  OF_IRQ is only exposed as an option if OF
is enabled, so OF_IRQ enabled implies OF is enabled.

Finally, PCI_DYNAMIC_OF_NODES is only exposed as an option if PCI is
enabled, so we can omit the dependency on PCI.

Therefore, depending on (rather than selecting) PCI_DYNAMIC_OF_NODES
satisfies the dependency on OF_IRQ, as well as on OF and PCI.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610020124.ieOiopjQ-lkp@intel.com/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 1304b0c47ef81 ("misc: tc9564: introduce base PCI driver")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/misc/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 9c5b1e9d672e8..6ae10ef8b3cc4 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -570,9 +570,7 @@ config MCHP_LAN966X_PCI
 
 config TC9564_PCI
 	tristate "Toshiba TC9564 PCI function support"
-	depends on OF
-	depends on PCI
-	select PCI_DYNAMIC_OF_NODES
+	depends on PCI_DYNAMIC_OF_NODES
 	select PCI_QUIRKS
 	default m
 	help

base-commit: 04434a1d0f311d76b1f15fa987918b471a0b8c6a
-- 
2.53.0

