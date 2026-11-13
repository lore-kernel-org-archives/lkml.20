Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589991;
	b=0HzYde1Y1JkJbcrkm/hCx2+UZdV8a8oPlUquvZIN6h039zxW9wXbOcdw1oWcCzFX7lsP
	 pQgjqX3YwQn6neaKZ4FbiAOuo45l9MI+P8kXgGZgK4f8ep5Oj4C4Zoa9CkST1VUrELoGh
	 JWvqI1TQz3XzOG/bX3oP+bXvabv7FxmL+fYsG+bgtg9kmS9JECKNk/rhI3odAROeFo9W+
	 U6QuVrhGSWJ95fey6gZ/j+V0PL/YzKw8Dg9sqbu0gyXlApxknd6UDsNoHkjs0KoN1PpMi
	 c6dRLCw/NovSBWlQPhgddIYcMLt87VGLA7AO5yPS+p5nrAIjQUNGht7U9GMFQ/hkUKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
	b=Sb37/uVMiJ8qeQ2VP8w3UE8WDs7Qn6SIMGdH+XMm8qGUIl+mtAjGPiN+W+aRIwoICAWe
	 YKxaX7PJj9eQdQZP+btr4R3T3whtPWaxc2I/GWHstg6UFbzMX/fcuZ6jGfnMNYyt7nEz4
	 sXacAyDAXYgWv6c2lbHBaYVizudUzGi86hN3JcAPk2xdH+CuGB/jEsURfWA235g5qluuD
	 XP7nxFxdvUF24Zfg9aXlzgUn3l0J4n+sM8NpptiI7rKmMuKuLX9VX48RTRMR4aY1bY3T/
	 rUqeCHpsvzmFcm8zvocboHwCGFMDjGypgOlwYa3ADR6l02jTTtdb4fxFnb5J45J/58w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ott7as;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C5606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824C5606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ott7as
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so656858f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589989; x=1795194789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=C9Ott7astulg5pcDRttTVqwKCCSW8gYhYkZ47KxsUqYuT6tK6SDyAhFKsa+pFqAm6J
         gDv9o5mwcjFUCVImS7uyYyhIPYEryfhKty4hDp9qofWHVoKOPloB077+MZclv0cCq/aa
         5/TCld+qr5EfAsy5GaPQbDNt+HjRiWyIV1rvMsOKS3CV8hEPSv6XP/49nsV/cALFKThg
         7oipOaS16QaJmQzUKpAl7TRjY5YD4yR7MjLZznJ1TLWLUlyTrve3dIOtD9v+Tv3GUOr1
         L1ouxwEkGliw1/dFLxN256PesKEckWyfKN88fZjmi2j9OXnfd29nQkwr2UL6RCeob+0R
         UYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589989; x=1795194789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=d2fI7dTHboENcGCi8nr0TwuekeRgpQEFd6Ow+hxkkXLG98v5wGn2kJ8Kp3EgNt//WI
         0UEHOSEdBdwR1FA7SEtp7O20O/rAyCux/l7Ta1lkUWJtl5iZ07jELx+UEcnH88PKBirO
         +93caF+sQkrjq2hpgWy7hkHxiYN3RP5jylbM9vG5wLHA8j0MeouCbBCRHSjISopAagqC
         eaF+SgAMr5YCbo7OoKyIqGygRTRopDOg+tPLkUSN84MpwOIb4v4TXO/ga0pmAPxG+dhb
         6toAmTZj7ezi62/mmS2GlmSSQhNqgfleG8fW9Vn90/upGp2jR7X2zD0bStTE7/yPiUD6
         cvfg==
X-Forwarded-Encrypted: i=1; AL+hErEs5FkOsmfxoeTPGY6wsHXX5MkhKtk9/ikQIrcXACx0Af0vMrYHozzMZmsKd/1QA+yEYrQesevlwyUMhW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yTXpdilQY94cS5itzgOzPbma5RpgjdKWK+gMCNnhnwjK83qhQ
	4aXlU7x/2BP/My7q4Pak2TH/hjCdPaIBpEhQ9xPG+CS/zaEwWOviuAaGeLIqDLzSYtJe
X-Gm-Gg: AYBFou0O8bFWqgnN619Zk6o5ZbXN4jD0HDtB20AQn1EyIUmMvPHDJ0joUxTPKw/MBow
	fMR7GK1nlC6Dx1F34lq8ccPv+ZTGNrFFhQHYKtjm6QFTjL11dXqbA/VZQmUjR6OfBYFwFgsuVn+
	sLXM6eKOCp1B/Pg3DTGYfbJW+erP6iQlhky353XNaGae7nKZXCzrZBXF9CdrsyG07BIJKrst57k
	yaBuBbu3z10mnlJK8V2q9mgPP3aWF0FL+0Vn9qpdbP3PhcnQ5UWvmO6PguRczqGli6IIFT3ZDv/
	n7U+jqxV27MixdgVxpt04Zzz8j2UGbxZcgn41sRUj1JIZMOucUCm9zAKK6tyZoPbJ9TwFAILkhQ
	EH4fVVTFRimNc3A4pUV0hZsUnmEfBnGRJ/MwyLVuAZhAHzi77RnclXP6ZbWq9RuzYc7+U931gvA
	FCtZujf4OOQ3/8WumPb/HWIvPQtgRDlSk6OuA8WeQpXNN8vTtIcCInMZaUtCEPQnu91Ft2EwrIL
	duUzoa2MEqPLwJf8t4CXCx2haOQxmIT5DtrR5S11gfs1Z8cce7utWeZjILbFnzc9YJ3re6NR/d9
	AiuCQLzkrKmFB/0XjWs/R1yBEH1tecA/Rg==
X-Received: by 2002:a05:6000:2f82:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-49c73631148mr6928682f8f.22.1794589988794;
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
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
Subject: [PATCH v6 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Fri, 13 Nov 2026 17:12:55 +0000
Message-ID: <b50bad38d3e5c045c1c671be4c520c13760c5e38.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794589639.git.jpeixoto@osyx.tech>
References: <cover.1794589639.git.jpeixoto@osyx.tech>
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
v6:
- No change.
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

