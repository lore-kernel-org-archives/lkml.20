Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8D31F996
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762023; cv=none; b=picj7UN7b8UfxSjnvmkQ3LM+RJqr75Am9L74ZzO3DbldJJQuBaHXx6H+QTg2na/F19onD35u2NGkCWyI1ZSHwPiK2+UbEy/LY6qcGw5iV62cXeww8GsVY8pPzqrnxLtWKZo/2QhQAk2xV8QH9AY72yRMLPOcEtXjz30PSvTK2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762023; c=relaxed/simple;
	bh=KHPcOPB+gAXNZf9IV4HYUwlD099iefkEdhfeFBo8/TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhaUKhrbraODoEE1+NHpqmVy5U1nefy2uLYDykhmMqKpVUhN7mUEu2upmj+xvZ+2s5MrV2EAbBABue8BdoA6uNYLCD2X9KELJ2YU3jkMaOnxhLboJvE11f8DooTLzIzAOIv1BJF0StgCni/gd26X5ARGH6Ud8qTemN8u5O1f4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1gRxzjV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1gRxzjV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso27862475ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762022; x=1789366822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSNEtbWBmFFM0jB/F0sPboSagbEjgm4bGfRGjkQzdP8=;
        b=B1gRxzjVgngWKFfadV8qbZzRhKJk4lcjMZ164mEQtSknzmZ2VtFUeWxK+c8J6rIqG2
         XFu1a0Cph37OGvijV8sQyKRI51xmtj1/7Q/BOqikGnNUglqqY5cTlQnkPMvWWR3KrkP/
         P9ZOfbBgvnlERqY71k8eI2vOnQyqfuggdRIfSIO5bOT0ZJHgPzGGd0tmJw3MDXkGwKf8
         VkfJ7F/z3pZqtTWgAH9y6rQdQ5nWAAoiI2uPFI1OP31NIyGQTn707AuUN72cXnRdA/p5
         NxsbODFR1rN82lMZtL1C8jp1lYfMknSKtbGKLkF5tipdzIAk0NXiP8tdgRx2ZAUkCK2I
         2zpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762022; x=1789366822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSNEtbWBmFFM0jB/F0sPboSagbEjgm4bGfRGjkQzdP8=;
        b=nenS1yNX5j/X09N6EcXPO6PbM2U42P4T1o3u/oYpqh6gSsWQTK2E0qXnqAkTFjh7h9
         1WeemQLNxFs+V9NLl9CifhDHkYFLtU6aOyC96hiFDluE0EAtWdcZEedv31DtEMq00Pu0
         8ZuXpoxR6Dq0HQYIX4AYmEqDdopX5IrpLoj5mm5+71wOf4UpJKXr6auBWpoLjVt0CwiP
         RrqjerH+okiseMozhDvMZIa4o+VY3raelR1l1pOm9zX01A8N7+XT4IdClE/BYc4IEUVx
         M0DSWioTMseFJ70z47aw8b4qlHY6FvQX9wWOMU2RL8iv4xqn9g9Hl0TGE9s/Ht4gUd59
         duAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0MpXH9VzhY4dmTmkM9vRusHjKEwyOP8rriCzCdzCc9OtCicr2RiOx46htDQhOyCIMH0nbilS05vPt4KI=@vger.kernel.org
X-Gm-Message-State: AFuF++lrSw7FD4c8YVQsiRMPW0LqHltzYDOO4a/lE2eB8cCV2QhQmUZ8
	cPmny+MzuCVzT6iB71jmZX5fn63OSLLuVGS14lxdn1GW1sIVND7elp7i
X-Gm-Gg: AYBFou2Qp0O66XJKIGTQLldaW2IgWaHw01zHVlQ78L8VzJPdbTJTibTEApMPLJCQGol
	RruWy9NmymrY1X+WSETYxIh/KAXEh2tlPbQMnNWmIZeIKZ7yLeQxrsm423rSsEfrYqudW80vV3X
	muMXfeASO8kCOnMMA0mjOlqVxA58vXkD3ciC6U9+WKmypYnqzGxBQ8Z7iccnPKSn5m1Ut/vsiI7
	yZK9N6M+15IloawWtBpxUt99oR5g7vWxCn8LLsUFQQiJ7mowJ7oY/VDfOmfDhrNBH33UJJfslbM
	PIaTkiVV7gv2mq3sfbFTw7fzmPRv4K8u/aNj3BqjYm1aZIFMrujpfg+ZFPfEnmgz38WZ3v09wtu
	WprgE/QlimQ4O3cSuz5pEL5AVC60/UUcvo+XkX3my5eQ0msrSOU9UTn4dSUhTnNaHPjk+0PA1cc
	b/N/rEx2XkMMf8NfDwX3K+05NOcUDEb0x+RUlquPvNwiRIhmelzQ+q/HTgkKYWFCMnCaSYLtwaz
	p5hrJFaI00NEg==
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr304916435ad.16.1788762021826;
        Sun, 06 Sep 2026 23:20:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm14212740eec.8.2026.09.06.23.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:20:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of: fix typos in comments
Date: Mon,  7 Sep 2026 11:50:17 +0530
Message-ID: <20260907062017.5881-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/of/base.c        | 2 +-
 drivers/of/fdt_address.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d71ae0449360..9e249286be71 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -700,7 +700,7 @@ static struct device_node *__of_get_next_child(const struct device_node *node,
 	     child = __of_get_next_child(parent, child))
 
 /**
- * of_get_next_child - Iterate a node childs
+ * of_get_next_child - Iterate a node children
  * @node:	parent node
  * @prev:	previous child of the parent node, or NULL to get first
  *
diff --git a/drivers/of/fdt_address.c b/drivers/of/fdt_address.c
index f358d2c80754..2e4e46a58cb6 100644
--- a/drivers/of/fdt_address.c
+++ b/drivers/of/fdt_address.c
@@ -172,7 +172,7 @@ static u64 __init fdt_translate_address(const void *blob, int node_offset)
 		goto bail;
 	bus = &of_busses[0];
 
-	/* Cound address cells & copy address locally */
+	/* Count address cells & copy address locally */
 	bus->count_cells(blob, parent, &na, &ns);
 	if (!OF_CHECK_COUNTS(na, ns)) {
 		pr_err("Bad cell count for %s\n",
-- 
2.48.1

