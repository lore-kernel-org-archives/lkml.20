Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038836;
	b=MSzFswK/iHqRvjAXFgwzCNAeJ8hI6/pe3xyj1LrJnaOz7h9Sl00cIZuC2ywGjls4+mgy
	 7Kpizuv7iXdeIy+HQ3w6bbUVRZx7yqkvcU+r6a+UUugVbrRE5hDpESM4o+TiYWVGfrWDZ
	 qY7JVozmseSdfZEds7uQj6Fd3ZcUJqlV/2wurDazMrpZKgoYoTNrddxldzCwxVXRC4Gd7
	 iSNjZMcQPpbp6wT4kj6XF1fy3u0zdAhhoZtPAIkOBTU/i9CzgAKliNfgeIS0BmoNuitKQ
	 jA14fIX0G48JKurwtnMXIOoZvUHgBBp7ClZp4+9FNfIZ+O3ZTeyvx4MrdDkrL3guG3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
	b=4IuJ70p7X7IXXFdBTCAr+eBgab8Wzcgarhs4IYCA/964Fg/wapMV7U8MRoBHcLmo32x0
	 D85m7UKsEm+fguMBLidqFX86J5PoArPoHJLk5Mk9p0JlfQrCV+wp1crvHbuqkg8YMbc3y
	 E+iIcfb14wGo9ib6KQgzM7rx74CUX8nJRP/2XErZN1rzu8mVxjesfOwEu2t1lNxLrm3RM
	 ETE3jx/yrW+l2voIGNLZHd0OvGQ2/Agfe4379Xub72dEYVqk0Fi+DYQPmLm36R0gSWdCT
	 9wEmtZVwMEOwLHpjIZyXbkgCIzQPvZ1L5UMxsQaFwHkgYm5HJQJAJhnLcywiraalbHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5BMzb4C;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEDB606A33A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEEDB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5BMzb4C
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e4831c028so1395188f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794038834; x=1794643634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=b5BMzb4CKP+DlmGkkuc3flNcQ3ZI7xbcs3yZvaluaBeG83K9/VtBHGJzJ6ijYZmcxN
         HVCI2wvvYO1gQU21f2r8u8rTc9YEbfkufMyXByhACRgUnV60nUiPBiFtnl6laFHuJpLV
         EGpmxmksCLNhEyrvzLAwPG7X5eNrgYnBnONymlkPnn/Z5CF3cQ/WTytoBbIQBUwYXtel
         oeeMD4+/bwSJQ1SWLVwtAO1KJFnx8OzWQbEbjViTUrThGxoui7P0yZDZv9Dvq3Z9yXPu
         IQM5WRUY5V7Y0MJuVl+GrYIWO/Rc8cj2dwHZAGyS0GKOyeOnAcKYFfRVhrT6HCPasrig
         L+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038834; x=1794643634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=Tmq0aap1COCBL5PvnCWk4sU5BpBZNPOJkMXcr2MQDISszaM/6C/xN2ySgHFDdgh8cS
         AO3R28fDTA6d2zadHfxP+11g5yxcvP6uXeYMJDG4UmdRAueCUtwBS3Pj4NtQKNU+fsTC
         RdXstoHk/cu7Ap7tAqum9Rd8eb6WXV5tcZrXsCu9DOqvB8i9gvv6xHVHurj8LaR8lYg2
         WVfsKq0/hYVe1ps1pbO8R20kmC115OiQUo+Ra0p5yuAySPfrJApQM8vJIFa8e1jW4kKT
         3ihstmcuNIq5FuYQcYDbwgL84sUj9cc/KrRA8cb2UgPMJCjTqeBmzFEUHtE1VDfckpwk
         6Buw==
X-Forwarded-Encrypted: i=1; AKwUvBzZkpIg/iXiqNZWqOdZQ5FAYkZqQUG3N1cc61AR0IiKKFoCHIFKuoM3Rxoa4XVAXsVGw9BZSQTat0ea6/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ch0mWs8lMmBsJJP3QpHHfy5ylGYcTBOgPo17Iw0gfgrbhYpYO
	oZbGoac6xAno0RpnHvzR93PgozGm1702BVQvimWlInnQZv5A8izIo3huaMgNW41SZtly
X-Gm-Gg: AYBFou2JM8QRhSiePrQX8z1d/JF2FEhKlXpB35DFMtifJgq9p0qRbtgCRx+bNKTSpSr
	SPoODA3yRZvtL9PLp3P/3mUbUePuOzxb0/0mP2k2wmO1GHcZ/IgQFoPMMRw5NXU8v7gqkjS1jUz
	XDcBbY9Czgz8k4p+XeLHn6+ciQEj9OBhykicRRsQKRmaV0mY0xT8T6iENsLX4OWUld/JY3o4zig
	pr1eOpg1RRqKBxVHpeekRKQSxmAk9cXYp1KbW6cVce+hDJR4SgelWTIraidMubdidyh3FbEVejI
	SNS0F7Kfg2hoeEM6+sYskdAO6OK3JwcINP0y0jWhrvsQj/mWkefcuR5HD9sCYF9yVGRbatZ4oOL
	VJ5iEVp/5HIcLiAGFbXI082iHOmlUpnmvuC0rej/wwmBj0bOXYPkvon8BV2BaP4oMJABujePzYI
	QU118vOZ9TmXiCRAgA6v07FDi0c8ED6ASv3yuBtQPvqJW7We8KLU9xsXSkGcHa2AOo8uWS4DiDX
	DELEJERdIshESplXFAz2hwhvt1tyjEjOZUmGUpbOoGvuRCZahfS9a3LRboyLN030EWGvaWop+vv
	cJqE6JgZX3XoFmvuARRQFn5RoQ4sBSatvokYSYKKkZfpmXVHF2EB
X-Received: by 2002:a05:600c:3f0e:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4b6db0d060fmr83181085e9.2.1794038834255;
        Sat, 07 Nov 2026 00:07:14 -0800 (PST)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:ea06:fa16:f0a0:9d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a652sm43927455e9.7.2026.11.07.00.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:07:13 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat,  7 Nov 2026 08:06:52 +0000
Message-ID: <418eb111fc016706fb64ec91cbfb077ce31e4577.1794038390.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794038390.git.jpeixoto@osyx.tech>
References: <cover.1794038390.git.jpeixoto@osyx.tech>
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

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0

