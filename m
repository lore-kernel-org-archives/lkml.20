Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32732D8796;
	Mon, 21 Sep 2026 04:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789966156; cv=none; b=k1rJ/hdPxFkhEdaGFwfIA2BgWZTpYuXpcbkeCH1Hz/Eqv16UZmkpj+2I/aMbuS9ZoWB15D1Hs08mvpgjP6nKAvUdcmeVKWZjTA0cI9uEHIgtplUOQLmNlIUvbZlFXlZLlSoO0pYgT0Z875ovvzudPUNgx1vezgnZ9HVeBS1olo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789966156; c=relaxed/simple;
	bh=jdLKoM/3qoyG3HtKHPv3zDQvJqvZQjRe6nyilfnoXkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGW6XWWPvnNixk56CZJX1JqUMByivHx9VxZgJRE9GxQv54d8qcH/fkJrVlJqSBcAfNFq/L63DCTIQgVSJrEU+ytOujvdhygFbxibkPWtnmAZBuLvhCMyyazjkLE/G5/G7To521MD5mNVeA0uf/H1FWlKJpSNUuPPJBBMw/5E1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yPk2IVOK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yPk2IVOK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hFrDEnXQocfpBgfH+Y9XXbJ4Ou1K3JsIGRRmEG2wyto=; b=yPk2IVOKkccwV2UJRzYiH5k5A6
	hRnqjO/kNrgPC2+tW9EOzBlzM3/Ehg5bHz3Yyj47QKWTazWJiuZv7P53wm6jKocLnVizsO9v0trqT
	M5PR8dSryO6jRgEvhRTsVVNL9VKCX5amHLI/wzG0aCwHf7WI8iRoc+SR+P/Oro7aqdoyEgWMl55sY
	7KeK8kenERraDECu3q+f7IBmM49hVaCgGj6u2d5LmOX+UehsDnuatSkq7mZs1sNsoahNO2gNVmYJ9
	aNtRF2dKXzw7xQOQ+f2lMD7gqf+kR62WVzhR31ilz1QoK2fTSZeKi2B/7Sgbu4QZ72BlH1ZB9ZgIr
	pYsIGr7w==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vxp-00000000r9m-0Ea8;
	Mon, 21 Sep 2026 04:49:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: ABI: TMR manager: use literal blocks for console I/O
Date: Sun, 20 Sep 2026 21:49:12 -0700
Message-ID: <20260921044912.97843-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use literal blocks so that the console commands and their output
are not joined together on one line.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager |   14 +++++-----
 1 file changed, 8 insertions(+), 6 deletions(-)

--- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager
+++ linux-next-20260918/Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager
@@ -3,14 +3,16 @@ Date:          Nov 2022
 Contact:       appana.durga.kedareswara.rao@amd.com
 Description:   This control file provides the fault detection count.
                This file cannot be written.
-               Example:
-               # cat /sys/devices/platform/amba_pl/44a10000.tmr_manager/errcnt
-               1
+               Example::
+
+                 # cat /sys/devices/platform/amba_pl/44a10000.tmr_manager/errcnt
+                 1
 
 What:          /sys/devices/platform/amba_pl/<dev>/dis_block_break
 Date:          Nov 2022
 Contact:       appana.durga.kedareswara.rao@amd.com
-Description:   Write any value to it, This control file enables the break signal.
+Description:   Write any value to it. This control file enables the break signal.
                This file is write only.
-               Example:
-               # echo <any value> > /sys/devices/platform/amba_pl/44a10000.tmr_manager/dis_block_break
+               Example::
+
+                 # echo <any value> > /sys/devices/platform/amba_pl/44a10000.tmr_manager/dis_block_break
