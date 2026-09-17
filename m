Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E683D6CA5;
	Thu, 17 Sep 2026 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626533; cv=none; b=q89t+ew3dKaGHfHwym5E/y50Gqx8oEs6kwmlWAtHGji7j88c0bPQyv0vC2eCjOtmJBn7HBDnQXxllviCfYZQqiA/7h6NIncemKYNLJWMDIxIBybvK3chlvVofRi9q+gHesmDN9BzXIvS5zegu8LjztcfUhaMvcm39QUi7z1Hpq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626533; c=relaxed/simple;
	bh=HkFyXU3GrMDWZj6lwB6sbWO20HmdluEGTiSCcMBCJNo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=H49NS/VKLurXTeCN9p/0ezium3338b3sKhSHm0RddeM6ZZyOwH89FlVCYDkJ90LBjxDiLjdhcK59Zq40Ip4ODAcLV7sPDBjBdSWzRv3UiZ2R1DgTALaYiZLO5xUCtdHXow0wYdy5h6+gwiVTpaTGs4AVDU8cL0wMRIim/HWtiqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=n8YBQ2T1; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="n8YBQ2T1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789626522; bh=j1Fc/4Xsm/exGsgjT4jGufeye/rOfxrIgfcyhzDzAv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n8YBQ2T1zmFJmdXH/wru77u6hQebL9D21U/9I7LEWEFaG4rPDcjHorjh/ltp3+1q6
	 TTQ/3yWBAiJnTiZBFXJoB0C4sJdMRbuvskur4arHliuUig1pKHqwyJ7ZhbIzSzCHZz
	 tJZVHf/E1spjRkFnNxvKT6hhOE+JEpGQRIGtQM50=
Received: from XJSH01426.meizu.com ([61.169.203.203])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 7262065D; Thu, 17 Sep 2026 14:28:38 +0800
X-QQ-mid: xmsmtpt1789626520t2vfn56qc
Message-ID: <tencent_62C49AF2843B909A8921AF72E353C908C00A@qq.com>
X-QQ-XMAILINFO: NnIX2CK8LSsJSVv29wQgHAy3mjeTKyyLNrjsFOm2tcGfFnY35TSZrfhNMik1y5
	 mcl3YyXk56dU/CeWaKEKTUh3auuvLdjdQDF9VDIpxakjAIR74vgzMdp4N7cax4KNQJHCP0csITWT
	 yGpyewC5wUen4jKBMvButPsz745NJvr1HUNYW1z+OfFNkENAYsXs2vkM4U/Io1lWEDV3yeElmqDc
	 3AsUokAPyP5lEvoBymnVx2X2zx7Tq70WQKVcB+TH3uL1xfq9k/WG5TflvD57+QepYTLo2QF7270X
	 USjBcG1XPXHFhOGIlOzFDHHjQh5KxxoTJ7Hfc+DYs1sUsTCapw4npYx2nkxmkbo6b0NcwVZG9KGQ
	 +WTzz/+deLUk6jbiOhNMVnl1h7NFIyZ6InnDHWo5iKksjX2W9mAvp7wEBO1+VwUjh559xUmMQLdS
	 D+SG0ghon8+dm7g9nHGT7eFDW21uH6E7XZoqV0hlvKNlNa4QH0g6bPx8e6OWdjIJ/mKeDyU4WdQf
	 2/Q0I11wJLGllqqyfAuxUzvprNd4a6ZLFbTmBBMMjAe6Mm9c9OmAEodpqFPm4gp5IFW0lflpihCK
	 26GXTA1VotvAQl9g6gQ5beKlGhoVx0guwh19g32rSpaP2mwmWtawjRXkecQPkqrVETllCUPa4/hK
	 Pw1G2aIgRiV8DBF+xX4Tfg57aLHu6wSjV7H0TpuRsgQoAqRh4gw5poqrkpdaKvkcHoyeHz0vNCpH
	 vN8YQfUcOB+yYAl4Nnr9zmBPONueH/55hlBNGDJp0He9dAVFXEn5uy/xQwSDLLhl2brzA+QP5fDZ
	 sRG7SfgYI3y4J7mI7L+s0R7B/lxCcsV4yk9xP9iH7U9Vky3Sqt0BSJnmV1QuOtAMmc0tFN2G7lsC
	 Cuaaod1CBp5EhxfhSE/jM3Jl6kT1i3THYgstkJkietQvH/wszR0YGpOnykNnyKzvv5eP/fEMGaLQ
	 a4bDhkxfdlycyIKrKd6bMS8xeUG19vneLNXZdpx/mgO0uyeCGPNSCjHxfE6jyOVgmNHu4wZYVRT/
	 IL50PGNIMv2wXpPkBD1j0/pjagPpRmwxjlALj9c/o6ffkwhJ/jWrD1CJMg0HLuFa8VFtGM4E9QbN
	 PDeU6Un2rVsmlDtZ6TtSvJLNIgkA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-parisc@vger.kernel.org,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hugetlb: report cmdline parameters recorded too late
Date: Thu, 17 Sep 2026 14:28:37 +0800
X-OQ-MSGID: <20260917062837.558251-3-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917062837.558251-1-zhenghui.hao@qq.com>
References: <20260917062837.558251-1-zhenghui.hao@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hugetlb command line parameters are recorded by the early_param()
handlers registered through hugetlb_early_param() and consumed later by
hugetlb_parse_params(), which is called from hugetlb_bootmem_alloc().

Since commit d49004c5f0c1 ("arch, mm: consolidate initialization of nodes,
zones and memory map") that consumer runs from mm_core_init_early(),
which is called before the generic parse_early_param() in start_kernel().

On architectures that do not call parse_early_param() from setup_arch(),
such as parisc, the parameters are recorded only after they have been
consumed, so they are dropped without any diagnostics: do_early_param()
stays quiet because the handlers return 0, and obsolete_checksetup()
treats early parameters as already handled.

Warn in that case instead of dropping the parameter silently.
Returning non-zero from the wrapper would also work, but it makes
do_early_param() print "Malformed early option", which points at the
command line instead of at the ordering problem, so print an accurate
message and return 0.

The check cannot produce false positives: the wrappers are reachable
only from do_early_param(), and hugetlb_parse_params() is called exactly
once, so once hugetlb_cmdline_consumed is set, any further recording is
by construction too late to be honored.

Not tested on parisc hardware.

Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>
---
 mm/hugetlb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6..bda8af614a70 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -91,12 +91,24 @@ static char hstate_cmdline_buf[COMMAND_LINE_SIZE] __initdata;
 static int hstate_cmdline_index __initdata;
 static struct hugetlb_cmdline hugetlb_params[HUGE_MAX_CMDLINE_ARGS] __initdata;
 static int hugetlb_param_index __initdata;
+/*
+ * Set once hugetlb_bootmem_alloc() has consumed the recorded parameters.
+ * A parameter recorded after that point can never be honored, so report it
+ * instead of dropping it silently.  This happens if an architecture calls
+ * parse_early_param() only after mm_core_init_early().
+ */
+static bool hugetlb_cmdline_consumed __initdata;
 static __init int hugetlb_add_param(char *s, int (*setup)(char *val));
 static __init void hugetlb_parse_params(void);
 
 #define hugetlb_early_param(str, func) \
 static __init int func##args(char *s) \
 { \
+	if (hugetlb_cmdline_consumed) { \
+		pr_warn("HugeTLB: %s=%s recorded too late to be honored, ignoring\n", \
+			str, s ?: ""); \
+		return 0; \
+	} \
 	return hugetlb_add_param(s, func); \
 } \
 early_param(str, func##args)
@@ -4491,6 +4503,8 @@ void __init hugetlb_bootmem_alloc(void)
 		INIT_LIST_HEAD(&huge_boot_pages[i]);
 
 	hugetlb_parse_params();
+	/* Anything recorded from here on can no longer be honored. */
+	hugetlb_cmdline_consumed = true;
 
 	for_each_hstate(h) {
 		h->next_nid_to_alloc = first_online_node;
-- 
2.53.0

