Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494678;
	b=cKooxx0LCVpnsGZtMoLIv4EXefqrIbi1IP/IJEdq8Z0dnMekSO60o8YFgbjZzcJF/XGy
	 NlaHGQ4EOLJLjEJ7yJvS6hZtzea7tzIE7Y2Yukdbu4q+g3N+0tLmAMHQJOAUc3ha5eEIa
	 bLyL6UwzqpKuc1SxweS2aBkF0vqdX3wH3GdsgAEtKZGev7LhbLphw+IdThrzA1y9Mqqca
	 oLaENmLm0qnpiKrdIDg5I4gJQX0rgmbCJ1g7ZRO5oZwMeIG/DuWiHk6WEWhSiZMs9WElI
	 c1C/ZlgVPnKzggEVGmfAySciZAzMlHeZhl8a2hoADrtKDfhki4qhgkNMAZ6V2FwfL/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494678;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6cizRR5t8UfoRYeJtOsPTytD3AkD7sAMfgYZIutqldQ=;
	b=r8CayKUkI21U0t1g0hz+eRUwLDijhWzZfWCgNHHjERH7kBqUSugM7Ie3npGMOdJzLpme
	 7SZD+dp3te+qIRYOoyraDzSlTg8K6YJpx/70RgpFe/VBJCW7lk+smooCj6Murm0sFyMzv
	 9V0Ub7sfc6RhYc5Dtws8o1EMHX5U34R8zZOiVVAIjLycmee9TVDoARThTLVdfQNR23PqN
	 lOa30pSr8QUSKamJzVCLTlu//fLQBbc/PeaaUBRxr1LVF6FdN6QqQfqddPhbGEkMryjiJ
	 qBWtjpB2oae3VW71P8W9HtlQZMkvA3vZ9FMgPCbB9bAIzPMD8Pg13/32jgpbXAv73hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=J+CS1Ndr;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=CQaUnOUR;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD8606A321
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FFD8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=J+CS1Ndr;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=CQaUnOUR
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494665; bh=6cizRR5t8UfoRYeJtOsPTyt
	D3AkD7sAMfgYZIutqldQ=; b=J+CS1Ndr/eCOC1x3dXJqivk+s2MdhoUw6tFvXWUoxo7vLsN9cS
	R4D/O6lDpw0Na7zd+Dwckmy11t7hkPJdmvCZd4S3o8v3Y6YgMFZk9uFVi32rLjLz+jplrVthSjK
	feUYZ0NPJ6wstddt8GnBlInu21xGB0gcfHr+pcFXVbtwbMJYqDH+dp9AkVa78cgIwR9l32B0iZv
	bWgx4LOR+U+HPNLPKC+KCDyZBI/cBA0076AQggMsdf0cWFz3mzAp4MUwTtYB7GQJOGZRGl6E2EM
	ZnXnoANN+Erv5vOkrDVpF4QZvP9G1neXIWW6Xr42t/JL48eVna69F9p/vS+knOCev0A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494665; bh=6cizRR5t8UfoRYeJtOsPTyt
	D3AkD7sAMfgYZIutqldQ=; b=CQaUnOURNKVee3pQBuYnRvrZX3alz6Sln0EIraQX0admlDtfHr
	bOadH3ADwKYWbDpMBq95DkvBXr8Zj9PDObBw==;
From: Bradley Morgan <brads@mainlining.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH 1/4] taskstats: use nla_put_u32() in mk_reply()
Date: Sun,  1 Nov 2026 00:57:40 +0000
Message-ID: <20261101005743.3022780-1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101005616.3022705-1-brads@mainlining.org>
References: <20261101005616.3022705-1-brads@mainlining.org>
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

mk_reply() open codes a u32 attribute, nla_put() with sizeof(pid) and
&pid fed to it by hand.  nla_put_u32() is those same three arguments
already collapsed, and it is what the readers of this attribute use.
The helper returns 0 or a negative error, so the bare if() catches
exactly what the < 0 comparison caught.

No functional change.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/taskstats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index bf517788b8409..37422c43b8caa 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -386,7 +386,7 @@ static struct taskstats *mk_reply(struct sk_buff *skb, int type, u32 pid)
 	if (!na)
 		goto err;
 
-	if (nla_put(skb, type, sizeof(pid), &pid) < 0) {
+	if (nla_put_u32(skb, type, pid)) {
 		nla_nest_cancel(skb, na);
 		goto err;
 	}
-- 
2.53.0
