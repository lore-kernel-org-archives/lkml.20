Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297604A4828;
	Fri, 11 Sep 2026 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144590; cv=none; b=BnZv7KiyEH1FeTHGehoS1r5wO2im+k4i4o5/PT+dFfJo+ZLvnd833/11oPX1B4jKyyy/mFSkbTWbbpggTAuUchHxehDW7R2LOUnqVRWvZCE91lTtDPNX1Md9p+wBauzI7kFl0PKH4otamkUflYTP4Hm2/z5BGl17dLJHSXi8Nvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144590; c=relaxed/simple;
	bh=ZgKXKOLm2sYRf235h4zu/DkzNsUkg7Z3/2TgHyl4z9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5/g7Z3dLfOyyG7ghMjBM9l6rzdLO4CC8CDT3SwBu5/gUb+asumtTgg7negDraX9UgCohEJpgAloVgnyie/BUjpCabKiuxr44NRFaEsTu28/m6TrmSdP9OlYr2Bx+nYSuNgmWOrAmhIBq9FRGexWj9bMkEZzrFgG9jF9DjRTkPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=u2RygQWR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="u2RygQWR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA0F52BC6;
	Fri, 11 Sep 2026 09:36:24 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5F8A3F7B4;
	Fri, 11 Sep 2026 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789144588; bh=ZgKXKOLm2sYRf235h4zu/DkzNsUkg7Z3/2TgHyl4z9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u2RygQWRT3uOLI+4If3Ryjn1uxH4/dkKQX9AekeN1gGRpLuuXdT3h9RuWpKuvDnYB
	 d8ujEEnNiHxLD/A4NSMpYyQd0k/hQLUpuFa8MoQ08YFpOju6V4toDTRwpBeRmX6EF8
	 sg8ZGEMySu4emD0Yuh2QjWGvl0M6oMKGwtegndOw=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v6 2/3] arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
Date: Fri, 11 Sep 2026 17:36:12 +0100
Message-ID: <20260911163613.1131447-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911163613.1131447-1-ben.horgan@arm.com>
References: <20260911163613.1131447-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resctrl rounds up the percentage value of the MBA based on the bw_gran. As
MPAM uses a binary fixed point fraction format for MBA rather than a
decimal percentage, this introduces rounding errors.

Without this additional rounding, if the user reads the value in an MB
schema and then writes it back to the schema, the value in hardware won't
change. However, with this additional rounding, this guarantee is broken
for systems with mbw_wd < 7.

resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
to specify the conversion resctrl does to the user-provided bandwidth
value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
conversion.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since v3:
Parameter order switch (Reinette)
Add Reinette's R-b

Changes since v4:
Add missing tearoff divider, ---
---
 drivers/resctrl/mpam_resctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..f2c651e9f6ea 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -148,6 +148,11 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 	return mpam_resctrl_controls[rid].cdp_enabled;
 }
 
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return val;
+}
+
 /**
  * resctrl_reset_task_closids() - Reset the PARTID/PMG values for all tasks.
  *
-- 
2.43.0

