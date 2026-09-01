Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A73743F4BF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277864; cv=none; b=TKVO8gVugJC0RMgGpFy4UTIcGdgp7133xjVduNxdMVsFnoVXJnmUTzzSSvWE2xnvuPagt/X8g2MH2bRB55gFOCLOhIQlYDzAzJeFuNMPDWoGpmrUkAYwuDFwnRzlBNZ3vFIyuUSVmJDTXuOwOkOndKCctR4CIBHHePZcbsc7UDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277864; c=relaxed/simple;
	bh=ooUyUDyEY9urQKmPXtQbNfBaknArlp01QEzHC8ogxlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0rbza8UlRXyhQxMZHEgd+8tPstwI7Cqxsx+c5TN0eMmcaHs75Ug5e2i3iDu0FzkzLjeldyTpqjHYgKFHy7MYIYDwv10vNkFmMazpd09CWaOC8wS+5thabAdVNHlaec6jD99hrEAqX3sCZ/TzuTlY0masnFW0NGq9+7Dgj+DgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi5fYDbi; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi5fYDbi"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-86a29a48ed9so838497b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277862; x=1788882662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMwbRDzP9YKrcfjXPIte/jx760DDuwwcQ/UTIZn7k3A=;
        b=Vi5fYDbik4JTIZQh4D5zElIBQgFkvJKBz9u/xcLLjgiZzWkiQ89xDv549qcvmbJNqF
         dJEBJa4Zfn9n/4aLyl3M3sr1DLegQaMqQ7ohSx9y2ke9qMyH2bgIMomc1YR8XzkuvE/c
         gVSqkzS+CgdaY5QBSHHOejOyteSTUC8f0qmJRBuLA0stqXPu6BaJq5QadiENuyNNK7zm
         ME5lU+D7GcXpG7bO4CDS0D2gC6Loy6bHAllAuVnZGVkYXc9uX1jw7PIOsgZd5r+GeKOI
         TMVsQ54+QkC3ym3ngoqwfSAmg+ldELauOlp0RZlAmXHtd1tGsQi25iLevJxj5y15EnTr
         P2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277862; x=1788882662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMwbRDzP9YKrcfjXPIte/jx760DDuwwcQ/UTIZn7k3A=;
        b=BmMzjtaOQDUO9nFQ+ACEgEI4+w+GzYwzKi0fUXUbh17G0a7annFuaWw8F1i0i/x2G4
         y2mefx/nsmdv1jwaJv/qtdp9D+ZJGKpZTWuri4D9CgsS04hwtQydOTjhxLhRsmqcuxQe
         hYtmbY9LeeAM1i9cOAPEsD2F2yVOWjIcdPptMHrOdXDPIj8+cDtfQMrrOtMEP568ZA7W
         w+rRRXrfwkc2jdaHO6ge9pnulqS6al5iDRq9vnQhBflpnFLkDIQbZtKqrV08EZF8AnYn
         /SZW4EsThQ/h8hQjJCfnAt16vHABrUqIByPo+VUrqritkwvWIMJQnMdJ2cdZ5CKYGXT7
         LWmA==
X-Forwarded-Encrypted: i=1; AKwUvBymrirvwliigvDv9ncYd4TNxYALpMnu70XPST35lFmrIFqzUEbuglyhfCNy45wS21ARqFp/NA9Cko02S8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lFi0IO8SD3HFk+vjOXK9RUCjLQoNkn+0InBBDoZWix5MbI2Aon
	In7mso1YmHr05R2VZ4OEIFQuNqe5RW2vPibUm2QpSTFA/OtpXjrVitMwG2cWAQ==
X-Gm-Gg: AYBFou3gBwykBM+3vfgPBuAYT6wVAKVBBw9D8InDLgT8nPkKWNVi6vQsDqdAhEU8Zzh
	Vnrrj8fzYS0ELOQTBiMDd92aqeF3Emd15V8icwV7Qhl/fBU2/NcydsIlEQm9LqWKvddB0lcxD6y
	SLG+yMUc7HOTYQUiPfZyvQuooYUirE9e881g7Stnv58X06cNBGvKwvONsioCBQAagJ7zK5NEvwZ
	yQylpZnWVkXHZdYybINg2OsUvZHcdufvfBTsfVFlYM450KBYlknSEk0I7AC5Ucwxd4o0WQxlrbl
	qr+e9N0Zz5mp49IxVyVmdxBinJ8d4bYHL9Kg8WqvTHxJmHz7zFdNw3xYb7uO0VDO3+DfPtV1KsM
	jt5udUc4VVdNO3KaygdvffK8y1ArlEZHKHnYDQXQwlR5zdBZC/hrLS3Vz1kjqUNK+ASx0woyvhx
	F5pjrq6Szjh8Z+d1BgFmescZtOB75WW1E9EN1N7MeWTzUSWDwt5EIsFoy2amrc06s7J5RkopMoQ
	GCDWDIJTNLhB2mxzYTye6R3BKb0OfuyloVt5Z2iLg==
X-Received: by 2002:a05:690c:12:b0:81f:2403:9e70 with SMTP id 00721157ae682-86874be3a5cmr39817697b3.19.1788277861999;
        Tue, 01 Sep 2026 08:51:01 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86326649752sm52513987b3.3.2026.09.01.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/24] alpha: select ARCH_SUPPORTS_ATOMIC_RMW
Date: Tue,  1 Sep 2026 11:50:20 -0400
Message-ID: <bb81b54cdc536e3ae12b27b477d1299bacea9577.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
provide atomic read-modify-write capability, and already selects
ARCH_HAVE_NMI_SAFE_CMPXCHG.

Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
locks rather than immediately sleeping.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index d2f9ef592f78..0655e36608cc 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -12,6 +12,7 @@ config ALPHA
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
+	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
-- 
2.54.0

