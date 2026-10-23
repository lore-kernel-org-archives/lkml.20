Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714651;
	b=oc1RQm30T5Q+jUWKz2ujB1OV+q3iZXaYDbChf07OQSXS3LRbH27DRnZDeR+Yez0amIJo
	 Cw7QEe8Tk84K6K8oBE7bc7D+RNmVxEP/ioTEI30MEOkUR3DEE/15kykXnYX9jfGRIF9Kk
	 2e8EvQVFd2hNAoi0/dFfywVLDfgfZQA4Q1js4Tc1pyj8fMXbUYVTUr05Xfu/G65Sq//nB
	 oPk6ln2w1cDCwzPQI7WPQ/qhlqqpNfZ5E+XacHKMoP17z0XEiCXNmutQJETtB3i/D2CaB
	 fLFO63PeKmfRSTFN9XtfT+qVcK/Nq4n4fmcNg3Xutqng/A70o3CuHLV/LVQY4a1V1zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
	b=Zu7cIX8Fp+ZS3FeRBeapSOkyoR3BaihLISCb8HljxUZ8dezUuQYKXloGpop81R4DnUEv
	 56ADmpjwi34gXGUQUaNtLlI126Mz82pFvhTw5AMA3w2h9gBMAicLS7z1f1pZGp4C/yv1X
	 cWGPh3YkRa11sWoQpAp981NBgPJzoJg59B87hVvVoblg37xqOkk30wvvNwwBbUznMQ+jH
	 8Bm6b+gY1et2YhS/4j1SQIP2gO9Ny3DAxgELG4gHRnFrkwD4l1OVK7FresHVlzfXzPfgF
	 IB2caccAjRy1g0NxF+6dy49W0Ch16nRc2jgywK6Ux/W955dUnsG9Pq5rm+yw3tmt8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sqYqHqN8;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97821606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97821606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sqYqHqN8
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so808280eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714651; x=1793319451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=sqYqHqN8b2C9rJCdSIP5pixpXsTX2920yN1d7s2o/SmV4SPD2hmw6YaJEz3yDvYtKA
         iSPMoTZBdLnSRU20QVbyo97PcqwC3mfoFnT6y6ewBev7vqiAKdtisl9PYS3ylTJbV8Nd
         SF/3YFB7sPEcIuuiBBK6CPmB8u4BmtVrr/3ql6+jzgDSDSbJMsfS7KMwL2mHf/3+JFpR
         m/PeyE/0IrROwKBm7BMII7pz1si4KeVS0wby68xzfFfXqmcqa49Lcxe1UQPEw2GHzsfn
         b1Pnyv5Zi57Jh1uZqx5b8M+FhLwsFGdHA8X/oDvRvpdEuRU8NcdDjTxNVNGg8QkCjZD1
         b1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714651; x=1793319451;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=qAe9dNOFE538RBgSrlsx+A1KOeTy208toSM+zHHoN8NYHiuO5jWt+cS/8RS1EHP1sD
         25RZVysitlhOfoGSG1pgaBKqhiomX5mWoX2zKqop6jXQxQhOvuwCDQsx7aezjKwx3E30
         cq+JCPbiJfW8P/2LgWi1GDn/rKj11NqshVOPoyYW1KqoRinmNSzjJkIpwzD5hwlW/RF9
         6gt6ofpdcbf7HGokVVHGHQSycTcUQ6Mzhqz7RHgTZrsNQWZCeCFiIHnwKKwKvmVaNGKW
         Ef3lSgRBtuR7H9hTz377x0Q5ftLaeLPkAItaljEHbrhwq/GK1knGw6U5gDiFGhqg2LwS
         puWw==
X-Forwarded-Encrypted: i=1; AKwUvBwvpDqQETtUBOdLOx8ow/lOVkDlefsulHvFNkcJj435IawPwVCQOugUxZ2bIEJsN8iCdRXkqJTrMhwV/HY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGYcE3K+H0hTdRpdMBWh2MYjXDGo9vpsEA+ds9m2PKpn51qQGC
	cvej2bPPMxNx1jqAq/3OrKRHAM4dre0Wv+W/gw2NtBGvlI+ebYGuSrl8LPqCgf2zaP0VxqcLiru
	zjqf6cDpiHD0TOQ==
X-Received: from dycuf12.prod.google.com ([2002:a05:7300:10c:b0:35a:6ed3:3ee9])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:83c3:10b0:367:185e:867a with SMTP id 5a478bee46e88-369d98e5b8cmr933601eec.38.1792714650260;
 Thu, 22 Oct 2026 17:17:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:04 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-11-wusamuel@google.com>
Subject: [PATCH bpf-next v2 3/6] docs/procfs: Document KALLSYMS_QUERY ioctl on /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Document the existence of the KALLSYMS_QUERY ioctl() in the section
describing the /proc/kallsyms file. Refer the user to the UAPI header
for low-level details of this programmatic interface. Add a "kallsyms"
row to the /proc file table.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index c102b62023cd..a0e2fe14a01a 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     Kernel symbol table with dynamic queries (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,20 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+
+kallsyms
+~~~~~~~~
+
+The /proc/kallsyms file lists all symbols in vmlinux and loaded modules.
+
+In addition to sequential text reading, /proc/kallsyms provides an ioctl()-based
+API (`KALLSYMS_QUERY`) for querying specific symbols and addresses. This
+interface is binary and is meant for efficient extraction of data without
+parsing the entire text file. `struct kallsyms_query`, defined in the
+linux/fs.h UAPI header, serves as the input/output argument to the
+`KALLSYMS_QUERY` ioctl() command. See comments in the linux/fs.h UAPI header
+for details on query semantics, supported flags, and return values.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.257.gf7497c7d27-goog

