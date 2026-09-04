Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2667946F484
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518208; cv=none; b=pDTdXlXhUMpQGyfEMJ48yHMnGbsjaPJo972cUTRMBzWb/fQMI1OyakoWVXhHeBAxJltvst7w9+m4ldbpXb8r4F8QFONJxjDbpcOP0RR7KVFAvU3Z1WIwFkkw3TLkJObNoG5nI/o3wMUksi/lY9RtQZnwYcJVHWhejc00h17R9a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518208; c=relaxed/simple;
	bh=qFJWK4XlalipjZWdxFyEk9dVKmNr941TrXMsOpAVKvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AnUX3bJWmsO44QlOBgnYSAAXsbX2SDZQqlKq4LmPXNP0T2HOQb0tWRO8OIJXwoxaCryiva16AL4JHkkvN1L+pdw3v7b/UdECa2zNR4z3zjWWhbz7iwBnpoD87lF+ccnngcPA3n2oKjEg3PB9agwcbuAPBjRrSJ7bExayoCv3WkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq/jz3/c; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq/jz3/c"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39682983a0fso893286a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518206; x=1789123006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+9a8VqO2XLAPjwxvJ5EY/XQQ3jRr5YygAEnq28UsF8=;
        b=Aq/jz3/c/krLpIcklkQDey8jkto1qkOpH6B1CtuWICfVmiva5a3LRytIfmz3StTvZP
         q0qKUdiVM7IbzfWoq3UChoEO5sqXbIb6eYjG/yTUoSKuPPctUV+yq/w8GRr2nIGognM3
         kk7j33vK+l9tNiU/h65tMd3XJYoVfD9XlehDY9TFz17e6i4UWXPy9DW3JaUMtJOH9Xcf
         bJgpPTS32Dnrfylje4kU5SSK7FDZwG0v0uh4zOgXSRYN2uxjmlPr9RisWcl7iH97lAIY
         uPY4FLrgLpygUbyiVDKjg3IebVrIAWAi7oF9lS2BIHAT3KRnD+lndaCr5EiHPSEnJXtJ
         RGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518206; x=1789123006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+9a8VqO2XLAPjwxvJ5EY/XQQ3jRr5YygAEnq28UsF8=;
        b=mx6y8hb/WJD/ip3uVAtzAkILgsHWsPfcv6E0lia6FE0Y0JAiQd50QHB0NBhICTEmif
         PdjF5//P16u/sbOm7IJGR2a/7zFULCH+E0eKJGLsVYs7wqN2TxYWbLAyq6nXxH+Eab6y
         HyqhAMxquPN65/NlNk1vF+ENwUTKx8EyqCJVVUpAuerc/warBnjKuQ991fvUF2zHdiuU
         I+I0wblTEM5yVNudTQeSIUkN9y+s6Aej1LBEIzKDUyXBZkysLU6QJEr342/qUBpBfAbD
         wcc4h7FchSSG//mWqYv47v4to/dBwgSBSSRBAhn61ypmNoJQcM+I6oVPT+RJBs512tF5
         Wi/w==
X-Gm-Message-State: AFuF++k43ttSbYMZeIf43mPHPSbx3mXYXJO+PmHQoQzVuf/M42rR22j7
	jx6oHPhN6j26xXe7O6hfBQ2h9KkfQUzlnbPLx6M+lRdh3dueiTxKiDE7VRrQYUo7
X-Gm-Gg: AYBFou1TOI7LVsgh5QF0RbVXFmc43C92NaSYa55YVL6PpjIgGdjhiKfn3jTM33X8Kg3
	G+3/guUtEnTwdfTgf7jU9JCaLdh+Kkdhkmt1+/CvD7S9hzifYLX5ISb0S/MJRFnSSLyTUFrZcWr
	Sngfr6V28qi0Iu6nSaeTXl2IuIS6ZShldW4bzLAAnA0mtylceX55ddOtqj9kPjNk3H7JuavrTEe
	rxCF92BdaroyVaV7KcX3Vcu78EejTc0zTqzRHKJaZsjN+xIpzzOFYMJvOYrruOs8xZz9UZcH9re
	yVwhtHVxWYfCJTwJQw8WwyRA96t2Uh9Cn2GRFugroyzNd4MrszY6KKq6KZSx6jbB9No31XoGFTb
	nCxyN66NcPXxbvlMPK/f8JBfttMuOfuKk3kCOEj9cHoJnI3XldvNXvSUsupdhTeJgSykklwA4Yg
	xyl7PjHXY7SGLTKAXrm1ZYpjyQpuUYKmi7ppMdlGU0JNgkekkMaAQSsJmYXIUezYxzWhCyW/daz
	HmMS6PcmfF6t9M=
X-Received: by 2002:a17:90b:3b46:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39b2620a2ecmr7198992a91.17.1788518206169;
        Fri, 04 Sep 2026 03:36:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm3577976eec.17.2026.09.04.03.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:36:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	x86@kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] resctrl: fix typo "migrateable" in comments
Date: Fri,  4 Sep 2026 16:06:05 +0530
Message-ID: <20260904103606.4852-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "migrateable" to "migratable", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/resctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index dd09c2ce9a0f..c67652eec39b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -547,7 +547,7 @@ void resctrl_arch_pre_mount(void);
  *
  * Some architectures need to sleep when first programming some of the counters.
  * (specifically: arm64's MPAM cache occupancy counters can return 'not ready'
- *  for a short period of time). Call from a non-migrateable process context on
+ *  for a short period of time). Call from a non-migratable process context on
  * a CPU that belongs to domain @d. e.g. use smp_call_on_cpu() or
  * schedule_work_on(). This function can be called with interrupts masked,
  * e.g. using smp_call_function_any(), but may consistently return an error.
@@ -658,7 +658,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
  * @val:	Result of the counter read in bytes.
  *
  * Called on a CPU that belongs to domain @d when "mbm_event" mode is enabled.
- * Called from a non-migrateable process context via smp_call_on_cpu() unless all
+ * Called from a non-migratable process context via smp_call_on_cpu() unless all
  * CPUs are nohz_full, in which case it is called via IPI (smp_call_function_any()).
  *
  * Return:
-- 
2.48.1

