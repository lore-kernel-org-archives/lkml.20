Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBC3845B0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761563; cv=none; b=io9EP1h2aBSqjiQyyrSRNpFT/Sp7wjhOWP48dqSYth7FReQ4ZXi5cg+MNQeQigcXco4+0YgxPRGnkmPbd+i+D8FjCtZCiu8b4Md2nGywhM5bNXK1nlxqx4WF/doI0X5aTWm0+bOQXRAhMVBYhmLNIyhJmjVFAMGvj00+dmdf3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761563; c=relaxed/simple;
	bh=DHIwkdhgkAJf/0MfYGm5904C9v/dnpZl9EPDAop1MWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qy1CKhcxuWbmqlFSDNP6HyQFNmzxcEnGCQUc33ZZd7DkpYNW5geehpkqfsTPBsRTJoQvZwuWtkbuMRXe2L+PxiU+FgEScXbZH7XKxdAURVil77TjAZue1Y9O+LRPXsDg21RC16ax//IRGzuBwM5g860Fb3t9VYf9RFCx49/Q/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYmD3280; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYmD3280"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso3042083a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761562; x=1789366362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArXkQqGjIY2dxeamaUlZ+Wc9qD61yWDjZ4ZprM0J/M8=;
        b=nYmD3280eUi5NZVOfDCnzmqaRNAM3PA4Tz0DQWoDbw4DotJyqLp2s9GnzA+pmKn+5H
         2h/Zn3Otg+FGtyYSXJlw6++bCSiYFTKVgol4jtc8iXP4pbgpxKnfFYqhsbsmo2GGfO+9
         thS2+KrLvZ8efspCUO9vig1xs+Kyu/FrTNvsR/i36o2bd0zivhJjLEMQH/7N8ihXcqoG
         f9WlUYG5xcdSzyEoU/p9kvS0hW5N1NvqjuFZlRJuN2IdGmHs9gG/qEYL7bRY5wdwki6L
         Pj3rK+rSqhP/cxlfJYqmP1A6op8bFAMxTAORnf7/ud86o3EdN+sJgUOyZcf22acgM/5D
         30QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761562; x=1789366362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArXkQqGjIY2dxeamaUlZ+Wc9qD61yWDjZ4ZprM0J/M8=;
        b=HtAGRUVGB8+FXAxQ+HyPUj/4uryBD2XQ2tZiAN7QdHMbh03kd36oKGJdRxl6yiTL/w
         3cgx2BtYeW8bQw6er5LaLrWO/XIHlLsptswt6J8DZesZxTzOe4qQ3aqeSSXPscy736bP
         vBrVFFXPcpY3UF2A2IPoig9+WXR29E1RyP6OvuEulLNbAGrijf7slILGFVbabL3bPkZq
         3SI4TkV7JmBCg+thjZIhOMySH/IfhyByEb4oAbAikNKEOMcgzeYSLQAAmYW1XLAWpU+r
         N2LtWT4NRyN2AahKPid6w249WkfXsGOWut2o6jagU641ZsLaSSjutakMAr+zSfFfk6Yy
         vsZA==
X-Forwarded-Encrypted: i=1; AKwUvBxHNdxiclBCvh/WClc4ElJV/3gqOcXs43pjLfON0wMiTBQK4Wz08LAfIM3RSMil0HCKgDPG/iKxR4u4SbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mnzyHsZKUqnwcBm41i0TTZegzPrP/SvaECKfBWPQob9BlCXmKo
	MIruuxxpFlKjYASXfwHF9LnIJkeSttuEFT40Kd+u/Qn2ewrVTymM+4FQ5GqkuMSaHqY=
X-Gm-Gg: AYBFou1dSw0ore8uxul6ZCr7zRi1LorLtFbebum0rCmPbIWAGx/4jOnQGztBNTbczqj
	w9EAKWtMvW8JzxKI1pQ2HU1e+Xq+rj7hB/QO+JIEvk+ipmhCg2WJFIoWBN637KZ8PJ89DCjMcX0
	fUdjqAWdBzQHnNYr1H3xG9Sc7NM4GjNt0/Rxy9XYM0XZiECLkMLYGNpqzLryMIcLWw6akofJn/j
	PPuVV/ORFXDKEIM90O7u3tB4fKRzOHWijwj84QEiRK0dVDdDCcp6bVyu8DqzNhlX8uB5bvtNY6G
	OGCp27okPv8LIhJzWlqRuQeYYuUYmH6RWwbYy7+C+7rosZ2ro+Tk9re2hhw51JQVFvIIQFX7fim
	0EFutgAdUtRfWAPlW+8xS2veEWsdklbmZFf2H7OUu4qr0CJRY/ghyKoI0ZXYtN6GMSP23tfCJq9
	QJvXPIZLhuGkjbjeOoYkzw+iKbif8vnRZ5PIobSIpERUNqnmUGLJManMgwfwd79EyoliM/F9D1E
	cCmsANVEvtzvQ==
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr32720854a91.1.1788761561922;
        Sun, 06 Sep 2026 23:12:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm22673204c88.1.2026.09.06.23.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:12:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: fix typo "releated" in comment
Date: Mon,  7 Sep 2026 11:42:37 +0530
Message-ID: <20260907061237.28169-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "releated" to "related", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pmdomain/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..1a58aaf8576b 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -940,7 +940,7 @@ static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
  * genpd_power_off - Remove power from a given PM domain.
  * @genpd: PM domain to power down.
  * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
- * RPM status of the releated device is in an intermediate state, not yet turned
+ * RPM status of the related device is in an intermediate state, not yet turned
  * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
  * be RPM_SUSPENDED, while it tries to power off the PM domain.
  * @depth: nesting count for lockdep.
-- 
2.48.1

