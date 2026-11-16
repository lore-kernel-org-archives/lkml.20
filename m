Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848913;
	b=TmM7nwhb0J75qtY5IwZZQBFUvE2XE4rXxMxvfwjvmOXqV95e6VKsJYHdeZySOK8FZv5I
	 biRXL1TMSjnBa676QM/ggd9pn6w3DiHTSVxITSakyKLGv5tBe/UXcQ9vd2UPt3jwlbMDj
	 6ZUzy8UEPP0kspijYECfkvUHdNBBZNPKxmlkqKxN2R3cu/czL7Bbj/GKOwvDUwKgn9NBI
	 rCbXdW5NgTWqjQHVTC8QoX6DAU6zEUFfZdbbjctIJLMbS/0JBAfIyCrqPJKtqZOgBpHBi
	 2IQwOx4fSLa1I3N/LHaT2IRFYuS8PrcxXWf7J3EONcX5G2tIPJmU/S28lvodtEd4IPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
	b=YyY0N2YYVVhA81YVbN7emj1gxRrhO7BvFK9YhUILt/ewh6BHb2djM8ucxKIxuKgRcc8t
	 vnTaU2WKx1ZPzvRt6vCbPYH1VAwbwJEluGjahp+VSMbsIMpr87p22uStpjve9c6kr2fcS
	 VGox48RiLDTM1XMojiJ/iBvYD6T2OOAahjegHm/7FM3uSSpj8puCxEXVMqsEXnoSMLUeM
	 qwSjC35c65JHIAT1o/9xeme5kIldIdm3CDJMyYeRLgwWWNMRdV4pkuGC88J0TC6Cx8Yl3
	 l/Vs5hYsqKdgLw0if5uTPSHUKBc0DSJCjhf5oCcFVqu3lX+1nBcKD1R4+mUHAGLPMOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1qMnY03;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1568D606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1568D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1qMnY03
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3168668a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848911; x=1795453711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
        b=L1qMnY03Cohr9avzf3alnbU9oF81cvPelaelzXsdJU57b/M3KynObOwltBSpAiwq7F
         TQHW7QMJBGb+Tr2wjt1Bo7GL6xfgoF48Xjby1+7fi9Hl3r+nu/zXP43oca961UXivSXW
         euip5H3W8JVyR+wnX8QY0gMIrOdEaCt6K3LSYJ2TmhPuzvBvChWf6hOboHIwV6UkAxKU
         9tIGUzGoYK7GnOtJpjVlqBrKiMydecfhEEQ5E2WrFe/gyhuIGB52tWgL791FnkvWUzMU
         lIRzQWPXG2lAiVIHDzFp26JZ3d3gx4vDb+ckXYTGJ0betAFGqBK2hNNtqMcMyxW0fsCz
         uDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848911; x=1795453711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
        b=iFFoE/fnmHbMNYt3AZvUiPfIK71YC+o7QBF1ubPrLBpJTFNzwCV81xeaizuCQvxhDB
         ZxGRxCePUEJhLACsvFMipaDyHJTBL1tGGbVRDCYIuEtafP2GBX3cFqX/NAaP5azVIjR+
         EynMeCcOKEMyq9VZe1gF1u4+C/9ACl7no0w3N+qR8O+G6tsg3Wu9qZOATvDULM3U3iHR
         eHqYDbhe2WveFoaPXTSUQuotJfdrLlzJbkEusMnQzMuiB4awPK814PKBcIq2XYiIWcLE
         4HjOrBCA2gWzS26XBcQ4mNMgNLNjgHZ8RTwQ9xhLGYJIiOgULCvmJgrN+Ekce+e2uuhS
         4daQ==
X-Forwarded-Encrypted: i=1; AL+hErH3bRDH9RTeVFycxK22SFVe1Zc6qrJaVoOWOGgNo7htnR50zcK3mRCrRVhXPa4Y4gdCNjmJG/6LFgChY2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H2IfGLU+ZTL6WRYMwQNMDH8AZKOMfNHvd+Jb+3nuMooDCrUoG
	oaZEdfvP6sRwg2LYHUzumxw6J/aunvZp/ckNVD0eo2FuI8LUzCwO/3eeea53U00F
X-Gm-Gg: AZFdTZcHnUBMIotkMqHeJVFOeJn508RT/wPp46bdvNzB7X/qsOxR0zYr1+S5jbJm7Ly
	q24jsLb2vKldbxcVSWhzbKqGBMW2X6Wgm3sutDbgGsQjKFZR++doockU7zFMJR8vweIZnZD3/Uz
	i44uBg9+L+lc6z/jiPxB7e9xFkQ3Cn9uP4rv4NI3HoLjhSV9tGjwhI3+M7EcZd6mRU2OLB/ZrFE
	hqwlXcZ5Rtj7oZNuzY96alLgPSZ2ipgyi7O0qPdOn3mZBpaT69NSt+sxqtCMXAQw/2xRozRk5M4
	qhHXg3/9r5wHu8VdesdzEnTVEqzmKuXT+q7K8b4T3Zu+952oBw1LMLWvs2gol+rYPvlKgF7h+Sr
	M3vRA2sPa7CaklIUgRvjoTL1EMCUEoEvQXR2SnEsO6DSIAHWFsqNIvPYErU+D5Smfmb78J+1nU4
	OqwZRlXnLuBLIF4St2obs1U+xOCiC/0mdM+N1yfgYIIJe7NySdzxntz3YgoLIBehqKOuV5/uuaJ
	VZGDU71szAdFybrq4cOKhBMelesn3FafyEIy7Gh5z6SEweClaFNe8RUEB52bxHFvebm+Qe5gcCp
	shBKNL8InX/tdTUgjo0oXMj7Z9emBZ4AN0Vn+xpgkrq1V66RFA3nEA0gAGUIC/4RkDB4ebKfCg=
	=
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr10390370a91.44.1794848911208;
        Mon, 16 Nov 2026 09:08:31 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:30 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 0/3] media: atomisp: remove unused functions
Date: Mon, 16 Nov 2026 17:08:10 +0000
Message-ID: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These three functions have no callers anywhere in the tree. Remove
each unused function along with its declaration and the now-stale
leading comment that described it.

Found via a tree-wide search for functions whose name appears only in
their definition and prototype, and compile-tested under allmodconfig.

Changes since v1:
- Also remove the now-stale leading comments that described each removed
  function; v1 deleted the functions but left those comments dangling
  above unrelated code. (Dan Carpenter, Andy Shevchenko)

v1: https://lore.kernel.org/all/20261116114250.6587-1-chaulagainavishek14@gmail.com/

Avishek Chaulagain (3):
  media: atomisp: Remove unused any_virq_signal()
  media: atomisp: Remove unused get_sp_code_addr()
  media: atomisp: Remove unused hmm_flush()

 drivers/staging/media/atomisp/include/hmm/hmm.h           | 1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 6 ------
 drivers/staging/media/atomisp/pci/hmm/hmm.c               | 6 ------
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h  | 3 ---
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 5 -----
 6 files changed, 29 deletions(-)

-- 
2.43.0

