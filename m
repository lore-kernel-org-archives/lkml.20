Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267479;
	b=EWEmwGCApD70CDKfgwRVzuBH9M1xFlYhfRHwiS5nxA0rp5Gud9xV8kAtMuYXzwuue1VZ
	 4/YjFN/e7xYTjwLF7eQsO835lto0bbXubg01JKP9wNrj3Gql4jAkLEg4tlLXs/eyjvLx4
	 f1B9knwX5fv2jD/luUCkuQ/CBKUksv473vCEuFrdHQMYpXBft23TugovI5tl2MIm9RolN
	 nnImwyzB3e6RgNcNmZCIyYP1311ByDWJASH59qmNVOPR4kGzycUk7HomoVvDaRoGBJVTG
	 3layTOMt08cbTRh6bpGFHeQxybc7wt7w0wXqNEiYZO3vSgv0zgX6ADS9gqhG5zYt/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267479;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=T1VRAWfktAa1QFJ8/b65HvLqotR7EUnr+ztP0UI0hgc=;
	b=l9Kq+aNt4i1v2CIQUQjZx+2Vwi17r0h/2T5APwEpKduHEQMj+M5bZSWtBi+CAorv1gkJ
	 40ETFGkCZmLdX4A1Yjnr1ZdAigG1gBOoGK5XsvSA5V8Xgy3IMN7538vzmCFbwvqYRO2WD
	 bNqUyvXVNwgwXMD6chA6TOSydwDw33jSIJ62UbqncnwESiCUBgK4DbsnwwFumsj8in9wE
	 l6LYz198KfBIbq4DjDwnk8au0YYgRO4z6gVIyZjDx04ZZcYYQ6fQMUT06HscfocZP5AjE
	 UyYDfm/wbSSy/em7EOp3TOZkhDbM/NlQxdk+DqUP95qAmnqw+UAvef49/vznul6YPOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OGPwM0A1;
	arc=none smtp.remote-ip=95.215.58.142
Received: from mta1.migadu.com (out-142.mta1.migadu.com [95.215.58.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DC8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OGPwM0A1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dEyWtXU+JMcUEGPvr2+kkkGdML4z+I5C/EFffxL9Ik0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793267476; v=1; x=1793872276;
 b=OGPwM0A1ZZoWZrWkqEw5nkNOrrVRd5lKJve5LK5Gik+HK2Mh+zJ1KOP0XeE+uapkwBUSD2n5
 uruFbrvHBxaiCYQTgrRF3vp4OiIzgPkkx/P/RJilSZllrtkBE9rLG8w3+ljsHlwIswgqJnAxceB
 mGJFia/MPsupq4kVkJf2L0Y0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a624743601d9d14;
	Thu, 29 Oct 2026 09:51:16 +0000
X-Mizu-Trace-ID: 1a624743601d9d14
X-Migadu-Flow: FLOW_OUT
From: clement.leger@linux.dev
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] =?UTF-8?q?MAINTAINERS:=20mailmap:=20Use=20Cl=C3=A9ment=20?= =?UTF-8?q?L=C3=A9ger's=20linux.dev=20mail=20address?=
Date: Thu, 29 Oct 2026 10:51:06 +0100
Message-ID: <20261029095107.24985-1-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <clement.leger@linux.dev>

I recently requested a @linux.dev address so I can keep a consistent one
throughout my contributions and use it for the upcoming ones. Map my
previously used email addresses to this new one.

Signed-off-by: Clément Léger <clement.leger@linux.dev>
---
 .mailmap    | 4 ++++
 MAINTAINERS | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 0d05be949eff..5ab2cf568d3d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -233,6 +233,10 @@ Chuck Lever <cel@kernel.org> <chuck.lever@oracle.com>
 Chuck Lever <cel@kernel.org> <cel@netapp.com>
 Chuck Lever <cel@kernel.org> <cel@citi.umich.edu>
 Claudiu Beznea <claudiu.beznea@tuxon.dev> <claudiu.beznea@microchip.com>
+Clément Léger <clement.leger@linux.dev> <cleger@kalray.eu>
+Clément Léger <clement.leger@linux.dev> <clement.leger@bootlin.com>
+Clément Léger <clement.leger@linux.dev> <cleger@rivosinc.com>
+Clément Léger <clement.leger@linux.dev> <cleger@meta.com>
 Coiby Xu <coiby.xu@gmail.com> <coxu@redhat.com>
 Colin Ian King <colin.i.king@gmail.com> <colin.king@canonical.com>
 Corey Minyard <minyard@acm.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 748ce4d1c6a2..81d841bb9d11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20885,7 +20885,7 @@ S:	Maintained
 F:	drivers/char/hw_random/optee-rng.c
 
 OP-TEE RTC DRIVER
-M:	Clément Léger <clement.leger@bootlin.com>
+M:	Clément Léger <clement.leger@linux.dev>
 L:	linux-rtc@vger.kernel.org
 S:	Maintained
 F:	drivers/rtc/rtc-optee.c
@@ -23783,7 +23783,7 @@ F:	Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 F:	drivers/rtc/rtc-renesas-rtca3.c
 
 RENESAS RZ/N1 A5PSW SWITCH DRIVER
-M:	Clément Léger <clement.leger@bootlin.com>
+M:	Clément Léger <clement.leger@linux.dev>
 L:	linux-renesas-soc@vger.kernel.org
 L:	netdev@vger.kernel.org
 S:	Maintained
-- 
2.55.0

