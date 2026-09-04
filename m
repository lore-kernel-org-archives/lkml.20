Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A581C48122F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519252; cv=none; b=WlA1HfDNjfFv4ufimeCgQty8yrgvlIX8VMFOOU0sKgeLOQs5d1JSS1HJEwfkQs6w0hAD+wr2nhTdErHukANIYJ2jkx4rkSbrXMcXo8KQnUX3Pp9WLodi7w2M7GW7KohQIAJtOABaC+V+kaxZ3K0yqopWCT+rmp0U7PONgo6156Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519252; c=relaxed/simple;
	bh=K+nQpT1yhZUexOt12JUTWZJOQGJpBiBZlBVkJEnQ3ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHJ33V2PZHpZUZLQ75wyr7ZX3yeKivBz+67t1DkRdCd/BhVsKjDni/QiS0SZ8XKT1cnhaPaX8p8Bk/JADLqhJsEY9cJ5gF6Euht1Q7wwbj/YGfCoycXVOlQWUGf4ojDIB5WqAYlCI6ClHCbtvZhYMXAYtTlzzmN9h1ZowzCWL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRppFQHZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRppFQHZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso579673a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519251; x=1789124051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWgrf7yZFJ77B58gypS+MDoL/u/LiBf8lDp/68qUMKU=;
        b=BRppFQHZCJMFKSO2SxxwzPLyBof7LnLHg3iI+p+ifiI0bOyKdCzHEHoHHRupib9+YZ
         VNit4o5TCR3WMvQhD96LIopVwVDSonQWel540pjdcgGaQBDyP80tV+J00bxn+yRsrIhC
         4TxnhMlLJlbHVsTYext5VpalNgjiEm/R+iWnkSprofFWBe+ay9ssy2S1n4JfHCmYKV0A
         tUgzhoeO2M2qyJEYnEshz2wYNH547IPjna8OKvB5BBNJwQSJwOfqeodWN2O0gIbsXH4K
         IJaXyHIS7t/n6NfLw9msjUk6LKEwoQwz+n2p6xZRB3y4h+/W9RNtqWjQ0lzrq4z5z7fz
         KDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519251; x=1789124051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWgrf7yZFJ77B58gypS+MDoL/u/LiBf8lDp/68qUMKU=;
        b=jm81/kgessSNQBF5Gp37R3wgHUKi/5OlSUZQHfoCZ8huiiUg3KsqRx4RLJIsTNFCMd
         6dZ40L+z5+gSYOkcv+IN8ef9ebrU/FQBbuqpVjfE05ZTDnEtMAYBw2/b/xlRIeJzO+5d
         JkEMIwv4E6xWEyw0np1FfEpPxvLLfoY2m+XPT7N7OdkT7ODzlZT4yzNL2z7xdWuL9lw4
         Z/teE5+NRN7MSPbbezGz5i+MgkJZQHFaRiaU7IvnLj2L6KJDtQDLUDeD1VHwzQbBsecT
         +aq0wyWxlrVJS9pAAaENGlQlw8yMv10JrAQYrAa2zwi+Fl2GcHr658DTf0RkbG/+Iy3P
         6YTg==
X-Gm-Message-State: AFuF++n+Z0Wqn7ziaF+WLzWICrc2tL1HjuO3BfyOGQeBdilgP32WzCe7
	jnuOP88fyl9WufUvbwEXJUI4GOVLlVtlIOzAiLIB2FD1o/9VqkDKT+cq9zYfwVgI
X-Gm-Gg: AYBFou2PBR5K4CMCwkakSAgi9B3weyd1tRMGcE64Ca08FN33uYP9KFDktQvyP5ZAtYu
	aZ1/uh4uswKXaoU6qcS+aPInHrCOB+SfQfMglwpmPZRQCuZNW7Qoo/0nkRXdwGiudkiZVw/hux+
	tpQInH3LFe8jYfRXRRhSogF5YVCEOIWSGHeEhqWWrgO75BFGhp9aGlagqj6mAl9f1qG1oFc0cEq
	iOeY7z6g06GHPd2T/3VjJYqi6ZyjVAiLPQf7x7CZ8kK+iYPb2Eff8z2tBHywXj5oFEB4/z34pr/
	OtqtRMUmy1fd4DE7YWVMmMlw2gWizYiSP0Tz07NVY/gdHq21KARQQkb9CCXDjxaNzceVIwlWbXu
	/mzVgwiO047SJzwK44KYOKJ8xQhx5VVW2XUXCCuLxBUDiKS6lWMXjjILxUGiO1ecEebXgRJukbQ
	Qa+J3S+Sdbu58uopF77UTUntc7EnxYZzTOlQUMiN6oygyfw0Rs7G7XfTnIqBYPhpSZLV+gTGY6B
	kTL4AiKYdkibDI=
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr8201848a91.3.1788519250840;
        Fri, 04 Sep 2026 03:54:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5136836eec.9.2026.09.04.03.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:54:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] stmmac: fix typo "platfrom" in comment
Date: Fri,  4 Sep 2026 16:24:04 +0530
Message-ID: <20260904105406.34530-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "platfrom" to "Platform", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/stmmac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4430b967abde..205216473ae3 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -81,7 +81,7 @@
 struct clk;
 struct stmmac_priv;
 
-/* Platfrom data for platform device structure's platform_data field */
+/* Platform data for platform device structure's platform_data field */
 
 struct stmmac_mdio_bus_data {
 	u32 phy_mask;
-- 
2.48.1

