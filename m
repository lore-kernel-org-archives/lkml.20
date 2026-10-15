Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86E282F15
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079032; cv=none; b=jUhFuAw/AjbvL3yH28KYKgS6KPjiJ3WPsKXu8wckzWJGvmLERTgmdmWu9fElbStiknDSdeGw0NeJBh+cfzxbKY7opF6GWU0v5McMS3mfGccKLrUBhqqPixwl/B4jHrhGS9Eb5OKzgUcGMn5ge9g4IXfkvM2Y8lc8ua/q5gfgxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079032; c=relaxed/simple;
	bh=G6IWS1Zxi1tU+lwJpiMqXpVXB0OLHXCMig/G7veIfHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETbVeO+XqN5KJkLsF7jaLbcZaLsNWXypbd/wnLQZkPXxPeK7hIZwqGPqS9eCuvTVDged+4HoDKMP6Aj63Nx1A1hdXE/hbEgv1APS9+23tPn+f6uvSDso3xqd/9setB+QGyr2jTBNSB/Te7XK6IN3bSdZAbau9U3S96XjylWO8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw2tzLCS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dw2tzLCS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so46410795e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792079019; x=1792683819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqgpHM/R08a+17QdyNzhk9UD0dnMaaklUgdhuosg/ak=;
        b=dw2tzLCSwauATYHaAFqvl8JCUygKGjre18m4SwVFozmqCi+G/8NVxPnzs1holXT+oM
         iK0zFS2uqpFNx414AfItDKQl4ZT3dHTqIoihu4PF7jJ0DahrUoDswiIbZKglTJdipH5v
         2OC3+LUEZQWsXmM3W7NIeAE46S9gqceRddKE1Mgh8Nhk9aMySMFLxh/nPp7vxMYM/zkt
         IxoMxMypnSNK6xA0gE1mQ3nSnbxg1/zE1EKLclzVWJ4CxzghTUMvcalx/SSd6bq1tCdL
         zK5+oftiEdycGbaFtvBRhtGPCvOMI33P5yQoeVHTnodVSLKgwpX1/r7NX2Xvo3/sVPfj
         mKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079019; x=1792683819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqgpHM/R08a+17QdyNzhk9UD0dnMaaklUgdhuosg/ak=;
        b=z6rwWra+wDzQnYXo23WcqgfKn9/pebvhKVRHK4Br1EUbZa38xtBWVqfEpKlIrW9H8u
         93Sn0cCgH6JZqGONo+LqhA/HbAg4C/2L2C/b/9V3/Sw0EtOaBTEO/haH7YaPCGBd6a9h
         HtG6E+Xr26qaFDLZqZQKS6fs6qE3Ga1By9zdh03PNS9jM30qg5ipTiMJse0zrxmo4oHn
         PaPcbMXkYc74NGFVCGNwzW/qw1eE2NYBLebJFRtHz+M0PERb/tSa3+aQeON2xJGc5dNU
         uChXCx5RjQMNntBDOxsXSZFCPUcpfzLtIeBmR4yLbVor5j1OKOTqEhSAhOuO01Mb7+vU
         Gw4A==
X-Forwarded-Encrypted: i=1; AKwUvBwNEJBaCAZ8/ayKcr4VOSimPQ6cF5bnCtQuhI6bPypCl5bE4aKZxluebOeZb4v60tUi915zJjRjli73zFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRs0YJNWmzy6L9ZwEyftjNUg90g9lmBweokvtX5sany7KTdVH5
	FbQS1kInJIiFjJlAJDwkF4lMk3JpvvQku2J0HBZW3umsTdMQXl9gRS/2
X-Gm-Gg: AYBFou1EGuqlwjCeJRXOrtkJZA7Fg9DQ4PwZ8D4Kra6gPyZViUPehcVcXkWcmOTM95j
	x5rWl7xbChRhiK39h8IBYuCZtL0RAarBEl620uI49DT+p3aIEHDhiR+fboViGJaAZ3H5lagJVr7
	XRXakbL/e4RUUDWTqj4796aVCQTjuRAIcy94kj0dXAQEQHL4Iaj6TBIKkdq9GOLEdwt61mSPCVG
	J9CPSybJUNnlXbCL8iu9HOF3SOIxWkmg16YLe5QMJ4y1ar6LqUISHx+mnQOhwpvc/sj8u+GU5Ng
	hiKvOJapCnYvgNAHXwzh1S4DhegeX5gZIm2Muf5pS7KXRqhYwIEwdh5Lr+l0sxrokvZM4k+kG+u
	0n6k8MgSMZ/CD6af3fCKwHYHBSVIxTnLDj2I4Pj0FuLInqzxgtTgA+Y88C38CyhcR6uVll6AEy6
	P5J2XSHalCaUnXMx+GIRQA4PxCinfF7Hn9oW2MEsgcb1b74a0P5ZDbWnyeRIPdCVDCbTgzmqbt2
	JrZGIhPKbys1YQFLM7yMP2ol/J1c2XHg2qa71wUmEcx3PJuwa5OEgbu6Pc=
X-Received: by 2002:a05:600c:8a09:20b0:4a1:9687:bbd4 with SMTP id 5b1f17b1804b1-4a19687bdcamr244753945e9.31.1792079018628;
        Thu, 15 Oct 2026 08:43:38 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm61940825e9.1.2026.10.15.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:43:38 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/2] vsock: SO_INQ for stream sockets
Date: Thu, 15 Oct 2026 16:43:32 +0100
Message-ID: <20261015154334.3217358-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the follow-up announced in the receive queue hint series [1]:
SO_INQ and SCM_INQ for AF_VSOCK stream sockets, as AF_UNIX has.

The value is the one SIOCINQ returns, so on Hyper-V it covers the
current packet only. Accepted sockets inherit the flag from the
listener, and the sockmap receive path does not report it.

Tested over loopback with vsock_test and vsock_uring_test.

v2:
 - move the SOL_SOCKET options to vsock_sol_socket_setsockopt(),
   with vsock_custom_sockopt() and a switch on optname (Stefano)
 - accepted sockets inherit SO_INQ from the listener, as TCP_INQ
   does (Stefano)
 - use || instead of | in recvmsg (Stefano)
 - test: check MSG_CTRUNC and the SCM_INQ cmsg length (Stefano)
 - test: cover inheritance by accepted sockets

v1: https://lore.kernel.org/netdev/20261012235524.41468-1-devnexen@gmail.com/

[1] https://lore.kernel.org/netdev/20260923184008.153541-1-devnexen@gmail.com/

David Carlier (2):
  vsock: support SO_INQ on stream sockets
  vsock/test: cover SO_INQ

 include/net/af_vsock.h           |   1 +
 net/vmw_vsock/af_vsock.c         | 111 ++++++++----
 tools/testing/vsock/vsock_test.c | 279 +++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+), 28 deletions(-)


base-commit: a4057f51efc2b74ddf46721e83f45e9efb13649d
-- 
2.55.0

