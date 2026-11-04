Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819734;
	b=nTtjE7Yvx2LxEV/x2aZ+lEF6gLtir3nSZ/zjMvB9s8H0jidmOLGMUOWimfDrhiaHH9fJ
	 Uytz7HrB/FLDLO6kYZETR0MDUYnSDci3cnElaszxTpUsO5QOx3kHpZjv25w0TimB5XDxw
	 aHGBCu/YxW8ix5+SVr1uGzyHRZsM78ubqVdK9wOCTUeFIFNJh9+nv7tT5MbAjGR3cS77r
	 bjOry1Pn19f8Ss/sEYHGZR33dL/0NO2avgYAX0zAESrpPMyZpq3ObniCDR4tZ+pP+8IoH
	 awJy4OV5JjlHwYm8kLvcmiftNk0BVgS5fRg8eqWwFMMWDKR+uTqcD5+XXL8L8QOVpMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MlgYxghNQKBjr6lPDgvVwZkLEYLr1QFSQbB5pTwPWnc=;
	b=Y0oMFBo0QSn1B6Bzn/z67vy4O7d4diAC0YztxH96EhS51qcq+8jrCx97zc+NQMyge/n1
	 nSBhEjR0WVrh48Smv5aPW5NkxAjGoZ/XHR9DNNN9uFyq/+ld0OHmgCoimW9TaBwnC1ole
	 Zzl9Eq4LeTLV6ibHhjJm1vlW600162iuNYQ6Kdl209WvbvW098ajwTOQDNvWMZGCInCls
	 M1cfctug3xzP0Bw6VCVml5W9vOPCSTnEoT58fub3NBHiIjI/u3NaNNC+L4fFb9mDw4lJM
	 Sf5035HoTAjk4/Lj2EJES1ECsGGBmj9q6Ghnn5V0WM++1T3qLuzV7Azgb+fRu8gCayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="amfaZ/fN";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767D606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3767D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amfaZ/fN
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so9926745e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819733; x=1794424533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlgYxghNQKBjr6lPDgvVwZkLEYLr1QFSQbB5pTwPWnc=;
        b=amfaZ/fNIQiUw+lc1Vufc+hFjeqt1vbMNrWuNzzdRZ4ecDwcQWxZk5ls68Mn4BzaQX
         fKWiebWCVeNFZiWvvAMSP40gBkQXdw98GynwpprUM6ElejB3QR4omic+QXhVxOqmqGn1
         mqh8NGuT2T80teHyIqy+A6vHWqkm8mWLH5rgsPAx7W635R8Q3p4q2dtyfjc5K30l7sDP
         Inn2F7f7AUvWAyLK0r0hYWkTZAcoi9Xtvba5TECpGdiAUd1quytYcQpurlCC7nytNB7u
         +TgyL5cQv/mum5uBlbgwcjC7srkiUHlvM5N71bXId/g+rm74Ee5eNRQskaFvadtjsYta
         QGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819733; x=1794424533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlgYxghNQKBjr6lPDgvVwZkLEYLr1QFSQbB5pTwPWnc=;
        b=Ex9HnuhwZjS6yMZdzDM1915rPn7UGQNrqIdWMO2OL2wmDMVGy8rg9VAgzg8wn/ZEaA
         LeHvMCA7pJDL1I/RsOFutT5fM4J9XBmxvk0Ioqhc8QCnum6JokQuPFvMjQEvkWWomFkn
         I6K6PX++MDFOgDO+WF/TTRrzI9AN0uDm8QSEsW59Nw2nJ88O8WJO93a1CeUj0+Eakd5U
         UhSfY2DiS7Jt7f0Hvsm8a21FjBzw4AX3Osn4T3GO5jKkOQkSeVNrEUNZCFEX7o6dZ4d3
         W5J8ME2m94gKJF4uDmHqiiQo0AOn+QlalE1/GtYc8OT4SiqFhaBm8DNHifPdk+fcKsI3
         9Yyg==
X-Gm-Message-State: APuU4Z9AOjR7Yj5E41EjaiCknl/h/T5mwh/tO3jP98bL7hlkIs9dUoHo
	SFXS3Bj8diObubDlMwB9rJcloZk3ghmwgPSq0JK+qGvXyo8nyRtI9TZQ
X-Gm-Gg: AYBFou0ifmpaUKa0fbFozuZsRRTfl0UyRoHOhRLcYvlRQzPekjuQYtTz+00KcbStqy9
	RG5i1bXAbn3Givc4regqelMxV5hJsNe7hSVHRgBgxVTtzG0CRuoNuVS8fQAv8a6bNGrwWt2AEig
	M/NhmD/yd6oe+/RPyKEbWi7sg2s0zTOOeHpf6weOLxcfRyjOgqrA2S93gaaiwc3F2UMCszSz/mU
	oucFQEuY15wqPVdcq4c8lRrB3pRD2cEtHfv/0xh9t+sRx1IgUW9e5iiYvRldT0E/2SZkRxC4PCJ
	yz67IEplK2PcAap97juB9PpYvU4+//IPc/kc3VNt3hTkeDr/jaKL4G3PJjO008JcRQW7kjBTYtL
	+CIFSwGSA1sh+F0+bWca0EbFJqebavaQEkxxhyHm33QV0In7jDpD54yw4/JjJqggiVYu6utENzS
	Wp8ESc1hzgkg/rwspsX1+OFm/RXp3te6Rm74JzSsfNXQsDJXdDA/4/pG1rukEsfD0zFvL3wHeoW
	ET4JSoWyybT4HpzZp3QNkQSCGw3Z4BD+rgtKitHZecwuJonWAaBT55pt4U+D8YxP+vi51j/A+rJ
	nr9f0LatsVK73S/3+oA3hNN3hl82iJm6K+RX9/ZDMeXZOgG7QGI=
X-Received: by 2002:a05:600c:3b97:b0:4a3:5a91:5f64 with SMTP id 5b1f17b1804b1-4ac18e5dcbamr394556005e9.27.1793819732554;
        Wed, 04 Nov 2026 11:15:32 -0800 (PST)
Received: from localhost.localdomain ([37.167.198.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43457595asm43696535e9.4.2026.11.04.11.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:15:32 -0800 (PST)
From: Luc Bertho <luc.bertho.kernel@gmail.com>
To: linux@dominikbrodowski.net
Cc: linux-kernel@vger.kernel.org,
	Luc Bertho <luc.bertho.kernel@gmail.com>
Subject: [PATCH] pcmcia: rsrc_nonstatic: fix invalid iounmap warning on card insertion
Date: Wed,  4 Nov 2026 20:15:21 +0100
Message-Id: <20261104191521.19857-1-luc.bertho.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
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

When inserting a CompactFlash card via a PCMCIA adapter on a Dell Latitude,
the pccardd daemon triggers a WARNING in iounmap() on recent kernels
(>= 6.12) because it attempts to unmap an address that may have already
been released or tracking context has shifted.

Fix this by explicitly checking if s->cis_virt is valid before invoking 
iounmap().

Signed-off-by: Luc Bertho <luc.bertho.kernel@gmail.com>
---

--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -279,8 +279,10 @@
 			ret = s->callback->validate(s, count);
 		/* invalidate mapping */
 		mutex_lock(&s->ops_mutex);
-		iounmap(s->cis_virt);
-		s->cis_virt = NULL;
+		if (s->cis_virt) {
+			iounmap(s->cis_virt);
+			s->cis_virt = NULL;
+		}
 	}
 	s->cis_mem.res = NULL;
 	if ((ret) || (*count == 0))

