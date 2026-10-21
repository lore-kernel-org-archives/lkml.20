Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547760;
	b=xwb2N0W33BR6lPLvw6ulG2XJsnmoPINTm9YagnuZ7ke3XzSnUQ+4iKYS6LMmI9Hxj4nk
	 4dbvOcalQjhLbGjgDLRDRnBQYUm/sHf+on2Vms+Xo8Mm0oY9ED0BD8nsZgsR4Zlg1yxdj
	 FP/1EHNaQmbA2wLeD1tQHWdtbI0G4Sc7+tn47Hz0rAw+Tzk0vrVBMtVwgtA2C0E8MZmpx
	 o9Wfg1O83AfnmFZKBH3xhhFFEvvHh0Wgr0RF545DmUeTD6FIRo3xf9k8DohmJiFZ3wOXn
	 q41d7jJR/DRPIsUW92Mj+Kjt8ebCz+KPVsp9AksHUQpMqu7xtUCGTWnXOSoHbe83CoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Y4b/p07AdLceqUapVIYWgI0P/ZEXX9X6CrBOWJ0OIWo=;
	b=z2y2ZWnouEx4tro6YgHlqdNDZG47g6i/L36oPNpVya3MxGbqQEgoYpMmGUofaU5Zv7sY
	 GxdpOH9/CgUVazL9bE2YEnblzKmXyn5tKeoGnkICIGlVqxeMclJzoDLP1/o52iMO8w142
	 GmMOPntZ0Z2MZP9Rx1WOXVr546prGnJuU9zeryVemj+5utVml4TcHjxzpBA7PI+jRfDaa
	 dsVJaVd755N8lxjL8AWjwEMWvKQawhFfRlL94BVRSgogNt5vffYXsXnqzJse0Ykq1r1Zz
	 Bw91OL26sLFVGeDYflrPRVDI3WXAwIK211Hp3+T65gG1jAPDN3VGxusJxLoh3et7Cyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bzzdT6r0;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A62606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A62606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bzzdT6r0
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so239271c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792547760; x=1793152560; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4b/p07AdLceqUapVIYWgI0P/ZEXX9X6CrBOWJ0OIWo=;
        b=bzzdT6r0nA0mv9yT8Nyb331vATzCkzysQ651946LfUk46Ue5s6ultyJ9Ns77Q9ZZZb
         6Ckt/lsLdppiO55Fkk04q+LYNdn3zFKXiuYfjm7kLyIpDqkb45dEo6s4gKNcA434UoM1
         et7RKrTsxSmfm7H3I9pXuLknMX0YtmvAkk9YqOuFh2JzgB6sKCgduTNRdyrj2EMdnl3s
         rzgoGfPbCqRdha3SdGpkcvGArUsU5sADQuJsd4Gx1Dmcg+94ESbuT2p8K9q97MN6T+jC
         xTLgCPUPhd0gRLqXOKdtKmACq7laNoMYhm10z0SLZm++vAhFqgBcBGLkJjW70y0JEJ9n
         dzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547760; x=1793152560;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4b/p07AdLceqUapVIYWgI0P/ZEXX9X6CrBOWJ0OIWo=;
        b=GR2hbqeB81YEciDniw3V6BZx8xUuXb6JILUUqNVbuOb1Jmq2ngaH0z4O2vfvvExrhZ
         gvhm7U74H51vCH27Vn2LeK1WP8bF4/7eao/xu8GTYfurNW+F/MTEmFbfEZIXbl+guBW2
         5PCEemNjEoWoZwX23X55dTtYwGTTIvlP0y9wU7nlbvIOjzc9TxVaOKoJFoNHqCoPzj6u
         jLqfgmyjFEJSqsOsAUPIsdTEtuZzL49iK4eBgdseDzcM4i4YN96k2/KXgk0wQGu90otG
         BTxBCrWnTreto75+NdxaG+4BmGYxVsi64f9awhD64HCQ0kWmoOtOSpcDIN1GNXj0A+Yr
         AcKw==
X-Forwarded-Encrypted: i=1; AKwUvBw4j9j3dCGDLqy8sMpD/fg48rSu7cunFY0pY6ycKvbH9sVhWUbS7GuRWPvGmudtr9DadOGcwtgB1b4TsTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1ihyhL6jA+K23BOXHfLUXQaOQZoEkJRicO3hdfxR/viqQl/19
	3TdEhfW8zNmrA1VK4e+dErDp7aQWmmTiGpiDTBhy6YCShS94jUzZx9YeqXHucqGVggUhytGDnAN
	Brjo5/2vX8rfpbGfKGLtTceliYw==
X-Received: from dlai24.prod.google.com ([2002:a05:701b:2718:b0:17f:8a38:d873])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4092:b0:18a:3911:ec1 with SMTP id a92af1059eb24-190a7ff8258mr658995c88.39.1792547759131;
 Tue, 20 Oct 2026 18:55:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 01:55:56 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021015558.4124825-1-almasrymina@google.com>
Subject: [PATCH net-next v1 0/2] netmem: rename non-pp ref helpers to *_inc/dec_ref()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Ralf Lici <ralf@mandelbit.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Pavel Begunkov <asml.silence@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

Rename the net_iov and netmem non-page_pool reference helpers from
get/put_net_iov(), net_devmem_get/put_net_iov(), and get/put_netmem() to
net_iov_inc/dec_ref(), net_devmem_net_iov_inc/dec_ref(), and
netmem_inc/dec_ref() to follow the object_action() naming convention.

Use *_inc_ref() and *_dec_ref() rather than netmem_ref() because
netmem_ref is already the typedef for the generic network memory handle.

Mina Almasry (2):
  netmem: rename get/put_net_iov() to net_iov_inc/dec_ref()
  netmem: rename get/put_netmem() to netmem_inc/dec_ref()

 drivers/net/veth.c            |  2 +-
 include/linux/skbuff_ref.h    |  8 ++++----
 include/net/netmem.h          | 24 ++++++++++++------------
 net/core/datagram.c           |  2 +-
 net/core/devmem.c             |  4 ++--
 net/core/devmem.h             | 10 +++++-----
 net/core/net_test.c           | 24 ++++++++++++------------
 net/core/skbuff.c             | 20 ++++++++++----------
 net/tls/tls_device.c          |  2 +-
 net/tls/tls_device_fallback.c |  2 +-
 10 files changed, 49 insertions(+), 49 deletions(-)


base-commit: 3c9d71edf50ad153e892ef887e54496286774544
-- 
2.56.0.212.g129ede20d9-goog

