Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003581;
	b=KYoxshQk3Ilb62javcNwULs+cSO9c5yaGYF/slnXeC6D6bGODrqRuoen4zyjjCcPe1Rl
	 stb0EiviK5jN/feOyoS7rgnKyLftTmnFYUQ7nWggNhHs3cKj0E6GqxMuda8n8Q81nbAJv
	 l2lYmVttUhNVtFVbzKnWw+rUnZLy6aLj3qWccDi3EBYBZTyIa+hsCZDiLMKAshyZdU116
	 hPYqkER35sxu4iA2Nmc9PBovy3G4/4Xsl560Nt1MTz5UdjjxsNSXvQg9C35bAUgVy0vY1
	 nFL3+B8TdilaudEezXbjvVU1n1DFckv3cTPinefqxnuEJcImU6wGxMoNttw+U37Ee2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gxLuux40dS5U1+s97ZRb1KBWoAfP3Bg8mTsdy7L+DkQ=;
	b=ul/DVS8GfCGIJbx37Zp7IwfntVUbkaUubsryxRgJG7r07tai5yzT1MsRFIVlv47ueRe7
	 inlSRNZk/CXMulHDdhROMjjaJOKCVaEzfSsZq2OZisloaKhogKTcCph6C+PbHPtkl/9RK
	 N5dUAgELOP6cQe/FVE35gRiEXqPqa46+WtRv12JKNvyG/4/62nw8uqfguNWOAOS4Efs7w
	 DiM45G6jAFinRALEYyBzb3Ildlvfxyow6SxmdhVYzrSj4Yem8VET7YpsWSnG/pqN63IRs
	 0oYGqqweEvUA18F/cb/AqXQW6EoNuTuc7fBL+dt5wVUWRi8sxH6HPiiNrKzkqZ+V7oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=okZ5GNhm;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A9606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0A9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=okZ5GNhm
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1134751a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003580; x=1793608380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxLuux40dS5U1+s97ZRb1KBWoAfP3Bg8mTsdy7L+DkQ=;
        b=okZ5GNhmhtYgoOZIaY3HkOlIYUrCG6S4yiVG3dOOPhCRBgSGNLbIW4TL7BWCZfpT8L
         WGOKra2B+26LTdWHFVQAt8rS/NP4LCxH2Mq+VfRyMV452NB5A66s3YSDsnguDLUsAkFV
         fGitArANeEv7uuK/l/HVheqFjwCWPBllFm6K4adYq1j+ZG0sz5Ck+fznUKDocqOqkcBE
         7tBcGh3UGEMKIwNrwcpLkew3jmPWJqF5AHYk0+ctsygfRhKXBVSGiVDY1dxKHFQ5HQ5k
         vDpdnhOxnqb0nLwAHTRnk610zKqNVOlV5TCLDPDi6YyLpjb+hR08ELX56ftrhUWfUace
         iGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003580; x=1793608380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxLuux40dS5U1+s97ZRb1KBWoAfP3Bg8mTsdy7L+DkQ=;
        b=sk9ZlRUjwfXwMWd2DRFa6OKA8Ev3LIQo66KEYrkCR0DmHmlK2lrU4njYXBt+WXgvwP
         C53ErJ0QwiMrjwxmZk/gvT3ISHf9+huh896Yhu1HD64bvuK3/RrvzOyN0RvBtXzklnc5
         cXhUdrMUZpZRbFbe1nZuozFefu2VvalHSBpBZiatQjZC3UieonWfRi+tyFi4buhMXxGd
         dFCRB32bXYLrgutHLUq/CxPt0PNg+uCkgkMTS5DURNxtizPDSei/NJ4ys0hV9UAu/tdD
         TJ2iC6zGyNFmu+5VwpDS2OOS9R3ph+5mHMtjp9TgzDdFR0o4AeEFJv9J7q3nbS7Upy4b
         Eogg==
X-Forwarded-Encrypted: i=1; AKwUvBww3bmvGE1D2sdA7kh61odLUb3kIZQNY38Jf/PyTKMO1c3k/AKgNaP4OOGEUR4NFFe5oi61RyQw6WS6bGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs9PcNX83IeZ+IiajG8alVc95zoh+ButMtoqQosZQfSyiN2YpU
	l8Vk9BsnInNvywIrkGWGEMwkScnwUPdI3hkCqEunykGk1adb/AikE9DCQ8Yvbq9Q
X-Gm-Gg: AYBFou3rBOGe19NBiuCiNvL87Zd+rut/Li5uUN+CGoV81t5s+HAxMeZ8XZXNgsQTJt4
	IEJmTAIb76/gxTlTSPFRZMXDArkGvy9arkDUv73uAD1ocNRF+l9FEKMZSR2rNPfBmwKGX+CVgqy
	dBWWAiiXC/ruuXVaAwjcwmvanm24berrZ+T+FpunxjFNZVGSEJine64QxFlRSlDPbyV2IEzzVTZ
	DibQOeNtjQG7a0MgsfJ6MyibZ+lE74nzmlO7E/i2yGVbOqW70YZLfWdOR+QMHDDaO0DnfnFk5dT
	YePePjZb+4R7HiBmjgIF1trIaC2FaEFep8cjgkV4iymDJ6dMbIB9SloNi7whdI+xbgEUpg7WMpF
	iQgFRxy+6orWR3uHb6K6gDwScwy69uDy6sE0ZcT+tuZv+sHC1YhcjxJaNnj9e2trxI7bSlT+bdO
	XnbeRiaE3EhvywKch/WIFB37UAcABbl4gvx2AfK1zKiT+rNgMMc/dq/j+0mJ8HQLVoHYQhVKZLO
	WgTHInrjbNXniJROnhQk7g6bnsYSi2XesaKRoShxV2I6aqKHnY+koSVHU8jDsDCPZnzn0rb9+Sz
	o1rRCWGPrG17NQ6mH5Fxo8nIfpqySw==
X-Received: by 2002:a05:6a21:3b90:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e7cd5509d6mr3746029637.46.1793003580167;
        Mon, 26 Oct 2026 01:33:00 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6212:1232::1d0:de])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc45146sm1234585a12.13.2026.10.26.01.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:32:59 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: dsa: motorcomm: Fix function parameter types
Date: Mon, 26 Oct 2026 16:32:48 +0800
Message-ID: <20261026083252.12684-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

yt921x_fdb_add_index_in12() mistakenly takes the two register images
as u16, while all registers are 32-bit wide, silently losing the upper
half. Widen the parameters to u32.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 422b45085e7b..a7a9a7439304 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -679,8 +679,8 @@ yt921x_fdb_flush_port(struct yt921x_priv *priv, int port, bool flush_static)
 }
 
 static int
-yt921x_fdb_add_index_in12(struct yt921x_priv *priv, u16 index, u16 ctrl1,
-			  u16 ctrl2)
+yt921x_fdb_add_index_in12(struct yt921x_priv *priv, u16 index, u32 ctrl1,
+			  u32 ctrl2)
 {
 	u32 ctrl;
 	u32 val;
-- 
2.53.0

