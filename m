Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874121;
	b=kKgZSY5H2Bvjz+rJ/opI738hOr1hXTJOvukV/pFI5hoGkZ5ZOqmfFCEYRfuKYsXBHxAe
	 /5ZacbtaXm8n9+Drpa5Nd1COGFa4SDorp9QnTHPpbUUTd1clRo1Gs3tgekeJNZHJon9w6
	 NeBeCIQ/JTSQX8C2IchBjMjoc3jm4wyNkiqunIRjWkbcK78Z0sHFD6zDeHEjPYpzWz2hz
	 teNRGF5jR6Tc/NBjg3+BGeTUwL8nlKBxq0z74l0YR+GVq7WARffCcw2vyUQYEvwIRx8g3
	 8/TYPrQgO7n0gK98vwpAmFrm8ywv5IN5Ti9WpSdQWuAyBKSfb90uETHp84O6ATD4x2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=83Vz1ahixu5Z9IjP6rpbf1tvQV6iBDeIZHTmQxEZ/5Y=;
	b=Z26Yr+zYTGJFnnl6CtEqhLRqHq3MqPV0PAaW3gGOeOopUxr2JSlr8A9iIuk+Z+ciyqr+
	 F0olL8YHwRNAsL9yAU1jnzCmCYAgQmvmj3bh+Lnpn3NprieiAH3djakf7R3nxkQN5dq50
	 o9tbotjcD3hAa36zsyYtLTPxxgPAccxzeCK47KeW0qrV0JlC1sjp6PlKY39CuVZrLyAJ9
	 kvsdUp8Fn1oD4O427AbB9fQ4afsNsR7YH3zgtpHMFVk1aOXqglS6njciZeT8tIvWU89LF
	 IHPh4Ar4qJjnLkaWk+AzrHI6crgDt5aCU5zmk/6lhEdu3ekPAmbpOnKvCFum8PoC5xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OfBSudXa;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2856F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2856F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OfBSudXa
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so5197841b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794874120; x=1795478920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=83Vz1ahixu5Z9IjP6rpbf1tvQV6iBDeIZHTmQxEZ/5Y=;
        b=OfBSudXaVpo7BHAU3Rq/WU7dcl8lWnpg35292KaDw7ILg9qLlHUxa2729iWP1Pdqhp
         5Xhsv0CWHbSWDILr4IEzxzSfTQ/q1QqggpvRuyGvorgl/omCpG/JovvjAQ+pe6x1OsMQ
         UCjrGC7J73KUmQm/ukTipMNynv1fnsUJxO+ZGSJTFgZ2FlQ4YsxFN8LX64Bp1gnxtrDx
         IX4XWnxQNwasxtSXO9DHbjj78E91/+PGvXGoyozzCVrnKOj8oTx4QVgFaFlvn4jmojdG
         /dyoiDj5HN/6r1T2M6J11WhPgceQ4eAj6qCikvwrmqeAU5GZ2QTqPSshlaLhep+Hqw5e
         RkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874120; x=1795478920;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83Vz1ahixu5Z9IjP6rpbf1tvQV6iBDeIZHTmQxEZ/5Y=;
        b=E/U+E9q7cywi9bGKuqmpl8+Llcbe8Lqh9PPZMPPsuHbGd+rsc+UJsRPkX+pvDb4AaC
         jHyOUCxXWNHJXHRfBzgth/HQA0URnBdAAo7elPyNUIdZipQfb7YK8n08iCiZOTuvikwf
         B1VeI412A2ApqXa1HYw5EmiFPQzkcY9jpA3ayWGrhYcy+sZMwHQKtOHs7MuPrDYnSarH
         lIEvkqGqFgP5K6nE4lu86bYFqKQsVYh6F7BdC/mmtGkHwU3wDA2IfLCtJburqanaomUj
         SJFRi2tAGLvX45xz0c42IIgCWWrZToGh1QLMdsFX5dGSQDfolYLbp7oLZRtRyMSnFope
         k2iA==
X-Forwarded-Encrypted: i=1; AL+hErFgKXhCtXyoyxdF7Ei8EG1I15KLFNpl5Fj49pnDUCBIBfToSnaUnvpVLmsxfxAX0hsCRJ/XRDoWgngoGiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eYt9Z9M+jJ9f+dDX5V6LmlfphBE0AWGmwXlcw3wxoCtAny1sE
	Dhf/J93skwlObb5wxq+rYVNtcc2BWqpy7PJryKebbyrVzm7kOJRrnMV++keqsaoTCs3FM5pAJKt
	KHEVrm9cTGA==
X-Received: from ilbeu22-n2.prod.google.com ([2002:a05:6e02:2f16:20b0:516:ba98:55b6])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f25:b0:573:fc:19af
 with SMTP id 5614622812f47-57300fc1cc2mr6842310b6e.14.1794874119661; Mon, 16
 Nov 2026 16:08:39 -0800 (PST)
Date: Tue, 17 Nov 2026 00:08:30 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117000835.1992893-1-wfelipe@google.com>
Subject: [PATCH 0/2] objtool/klp: Fix sympos for global/local symbol collisions
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Yi Zhu <chuyee@google.com>, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"

When a defined STB_GLOBAL symbol in one translation unit shares its name
with a static (STB_LOCAL) symbol in another translation unit (for
example, cgroup_storage_lookup in kernel/bpf/local_storage.c vs
kernel/bpf/bpf_cgrp_storage.c), runtime kallsyms lookup counts both
symbols together. Emitting sympos 0 for the global symbol causes module
load to fail in klp_find_object_symbol() with "unresolvable ambiguity
for symbol".

Patch 1 disambiguates defined non-local symbols across .klp.symid
generation, klp_find_sympos(), and clone_reloc_klp() (while preserving
sympos 0 when unique). Patch 2 adds tests covering both module (.symtab
order) and vmlinux (.klp.symid address order) paths, including
EXPORT_SYMBOL_FOR_MODULES() exports.

Wilson Felipe Pereira (2):
  objtool/klp: Disambiguate global symbols colliding with local symbols
  objtool/klp: Add test for global/local symbol name collisions

 tools/objtool/klp-diff.c                      | 11 +++
 tools/objtool/klp-symid.c                     |  2 +-
 tools/objtool/klp-sympos.c                    |  9 +-
 .../tests/generic/fixtures/sympos_vmlinux.c   |  6 ++
 .../tests/generic/test-sympos-global-dup.sh   | 99 +++++++++++++++++++
 5 files changed, 123 insertions(+), 4 deletions(-)
 create mode 100755 tools/objtool/tests/generic/test-sympos-global-dup.sh


base-commit: 141b164bbe186423e295b139e40e8e2d11cf1341
-- 
2.56.1.703.gf848ed807c-goog

