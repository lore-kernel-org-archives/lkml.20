Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76344CF22
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374327; cv=none; b=gIYJZD8kfoC6kSCYFe9hPLxNx44B25HQHMU0JA3GVaRS5niGqyHrQh7aPX7C148tzOspEGntCRUnh7LYuTj/p3kSQ8gFBGfbt3ODqNwJMt0SVLu78bq8Oxbw1BfkKxuA6Yi0ORMGLTuy0PfJg7H/DiDkhws7/FEaZS9BtoNcUx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374327; c=relaxed/simple;
	bh=s7RHTsXfEOg+gwqThuTUUiknVQDtwJu49s4s8eAwliU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nz6AQPptQLwUzKYZvP6emFGd/FVf3I9J7QUqGzK3NS/b+qNf52pOptxuz22a81Iy/OEAXs6Dg8X1A8vL275l3FuSSHx49IlcqqAIrGozMwOOnq6jwpPvPnH4npofSYwSqaYrIn8iHT6wuMiwKEvFFvVkXOa2wBAYXfeOHXdAqz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIzPxpTI; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIzPxpTI"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a813079a55so902984a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374319; x=1791979119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEgFM2qnyZ26U72V739p3+vOc5ZxhizwkmlzBdho0QE=;
        b=SIzPxpTIhtpspFxN5a67mVTrA/+OHpoJoUQTDH/zBZoeC5U/NCOzsR7FHRHKdWrhXt
         +A57W8WxQAZQbtAgcdGCV5fgz9v8/LjRSldDsf3x3hQd9Ww0FdVvz7h2oyKt/Hj97FlO
         JudV/Jduycabm0zwjatpQjw5PaSPTrCcoDZxvEFArkGDT5AusE2yOAw2YtdgN9DR61fC
         iXHzK80TjLPgV7gJQGS7GjCWxtobW8F4d3pqWUZZSvZwayLpbi0aVY0CBFMgeLajxuMc
         sgPzx0HQfw0xIwrimjvgyj+owx8LhkGzwg7a0yD1Rb+OLvsnTi17E8xKaapDaqtFRarf
         AESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374319; x=1791979119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEgFM2qnyZ26U72V739p3+vOc5ZxhizwkmlzBdho0QE=;
        b=rnNpILXXs+k12m9o0ixK4CO1n6bkdr8WJ+eI3UOcU5humElo+fn8a79/B0ffqGf02/
         sgLdROFjYpy/xCOf4JwszpHAzU9Hm+9IYoKyIZBOB7oqsJmPgTr881pl8ZTXphtrz/AI
         pmHp40YcBCpySbXvCmuDneOgaS90xDACgcDJjTk+eFkLErNxDwup0P9t88a67dLpkXxz
         CeA169qvSqTG+1+QLXLXaaIT+KiFWCon5gz1bmgOcAyxsiuCe8j8BK+hVQ+nHeLb7Zgu
         G1VNTyASu05Vu4nLtlCiWF+Dp8Kz6Bf+OWyCe/7kKaVr3TzX+0Q6JYMqCmZIcL8vpaji
         lXXA==
X-Forwarded-Encrypted: i=1; AKwUvBxPCtU3zWjom+PbV7Fxk8MEQMNiPLvMyS3+C/QN3E/R23w9NZ1wzGecq8TL6sLVbCqSgYcmNnlL+thVsmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOlwpnA/ayb2LLW51bvf07jQBjpGDq8qjj4TkiULu5Xkg5Sv6v
	huVW5g8BwVmkAIivIHRu/bBzioLY4bfByEdkkiNaZOOl8l+pRb6u3R0F
X-Gm-Gg: AYBFou1O2Y9jVnyeMilegg9Rirj1smsYAF+nDJePqZ46BIQmDRFH4jPtrW/gWuFdErW
	PcltzuN7FD8elmJM6Bx87M9EOlmaWjwOv2OENonYhysFeySq3hUB+xDJAF5ygoeuAikfjjKOVEk
	g3rMvZzjYVbtaNR4TRBCEClKzmxk0URhMGOPUBBVdrDk/fZ5meRTof0D9RYG4xGOsyisylanitr
	ihldVeS0MVGz0Lme/EfjkXvQKN5L3BoM3LRgC9+LxZJWkTPgM31w0+o6wtTau7B5o3Injs8bdqs
	9umxJer5LBrCI9TQIZqpgfIPOiz0X0QCh9clXfZN7etAdFlSLN24f3Wt1BWY1MWzKdNX5HUJPBp
	WaJaFQaF65S19rWtP9BXXZsnXzvXaRMNMcqfDRGmQwmiGrw65+G2A67SdKUBRp7upU+LReSanUx
	palDVWccYjWhES1EpsGkecXyeY8cAKFqxBFRIJy+D0VSfOviWlz1oykj3IBrci1jmiknyoCbj+X
	DY6o+Zj+bf4E5NZly9eG2k+prZgcPRrNLSyQ1pi+doOT+/PtER6fL66KiqW3gZE4W7v4vPJQH2z
	tikIRaCiVBU=
X-Received: by 2002:a17:90b:534c:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3a8a0e2bad1mr1081798a91.21.1791374318558;
        Wed, 07 Oct 2026 04:58:38 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8987b09e2sm4456582a91.2.2026.10.07.04.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:58:37 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v10 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Wed,  7 Oct 2026 20:58:16 +0900
Message-ID: <20261007115821.11332-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007115821.11332-1-sigefriedhyy@gmail.com>
References: <20261007115821.11332-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c6..17ead22034515 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -119,7 +119,7 @@ attribute-sets:
         type: u32
       -
         name: target-netnsid
-        type: binary
+        type: s32
       -
         name: proto
         type: u8
-- 
2.43.0

