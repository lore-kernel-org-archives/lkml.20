Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BCB3655ED
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853332; cv=none; b=hQy4xCnKgVdjLWJptWBA5xWsG2u+ur8FuSPthahflmJkhKYINgm+u6t+9edweaW2Sw8NF501TtAkieRI/lCx72k9FKelMzA/9pxF84OYvi0Dd+802EHLbqBvv47sK0sY707HA7q5zLlj1eKVrRtTu562lknZRxQYBxIlYzRdKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853332; c=relaxed/simple;
	bh=29cNs/juRNC0M4hpw8e7kSBi1mL82XHAqXpYfgtHysY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2BPWTv7B+Mg90V7lHzT1ffwTyiPWaZPyhIAnnFz8v3bqaNs0yAgJgXBuZCd45L9syIs750iFAR8A0d5Hhj6Hfgfayh/pojt6yO6r6LfseNaxYsvxfH+97fj2UMGTgjCYQtaLba2sConZGMF0Ko5qoYlUgB/W9+EEXypH+fsPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf/vWVhi; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf/vWVhi"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f20513so1562490b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853330; x=1790458130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqTVypEDQvnt8igDXJ4umo5MPYQdKNJ/mfw7e+Zzmf8=;
        b=Uf/vWVhijI7Q055W2aM5P3ecoSnYYGNj8a3JmiDjKOxf6UxDWgksB/ahuZXaZQadnN
         ih71NvyCDn/5Q7KcQZAoUI1Yd6/Zgtr4k/V1RttgosstT+81e932hVh9H33hrDPKZn6n
         pspl+4WQzjSoFVqv1PLtxVNXbFSGtksBd/U5t1SNUEHfQ7ywBpl1Ls5kCle1H3v68RiR
         NErn/9Q5OTmBDRtDPoNE+ix09GkEbWXkB5BGk+G2IUzDt59OvWi69rJPnFoGnkQWMsAr
         vnQvPz/vM+pBMnJ3V/NHUZH6haQFSIyX8nONrRM4sdBYkr8UEsn35dkTbXRbzt7nngXA
         j7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853330; x=1790458130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqTVypEDQvnt8igDXJ4umo5MPYQdKNJ/mfw7e+Zzmf8=;
        b=O5GAbq5M3hkuZMleLMQ270v7W1Xn4dQJxzf5I7WeQ/RWEbCoJ7ODzigUYqkA/G3GPD
         2aq2dfRv2cRjJWjTQU9v2Xsfj8hbhYj1vALVi41U5uP/0//syBbOvlwJ1U8srw24KUS+
         JoB8FMogtuA9HPGY09V97U4cUEX6YRlnaUJO82I3WiEvDGYEOump83g3yfKKQu+L5E39
         9KLOV7Zl79FfG4TorumZk9mwX987JOW8DvCZf3oI5OrBdGiRdw1OEsLrmY+0DNhQho3d
         l0H7lCVZcjiX+GajztKb/tNjnRMeiAAPxI+ALPOg/Mb2XvL6w8rahBL/WSRqhu9oaGEq
         peLQ==
X-Forwarded-Encrypted: i=1; AKwUvBweZBs7HM87q+W/HNXOFnQgC1fhlQltuTpluK8qIGcTH4kfd67y9aP3ux5XkGvLazcLhSrA9f6GLk0aRd8=@vger.kernel.org
X-Gm-Message-State: AFuF++ldiDwURqsBIeov9b3iUrNAPOAOGppx2dbJaazGWLRLxnG7OhGe
	r/EAdW2C/5xA8u17x43UN6dM8sXTHGGN384alaSSkgiCz+CLi2ZywAHN
X-Gm-Gg: AYBFou2TpXR06rjuigt/jxczOv12sltVtxvENaF8LIFNHi1NdxPGD83Rvi8U0sm6mnt
	uCFZ4ZgzftKsqQD8BDwZmG666wwSHIpp2yz+OkRWqMrwjWnpIaOrkRYeGLVsMVvOr/Zb/VlqMjE
	nRaBTgdfHStCNDHxy/ECVxiM1tB9th5DydECXdgLx+E+/aQ19ieojqNupFaos8GEyoPU8/ejJJR
	eDzkyf/kDYdRj+mcK4jxI5QMLH9YV8T0FZu1QPQ7tQzEj+kC+Lx88YKaSXTfNRVv0lFLeyhscKb
	t8MnMH10Cu17gxaitm4Ns4gZHab6s8zdHeuuV/8gJgE9hDX9j5kK1+x7f1iO/znslU2sj3PjFRB
	JnYNsrPgVvPan8Zzj7hrFrsz/4L2W8DHeTS7THqgD0gHU9Ar40H1wjcuf0WlRU77JXnW5wZlx85
	VPT1EO0Ob4X2c8HVuc+Xl+DFvAg6pGg/NsPAjFzIWTR6e8W4j2mwKeq3tlRKb9lRasL64ct8gJi
	zBzuR1bEtApecuT5lIg3M497rB83LkikIc4QM49KRuZwNg1wiOHe6sZpGFwXwgYwsKSjeKoP9qE
	4Cidhbpxdw==
X-Received: by 2002:a05:6a00:2d20:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-874dc5eb6c5mr10065458b3a.5.1789853329884;
        Sat, 19 Sep 2026 14:28:49 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f8c39sm1287929b3a.28.2026.09.19.14.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:49 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: mani@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: qrtr: fix kernel stack infoleak in qrtr_getname() and qrtr_ioctl()
Date: Sat, 19 Sep 2026 21:28:49 +0000
Message-ID: <20260919212849.3240271-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct sockaddr_qrtr contains a 2-byte alignment padding hole between
`sq_family` (u16) and `sq_node` (u32).

In qrtr_getname(), declaring `struct sockaddr_qrtr qaddr;` on the stack
and assigning `qaddr = ipc->peer` or `qaddr = ipc->us` can leave the
2-byte padding hole uninitialized when copying `qaddr` to userspace via
`memcpy(saddr, &qaddr, sizeof(qaddr))`. Similarly, in qrtr_ioctl()
(`SIOCGIFADDR`), writing the 12-byte `struct sockaddr_qrtr` into the
16-byte `ifr.ifr_addr` without clearing `ifr.ifr_addr` leaves both the
2-byte padding hole and the trailing 4 bytes of `ifr.ifr_addr`
uninitialized before `put_user_ifreq()`.

Zero-initialize `qaddr` in qrtr_getname() and `ifr.ifr_addr` in
qrtr_ioctl(), and copy the explicit struct members.

Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/qrtr/af_qrtr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index cae7af5b9229..8c14c0434b2b 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -1178,7 +1178,7 @@ static int qrtr_getname(struct socket *sock, struct sockaddr *saddr,
 			int peer)
 {
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
-	struct sockaddr_qrtr qaddr;
+	struct sockaddr_qrtr qaddr = {};
 	struct sock *sk = sock->sk;
 
 	lock_sock(sk);
@@ -1188,9 +1188,11 @@ static int qrtr_getname(struct socket *sock, struct sockaddr *saddr,
 			return -ENOTCONN;
 		}
 
-		qaddr = ipc->peer;
+		qaddr.sq_node = ipc->peer.sq_node;
+		qaddr.sq_port = ipc->peer.sq_port;
 	} else {
-		qaddr = ipc->us;
+		qaddr.sq_node = ipc->us.sq_node;
+		qaddr.sq_port = ipc->us.sq_port;
 	}
 	release_sock(sk);
 
@@ -1233,8 +1235,11 @@ static int qrtr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 			break;
 		}
 
+		memset(&ifr.ifr_addr, 0, sizeof(ifr.ifr_addr));
 		sq = (struct sockaddr_qrtr *)&ifr.ifr_addr;
-		*sq = ipc->us;
+		sq->sq_family = ipc->us.sq_family;
+		sq->sq_node = ipc->us.sq_node;
+		sq->sq_port = ipc->us.sq_port;
 		if (put_user_ifreq(&ifr, argp)) {
 			rc = -EFAULT;
 			break;
-- 
2.55.0.1082.g2b9226bbc0-goog

