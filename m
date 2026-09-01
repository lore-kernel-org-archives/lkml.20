Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE9A4756C5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277855; cv=none; b=KvjRqRqeF6Ijywy2irApo4YQk92Qv3LduKjEFxvkM8GpKfKokXAcL5+RuP7lPdXdKjUlRCDEXF19naHFWVszlJkkyzP+/17Cv4qh5hllWaXoLqZ3y9zzwmR2djD31r3huGPUylDN32ttUVyYD7xdCBY26kHHsNxbYvPmatRTI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277855; c=relaxed/simple;
	bh=WkH+G/IUZp196pivH/ywUdqvfOgTYjp4BOOTiZwqrtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLSBKv3gWxbAmxTjr9NEOM+vOhl5mge7NTMCgBu3Y9KG4pvihdIUhQGRFOfb3wPg3V6Dk/jLNC5v43j2vLECCQ8C8c68eB1IYVCuqAF1maqcHiU2QmSKEczdYRqcF/5HW5ex3ljT+ZW+ROQWaM3PWTCRrhlMjRWfDZ6yPoJLpkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SV8TAAcw; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SV8TAAcw"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8588583a7c3so786457b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277853; x=1788882653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBtC5RPylpY3M2iD/VpMaHKlBH2De20pZFAz1D2ARpw=;
        b=SV8TAAcwbt1JyajovWM5jxGuCdnCX9M8YAEF3tMWBSUAn2EuUvVx9R0WgJzabzg4vf
         47SsBqNbPsDLL9l52GHPeR3s5lNkWRvOfrNs3XRVpiSmDMT7g/JiYfPUpExo127dvsLg
         Dew7CGSUw9RRzZc1A0AhzOHDjhBVHEtWc81M1rZJIjK2UodoisxI0tvHD6d7xrthbA7s
         nV3ZUtVMBzg+QmVJI16e5ZgF28oOjkrTsV4KwnC318xb9K0ptOCTGUndOLdP2DS5l3Kt
         mfgzktGaw3ytaudeBFHg0s5A8KLVoYjrmpKF4irRC8Yu9hGXeVop8sd0CItSly7xEHH/
         qh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277853; x=1788882653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBtC5RPylpY3M2iD/VpMaHKlBH2De20pZFAz1D2ARpw=;
        b=ngjLogUAeVrolh0ZKLFhrb7Hg63wpl5puGMuLgHKx7UuSZO9gIYS+51GR85bMZYSs+
         MqE+eki+NzDF97Zxp56oJkJC2YPZpWk9ZXHqO0whQwQdepJYgstiV+uXUhGPcT7JI1vi
         CK6HaKDm5Bomu7IFks8AoVEZ+Q3Ov9E2zlwK//m7lbJxe8l27obzOqVXWO89DTY1kSBG
         X14umfjNg1ShSPS87NBbqkrbfMIyrKRe4Ez6C5E/yASIBztlf459qOT6lBOyYi28yz3U
         JAFILF2FFnr5nH1GnHejrKDA6HNfdmCVbFl/mylKqTffZ15DW/wr4470GkMwvSDyCml8
         VTXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQBEnRZCmhOFVo4//JEMPD6MsMhtDMpRlUGAT6u2UHRjIphLhfBkkfZ33pJAexrKwiC/jl1UrWTDW1R/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nYfcp4QZj1gScuQd+f8s1XSbnLEV+WpzFNeOCig/E7IIIHU5oA
	I76arQ6oLJ68hVZNekuxVaXgGE7FWJPIOnsxeyvKnDQ4FBiW0rwkycCQ
X-Gm-Gg: AYBFou0rFulkSe3ZZqdOHBKFU8ruWJ2ZTgxjT+pU2Flzt5MXvwzf3h69YqMY5GlygWz
	alIqYJRg1L/qEHcA2MDPJUxa9E32AxwjAFnAb+U9pD+m0bFRV3Hvit9PZrUoKFq+tQCZrNdtTSF
	C4n4sdu2dnPt2ObG52Hhvy0Gm6sZ+Erq8iLh+K+hZdbVqDcJsX+ojpV7C4/JNRcLg0NbhAHiLEN
	Xw60lWMtQfT544H2UkbJAYv9MQXGPIeqD0cSxgAXdGkDoII4/zQWJGQdmOewrO2sMMDiOWnp/A/
	FrFYA1ac08nIYci9n+w8BkSchoXD4fiDKRaTnNRnE9RBftQ0bbqMcZFTi9GU4T8Ogy+N8XDQ98k
	Asn2U1OQiv/vs1GjUQnPgp8/txM8ZnG0PzQ2xh6sS2SOsrsJgpFeU2DLnqLFC5OSDa8seHCabCi
	HfmIh+dCuB1ev7HXNfoUlSWlnCRmyKB68OkG1Vy7rwshCvcFXPq310AJRAsTE37jLh+9FaQr87X
	/R7H+wfASl9+pmUDTVgNqqwCf7DWcRSK4nnd4Js
X-Received: by 2002:a05:690c:e159:20b0:855:37f6:a73f with SMTP id 00721157ae682-85d69f00d89mr105545497b3.13.1788277852848;
        Tue, 01 Sep 2026 08:50:52 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146dcsm76899877b3.23.2026.09.01.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:51 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/24] alpha: select HAVE_DEBUG_KMEMLEAK
Date: Tue,  1 Sep 2026 11:50:18 -0400
Message-ID: <906b726c2f6a84b55365dd78ceb899e2559b76b6.1788277742.git.mattst88@gmail.com>
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

Kmemleak needs no architecture support beyond the standard linker script
symbols for the data and bss sections, which Alpha already provides, and
a scan of the kernel stacks, which is done generically.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index a6024590ea6e..a435b71203f0 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -17,6 +17,7 @@ config ALPHA
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
-- 
2.54.0

