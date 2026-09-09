Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CDF35C1AE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973532; cv=none; b=hHtIUcAKLAIhtHq2ybh3ocdZJo8v9cZKqRdohYxW/fmXrYDlGKjOrFfwBfeKHE235xfFREfbMH8sqgnPXsjYyKiA+8MJWMhg+q8JVgA0YzN23Mq+lPf7lBGJ8Oyseasliew8CoiBHsWkreVb2zxSEjQHMZ+ErVgWkOH4tpnPbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973532; c=relaxed/simple;
	bh=lW2baFvdOp8T8qIYmYG510KFhnL7nWjspdl9Q2bQKTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDWVBJkAtprj7YIlOMh8EyZSvhcS0ZCoX5F/GnJl5DXdqKqfCLf6Gc9W6kZkq3S1dxvCD1jijNjNYLtHzynLBjWcv556CuuUU2UBEuM4hUF50K88ALEq+HrbavNS3H/+BXttxCUWdp2hVziKQCmhfppt2sYCO0/+1IcOQ8UxdBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niwGUIYc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niwGUIYc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so37643255e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788973527; x=1789578327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxdZRvXz8X1My70IJ3RwMner0dA2d2QTLo+O2qcpmmE=;
        b=niwGUIYc7zRKRwOCFQViPVK/AaddsSLpmoQQIIJojBI0R59va5aaoXZq6FHAFoWY+o
         Ro6XD2OhjQKrFUkoTjE2OjvAk7SWP3WBGcWnIvbB05sMTSpKrXL+iqU+C14CgE1KKW/a
         5sz/XF3H8kDYW7UrtPKjNbbUfCN3iHNxDS24fBvzCR48T3GPYICNXAp2w4B7aB2DggOJ
         urB2tJRybQyZ6YijKWLfSGN3mvCA+6WiKnXvIUOEjIsSnIyYz82gQYp4wbQUORGET/pm
         Q1KA9m/0KuaBfqvBAUcypW+8z2ljzAe9tjULHDMSVYybcc7fi46ayhbLAEsGsBIz1vTp
         zqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973527; x=1789578327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxdZRvXz8X1My70IJ3RwMner0dA2d2QTLo+O2qcpmmE=;
        b=dh/eBB5nXkIeuDQ6MphPokprFKB8t87uyX2764bNaxaKGtugqgNsILUo4sCvtWkY81
         8TZHFFL1fHTdJ5kXryv1wCOU9+/FFxnqKcwEPdQUCdg2uRXp/ob6/he+vH5W8od1HqPo
         BrDdizr3JETiz0aaFVa/gbQEMDH2DxlZsfDC6dNhhphaZSebQ7pZ6eXfe6qesa1Lf4e3
         9Zx3d29KCdXtlpgYJ/AgInA3NhLB3OYUOdsWfOFnsFlS75DbNAOOqMzh2rc8KX1PfhwA
         38NRNBYL1WkCh9J6F8k4CXEnraTasy0O6Y3LOjOfu2EaK76p+5+O+ynK3spcxYpz5EyI
         eyZA==
X-Forwarded-Encrypted: i=1; AKwUvBw1pPaeNcOsYRZzYdVlXdxL49w0711Bifvw5t8tOSaOiVf9WWlRAlZWxsUeMKez11NISS9Uj1kL7zvEmFc=@vger.kernel.org
X-Gm-Message-State: AFuF++lWfaTXB0mqLhoj+V7oUtBqYsgG1R7ZF3W2F4A/wHy0nAOTVG/c
	ugJLQYGfogAge57idlmGCmyNCkmFyp4BOWXiOwBO+wwWVOT+YbuQq486
X-Gm-Gg: AYBFou2/6el6rBaIL16B/qAzE8lbzHZJDMrghIOmZZ4x/ZZv6imnUT0pD9RE19At8wM
	7mENmhYAfWRkPdNTJlzju1xyIjNKAsYO/yZMRArZGOCR0C3Qdfl4QBm3A3u2rZmsczNIm/+ePar
	8LW3/aMZ8kXkfAnjUucL8y1W6yYB2MgWVfP3qHnMPrp6/X5yLWxVn9G5Pg0OnGTpTOmqO/b4JTh
	r1mPc+CTfmbASgpEiZ2mxmrsfTcZgwNOXfU9BQTRfeZIopRDIOKlTbio5q3tFTjgACBKCARJr1j
	LLgYGogP0tbsaGtRrzMAbD0q+qqXD9ULkpHPkubTiui+vZYur5Xc/8UWoLTXGtMB2+JBTmwA978
	QEjFBZw1ZIK0peDl7UoVne2swKHghc5exxh+MYaMQG4Vyg1KAw5VT4eexbGMJFkzenKNbztdPde
	eHsxk5cAClYQPfPeXormLu9qnDAoc10ZmgGaAovZSA1IzYBvu0VfEjBRv+ylyxaiPCHNwSe9YJx
	JTxrdcRkYuqFkOTW1MzkkMWjGxQx6wbiDk7trRBv6TNcUhx640zk9JzxChSeLmMI7/73bHmKg==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr218836585e9.26.1788973526639;
        Wed, 09 Sep 2026 10:05:26 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm4719445e9.5.2026.09.09.10.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:05:25 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	pavel@kernel.org,
	akpm@linux-foundation.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] PM: sleep: only allow relevant powerpc platforms to enable PM_SLEEP_SMP
Date: Wed,  9 Sep 2026 18:05:20 +0100
Message-ID: <20260909170520.553867-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PM_SLEEP_SMP selects HOTPLUG_CPU, but on some powerpc platforms, this
creates an unmet dependency such as:

WARNING: unmet direct dependencies detected for HOTPLUG_CPU
  Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
  Selected by [y]:
  - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

because HOTPLUG_CPU is only available on powerpc platforms IBM pSeries and
PowerNV, Apple PowerMac, and Freescale Book-E.

For powerpc, let's ensure that PM_SLEEP_SMP can only be enabled on those
systems that support HOTPLUG_CPU.

Fixes: f3de4be9d5f8 ("PM: Fix dependencies of CONFIG_SUSPEND and CONFIG_HIBERNATION")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 kernel/power/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 71165e7f04f4..7cb6495ffaa0 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -146,6 +146,7 @@ config PM_SLEEP_SMP
 	def_bool y
 	depends on SMP
 	depends on ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSSIBLE
+	depends on PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE if PPC
 	depends on PM_SLEEP
 	select HOTPLUG_CPU
 
-- 
2.55.0

