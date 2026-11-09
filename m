Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204047;
	b=l1fVv+9jl/3R8xvnzWgdyljdO48Q434I1qU1QOGuqR7LNr2HUV86thtYvHccEjQ4TYbW
	 QxP2itjZOeRDjgLohjlej2zK8mu9CQEn0XwutvXZNJvRllAqMqtu/aABZx/rl/IHKDc0U
	 BV8dllCCZoxca2lQnJPo+RULNzINkWHHCytuYiE8+5ZQ2CgUcOQW7jeCZwYaJAAONEsr1
	 6hvjqAdVy53wnE4dCDojKVUvnsd2xptg1ZaBbAXzJAnMQRtnJZdi3SfWt5303RrSQH4Bm
	 JbwSJR/7l5DSyp9pOPjxFcdPflFhsaokmF6tB9+OLGHJe8AJhK15+YrcBAwyMry0DEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=O2qqcHYDrDvU1pi/hGMfNLEpUbo9EQZ+vjwKdO5NYR8=;
	b=iJqqsLvYDp2Bt3tKM2jGBH5c4u6GN9mnox5aVKpumeLjdvQocmULTBjormMZTZddA5jt
	 yf5oUTV8aYPAftpsoj+ECpuMXYqge68XmO/a0CxtGf9clJB+D07ipBt90TyZ3BeMQQbz/
	 KbyGADNzlQ5p4vannbtOzb+Asdi255k/2piQ0sCQhDxGYAVCdWXiLEjIdWiKcAQzAqvm9
	 +6Ar+9Qnj7t2K6mXHuDBXGvGAHv4Wa/uFL4DY4iwO43blCaovoFtSiHYkxMilcsxO0YGP
	 q1El9KXRL0pWdAQBumCXejO2tZw+9iy9lBX6T6g71Vqm5bOvIvIwBLE1Vv9DOqSffeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YS9l+9fG;
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0E606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA0E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YS9l+9fG
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-8b352c3c26dso1391787b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204046; x=1794808846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O2qqcHYDrDvU1pi/hGMfNLEpUbo9EQZ+vjwKdO5NYR8=;
        b=YS9l+9fG+46AAYn9re7YeusN0aQNrcdDL9x9lKzf98FpH2i43l+V5VveM5jsCARddK
         1F3p1oYdSV/ZX9T9vxZfjNmMZxEHRk9NYGt9hnJflYHg6xD2XxolElzB17/MkbmoDblg
         VWtT4S1C6m1yYFPPPprKV48772ovoUy8IUd3Wa9A+vhUle6M65GVa0udpF4SRQ9T7xgm
         IKpBM7zTFgZs6UvOIsHzHcUNKtBbTDfO9aWYQCYmxMQ6rShFTxd1EqE5zXw4Y9kM93GZ
         lvXQCTDJs6lBNkPpqiU0MAOxL81A8NKo669u7uMWQKglAEFWYgCT/4N+BcCi8pbQJl1R
         gLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204046; x=1794808846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2qqcHYDrDvU1pi/hGMfNLEpUbo9EQZ+vjwKdO5NYR8=;
        b=RPrcPK08tpvRiKNRp4EgSXozEwvnjBg1byKGDyYVNmf0MG7DwYegdiSls8xyvKNWw2
         4PZ81Ct1coTWnscVu3u0Bprtubt70zAyU5zWHMWUuzRnk8d1nwd3VrvbA0kR3oGO7RUR
         vQv2pDD5flkwI/RRVwEMxZoR01FLijXj+4+ExScFOnW976QkCdILeoNCY+7NgcMwfziH
         nEfBkDslaymu6/bx5cGjClJ2JAaqai1U2i/hdwiWYlX6dfkl052NHlUouAG/jaJS9AnS
         PA1KXSq/rqmPEdiBPZBRKMiqNuNbh66E5q8bJ3nB1VzinxlgadI0J0nvjhPJ7tW1cmQE
         4GWQ==
X-Gm-Message-State: APuU4Z9d4Y8c6P1DF/0yUQRC05PxNWRTUk9iulPxilQ3zK1+rGK2rRMS
	s+9CJo/eo1jPwS8Laf+nj75l4sFntXoELPfpE4WKj2ywjTIleHsl9EFI
X-Gm-Gg: AYBFou3vWYpio3EQO9sF1M63Vj4hLxKUXJ32p8qGLxFhouYDpO8AfEYQOqJ9HMdTDWm
	qWKUyhLcsgcUb+Ul2dnMl8vrRlgpnZB+oN5LNTBlqYknnxW9/XAxLpXOUTmgI1V1lSOcx7oh1Jv
	eFFfCVmsfwK+DYWKm7rHapLWHi9ZjgzjALtZDwmXPnhD2UttCDmszLrLiot/kSNLOMCo59zhWTW
	jkumLLk5bJcWKI61asV3tuepPnvRbe5IKZ5eFP3YBmQOpTJT83Z/1aZJguUKY1S65w/AeJGunP6
	YgKWbh3U436wMYnFuNQpvqmjp5K7XBclhSKBPbSJCb4BWCgXZcUGABOZyLAEcuHv3oAgT4lgmWx
	sAcNSJLo4P15PKtKnG/hofRB/iVFp1NmO5NytZ34l852/z9NkT7ptJNdxo9HPcE0P95pzEo+8EM
	FRB72AWht+vP4BFQUplx1nt5b6popLw1Az+faDtHCjfmNAKMT0Y/4nSNCAkC43qPFQng/16h6LW
	bSJlvV/3T3AEh8LmV0V/A3r9cx8CKPnQI7G/Rqnz8mXAhRTXOKYSivu+rYJsJZC8s/sGIpszci+
	nQct/G1U2bufq9LT6hGctw+2G2dy5SzHZN4FK394am9Ljidl3jISzHI7+g8h2ZdN8NqleAHXHpX
	o+5uDZQ==
X-Received: by 2002:a05:690c:92:b0:8b3:2d74:af96 with SMTP id 00721157ae682-8b36cb326e5mr20160367b3.67.1794204045641;
        Sun, 08 Nov 2026 22:00:45 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:f9f3:ca9:791a:3a8d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc43733sm28628607b3.33.2026.11.08.22.00.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 22:00:45 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	nkapron@google.com,
	gregkh@linuxfoundation.org,
	khtsai@google.com
Subject: [PATCH usb-next] usb: gadget: f_rndis: prevent double-free of OS descriptor table
Date: Mon,  9 Nov 2026 01:00:18 -0500
Message-ID: <20261109060018.71063-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
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

rndis_bind() allocates an OS descriptor table only when
cdev->use_os_string is enabled. However, rndis_unbind() frees the
table and resets f->os_desc_n without clearing f->os_desc_table,
leaving a dangling pointer.

When a ConfigFS gadget is unbound, the function object can be reused
for a subsequent bind. OS descriptor support can be toggled through
the ConfigFS os_desc/use attribute, which determines
cdev->use_os_string on the next bind. If this flag changes from true
to false between binds, rndis_bind() skips the allocation and leaves
f->os_desc_table pointing to the previously freed memory.

A subsequent unbind may therefore free the stale pointer again,
resulting in a double-free.

Set f->os_desc_table to NULL after freeing it to prevent the stale
pointer from being reused across bind/unbind cycles.

Fixes: de7a8d2d534f ("usb: gadget: f_rndis: OS descriptors support")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/usb/gadget/function/f_rndis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index 7de1c5f8e326..b9e4dff9a12c 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -949,6 +949,7 @@ static void rndis_unbind(struct usb_configuration *c, struct usb_function *f)
 	rndis_opts = container_of(f->fi, struct f_rndis_opts, func_inst);
 
 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;
 	usb_free_all_descriptors(f);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0 (Apple Git-157)

