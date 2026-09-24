Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950F4248D6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233934; cv=none; b=ay6wS07rbJDVFB95Q9Ij0swbSYHSt96VWdC6p/a46BO2RAHRf1OdumSwYvEwa9ZZ+hMeAmSLiPpIAon9vnSkcUCjcLff/sHYqM/j310fAfE5M2e9FD3eKPznM3l7FTB4PnJUVVk5XiJreXGWrxZkCLw5R73W+WFi3SRqIfPIyZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233934; c=relaxed/simple;
	bh=T52M5Ld9AZqux4uZjeBCWI7z3pfOhHjlLYsYVT9cICk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rpnpsTEjUVD/2MSXzcdZ3Tzxtvxm0SqXAmW3Gq4vZTQn9Yr4znLDthgFgvsr+VO3XA1TaM7l+I6p1XKaKXzMiuVKzZvhQ8dc5e19ooJDfCud4aOwCqksBWEDxQUlMB8Wtn31V7NI9/UKP+B36UGuqr53JzprwkGHfmeI2p2GHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=j8DSLyzG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="j8DSLyzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790233922;
	bh=T52M5Ld9AZqux4uZjeBCWI7z3pfOhHjlLYsYVT9cICk=;
	h=From:Date:Subject:To:Cc:From;
	b=j8DSLyzGreX9gd1SVx3/u0nFgl5VbzFZsl8AwT+UWTVbmNDOImuKAtUhhbnCNvcMv
	 8y4FCYGf+lout75OTT9E54VF0sFl7jYUrMinZGlul3D9JNrb5avsi2gZ86iqbVOSiw
	 QH+pu/e41HFpNoWkSD5G/vJvvWASTPvt+sNyUMhc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 24 Sep 2026 09:11:58 +0200
Subject: [PATCH] tools/nolibc: fix the function argument order of calloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-nolibc-calloc-v1-1-c49b383475d5@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3bz8nMykZN3kxJyc/GRdy7QUYyMDCxNzgyQTJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaADytJXhxAAAA
X-Change-ID: 20260924-nolibc-calloc-9fd3208470b4
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790233924; l=1061;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=T52M5Ld9AZqux4uZjeBCWI7z3pfOhHjlLYsYVT9cICk=;
 b=8gNtzP0AJxc2LeUJpJOB3SaCyt4dvmodq2YUHPCv4swO8ZibZvT+bsRXQFLgXMr7dYOtJj/cF
 hfOOTW+J5ebBZPGu7QsZOsDeKNU4H5L8YhMCHiv5fQ8tJglaILbN7FB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

As per the man page, the number of elements should be the first argument
and the size of each one the second.

Switch the arguments around.

The behavior will not change, as both arguments are only multiplied with
each other.

Reported-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/lkml/aqQmCtPf_5M-BjRW@google.com/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/stdlib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 1816c2368b68..0e9748dcdb5f 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -143,7 +143,7 @@ void *malloc(size_t len)
 }
 
 static __attribute__((unused))
-void *calloc(size_t size, size_t nmemb)
+void *calloc(size_t nmemb, size_t size)
 {
 	size_t x;
 

---
base-commit: f2212892b6a0c2adab438783e9fa8093c90786d7
change-id: 20260924-nolibc-calloc-9fd3208470b4

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

