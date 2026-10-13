Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE2E3AF646
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877591; cv=none; b=cbWfzdxh1JDkVdz+5qjs+FvlCByNFN7vrqwncPAddbbCtFEgf0H3sTYRVlljRMqLljkPf6gT/dPN1EPwsGgp0AJUhcWNbFIqziu2oOC7hZQK+I7jKDVBS03SfVQtYkb2sNsyhz+dTGvKijYe46dd5vx30AvT1Qaa6jt4+s+Cduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877591; c=relaxed/simple;
	bh=hcO7ay2eLf8SoHtzCaYyl9fsa8L6fUdSGN3ZY9omY4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAdX4oEdxocgIj3cq9D34sq+9VB0fxzCkDGTuzoWTUHX12DINiRbv7X9/ahRb/b5YwFDACVlM2x37Gd7QaZTDdMOuHUFt6BSed3YjQfVB6WZYzJTIR/6Z8sD5zpJUAHr4pUy2SGtPnPA+9Ot7i6c9jiTAU18Ssm1A7DlkzGGqjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULp4Npo0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULp4Npo0"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd15c885bdaso159040a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877590; x=1792482390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIrHw7nRSfnMniXQ4mJiuVQ+W/kzDXsu3xnypEbhI/4=;
        b=ULp4Npo0/eqxzo1a6Lcb/DGL+O+NOg0wGWy9nS8APSeATbhne1bKaUQLOR6nOC0QJr
         4yFVDLQpZ17Sct0bTry7xxoOHghpIJozQ2ulqoTBkhktq6RUTCq/M3kje/VroXudAFAe
         +AEfbVwFzv5HkNeskUQvES0HXq5euxThicRPHs/TCVrzCfFyPV5LnjeTPciatQlh6W/u
         +1gG+f7ovp0mL8D82Dwp+p4UUMSHnLiGBC8J+ffhAhjzq2++2YwWx7RG7++z2sa/Wx10
         +b9fzRwb2gIHhkXiaC5AvDj1IfMt6Napv+NscHUzAsZUnvTpmq55sZ1SfR8lxsGEKFjr
         Vnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877590; x=1792482390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIrHw7nRSfnMniXQ4mJiuVQ+W/kzDXsu3xnypEbhI/4=;
        b=vf8LrEXw8sPpR9v/Z93AHvPqqhU8BYuAsoyTABcTfJkhncqqKdSHXZGG+sqRN4ND/L
         tuq4fGcs9TCQIDDJomLiZN+4ZJ9dZvOMKCDMgmFior/CgJrXGta1l+BfhsECiQFM5OaY
         uw9FJ1T/WjvDApNs6RE12Kt0qoucYCUlo8HFbtcKSQORQFglnPSvVnWQ1kjL8Jf+D858
         O49uoQ/jtnVFjRH0YZgI60ntrrgoDwF2b3WsjQsrx9AbRmG+1o+9biMiZwmSBAMKay7A
         xtHABBiqNOTm99wmmu6wAiaMmkfsurLdQ6ISvDBq407/KM8Z2UI4yiSlB97SilaYGxwE
         xr+A==
X-Forwarded-Encrypted: i=1; AKwUvBxgFNk9Ynde90qoEK+FMdukRSu5cTwtd3b17qbKdDkkM5U54PR/ZoJxQtLseTc4/Xy5EeDpJw3o6uBKPuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6nnIX70ucsIFZ+yaXFolm/2CuwqOe/EQHJ16Rr4rvDe2LLqk0
	2DULCaf/sfaqby0T6iciPWOwEaEdVSZZfZR2qdz1WcdjDBeBMtgkKWnQ
X-Gm-Gg: AYBFou0fFzadoDaVOroBD8Drh0FR3SFZpEOSnmargHGpfSxkDCkbHzyu95pQEppdh18
	jzOoP3Q7HbWaoxHCIAPFKPrSALkQjDNfDwo3fkodaaEDawteK05488jD5UreAe9SqaaD50dffkN
	mE3uWCIT0rA9HJgKdj/hXBnmJ5O8SqDzkCIonyXnEuXmKUGYX8KibuarQ1gaI3O7/WMsbCqtR60
	f4yK4zt2kUDLUK6hryoY4ZahH3dsZ6GCBAQG1HXn87eZl9gjk4xHhQtRUQlbnXVqDtppEhTGGU+
	a3GHA9cXc/zMoX8rqYnOfdDY/YZrLVGbVdMqIEifBZclsO/hlWOfUA5NWVAoAYMkjlZeYXcUqMz
	B5PsinhmfIsTsh/G9WaMIX1v9/FfDmlBgWMd3pvJhjtwUkrp7UY/oW9tBs/pWpfjab1rXiGLSwh
	azUb4n9Bid5DCSdbeRfkpvuXvDPDu7yDodMEWyfy85gskqP32SkVEoW1GdQTKwTWoHUSFYZ5dny
	ubjxWXdnpGp3p73xRqeHmJLp04UXU6idDdR4thWJpC5fO1g/SnZO800Yy4hBg==
X-Received: by 2002:a05:6a20:b78a:b0:3bf:a638:4384 with SMTP id adf61e73a8af0-3e16bd615eemr15772710637.2.1791877590071;
        Tue, 13 Oct 2026 00:46:30 -0700 (PDT)
Received: from localhost.localdomain ([139.159.170.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89805c75343sm4459011b3a.38.2026.10.13.00.46.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:46:29 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Christian Hopps <chopps@labn.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/3] xfrm: set the address family before the early invalid-state drop
Date: Tue, 13 Oct 2026 15:46:08 +0800
Message-ID: <20261013074610.17808-2-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261013074610.17808-1-q.h.hack.winter@gmail.com>
References: <20261013074610.17808-1-q.h.hack.winter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The early drop in xfrm_input() for a state that is no longer valid runs
while family is still AF_UNSPEC, so xfrm_rcv_cb() cannot find the
afinfo and the receive callback is never invoked for such a packet.
Set the family from the state before the check so that the drop path
dispatches the callback like every other drop does.

Fixes: 5f24f41e8ea6 ("xfrm: Remove inner/outer modes from input path")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/xfrm/xfrm_input.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d51392a..ddf8fd75fd20 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -487,6 +487,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 				      encap_type == UDP_ENCAP_ESPINUDP))) {
 		x = xfrm_input_state(skb);
 		xfrm_proto = x->type ? x->type->proto : nexthdr;
+		family = x->props.family;
 
 		if (unlikely(x->km.state != XFRM_STATE_VALID)) {
 			if (x->km.state == XFRM_STATE_ACQ)
@@ -500,8 +501,6 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			goto drop;
 		}
 
-		family = x->props.family;
-
 		/* An encap_type of -2 indicates reconstructed inner packet */
 		if (encap_type == -2)
 			goto resume_decapped;
-- 
2.54.0 (Apple Git-157)

