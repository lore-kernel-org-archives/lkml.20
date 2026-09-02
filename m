Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B666439014
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365640; cv=none; b=WuLV5If1oXlS1wC0f8A9PmRolH+aSeoFhdTUCRBh1B5pcBsTrHAi8jHtAzTajRFA2IyhfU9//QY4feKgMb5afRZmbfVrFjNEodwrWB8Sv/V56EmLDHpvUnhGAAg9n+DiPQ1NbrMSo9jLrBJDasocq/Yy0u9sevWhZ9f0WdHEV6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365640; c=relaxed/simple;
	bh=gOExmsjx/Dcw2wBkDJUC85QTuE+P4KTcC0JuSpPzL5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zzz4+yoQayav3Qp7b3NuUtQLbbS6Z5qruqJ/0gQh9gkUX0BrqHHG/paYaIb2W+ma4xCpb682KleaLx0sHREWEX+2+3b0uPwnMUY+3+1Pl4tGiUFDrcC3Soq4sMJtaYUOJbNeDqxVOWQK/WkPa2Kt/eCvnJeshNAdbaWVD7ikeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FudFBLt4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FudFBLt4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c25b661d37dso193964666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788365635; x=1788970435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMuR3JomgDMugPyGGiXTImTTtVXWnO9TCZlsIbkVMNU=;
        b=FudFBLt4IAItVgQNVKimfU7yHvNPp16x96UsnajygmYZpKdvMZsoujXXvdoZgs0Ibt
         MO8+x/bGSpFAGUk7KfLmBPRRmd8w14jNm6/d0DnN4jwsJsXXIa+WIkahK8flWYqTeuMg
         gQd3dbt7WiHdel8hyNWF3m2IaSzdP2EjwWPsBQdGUO8tWViyMMedd6onO5Seua2EzKAS
         6UF6JNdOsCiCD7UN7e1EXhu8eWfNFAcyQMHoGKYEcspSInsru+WFPZgQ7cI05Y8I/+ta
         q+yDT6lokVdTzGqYF/La1qvDtk6PqRVcWWUH+dAPbmYHBQoO5OnfkVBd9+p99luYkjY/
         K+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365635; x=1788970435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMuR3JomgDMugPyGGiXTImTTtVXWnO9TCZlsIbkVMNU=;
        b=TYGy+paa7R2YYuivBB1WXCka+xYbnoRqs0Xrz0+xQIix1njv0cSoi+UwBggpAoT18T
         Zgpwy2frjweGYFw5CR+B19RVEH/XvWSNlP3P4Iutmufxzp+yEEKib0ViKBXpjEvfbAAK
         G/LaBCgleMZOh/TGApFxv1LqHAKuHAjvSIFHsmGtMndlMVdIkrq0GLwENTtRnTDhl0C5
         7ezbK4rDaNhpdkHVFvGgXGGWpyJrKnPQLGq6PbB6k7No/ac7e4cS+cxq9SszEFf7p+M1
         TIIrvpRHiBrHvZi8qGev83h2ZUjUEHkO/1gWussTw11n9ayuHFhOCUfVn/0PeUNQhTfC
         JKWg==
X-Forwarded-Encrypted: i=1; AKwUvBwhPnHAwOsXpZsuF72KONkJbaZ75R1PVsj6+j6naaeB36Wmmrd2CO//wdgPceaEtZlvL9WQnqTxZtkvv/M=@vger.kernel.org
X-Gm-Message-State: AFuF++nN5vlakCqwFYOQ5TvtcdrFNoJE3oSiQnCLETL8J5Yy7TybAe43
	tG+cxSoN38LZOYgzWZtuKdxVbOJU5RG9g8QXnNGuewLbE3AQIyXs7gfD
X-Gm-Gg: AYBFou0xotQoGMiYzpdIusO7q49mUTEc0smHbvmqs7LPSii/ctkeMeF5aTs8KOU6oOX
	HJe0PocOKctmxw5+C0oLFZ7ZJ5XjM3WhTdlXbCIvmEkI0QS0z9BE1LZ186NbNR9Vr7nNqww3wyC
	wtdnpDoGX8xI6L9m+A9GNQNI8CioXynAcqo1KmSNRi2tiagxV8HXdYZnggTJoeGh0qMkT6kNVxS
	8TGAJRDN14J8Hf1ANIYLgmXl7LldZXQgdQCMqkuy3w5mjFbxrRjywFWrobjoq4tyKQPDA+w2X/r
	NtDfgT0qf3oiaj7U0TgB/DrAhFqWyev36QhPzVop0vGTcUTt+KtBhLfMSowLhPx6mMzSs6uN4Ib
	bO3gaqaLHqr/ZqZiL8xxPGo/8lYkJRqr5c3ZMSMERZjZlUxAOE39b/kdsqPVRMdnlSKfF/AegCE
	3lzZ1Mv4cO/lhvxSJntnw+XrWq/2c++DPNtjxwVWERaiRQ+HP6Y7nVECo=
X-Received: by 2002:a17:907:3ea1:b0:c20:33db:41d3 with SMTP id a640c23a62f3a-c25d5476414mr370581766b.11.1788365634473;
        Wed, 02 Sep 2026 09:13:54 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:48::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm167062066b.32.2026.09.02.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:13:53 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [PATCH] kbuild: don't delete in-flight filechk temporaries in asm-headers
Date: Wed,  2 Sep 2026 09:13:47 -0700
Message-ID: <20260902161347.4163577-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2d69b891e646 ("kbuild: Support generated asm-headers in
subdirectories") switched the stale-wrapper sweep in
scripts/Makefile.asm-headers from $(wildcard $(obj)/*.h) to a find(1)
invocation, so that generated headers in subdirectories are considered.

The two do not match the same set of files. Make's $(wildcard) uses glob
semantics, where a leading '.' has to be matched explicitly, whereas
find's -name uses fnmatch() without FNM_PERIOD, so '*.h' matches
dotfiles as well. filechk writes its output to $(dir $@).tmp_$(notdir $@)
before renaming it into place, so such a scratch file, if it happens to
exist in $(obj) when the sub-make is parsed, is now picked up in
old-headers. It appears in neither generic-y, generated-y nor syscall-y,
is therefore classified as unwanted, and cmd_remove deletes it.

On x86 this races with archprepare, which lists both asm-generic and
arch/x86/include/generated/asm/cpufeaturemasks.h as prerequisites. Under
-j they run concurrently against the same directory, and the build fails
intermittently:

  mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory
  make[1]: *** [arch/x86/Makefile:269: arch/x86/include/generated/asm/cpufeaturemasks.h] Error 1

The same commit also converted the generic wrapper rule to filechk, so
those wrappers now create .tmp_*.h in $(obj) too and can race among
themselves.

Restore the previous behaviour by excluding dotfiles from the sweep.
Subdirectories, which is what the find(1) conversion was for, keep being
descended into. While at it, quote the -name argument: it is currently
expanded by the shell against the build directory before find sees it.

Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirectories")
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
#regzbot introduced: 2d69b891e646

 scripts/Makefile.asm-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index b38931314ad7c..f1c3d287c14b0 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -48,7 +48,7 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
 # Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
+old-headers := $(shell test -d $(obj) && find $(obj) -name '*.h' ! -name '.*')
 unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
 
 filechk_wrap = echo "\#include <asm-generic/$*.h>"
-- 
2.53.0-Meta

