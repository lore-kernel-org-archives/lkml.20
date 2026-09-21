Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A40118DF80
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957116; cv=none; b=OuT3OGJbBy4FpZK9mShJKqz9rhOFpUxTo5nZ0NskCaUlKRyDBD0FMHjKGOdvGYLItl3IqImjAxhdR7tg08TwL5EOON9r5EZlTC0y1flYPAQUR8FB+apXxqWNjB0RXEyLIBQ7ELmXfbhYTBeqFZg+FnmIJ3+/BHroeDCTTTyzE1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957116; c=relaxed/simple;
	bh=kB6y9EOcBHzorCVkirXWvKe4pTZ7To89vLC0KK45g1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7+QlpS2tMaM7ra5T1XqtBPQGkZAwIg17dIMHqG4Di+QetF2YFDcNQ6zruF5GPuYyzfzNrsc4WCzxzzCj3pZboniUBfR8WreexmhOKaHJfl2E/GDlV6+TGpsPY5di7CuzEigzA0LfUXnY5OA0z/t3XjTWu21D2JFrJmayiiznXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOoJGRDr; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOoJGRDr"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90e9ad1a373so27299716d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957114; x=1790561914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgFIK8N+wIj6Y6BlLHg+qsRFyIfDWQy8KPcErUZxRVY=;
        b=FOoJGRDrL5uyGoEDYf9w5UF8OY9RuhDZ7pFoyc6+o4JxA4kmUrVuuTTzHGq6YKWgVk
         Vrkn/oKvhwlnQ3Mw4pMx/7LmbB9lBsI8YeNv5nyBVhh9P/kA8hfv/Vg4xLttozY11/nK
         Hwe+6D1Hcj48GW9cGyGUCMnvW62ZLX4vn2lgWl/qyp3T6jIK/keA10MUvgLA17uvyQix
         lkqnuBa7aG4NPFmLQBcSrCn+1wt2Wi0sBvtFvYD2nH1mBn+4XAQTulxc0Jmoi+XtD9ha
         ic8plIvcr1WPhhn0h+pJfj3UJJrGI3pyao2+n1RbnN+51ubcvEgo/E7hYpbbDXyWWgc5
         p3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957114; x=1790561914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgFIK8N+wIj6Y6BlLHg+qsRFyIfDWQy8KPcErUZxRVY=;
        b=XCVGN7gLmWmcUujPlL3ao0KHbjPxoy5QB6JEiusoYZcsLOMlTe0AYaZPawLYy/Kfml
         eFCNsifNjkNcXLc8QafGF+RqlGRYZkJfIbmo+Vstm7AkLXVUsBNnfMVZOSkJIuQwA2hB
         j1NBiTdJM94zQR46xIvvu9sgNOEpJvMp4T8c53rviEtV5trF552IXww6fUQv4BTgLO4p
         kLtwpVSFMCRvp6Vxgd9ygg5uhrEJe2IdvN4UZK2zWwzJBilVBRP4SXCad2UHpQ96+o7z
         VpxISsWrEAyLMXik2JgHyhQc3WryzwjBUte0iTOGEyuUR8um8my8EIYESY+lz8uecc02
         MRyg==
X-Forwarded-Encrypted: i=1; AKwUvBxsqYlbfW1QyJhBKZJewhSfvEeKMRvCy5S0foup4rWsfP4w0Xtn/Miq+38PnmG8ZFuIrduYNUN0vLBpYJo=@vger.kernel.org
X-Gm-Message-State: AFuF++n+WA2iSY5RQ6cGsy60l8u+tA8cHEo4nn958WrksmdfAA0GgI9v
	4Xj0IH0Jtk9VZaqoAyswV4aANAzX+wC9eClye4yy13L3ibAqbGhUkLn8MHNv66XOTg==
X-Gm-Gg: AYBFou07XzMho3Bxn8KyWGZ+Qyvz83PJdk99ByOCs0eUbMPx684twatPxzIDAn/lnG6
	jOQdPGmP8HbAQPPoIO4ElQXE93+Ngn6SyeEdCRhwh054h9t9uLlSzc4BlpCbzvNn3ElyOhM6T+n
	OIPBraU7NbgWnyugr8WjjyXq3nwH06lO7fUknomfen02H1XiIlEWjLXyHgq96C2aHNZdUSycuDy
	QKOgNN6YgfhOEhaYMCYdL+TsF8H7J2IBTV1rDcOwnymhukyOzCzQWNj5IUIIC6SFW8Yar4Nw5Qi
	j+Wax4LfgWKMr9SayjAWSwPEwRy5BZJcHJdHF8huE2+T50CpQrcUfZjtI2tuGJMUCa0MEiqfJYH
	nvS1QccMhHEBFXV/TWU4RVFMOO7+5HT/nwgI8xTMGE8S4krtAlmknT218ltPoLS0GsSVGi13Ofw
	EUKEsrV2RKf7zw3KOg6Cov0GIkUxlIWq7fQAx8t/4uWGdAmWe0E8JBS7cCMXrt4de1wzUkeo9OY
	lUntg/p0G3ecpR3B1Rf8IESLBqI8KA02q+3RfmSaiHSlvvrO4Xl1evBeZiXyBYhoNH2iXTWgyW9
	b4hW4exOvsTMW0bzB64cwzDdKUx+3L4iN9zqIlo=
X-Received: by 2002:ad4:5949:0:b0:912:ec8:f82e with SMTP id 6a1803df08f44-912a8005f65mr88008686d6.17.1789957113572;
        Sun, 20 Sep 2026 19:18:33 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa15cdsm56221876d6.41.2026.09.20.19.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:18:33 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	jlee@suse.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: W_Armin@gmx.de,
	krishna.chomal108@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: Remove unused platform_profile_support variables
Date: Sun, 20 Sep 2026 22:17:17 -0400
Message-ID: <20260921021720.5976-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acer-wmi, asus-wmi and hp-wmi each set a platform_profile_support flag
once their platform profile handler is registered, but none of them ever
reads it. Remove all three, one patch per driver.

Compile tested only, as these are pure dead-code removals.

v2:
 - Extend to asus-wmi and hp-wmi, one patch per driver, as requested
   by Ilpo.
 - Rebase onto review-ilpo-next.
v1: https://lore.kernel.org/r/20260902193039.21725-1-justinyvar@gmail.com

These patches were prepared with AI assistance (see the Assisted-by
trailers). I compile tested them and take responsibility for them as
signed off.

Justin Vargas (3):
  platform/x86: acer-wmi: Remove unused platform_profile_support
    variable
  platform/x86: asus-wmi: Remove unused platform_profile_support member
  platform/x86: hp-wmi: Remove unused platform_profile_support variable

 drivers/platform/x86/acer-wmi.c  | 3 ---
 drivers/platform/x86/asus-wmi.c  | 2 --
 drivers/platform/x86/hp/hp-wmi.c | 2 --
 3 files changed, 7 deletions(-)


base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.47.3

