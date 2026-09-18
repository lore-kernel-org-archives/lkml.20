Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0EA35E1BA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702770; cv=none; b=fvqGqohHp58tgiXGsCmEV52ANqNSp6GVe1rdB9Gmu8AGIviYCppFQkQTCQE6WRd5/xHXfY7d620NL0TjVdDsAw8lLa7yJxYWA1luQSAgHsYt3Xg/zerkx5ulcG/jxB6844pBxK/wGt5VDtkgYCgJ0m1EdOMVoGi9sNj8A8T5puM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702770; c=relaxed/simple;
	bh=fZjGGfzjD+e67lahGDJ1EAc/Am9Wz2vBr6GU6aH3PVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j57P1FOp7jYFS6ppclkwdRKQI7ihU9WkQha+957MgIors1IiG7rTzHQxyEyhQJC+eKLg9c0QIPOp32/yYFauSqanQvu8rdxdxAnstn/7cqfh84NG7vf6HsiZT5NPKtzLXckfDBoMgMhOfh6VlxdQQetc+s8MEZrQ9ZmLj1aWcEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLPXJ9lo; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLPXJ9lo"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2cso178198a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702768; x=1790307568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v9YKjnadMhV6kY6CH7XzaeiUdpmUgyn3iCQMQXyXjxw=;
        b=OLPXJ9lo155kQ/iERLnYjfYU+N1dnCxY2UY93eWZchmCeQlOk4f98ztnU3KtvV1rZl
         mlrBdderjiNe905JIxHnn0GClAPQ88KhrZiaixiGft8hvl9e2FKS2DKV04aOeqQVBc1f
         2FeGhtod2wIOKh/TWfXfAwnhGgyHc6xX41PV1FnbL2KQLguAFXyTls3ld0sP6PGqV1by
         MUPMNz1z6ygGiRZZ3VqIMVt11Rho6lnLzvoBlh5zZB97eEahMqvBh7FPSMbJmjxnZbJI
         PA7sxMbc1a/qT1VzLBs1H+kLdDMMxNDg6TV99OILI7ZME+NYNxp4xM8B+3lFDScM9lSc
         HqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702769; x=1790307569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9YKjnadMhV6kY6CH7XzaeiUdpmUgyn3iCQMQXyXjxw=;
        b=hc8cUM333dvI2CyyRGeOQvTx4XySSOREe8cVWmO+aDLcBxKMeJLtyT1rM5TQKFCxzi
         jJ9BXve2jAVLZi8fTI30dh5Fb0IBZmsoBadySytk7Rfx3Nl6NvVgXEl2uKNwUnbZG+YX
         lql1gUfHeNiV3snzliCWfJArV7Un4vix+ylNDOjY2d2o7sVg/dx9ktG/pmL9Y5jzS0Xa
         ilqX6WLBKheOhJ1oFNesifZ77cyh8q1rpJ+A7B2dN8C8CL4B6pIGSatsKRgX2Y7W6JbU
         ezvAGdmj2NlLKIYk6ftGevFccSOBSq3EmWp8FTMoowqaRhqNIENSVGyU/BrsIlQIMcCK
         LHig==
X-Forwarded-Encrypted: i=1; AKwUvBy99oc9OKE+ey2PBJMiT/qPYD7R1FXSTxY93hscLjKvk7ADF8udBn6D9J1kZ2tyNQMqZceJBaW83JC3F80=@vger.kernel.org
X-Gm-Message-State: AFuF++nn0XCY3UyrPsmLkbJGStWduF8dwy0vGr38GiVkulFxUhkw5UBL
	5H5kVVSt5mGpbzf60FTDMy5RHbkAkMRm31BlbYrwBqvNMCoMoxtS7DVD
X-Gm-Gg: AYBFou3QcmuMNj122aDswZoh+9sIbFqDbiSNOMLmMo+UJaHUMAYAAAN3TmfXf1CLjlC
	Rd6urF/M3KcDCLIPERWW6PbfBRHyCedYN8q7PYGt4YnMP6M8DFl0IqNp3DO4ps8K9fQmY7q78vj
	TXwOwvg8iR7llllFN92MznblHDixCFKNWWUjI5STZYz2oVXGlgS+KyzR/kffua0d87c817vabRn
	1ksHAA0s2xtwRs/GlihrOLUoiDlaA/ssr+lj54karZRAtZPN1Vo5IYcfqTqTcVgZPuYsY4KQakq
	fLaOcz8Hs3+b4NJplRmZyLpq/Vgm1gPXAsB0rRij9dhuZ/afGnKIcSv5hVENgtx9sJfZOf75zbV
	OJMb+TsywjewUt1aP+Lybv8lJtmaouQbyRRv5zzV8yWxpUDRRYOC4YYQx3oEPJ1lNKY1MUZ0/VT
	uLTGfTTSjMmxcKdZNnAKYNJASfEsBYt8elOSJ2D6pESz1sKqcZuSmgzN4TGHwHuF123W7HflT83
	7HLicxf+mnW1HyhiuRCorymybWwBrjsd7OW7gDKx97ezGlXnQ==
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr2488298637.1.1789702768516;
        Thu, 17 Sep 2026 20:39:28 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfe957asm1039280c88.7.2026.09.17.20.39.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:39:27 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] nfc: llcp: reject connect() on sockets not in LLCP_CLOSED state
Date: Fri, 18 Sep 2026 11:39:19 +0800
Message-ID: <20260918033920.85025-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses a socket state validation gap in NFC LLCP socket
connection logic where connect() can be invoked on sockets in the
LLCP_BOUND (or LLCP_LISTEN) state.

Historical background and context:
Earlier patches addressing CVE-2020-25670 / CVE-2020-25673 added an
explicit check for the LLCP_CONNECTING state in llcp_sock_connect() to
prevent duplicate in-flight connection requests on non-blocking sockets
from linking the socket multiple times into local->connecting_sockets.

However, that check implicitly assumed that any socket that was neither
LLCP_CONNECTED nor LLCP_CONNECTING was in LLCP_CLOSED. It omitted the
possibility that a socket had already been bound via llcp_sock_bind(),
which transitions the socket to LLCP_BOUND and adds it to local->sockets.

Vulnerability impact:
When connect() is called on an already bound socket:
1. llcp_sock_connect() overwrites llcp_sock->dev and llcp_sock->local
   without dropping the original references, causing refcount and memory
   leaks (service_name).
2. The socket is added to local->connecting_sockets while still remaining
   linked in local->sockets.
3. Upon receiving connection confirmation (CC), nfc_llcp_recv_cc() unlinks
   the socket from connecting_sockets and links it into local->sockets.
   Because the head of local->sockets still pointed to the socket itself,
   hlist_add_head() links the node to itself (node->next = node), forming
   an infinite loop. Subsequent traversals of local->sockets (e.g. during
   lookup or release) loop indefinitely under spinlock, leading to kernel
   soft-lockups and RCU stalls.
4. If connect() targets a different device index, the socket becomes linked
   across two different NFC devices, causing cross-device socket confusion.

Fix:
Enforce that sockets must be in LLCP_CLOSED before initiating a connection,
returning -EBADFD otherwise, aligning with the state check behavior in
llcp_sock_bind() and llcp_raw_sock_bind().

Tested and confirmed style-compliant with checkpatch.pl
(0 errors, 0 warnings).

Yuchao Zhang (1):
  nfc: llcp: reject connect() on sockets not in LLCP_CLOSED state

 net/nfc/llcp_sock.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.53.0

