Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230529;
	b=l+ACVRBao6Vfbq7oGsrg7Im4xzYZzw1gdUa9GYnd1ibTaeB3ouG4FXDJhPheSvN8/Z8Q
	 Xibj7YPt7swpsdUiITlM752qF35TOe3oKRHsmtUDhOd9QjYhrhHPfJgkYRewB8DGs2hyp
	 hoRZNJPOSIgPzsvNzVLLtadNw+oNMW9TyOo2Wz7re6j+LsYhr9ePCAiAgbD5zRrfdrgHS
	 osjIVZflY3aqlVlSKikTZ9E5c0f+l2quwKWABpPcEoM6TqtiDOexYzmv7pkyzqnAmcP4J
	 ciC5x6Tr+RAZubdcVJ6N6VrNgxZ7gIv4KvEUV4zcNJ5YrtyzL+1il+Q1KPwmSph8pEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7we/GAiwR1WFvHBihvvXAm5IAlU8PXz2kOkz3WvO0/M=;
	b=v4iD5Ph3u1jQNE3cDFtHzlO3gLlOS+WiVc5I6xSibxkonOFBHokxw/vURYLK0ztO191R
	 WDQqMAa0rz7jOyMlDUk38eEgt92s3UlkTdjTaoTWK2ibhGCdkjVPcbkQYyqwpIoNODjeo
	 FpM1J0u5dzC0DjrskzOdU3bzcg3Zh/gaCZWoKgJNMNrASswr4OGA67jC2Gfn+W/La37r1
	 hea4ROme67vI5Rh3GM9WewFo+q27YUPfunEynoIXVsZ/X1w4GOtlB0zXjaG4BV33yR4ob
	 moqdD2+QwO302GyOksJZy+X0lyC698JOzey69Z/dpMnL/VxoIOmiBaVnJkyasxuxlaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ssn/dJ0h";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75374606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75374606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssn/dJ0h
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb681de50eso250773a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230529; x=1794835329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7we/GAiwR1WFvHBihvvXAm5IAlU8PXz2kOkz3WvO0/M=;
        b=ssn/dJ0hIDcrWl8YGRCXQ0Oy2oyESWTAeJlYQdSL4pfgeUEik2aB0njapnZkBshcU8
         GDKFf5Jz/hzGT9GHmunRTpkzbi4eKo1tk2GR1U6q9qRTmUyeAEEz90NwSYMO5CU9Mj+j
         HeUt6CGviLhQrstxgXntw9jw3BM1tZl2Ly0uSF4Ua+tSl7fx7hYTyyNKzY7cWWzqal//
         VlNlL3w1h8fgUT0fl+dLKGCOwc/5ZnadDA9SszyVommmFwKcDBeXvlpLBJqjGEmOS41T
         aAQ7E5lCbg4vlT4315aUSUW6B0uQ8XHVhpYKZODYlS8KuPGLueV27EHfw7v8T5LupU4R
         YV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230529; x=1794835329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7we/GAiwR1WFvHBihvvXAm5IAlU8PXz2kOkz3WvO0/M=;
        b=HYAsa9ZU6/TMovhUYSKeO4grtVfPSU0w43qPH/C8O0+3o31ZJSuFPgqsmOTV82PZwu
         v9BsilR9uM0+TvKbNGhtT5n1iBkzgLpiUZgYwuqDf+96YVhWiff5aD4eWEe4bTQmI7ow
         +RU5n5yAdbi74oPmLUHKMYb+zx8tMwmn6nE7dM7WVjSkkaciee4Qqs3ebLfdMK9qJwQt
         ve3oruzwPl0IeQ/qllHAHp1WrA53OYvxuMV3F1tS5R4bR88lBF0LdxZelO3lmutsAmzj
         a2WLhJavwPxtG8u8JP1gu9W6qKiyXHudzck3z3Dg5WmRiB+5Rds9auRmHI0XVr7ggO3D
         nN+g==
X-Forwarded-Encrypted: i=1; AL+hErEwmKpNt8GtCHyTcd0A4JSs+pNko127/WVRtWoSejihDeDwVtvO4th7vmX5P7qFe65/CKlVLFkkIa7wUT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BnDxALvCbqrwar65EmjPd8r3ibtVlP5/knAfdMHBze6WAZIkI
	26PP6VRBQK/dWkbPS8aMrUJ8Yfsc2rX64jFIIRju/QeTzdgBOaeizx6F
X-Gm-Gg: AYBFou1wr5khk5xVJ/r2pQlyIpOrl8iNhJPAvNHWu7oC3LM4X8hXc+xbDsQIthlSVMH
	xZ+DSi+uBxIPdqNpcSULWQZAMyLLxabpdqhjMWmq3ha8NzjuxiPaiq8uRC/SbMzoRlPTNQgjQuf
	TCpq7OmLFveueA1mVaUSw3B68Fx0yHdG0bkxTQAxxcCq79B+eY7kV0gw5yYewqbA7XXa7Dsry9/
	7B606POE+EZrOAVfCVEUz/68GcUPLLITZh8WtzRLLf5MGf5El1Ts+qu/Kd1ai5TTOt76ZOsJaZq
	7ri7hpWYqKCFZ/oYfrHWkncfjwH5fRd6wfqHftGZ44LC5HZec7UtEeXQ6mKD6eHWbIAjUVgpR+9
	zRRpRUFfbZcyk9tgm1SMNZt42zIReG2Mdjgh2OC6ri3chqfEJGIORiXVMcEVo0LNAqAKcDzaOrV
	+J5OnUQI+Dz/qdtSomQlI5VMM1rZaojNGkAcfLT9JUfHsBnjhToZsGSnzKiM0WteOctSXU+/k9r
	ylKGtXODH6mf+RtsQpp5HLcvPOEtl/bA5Y+BJNewQlwMcgsqWrdcYL3NNUDHNFHEbMctAWO+bo0
	letfBykMnFs/6iqeHz7ySH+HfSyYrE6iXMqMwfFovlybTirbpkosaPdihGWtp/unR06+
X-Received: by 2002:a17:90b:3ecc:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b12d37dc87mr3626719a91.33.1794230528418;
        Mon, 09 Nov 2026 05:22:08 -0800 (PST)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105881e6bsm11010043a91.7.2026.11.09.05.22.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 05:22:06 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Mat Martineau <martineau@kernel.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	security@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: L2CAP: Keep recvmsg from resuming a closed channel
Date: Mon,  9 Nov 2026 21:21:43 +0800
Message-ID: <20261109132143.94305-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Reading buffered ERTM data after ACL link loss can clear local busy and
send a supervisory frame after l2cap_conn_del() has destroyed the HCI
channel, which oopses on a NULL pointer in hci_send_acl(). The socket still
owns its L2CAP channel, so its lifetime does not protect the underlying HCI
channel.

Require BT_CONNECTED before clearing local busy in recvmsg. The socket lock
already held here serializes this check and send with teardown, which
closes the socket before the HCI channel is destroyed. Continue to allow
buffered data to be read after disconnection.

AI assistance was used.

Fixes: 61aa4f5b9f43 ("Bluetooth: Use the transmit state machine for busy state changes")
Cc: stable@vger.kernel.org # needs adjustments for 5.15
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1 GCC/Clang, sparse or smatch warnings.

In QEMU/vhci with KASAN, the base kernel faulted in hci_send_acl() during
busy-clear after the link was dropped, in two boots; the patched kernel ran
31 rounds that reached that state (RNR sent, slow reads, link loss) without
a report.

 net/bluetooth/l2cap_sock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 7a2551ef7f50..e5c15c083c1a 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1332,7 +1332,8 @@ static int l2cap_sock_recvmsg(struct socket *sock, struct msghdr *msg,
 	 * available.  This avoids resending large numbers of
 	 * frames.
 	 */
-	if (test_bit(CONN_LOCAL_BUSY, &pi->chan->conn_state) &&
+	if (sk->sk_state == BT_CONNECTED &&
+	    test_bit(CONN_LOCAL_BUSY, &pi->chan->conn_state) &&
 	    atomic_read(&sk->sk_rmem_alloc) <= sk->sk_rcvbuf >> 1)
 		l2cap_chan_busy(pi->chan, 0);
 

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

