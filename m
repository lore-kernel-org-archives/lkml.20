Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910843;
	b=Qww/qnifkVK7e3EugOO5exclmTIvaEspyfJCz91UmxJW0++GVbpr0cimH0yRnk4SwSnA
	 dWyhyWBwBTeuA4YbZHNnYf0dzGfJXPRWkXhBlmZ2gmAjF82ucHh0gIhTGdAr9SncdmZr7
	 vAj1+xga2UAIvVy+e7a9OU9ADXXZ1nwCpJXX4W1SDJJHmYkM08d7YCwHYLYkPf/1LxMBS
	 l/U9WXqhHJuORR4I9apWbe6nLtQjo6g85aX1xKqkx0Mghgic5lAFX4w80Y1XbJ6qYKOZB
	 K85w2zbegF9S5i3z7bNSFQ740nK5GawNPxe775JM4c6uy9opmRFTBVvBmf3RUg185Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=wUKnxB9Hkf5UlddOBau8h4TCwsj7ZxWVW5uuyUNe2fU=;
	b=0abHlMp9sJ/2QXcliUnu1tYHhcU4dbSC6LH3VpKGcRQuERgaMCOwqoMUn6yqUY/XSVj4
	 /PxMVbNOGpPAH1iqxBsBZFCqfr7keOnDAlQJytV/8MgY7yWacbK343v4oa4HduAKx0yFt
	 8zZJCwN+yxu6JTQ+jvOrUdw/dDuLrQZ/C9bc1QIGttNLj/pGeWYseok7vFEdCz2JP/MrS
	 nRKP/FpeA6m1ZD2NsjWnkNJ7Vz5TzDA+15z9GofBOHnNCGwS0o1RChxNrSMEWZOy+mpa+
	 tfEgyhuYzm7t2dxLlqzZ+dSKsGJQwmpWOwjBVkZ9NvvKf/8Xk7sj2ySooPHgKit1wfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=E7RLDg11;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5EF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=E7RLDg11
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso4185134a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794910842; x=1795515642; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wUKnxB9Hkf5UlddOBau8h4TCwsj7ZxWVW5uuyUNe2fU=;
        b=E7RLDg11WOEqbE8nOBbR9Wi21WCPxa6PZYpNS33bFEgcNRLlGLk8GZJ+wMBUE8RniO
         YuDug5jx+4b4Sd6W1bevIMgmHpvzco0R8u3w/EF89vuX/C8uQK7pbooAuV7TKqc5ncp7
         e7D3mQFs3aygUuhaHL/JYlQASpdLPnu6wCzh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910842; x=1795515642;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wUKnxB9Hkf5UlddOBau8h4TCwsj7ZxWVW5uuyUNe2fU=;
        b=llqapag6jWtg5+l0BkYpzWgGcQh4Ps1ytEFG5fmDNMIEtfdoXkmRlpUPGUb71kD/2L
         lwLv5J0Ez3N/LhPJfATZToeJrtTjQKOcIsPWRvVYyzrfhW+D6qF5rVd3h4eqRH59f+wd
         Zj99ntrFgcekyiNocsAmb6eU7XQQ742Iv94qHmpkHrTCXF+TCqN6hMDlW8Gc7FPQHPQN
         gP7aZEzd82MkM+qBIUhLojKkhy3HV0sFSe94QFBy8MTRzW39rTDfr6XN0PVhTAGIqXwY
         RQDAomTnm06mICtXaNGAmdI0AK9sCgj0almiYx+JKs7xsQcatXaZyLfEZMwG/TBcUt6A
         pUTg==
X-Forwarded-Encrypted: i=1; AL+hErHLhrqItYWOcHoR62i4brPFNfx3+/UjkrGSMTp3qe6wNlpBOQmmmpSMUhaG+hIJqsn8LtT9QoJBk4GX2Ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rigph4YXrbfJa8MZ98U5fnogNVpn/3s5meuJMlKOAtHxHoj64
	dvddJUfp9NJYpu0D0Kq0zoJ1cc3TeG+1xFDp5m2ICQfgqX4lDFRGdzGm5rQ+3iSIxWg=
X-Gm-Gg: AZFdTZfjib4xpJaiFIGHlMDPdLRjEmcaX3cM98e87RYmd9aRLPw8BpsRSqghH0Q6YF0
	TVPDHpHdwQRUmy4uxgSPjtfNxzME4pGKMlHk0gobMVHK2x0yqO4vD0BX3puD1qWVqQK3KpmGk9k
	tBPT6BplhNm0q5bLYcXByYUR8JqMhgjlAR8XrG8EvQNIDcYIfwfsD5m1LxMOHUp24obKT0LBStV
	ZX4zuPV+n7V2QUcXecC0NfWGY4ErHUqvtC8YXWmK+MZhTb6ZGMkcUc9RuthINhOcVfMcBs0AzII
	S08JwDXMjz2WXUfFTMNszI7M2OLNfDMx8WbmDAikwO1HD/NY6UOghgnD9z2nK4T6SDaXcc6XubU
	TPkDcdkXv3KpxOiop8Fs197iG//0TFKe6MI/pU2WEfbcuCA5Ue5lqz2AkjoYaDAbceg7ipgouCw
	KhN2UDPw3v2NlUGUDsx8dJnU9K2XSJRhvhNGs0fyXa6HumsUagBiyouBj2uN1JZZJiQm4+4sjf3
	XkvpAfwmLb4Prv5KdrVE0H4SDjHLXnshBgjtLKAjfj7Pj5unF4BoSMlJptDO+lgmS3eq0yw1a8V
	X3RjaOUS1jzFDWLmuVedWV9tGKLIu77Ku/+2JDgFC33Q732WcNh7itarFAEo74Vk0K8N9gTFr7j
	yhato5Btym2t1/3W3xkJkg+mEaZUAS/BsqLaY00QW0M9ediM35avaaun5w+EFpTeVawmYVTg+DZ
	YA5+H4cgapToCjQKxfXgCAa6q8ekXVbz7MqcP7E7RSqsDEspBGbZWZVVU1hitXRoZy
X-Received: by 2002:a17:90b:5112:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b1b0cf4395mr13922231a91.48.1794910842256;
        Tue, 17 Nov 2026 02:20:42 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3a7657585sm1927180a91.2.2026.11.17.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:20:41 -0800 (PST)
Date: Tue, 17 Nov 2026 02:20:38 -0800
Message-ID: <7c10f2e01b6f19229c83e81d887a87f5d1151841.1794904698.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3] proc/kcore: allow disabling /proc/kcore at boot
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
v2 at https://lore.kernel.org/r/a8474f0e2d0ef5ea9d53aa6649c7e9c9ea6f15c2.1794800574.git.chris@chrisdown.name

v3: Make kcore_enabled __ro_after_init (Kees)
v2: Give more justification in changelog (Omar)

 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..205228294fc2 100644
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
index 3264c99bd68a..786c1209e224 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __ro_after_init = true;
 
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

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.56.1

