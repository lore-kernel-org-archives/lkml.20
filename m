Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E406E361670;
	Fri, 28 Aug 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931017; cv=none; b=e77EPbChYkfkRbLXt165aWuXTjHx8UWZQVKFVnEyahJuOKkVYb+mKMuCS+9+KbDbqeR/N2dfSd3olwgf/3zDffBgFHaRKQYBq85YHVv3hZgYUeYbLc53a2txeN2t0DboozNs5fl9keBWxG75n161oCWq9E2o3EipFrDOJ9i66rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931017; c=relaxed/simple;
	bh=nnHlv8oO55P0LwkFNxkXh4+Oe4hBeg+9+D4lDzARXs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEynWTWceldo1OaY5vRH0G/x+rY/db+iOJYHO0/7a2o/T1Kjuna/oGZbbBj8cDbEjCKy8IZbVdjPZlOSx3c57g8JtbifTy9ZbFlDqNXkxYWzUBbSE36fb6sNL1DDAtPcT3S8L1cgf0y4jjyf/iuuiwqfZrjgZwI8VKroszyjsRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQ27kF//; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQ27kF//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787931015; x=1819467015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nnHlv8oO55P0LwkFNxkXh4+Oe4hBeg+9+D4lDzARXs8=;
  b=UQ27kF//UYWrN6iQA3DIap8YMOnvhQ+k3xVMNlZUBrAC1rabAKfIJVlS
   dv2tZGpXfLq1TkzRHL2sXJA8tvXjRkVDsAWCHi3clMrt+bWjXXIWlbdif
   fhOKCsTqaaG8vd5eARnkJIvCX9FZNzA2QLoeQvdE9Q8O/nRYVE8BIEnpA
   zgCplyx4PU7bcUVtAY33tGEstR38eKm5VtoVt7G4rfZ9hG/3oNxq6p52v
   bpCMN3OrEcOZIf06pHMDCFejC02EpTMoK89GAL1nOz9rduwlZ0vRhhDLn
   RoyYvRNNQoy/6mE4UTzG3yL6ZycWY6mdZF158O+du4SahzP2S6t2qrGiM
   g==;
X-CSE-ConnectionGUID: GXBvmcRaRwuA69VLnPsRjA==
X-CSE-MsgGUID: feAmIDOCQbOPsxIRUZk8yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99104581"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99104581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:30:09 -0700
X-CSE-ConnectionGUID: BFdpWAV6Q720PoHIAxKKpg==
X-CSE-MsgGUID: BOYpFh9aQQ6KA/dfGVeAhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="291682272"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.223.138])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:30:09 -0700
From: Tony Luck <tony.luck@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Breno Leitao <leitao@debian.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 1/7] cacheinfo: Export get_cpu_cacheinfo_id() for loadable modules
Date: Fri, 28 Aug 2026 08:29:56 -0700
Message-ID: <20260828153002.10290-2-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828153002.10290-1-tony.luck@intel.com>
References: <20260828153002.10290-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

get_cpu_cacheinfo_id() is a static inline that requires get_cpu_cacheinfo(),
which is not exported. Modules that need to identify which cache instance
a CPU belongs to therefore cannot use it.

Move it out of line and export it.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/cacheinfo.h | 12 +-----------
 drivers/base/cacheinfo.c  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index fc879ac4cc4f..56fa646df0d1 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -82,6 +82,7 @@ struct cpu_cacheinfo {
 };
 
 struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu);
+int get_cpu_cacheinfo_id(int cpu, int level);
 int early_cache_level(unsigned int cpu);
 int init_cache_level(unsigned int cpu);
 int init_of_cache_level(unsigned int cpu);
@@ -137,17 +138,6 @@ static inline struct cacheinfo *get_cpu_cacheinfo_level(int cpu, int level)
 	return NULL;
 }
 
-/*
- * Get the id of the cache associated with @cpu at level @level.
- * cpuhp lock must be held.
- */
-static inline int get_cpu_cacheinfo_id(int cpu, int level)
-{
-	struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, level);
-
-	return ci ? ci->id : -1;
-}
-
 #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
 #define use_arch_cache_info()	(true)
 #else
diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 70701d3bc81c..28d193bf6064 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -38,6 +38,23 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
 	return ci_cacheinfo(cpu);
 }
 
+/**
+ * get_cpu_cacheinfo_id - Return the cache ID for a CPU and cache level
+ * @cpu: CPU number
+ * @level: Cache level
+ *
+ * The caller must hold the cpuhp lock.
+ *
+ * Return: Cache ID on success, or -1 if no matching cache exists.
+ */
+int get_cpu_cacheinfo_id(int cpu, int level)
+{
+	struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, level);
+
+	return ci ? ci->id : -1;
+}
+EXPORT_SYMBOL_GPL(get_cpu_cacheinfo_id);
+
 static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 					   struct cacheinfo *sib_leaf)
 {
-- 
2.55.0

