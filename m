Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344745;
	b=TFcHX4zpVIfZjcDaXmLA+K4LKb+lSrv3T52e6jrlKw6b8CCBLaCbNmr3gmMRPlDFmvYe
	 RG/CIRFdzf9Xt+zaIkMbZio1wR765Ld2+zheji/qrDVc3zy7WdTV3F17zweYQ3s7S9tw9
	 yvCQlv2QX38wc8x3zuyadQDYT1N7tgFXfootnP7E4if9NEhp5B37weJV/GPQ5AL7b4O3/
	 7HJD12UHLRtlIyGkZsw8e3bXuOSnxoA0OXiXPgUgzXxSiLmh3QH0Y0e0vUJHCXQ39pWPx
	 EHVzyDVvY6N73Y2NSbCycB2h04RMAd4mmuGA49WcyuYl/uh6gEJRwqj1WfOewXawqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUZ++lOPZU77n13Tlx+PO5BBZRBL2APmrbLQHc5pOjI=;
	b=gn5ntPyiu2XaaOUJ02vRmb+2VFRTWlpoGcUaM36zzN2SYw25FYllz7JvbqRm3WfAgDnK
	 pZiPWh3Z9AKiewNyUDZg40Cdwah8wkLuSa92XSeHnluT1i5OgCG9M33r7M13KPPdYkIwQ
	 hgQAOTf7nxlQeD8bIpzCC6GVPNnm7prZ9Uq4IScogfj+mNvoBRdfiKpeFfqXKYQyJMi48
	 KLmeV6qHKp2dNfUgJD65LCgoIWMX1SK2kmfjlAP7Wjwv+SeUSn14hq/NHRI9z2KxJrPk2
	 gLhjejhTwL8OVw/o0aBjWabOfMoHndH7HtY9E/CERaOxAT1485J8EX4Cb59eGoduKnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=vVpHrmCm;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A84606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A84606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=vVpHrmCm
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37071c0f42aso4373772eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344743; x=1794949543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUZ++lOPZU77n13Tlx+PO5BBZRBL2APmrbLQHc5pOjI=;
        b=vVpHrmCmWx5r5rXOQTkRrZYXYl23aHiNapCjG3jtM27jYfmadp70qEWff0WeCWY/Vp
         57XEQ7UtEzcA0pnYWSk5wvzamxku+TBM8NV3JgHI4PsuoJtObWpiNnNsEK/nsTRrFelE
         8m3M7ARcjkC2jQeZ7Zst6Njkq3+R8o2gWsWUhljliETfvKRGypZiEMIMpyVatanwHdBU
         KZmaDFXfD/n2Ibq72A0vvzSiRJbSkq/fL1TMrVizL05XdHdopxRx7BRv6o2xnyU552C9
         9Sw2B6qT3jdlhWDCbuY5o04uZmDGm6jjBNMRc4xEFZEk4kgfMWH779XP8xyqdFx8zHHo
         KhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344743; x=1794949543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUZ++lOPZU77n13Tlx+PO5BBZRBL2APmrbLQHc5pOjI=;
        b=eGHCXC4xBXQpl8TWp0+aQl2z3vXsHDi8FTdzLxQ88DeBgA1MlKMw8rcGOT6hoWwc/c
         8MPSwpTHFD/gYFSRa3rts4TvIB17o/nWYg14Lesj4Se+A4AUdVhKfdSUjfV6qr3qfmQM
         lphY5QIMPUcRZ47G+VW1F2wlKm7Ir4vMiPoXMQGPc+46b8/Ci/iAsXQoi7ZpsEZHkrTy
         vimWWhGwk88Y/eIiO9qbNhUkQtkgBwyMEGhAR3uTpCvE70VHhdvD81qNkc8dEJcUNeVx
         EAabW2hENbqkiScorZziOQ8hsG9jLBGeirYWciGu7fNPxApa4CZGKuIlTkms06vVY3GJ
         YuGA==
X-Forwarded-Encrypted: i=1; AL+hErEWi6XE2p/qZ7PbObO8wlfX7/WlnMPj2nM4OoqoMN/2ca/85igydDke2oE/FAwcF/y3wRVuxaxA63MgRwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QEiVlm3KsBp/R5opWgoSjrrlTxPnSW867IC/6Js3q722ybUDP
	Lw0XuTsGT5qn0yMqPNiS+vgR2kw72FJ1ny+IvyVaksORJXgU3i7HsaWY5FmX4NWeRQI=
X-Gm-Gg: AYBFou0qLL0WKGJP8LJTPwIMmoMpsqb2cHHHCqNTwMjp6tldVsHDuRe2MgFqWgkdBxx
	VM7A9n1DyPlY90aIAYFJL7iVIOsIRukI22n+r3orJUQw5EzXculpSShN94iliMm1j54t+qmNT2u
	SjYU/PQvslFxtGpRvUSZUUTOjRSSpKcWBHV1tJKAdDsDynJ3ZEEn19DVLHF+z+fSl0vu7yYf+WA
	IxkivOGOkCunAJ7ZRCX5+b+e7HET6qlzDdMo81OvQxx9YxL6Z60dPxZmbTCmdzRjlrAmFTx8qMv
	kRxKYCOokpsYGjooyW4vBiaKuPmj2qG95nn+HESYcJy9k/XXPtkh6/BCQ2872mOZ+5DCwxgrwZf
	hdoV3eO6Z0gIwqPZscxrRP4aY7UsNwbWdzLRTM8qMUul8HdFjyu6Hf08Anj9x3IoIenzIEGiGks
	espOXZSWV8S3IwpfSv4BT4UrhYbvqf2lGn6h3r7LkL+a4AGFpME6YFfZumbWt9/9I2VtGe658qE
	vLBoq75O0/dzIuUCQpoCoeZtJZvKF/AiLdNsWe/Lu+J04lVKclsX7WlopUkQjtpnfffVCpat8jl
	HKufLhkTZKcJO7cQH8qkcJCWke2y40p0/zD/IhCel8wmkK/ZHPhBxB7kzWeqvoP2Ik40ng0=
X-Received: by 2002:a05:7300:51c3:b0:36e:d060:8bad with SMTP id 5a478bee46e88-3768385dc4fmr798043eec.5.1794344742492;
        Tue, 10 Nov 2026 13:05:42 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm10464097eec.17.2026.11.10.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:41 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net v7 1/6] amt: stop receiving before amt_dev_stop() tears down its state
Date: Tue, 10 Nov 2026 21:05:32 +0000
Message-ID: <20261110210538.217936-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110210538.217936-1-omar@blockcast.net>
References: <20261110210538.217936-1-omar@blockcast.net>
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

amt_dev_stop() clears amt->sk and waits in synchronize_net(), but the
socket's sk_user_data still points at the device until
udp_tunnel_sock_release() clears it afterwards, and nothing waits for
readers then. An amt_rcv() that loads the pointer after the grace period
can still be running once amt_dev_stop() has cancelled event_wq and torn
down the relay's tunnels. A gateway can then queue a received
Advertisement or Membership Query on event_wq again, and a relay can
link a new tunnel from a Request and arm its gc_wq. Either work can then
run after the device has been freed.

Clear sk_user_data before the grace period, so synchronize_net() also
waits for every amt_rcv() that can still see the device. Once it is
NULL, amt_rcv() drops the packet and amt_err_lookup() ignores the ICMP
error.

The race is as old as amt_rcv(). From commit 3cf7203ca620 ("net/tunnel:
wait until all sk_user_data reader finish before releasing the sock")
until commit 72d3b9a4c2b1 ("udp_tunnel: Remove synchronize_rcu() in
udp_tunnel_sock_release()."), udp_tunnel_sock_release() waited for
those readers after clearing sk_user_data, which hid it. The wait was
removed because each tunnel driver frees its fast-path state only after
a grace period, but amt_rcv() does more than read that state: it queues
work and links tunnels that amt_dev_stop() must already have stopped.

Found by code inspection; not triggered.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Fixes: 72d3b9a4c2b1 ("udp_tunnel: Remove synchronize_rcu() in udp_tunnel_sock_release().")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 81d26ef82..3a703b79f 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3073,9 +3073,14 @@ static int amt_dev_stop(struct net_device *dev)
 	disable_delayed_work_sync(&amt->discovery_wq);
 	cancel_delayed_work_sync(&amt->secret_wq);
 
-	/* shutdown */
+	/* shutdown.  Detach the receive path as well, so that once the
+	 * grace period ends no amt_rcv() can still see the device and queue
+	 * work after the teardown below.
+	 */
 	sk = rtnl_dereference(amt->sk);
 	RCU_INIT_POINTER(amt->sk, NULL);
+	if (sk)
+		rcu_assign_sk_user_data(sk, NULL);
 	synchronize_net();
 	if (sk)
 		udp_tunnel_sock_release(sk);
-- 
2.43.0

