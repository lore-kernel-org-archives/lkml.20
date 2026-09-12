Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBE0309EE2;
	Sat, 12 Sep 2026 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192329; cv=none; b=q9LGsbY4UE3dI48Cw7Bi4fuH4E2x5W9m/VmAokXgxQLXBTLCPSDeiAWj8arbcm0bPXtBVLBYhGiN0OjltDApxu3zCWfvqDO5THaBidY6RiwZDFfBBHMxvdXvqSCTfcE4ou7xJLbXfFrehOPeCMRxAWpVaKLe+ZvIMp3Ux9g6oOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192329; c=relaxed/simple;
	bh=ck9BzJs+7OYe7eWDt5BeszcTEjlMDHIz4ihK2pcBK4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IY/1tMlaOThyNTym0JNTejrhIBQ+xhjRE4pNRz6foxWdt8E5h2cOK2CCARoarV2ZicH1i9Y/F0KfI/6e3QyOO85N+fxwP+WCnBtfWtaKU7oMK9bAKVcrhIwRmgRZEKwiuDv9+Nx0oldjV84ZS6Q/kehMCbXBdzsazZB+1Uy8/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YN5shx53; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YN5shx53"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9zRr6x0KiX4YokQx0BMWl+voXp0ew9toeBX3EyE4bq0=; b=YN5shx53U45fnRVlkxgdu+d/NK
	ClwhMRupGh5VIZNLCoER+E33mMwQ5JJLmBqWeYQbcK55RSlhaI7345uijvT9Q7xoRg/+XHnrOwQjC
	T/wtXxKAI7o8fHhepQYC/kIMufhcBr5oF3HZ03sHmxkOfuGma+0wqszD6gxWHyY1RplWB6b/ARRJm
	HHfyMKeo7b88h0zI0mOE29U4jmIEIiwD+wjdGnwcS65jiXpkX0GWMeeplPSpN0COtdh3XM6Zr0jOM
	VWP/8BqMUgpfmqyJq6nnhwBE8ftrGnojOjhOzybeb/3TmsRb3fp/bLaIX5afLzepxT2sgHASgsTJv
	7NJlad5g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Gei-00000000Z8z-007J;
	Sat, 12 Sep 2026 05:52:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: kernel-doc: include "define" as an identifier type
Date: Fri, 11 Sep 2026 22:52:02 -0700
Message-ID: <20260912055202.103573-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the list of identifier types to include "define", which was
added in 2014 in commit
cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")

Fixes: 91a3d6be99e6 ("doc-guide: kernel-doc: tell about object-like macros")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org

 Documentation/doc-guide/kernel-doc.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260911.orig/Documentation/doc-guide/kernel-doc.rst
+++ linux-next-20260911/Documentation/doc-guide/kernel-doc.rst
@@ -565,8 +565,8 @@ identifiers: *[ function/type ...]*
   Include documentation for each *function* and *type* in *source*.
   If no *function* is specified, the documentation for all functions
   and types in the *source* will be included.
-  *type* can be a ``struct``, ``union``, ``enum``, ``typedef`` or ``var``
-  identifier.
+  *type* can be a ``struct``, ``union``, ``enum``, ``typedef``, ``var``,
+  or ``define`` identifier.
 
   Examples::
 
