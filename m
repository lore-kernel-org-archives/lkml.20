Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D747986C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157245; cv=none; b=agqWZR+Dps5XnvaVuz6Ol4Z9ipvE9FPtOXneXH0RdRwZci/ErScoQBgPaHnnXlgW9U8PAf4v/16UmOMF9FoajPyLrDPAh+xv1fv0bjLdwOUEDrHIGKYc21EVm5wDFqbBQT5GG+Z9YThbXwaMAlA71SDv8E06XmKoAoWn+ZB5Q2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157245; c=relaxed/simple;
	bh=7lJhbyjirH5zCJmTumSnG3oHiNd4/m1148HN9wMGhoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epxDxtIt9h8gT50U/SEs+32fVsG3l/CFrVJsWYyxZACzSL0hmETuGvIlgBwc5kGy+sOEkx5QsNO9y/l2YzGW8SrnVXiAa9IfxVkuiZemuEMl3LhO4fFwZXYl4NAk2DAFXYNJZJvx5dz/woBh2P9xZKX6umgVm68p+OyoOBfD27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQRilWui; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQRilWui"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so52579085e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157241; x=1792762041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIGsi8yoMefpYRASR5cNSIMFZDXgY+eEY8Ausj37ByM=;
        b=kQRilWuiAn8tICLJUeOY3AAv29cxLQwuRgfsTvX/wPX5TQD7xVoZlr64wNK8Dy0xHP
         27Cqrj2iL4lro2KEGHRkdixM/9hbqfyQtW75865l7yFti57Q00cLub58zNyh5gkhaROl
         WeuLhJ2aZTX/P1N84tBXCP7DToZeekNGDXGXISemMuqeJvWqBWn4+nkDJ1nmUdvQ6du6
         tgMuXLxFpbIFUQwOE3QLZD2J+AQbjtKFl8qB9B7DG+QeiDJE1G+D2r0V+vrllIRT6GoN
         esYt5nA4thMexChiZECyCayUu4pfVNA0uqoRP3xowuxiDIFYTsWIOkBk6TxmjWM4Gr+W
         MdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157241; x=1792762041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MIGsi8yoMefpYRASR5cNSIMFZDXgY+eEY8Ausj37ByM=;
        b=Oc5Jv63KGETw03zkaEFpCvJg31FAU/fOYUKuAl5uWDbDaA2wwl2RKXzE+YBemxuHzN
         L5Dt25dgu02b0S4wydjs5/CRTBbXNKrk/JjH9hSJXotXi0uwwWZhb0rpVfzmAhbGnEPe
         J56mdFntDg3sIIukAEFUmpfsyH0MZ+yFqG0gfGiYMuOUv96dOTM5hwGyn+c5mHfYFYRR
         /fo9765Ssr8dxZSFNeYBY8BM4sJdf/LrSYX9oWh7Ha7bzJQX7Fniy95WX2DK32pUgOBk
         KUM8h2Ctff836Knve7QarpebRY2pvluIyZvapEeWyF1pRQQxTvYz+1WOcyZfRvbPKbIp
         K/pw==
X-Forwarded-Encrypted: i=1; AKwUvByzMuzUV3jLXvvS7urLc0jDyK12eS5qgvtTqRtMTieYKv7LgApY23a3ZR9ppOuMcyZoDKC94gt1dwfglC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSQZVchUkOzry7o4lJlm30wdP8EkmLMRcS+6QdXqjvAZyAFQNM
	DptaPiKsHflzPyR4p5uzouR7D7d5Vd8zKFgmiKS0Tki6ZXF8bJpVayVJ
X-Gm-Gg: AYBFou37CiZPNubm3hss1qg4E5addIE/71Lj+sMJ6AKjTa9caIlmaDF+do5SayBSU2Q
	aI3Nn7S9ZXKDQ+MFZJo733E7WdGGVk9/zHjDNHzksf3PtnZJm+MWsBfADRmCKY2Y9OPC7w2Ghe4
	1XSN13svD3k6l46HIgZuxXJ/ddKIf7/5aLDXHkx04Khyh8i03zVqdjvtavn6HTClwotLSrNRFRh
	Pl8T88vDeZkq8Fh00OiSVPn+taH1gZ60tILJXsG+ElSlHWrybVpbTWp5tHAIsp+pwFUoamLZw+g
	n2oOS8AP69wmrKHPrAMuGs1ShEq9gBPHRueiWJbSxbvb02No4Fy0ATmwdAx+0CcBcT9gWmbLCCj
	TjjpF6sNEApPjyRt/BzkuerBPDkdBcnqkcNb4/VJ71Oo1IKz1hqhYpJGqaw76Uk2s1sOE1zKM0M
	n4/er0dV1TxhOmkzK/6MuY8jMwG6hzCDXpPNSP+opyxtd7LrO8QP7FItUNTG3NDKs8i/KvFBnrM
	M8nOl7q1Edc5a/zr9xAFk0EUTHou+YymM+5JZq+4QsHL6szmQXIqGa/JCA=
X-Received: by 2002:a05:600c:3e0f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a18e4b60d8mr444663565e9.23.1792157241254;
        Fri, 16 Oct 2026 06:27:21 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm58114275e9.14.2026.10.16.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:27:20 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net-next v3 1/3] vsock: move SOL_SOCKET options to vsock_sol_socket_setsockopt()
Date: Fri, 16 Oct 2026 14:27:14 +0100
Message-ID: <20261016132716.272018-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016132716.272018-1-devnexen@gmail.com>
References: <20261016132716.272018-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SO_ZEROCOPY is handled inline in vsock_connectible_setsockopt(). Move it
to a helper with a switch on optname, so other SOL_SOCKET options can be
added as new cases. The value parsing goes to its own helper too, so each
option can do its own checks before it.

No functional change.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 net/vmw_vsock/af_vsock.c | 90 +++++++++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 25 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 1c2d1cea67f4..ac2faac97462 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2014,6 +2014,66 @@ static void vsock_update_buffer_size(struct vsock_sock *vsk,
 	vsk->buffer_size = val;
 }
 
+static bool vsock_sol_socket_custom(int optname)
+{
+	switch (optname) {
+	case SO_ZEROCOPY:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int vsock_sol_socket_get_bool(sockptr_t optval, unsigned int optlen,
+				     int *val)
+{
+	/* Use 'int' type here, because variable to set these options usually
+	 * has this type.
+	 */
+	if (optlen < sizeof(*val))
+		return -EINVAL;
+
+	if (copy_from_sockptr(val, optval, sizeof(*val)))
+		return -EFAULT;
+
+	if (*val < 0 || *val > 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int vsock_sol_socket_setsockopt(struct sock *sk, int optname,
+				       sockptr_t optval, unsigned int optlen)
+{
+	struct vsock_sock *vsk = vsock_sk(sk);
+	int err;
+	int val;
+
+	lock_sock(sk);
+
+	switch (optname) {
+	case SO_ZEROCOPY:
+		err = vsock_sol_socket_get_bool(optval, optlen, &val);
+		if (err)
+			break;
+
+		if (vsk->transport && !vsock_msgzerocopy_allow(vsk->transport)) {
+			err = -EOPNOTSUPP;
+			break;
+		}
+
+		sock_valbool_flag(sk, SOCK_ZEROCOPY, val);
+		break;
+
+	default:
+		err = -ENOPROTOOPT;
+		break;
+	}
+
+	release_sock(sk);
+	return err;
+}
+
 static int vsock_connectible_setsockopt(struct socket *sock,
 					int level,
 					int optname,
@@ -2045,36 +2105,16 @@ static int vsock_connectible_setsockopt(struct socket *sock,
 	sk = sock->sk;
 	vsk = vsock_sk(sk);
 
-	lock_sock(sk);
-
-	transport = vsk->transport;
-
 	if (level == SOL_SOCKET) {
-		int zerocopy;
-
-		if (optname != SO_ZEROCOPY) {
-			release_sock(sk);
+		if (!vsock_sol_socket_custom(optname))
 			return sock_setsockopt(sock, level, optname, optval, optlen);
-		}
-
-		/* Use 'int' type here, because variable to
-		 * set this option usually has this type.
-		 */
-		COPY_IN(zerocopy);
 
-		if (zerocopy < 0 || zerocopy > 1) {
-			err = -EINVAL;
-			goto exit;
-		}
+		return vsock_sol_socket_setsockopt(sk, optname, optval, optlen);
+	}
 
-		if (transport && !vsock_msgzerocopy_allow(transport)) {
-			err = -EOPNOTSUPP;
-			goto exit;
-		}
+	lock_sock(sk);
 
-		sock_valbool_flag(sk, SOCK_ZEROCOPY, zerocopy);
-		goto exit;
-	}
+	transport = vsk->transport;
 
 	switch (optname) {
 	case SO_VM_SOCKETS_BUFFER_SIZE:
-- 
2.55.0

