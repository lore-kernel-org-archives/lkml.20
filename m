Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7212C3DA5D6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510483; cv=none; b=bMnkwkWyQuVhPeqWvAuXqxfunTKTxxDy/+iXO9KhEDC4s/TueYcQQUBQhXe0mU94vuo8JQAatXWe5wWG5rM2tfteyrFuL57HyTkHuA0dwh3+HOFW2K72xWEnFF5VrRKhLU6GFUqOO6mEDc/pXOJGQrq6IAqJabIuaGA5sqGqwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510483; c=relaxed/simple;
	bh=TcsW9KgQTWxSQCbb1DnQ1KMc0ofcpqn2+UfH8Sd1f2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IRmSEmOsHJpBAyP4Rq2h3hh14PnK/QDdGEQD/XFTrUNdmtpnfpJS1RoTNtRfZXWAi2RFJLX3DTh04u2d8ZgN4USqJAl6lB7eVuQnlh7BE145E6tKJ90oJdw49aVZvSvHDm4THiGMx+ikbPLLD1VSBlmxPIABShpk9uS/a0yJX8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhPDpJBJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhPDpJBJ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484374f54d0so422428f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788510477; x=1789115277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BCJR2EnTICH3Aw5ZX+ld9cYG3kFkjVvxy3RdtPuJeNI=;
        b=IhPDpJBJALstlp4R1P9aLdDu85z9sYOxn4yX8fMOplPCGxhQbk6qpoYYLzg1+OEIYr
         GQkuHOTTB5/JIhQCTIJGOK4/yphYDQ9KEp1wYmyDo//5NKaSl4jzdGJQtLbeI6TqsNMF
         qDLq2cenW7dLBIqohHQXlfDMN5mUL3IJxe2p4sns3eXCzDmGfddmWpFrOk1DpRl7/oQ6
         bYQ6eQAw1ImdfhxY/6FeUW6BfoI4ZQSr7fGMxqUjEkWP9lNwxQf4M5reCTdPWgMMtz87
         o5rodYgVl+I7AfZu7Cf5x4OxZQEfo+lx/ghNdv/dvOhAXiNYTFzQyQc8daMFfJGA0Jw/
         wePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510477; x=1789115277;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCJR2EnTICH3Aw5ZX+ld9cYG3kFkjVvxy3RdtPuJeNI=;
        b=JFPMmgEIeQQkpLs5J+IZvP5RXrXr+MwAtiPo5MhTlcblk02kzIbkq+QUCsaNH3/6tQ
         UEL3vFtioDisj8SXmft6WjwulGk0D/meXR7y98hf+dq1TZ9y9lEy39WSRx8BokE5DBLJ
         HNzbygwCl29+LBAFXoZXqeHrfDlFMzSAJdRMSHzSvI1R+vPeVnX3eqURKDdJ4y6V9zWi
         8+o8oLj9+F+vTpzsDSKHeg+rUBjgm7Vbif9sjMuI30ro7v6TKmfMlntAqAN+YDl33bzr
         m65lp95D6MaCkDgvwK23lTX9JcBl1i9mfOwn6uY/wcJqBACSW3LilQgQUgnkEpgZEXpp
         XScg==
X-Forwarded-Encrypted: i=1; AKwUvByO/CUyvPouKnLyXrOBy+MbWkLYylW5bJ0lX7JZZ9PqEYKkPTjDwM+7lqWhWIhATFVKcnwuDoCFz9CzXaY=@vger.kernel.org
X-Gm-Message-State: AFuF++nfZEcFKGFb/BMPSOOECy3yzzONlzshue4l+Bbapc2DU0zdhnQA
	rv9Lt2JMKFu4PIIOb3ehd0MiedBGfTpvlTEZwFOw4dtgfnP6v5kVfj4a
X-Gm-Gg: AYBFou0R5MjGoz/lNdJ+0Y+rged3qf6q1Z8S4ztbS6WKSwACILMlxtAXuY/kUKpSOka
	gXSmEvot6k8jPcYAhZYfU/2f1WrhBbfa6b++uCFfk+a8kP6aBe3oPQC0njXhevlrRMAblwE4gP3
	st4a4IuevoUztrBVsvktk5sUlbCA3NwiRUMThAcR4ayVogK8PfgqpdLabG9PLAQf8QYuT/eWA5b
	S1z8voBh8UuPM4bRPngI7l+AqVFyJzReZAgUZK5GQGIt+/QarrgcnH3gbtZVr/eRC3iIuRpy+g0
	Crv2j3dHF2MBA3i8NeCbUVGThjWYQZkjRZXO3jBGwOeDqdKz8N6AVK2/Tlp1MuEZxr871peDqKG
	qrYvjC9Wo6qrtgao2ZSdoz1fT/0Yn0j5APLyFuIIWrbpP9T78+QywavQ8iNFCNNE3A37pkdU3lh
	6Y9tbWb1GCvdKBB+0q0i8Mt/aNQ1rRANqvuqX6sRG2nVhPnisYc+M/E1i6WDNoiaoTZRLoxkjz6
	3s8gfOTEvV5Z8zEzx4Att7aYEQhpXb3CkUoR2ZgAZ3viuO2NK9GFsostAxdfsQ1UDnBoA==
X-Received: by 2002:a05:6000:25f8:b0:485:78f9:63de with SMTP id ffacd0b85a97d-48586bf7456mr10056913f8f.0.1788510477244;
        Fri, 04 Sep 2026 01:27:57 -0700 (PDT)
Received: from fedora ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm4556228f8f.37.2026.09.04.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:27:56 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 1/2] x86/boot: Disable GCC min-pagesize assumption in boot code
Date: Fri,  4 Sep 2026 10:25:22 +0200
Message-ID: <20260904082741.578048-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904082741.578048-1-ubizjak@gmail.com>
References: <20260904082741.578048-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC treats absolute addresses smaller than the min-pagesize param
(which defaults to 4kB) in the generic address space as presumed
results of pointer arithmetics from NULL. For example, the following
code, when compiled with -O2 -Warray-bounds (included in -Wall):

  int foo (void) { return *(int *)0x123; }

will emit a rather cryptic warning:

warning: array subscript 0 is outside array bounds of ‘int[0]’ [-Warray-bounds=]
    1 | int foo (void) { return *(int *)0x123; }
      |                         ^~~~~~~~~~~~~
cc1: note: source object is likely at address zero

Currently, the warning is supressed by the GCC specific RELOC_HIDE()
macro that obfuscates arithmetic on a variable address so that GCC
doesn't recognize the original var, and make assumptions about it.

The GCC specific RELOC_HIDE() macro was introduced to work around
certain ppc64 specific compiler bug in pre-4.1 GCC. This bug was
fixed long ago, and replacing GCC specific macro with a generic one
triggers the above warning in boot and realmode source code.

The early boot environment does not guarantee any minimum page size,
so explicitly setting the minimum page size to zero by adding
--param=min-pagesize=0 to the compiler flags when building x86 boot
and realmode code with GCC inhibits warnings for addresses below 4kB.

The option is guarded by CONFIG_CC_IS_GCC since it is GCC-specific.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/boot/Makefile        | 3 +++
 arch/x86/realmode/rm/Makefile | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 3f9fb3698d66..372e67d2a855 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -55,6 +55,9 @@ KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS	+= $(call cc-option,--param=min-pagesize=0)
+endif
 
 $(obj)/bzImage: asflags-y  := $(SVGA_MODE)
 
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index a0fb39abc5c8..75058f4dd7c1 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -67,3 +67,6 @@ KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP \
 		   -I$(srctree)/arch/x86/boot
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS	+= $(call cc-option,--param=min-pagesize=0)
+endif
-- 
2.55.0

