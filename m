Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD983CCFD2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528497; cv=none; b=enMv9udXhdsNN+fEzx/NSJNmFTCMEOXBKeiFwOi/oPusv/IXTwz03lFPK3rj1ybzLM+LH7Z+jZCpb/vrOuVMLY8/4wZojhRs0gWJ0pS+6MrVKcLLPbu3oirHAtYd7leoQ5RtXo2dlGKnG5zLbS4oFPm73ZIabqKQWJPExpMVAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528497; c=relaxed/simple;
	bh=ZnCPh4/0FJuckhJnJxycUHypXVPRY3ZAxmuTYheAm10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CwOgs8gCe7GanDma7aUv9kBtNYN3IqFjEYW4ni6ROTpuV7mKOHT0z7QNkzrHmFWmr9Voe9qDMXRqsM5EVm/6Rdi2qwC1aTMhMfUmu51lzJlqpYQ7sLZvVgUXmBm9HfAkINdhUU+Jz4Rl5x0ZV73b59ChdIvjk7YWWkKlQEmyhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NccN5LWc; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NccN5LWc"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33e6279a1d7so4454477eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791528493; x=1792133293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7vfJVKQYXGckl88W+Qa0MtiHsPF7eaM9DEgF9n+yQs=;
        b=NccN5LWceye1AIpzjDg/3ZXORM6UPlBVi2FSdLfGSXlP6lbhoeMbE1vvGtqlqa5e9g
         IEhwgahBRi7WSaI42N01skI5rYjVp2oo3qNn0q0vHroTngpQXb/Q+AGSeRnpdTh783fb
         5qHdwdJS0ESEa2yTXZHAV3JYpeqIpjFnit8UPiFRQQL+wTqRtGL7Sic13WI2n5VLNted
         LlQ8i0FOmz8Zt/AF1nQXgX331edxsJ783qW10YC2JGHNe70pzfmO4TJWg5T6r8qWL+cb
         +GaD82KT35YD8xHkr22P3STkzEmtQ7Ll+CkI+iV3SXSAj1Nn7y7n/iKlAAsVasuXQLwk
         wVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791528493; x=1792133293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7vfJVKQYXGckl88W+Qa0MtiHsPF7eaM9DEgF9n+yQs=;
        b=R26wWc74uQmAEXZgQLFzN3FnXfWZ7ywhjThCeqPIrtbUPFS+7dyD1MiohHu5ZlSmFH
         V39CRHtaUUhOhGjgqxTOWnrojsdHfh1KuuV4L72ElgAaD/7vZmYnOUGOitlrTlPH/Ex+
         38dc1nxKqlc3SIMUxcjtlOrJXnoE8dFeqfEYBpNXCAksYpcRExwXPUNqp0OyHWbyNpI9
         GiP7H02xs4m9xu/K4SUNIm5yvxkhfRO8M3X9yCEqeo4z9QNJkgPQ0YgIgudxcNukoIuu
         E8EPBzSKWHdj4bq9ZxbLA26vMVIm75/iPokryyrTGe28t6+oq7TfQ4Ws1qLbidBHEJPC
         JZJw==
X-Forwarded-Encrypted: i=1; AKwUvByhEVR537ST64Vu/15QMwP4hC3IKpZh13KvQQNHPfQgwF/qqHvi+YZviEeMty89TEXocnuaZ7ofIBX8EQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKcl1v9/rGDVbOzyuTHfwilCZXGtciNniMtQKh8SH25bcczXjj
	AcrUdSkha509l9RMhEmOPt6Yu/SXNFEOnZ2e8GgrTchgok63xVzzG7jnzuE7eLNe
X-Gm-Gg: AYBFou1C6a8kM4bqCISlh9isrFyxqcAJLJtfsLoRvFV09abRO14J7V4x47DYSENLD5o
	pc5Un/ucB5tC4Xv+UFlk77DmJzkNXpIfpRFkvJH47z+0hCXIumN/8DIvujBv2ZYUOpYwQz6vvyY
	ENMBqFVh7j+MxCSz98vsIX0RZs4JqeblnH5Om7d4NDY3CwoQivCo8fzSBflnQnGOB4yy6lEX9u/
	WhtKtGdrQEXjKe64eFmk1tnb4158Pq8AhM5Yy7FKtP+IMFoh9M2c551r9yabgDsz+SwaglpXgyz
	+sq1Q/6ckEVae1s58zr8yfaRcWEknQXAwejv1EWt34AiDexEAxNe/Blredsmrhins7hlkXt+iur
	9zyuIHrG6SR8DHV6EkAZ9lwjaz9Cu4Dd0j0crQMVRf1XnRFdpch06+n8AQh3C8Q2B2/uBI0kKlE
	OfGM3vTLH79XgXnXsEf4wAuTpsBTR0QotIhhttdpUpPmnEh5YA2CU+1IcSBoQnZi6pITkmt84ZE
	YqXwLmiknY8HLp/lS05OwDr
X-Received: by 2002:a05:7300:2321:b0:347:8d01:164f with SMTP id 5a478bee46e88-3537e05ff52mr2353844eec.19.1791528493163;
        Thu, 08 Oct 2026 23:48:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm4649477eec.25.2026.10.08.23.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:48:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] genirq: fix typos in comments
Date: Fri,  9 Oct 2026 12:18:07 +0530
Message-ID: <20261009064807.70345-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "descriptor" and "preceded" in the kernel-doc
for msi_insert_desc() and msi_next_desc().

Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://lore.kernel.org/all/20260907065303.18034-1-hemanth.selam@gmail.com/
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
Resend of a patch that has been reviewed but not picked up.

It went out on 7 September as patch 01/14 of a batch sent as fourteen
separate mails rather than one threaded series, which Radu rightly
pointed out made it hard to see what the series contained.  It is on
its own here, with his Reviewed-by collected.  Both typos are still
present in tip and linux-next as of today.

 kernel/irq/msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..b22d74496af1 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -142,7 +142,7 @@ static int msi_insert_desc(struct device *dev, struct msi_desc *desc,
  *				insert it at @init_desc->msi_index
  *
  * @dev:	Pointer to the device for which the descriptor is allocated
- * @domid:	The id of the interrupt domain to which the desriptor is added
+ * @domid:	The id of the interrupt domain to which the descriptor is added
  * @init_desc:	Pointer to an MSI descriptor to initialize the new descriptor
  *
  * Return: 0 on success or an appropriate failure code.
@@ -416,7 +416,7 @@ EXPORT_SYMBOL_GPL(msi_domain_first_desc);
  * @domid:	The id of the interrupt domain which should be walked.
  * @filter:	Descriptor state filter
  *
- * The first invocation of msi_next_desc() has to be preceeded by a
+ * The first invocation of msi_next_desc() has to be preceded by a
  * successful invocation of __msi_first_desc(). Consecutive invocations are
  * only valid if the previous one was successful. All these operations have
  * to be done within the same MSI mutex held region.
-- 
2.47.3

