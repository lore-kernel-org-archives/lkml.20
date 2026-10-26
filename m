Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051851;
	b=jVBLJiIsjnp69wf0G1xYaMCox0dy1XiiYFXYCNsbpZJk+Q/ifJAM2fE9j8WnC+ul+0oV
	 JaC+BaqTx7gT7Dop5HXhZ/YUteb7tJkzv7ZOrDXuu+/8YeuLn9byRMlp6e72iEyCeY1Yt
	 REJ15Z5FDJvwrUVzHihZhajogjWktdWZDLc7au3B/7l0A/BxgV5F4T/Aa/QOvMOqpvccS
	 RWGRYnN5laoN5QgXRyFkAzs/ISZuva3377/vaUjQRlofzdFmz+ybuqtn+7QD4bAtc8WsG
	 B91kDOJudLyj0azdOWvmhYbsfdJnrgpjGPh0caeb4Fr7XpDOgFkK1O6gJd7Gm0GS8qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051851;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UlQCSZlz3mraiMHesZOZluDRmw2/hRxcIdnKIMuj4sk=;
	b=Y+YoVmiUTFPqs1zqV3kIxmdomw40H2v/sP97FkE/vxkE7Csa2xpBxUv75lU3AtVZKUkC
	 8qDCQUVu3JA7VuM5pd0P20gDblSqug/5ycqvuWSMI1m1kPweIY74d6wTTTjQAe+1OHnDT
	 UQ8ICK6SFPfDHS2wUMk3oovdGxiw1y+l9uvfWw/SgTXI4op7L41PZgIoXxXuefUtVtODu
	 bq6rWcUHnZefH1WvzVQpXfSjHVlyiujGFuc6/pO3ajUSEwYjw+vyeJ2EBp9etY1Nd8UYf
	 NoeYCwTidv9lU/gjB2CNCpp0Gra5wA+da9mE8ZU+rljdmLDg1oACAv/nZI+NNsdfuSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jOtHJWx8;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8063606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8063606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jOtHJWx8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793051849; x=1824587849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Ew9CPQb/prJjMrGBjHYwl1mAHCM/QP+a/IXGDctMyo=;
  b=jOtHJWx8MTzXqBCf6f5IwaOgSeUfYcAe2JP0zegrzg/OLJD6KSwop6Db
   KfYzA4kzThaowc2sOXWPfmNmi0l3bL14bEY7vAUgPTJyqgkqXX7mpAiqn
   Qx4AN96DUmY9pbd/SZ+8bYqH7PKTlxj1No/P5u4vNJV38SXSkLKMHROOM
   3M5VBfKuWah7atrVsUm7T5cYxKh9iDZUQjZyNzcmbyAr4VEYWmY01Qh5s
   QNUYGvAKVW34CXQGGVjZwvs/dAHESXwSNSinbmKG2aykt51llA5f6PVVp
   /x3ZGWOXTybGDCvC2NbaW+y7NwAAP5PwYJEeVvqO9bmTU3152ycWWirlg
   Q==;
X-CSE-ConnectionGUID: QSVzcJfSTymgfBhSSy+law==
X-CSE-MsgGUID: 5ZHcN3YXStSEUCF3FK7VVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1766374"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1766374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:27 -0700
X-CSE-ConnectionGUID: 8fJShNk5QC2feLZ7b9nF3A==
X-CSE-MsgGUID: O0Usa0doRbCcT5XKi9OSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4240251"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.221.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:26 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [RFC PATCH 1/8] fs/resctrl: Change UI of "max" file (merge back into earlier patches)
Date: Mon, 26 Oct 2026 14:57:11 -0700
Message-ID: <20261026215718.16810-2-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026215718.16810-1-tony.luck@intel.com>
References: <20261026215718.16810-1-tony.luck@intel.com>
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

Make the UI of the "max" file show values per-domain so no changes
in UI are needed when support for asymmetric controls (L2 on hybrid
CPUs) is added later.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 Documentation/filesystems/resctrl.rst |  5 ++++-
 fs/resctrl/rdtgroup.c                 | 27 ++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 434e6f42db4a..de162280a0fe 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -397,12 +397,15 @@ with individual files:
 		the schemata file.
 
 "max":
+	Maximum values per domain in the same format as the schemata file.
+	Format of values depends on the type of the control:
+
 	When "type" == "scalar":
 		The maximum value that can be written to the control when writing
 		the schemata file.
 
 	When "type" == "bitmap":
-		The supported bitmap (in hexadecimal with 0x prefix) with
+		The supported bitmap (in hexadecimal without 0x prefix) with
 		all bits set.
 
 "tolerance":
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 416b73c57016..7119ad0029c1 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2465,15 +2465,28 @@ static int resctrl_ctrl_max_show(struct kernfs_open_file *of,
 				 struct seq_file *seq, void *v)
 {
 	struct resctrl_ctrl *ctrl = rdt_kn_parent_priv(of->kn);
+	struct rdt_ctrl_domain *d;
+	bool sep = false;
 
-	switch (ctrl->type) {
-	case RESCTRL_CTRL_SCALAR:
-		seq_printf(seq, "%u\n", ctrl->scalar.max);
-		break;
-	case RESCTRL_CTRL_BITMAP:
-		seq_printf(seq, "0x%lx\n", BIT_MASK(ctrl->bitmap.cbm_len) - 1);
-		break;
+	if (!info_kn_lock(of->kn))
+		return -ENOENT;
+
+	list_for_each_entry_rcu(d, &ctrl->domains, hdr.list, lockdep_is_cpus_held()) {
+		if (sep)
+			seq_putc(seq, ';');
+		switch (ctrl->type) {
+		case RESCTRL_CTRL_SCALAR:
+			seq_printf(seq, "%d=%u", d->hdr.id, ctrl->scalar.max);
+			break;
+		case RESCTRL_CTRL_BITMAP:
+			seq_printf(seq, "%d=%lx", d->hdr.id, BIT_MASK(ctrl->bitmap.cbm_len) - 1);
+			break;
+		}
+		sep = true;
 	}
+	seq_putc(seq, '\n');
+
+	info_kn_unlock(of->kn);
 
 	return 0;
 }
-- 
2.56.0

