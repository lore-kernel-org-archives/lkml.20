Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873423D3492
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978656; cv=none; b=MvZoORgDNhz4xaSLOgAEv4/xn4R9//RPTMAHMI2CqkmxvzVdtUItmFDo5kWB/mx3Zyaoe5CQojAxmj7vrdZkkmse3cuCsIToOu/LtxRClXU1AMCxTxzsG5j7VP89FqoQoYJBSat/yEVZ9iKhrxopjC8WP5KWS67du60bHJZX6AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978656; c=relaxed/simple;
	bh=dahbs9GVK7gg8jbXL2Dk1mxhMu3n1DVRUW6eW6rW2s0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmdIOejT3k4tocs4QUoBJ85xW5yoOclJd5bvV+0B8dYkAYQOTfJKkz9NAPtRi1jjqP71/WVOD1TCgx1zu82W8bZ9lmZULUfp1LgTL8tXMLfNWHPFnMcYl8A3mhcwuYszFukfTt3+49oxVZcPLD/pHoMk3KTISrubFfRN0WMelpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kx2YGVSl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kx2YGVSl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so36458975e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791978649; x=1792583449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMWzf+DecUrZEer3Y510wl+VGiVry+i5wNQvmX/011Y=;
        b=Kx2YGVSlDyUQm89GpEw+RD6c4+ySZObtfsVRQI/Go3e104yl8AUKl0EgMUg1ef4GNw
         wTJsFCiV+FZTSJg5/VUsjB7YgQn1BklqChc2y4vJJe5DjdOQU2ax5MELSLBPAKlOdaXa
         so25ytoRd7zVK0TY7wbw0Ex8itsXsCQvIWmyTSix7gvLUzvsqH6WiYnA3dIhJD0XW42G
         F9eMoXIiFx6JvqiKnVc59QXeuuX6kTEy7fqza3pVRwqobA0JzdNqPOgWTcMOo6STz5RB
         SfXhlN8EjNTK5Gq90xAr4C22tWCN0+YlP1w20+8G6vOco8xRT9pq75hbJtcsa5s4PPGS
         X1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978649; x=1792583449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMWzf+DecUrZEer3Y510wl+VGiVry+i5wNQvmX/011Y=;
        b=SxqdwDiMywi/u/Eggi+JvK+cIfES6cEFWIWWzMIBBZdmXZ0b6nx8OlXYKfvBpDh/ci
         XlBoTsfY4w5K9Wn69rIotIMRs3kaeUSf5qRYfN2fh6HI+4EjKg9ewhAN1tmuxlwxmeYB
         Ge4Qw3VRNjIvX+BrJ8OiFD8reb5SublsB5m++4wSZdBhSqUKLT5I1yn+n+K+fznrgLGJ
         SQcNtgkaJKCwcSX8LVCszmJO6jfN0DCd1cHspSWtg1bm+5sQovjHoqSz8dodfPaU07K3
         flYjpygcDnXZLyhQJ8RDadiv+SrxUiMeivrd8jomHDEImeeP2PQXhKmHH+UdkJobBreK
         0/yg==
X-Forwarded-Encrypted: i=1; AKwUvBxyBW3h2GG6AuywVcHH/uzQB4L/ULWm+fFSCY/OLh/bBQ3pimftlMvXyegGIq69lBcDB07tRDP07gP3FfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5SMLYxleynY977jh0o32nuDI/gJDNsx1gjgsPEk04QEnjIOVH
	xxP3ORnG+AF3BlBJk3I9h37EbcrMYppNir7xKofetcfSeWfDCJDMjw5gsA7xmC5pefs=
X-Gm-Gg: AYBFou0gunb1EAtty4xLa1moj/5/hHnbN1lCtE3MqRYQrVrEjZVUeJHf9QKycBGvs7b
	BiVzimGHsIYWxMYgLs7M2iIuiB9K9iDOyLCkTHpXQ8Ye82BUOSuUMQfvyjrZh2f3ucH2XAM2jhr
	XW5FA33+hfliKH9w0zbt++eUUZ0pSjka31z/gLnmQegJeXCUgtirDlKXMiQboHM90Nz5s+VwRaw
	gkGKS3IHg+pLPAQ1GZ48ahPWYzQjCckIG+4GqC5Ivxxkj8HozT1/LHLL6ry/1sYg6Jj9Heo6ANI
	KewfwTkaW6pynwomaEAmw5+viKXjUkXrxoxbAd+sm+ylCWzqbOcGFMCF7UcM1Tn3sTbNTuAE/6C
	vMP9M3zngRJh1u3/UYq1L4mxb1YCGEJc0zdBQ9ijf9GXPIyetriPyqe/pOzKKFCMRwN8c/FS2zM
	8hkGA+rGOKRoX3OTAIAWlYKBr+PuDVi79fQv4j8+01r57wr55NJj1MY0ifm42Md5baq3rCX8/G
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr301541255e9.4.1791978648448;
        Wed, 14 Oct 2026 04:50:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm348066195e9.2.2026.10.14.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:50:48 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Chris Down <chris@chrisdown.name>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH] MAINTAINERS: Make John PRINTK co-maintainer
Date: Wed, 14 Oct 2026 13:50:29 +0200
Message-ID: <20261014115029.203908-1-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

John is author of the huge rework of the printk subsystem. He has a deep
understanding of the code and great awareness of the various user
expectations. He is willing to step into the maintainer role which
will be a great help.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..5dec288729ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21848,8 +21848,8 @@ F:	scripts/Makefile.propeller
 
 PRINTK
 M:	Petr Mladek <pmladek@suse.com>
+M:	John Ogness <john.ogness@linutronix.de>
 R:	Steven Rostedt <rostedt@goodmis.org>
-R:	John Ogness <john.ogness@linutronix.de>
 R:	Sergey Senozhatsky <senozhatsky@chromium.org>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
-- 
2.56.0

