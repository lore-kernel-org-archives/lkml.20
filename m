Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA24A0F0D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454644; cv=none; b=r27gfvE9zbU6wqoFUe2cFyqW/sbLvjOL9gvIMKh75k+4ubP+DXUkcHjKNSXM6Jb0TQmMIOKsst7y3o9QSzrMqUuuC8Y0GvDzmtsKIj2ySfDShJl7YPHogJNtfv/LITuYUQIINk4ujwXvsBh8shalMKrOKViliewgG2x4Ib79qN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454644; c=relaxed/simple;
	bh=TT8oFReKeXbbmaR+3RirBYTbWh1kF97Dd4M5XmaKWYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sC3/9/O5ZOnq4ZDiKXkemKW6z85uOfkDNOLwKFXfq/SrW6eS79JeXJNQdqp3WTgjoDvhmuiGPBWGcNlpyIi0aypPTqaWxwpnF/zHDprV2HJj4F8u+bpGX5dLtsV7afZyzONevCyg9D0B+H7qDUr7PVGQgsOo/dTDO85QVA/zbgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nylTaXW9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nylTaXW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788454642; x=1819990642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TT8oFReKeXbbmaR+3RirBYTbWh1kF97Dd4M5XmaKWYI=;
  b=nylTaXW9JaR9OUkiKCFfa9lAER3aQ6SrPDqDjDhoy7/mJx1wVpNfbI61
   Akx7MJQTFeCeRYtQwNogl+aqRx0l6QYDWKguH81dze+owfWp6jBcci8Jm
   +pWN2p20YsB8tNv9nO8cAavJQsct7AIwDPxWosjuqjntqmgzOT3HQp9xs
   TZcZCJmoykhnwsmsq6Vy0XDM2o1bWmw+UuXD7bMbYl2yoiVA461/md7FJ
   xCyd+ZAOMW2/mO/lnoZuqtI7JZldx4eEUp6Tn9xWIinqZ/Ck/R7zpvlaN
   D7NYpBDM9GwnnPryID6kGJ1yyzdNEMiGsqm1YxrQtqNzemun7FCygPUQm
   A==;
X-CSE-ConnectionGUID: dc/QdduKTiupUVrg2HttBw==
X-CSE-MsgGUID: /jpe06icT96v1o3STY8Tjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100104009"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100104009"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:57:14 -0700
X-CSE-ConnectionGUID: Br+wJKu/Tp2pj8y+Q1/zKg==
X-CSE-MsgGUID: CZoDz2WgTx+flNpQOcIJcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273554226"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:57:13 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: tony.luck@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	bp@alien8.de,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	fustini@kernel.org,
	fenghuay@nvidia.com,
	peternewman@google.com,
	yu.c.chen@intel.com,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH 5/5] fs/resctrl: Drop unnecessary parameter from resctrl_io_alloc_parse_line()
Date: Thu,  3 Sep 2026 09:57:07 -0700
Message-ID: <4d050a1f7dc0b22bd8c4e6db1c2f2781e2bf929f.1788452481.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788452481.git.reinette.chatre@intel.com>
References: <cover.1788452481.git.reinette.chatre@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl_io_alloc_parse_line() only has one caller that determines the
resource via resctrl_schema::res and then passes a pointer to the resource
as well as struct resctrl_schema.

Only pass pointer to struct resctrl_schema. resctrl_io_alloc_parse_line()
can determine the resource itself.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since RFC v2:
- Rework changelog.
---
 fs/resctrl/ctrlmondata.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 4562072b8ba6..69123b2a3274 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -955,11 +955,12 @@ int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of, struct seq_file *seq,
 	return ret;
 }
 
-static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
-				       struct resctrl_schema *s, u32 closid)
+static int resctrl_io_alloc_parse_line(char *line, struct resctrl_schema *s,
+				       u32 closid)
 {
 	enum resctrl_conf_type peer_type;
 	unsigned long dom_id = ULONG_MAX;
+	struct rdt_resource *r = s->res;
 	struct rdt_parse_data data;
 	struct rdt_ctrl_domain *d;
 	bool update_all = false;
@@ -1052,7 +1053,7 @@ ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of, char *buf,
 	io_alloc_closid = resctrl_io_alloc_closid(r);
 
 	rdt_staged_configs_clear();
-	ret = resctrl_io_alloc_parse_line(buf, r, s, io_alloc_closid);
+	ret = resctrl_io_alloc_parse_line(buf, s, io_alloc_closid);
 	if (ret)
 		goto out_clear_configs;
 
-- 
2.55.0

