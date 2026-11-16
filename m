Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801473;
	b=lo2SxEJOjeyHNtX+hPmX8MpgH41SSghTSqxnFSHI9fmt8vuvkrkUPirrXJvxV7Fu+vuh
	 XzEAccqkxwqnJMsmhAtkCc4NL2s7OaKEPAaD0BBNhLZIwFTe+CT75b7NmTR0eZOnDJrRP
	 HPm6+eNi+ec6X4sKe0ly+YMYSu4Nrr8i+wU7bPREAxnejvcy/lVp3/SdupAjX1szT6Xub
	 JefmISZK89vraVixOYDD3/+Y8ryU0g//eNRDcuu6ko8znGYiGVE4xoBeGfRXWnLX5MZ3h
	 VCwPDAyQ9n/bDKq2xFwu+FdB5Q74fdTCBLKpECTl4IJwaI6Bd8JdGb0lhm0QKanVRXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
	b=R8BFD03Tfa7bIJ6f3viW3Osl1qvpS7jhAfd496iU7PDOGI2oHOsh9JWKBb2aAb1oIURI
	 4XZn5tOV6/BML6t0ZF82BotdagImKBphEpUSVRe/jtGZL7TM4K+U88Q9yoGxii0X8M0E3
	 AaQ3TOuay8nZFuQ2Uzkl1rIDNzKVK8LlukhLFKbLSyUxYWTBKv5CXKdb3RG/fVw0+aesB
	 kV4VFiVDurtF1sk561HOm1d0d6ptBSX7hqDVov1U0cm877oYUIyOW4gJMIJx6mnb8w5r5
	 HDPZDxoqQaYWO8i5mIlontmTu51Wn0QC1HochiIUcrAXgyz4+lduXaQZXKQNkuaUvnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pXUuGH1T;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A538606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A538606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pXUuGH1T
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so5007380eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794801472; x=1795406272; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
        b=pXUuGH1T9exwQcrwhbSZrLclSn0IWrK+PCRBc/KdKoTlWFPxdjgreeQ1+APKhspKwS
         HmqF1BZdKZR9OP7azT5beKtMmat/vhp6olqwbUZeGf5u/1b39oKZbvVK9EqEv5J8rQID
         24wNYBs8s+ihpD/hp4t8V0NvT5OMsgDTX4FQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801472; x=1795406272;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
        b=E2+wiyC42zYT+b9zti7T7JPi3nmX1eLNsSt4KqbPA9dD3U6Fbzu0B7x347Si/PDHlS
         h9fIhjpQr9YG0pQz1bXDYpCLo3aeBSGdINgCgZdsQxiza6vTvQc4Eb40Lo5JvAwnmuxe
         hovNvKgiI+voZn43ycLvBkvKIVTCYO2y01i3+j8HsOPtajdkZLgb4//6OPAypksfv24A
         ZfvhzDjpHuYTjNCx3o++ID152s6unAfDx7xDOLW0VOEa32Hh7ycDa38PKTx8e8LxeT+y
         9RvMdKqZOOKqbH2eBseb3qL8A1oBf0mBM9L/Xgu18v5y110kd0zAt4gNkUSHuXqjeWKj
         mD4w==
X-Forwarded-Encrypted: i=1; AL+hErHtaiY9sJawnKz9FZzDueNwACenmikaYYQJHMXTliaTLWrI8FiLA9KbkrcbKsxoMH79QhAEqPGC5spn75I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TPOgWb/QtIxqMuEB344f+k7vcOHOjoFwmZOwhzX3P0bcQILMW
	SDe20aEPUwCrLyW9nTWR9uKdecJUD+vRmPj5Zi3LIDM15PoL/vR7NdlunESdvboX64U=
X-Gm-Gg: AYBFou0jBphZFMT2iUKbPh0o2+zqbatoHjILQ7So5jcvHQR3em/KZNnZz/h55/WfL20
	ikHrWGvtXx/kRKGrZYaV62U83SEToQ5Ry85qehuqDnG6cQaU+84O+Wdl4cfr08SG2x+mc/B5yZc
	S90bdGqvG1Iuc/+hjSPIF3LGUg++vVd2WHBXPYcpQP0nsIU/lVzuzo323BPmjw03TTCkUKE6X85
	nWoiYpejfK5XvkiPNK6miYaNVfGsqJWvw32lmY4GSZcyQI/MW2sD33HLV418fQ8fibFFRWrf7Z8
	mDF/D/CIFfdrQyKw7LeVq9DLfJmTxfESV2ZVrd34LlF1MW1+Zdyg7U6lTQUoDq5MxL4zn8bcE0B
	Y0seQVVTaVy8xbHuwC2o64jPqeMOg7zgvrNqwUZFhegtk99CNqHeXYRmdgXMaqcaExN0lnM362p
	2DAX7WNhOKNJ3R907kDUgmmpM/F4SHeirYdNzTmuNcnqnxYe8HBYTpkcqjTywiBDtyJkTQmTJr8
	tDh0Vw53wQk7Q9NSKHCjFTCw8gPNdET0oz4wHesfbj0kwfwBvDMUYb4PKUJhgHaRHvmzANqBOjU
	3/WzYbxRgLbNubqlpB8eh4uKcBdDLW0bvGtvkuGyEj4GLQmqeS5oAG2dcc/OX3x8nhE7vudzFxL
	JPg4aWu1kCj3h6bin0lkIdz+96OmwU0Mzk3QfJJjvU8prL1Hzquq2zYWHqaCl/E3H4TWOK0jKSZ
	fzZsC95Mx5eN66oKrgUOJIf4IK/hqn5pGcHShkw2XSS78bYzSzTARdyHkW/lpbXqoD
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr8377652eec.15.1794801472427;
        Sun, 15 Nov 2026 19:57:52 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm29451214eec.29.2026.11.15.19.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:57:51 -0800 (PST)
Date: Sun, 15 Nov 2026 19:57:48 -0800
Message-ID: <a8474f0e2d0ef5ea9d53aa6649c7e9c9ea6f15c2.1794800574.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2] proc/kcore: allow disabling /proc/kcore at boot
To: Omar Sandoval <osandov@osandov.com>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    linux-debuggers@vger.kernel.org,
    linux-fsdevel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

/proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
memory. That's a pretty large read primitive for anyone who obtains
CAP_SYS_RAWIO (and it also gives away the KASLR layout).

For this reason on some hosts we want to turn /proc/kcore off. In terms
of what it can read, /proc/kcore isn't any more concerning than other
ways to read kernel memory, like BPF with CAP_BPF and CAP_PERFMON. The
distinction is that a process with CAP_SYS_RAWIO doesn't necessarily
have CAP_BPF and CAP_PERFMON, because CAP_SYS_RAWIO may be needed for
hardware access without necessarily wanting to grant general RAM access.
CONFIG_STRICT_DEVMEM already makes that possible for /dev/mem, but
/proc/kcore gives the same capability to do general purpose RAM reading
anyway.

However, on a kernel built with CONFIG_PROC_KCORE=y the only ways to
block it today are lockdown=confidentiality (which also disables many
other things we perhaps don't want to disable, like kprobes and
bpf_probe_read_kernel()), or an LSM. That's annoying, because on the
majority of hosts we do want it on for things like drgn/crash, so today
we build two separate kernels.

Let's add a "kcore=" boot parameter so that this can be disabled at
boot, which lets us preserve those choices while using the same kernel
image.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
v1 at https://lore.kernel.org/r/auAmuqZyUodq3iqk@chrisdown.name

v2: Give more justification in changelog (Omar)

 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..b4c43d2cae03 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2902,6 +2902,12 @@ Kernel parameters
 			parameter KASAN will print report only for the first
 			invalid access.
 
+	kcore=		[KNL,EARLY]
+			Enable or disable /proc/kcore on kernels built with
+			CONFIG_PROC_KCORE=y.
+			Format: <bool>
+			Default: on
+
 	keep_bootcon	[KNL,EARLY]
 			Do not unregister boot console at start. This is only
 			useful for debugging when something happens in the window
diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 3264c99bd68a..4251a9ef868b 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __initdata = true;
 
 /*
  * Returns > 0 for RAM pages, 0 for non-RAM pages, < 0 on error
@@ -722,8 +723,19 @@ static void __init add_modules_range(void)
 }
 #endif
 
+static int __init parse_kcore(char *str)
+{
+	return kstrtobool(str, &kcore_enabled);
+}
+early_param("kcore", parse_kcore);
+
 static int __init proc_kcore_init(void)
 {
+	if (!kcore_enabled) {
+		pr_info("/proc/kcore disabled on command line\n");
+		return 0;
+	}
+
 	proc_root_kcore = proc_create("kcore", S_IRUSR, NULL, &kcore_proc_ops);
 	if (!proc_root_kcore) {
 		pr_err("couldn't create /proc/kcore\n");

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

