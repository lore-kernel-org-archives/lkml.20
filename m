Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC34A483C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403356; cv=none; b=Enjow/eJuZ57tzdCbN7ii2CFxTE4y0tF8d5JQ/OTT0O/9oG8Uw44frcKDQ0A/mri7qwljByNyRrCd2rmoqwpRZKFBDUiCRA/1U85GB6zJ+tB5kJB3HterMZ7/QIF0EA761eGLGB1z2Hm+EIEdUyVaQ3gL1ZND778qqtXS5/X5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403356; c=relaxed/simple;
	bh=EoEqtYipkjC2mL9reFxpmMHbI4GZb+vsw7XSp5wGiOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hOxzDSROuJDscX3kP3n3FHOvjjBkbDACQefrWNQcl316wgXqXRWWA62r0UY2wyhY3aQDVZjuvrqkUVTa1hkns/6T1D40f8ZQSTwV0x82iW6eD3lDKh+9AxX6cXQPWEptyGi83H0XYscquDayeO52evFJWkmmXH7RgcoIIYvsgMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X7OPz6kG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eo0tsd31; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X7OPz6kG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eo0tsd31"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792403353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZduDr86lxQRZs6t2MnFvS7B3F4YUnObuB3EBvjKUqQ=;
	b=X7OPz6kGfrnlPysLILZCln2B3DTiMGmTN7RF0w3vyTKnoLrSw9zUi3ZoV6nAbEH5Fm+S2G
	osqq3T9vOtncpeEQ5yooPDlHLhCF/771maVVN7y9o6Gmaj5FQq8D7oGnBBW2asjYyijiWU
	ttP7tDNULEyhOqwFrb67aYOW3qxtKlcE7NgRsXCKVNjZhAPsTdmdkZv/gmQ0+YAXtstjqo
	v74P+PV0rP/bae2OwudGiZujgqhXa51CCXM86xeg8uiJ4pyq4HtzgctS6Z+jra6hma6mRw
	vslJzNjEM8G0kHncW8ZwEq6+kjMaAgJFjVddO+WxGNhj2vzO75t1DY6wTbWsfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792403353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZduDr86lxQRZs6t2MnFvS7B3F4YUnObuB3EBvjKUqQ=;
	b=eo0tsd31qzVKz4oZKQlVVZI2E2HFdMEbLSpJc81iFiZyzkxLXRHm58iYmR3rQUSB66GByd
	BTSpIXAGlsajMcCg==
Date: Mon, 19 Oct 2026 11:49:04 +0200
Subject: [PATCH] nios2: ksyms: Declare __mulsi3 export
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NL3bzM/GIj3dzSnOJMY11DY2NLkzRT81Rj8yQloJaCotS0zAqwcdG
 xtbUAwfScZF4AAAA=
X-Change-ID: 20261019-nios2-mulsi3-13394f57e37b
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>, 
 Ley Foon Tan <lftan@altera.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792403351; l=1453;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=EoEqtYipkjC2mL9reFxpmMHbI4GZb+vsw7XSp5wGiOU=;
 b=Bt7uzXx24nb90/SUi3EyrHxJDqMLLRW2qsxVr2SL51CA/HzD4dU/zOxmlHlTkGmGgXV6wUuEt
 lCA7WbbGsiLAzP27orD8Dpiq5bYOVqqJxupoSoyymGsa9oL15Gw73qK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

GCC may emit libcalls to __mulsi3(). As modpost is not aware that this
function is provided through the linked in libgcc, it fails:

ERROR: modpost: kernel/locking/test-ww_mutex.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/time/test_udelay.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/resource_kunit.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/fuse/virtiofs.ko: symbol '__mulsi3' undefined!
etc.

Make sure modpost can see the symbol from libgcc.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610171933.J4bFOfL8-lkp@intel.com/
Fixes: 2fc8483fdcde ("nios2: Build infrastructure")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/nios2/kernel/nios2_ksyms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index c40aa39e8658..e8710a269b39 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -38,6 +38,7 @@ DECLARE_EXPORT(__udivsi3);
 DECLARE_EXPORT(__umoddi3);
 DECLARE_EXPORT(__umodsi3);
 DECLARE_EXPORT(__muldi3);
+DECLARE_EXPORT(__mulsi3);
 DECLARE_EXPORT(__ucmpdi2);
 DECLARE_EXPORT(__lshrdi3);
 DECLARE_EXPORT(__ashldi3);

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-nios2-mulsi3-13394f57e37b

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

