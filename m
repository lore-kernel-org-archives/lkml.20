Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608066;
	b=GK90e3ZvzWZXHd9f1Utr4VKfgf3k6dpffTMlf3+EbDIaYAHmZI294VBnGKceEBHgGM4q
	 jQ+/prwJ8r6GwMr1bN1PTr/zCxZjsc66E/97c/BPloY97NGWlNlAW11ervAjD64u1ZHtq
	 m1TF1vk9kEkP9ROJOVwqZKYmonzgBDlG/scLyjrw6JIapySL5ddBGz84KjJ8W4DeNfJZK
	 Pa2Pe2RxSf0DZMSTmdAmn2tjketFxAvKLwXPFsu7AJKPQi5IZ0srTADOzpZNjTM+kJQyA
	 egw1CyvzGb42BextoL615kaexfBZ1/F/ixwsbhNBtEdUEH/4/8JkClJpxwtV8k5/g9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
	b=GuGA0tKHaFsTBy77qAIU7zkduFF4lTLWfDfe8wbdKvcMCsq1Pcm/Basx4ci1tj/h1eUH
	 EMVJUF8Q+jEMXq5urQ9RCvZ3w4vOqSLF510jRP+4cKhM+a3iEO3u76UN/KxAd24IVA95h
	 2KLHVH6f1yK2tlcE0YXs/MeZIat5Si3jBxsCbibc/aRh6Vii56KqlKJkdPXxOqcYgOxxO
	 /gvcJ4cmJOy2hKM6xlCFtuGPXN2xunRriDPpDVe8nwn6syExjiLpZtZdZ1mEbVVVig+a8
	 DZeP9pV1CpAmlSAtOfBGBsaDqTJ/pvc/zMpzjAgI5VPu8y/P88IaFQrhQuuOu14EdnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjMOIPEu;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997B3606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997B3606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjMOIPEu
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5641cd2cc13so1893616b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608064; x=1795212864; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=fjMOIPEujQ80OPuCk/2PwfPYl4muqyhEYEkrnqU2gj6MiPamTimEwjYFMt/H/9w7Wi
         UTuuENUdduvK1Ox2OM9j6e9GAJEMPHdc53tzSSDAj1a6+ARSpQiJsqLxzv9iHK/mIhuf
         S7bDxajxb9GFPHBWxjr2+Cfgm9DIP4GdAUYAQ7eGXov/HX/WKBKO8Vtt/FaZMGUFO88G
         zMbzVQgLhL2PpkBGRoAQhEpGUZU/UEjt0UKMkpAYQ9N6m2bW/Wte6R88jCKB3aczvlkk
         m3wa2cFuDRz1ah8RH2GBQgPRgT6KSKqZSiMGkxEnsF2VUy7YKRxWdFGIaSzdaXSeadYS
         e9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608064; x=1795212864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=TgwknNNafcQS8QfOtkke4f1YRAWU4XZxG/he3nAY/r00xpGUFU9jLDAVNaLhY9JB1V
         kSPsbh8F7UAq3SaaGMBVX/3EKNUW5quLQ++zPorr/aYGUeJKb29Rsm7ZlGlO2KErmSL6
         Ygrzbqq0hJU55q/nTNyYJsEzWnAJS/gsrIKBkWSh4TYrIqU+rJ32+UPREL3v6ctkuR1i
         WuzWhnXP2dQvFvcDBaVzk9tNkctziWDYliOwWRraZDuNnYuiOKBQu31t2R4bYYn4WuI7
         BGFVSDfK6fPFNopl3lP+6Yr6+i6YNe+OMdfSomM1rvHE/Akr4dd64jpSUT2csw0Rm4aB
         cbQA==
X-Forwarded-Encrypted: i=1; AL+hErFWYisKIJs/fs4Jsl8OXY3E/3ZKHAXaor/hONx0GHnUW+g/joz4Nn7d5rk3ajzDsBcyasG+i5CeCQyOH+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+tD8hulrFPqNgvts1jRau0n7r1mWMSJ9wMrRhvi+7w/u5Elj8
	cXAbvUrlGvA9NtxaJMkC722grCAP/oqeZmz957hWNPQWTvqbdX6glHdAyMhFVkHhIz6RQZeVK4f
	lXi/aJrEejrBNug==
X-Received: from ilbec7.prod.google.com ([2002:a05:6e02:4707:b0:53c:f2dd:1e17])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3505:b0:536:611a:7fd9 with SMTP id 5614622812f47-56e6015e8cfmr3125630b6e.7.1794608064235;
 Fri, 13 Nov 2026 14:14:24 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:50 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-16-wusamuel@google.com>
Subject: [PATCH bpf-next v3 5/9] docs/procfs: Document KALLSYMS_QUERY_* ioctls
 on /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add kallsyms to the /proc file table, and a short section that refers to
the KALLSYMS_QUERY_* definitions in include/uapi/linux/fs.h.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index fa7a468e8edf..442aae9ebd9e 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     All kernel symbols (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,14 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+kallsyms
+~~~~~~~~
+
+Lists the kernel symbols of vmlinux, loaded modules, and dynamic sources such
+as BPF JIT images. The ``KALLSYMS_QUERY_BY_NAME`` and ``KALLSYMS_QUERY_BY_ADDR``
+ioctls find one symbol by name or by address without parsing the text. See
+``include/uapi/linux/fs.h`` for their structs and errors.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.679.gc527c65306-goog

