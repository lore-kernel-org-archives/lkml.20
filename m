Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE839021C;
	Sun, 11 Oct 2026 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695100; cv=none; b=piUUTnmwBU4OM/mNzCTyc5BgdJ+hGYX/SJa2ISXe0k/8Sh6OdYKFLjjzz1vqWjclblXLdbVydRnf7hNHyOOD5AL6cJ8PYJEEsdHJLVUAIVVWTh8n5YsG49AtEFVIcoycxXzgJYHNRXprG+aAYdOM//TO0CGm5dZg5m4bTGZ4/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695100; c=relaxed/simple;
	bh=tq0v9Q1VYvSLEcKmdvc/iquII++c+vlM9v1cfyHRpCQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBEJAvaQwmZIuzfE8BtPVB8FKvqDZMQ1T51cTlTEsoLr5PuG5ErM2+THczA5auHL0KrMaCjovssZy8amDvTTB3OTMgPP8cpG/U6il1JgzVZxRqywltDV95guDpRVL26QY2BBbHYc8L64/XSe9g0aKNsXpLigjFsRfSnwojKX67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=P5MIBqtq; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="P5MIBqtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791695099; x=1823231099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AKIg5aKupI3nJbDbXUECHkheW55wGbdDfZuWQmt+1iQ=;
  b=P5MIBqtqJzD+tIl/ywtty+ZkxmVcYHPUWBJ98ZoIm0DEiS+GW22VMFxT
   bqR6XbbHnsSnYtfTM/twwITFI1yKj11OUZ4qagOZiBxTCK9zzHjDxHxx6
   KCZwzCewUo0NYL30nU+rkvQ2UudNQnQpzHsAijcue6PwvKsjNJynok3YB
   Zdk3GZjKsElbvrzlLXgki+nI5wvvfWZLsTqtxySFzRbzCnkJ7KyjWGA+G
   9fKCLoF42jkwKGjJFRyE4QNKDiQpkhgi/U/lUCKNw/ZPmFXhXGBjFJ4CA
   8ghKIQE9QwOXKu3fbnuNdNYGGT4rHKekwVlDTA6T54qA5E1tQ5YpJCJPF
   Q==;
X-CSE-ConnectionGUID: r2i0InoATi+7X8J6aNispg==
X-CSE-MsgGUID: 1p20s9aoQ0eoy+UkyK41wA==
X-IronPort-AV: E=Sophos;i="6.27,151,1787011200"; 
   d="scan'208";a="30849675"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 05:04:57 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:8242]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.13.116:2525] with esmtp (Farcaster)
 id 2acb693e-8b9b-45d9-987c-f7f8024cf565; Sun, 11 Oct 2026 05:04:56 +0000 (UTC)
X-Farcaster-Flow-ID: 2acb693e-8b9b-45d9-987c-f7f8024cf565
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 11 Oct 2026 05:04:56 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sun, 11 Oct 2026
 05:04:54 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/9] irqchip/al-fic: fix argument alignment and a repeated word
Date: Sun, 11 Oct 2026 05:04:40 +0000
Message-ID: <20261011050449.41903-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011050449.41903-1-farbere@amazon.com>
References: <20261011050449.41903-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The continuation lines of the irq_domain_create_linear() call sit three
columns short of the open parenthesis. They were aligned for
irq_domain_add_linear(); commit affdc0d1bdfa ("irqchip: Switch to
irq_domain_create_*()") renamed the function to one three characters longer
and left the indentation as it was. checkpatch --strict reports "Alignment
should match open parenthesis".

al_fic_wire_init()'s kernel-doc reads "the fic hardware to to work in wire
mode". checkpatch reports "Possible repeated word: 'to'".

No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v5: no change.

v4: no change.

v3: no change. Added Reviewed-by: Radu Rendec.

v2: new patch. checkpatch --strict cleanups (argument alignment and a
    repeated word) split out ahead of the functional changes; the touched
    lines also appear as context in patches 3 and 6.

 drivers/irqchip/irq-al-fic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b63c99..35581332b40e 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -132,9 +132,9 @@ static int al_fic_register(struct device_node *node,
 	int ret;
 
 	fic->domain = irq_domain_create_linear(of_fwnode_handle(node),
-					    NR_FIC_IRQS,
-					    &irq_generic_chip_ops,
-					    fic);
+					       NR_FIC_IRQS,
+					       &irq_generic_chip_ops,
+					       fic);
 	if (!fic->domain) {
 		pr_err("fail to add irq domain\n");
 		return -ENOMEM;
@@ -180,7 +180,7 @@ static int al_fic_register(struct device_node *node,
  * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
- * This API will configure the fic hardware to to work in wire mode.
+ * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
  * Interrupt can be generated based on positive edge or level - configuration is
  * to be determined based on connected hardware to this fic.
-- 
2.47.3

