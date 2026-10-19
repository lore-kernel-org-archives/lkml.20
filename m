Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423985;
	b=nihLMF5exXLthd9TdSWQ6LNXbFQs8JSFpVxf7h4XwG4ygxYk89cTsh5EcDsW8dyRDdFL
	 6LcLurDLb9DP9OM2JMPy7wK6bjnXfD94rwaaRCZexJ4Hcf6mtBzUa115AMlIax1l9fmWs
	 TrMcDnUrVT8vWtJclA8UXePiHPKhYtXp4qqNy9K0MgX8FMOlMIGCk/A541WH0H/3aCHqc
	 r8cD2SY3Y0gTJ6vGbzD0ObGlOtYxLCE3phMc1bjx7u5RCt/esS9CInwjeF26DlgdTBt+3
	 yeW/LWPVWh9hbuQdHLSypNmzCoyqnu+pvD7QwFamJpzhWdM2s6GDzs8yA4M2TqSwgGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
	b=Jq+VzHhhE68t/PFd2dqNNz+lLDQEPpN3X1TGZYb5sM0WTIOHcu0i/dlgIxPsQrDAB8mP
	 XOmXauNrF6cQCW5XcUZgyH/2mrFzjY0zCFn/h/Ch8opDkPsH74vFYl0QUdBnqjRe1a3xR
	 t/rRCPE1ytCnNJZqeLNuuKSCy/u8vUX5rMSXVa+p6vSMPOF3ii26jAe6MJiwEFRsK+sp1
	 3hXyuTPxcJSKVRBgqanfu2Fb6zDaCI/pGJKN+cqspC7K/DCKYFc7rlXPra9+tNLNOcUYt
	 3E39t9zqSBXHwi1TlsjPbwdGu8IgCuFtbeclwmpOMVhY9TTOVtQvSbEAWr1EGHjd0xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rKiBaLiH;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03B606C908
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E03B606C908
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rKiBaLiH
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6324caa0dso121095a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423984; x=1793028784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
        b=rKiBaLiHA+wAj+IDHNi51Xs9grM09WoPm+Jryti86x78iXrYmwZHGurSps/Ezf9PLa
         rht/nC+yCW9W4lyFiHWeRTlkKkmTbEytKscB+/TT/XVoIyJVP658YmxRhCdlGHIIMKe8
         gJBSi2JDs+cDjFlbwf8anbdTuSxgxZZWQAnXlqZAbvkoIdpzNQQwAMXmCHVgRhl9NPTk
         KrKIwz9JwKqlbhcb2Fmh+ocA/wFBsTpjtOtiZjocNGt1ME6zY1TMBSUJFOLtWFEFCBGT
         +N8FGdT0XhQVHUoVOMVS021IZ3RNDbI4iHuxC+XuSmLo5OhIklT+2w4pb64aO6SvsdnL
         OoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423984; x=1793028784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RTU0GqXO0v09/wvq3q/okf4+AOCgqZ21ovd0A51lLqA=;
        b=eWQywllRiuytYTcHr+RWUa31Ydr/MvKjoStbS/EJFvBSDHUYrjU6PvgrKLc7YC9LNS
         kA1srsOGQ1TnZ16t4qvHoiT2vwDsP1WReVltsW2KCJ4/H8IpCGKPKRMkpvZiGuV04RWS
         cUd7G3RX5qVRzl724wd27MT8CHSd3WeC9x7QH7guTOFzNuTEWnDxMedC2C8GMcNxKNJU
         ylwyae38bLKUR6n7XWudUAF01KYQz79hLo2fri9Bcq32n4ZBIUc4vSezlhs/jxVTK0fn
         awYfj4uv1jn3QC+dg/Jfmy08VGGFsW5QyNv9h4JWQmzxdMv6FbpfqBNX/DkCKrvmSMWg
         /Xjg==
X-Forwarded-Encrypted: i=1; AKwUvBxUdukd8D/roqECJrdWRDDST7tphwnMpaKvPU1IazN8wV//ANCZnM8E34Wu+Yd0++f6318xJi/Q3QhFynU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPe46Bv0kiKgKGEV89CDQ6C+uDcHmvXlVUO0IlS8jzT+uNoGtN
	IzQeCLCAEi4RnOrvEBsEKpvdc3piwb8cfiyxJQ9++R5H6Q0/oSu8Xl5z
X-Gm-Gg: AYBFou1tgJb7zUmkq33kVy2ooqBwcLoNINa9gkTfCXtJsZhH979d4KiOjXCnPMNh9Ux
	4rAIwSGCoLeXWtg1nxWgGZd2gOZ4oB0SpKd+LX294L1bqZX3bbwECYvW2/zJRXKXo6uW1tK2bll
	uYUXIGKLdDGv/i02xU1BTQrN1noTP3CHGoLq+qYp33uComg0JMzFjYvRk312uPyll03mhdUWAX8
	prUWjCOSWrPYazKkW6hTVccN+L6jw5ZRHtsX0CJ7BMuh9h/nYLWKVixCPl20Kez94ylBjURb8kx
	kKaPiwfLPiqpiAyLcMcIx7yjj83HOvxjdBTPYJKMVq+Ec6TETUH0gQwPOSnskKmzUn0G+Q30WYp
	yn+zkwbHQgSbrXgy+h+qx4ysE3Z1MHNBbHnwnyOLbYzl1nmOCM1h2/7/t/BUAL74XxOlJlixLeH
	cj20l++NqwubsQpfS/omEsEnUfe5bU9VGNL5+n78VdRLgpGAe1JnGznO9nXFQjXzFF+hj4ny6QO
	PiIGlD4wzmDCqgFAjZ1okg2Gv9zDUOLhTq6JMa/N3+wj76ud46xuN7UcBiT+RMFdblhpvjgry+z
	aQ==
X-Received: by 2002:a05:6a00:4786:b0:8a0:1269:651e with SMTP id d2e1a72fcca58-8a04be68eeamr6694821b3a.3.1792423983578;
        Mon, 19 Oct 2026 08:33:03 -0700 (PDT)
Received: from localhost.localdomain ([183.42.136.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm4017801b3a.29.2026.10.19.08.32.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 08:33:03 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
	chopps@labn.net,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 1/3] xfrm: run the receive callback before dropping the skb->dev reference
Date: Mon, 19 Oct 2026 23:32:45 +0800
Message-ID: <20261019153247.89957-2-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
References: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
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

The drop path in xfrm_input() releases the skb->dev reference that is
held across an async resumption before it runs the receive callbacks.
The callbacks may still dereference skb->dev, xfrmi_rcv_cb() reads
skb->dev->ifindex, so they can race a concurrent teardown of the
device.  Run the callbacks first and drop the reference afterwards,
like the success path does.

The early drop for a state that is no longer valid releases the
reference on its own; let the drop label handle that reference too.

Fixes: 1c428b038400 ("xfrm: hold dev ref until after transport_finish NF_HOOK")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/xfrm/xfrm_input.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d51392a..94de4f698c33 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -496,7 +496,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 					       LINUX_MIB_XFRMINSTATEINVALID);
 
 			if (encap_type == -1)
-				dev_put(dev);
+				async = 1;
 			goto drop;
 		}
 
@@ -779,9 +779,9 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 drop_unlock:
 	spin_unlock(&x->lock);
 drop:
+	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
 	if (async)
 		dev_put(dev);
-	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
 	kfree_skb(skb);
 	return 0;
 }
-- 
2.54.0 (Apple Git-157)

