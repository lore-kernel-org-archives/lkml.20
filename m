Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD1427F9C;
	Mon,  5 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199511; cv=none; b=fS8h1bTVgr7b+JFGDJ5BcOSCePHYdi3CpxkpIRMTRlxsMd4iZLnJeM8eC3IjQaojHGKA8SdU/2yTT25B13ZeVvSAkfzQw9HunGa/UHFvkzyfRDm1MnNs5oN1beug/WyfORNkh8t+P+sKUzTdXbrvxCMVM1mH8RMiNzGqJ8Ba0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199511; c=relaxed/simple;
	bh=/EPpBaL3y9kbMDxxFiYxFzJhAuO9dd2DtOPfbazarOk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1CdvjTk/ot5GC76y7BSzM20bwVwiqQUTYhYdhnCapHYtiVhueJR+KEq1f+afAKRNzFRkrKhXxlrtALOK1LLJfkS02cwL+l5N3y3SxyIC8xp8MvMqM+DcJ9DTn4Mcm9h7nF2unfLUnJVVxOzZXrNgvMLAd7hcmb+tKGSENv67fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=HMgKTDPH; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="HMgKTDPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199510; x=1822735510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kJgs9QB7Ca7YePc4EhMgArHydbCMhKsqF2LHkqyoJL8=;
  b=HMgKTDPHDtrO5j4yVLE0fjT56HqGsgJ3yETGTjhDT90ONmSzFa/b2Sg/
   E5UEoItsXzQPwqrfmCIMu72My4aFlkhQfEK8S74q9k3pzE96RkQJsHF8l
   39FiH30fxUOoJI6t1RaaneFAN2G3agq2NXxS1MFjtBT9LC3GtvHc4gK41
   mPSNuHaW7WCj/KeQESbI/oMcIa1GpU5+fVvWV0Zz8RdhCHxqLek3YKdzt
   MNDK2mVpNgoVpT40lfBlEQJWqbkNiF77dxX14ITPF1EpoBi63gPzcOcu6
   yamHalrWdW8bOz4TtC+ISpYlV1FLxgctnTXVxhfAKKFz7cGWPiNPdlPzV
   Q==;
X-CSE-ConnectionGUID: 6H7hLBGoSMuKQYxAgwNFWQ==
X-CSE-MsgGUID: FUGU9i34R8qf8Ymd1vNB4g==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30325840"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:25:08 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:20927]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.96:2525] with esmtp (Farcaster)
 id 94205088-ed3e-4d15-bbb4-6f4f987fd027; Mon, 5 Oct 2026 11:25:07 +0000 (UTC)
X-Farcaster-Flow-ID: 94205088-ed3e-4d15-bbb4-6f4f987fd027
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:25:07 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Mon, 5 Oct 2026
 11:25:06 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/8] irqchip/al-fic: use %pOF and raise init log level
Date: Mon, 5 Oct 2026 11:24:52 +0000
Message-ID: <20261005112458.22291-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005112458.22291-1-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWA001.ant.amazon.com (10.13.139.110) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Use %pOF in the driver's log messages, so that both the success and the
error paths identify the specific FIC instance by its full devicetree
path rather than by its bare node name, e.g.:

  /soc/interrupt-controller@fd803000 initialized successfully in Legacy mode (parent-irq=3)

A single controller is described by several FIC nodes that share the same
bare node name (e.g. "interrupt-controller"), so the bare name cannot tell
one instance from another. The full path includes the unit address and
keeps the instances distinguishable.

While converting the parent-missing message, fix a grammar typo in it
("device require a parent" -> "device requires a parent").

Raise the successful-initialization message from pr_debug to pr_info, as
this single boot-time printout is useful when dynamic debug is not enabled
at this stage of boot.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
v3: no change. Added Reviewed-by: Radu Rendec.

v2: reworded to explain why %pOF matters (several nodes of one controller
    share the same bare node name, so only the full path with the unit
    address distinguishes them). Also switched from full_name string to
    %pOF. No functional change from v1's "use full node name" patch beyond
    the log level and the grammar fix.

 drivers/irqchip/irq-al-fic.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index 35581332b40e..760bd08dcff4 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -216,8 +216,8 @@ static struct al_fic *al_fic_wire_init(struct device_node *node,
 		goto err_free;
 	}
 
-	pr_debug("%s initialized successfully in Legacy mode (parent-irq=%u)\n",
-		 fic->name, parent_irq);
+	pr_info("%pOF initialized successfully in Legacy mode (parent-irq=%u)\n",
+		node, parent_irq);
 
 	return fic;
 
@@ -235,20 +235,19 @@ static int __init al_fic_init_dt(struct device_node *node,
 	struct al_fic *fic;
 
 	if (!parent) {
-		pr_err("%s: unsupported - device require a parent\n",
-		       node->name);
+		pr_err("%pOF: unsupported - device requires a parent\n", node);
 		return -EINVAL;
 	}
 
 	base = of_iomap(node, 0);
 	if (!base) {
-		pr_err("%s: fail to map memory\n", node->name);
+		pr_err("%pOF: fail to map memory\n", node);
 		return -ENOMEM;
 	}
 
 	parent_irq = irq_of_parse_and_map(node, 0);
 	if (!parent_irq) {
-		pr_err("%s: fail to map irq\n", node->name);
+		pr_err("%pOF: fail to map irq\n", node);
 		ret = -EINVAL;
 		goto err_unmap;
 	}
@@ -258,9 +257,8 @@ static int __init al_fic_init_dt(struct device_node *node,
 			       node->name,
 			       parent_irq);
 	if (IS_ERR(fic)) {
-		pr_err("%s: fail to initialize irqchip (%lu)\n",
-		       node->name,
-		       PTR_ERR(fic));
+		pr_err("%pOF: fail to initialize irqchip (%lu)\n",
+		       node, PTR_ERR(fic));
 		ret = PTR_ERR(fic);
 		goto err_irq_dispose;
 	}
-- 
2.47.3

