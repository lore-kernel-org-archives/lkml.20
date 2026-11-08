Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794148524;
	b=Lx5sgS+lnpnVc6lM7LWL+poFthg64NXvN6Mpba7EuFPvKNpixWpjo/Eg4WAiJHqv59zG
	 03rdb8BlDI60Kypkx0HLOYihPvqhKQfGJQM6C8JUxUty1SLcjm6rDdeHz/lD/r4vtkf1s
	 KZ9nBavn9KmVM1PROpVPJFY6FntBfaqVE7rduqcvb6x49mWgXZXTN1agpaadr3OzvfS89
	 bnkUHXoDeCPQj7efwIIVtYBnh/+j+FzrBGABs5RpjJZmziZzxuKr55FPcJlF7KWgzuJep
	 NP2unNZBv68bP+tOQxZ451mYHo4u/kVN7bQnWzcZmL91cqSOkHHGLsw1POgA88vDnhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148524;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=TacDs2nTqrMpcBDIpEm1qHluc5ZSa4Yvd3fGHf+4+7c=;
	b=yvDrcgpckeaoDQNuQ0uK9hyokyNPUdhVLrLxRYu8t6P/wTjVrPbhK6/jK1lZ4HhLfNUT
	 L58R5IF3N8brZQJxM9Z4NcIYhEBgxiHNYgDpY+hRODhr7C0F/PgS/ZrBnYDDtH6v8cs/Q
	 qg7UnEOij0OkKawKwgcukr13c91/Oh38tfhBG2xpN4bwDsxPYd1CMgKQ2oxPpgfNOafSi
	 Ob/wJpsZVU789LB0iBBbqGE5OxQs+RNJAt6w3c9tQNd37SvJleARn/3IGGNggRR/oTPBs
	 pkSn5TMSY9HDftpH7AiEVHBBRwtU5/F/4bFbSBU9zK4P62OP2Dbk4x4bCi8PXlP748g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJMyEDqQ;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B70606A323;
	Sun,  8 Nov 2026 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJMyEDqQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794148523;
	b=ZhaACSiZQjflroDKJhnaHnD9Cpcqm6Ln6p2wm0kwlqiJKCklC/Rczdg39A3duSthb0K8
	 DjSn5pYT+wnzFHdA4ksFeHJIoT1Rgr/1N5O6x4bneF1S8zfZWHDbTlmuQToMviBBTtUHx
	 Q7lyp8+8NbpLCAsem4TJvPZ4ZTiZ+ww2Hmz17JuqmjP52rjGpP7/Ya5+X3KZ06nJ900rq
	 Tsj3BXzB0QqXTMRNH2A1qxdysZj7ciKoKyvAXHKbbe7bAAusV3207ffJE5d5EF7F/TgKY
	 tmNsjCEY7mVTfsJGTvWQCpQW7FRVOHF6dSURdkeKyQPFLeAmBOJpcRkAonSHcGuYVCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794148523;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=TacDs2nTqrMpcBDIpEm1qHluc5ZSa4Yvd3fGHf+4+7c=;
	b=kRDtD6uKxzPsoy8sWnuaiSN7T2TsHvczEGz/mG+g6yzLT23/sk9qvbrkepSXMC3t68/l
	 bu+K3qo9l2TN5HUSgcWhs16DZ9z2edABK+tz+VtEklxS3/qYEupVkG/LAw9cr16XubC13
	 KBt4F9+FIvc5bpgVnWPyS8OXiC/UjNlQm0slQ1PHAXELFBgLwWLHHQ/pwy0puRbDaoY7j
	 ieph2nZ0EyvMhP2iEZJ7Jz+EnQ+bSYbWEVQAi3W943G20MaL+LYLzgvMu8xn1O1B27vsO
	 g1I7asEQNxfH8VUe3PY8857XHzi9PAYxuAqM8boeVxejOpbGYNuls7VC8TQVrmC7ErA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 277F81F0089F;
	Sun,  8 Nov 2026 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148523;
	bh=TacDs2nTqrMpcBDIpEm1qHluc5ZSa4Yvd3fGHf+4+7c=;
	h=From:Date:Subject:To:Cc;
	b=BJMyEDqQEWckRuLgSb44ZmzGzlU3T2CeHfBX0BkYSFJw2NPT66UsQPHe49HE21KDp
	 6l+hcKdOO/u0nAkm1vDCc8gSTJcntGGDHljAoH6zLNZOi1ywWlWid8UFpzTgMJYpXe
	 5VU51QGsiHYhO+TN787/RjL3d4KDGkmkg0fvqgPgJI2kc0hdDLhMgDsL77U8qG3t4M
	 uNUJvdOdE7pZ4B/j5UHjnX1Nzt/2fA/lUDxShMoeApc7wqogO67w2/k6V+EVUvGECr
	 XacfcyNrEFfAnpdUHGS/Z9V91Cltv+hWwcNIsIvMqwKQrDhRmuyZgpMFJZJzn42sE8
	 4Obqd9QSetR7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 80EA847FAD;
	Sun,  8 Nov 2026 14:35:22 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 08 Nov 2026 15:35:11 +0100
Subject: [PATCH] soc: apple: Fix swapped paddr and size shift
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZtEXRrxKmLR1mAskA4iaby7Y
 vmd5PwBhDyTQJME8HSy8LpEqDQBN5llJOQ+GvIs10plNdoSxfgdB76wsn3htCrNoDXEx+Ypzl+
 t7X7LYWdy+5uA+34Aa4Yrom8AAAA=
X-Change-ID: 20261108-b4-sart-fix-5bd3c614af66
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=CxvqlaaGSLGOU+O2kAABji4s/QSx7FuuOM5btlD5e0o=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aHjvkrhfl3h+32X7JAaIXs7deRJkvUjt4zS7FrWJy3x
 m1RWdbEjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEZrky/JWcejTtg+WHhmVL
 2l3r9ayX+p+td9+0PVNc7dC9Gwnv3mkxMvwPyun98WiSwcOCdXaNDL8zr6/OVlMKcY4NsD1UY/t
 qPj8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Right now we assign the paddr shift to the size shift and vice-versa.
Luckily, this doesn't matter because they are the same for all SART
versions but fixing this doesn't hurt.

Fixes: b170143ae111 ("soc: apple: Add SART driver")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/sart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
index 66b99955b395..5f1f9ec5d311 100644
--- a/drivers/soc/apple/sart.c
+++ b/drivers/soc/apple/sart.c
@@ -258,8 +258,8 @@ static int sart_set_entry(struct apple_sart *sart, int index, u8 flags,
 	if (paddr & ((1 << sart->ops->paddr_shift) - 1))
 		return -EINVAL;
 
-	paddr >>= sart->ops->size_shift;
-	size >>= sart->ops->paddr_shift;
+	paddr >>= sart->ops->paddr_shift;
+	size >>= sart->ops->size_shift;
 
 	if (size > sart->ops->size_max)
 		return -EINVAL;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-b4-sart-fix-5bd3c614af66

Best regards,
--  
Sven Peter <sven@kernel.org>


