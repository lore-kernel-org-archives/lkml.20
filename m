Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3148F01F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762019; cv=none; b=ufbxYtg3kJXw4RxAVLcMFVvMyeDbLJMTwzpW/hwWzhCfgpE1PPaLBv/sbpVLK7b2BpXtqBP+xMz8jQRO2fkm7N/4StdFcXplDjJOghcXM9KLDZnFHm5Q+BRF7qnOJ4QK7ZZs+5cbtwKBNKe3WtvfVK4flZRGdtRIX8xCtSQiMmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762019; c=relaxed/simple;
	bh=gI0fncRiDYrkTvLtoHzbZmQWSjU1781MXxP2rDHUBdQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jTVKkvRDv3dbC9HL0BI6VrMnyyH+LJj6wRyQjkHZ9HasS904tdC/ue0yvL2Wyk2svN5aNOjNSQbYhsHduN9hPspOtx2gFgzjmtiYB6EpaMXKYWVKq91vI/btUeumzgqN0SNL3UtHgtNdcSBrViqInP/HN4B7TMBGX4Rpwjut9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qgd4TNcV; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qgd4TNcV"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd7d0751efso12550175ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789762017; x=1790366817; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDTO4eHKdMRuuk9UsFB+WlCX7AwxRYK2xSqBvBKhZIs=;
        b=Qgd4TNcVRh4a9JKozwd447xwC6SpYxlenDZ42t+yIX5gYOgw0D5iPS2RWQz997rPEF
         U7A/YEEO2legBVNitIkkSQyNHh/usKNRkSQ5WIwV1gUP4xp4iHnRnA/fX8zkAgMIJQL+
         mKTEpGyDFGHlupdEShnVkP+Dpz2BOUsi80BzwvnaO4vA3g7IkjAHDDFngRCAd+CgHMZt
         fUmDE8Z12hnh/lmUGUTpbszr/Rm9fICx8rQtlDeUrFIQSHXCkP4vcb6k8L+nLLTB2ybg
         zB/4ZQNub89FUzXHr26sqDBkzfsVZVD8aGpDqsSUukLdhpHNTMsN11tWef0prN4FlplY
         U7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762017; x=1790366817;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDTO4eHKdMRuuk9UsFB+WlCX7AwxRYK2xSqBvBKhZIs=;
        b=0qYs1nRhq82ELTwLRopeNgZZYGdgbDhGkI61xgCvy/697otFapknWbPxoI/ErNiYli
         FRSfKIx2kQqGY8T7sTyrMLXSjUPjGggKeG3/XJny6l2UoQjn3Dq7l4IfOnT7VY8GJ1nO
         Q3uGZ8S+AaxpzJng6Q0IpnYph9GcNgh1LOkKf5DZdnWn9qW8l/olGVcYtblwYpAy3NVm
         rzvrjP+39ze3pv9a4OkX5cTMESRzZg6P/M8eqxDkQjw2NgJGBdcSWrgcusnLt9/nOI7u
         i+U/1xKCo9uy3TbPqcpk5JNNDjL+MpzWot+zT4+kqqbYQLfLs1k/vN4FHWchTzvX4ngr
         rEpQ==
X-Forwarded-Encrypted: i=1; AKwUvByiEXkU/4lfl8Sz4wo2lHqGtz/z0htPO4OZWQg85CQqKYAx1NWfLJLrpYTmokXKpVtEqDJUdp9nPaATN0g=@vger.kernel.org
X-Gm-Message-State: AFuF++nICRdsXeouNUmJ+7Rfi08xOSNOTGpBmZQXP4hJNFv7KrzawcJb
	yXytJTf3cAb8CEK4Yh34FWGANlZG+rTgZE3rO/2jqmfRuaZlqtE0LoCDEeV+gCEHP/UsvESVPdF
	ngSzKCph8TOQ7Dg==
X-Received: from plmk4.prod.google.com ([2002:a17:903:1804:b0:2dd:be98:5b81])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef48:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2ddb20fe772mr43004845ad.3.1789762017240;
 Fri, 18 Sep 2026 13:06:57 -0700 (PDT)
Date: Fri, 18 Sep 2026 20:06:30 +0000
In-Reply-To: <20260918200640.887030-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918200640.887030-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918200640.887030-5-dmatlack@google.com>
Subject: [PATCH v9 04/13] PCI: liveupdate: Document driver binding responsibilities
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Document how driver binding works during a Live Update and what the PCI
core expects of drivers and users. Note that this is only a description
of the current division of responsibilities. These can change in the
future if we decide.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 00776260ad6f..ec8db86ed66d 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -123,6 +123,20 @@
  *
  *  * The device cannot be a Virtual Function (VF).
  *  * The device cannot be behind a PCI-to-PCI bridge.
+ *
+ * Driver Binding
+ * ==============
+ *
+ * In the outgoing kernel, the driver must ensure that it does not release a
+ * device between pci_liveupdate_preserve() and pci_liveupdate_unpreserve().
+ *
+ * In the incoming kernel, the driver must ensure that it does not release a
+ * preserved device between probe() and pci_liveupdate_finish().
+ *
+ * It is the user's responsibility to ensure that incoming preserved devices are
+ * bound to the correct driver. The PCI core does not protect against a device
+ * getting preserved by driver A in the outgoing kernel and then getting bound
+ * to driver B in the incoming kernel.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
-- 
2.55.0.1082.g2b9226bbc0-goog

