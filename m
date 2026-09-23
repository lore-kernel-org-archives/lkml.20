Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDBD19CC14;
	Wed, 23 Sep 2026 02:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131778; cv=none; b=KCKcWA+VXdFcXb1qXBnkIjialKH9dSuZd1uW1Zn0bgmNnD27EpwM/vYXNK5GJUcfxHNN12bk2PuPqKRJVJUPoMyRmcUToqh0jsyeGD9cUXAE0D1GeKHT+JtF7bu7nmwn8XaAiqfKp1mytnG+kOj4Qs6p8aU5Or8zdmCZLFRL964=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131778; c=relaxed/simple;
	bh=41le/brsOGlfFTqe0lwMDmd27Y8DaWp3gaMLEDT8QcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pL3XslgWoEsvFAL4v3O1wXIE2l3bta0RLtJEXiX0lK6+sQUdmswWq/YUooIEclIQJ0qcnKRUApnseA/iPjUmhzr7oPe2MaCJrwt/CVaR42gOa0TynfCZkP7DPaN0WzgRutPS9sfacMKABvPP0D3L5XsJCCnt3sD7jXVNaZBEwH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2YrT4dlJ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2YrT4dlJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=7ONYe/7w2EXW8py/4ztuf5woebx//EOScMOnkClgYt0=; b=2YrT4dlJr+EBT8loz5E2+tD6pp
	RSZljFyYuJpV53y68ASZNZsoTPnatnrA2JlBT7n5/mAdQFUkyE3Yv/SgLVMULKQ7ISEC4y1TUKxKS
	w3e5J2Be6jC2JLWywIVZ/f3Jq6jddeiqp9wf9BEs7WmJ4Z22gwQJT4cLHe0CIPk03ZPDOlB3wgWOE
	3JctFKChtpuujswv3p8T11iLH/zMzVmluSnmbR3o4iv0OInB0Q5P1za4sC7Y/qGo7O3WOARCQlDVJ
	luGDUcxxLq2vwEAwcAkTP1bTiYj3JAv468R6kh87BgxPrm/dd1AHuspnu2EPE+pzXfw+UD4HzVKgX
	jo9jhQOw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D2z-00000006z8V-1gRL;
	Wed, 23 Sep 2026 02:49:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/ABI: testing: aspeed-uart-routing: use literal block for console commands
Date: Tue, 22 Sep 2026 19:49:18 -0700
Message-ID: <20260923024918.840039-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a literal block for console I/O so that the lines aren't merged
together in the produced output.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20260921.orig/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
+++ linux-next-20260921/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
@@ -8,9 +8,10 @@ Description:	Selects the RX source of th
 		selected option marked by brackets "[]". The list of available options
 		depends on the selected file.
 
-		e.g.
-		cat /sys/bus/platform/drivers/aspeed-uart-routing/\*.uart_routing/uart1
-		[io1] io2 io3 io4 uart2 uart3 uart4 io6
+		E.g.::
+
+		  cat /sys/bus/platform/drivers/aspeed-uart-routing/\*.uart_routing/uart1
+		  [io1] io2 io3 io4 uart2 uart3 uart4 io6
 
 		In this case, UART1 gets its input from IO1 (physical serial port 1).
 
