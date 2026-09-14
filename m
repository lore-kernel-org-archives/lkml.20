Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD147ACC5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394967; cv=none; b=GuYkGb6Hgx797ZOetyhLa7x1FeZ9V40vK6JBMFTYwGD2IUIZpDhrF17Fqe3zZM9vNvx6u3cZsZ1hFiukr4QK7zobdtUDq7Wu9aYT4nE7tVofUJ+XW+ZtwKeoJAhJkbjq1/3S2XPU1KWCMTta0CStyn+D4uYscvfBBq7TfwQD26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394967; c=relaxed/simple;
	bh=Sx9v7HQiEuMQMZvcpJR8rOdiRwK04scS8R7dUc9Mdd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUDN1y6Q3xzEwkOyxoKWPkmPDrJhSJUq0VmijDaAWZE4kO9B7nY0FcsBdLufaOGxHz/vtiBqWIXiPAca9lWZVXTNORONzdvPwH5mF+ZwNR3VfJhUMVLy5RCiUzbiBftmPn2Ndn0Xk7IlCd/OKxNml6z83gvxb15J8dXpaE++WVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUG4NIdx; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUG4NIdx"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a1f75375d8so633871fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394960; x=1789999760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pp0hFi9J6OyCUNkr2fkBiI3LoUNXdAPY0thZeRETuic=;
        b=OUG4NIdxrWOv4nsxlrEkH/NERMzSyv8+xM3bqd5C7mplN6LnJtJWoztDjVeuFCs3O1
         m0rpUneCPhLnuUNItZBXY/+de2TCoH9MmJpLsj1YhnMt5Ew6Cd3/txbY//ewnAU5zwzy
         3MLS4Ot3YdnN0GuTfEJi8JIhPdULkN/PfSgYLg6znIdWMf+2Z6P/aLR2OuB5MmSsdSdj
         7HP9sKb2xD4MIDABVRVuuFb3jFSO8CKYUizQjcnJKT92L/pUGLcTHb69POFz/SFb06dA
         /Vgf07pSSlGHWRbmRgx2MSD1DVXsQ49ykfl/G2Nw1wof9gf/nA2jL/l1a2R5SlwRsWup
         m81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394960; x=1789999760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pp0hFi9J6OyCUNkr2fkBiI3LoUNXdAPY0thZeRETuic=;
        b=sbXUzUaxH+bdBYibZ0m5a+CcqkLUI7sMUYDtroVkH57npgN9TizjFLuOYW4ZeG5c6w
         fR4AzvaNp49WYRtxubn12ex/SH3HInI+LLQfIzG5luWdvTYc56VjB3mIDmYFxPbrdr4T
         OHHqb2xGpqXbqXwtfjQHOkv9O7J2nxsCTOR54GqfCq93/tkvQe4FBwv/dRLI+7ybaRmT
         B70H0ICMSBzmSylnf9hA0x59Nk66fKiihqKsrvWVo24yXkM63ToigozShMqhJ2QKuUVf
         x6KKffqi47V/0EBBuCLc5ZM/2wpRDKQOCiIZeasZ2TstEnqhL1tu28nJzp6wZoTcOX9u
         Cl5Q==
X-Forwarded-Encrypted: i=1; AKwUvByORxOU93XokWAbrYclAB3qkRE2jK6KvMn4L+/TUgXJ5JnB/3pBfcdlhNo1sfyR2fVSh7HnthRNUB2AYns=@vger.kernel.org
X-Gm-Message-State: AFuF++lVoWNH6gLLFm5RGkqIq7cuxV2c9sohfPbdt81KZAZ8rkbb6EzG
	QHRjFX7Q8DLHMwypKO187T3DRVU+fKlxkuA31G8sCe4LFxDnAj7fmQjV
X-Gm-Gg: AYBFou1MNwk1mlMjv9ZZhy1jqXSZOre1jdt+AXTs1hfzLJszvblbgUsHU0b+kPhpVsC
	VCNPYMGL3xgcV1lYVldtLd7XFE3nJpGXDujTQ0QmeYmDUwqORYXxlcZAtBwKWfCZz+dL5m0vDjS
	iCCUkfI/Dz13DfKlnDIrvwe/Jdg1Qindxxg42CVnYOyn4qZzO0XIa8ukiPVcVGvnIA54bBKVcTs
	a7QQx6cbaAlA8WX1lHPWoOCF2KJN2YlrAgIFR6JfAihB5WrLSyEfo+BSWu9VK2EuevzFL65Jyvc
	EetrpXI85gShoj5M7JSkgiB084dwRWShE0uyh7s1t/AylTnSMlEDaSL2kfOEAeYPuG7HhNVmqWa
	cdIWga2tAjOc76FO5r61hgfmvJjb+VsZ3mgZipSL+2y8FNnYtuSp1mmNAF7fHjjO2A21gF2zFp0
	jhkpBvjoEvddF7GBcToU7es7uxM5eWzNy7GsdPmfHBALnu9SPzddn4qp1fH8ouqcjIcssGPTIle
	l90HvGUqbITKw==
X-Received: by 2002:a05:651c:a189:b0:3a4:9eb9:b9a6 with SMTP id 38308e7fff4ca-3a5c86e8186mr4063111fa.0.1789394959809;
        Mon, 14 Sep 2026 07:09:19 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3304565sm25772221fa.10.2026.09.14.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:09:19 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	lvc-project@linuxtesting.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>,
	Kees Cook <kees@kernel.org>,
	Richard Gobert <richardbgobert@gmail.com>,
	Tom Herbert <therbert@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.10/5.15/6.1/6.6/6.12/6.18] fou: Fix use-after-free in fou_create()
Date: Mon, 14 Sep 2026 17:09:07 +0300
Message-ID: <20260914140907.196765-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

commit b14361aca6350ff7907b0e9903c7b94dc7d5d4a0 upstream.

fou_create() publishes struct fou through sk_user_data before adding the
new FOU port to the per-netns list.  If fou_add_to_port_list() fails,
the error path frees fou while it is still reachable through
sk_user_data.  A concurrent receive can then dereference the freed
object in fou_from_sock().

This ordering issue was previously noted in the linked discussion.

The failure is reachable when local port 0 is requested.  Each socket
binds to a different ephemeral port, but fou_cfg_cmp() compares the
requested port 0 and reports -EALREADY once an entry already exists.

Release the tunnel socket before freeing fou so sk_user_data is cleared
first, and defer reclamation with kfree_rcu() to protect concurrent RCU
readers.  This matches the lifetime handling in fou_release().

Fixes: 23461551c006 ("fou: Support for foo-over-udp RX path")
Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
Link: https://lore.kernel.org/netdev/20260502031401.3557229-12-kuniyu@google.com/
Cc: stable@vger.kernel.org
Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Link: https://patch.msgid.link/20260722083858.182506-1-xuanqiang.luo@linux.dev
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 net/ipv4/fou_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/fou_core.c b/net/ipv4/fou_core.c
index 0e173998f1d7..790791d08a1c 100644
--- a/net/ipv4/fou_core.c
+++ b/net/ipv4/fou_core.c
@@ -636,9 +636,9 @@ static int fou_create(struct net *net, struct fou_cfg *cfg,
 	return 0;
 
 error:
-	kfree(fou);
 	if (sock)
 		udp_tunnel_sock_release(sock);
+	kfree_rcu(fou, rcu);
 
 	return err;
 }
-- 
2.53.0

