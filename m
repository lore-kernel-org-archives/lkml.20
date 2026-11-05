Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844172;
	b=HZRZwdv6CfINDXIjLR5Qv+s9yy61iIee7mWUD50RPm7uTXXKNDPvx6g8nZR5CaHbgV2d
	 CNMW+Mk/F/O8zRh91aspDTJ1huhimZ2O4+ycB8HwNmMds+C8yw6SL8Mzt6JDHnhblfrzt
	 0R7FD5Zjpc4Zz0yqNRcynlgJmmXl5jL8UQgwb5xk56QnK7YCw+3pcL+v1Ddzo6by6Flol
	 RGhWrU7Klfc01ZHsN5vm521NeAGHDwkLUgPReriZXqOnQRtterPJo7zrUeJSXWkapHoID
	 5orMGhwcW5C/KwierduM4sXk6pD0Ijcgk0XtWCmaZz7IcXm4IBVq51cnlzOt0QZEHAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HpFmULoD3PKNQA7nQ1ArjNPpfG8VSqQMXNJlOpOCtTU=;
	b=eHnfFd8qiJ8iOHlgN5mHXmBIbm1EnIbBJcdq+kSoZ1fSk9i8+je6E0UxaRloBYoyxoiy
	 dUuYO3hV9eF3+7aXYVz0XEM0znKk+2SV8vT32+vrb/iOrH2iXgRkErK6J9O1Fg1P+R0DE
	 w4TWrOptgEtMszqrYX7HXsVesZV4HGKKjatbj1QxxLYLVUqAwIH9ekiCHC+VAkfDyLgqa
	 XAliyAwN5TWSFmumge3C0M5NNduVj5y0mpdGCb9hW0G3y+Pgbu3C8Z/B291lNJFwqOmlb
	 ZCzGIGItfZDM0ak5ilf/jgRw7ewmdDmUiLSO7UcLZSRKkwzh9tKujkDUxBMd39ojYTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LB5J9swY;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF7606D82B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21EF7606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LB5J9swY
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0afe09854so223522a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793844170; x=1794448970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpFmULoD3PKNQA7nQ1ArjNPpfG8VSqQMXNJlOpOCtTU=;
        b=LB5J9swYrhk+rpnpdAYM+m0KVsDTZ4C4Bx7BBtl7ax5j0XJo3KQPDhhX9bb/vANb28
         0lI6V+bsivTqCXJGHe+zZ6dhF6Gk2pj5Myax/kQCbQ60k/qk39nTK0zwl9vMccqEUTKE
         qBgeSix2/DhK4pR9v61LNGXde4KVGpC5HEkEjsAqPUNokSdH+Td6JupmHX5KaZ67VwvZ
         y4gu4MuZe5VFL6+Zr1zIFhvKUoYpdUX9CdjScI/p8xyXdVUkIiekxfQRIxxQtLmWPQ4d
         K9+6SsRG3ctncHS3Mnugm2i5sdt07SJ2zKS1ypflTGEaHhsWY04HetPYUFp1yU2ZiGIx
         0wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844170; x=1794448970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpFmULoD3PKNQA7nQ1ArjNPpfG8VSqQMXNJlOpOCtTU=;
        b=yts5nXI665YLodNi+xeIbRNlUvvpxQGEb3d5juCuUzfVI7FHVlLgl+8SzZFAC8pNE2
         M0nRxOw9gNqzmF4JSScsKsL9Oa1tafm4Junq+pSDAGRgQ/BOJiD0vNQfU3FMxCQFPHfc
         g0GhpdU6yJhqUWNrMF+6UlGcU+8qE5MeNMs70nKO79tOlTakqbVmtuEzvD+6/XCBQ0HR
         AIvgXAYEQ4vSC4nbrqETtfBBgfysckNHemta+asRsr7Gna2pCrr7SNqPFgfOwNAFduzA
         oBSXr6+qKUXPOmgZze2slLlSWXLfM4ODICDO/ySCQuGHSFlNvoj/jUNJEyHemX3CVl28
         05tg==
X-Forwarded-Encrypted: i=1; AKwUvByHZPfOeWuQbLbI2pACtuY4aaljoeXSb/B5Y1g+VoWXBPIQ6fnsmuW4xxz2qKB4SK9bIEzRyE+I2n/efZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qyV/pVB86jVKtutoNjZgxULILXH9xnIG87PkCC9BzD01pXL2o
	b9wHi67r1Lo+9Rwx919fM3ChBHDmfi60AgGudDn57RF/bauhg/8GgYTO39WhO9k40JXAYml/NmB
	LCYBOA03s8WbcDeGFejPJp71Hv4zmkO66SBPl
X-Gm-Gg: AYBFou0esCwUR8OEtjP8CCTLnc37naOV3DLkH01TozcySCXbtK+l17tbLfhX6LxleR8
	K38Xyq001n/QkVln0u0/fkSK8IGv4JiavXYMiRTXkV2Ed/9AMu76Gnbs5qX81AAE5Qlyx4bZwUg
	JwMpw2c08cqNtmIFhdIqOR+7CPW0cW1SyJ9BOmFPuFJ6h6/KIMD+XBC5sQyVrT9VVzhOu+NRrRI
	E7JDpZFCSMI1R/TJpD8+18PMFLPxrmAQRSXzx7eR+86N8H17vT5WiOFQQmAWnf55A1QeBqUnjN7
	L5dFWVQ/hL8JRs6Irlja0pTKbNjKBuufE0e6YpP5yDJ53n649y1zbELISLlwIQOA5/rkguzRFOJ
	0QrdSzVDnZj2Gimc8nyNneMJ+5ziKt+ol7hrJTw==
X-Received: by 2002:a17:90b:4d05:b0:3ad:c482:ae93 with SMTP id 98e67ed59e1d1-3ae897f55f1mr15463825a91.27.1793844170366;
        Wed, 04 Nov 2026 18:02:50 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0b93e8cf1sm370875a91.8.2026.11.04.18.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:02:50 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id A268D340292;
	Wed,  4 Nov 2026 18:02:49 -0800 (PST)
From: tmenninger@purestorage.com
To: anna@kernel.org,
	trondmy@kernel.org
Cc: cel@kernel.org,
	ebadger@everpuredata.com,
	jcurley@everpuredata.com,
	jlayton@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	slingappa@everpuredata.com,
	Tim Menninger <tmenninger@everpuredata.com>
Subject: [PATCH v2 2/2] NFSv4/flexfiles: limit transport disconnects when cancelling I/O
Date: Thu,  5 Nov 2026 02:02:49 +0000
Message-ID: <20261105020249.2607367-3-tmenninger@purestorage.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105020249.2607367-1-tmenninger@purestorage.com>
References: <20261105020249.2607367-1-tmenninger@purestorage.com>
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

From: Tim Menninger <tmenninger@everpuredata.com>

ff_layout_cancel_io() cancels RPC tasks associated with a recalled or
revoked layout segment. If any matching tasks are found, it then calls
rpc_clnt_disconnect().

rpc_clnt_disconnect() disconnects every transport attached to the RPC
client. A data server client can have multiple transports, while the
cancelled requests may have used only a subset of them. Cancelling I/O
for one layout segment can therefore disrupt unrelated I/O using other
transports belonging to the same data server client.

This is particularly disruptive with RPC/RDMA during data server
recovery, where unnecessary transport disconnects can result in repeated
reconnect activity on otherwise unaffected connections.

Use rpc_cancel_tasks_and_disconnect() instead. Matching tasks are still
cancelled, but only matching requests belonging to that client that
remain on the transport transmit or receive queues are marked for
disconnect. When such a request is released, SUNRPC conditionally
disconnects the connection generation on which that request was sent.

This preserves cancellation and draining of I/O associated with the
layout segment without disconnecting unrelated transports attached to
the same RPC client.

Fixes: b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the layout is recalled or revoked")
Signed-off-by: Tim Menninger <tmenninger@everpuredata.com>
---
 fs/nfs/flexfilelayout/flexfilelayout.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/flexfilelayout/flexfilelayout.c b/fs/nfs/flexfilelayout/flexfilelayout.c
index 9492d6bc1d1a7..700f0e4606e8f 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.c
+++ b/fs/nfs/flexfilelayout/flexfilelayout.c
@@ -2599,10 +2599,9 @@ static void ff_layout_cancel_io(struct pnfs_layout_segment *lseg,
 			clnt = ds_clp->cl_rpcclient;
 			if (!clnt)
 				goto next;
-			if (!rpc_cancel_tasks(clnt, -ECANCELED,
-					      ff_layout_match_io, lseg))
-				goto next;
-			rpc_clnt_disconnect(clnt);
+			rpc_cancel_tasks_and_disconnect(clnt, -ECANCELED,
+							ff_layout_match_io,
+							lseg);
 next:
 			nfs4_ff_layout_put_deviceid(mirror_ds);
 		}
-- 
2.53.0

