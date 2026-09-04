Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC9494A14
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519935; cv=none; b=R/3QttcMy0sd8NAHrAnfFkTQrXSUYyK1dTlQXUGKJ9zqfwHAaTLAhZ3kRznIpnerVEANC7/EXrsBpXKL9n+tVOicqG/wEL48VpZ+ZzY/UubkZ4oqpYapP2/5IAsS+XWZ24Y1PWkYlVcfr969b5ZexFT8gk74XJ5Zh16BmuV8N0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519935; c=relaxed/simple;
	bh=N0NRuMnQNT4U5LjQKRjWQiu7rFtDq9i7K1NImELSQZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbpVYkKPRHr5mmiRNN05A4Dl3qhVYbbAp9VLDo8tfgCijsE1eC7T2n9ENMcU6XQFVjPHEhuS5VcEbNh2lX6aWWDKJNnv4epowzX5xT+FadAbXNcFgtzUKJ7CsG2MSRkFnpnykIYzBwv/p87N9qfbHXoD2z8i2JdNhO8eM91bHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WedIWgxN; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WedIWgxN"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb61bbeb25so830063a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519931; x=1789124731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUAku8kEB1Qfbu/4zomfSevYTVMYvS8FyB0ooNWeIWg=;
        b=WedIWgxNuAwQbSfvNIB/vFwyt2YQvhyhuRpa6+96rvVlaSgnjGfmyvfRNXwrV+hy2j
         ZsAB9+9N8iFi292JM/eMd2M8UpZ5Vi02Zzi0IcZFHUzmSPj/iL1XIt06QHgRwgmAJ33M
         UN7e08JSqXbU7CKWwmlgtv1hRZjfOQmd9/6thHsIJzuJ0H90WIBIFrgbL2nrS7E7lIz2
         DvoBXWsmtOdVUGXr+xr1scFuiXiI9Y0S6E+1DxlqInQGZhU6f8EliEu2I87l5D8hE09S
         BSDRYkF2+uclEIzoq7xhEk5CRfXL/MEJ95Ry4tnoopmSAB+Pg4/FKVi4oviAUZRdt1EE
         nObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519931; x=1789124731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pUAku8kEB1Qfbu/4zomfSevYTVMYvS8FyB0ooNWeIWg=;
        b=g+RLNAd4MuGMncKBxEN4VkIWWgtv3TtHiOaNJfRJFL0YzrxR8jrfkatmSxaZQAr6IL
         bV1EFx5eDeGeQzjb3fkDLMvRa3oJlL3RwpQqCU9WX327b64Wmb8oR1gOyB5FVQnj0jmq
         DQKKhjwqsRCV/BeIMnmD/CF2uJoNR2fuF3srIJ1gSUQbZQA7FkDGIVi/l3jRjGPkhUL9
         rmHv/0qWNq6VOZ7klbpv015pDJz3EDtiFRaVeehMyvyXi6nYUz4bxNAzpwe16vCr/Dzg
         h/kc/fWRSIEh669tDpSv8rwQ7XNt9WuQWUO9U6t5DEWeFf8kydyKIDhTy+Q9972wCYBi
         F1kA==
X-Gm-Message-State: AFuF++nutgT0EQYpfrFU1pKXIqN+IKnLzY/qZ42+AiGN52QfAQRu8c1n
	zzvFs6zj2g4w2rHJ2Y43PyMXXfrMfopOvDIYJ7rbT/kIgc9O45e8xOMc
X-Gm-Gg: AYBFou2SgP6VJ+GkAsK3Reip4JLxm79GQy7rS94kxvyDtBcgAq/lHX7sAze8FQBQ2Fs
	3yLbgAXTak81Blgf9/eNVgTecAOsxwMNrfQCQqqeDp8fTopKJBpUEX3Ohc8wFIkjkCaAbzQ9dMQ
	s3pqGFOn7Zlwhi+UZWBk8Wdv/GZfBBdxAR13Ak/SkJwAzqJj9CfWdw26nMwfFnsGGQtMHleMoGA
	ZLirxir37fgIKDKUaMkaiqZ2VLdLJCCfMY7vF7EBZHS6w1wgbTudwOebAeI7ZMqF+FD/cLzzKVL
	cLt2b0NP7uZ4dqO7N9ioDzV2rE5fYh904uSn7vYXz8j/b41st8Fzrwy2UqK7qFFOd6szA0bPqbx
	Cnng61JqFcsMnjXdUv6l930L32ciA+8/6IvJHA6aHTgTkfGvQqB8xuxsNarkrnhKhM+q4LHYP8F
	f6NVhDJnBy1sYbNWtVDu6KD0dQEfXTGUBxZo4kinN5eS/bM9USmHI/TffeX+AhAjEGR+vlUK7zm
	zvFoXCy2b8+6vw=
X-Received: by 2002:a05:6820:4b88:b0:6b7:8415:d787 with SMTP id 006d021491bc7-6b78415d81emr1080277eaf.50.1788519930706;
        Fri, 04 Sep 2026 04:05:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5220280eec.9.2026.09.04.04.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:05:29 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/2] net: sunrpc: fix typo "miliseconds" in comment
Date: Fri,  4 Sep 2026 16:35:16 +0530
Message-ID: <20260904110519.15207-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110519.15207-1-hemanth.selam@gmail.com>
References: <20260904110519.15207-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "miliseconds" to "milliseconds", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 net/sunrpc/auth_gss/auth_gss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/auth_gss/auth_gss.c b/net/sunrpc/auth_gss/auth_gss.c
index 8ddc65e894da..8de85da8ee42 100644
--- a/net/sunrpc/auth_gss/auth_gss.c
+++ b/net/sunrpc/auth_gss/auth_gss.c
@@ -1468,7 +1468,7 @@ gss_stringify_acceptor(struct rpc_cred *cred)
 
 /*
  * Returns -EACCES if GSS context is NULL or will expire within the
- * timeout (miliseconds)
+ * timeout (milliseconds)
  */
 static int
 gss_key_timeout(struct rpc_cred *rc)
-- 
2.48.1

