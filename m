Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703929;
	b=rlw6yIbJDuvxvgA9KJYZi0nk9lQscTl2qRTNFf0y6fZLJHspMG5mrxZgkVweDZ89o9tl
	 4VanlGZN6djN3HYLBB7fC5I4/36f+jCXxRoPebtA+BJ87ZwTf87yO6uYQfmqW29ytOJwd
	 CdSz/F73Vn7KT//bg8oX/qUWnEaWOAdGf+e5SS+uFRY/hM4ueK4uSi9j87NTtzagfFCPW
	 dlrN85irPCdr2P4XBRqhKUi79z3FLfDnMu2CxXIuNN1XWHt/wDEoh6T0TtBriLuPfGs7W
	 Bb5K9QtWDX7izf4Kog5JzgDJBl1fEayzG++/VYKwM4ELK+PqaU0lg+NpkGfaNx06LeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
	b=nCdGYifar9ohwztvlxcP5Ept5GBax4JLKfTViL/p05UPqGKin4Q4hegCKFjfc4YstRFl
	 6XT+2gE3Uke7Q2DvmUGsWtzYUjhiX20JfEMy8vbpC0+0AyCIhQotCWStjt4pOGMBUxK6M
	 l3nV+OQHAk1U++9LTEMqoMnuX4zkJ/GM3SL9IPEuLZOrEGkY5WM9cm76yLTn2xFPNIO1b
	 Qt2edYpH3We2oaENFDCChkCjjrnVYcWYxtduDAK5dHjeb+NY9NgLRhlcdkrJOi21FflMv
	 Jx+Pvk0qWP9tN6IR+dx3AiOPAKiSJHUcx/+6o+aqfVyn2xxpRqhxUXIiTNd4SsZPeVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGIH5NqZ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D126606D830
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D126606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGIH5NqZ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso40474865e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703928; x=1794308728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
        b=hGIH5NqZpKssCrXz9eVV7dV9w9rb/utOwtMeSSTdftkrFFZE2N60ZyooWCwnCgnnMa
         YgOyr/7wmhi+oVyhVLg9oI3MRwWrBK0FC6MShRXA4zhh0eTRwyrxZmuPdI3Ex4G+gdoh
         MWiLZdqxOri9/1STMpArrfugKMi7tZA+kDnMO41zrb9GQt6QpYwzbBkdfsZHxZAWvUvo
         yjfpk8J1yiycTO7tQUtkrZ6G+hv3mCYD2TVXLVkKj3sXnRdbObenOxrFTjh9re/Q6zgW
         fdC8LatkTa+hFh4MuuBGtVyxVPjqWoqRf+fmnGw6h2cLmWAfaJs/tVGobqfRnIwafOWj
         tJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703928; x=1794308728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2peUJ98OgTSEIArQaXah+YOCOAD/R5kMNJb0El9Mbi0=;
        b=lMYA/5rjPLygARAD2DVeJqZ8v/X4uP7F7gXqerGbR3zs0dHZA3VID/F2nB4S1OtOS4
         Ay1gl8qa519iCBftkNoBEHWahDWsNHS7b66BNcwDTgyAM0oLfbTX6uOL3KeSxJFMZIQA
         owsVgiEuzWQdW+1rkSoZvnDT0UTHrHkZEGSByHouPRduTVfhyQ9YjzFFpnzbswiUjDQE
         ieFBhCB7BdnvchY3sPB+ZXoQTXXn9/U8NUoA0qDLpJ0bP3v/ewZ2fwgUcrBLkCY84wfj
         aFaAm5eRK00/yIfKnz1YP6loIIs3uwxm/18/VYNCHT2qHuOukg6wmLyJ2NP/DoR2/SFZ
         LVWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6K2pQSeB4056WZ7rKOl17pZRPvtbSGuvsApYb+n6oR3e1NirDXe7wlbvbtmPnmYOQFHlv4+XOmysiENc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3MhOYmzmzxXX191lAzPJxciGHkgRooaBU0zQ6MsVVEb2Ueilu
	mw2w5R0s7dX6ZhhBEn/QMxA1VkYk/af4ctAFaKRfvKRlYHIhq9KChT5D
X-Gm-Gg: AYBFou1op41WKjeaJi0SezfCCRwddCQImZW8PP1KGiwrvZHHpvupwNip93lPg/Fr22d
	a+wl7gDomxwRJoTasKzqZ7lCIyJgjhLEkWjPA2GfnKeYefWTeXOPn/QoOeZpdwtjFNilbjrRJD+
	cw4QnNrkCNelvF6z95dNejqfrCqjC/v8FhwI8NPhxj+yJxxsBVM9ZMagz7XfN1lBOAU/54x69AQ
	weccIul1gK74acyIFEG4rR8qoUuHqtcuUPp0eLv5FDzQSO9UzTHWziFf5xKsCUoDvYf5wxp9mgN
	8RUZI7zCnRvGQyCkcSqnoubpgZ/uyAgFAq5D6lRT8KkOeNoPu8Erx8wFPVhJGoakUoqJtAbN19M
	LYfrGtKiR69zZmOIoagJEKiJYec7tboQycVVSYmNRsQYzcOO0+eDxmmMAVhYQ26CWrEbuCwVWCD
	rD/WnTuRAy26ptCw0ILnFunP5qgxCAB7rIa+J+356cGoPMcD+HkVaPmUFlact5f2XpXF/woufHU
	OpToGfunAt2570He876xfVatmjDtD4ehsKTls+aaD6sLRBwhmHMxa3/iyF/vygW9f9S15ujjr76
	CMHkpA/ZOMMpKfVIueeO21d2JwztkfD3QdMdV0JyDS4IZIzpbTTmJZvpVjG5DSJ5Di+v61BEtp6
	dD3900MfHUfWBdB+k125j99FsKniQvdZzTtgPQRKKiwBXIA==
X-Received: by 2002:a05:600c:19c9:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4ac18a8911amr292299845e9.34.1793703927676;
        Tue, 03 Nov 2026 03:05:27 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:27 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:23 +0100
Message-ID: <20261103110524.2812831-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld has a 320x480 1-lane MIPI-DSI panel built
around an Ilitek ILI9488.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index 016a573893b7..27f9aaa81582 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - focuslcds,e35gh-i-mw800cb
+          - pocketgo,s30-panel
       - const: ilitek,ili9488
 
   reg:
-- 
2.43.0

