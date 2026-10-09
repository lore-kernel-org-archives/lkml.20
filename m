Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CFE440622
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551250; cv=none; b=WYyW0Zu319J/Shethyaz7Yh+zl07dbm7fcnkHilixxTeSR6NU01AP8Uxv8YBBYpaIvZA2r6JTroUbZQiesFTUotvEJf7nl6XqcnvuZIxn3qhKQTsljpJ2ODsw4OLU0coKivO4ay/Aye8gpBuEkugOXjo/LaknnsYkdCEdr9gEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551250; c=relaxed/simple;
	bh=iXFR9ZDroPC8hYwDTlPabrPWPRrxx7mtix5YVkBAALU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bLVXP128iTO81RuIlU9NCJFOCxjByO1zAxYEYXVETc//5/4EPUivro666PJmaX0wdXESXzdSkyz8YplTdEWhSRr5PYrYuvcQvMoniDn+eJz/7J0CzfUImqYeJawPYx4OIDnj946lIDy7iZVG+vpoIFZduHSMi6uEEa08cJEZy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqzp0dsL; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqzp0dsL"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so22973229c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791551248; x=1792156048; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyTZpLrCNrdls8dQU2/vvTYjILyrcRuksigXYBXy3Ak=;
        b=uqzp0dsL95TQ61xPAOo11b5TmrIgjVM80FTVYaXNUrRUUIOUmPjSI5SzrkSn9W6s8V
         7XRAI5e/ycxTd/0HGt2yn1JUJ/0+2JQsHszS9hYMfnGOY6rlh/SdIkrIyX16I+znP+xg
         5dFZGy9aVq2BlHZtE5pJvopNDZyu6uWoxcsCO+ofLCiYyA7x8DQEl3MpyhdxAmBtW96H
         LI+cEKc4L4rzKKyAck60A2z2s//MdCZDzbQl4mcVcUA22fV4236uaw0jx6M3sf7/8wbs
         Rd4gC4Q1GTBusSbn3F+qGppTKqykPhr00JaBeHMJaAH4DaDr84rjmVou8UKWoNtO7qSK
         lUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551248; x=1792156048;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyTZpLrCNrdls8dQU2/vvTYjILyrcRuksigXYBXy3Ak=;
        b=qLi/u5TVSJCS/cxmg2aWkHElPhibl1ulJQZjG9WSAy0NrDF3EV1JPNpgBrU0NboFV3
         XayXAo0SZqG9w+EaceiTPt5jzFnOS0DDRUB+YlPRkkxRPqJDvLk3NHjKJSyPFHFQrlXI
         NMN5f5xcm/TTkCz7ah1sV03t3LidDBSXoV0rPo19htUs5FhEg7GXA1v6xN6Viv+VlDtP
         RXHZHAXBjN3wgCtsVFNBdrHoMLfh++QStVBgh6HTS+UXDT5XPt12q71GkiGxDBW8AnKZ
         JMswGucEHf6imwozamMuZlgddmyyuFPAkQKpmGL6DsVJgseE9oWnBRRMmEnqaS7307kT
         m9SA==
X-Forwarded-Encrypted: i=1; AKwUvBwVGGjQ/iSVeiYb5VnIs5b9hvWHLoxVrlWkmifpUyQNPEVdpg7upFihbOArEz7TyNF253BVPy7e1ffyZ7s=@vger.kernel.org
X-Gm-Message-State: AFuF++mXFyAomE0bLm1wo5wjLme3jhVACiBC16rrgjCJiHfdCi98Tm6s
	IT4r/W3gShxYdXfE/ibAaCTDoHZNzGMCNW07hZyangnvolAXH/MStBMd9IWgAU2eCEKSZbimwrF
	RwQQNHR7n0lvK+w==
X-Received: from dlec7-n2.prod.google.com ([2002:a05:701b:4287:20b0:162:60dc:8d82])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2910:b0:143:6080:668f with SMTP id a92af1059eb24-16a61789c7cmr1870158c88.7.1791551247889;
 Fri, 09 Oct 2026 06:07:27 -0700 (PDT)
Date: Fri,  9 Oct 2026 06:07:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009130708.1370675-1-wusamuel@google.com>
Subject: [PATCH bpf-next] libbpf: Resolve typeless ksyms in the kernel
From: Samuel Wu <wusamuel@google.com>
To: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

libbpf resolves typeless symbols by parsing /proc/kallsyms, which
dominates load time for BPF programs with typeless symbols. This mostly
comes from needing to do thousands of syscalls and a linear scan of
kallsyms.

Call bpf_kallsyms_lookup_name() from BPF_PROG_TYPE_SYSCALL, such that
the resolution can be done with a couple of syscalls and a binary
search. This is a similar approach to what the light skeleton does. The
fast path passes the name and result through ctx, which requires commit
ae5ef001aa98 ("bpf: Support variable offsets for syscall PTR_TO_CTX").

Any fast path error (e.g. kernels without ae5ef001aa98) falls back to
the legacy /proc/kallsyms scan, including strong misses, since the
kernel doesn't match LTO "<name>.llvm.<hash>" symbols. Weak misses
default to zero.

Depending on the device, I see ~9-11x loading speedup when resolving a
BPF program with 11 typeless lock externs.
  - x86_64 VM, 6.18 + ae5ef001aa98: 147ms -> 17ms
  - ARM64 phone, 7.1: 626ms -> 55ms

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/lib/bpf/libbpf.c | 59 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index cb09ded90773..7564ec6bde64 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9590,6 +9590,58 @@ static int bpf_object__read_kallsyms_file(struct bpf_object *obj)
 	return libbpf_kallsyms_parse(kallsyms_cb, obj);
 }
 
+static int bpf_object__resolve_ksyms_in_kernel(struct bpf_object *obj)
+{
+	struct extern_desc *ext;
+	int i, prog_fd, err = 0;
+	struct {
+		__u64 addr;
+		char name[512];
+	} ctx = {};
+	LIBBPF_OPTS(bpf_prog_load_opts, opts, .prog_flags = BPF_F_SLEEPABLE);
+	LIBBPF_OPTS(bpf_test_run_opts, topts, .ctx_in = &ctx, .ctx_size_in = sizeof(ctx));
+	/* bpf_kallsyms_lookup_name(ctx.name, sizeof(ctx.name), 0, &ctx.addr) */
+	static const struct bpf_insn insns[] = {
+		BPF_MOV64_REG(BPF_REG_4, BPF_REG_1),
+		BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, 8),
+		BPF_MOV64_IMM(BPF_REG_2, sizeof(ctx.name)),
+		BPF_MOV64_IMM(BPF_REG_3, 0),
+		BPF_EMIT_CALL(BPF_FUNC_kallsyms_lookup_name),
+		BPF_EXIT_INSN(),
+	};
+
+	if (obj->gen_loader || obj->token_fd)
+		return -EOPNOTSUPP;
+
+	prog_fd = bpf_prog_load(BPF_PROG_TYPE_SYSCALL, NULL, "GPL",
+				insns, ARRAY_SIZE(insns), &opts);
+	if (prog_fd < 0)
+		return prog_fd;
+
+	for (i = 0; i < obj->nr_extern; i++) {
+		ext = &obj->externs[i];
+		if (ext->type != EXT_KSYM || ext->ksym.type_id)
+			continue;
+		if (snprintf(ctx.name, sizeof(ctx.name), "%s", ext->name) >= sizeof(ctx.name)) {
+			err = -ENAMETOOLONG;
+			break;
+		}
+		err = bpf_prog_test_run_opts(prog_fd, &topts) ?: (int)topts.retval;
+		if (err == -ENOENT && ext->is_weak) {
+			err = 0;
+			continue;
+		}
+		if (err)
+			break;
+		ext->is_set = true;
+		ext->ksym.addr = ctx.addr;
+		pr_debug("extern (ksym) '%s': resolved in kernel to 0x%llx\n",
+			 ext->name, ext->ksym.addr);
+	}
+	close(prog_fd);
+	return err;
+}
+
 static int find_ksym_btf_id(struct bpf_object *obj, const char *ksym_name,
 			    __u16 kind, struct btf **res_btf,
 			    struct module_btf **res_mod_btf)
@@ -9863,7 +9915,12 @@ static int bpf_object__resolve_externs(struct bpf_object *obj,
 			return -EINVAL;
 	}
 	if (need_kallsyms) {
-		err = bpf_object__read_kallsyms_file(obj);
+		err = bpf_object__resolve_ksyms_in_kernel(obj);
+		if (err) {
+			pr_debug("failed to resolve ksyms in kernel: %s, falling back to /proc/kallsyms\n",
+				 errstr(err));
+			err = bpf_object__read_kallsyms_file(obj);
+		}
 		if (err)
 			return -EINVAL;
 	}
-- 
2.56.0.385.gd3acb90ef8-goog

