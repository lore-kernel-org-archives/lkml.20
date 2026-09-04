Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C25372B2F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788498820; cv=none; b=Li//vDRx1wQnTgOz8uH/R9L12RV4wwAQAPoR1tDwEBrctL9+IOkBntd8uviznKqCVsk8LmAUaUYzAY+8XRhQPLck7NzX6MyVQ4YxLSbi3+uSiqDx4IdvXM9SwM8YLs3dfjumOmIbMvJtUyE4mr24YYX221uLX0YoGupZc18HhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788498820; c=relaxed/simple;
	bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYBkKAA9y9/EAFvAMRvDeDgNTbTqyF+7HH/JfIMj3A72hQJU+dOD5Xp5znNA3RGto+sleLGs47/dpHUVUu0DeQ2auQoTqNK6axLJeo4MJ11SMgASQ3vR7lUGBWHod30qhp3MU0jHm6lfVZroWwQZFnR4eo4eMi3sAsbuXUXSdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdqLAM+H; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdqLAM+H"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso549520b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788498817; x=1789103617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
        b=KdqLAM+Hjaffr8B0QumzmsydH8yhEGdjqOM6GK2yjgy0J+gbaKX8kG1D0jUUr+cRYO
         Ca6yzksLaCretBbSImL+hgRS0mjDUpA+LgjaKelRKodsI1sfmuhucFewG7v0jdJrf/l7
         zMzAejNmHuI1QEtx6gFmowdz0HuX969lQHPv/ynYAJiRnVTcRsCZ1pGI7gG3ExxDVaYN
         H3QfWpUQYPmgkUVES3wi1R5Y2iIJPnKAvoU3xUMVZLJ39vBS7o9vsqFJo3Bx8HWeIPfK
         np+4G94sVxl5df25zXb8FKMSV51GCyKNeJkXTfGDBUfJYFhfStdi8EmIAVt0oA2g2W9U
         K0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788498817; x=1789103617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bd1tWYCe/xw7dqGl1zLqdcu74EzhsWFOTCGYYlkv/3M=;
        b=FJGHafIMdutfJVJ1CX7mJabufR+TMDGcZCGhYK0SHcq5Zn097s+EnNP5hutyuHwLo2
         ebxm71/OHACfiHP89vSKZ3q61p0p7S1io6HeNgwYvvNwxcShuYNUOUL8IkeSbf7qUDqb
         DK/FuG497UosJDwRtl1VfQ3WUvLxR/Fuc8P6Ldn+g/dnQpU9GOX3ZbGp7xgG0ypW6vn0
         c3M5eee3zvQ2REdph53nJqkRainsa+oWuRoRWIa6Lzuc5m4IUO+maPjaRTSg0M7z2yqV
         3MAk76mO3kLTRa/j67Vv2K28kb/ZwfIYw/Mjwz9MfVhL4cfp/HWSMVkAQzuVthIb4c96
         b2+A==
X-Forwarded-Encrypted: i=1; AKwUvByvs5fAviTrRXegktbEp/ubWFfBDggOwDOKgtUQOy6Rs41rxd3T5jiwCLimSpUoUL0M19I/1Kp4jCDGxhc=@vger.kernel.org
X-Gm-Message-State: AFuF++nqMZ3E+D5eeSjY7bCmwdfEWvehx92O/uq/8k5i8JRI8jeiWh4u
	S49ufl044692ciHz6zBqDv5nOcWdaZbXCD8UOFZ2iSUBamp9TDNstTlL
X-Gm-Gg: AYBFou0iHxiRMfIA7TdiL4VUJCoj6PYFC5I2zYN2570MFomBPBXoq4HRUUGxxbIIzeU
	RzYSD0q4qDBmEzkoR0zz6kyfrx57BuV85juoUa7Js2IL/xLKri4NMZOOYNuTy8Be2p8NGBUYwr/
	S6E8zg1ifbYI6kuXtQM7pg2myjK/h/M1di9UNiqLVG0TMrVqm781q85Vy1kbN5rshJznIyzCArH
	JmSntchaP1cpgvaxggVQl13PpNMpaaJ88Dfmusf+e7/JrrCtC5X/Sfrolx6LmxhABh/fi7l2AME
	hCK3Q4u89U+P/TXGpPcXqwQs0bK9hzj8Z/g2OjELlYsLmWCfd35SDtwDQNV+cvQxC6IBSS2hL50
	9vsJZdsPcx9LrIpyG6MlDdQ0h62k/AjzPtMdGYMKqhjb9sEIwuJeozV5e8OPRHzdauoC9j16ygq
	VjAqop3BoMbjDaUjyvBtbiuzhqMA2w5M3Npna+vmI9gJzu2+bq8fDLaK0Xk1/yEfezPB7P+XZxD
	uSSoL5Trjkdo4NYYHLj2vMp
X-Received: by 2002:a05:6a00:4f8e:b0:84f:dd30:1890 with SMTP id d2e1a72fcca58-8616a4650cbmr4591857b3a.15.1788498817310;
        Thu, 03 Sep 2026 22:13:37 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614c699735sm747518b3a.0.2026.09.03.22.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:13:36 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: daeho43@gmail.com
Cc: daehojeong@google.com,
	jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: drop pending discard commands before reserving device alias
Date: Fri,  4 Sep 2026 13:13:30 +0800
Message-ID: <20260904051330.3804748-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903161031.1280195-1-daeho43@gmail.com>
References: <20260903161031.1280195-1-daeho43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Wenjie Qi <qiwenjie@xiaomi.com>

Thanks,
Wenjie
