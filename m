Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494680;
	b=EJ3MvLyNGBUsTeINqDfLD/GS1VZEEPtwHPzRACKrMoC2Q+V1TsJgbcKMNebmpnhW/hX5
	 NM3WKU+wDchbjAoAldBeKW0frGzVFK3SxYxS8F8QFjEhiEo7e43cbc9N7ufA2kGBQZnzv
	 Jmp1yJHjt5LGJyHueQNouf7/MRcfWHwGEsQR8u1mKczPY3frIN/WPPRWxUqKz7ujHCPbS
	 Ar5VTTw/Y1MYi9yCV+x09+mYmv0KrztDe1/Qo7zrUwbG/QOxPNoUYvUYGbbNlnzcokfPZ
	 RGJTycpa2UFGksNBCHgyTjEbUVptDiwSog68H9LCzPkYtW/O0hwpTWrr3CEj5UblKrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494680;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2/dnBVhdOLL4K0ayfb4qs5Ee5LkbfkmiEBM5hZVIge0=;
	b=fc1X3vm3NVw6hG2OA+BRU60aIhSUMfw0Ouyl/Duhw7Gc9TyScCjKEeq0Sr1bs6lI7E1x
	 MOilSu4h3qwl5ahclRPueO5sPh3wELA1jB4SqkO5ju++ZJOi0w8AQUjGcY9fafjIbqg76
	 C7NiTnuYPqKP2IolJFobOhZRXinwicBJFeC2/e4ZBgjx865lEEYrxqKr1Pnc7u9XFGt9I
	 vlrPfv4fA/0JstEbiiaE6umAije700SgxHMQRv3JVv/2Op0hrMFas3u750GMz8GfeUfu7
	 ysVbiBYwQV7YeatravLwuSQW7U6vtgJDTT0w1voScviNNasUW5lkYER1TaG7D+piwIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=k9evYpED;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=NMNISJNf;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56570606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56570606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=k9evYpED;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=NMNISJNf
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494669; bh=2/dnBVhdOLL4K0ayfb4qs5E
	e5LkbfkmiEBM5hZVIge0=; b=k9evYpEDH8EA11alt609dsqEjK/4zLHuyM8CljFZTc48Ks8vYK
	vzvLR6UyETbOe6mcXKMQ8FB+ilSivqeGkW/m3qgiSg/1BpYN5AXvtaBIrlXaQf4o7dUrqJl+TTb
	uyQpvPChKKXZFzepYKtttzJGt+hTjoapSWvezX+E0fzvg3LuxNESfJueAc/ytGuIYWabQMCtpST
	mr4CkySItpMZkaYks9nzQl+FWkL6qmKdBEfwt/RZYRLi59+PzhhJP0wMAFD3kFnykgKQadU840Q
	0UF7WTWy7rf/10ir/MjGb6Vz2pmO1nxzW2rzNRFfv5Vl+PuXCq+CwYuFG49WsDmPmAw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494669; bh=2/dnBVhdOLL4K0ayfb4qs5E
	e5LkbfkmiEBM5hZVIge0=; b=NMNISJNfT4O63lsfoQqJ9+DIc9sGIDBCLMBeXsWjeC2v8ViSm9
	jgKUOlJDxW7Om3xjVhVApKTrUjQ6+XirW7Cg==;
From: Bradley Morgan <brads@mainlining.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH 3/4] taskstats: reuse na in cgroupstats_user_cmd()
Date: Sun,  1 Nov 2026 00:57:42 +0000
Message-ID: <20261101005743.3022780-3-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101005743.3022780-1-brads@mainlining.org>
References: <20261101005616.3022705-1-brads@mainlining.org>
 <20261101005743.3022780-1-brads@mainlining.org>
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

cgroupstats_user_cmd() already pulled CGROUPSTATS_CMD_ATTR_FD into na to
check that the user sent it, then indexes info->attrs[] a second time to
read the value out of the very same attribute.  Read it from na.

No functional change.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/taskstats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index 35e9fa71526cc..9e11f92216861 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -417,7 +417,7 @@ static int cgroupstats_user_cmd(struct sk_buff *skb, struct genl_info *info)
 	if (!na)
 		return -EINVAL;
 
-	fd = nla_get_u32(info->attrs[CGROUPSTATS_CMD_ATTR_FD]);
+	fd = nla_get_u32(na);
 	CLASS(fd, f)(fd);
 	if (fd_empty(f))
 		return -EBADF;
-- 
2.53.0
