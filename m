Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937085;
	b=WWINuMNsbKw61kFiTVPCX1QJCRmtiefiz2PfF+dlhL85CDPtosy0Yieztg1Zjiky/1zR
	 n+CNna1/Wp9mBCdaz8p7cEedT/l+MLYufnmooaosNwaBJdt8i1nt5KRvsrP0ON2bXoPRh
	 bIyynasOJhXFMVoBH9C2HPHcsjwUbbJlf2zMC62o/26KC8Bbvm3/Jf2TE4hPwtUHVVtnP
	 n06RyLM0JKnhZVPrH7vzPUvIhFvLsl04wxQQzXnEUCFlj4X83bKz6a04PiQDqu2DA5bcL
	 4B8jekGtHNkQb/6NmZU0LF9C6aFnVnN2lthYCEXuGF1WVo+fHsELop8Wu/LJfOs0kcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
	b=XUqV2UOGb5xKRUW5T2FWASSY4kJCJgYvhQdDm3TK++Aiqy5XZFLdCeaNPc3iG1bDN00y
	 jWklZgU4pKFvkBUYDBNxrQt3NSXqFecNP0wbDlUc6ukWCJxQ+mtVDR15JssWHJdxlqlZs
	 hUF6EUVADnx0A0hrr+UWF2bkOJowgvX98m1/HGOSKtNdL0Kv/VPh3SPySppYdgMKbu9qW
	 JMb2RWdciuFLJYRSrvN1wa9weKyNgifB3H4qSEoV4IJo0vrI1Pxmvx61TE0okxCzes0gu
	 /2XVnd7ByQxmayEb6l1iKEUkXpkPq1nT4+hRHTTgHkbVjrLZxI8VB5u9CMMRtZk4RQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="JvkyLz/Z";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C56606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C56606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=JvkyLz/Z
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso22963935e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792937082; x=1793541882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
        b=JvkyLz/ZNZaUn5KvDlRMFowHcFjJnQwtRGtucdh9VQYbheAbLH5l83M5ujW1w0K8MG
         t/M2ycE/8cXAyROJC8vJ80SmRrO29JVPGxugVEkAAztqPVJxz0oYRBhT6N7oIRiroxbd
         pnMnWQ3UCMLFgxtDDkDMO8Ci1NRIcrBH+pheYYOhWnJiV+4A/PE72b/THGoPbVYsHu2q
         8vXAm68b4hSIY76GjyrBKtef/M8p9wIMsP2M0Y5C4ikEp/LDXcI1MlG3LTUMOmZudL7/
         xfwG3qCrQ0oWW50A3SVc6hypDeRGOQqA6AleGsmiadzHOtXL/jCSFa7b5qs91zUAL+vM
         4fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937082; x=1793541882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
        b=b3Op0rKe1CR9t6kcr/us54MgTD2InlWLs0BR8rgJEs5/118ZQI19tHmskKpx9cEtGV
         UH3p2+RB95X0Um8QinkjE/npmsQ3SeoN6hNL0qMBNJC+jeYUkmn1PcVgBeDQTcMaaRdC
         qXPOQaapHv6ELFriAGJWmc0VgMsCWVfbMZrtQXk3F3/hfJ6GCJjYygW8pp7BuzUs+ZAV
         L10MHkduIJQcK9vnpvAH6LZe/8EwW+Yj5nSJ00hVXceW5TIDiQrL99elxCeBbKFtEwHk
         c7t4lZQCImBHM7AfqEWd3CepAD0HOXLfNmON2ZgBKX1MNbb0AkOFIICVSU+semJJTdSv
         yH9A==
X-Forwarded-Encrypted: i=1; AKwUvBzGQya0KOtwvybxxs/ifKvtomx9S9exTWHcDIVRfp9nyZDpR/omgPQe//0KOJyUcRUdiZeb1m4ii/29UKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiLFbXSSeQlEueIeJkUOKbhwPlSAVtDr4bwpcWUtm5Me55SN1t
	3aWruLfdkGEtlTkJXc6//zbBZYebR3tbzE06h7mFQMrSg5pQ03v4z0y97aWhFgQbpd2mb66UbZZ
	0hmsILzI=
X-Gm-Gg: AYBFou0RqWoC4hxKPNxqQfrwgDV6Z8w3VSxYJ5tPLA6ihyx4S5poPebcRjBF+uSHF+j
	Tizk8ussy3bfWPWUGjCxvCtsQ5BgYAAqYsfdMIb8cxBcyT4I7LqLTUEOyDPqkasFX9yVxxbQJlt
	hVqCIq1z6HxXQzuiZdgfCGzwNCPwjT7SkUIwERRU5cJc/k9VIwjqBxU+UUhcioKfxmBL11nJ2Fw
	Qu+bwisnQfbY67qhpyO2FA6/ADvj0CE5jsBOG5PJ00LRO3JjfFD4hUe6c+2sF2/uUWBKHDe0LsJ
	zqWW3dBZRN8svUQihPpfzQbdWoqXZGPUQU8ELOZbBL3U3ykg37fvz2cDV/7cVpKxR38ehZkLSCg
	dLNyM7qcFSFkLGkUxCFgiAQAtxrHpy4KMMPjtd0c+/cQ5PRR3ZfFmpwdY9PodUPpQ3of2Qaf4Jd
	93lZyoy73itehyPmyE1LlNeGtnpk6JhLITZK0zeSw3j6LVXxXU/8KkGrNSFJdPS4BsO7JMCUCjI
	IS+TuDPjH/Y1G26RSwK+Z935uFkfnU0U6P8BBq+cavVK7NiQ1eIO30G2oO41HKD6puPkqtrYMJH
	laqVJeO5G6Ce0FssHgQtNCJmg5ZwZuTKcDIgRz80kiFhBUkN0ZKY0MQxVk3/E5CZMNmnzDj12A=
	=
X-Received: by 2002:a05:600c:37cc:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4a35acaf08fmr74313465e9.24.1792937082605;
        Sun, 25 Oct 2026 07:04:42 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm112317695e9.9.2026.10.25.07.04.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 07:04:42 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH RFC 1/2] dt-bindings: mmc: ingenic: Add the X1600
Date: Sun, 25 Oct 2026 15:03:24 +0100
Message-ID: <20261025140325.73204-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025140325.73204-1-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1600's MSC has the X1000's registers, so the X1000 is its fallback.
Unlike the X1000's, its MSCs have no request lines to the system DMA
controller: the driver uses their own DMA controller instead, which needs
the X1600 compatible to tell them apart.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
index bb4e0be0c893..6b26a17982f3 100644
--- a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
@@ -25,6 +25,9 @@ properties:
       - items:
           - const: ingenic,jz4770-mmc
           - const: ingenic,jz4760-mmc
+      - items:
+          - const: ingenic,x1600-mmc
+          - const: ingenic,x1000-mmc
 
   reg:
     maxItems: 1

base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
-- 
2.39.5

