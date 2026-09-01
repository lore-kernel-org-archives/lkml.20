Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA01E470E84
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277879; cv=none; b=LaFnzVQ2aIbO6g4lA2EYGziQakm1dr7ghGSALhOQuTjiS5MgJsK3doI81OGzUFJASKACmIlzyY6Ioi/Z8OcgArs0ViO18npMwTogNcyGd6QK4yedXUg17oQ+8dT9ilw1iMCXLuxNZbBQqw8qfeOj4uXS45yrSUwBPDwJsfaeoHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277879; c=relaxed/simple;
	bh=NBPXeBDdInIOjXun2P0A+EPFsy0jFFuQJAQUJqDeu+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExkizxovZZOg/su1AX4Cu+FKfH4Om0kcypgIzyqYPqrK9AoC+G495BUa7J2s9AaBYBlcfsHnQzfoUqwTZddGNRlSg9SABB1c1fj4/hpZq90Bwl6JjiNdOeWRpE2FZ5swsBnEfYkuMejX7QiZcaPG9/MwyH7TkqBxwUpHGLYiKhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtDadjOR; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtDadjOR"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66f79f58123so7298d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277877; x=1788882677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX49AT2d0GVBNA7+WDxqduEjh0MSx2zHj8wGL+l7HE8=;
        b=WtDadjORNt3S7GFwFamKHitACfnLdrzBMn8/C/Xivd6lBp5fnBd2De2UvEijEDsRpv
         kmnRtNqX59BKh/7tVjfmy1EfzKKeRSirigvSDLPKhVQWCK8EJTytgrM7MP95dY3wDqNp
         rPVvN5LN3KpS8IHL//My/WN2+PwJAE3e6cpPW8CAldBVZhmXGoznm5pA6xpKB51Gc5TV
         mf22YwGAMR1Tu2RXLi9kRKXHJk1CcYedrL3rn58/Y2JCNZf0hEWF04+FRrRp7D16/4aw
         4TaG5nJHJtXoXUgfehxvkOYpTHvkjhMKYFapife8yC8Ygb/f+JvndYHgBAjvlWZxpMp6
         C8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277877; x=1788882677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oX49AT2d0GVBNA7+WDxqduEjh0MSx2zHj8wGL+l7HE8=;
        b=QaFukIsJKOCL8Q5otW5K+l0Nq/fblN5PenM+fzyVQFGXYV9qUpO7JZQaqs3flnDPF1
         FWny2VXCksG1zIH1RyPU/P9dRsZN4xhE7PLYlR1zlRovIZlbK7rey6yzhnJ8nn913Iei
         QQ8INN5QVTVRjKPB/GIY2BCygBpFwOrWwSNqFf09nDX+1OuBk6p/uKKcB5VGH+Hcahh7
         P3tTIR5VFp881/3ra9eC7bB6vTH+/TbmXseT5A62t7rf46kArE2f1ceK+q84Y3njSPGw
         EEKmgdl4AT1LTwxVzRBDLluMmnaXfRVx5ljExUApafaYVcQLbFtEKWVJqFsyWEBgOOde
         dctQ==
X-Forwarded-Encrypted: i=1; AKwUvBz04mo+i40b0uP4FkWLgveQlUYN4hpYypyE0GVeX10+QZX3Mwr0AtVpsHLu9a6ZTBeJKxxcDeZdU2l1NS4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFOEXyMgcZGoWqt/+PMuB13NQlCyzOkVn526MZMxf0JRf3aB3J
	Edhj1fvl2J3xwC2gI2uJNZX83LJxIQspeHpcs7uGdcdKgsp0GL+65y6n
X-Gm-Gg: AYBFou2H/wvSNXmtgAvbNQfFk94/eKPFcr0FFRMzXN02cWq5DtnXslyqu2mwCwCNT9k
	2L1zy4ZIDKiOfX+aHH95/8SwgBXvlfdfBBGg0K+Wegi+tsAr/f8pgEhCrWCk1mewdhvCC9NDHer
	JAwi9auS4kd0jv3+oNHY19PCt6aOD0XUryOf9h+WyQRa4faFpVYwOveBP7smgH9qszjqTxFcRia
	nzKdfVPl+9EUd5oa+Ufq7cv7RpriXZOjnEPKLqSCjT3NCkI+y2uTVssHcIULk2OKz7ufqfm57H3
	dar75rV/eGWg1rANs3fYSXbtoU8TYoDM58hC2ouq8amOYetyPiPrAz6zkUVWo4MuYmA3YdAPz5H
	c08kaIbmpAyE2R5WSc2GwxoD/vT50N/KAc8jKIePo84JY43CAmgsEKHK/85Si4rWF6cCaf6B+9o
	QzgxiHFmIZYC0lZhXWRBsIWbEXJrwwQwRb9ZQRsUoopQPKO/e3sk8SqlGOt4hxnbLTEmwL8VYtW
	GCb2l07EgOLEkfaHhFI2i8Xg821vn9yyPnGoxhRmg==
X-Received: by 2002:a05:690e:13ca:b0:66d:b6c:985e with SMTP id 956f58d0204a3-66f875c544dmr3301327d50.35.1788277877414;
        Tue, 01 Sep 2026 08:51:17 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed39d4csm8744210d50.21.2026.09.01.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:15 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/24] alpha: select HAVE_ARCH_COMPILER_H
Date: Tue,  1 Sep 2026 11:50:23 -0400
Message-ID: <dc9ec3ff88fd895cc4daf846bdebe9ed2a58d507.1788277742.git.mattst88@gmail.com>
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

Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
which defines architecture-specific compiler intrinsics like
__kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.

Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
asm/compiler.h, making these definitions available consistently.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 00365031ea6e..6ccd03768083 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -19,6 +19,7 @@ config ALPHA
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB
-- 
2.54.0

