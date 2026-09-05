Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BBE233956
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636578; cv=none; b=KDizo8iTMAbg/d6Yw6fIKgV9G9AS6NSRqHC84WGst+PEx8/Y1ryD5yl4wOSt4HWgncG8n9GuLiceKxhgtzHG26wCrX3HGcv7PSHJA8YK4ZZDHWXMwFhmbdy0XtISYO4ey7w+CajGLaoHb2DQG0RQK04QM7R4Qmc97hU9WzvOhZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636578; c=relaxed/simple;
	bh=a0msCzSodHHUo5LvLfRIZiI9maeBlwWaS3zqrFGDqqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1v3TVAP7zG3ajgwYe8+7FAPkRGEMDRhFyQPwfojMg7P4uXX4sYFRUAYxbYMC6ns4GKauzJxt+q05+mHt/BDJfLeCk9K5wFx7r8qrLdJWOd9AYLZJR/nOY3IcQoLCArvNaC0m1PILUEFNi/k9OXULo+yS84yvFiK1N3f/sKKQgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fupXj+7q; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fupXj+7q"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-855de2d0d4dso24094067b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636573; x=1789241373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhc3iJtISB6P0hFw3z/r/ijHfuUne/Bcxaq3qoJqnI8=;
        b=fupXj+7qkqcbVpjLLJ40di41lvQUGX3VLRsMh2cRTMcUMceuJsdYW5/M7HP0lr85DP
         ftiwHzLJzBYxcvspJonYBT4Bpu5mdv6pDmkhPEeWO/qRM7bOtcwwCEdUUxu3EMQ33kW+
         +hUKcS37hKg2ocUhCQck9Ma8IhW44HVsXVg2wM9ZKMz77QdOI97RvFoBWBaY7T8Uiy30
         A44F+X6SgUANzYmj4MZ7C3mjRlbwMJXXiQCngmsOF8luB3djT0QID6OAQqt2fHO+L9yO
         bFV75LOqP8SH4MHDtM6IEhSFeC+0UI10TTQb5k1bfcSvlLTdNkg77+4JXfuQSj+Dbp4a
         f+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636573; x=1789241373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhc3iJtISB6P0hFw3z/r/ijHfuUne/Bcxaq3qoJqnI8=;
        b=mkcbGY5mQWn5HoGhfB6lTmmEOL9KfC0jprzUNrd4kUP+MVTI9u2yNz3AAO9M6/Wc5O
         VLt08Fg/tA1HwoOJN3KUmPbMx0+7IAXHCxUJfhjI4hFSisATzPmy9A4H/VvOcoo9qBjC
         YgWr8SQgeFO+LwY3gE+va6USGNviaYr2xqM+VNUEqFNjnUR8moydxG7E+HzbbFubgpS6
         tCEopetxc6YMiWtwQJBEBYucXLTP156cHpwi6bg75Bb/GjEROICpo0M9XpqwWQOy4gQC
         BHVBUrCNzFEO2mFHLkLtXInB6467V/9/lNLcLM5iI8mRb9n3jl8cTthfU2TQFPsPQmJO
         AKbA==
X-Forwarded-Encrypted: i=1; AKwUvBz4bJqmq2o+dhm+KQMwiTvOzXghTLE3Szxdt/UKp4HNR7EDv+X6D8+nzI1COu+ZQ4WhV21gIFqvEzeC70M=@vger.kernel.org
X-Gm-Message-State: AFuF++mFiRVPCpMCdE06+YNT4QKKYEXLi/Fl05CCwUVigLs/vFRXPfvd
	dOdo3TgSsnUKN0ce8VvGdrfCb3K7G9+eoi885N2C9JHt9U/eo3usyntD
X-Gm-Gg: AYBFou3OHaSvfM4J+MJuvCa+NosBKVI7+iiNI46FRmbwGLvM5IU1wZ1iAf8XpmwCJAP
	14Yi5ZFa8snekQRGL02fEk6l1OZgKVB8fltvqFPvLsHOnzDm5ktzgdFoa0Vrz6XkRKqPOfllnf9
	9J0k9J55zuZxO6yqwNJDrdU3q3M1Gs3/NaV94+pp1lFNgXRLBvwoJ+87ikeVoeSMrcfhtMplb2e
	W61dKunYc+8a92onemfdVqG0M3TdXTLrb/0JILryjgEVTzPX/+yMSXxMC2enjhShhto1D8nv3fx
	sZmPnX8r8IExhu7RM9dKiwlTdsnsM2RK0WKM0QHv4EzaoEm1DSiEvoQPb0h90G/gZd8C/adhulX
	DK/+zQs/5kc15OqoCDB4qTThy4/efbiuYAhiAjS6HR89+cK6NNgKjw06d/uP2qkqUxevPFR7jqG
	9mad/YG0HLy6ozyzVkTCglIzwytQel9UdIi/C9JPJVOSzgD+7nFQWoX6rtIpqw
X-Received: by 2002:a05:690e:12c1:b0:66d:1c2a:9e5e with SMTP id 956f58d0204a3-66fb6d8ec90mr2866274d50.19.1788636572794;
        Sat, 05 Sep 2026 12:29:32 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm4997275d50.18.2026.09.05.12.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:31 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:24 -0400
Subject: [PATCH v2 03/22] alpha: select ARCH_HAS_GCOV_PROFILE_ALL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-3-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=a0msCzSodHHUo5LvLfRIZiI9maeBlwWaS3zqrFGDqqw=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7ekd99/4HjhP29k1m3XUmV9ElcJqcl9Fao+wrvP
 cc1s4zzOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa5/sYGfbwtu09Fn
 Xy4fsfImICm468uviXLU5iwd3cCauu5F9ZdJ2JkeHM48itGt2/evW1mf9/yRVz7PbN4HG+9eLcq
 gVBUvfyr/ACAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

GCC's gcov instrumentation (-fprofile-arcs -ftest-coverage) has no
architecture-specific runtime requirements. Enable GCOV_PROFILE_ALL
support for Alpha to allow whole-kernel code coverage analysis.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>

Also mark Alpha as "ok" in the gcov-profile-all feature matrix.
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/features/debug/gcov-profile-all/arch-support.txt | 2 +-
 arch/alpha/Kconfig                                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
index 63494bddc263..4701209b869d 100644
--- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
+++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 713a0c1cc930..c4da16971652 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO

-- 
2.54.0

