Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF3340DB0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789965964; cv=none; b=ERCxqLsXNmhCutfqzNkHzMXrWaWIgNnGXLt1Axl2reTLQEoLbkRl9MsdSczoMaqTA9blcFMaN93nsVSS1sZifDbLWM49BUH/Ea0Bld0qzMCn8XnMxq798uFR8VoC3LSy9vxdOGmCPr9TaQ20AGwdciUSXkQYiqOtTMwd4yYi6N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789965964; c=relaxed/simple;
	bh=tSW0xi6H90v70y06pFGW1xsaa4aHKqbJPW12mP4qadM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mPgHyTy040+o+s8HjFNx4URfAnKZDJR67tdN5wn4FARwZHCY9rul2dW/IrfokXB2dfbk82KinAl2LMdkAO8cKnuuqwaYCVfzcphX5fbHxGsQrl8a87LXEu/o5foOtPIhXys5m45EQIGaa3kSUQ5Nr3zc//AYqRft+JvirYobu2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KEJWj9f/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KEJWj9f/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Jc3d/hniVBdnamx4RuF2pd5ZOvSkp+a/d5A38FTQZiE=; b=KEJWj9f/u4HSlmpP23wU0e2Aun
	tnV4phamj/Ry3Eb/xS88O+PkIse0esEMpat3JOm0pa2/316kHyox0/2IusbnJ0mmNFKGp+JSxEnHU
	CkMCpmTXNrDYEx7MpuTsTZLLQYiyv2wuH3pGPuS5X/sCqyeA2vwUyKCx6L1tcHwc4TuNH9ej+GaRC
	aUgzRReuUImkeVkOTUU+zHz5Xdl3fC+qbnrETy1/HEp87pa3sd3DZ1HbEbwASfM+W4cNHuxvX9/cn
	KD0fWQBqgttypH5KDpjVylHIoKTOd6nBcNHzaDTJVgUAmatUNpk+jUTJId5CLTe4UQgvwt9ncjBrZ
	kyQ37aSQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vuf-00000000qxu-0Cs2;
	Mon, 21 Sep 2026 04:45:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] docs: ABI: auxdisplay: use literal blocks for commands
Date: Sun, 20 Sep 2026 21:45:54 -0700
Message-ID: <20260921044555.90187-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use literal blocks for console I/O to separate it from the
surrounding text. Otherwise the lines run together, without any
clear break before or after the commands.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jean-François Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

 Documentation/ABI/testing/sysfs-auxdisplay-linedisp |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-auxdisplay-linedisp
+++ linux-next-20260918/Documentation/ABI/testing/sysfs-auxdisplay-linedisp
@@ -11,7 +11,8 @@ Description:
 
 		Writing an empty string clears the display.
 
-		Example:
+		Example::
+
 		  echo "Hello World" > message
 		  cat message			# Returns "Hello World\n"
 
@@ -23,7 +24,8 @@ Description:
 		Read-only attribute showing the character width capacity of
 		the line display device. Messages longer than this will scroll.
 
-		Example:
+		Example::
+
 		  cat num_chars		# Returns "16\n" for 16-char display
 
 What:		/sys/.../scroll_step_ms
@@ -35,7 +37,8 @@ Description:
 
 		Setting to 0 disables scrolling. Default is 500ms.
 
-		Example:
+		Example::
+
 		  echo "250" > scroll_step_ms	# 4Hz scrolling
 		  cat scroll_step_ms		# Returns "250\n"
 
