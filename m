Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD344B1D04
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731822; cv=none; b=LmO2R6FilKOEAp4JWZW8YPvqkrlinOlmeOkYZnmCY6wkxwC+/p6vuLxmqAAtYra0e5LBSwAyV4xv5xLoSVW/PRzyBdUyjLntCzoHUvEd7nMSUSKpUqMUM/EQ8hAfx9FqpeUjiqqdl1NeV2ybQWhRr0YH/5c6rJVI6FNdRHWg0lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731822; c=relaxed/simple;
	bh=SRUumQAnpSXniW/sFyv72eCyMKi1jXmk9Oim8IA3bpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZZBcWHPBMjpVzQ8naz3BG5VzW4tniVdre68InUUk6sUQ+Tfa+ubObg+tMVwdO6Suoa73+v0YhJNHfz0XFj0lwaSHBOzLLrnDd7y4Pu8gVqfAosGuAlnwelcAYWbD+zUz3QILUbPWk5VIDnw5dv4gLhd39lUS0dGsUdOqJNuzkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVpiQgRt; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVpiQgRt"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddb44ad1c1so5379705ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731820; x=1790336620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mchxmlE1Z6JjIT7JJbaPsbpmSkFR757IQABr8XiljQ=;
        b=SVpiQgRtq68ATnKe2vHL3UWY+Vb3iZLDqAQdZ+3vE5dSguAlGbK7L7kwIt0XzdFTfv
         5k9jMu600AHPaAt3r8ch4mrvsvl1Lzlo4pdnHw51pTpH17X5AfSOVJfUZsQ8AJMS/Dmn
         4M7MsfDrFZ8J2s4mYk/X/9Y2fOQVGOrQNs0i7VVTeqpwn4k3HOzdof8iQYUptWjV1RQZ
         52V+wvzHhDdonyA3zQtXoUoVq5Jh5JPIK9BXU11jXjnx/x6AAegMkQuYwDuE0sXrhvWp
         n8k9Lp/by+wWOgGkW5S0RgLBQdypBrviumcm280xK7FjUfNEHwBawRf8wX+ClXNXYkpB
         eOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731820; x=1790336620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mchxmlE1Z6JjIT7JJbaPsbpmSkFR757IQABr8XiljQ=;
        b=cHGnzUeKtBb2r4OH0wgUP8YPdJ6dp0Vdvm1xp6yrZwyknhHGomFyLHgW61q0LTeuJA
         ENZYIhVbGT+HObAPXdaCe6gnsDDeg0y/gJXpKNmVF+thLyNjuAZlNihFq9FLKZZJr/qx
         TWXmLMT9Y5EAhODIvUI+eE7Q4BiTFaLVQ2PnfNeLVsT0IhEFudCCSbMp762wJsFf9v8O
         YgW/F7GE5FFoAvfVXQzCwN5/g6OJPWobFX11Be3m2peO+hwL5btDGDeuDH3JBuP73JUF
         P8YDVO1rYksSuFzxI3T7FxD+PRYJy9qsH0YtOmDsKjdQlvgrp9fHk9qESRZXRk1fsBN6
         N6Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxqpLxRe0I6dTybuSkmLDyL9i+DikrIr3ZXBm8p1pvPuJ4StS+773yZ+NyfVcvQ5t/Vs1ICjzg3Vm4KKEM=@vger.kernel.org
X-Gm-Message-State: AFuF++keeWh0ZHBkRJFr8hPoTolrSK12rmOxIMvcSnCvk4QCYpVdoQXG
	Z5sgqEuqoU1RXDmysrPJkuQ1sOOZ1Bw3/BNvmSdR7VIMHf9Y+Qq7o2di
X-Gm-Gg: AYBFou1D5zyfLw52BDtWUEzGrVga9XvZ6K+PzImPsqvRSWyBi+yvFE2R1yU9QLOUkzv
	FjwxfLphc5AjF9inuYU6+qGqcGHzEd2PAYdF/L+UU3b0taLwbvbAC8cjOKKqjhTCXetbu7VuoPX
	MJgIU1v6wVhX4oguWfE/pTngiLRxoRhOcqBOr3eP+gcCpv0hJwXxQ2JoFPR/9QYhE+UEtq5LmCa
	TCtxUSYm/kSEEffZyGE3RSHNQhXb1ErlGNW0VTPLM73TXz1/9rhxzObMqy9yhZ3s4WBwHuHblSh
	MO1VkukuNYDISlMThTFMJeDtbb8mSN1+zk18YmkT1DTOWbSTSUPIJvgVlQRJCk4JHnyTvVkGcvK
	dNzhJx1oYOp2kqZXhlIT4xSJd4masMaPtjanYHNJIIC0lJt11y6l4j4/PB3P3RzVt2r80GBtkK9
	068Vqyo2/vmrpVMjGkOqkdB5gmRImpjYQSuzWbzZIggC2MIjE1csPmOarNmzZWWBmL7RhiFbP4A
	QCrD7vwR6g=
X-Received: by 2002:a17:903:3246:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2ddb1af3398mr44813025ad.14.1789731819907;
        Fri, 18 Sep 2026 04:43:39 -0700 (PDT)
Received: from 73ebd4c7787b ([183.194.144.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c284ac724sm4794739eec.2.2026.09.18.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:43:39 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] net: netdev-genl: add missing uns-admin-perm flag to BIND_TX
Date: Fri, 18 Sep 2026 19:43:28 +0800
Message-ID: <20260918114329.3659849-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakub, Donald, and netdev maintainers,

During static inspection of the netdev generic netlink family and devmem
TCP operations, we noticed an inconsistency in permission checks between
the BIND_RX and BIND_TX operations.

Problem:

The NETDEV_CMD_BIND_RX command requires CAP_NET_ADMIN within the caller's
network namespace (uns-admin-perm in netdev.yaml, mapping to
GENL_UNS_ADMIN_PERM in netdev-genl-gen.c). This ensures that only
privileged processes in the netns can bind DMA-BUFs to network receive
queues.

In contrast, NETDEV_CMD_BIND_TX was specified without any permission
flags in Documentation/netlink/specs/netdev.yaml. Consequently, the
generated C code in net/core/netdev-genl-gen.c only sets GENL_CMD_CAP_DO,
and netdev_nl_bind_tx_doit() performs no capability checks.

This allows any unprivileged local process to issue NETDEV_CMD_BIND_TX
requests to attach arbitrary DMA-BUFs as netmem TX buffers on any device
with netmem TX support, bypassing network namespace access controls.

Note that upstream deliberately relaxed bind-rx to uns-admin-perm for
non-init user namespaces in commit e302aa3d ("net: devmem: allow
bind-rx from non-init user namespaces"), while bind-tx was added in
commit 8802087d20c0 ("net: devmem: TCP tx netlink api") without any
permission flag.  This looks like an oversight in the TX API.

Fix:

Add flags: [uns-admin-perm] to the bind-tx definition in netdev.yaml,
and update netdev-genl-gen.c with GENL_UNS_ADMIN_PERM | GENL_CMD_CAP_DO,
aligning BIND_TX with the permission model of BIND_RX.

Best regards,
Yuchao Zhang

Yuchao Zhang (1):
  net: netdev-genl: add missing uns-admin-perm flag to BIND_TX operation

 Documentation/netlink/specs/netdev.yaml | 1 +
 net/core/netdev-genl-gen.c              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.53.0

