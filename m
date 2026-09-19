Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C739E17C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789809083; cv=none; b=W3sWN9q9Vmr4/umvCZWpGO55bRFT+jYKzhjwf80IAsGdvno5Lm6tFXIGZSBNHPV5dRb2oR9gAQQmvBIsoJpkO8XQG70nQ8orxq2otUcKSVc9o0d+dVcGVObC050x6LYrCP3y8qjQLcdk7lojNrXJ0YYOn69MPMiJDcN4PJGLnMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789809083; c=relaxed/simple;
	bh=D6ph7n5q0URhHNzxQIE75QUv6yBpzCie/CEQlOfn/y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=onZxql8XmauXOxEA0JYrW9nucuLt3cL1zgs9BRc08wYmxuTI7rA80QE+dO8g4x21pucw5yxAi81pb3Wu6OwOyaN+fPwnq0fm0CQGaKtuS1as5Ei2FUm+paRhiWpHDUjXmhrr/taWBNKIqASN2v9Hyf3CBUBu45fFoSRycpvNIn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga3RmkaU; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga3RmkaU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso1660965a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789809081; x=1790413881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DsV9Fsd7Kx2vmgwJA0Z2vvtQ9MytD8CHEdEDo7dy1uA=;
        b=Ga3RmkaUi8qnXWAqUoVgRrVYSKjZyCt9fdn2t5YWupGHz2Gc5we7iSsTIdJn9rnKNu
         QX8Ni59WOGrrwts08zJ6Ye9UXDzPoheqe0QA3dIwNnpfPvJCG5NWn5EbaaCiD+7+yy82
         QRrPBuOkEF2oI3gkOJOBMewAbfztMZTpbWS3dK0OpXs9Z29aoznjAzqkKr3NYj/seIoC
         8hHGuSjk0DsmQIuJy1bA4y/04YS8b3ZWW5XOTjXSbZ1D5+rtBNWvHvrDoqjkaYrQ21py
         YEwu+UOL4jmHPMja8i6GccIL7AArrqLWvPSZ0wMFW7mpmfBWvzKzsceAxr2nfXL4HnE+
         4dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789809081; x=1790413881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsV9Fsd7Kx2vmgwJA0Z2vvtQ9MytD8CHEdEDo7dy1uA=;
        b=NfqJNMq8KJJoX8iaEbhndTlCFo6074Wj08+cSiuo8AGvxK7Cu3+1xuc5eugzg2gTQM
         EWrsPHuxeXx42SG/xkXYz0z+3BGV9unNoW14ABigyc1CtTYFGmt3N2lOmtZ1f28YAdix
         0Czhgo+ehdy8+ylTG0kQQ+wGcP3pRCKcEc1cl/KVfgtfHm1hKsqNv0Qe7M9tgco9BwtV
         TdY9iUTHWVKan64chIrRorYwUuD3bi9pgTFGYadaVuuLaz/G0IvzwGxvOcRISi+oU00v
         vijZaLS/7kivP9rx3kEOY4bs2EYLZlMewK8gOR3M6/gw3XqT8g1LlZhk3rmuVKpN3qi9
         oFjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFA8bhlrQcIlTb/hZ2yP0HvykTij3R0GKfP6inFT5TpLG+IErhUbJc6bAAdKob0gbxriR0oE19lzxcWgc=@vger.kernel.org
X-Gm-Message-State: AFuF++mZo1BhznT9IPv2hmjxRAS0utBIZ604Ln2G54FHbLA77m0Qc5sU
	vQg4NTOvpLyf6AgCt9qfo9+B5YGAbhZOB34yfbnJxtPq6h4WCgTpRO5qL+xZBdJG
X-Gm-Gg: AYBFou33fUIP+psJzW+2P1ES+19nqXs+8piuCI9bn0lFZkSsrGvr6rNUNtm0v5kGGxO
	0NicCToP5TTk4KAPmPD5Msa9/akke7jfbHosF/3X+Awa4spweAA8QH9myR3pq1GP6XwoI87ALGQ
	+oI4FoxQCEg31V8YIJw3RLaCQLsa7i/AGxam1sZLmBplMCYR71JDqfscd5z1T6ZP1pH5S0YzLsb
	3fL8hnCZ7/2ODhIPbPsAQZ6KhbNj5pIZL1lTHxYXgUBJ16QvbJnCKS3xgPUBxq+dU1J14HzPAm5
	WY6krc5c7SY9LJXpVZGmQCznQxebvafLl/JlHmEEyYWA10eaObB63VOmoOSYoQCt0MEajN15ICW
	a3IgFOsg4u6R9ppjz0Bfy1JTABxv7+kcy+HlbueJMdvH6f58eRFsSeP0iahmC4kIQXoGgvX5z/n
	JDtUz2MpnyXXfaExOcftW/lBjbN4PuXn1KV/mWxWyIrmpbt/OfRDsnCdMVEES1ywk4H6V+Uroyi
	iL1jRSx/kfTUtp0jE3GNY7nBQGCEVRrzYYQ074W6YcmPunvLV6oCjYHIfZ6nZkZAfnwKrKqPdDg
	+YWfdG8Bvg==
X-Received: by 2002:a17:90b:280a:b0:39e:2530:2102 with SMTP id 98e67ed59e1d1-39e54f4221amr17113972a91.11.1789809081235;
        Sat, 19 Sep 2026 02:11:21 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm3596214a91.11.2026.09.19.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:11:20 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH] Bluetooth: RFCOMM: fix NULL dereference of dlc->session in RFCOMM_CONNINFO
Date: Sat, 19 Sep 2026 09:11:20 +0000
Message-ID: <20260919091120.3273038-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RFCOMM_CONNINFO getsockopt handler accepts a socket that is not
connected as long as deferred setup is enabled:

	if (sk->sk_state != BT_CONNECTED &&
				!rfcomm_pi(sk)->dlc->defer_setup) {
		err = -ENOTCONN;
		break;
	}
	l2cap_sk = rfcomm_pi(sk)->dlc->session->sock->sk;

BT_DEFER_SETUP can be set on a listening socket, and it is stored in
rfcomm_pi(sk)->dlc->defer_setup while dlc->session is still NULL. A
local user can therefore create an RFCOMM socket, call listen(), set
BT_DEFER_SETUP, and then call getsockopt(SOL_RFCOMM, RFCOMM_CONNINFO)
to skip the -ENOTCONN path and dereference the NULL session:

 Oops: general protection fault, probably for non-canonical address
 0xdffffc0000000002
 KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
 CPU: 1 UID: 0 PID: 150 Comm: init Tainted: G B 7.3.0-rc3-g5dd1818b15d9 #1
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 RIP: 0010:rfcomm_sock_getsockopt+0x529/0x780
 Call Trace:
  <TASK>
  do_sock_getsockopt+0x3ad/0x7d0
  __sys_getsockopt+0x10e/0x1b0
  __x64_sys_getsockopt+0xc2/0x160
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

Deferred setup only leaves a socket usable here once it has reached
BT_CONNECT2, so restrict the exception to that state and check that a
session is actually present before following it.

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
No Fixes: tag: I could not pin the change that introduced this with
confidence, so I left it out rather than guess.

Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN under QEMU with
a virtual HCI device:

  s = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);
  bind(s, ...); listen(s, 1);
  setsockopt(s, SOL_BLUETOOTH, BT_DEFER_SETUP, &one, 4);
  getsockopt(s, SOL_RFCOMM, RFCOMM_CONNINFO, &ci, &len);   /* boom */

With this patch the getsockopt() returns -ENOTCONN instead.

 net/bluetooth/rfcomm/sock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/net/bluetooth/rfcomm/sock.c
+++ b/net/bluetooth/rfcomm/sock.c
@@ -786,8 +786,10 @@ static int rfcomm_sock_getsockopt_old(st
 		break;
 
 	case RFCOMM_CONNINFO:
-		if (sk->sk_state != BT_CONNECTED &&
-					!rfcomm_pi(sk)->dlc->defer_setup) {
+		if ((sk->sk_state != BT_CONNECTED &&
+		     !(sk->sk_state == BT_CONNECT2 &&
+		       rfcomm_pi(sk)->dlc->defer_setup)) ||
+		    !rfcomm_pi(sk)->dlc->session) {
 			err = -ENOTCONN;
 			break;
 		}
-- 
2.43.0
