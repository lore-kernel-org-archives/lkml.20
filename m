Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794021427;
	b=DWNtAXbTApnRevCNeYTkfLX2Dpp/TAW/2T67eZ8lKpDPiBIXCYmFkNXheIxiAm9C/tLl
	 1/UBdl7ajUVjyqExdHn1EQXAXxWkoUM8vLa9wtHPQBFi/9ePVUQfeL+4a3OLYrR8vRdah
	 sLde5ztmcRBEwx7goJtqTv0k+4ObhmFn0yJ1GqnXTp9+Evuc7sp+v/NR5vWFcqXva2jlG
	 pZ6LcrmQ483H5uWIeT+DV+1f+B2ur0iyXPTaY0cEVSyyUo/jb1jKfwHAKXpbnkw8heMg5
	 liJwhM6XiRUYzfx7PtTWIDXUtpAYBV9oSM9dTFbJnM6F9cTfnlxolmYHueMPr/aYonQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794021427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=/Af3dxVFdK7w3VK33AvL8Uz9Ngj8vYoQi7CthafUnO8=;
	b=irRI9GLA8Aw+lJu1G3qnPtQe4RqERCONfe0VLLUWG5fCpzeMFTMgPhbU8cGffoHx8E/1
	 xMOsa9BL3/Clv2oZ+y7rE6dsn2dl1fXLefbquLBHn18rN3q07DkWZHLbVYE3smbw2agki
	 0ogi2bpVKr/V2Z1VM62nPxtA/VPQwLUAEZu3Khf2042L2xXX3D3MNhUcYxzBDJu52XJRX
	 EekRnogVY79BT5d3wH/CHs2f3mRU2ZjKD3fxa2IrDE21lkivWPGPuWgS7Qpw1aFSoSlin
	 b4XY/131C34/VnOFS76A+3qT+TyooJE/FOpHfwvDUWhnJh0MOnk5VH3x//o/9Pq0uNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2F78KU+;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084A606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2084A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2F78KU+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36d1b3b9974so123823eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794021426; x=1794626226; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/Af3dxVFdK7w3VK33AvL8Uz9Ngj8vYoQi7CthafUnO8=;
        b=R2F78KU+hwt4XFx+iD0zKLcnZ/xdcab1mfmsBmOazJa98Tk4RaPzcTauct2pXc0wMy
         iqocWQpPTvhsIO0QfKHUAPjmgYU0P0Umxzel9TQIpxDo1+GRLF8anZwzmSC//seEfohr
         SXTJmzGk7Ap1VmOwIEmTVKKfZQxx1oCUcIGbQdHYzGunMJVHA4JZs//pcfFph3Fe3BF9
         Lh74clv/GMTafJE5HSdOJOwcEGfyBTyS6HuJQHCs19h7Un0WCRYMPFCiEX960CQrNX/H
         +SiQumXn0l1ugqvrFmFBO0Nyo14KCPCVEq8N2qo4MBpvQ0NcTqZLtGOD5MHTXI/ggYJl
         O+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794021426; x=1794626226;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Af3dxVFdK7w3VK33AvL8Uz9Ngj8vYoQi7CthafUnO8=;
        b=Nciv5ToU5NcHt4MiVLhE8j20Np66KqVNzJnzKg2571ALESlSl6oIk8bul2sXBxxWRt
         lCwAXJN8M0OM1/RXD68M50GQMEUHTZcXyvzeuybg+rh3tWpKBxdteM3/PuZ82F6qT47t
         voGg5cq7tdHLDvShU7PKqOAmFL8geaxzwGqBtp40Ug+eRlACUHjfr20TA8/P1ZfsMYQa
         i4TLTbpl6EysYBVgWoYo/Idh7PDhI3QSjG5YpddIdMRpeSZ2DPFUL5DKOMUPl8r1JGyF
         vBmTMdHgNsDEJkH1UT7qSvYKnRz1wsLuN84h64xK/W2rzeHGy7YrhFNNhxrG7LVdoG18
         QdqQ==
X-Forwarded-Encrypted: i=1; AL+hErH/yBDVhl3AiSV1b848pWewnDLIVeLWLDXa6RD2ujOPUUTaXGUESZWmj+kxOco9H3BYsCZlVVDONX1k1Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z85KHanC5hsLwhNg0BV41Wbg2ucm3bDHdGAfHto6ujaLz8TSlzK
	YUN1ePs2stnD220YQxONiCGCi2g2gLTvwSaXq71f317QC9sorg93RPLG
X-Gm-Gg: AYBFou1g1PWcmYR8Zc9PIwuNoulhXMOJZfKdEqw7u1PyUbBa+AGfUBHjmVniEHbuWvP
	/3BuARjIatIy7ufO2fC6zttCAG1vFIl0PnYXV5LIaVdDYRQd1cPl8OazJ6kvJmz1GMwMOGglJCQ
	pUZAgewXkrKQeQCNSM+1jR7zrovtTGYrsLrbLuXoCHnkAwjQp108RS4VjJEwTlzhPFLeviAoGUK
	hP3mXQh1v1YMWRJ8Ha+X2a62Mvks/iYWAn45YRPf4qEW5/CtNil6jg4ZAsKr9+6N1kRpxgn8rJT
	0dKyWF1ImNJ9Bmypv3Dsdxsm7qx6Fzn+NnbOTkWOgA20ZiyB8FL/rWAQMMsPqchsIoswGd2qqtW
	ic7BNJb8uIsQB+yPqYa1lntE9Bq5NL4AF+0fmNoQjIFw3DTWRwPnWMDMJL4k7waDRpSB6OU8hw3
	hnaOd8I0QzC14pqJJPvmwzho7jFOTl6vTjZZ56GDfhkbreSSF/UbzyV5V/uDK7jLtQrUbYbkt6l
	OP0asp4VunhC2+9ID6+R/sMuobcjS4YQCvRofHwVyNdDtmVD81yMfgBqFKm5bUIY6AGM3c2WB1G
	u0Us159tbF2+6rwVL0eBGU9mY7igJn2vixFuEuMeMkjKxJMNsmDLaeegLJKzfYXBXSorBZxGUdn
	x6cdemgQxnuqAg/Ey
X-Received: by 2002:a05:7301:5156:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-36f7474bfcdmr9771823eec.1.1794021426141;
        Fri, 06 Nov 2026 19:17:06 -0800 (PST)
Received: from msg ([188.253.120.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c1df6sm10235540c88.14.2026.11.06.19.17.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:17:05 -0800 (PST)
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
Message-ID: <20261107111617.21347-3-q.h.hack.winter@gmail.com>
In-Reply-To: <20261107111617.21347-1-q.h.hack.winter@gmail.com>
References: <20261107111617.21347-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Sat, 31 Oct 2026 10:07:03 +0800
Subject: [PATCH net v8 2/3] xfrm: iptfs: hand the drop timer back to the
 reorder window
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

__iptfs_reassem_done() cancels the drop timer whenever an in-progress
packet finishes reassembly, even if the reorder window still holds
out-of-order packets.  Those packets were saved with a drop time of their
own and the same timer is what ages them out.

If the missing packet never arrives, the window is never drained: the
queued packets are not delivered, and each one keeps the xfrm_state
reference it took from its secpath, so the state cannot be destroyed.
Nothing re-arms the timer to clean that up.  iptfs_set_window_drop_times()
only starts it when the walk back through the window reaches the empty
slot 0, and an occupied slot 0 stops the walk.

Cancel the timer as before and, if the window has entries, arm it again
for the drop time of slot 0.  Leaving the queued timer in place instead
would keep the expiry of the reassembly that just finished, which is
earlier than the window's own deadline; a reassembly started in between
would then not arm its timer and could be dropped before its budget ran
out.  Arming it for slot 0 keeps what iptfs_drop_timer() expects, one
deadline that belongs to the window.

Fixes: 6be02e3e4f376 ("xfrm: iptfs: handle reordering of received packets")
Reported-by: Lilly Aronleigh <lilly@aronleigh.au>
Link: https://lore.kernel.org/netdev/20260824072851.301644-3-lilly@aronleigh.au/
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/xfrm/xfrm_iptfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa..5ea3e77dd 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -708,6 +708,15 @@ static void __iptfs_reassem_done(struct xfrm_iptfs_data *xtfs, bool free)
 
 	/* We don't care if it works locking takes care of things */
 	hrtimer_try_to_cancel(&xtfs->drop_timer);
+	/* The timer also ages out the reorder window, if it has any entries. */
+	if (xtfs->w_savedlen) {
+		time64_t now = ktime_get_raw_fast_ns();
+
+		hrtimer_start(&xtfs->drop_timer,
+			      xtfs->w_saved[0].drop_time - now,
+			      IPTFS_HRTIMER_MODE);
+	}
+
 	if (free)
 		kfree_skb(xtfs->ra_newskb);
 	xtfs->ra_newskb = NULL;
-- 
2.54.0 (Apple Git-157)


