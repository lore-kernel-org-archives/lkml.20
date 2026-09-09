Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CDD2D7DDB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927880; cv=none; b=N+iBiTi2qZYqhvO2HZvvd2sZ2+hxF6aZsGQ1kfAgdz+6JN2WZjjPNiY0OFMKg4JGrwVUq6PbU7niyhlTP49W7aHuf+WLSlZ++qJYrWZ/XaCYtrizgcBZEujafoF99tWJC1AFNRGzwjINUU0uDAT28dr1aSMlYNGb+Fd5VLE6Bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927880; c=relaxed/simple;
	bh=spNBArVVyusluCR8HEBzqeF7RgGbrYySb/u8PvaMNVc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=E3DQFNQAo3pqyPWqGZlfLonQB03Pt3PKTNsnk9G+3hgqFBd8wEI7n0qPDGMyA+XPlO/P6MNsLs8CSgwQuBuzqqHsKToCPzOpMz7x2T9z6p0irKq53CaXvzhmuxwAxSIW8IUS+Ihy+CD5dcJDwopKRRR2EkWdKtwTvyhkHGbkzlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jrr70tR+; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tweek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jrr70tR+"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-854f274dd69so3046843b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788927877; x=1789532677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ttCXIFfaV/xzFfzjE7XBlUWQ5PPeokSAYapRM88n8hA=;
        b=Jrr70tR+X6b9twJQSFqZXjZktpdTZDoQEBgGjBl/H79DMJ9Zun0ppQ0Xno7xpxWErS
         TpYAdvGJ/Y5jxSfmct0Og9fFI/+WXmIGQhKSqntsi+EQyuaXVXcyktG4mChFLagrz7vh
         au68eiWBBI1diSNJtfEzb4zhA+mSMLxHq2J1j+KMLHc0TFS5HIjEzGRka8u+rV2hggCE
         iJiluK0kbtsON+eAiytXNYqAci/UZqKiTOICCcxFqXmUeemIhNQCe73EqwJ4RsiCiAEI
         mgy95XR+8hAXotXES9HzIgXluo6/hcjvo1XaUqJxpkwtMit7Gvv619PlyBReZk6Qczn6
         4Enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788927877; x=1789532677;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ttCXIFfaV/xzFfzjE7XBlUWQ5PPeokSAYapRM88n8hA=;
        b=bgOU9Lg5zqeJ0QxQhxNduexz1MO+sGvmwj8SHe/N9RXFOHg2SP5ArdE55udwMjOC0z
         klvvMcL/o9bNd9tS6RZSfFLT/NovWQNvmJ739NVB0b5qclrsa+CQqTXrSYzXY8eLlqMd
         ttG7w67NSeXRxdbyXvcRAxBz0/HkLg6mQpRrjcxWcvfobrAEu3VwBRjKy9B4eFtHd0Do
         JLpKSgvcK0k3zYDTHXwLP3lNEWTuc7fjjrxGy8Imo3X3AStFKp3l+LVCy5OCKx7NXNkT
         yDvbLxhsGfXKWX6fDBJDsHnj6Z79NkPQjQbCu1ZFmaw0b254W70KodStarhCGuPjcw9n
         ssVg==
X-Forwarded-Encrypted: i=1; AKwUvBwi6VUMwdatCXTgb2XPatm3ZBAH674nFx2jm7Gn9rA7Y2Xe/2gW9scLLYb4pzPCdvbTFctQ9AiZUqljpgg=@vger.kernel.org
X-Gm-Message-State: AFuF++kmMB3r+bU+orpmHfk+apN7e33i0kixpCCdQSNpKLrOS1JQ6G+B
	N8ucGG/DyvkYVYAgNinKpBSTLDGXbZ5eWVd0FAIolXsKQzpl+E4oXp0WYH6U8DREUr6ya5AdT6y
	00A==
X-Received: from pfjc26.prod.google.com ([2002:a05:6a00:9a:b0:84e:530a:923a])
 (user=tweek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1a1c:b0:862:803e:d8cd
 with SMTP id d2e1a72fcca58-862803eda1emr35070650b3a.6.1788927877171; Tue, 08
 Sep 2026 21:24:37 -0700 (PDT)
Date: Wed,  9 Sep 2026 14:24:31 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260909042433.1775591-1-tweek@google.com>
Subject: [PATCH bpf-next v2 1/3] bpftool: Skip non-autoload programs when
 generating light skeletons
From: "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	"=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>, KP Singh <kpsingh@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When generating a light skeleton (bpftool gen skeleton -L),
bpf_object__load() skips loading programs marked as non-autoload (e.g.
SEC("?...")), so the generated loader program only records and populates
file descriptors for autoloaded programs.

Previously, bpftool emitted struct bpf_prog_desc fields, link fields,
and attach/detach/destroy functions for all programs in the BPF object,
causing the loader program to store subsequent program FDs into
incorrect skeleton struct fields when non-autoload programs were
present.

Furthermore, bpf_object__load() can update a program's autoload status
during preparation (e.g. for struct_ops programs when resolving kernel
BTF members or adjusting autoload based on map autocreate settings).
Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace()
into do_skeleton() before counting programs and emitting struct fields so
that struct field declarations and attach/detach/destroy functions all
observe the final post-load autoload state.

Skip programs with !bpf_program__autoload(prog) when counting programs
and generating progs/links struct fields as well as attach, detach, and
destroy functions for light skeletons.

Fixes: d510296d331a ("bpftool: Use syscall/loader program in "prog load" an=
d "gen skeleton" command.")
Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
Changes since v1:
- Move bpf_object__gen_loader() and bpf_object__load() out of gen_trace()

 .../bpf/bpftool/Documentation/bpftool-gen.rst |  4 +-
 tools/bpf/bpftool/gen.c                       | 64 ++++++++++++-------
 2 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-gen.rst b/tools/bpf/bp=
ftool/Documentation/bpftool-gen.rst
index d0a36f442db7..1cdecf3e4fa5 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-gen.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-gen.rst
@@ -184,7 +184,9 @@ OPTIONS
 -L, --use-loader
     For skeletons, generate a "light" skeleton (also known as "loader"
     skeleton). A light skeleton contains a loader eBPF program. It does no=
t use
-    the majority of the libbpf infrastructure, and does not need libelf.
+    the majority of the libbpf infrastructure, and does not need libelf. B=
PF
+    programs marked as non-autoload (e.g., via **SEC("?...")**) are skippe=
d and
+    not included in the generated skeleton.
=20
 -S, --sign
     For skeletons, generate a signed skeleton. This option must be used wi=
th
diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
index a50540ef6521..e9a1a018f270 100644
--- a/tools/bpf/bpftool/gen.c
+++ b/tools/bpf/bpftool/gen.c
@@ -583,6 +583,9 @@ static void codegen_attach_detach(struct bpf_object *ob=
j, const char *obj_name)
 	bpf_object__for_each_program(prog, obj) {
 		const char *tp_name;
=20
+		if (!bpf_program__autoload(prog))
+			continue;
+
 		codegen("\
 			\n\
 			\n\
@@ -629,6 +632,8 @@ static void codegen_attach_detach(struct bpf_object *ob=
j, const char *obj_name)
 		", obj_name);
=20
 	bpf_object__for_each_program(prog, obj) {
+		if (!bpf_program__autoload(prog))
+			continue;
 		codegen("\
 			\n\
 				ret =3D ret < 0 ? ret : %1$s__%2$s__attach(skel);   \n\
@@ -646,6 +651,8 @@ static void codegen_attach_detach(struct bpf_object *ob=
j, const char *obj_name)
 		", obj_name);
=20
 	bpf_object__for_each_program(prog, obj) {
+		if (!bpf_program__autoload(prog))
+			continue;
 		codegen("\
 			\n\
 				skel_closenz(skel->links.%1$s_fd);	    \n\
@@ -676,6 +683,8 @@ static void codegen_destroy(struct bpf_object *obj, con=
st char *obj_name)
 		obj_name);
=20
 	bpf_object__for_each_program(prog, obj) {
+		if (!bpf_program__autoload(prog))
+			continue;
 		codegen("\
 			\n\
 				skel_closenz(skel->progs.%1$s.prog_fd);	    \n\
@@ -701,9 +710,9 @@ static void codegen_destroy(struct bpf_object *obj, con=
st char *obj_name)
 		obj_name);
 }
=20
-static int gen_trace(struct bpf_object *obj, const char *obj_name, const c=
har *header_guard)
+static int gen_trace(struct bpf_object *obj, const char *obj_name, const c=
har *header_guard,
+		     const struct gen_loader_opts *opts)
 {
-	DECLARE_LIBBPF_OPTS(gen_loader_opts, opts);
 	struct bpf_load_and_run_opts sopts =3D {};
 	char sig_buf[MAX_SIG_SIZE];
 	__u8 prog_sha[SHA256_DIGEST_LENGTH];
@@ -712,19 +721,6 @@ static int gen_trace(struct bpf_object *obj, const cha=
r *obj_name, const char *h
 	char ident[256];
 	int err =3D 0;
=20
-	if (sign_progs)
-		opts.gen_hash =3D true;
-
-	err =3D bpf_object__gen_loader(obj, &opts);
-	if (err)
-		return err;
-
-	err =3D bpf_object__load(obj);
-	if (err) {
-		p_err("failed to load object file");
-		goto out;
-	}
-
 	/* If there was no error during load then gen_loader_opts
 	 * are populated with the loader program.
 	 */
@@ -752,7 +748,7 @@ static int gen_trace(struct bpf_object *obj, const char=
 *obj_name, const char *h
 				goto cleanup;				    \n\
 			skel->ctx.sz =3D (char *)&skel->links - (char *)skel; \n\
 		",
-		obj_name, opts.data_sz);
+		obj_name, opts->data_sz);
 	bpf_object__for_each_map(map, obj) {
 		const void *mmap_data =3D NULL;
 		size_t mmap_size =3D 0;
@@ -795,22 +791,22 @@ static int gen_trace(struct bpf_object *obj, const ch=
ar *obj_name, const char *h
 			static const char opts_data[] __attribute__((__aligned__(8))) =3D \"\\\=
n\
 		",
 		obj_name);
-	print_hex(opts.data, opts.data_sz);
+	print_hex(opts->data, opts->data_sz);
 	codegen("\
 		\n\
 		\";							    \n\
 			static const char opts_insn[] __attribute__((__aligned__(8))) =3D \"\\\=
n\
 		");
-	print_hex(opts.insns, opts.insns_sz);
+	print_hex(opts->insns, opts->insns_sz);
 	codegen("\
 		\n\
 		\";\n");
=20
 	if (sign_progs) {
-		sopts.insns =3D opts.insns;
-		sopts.insns_sz =3D opts.insns_sz;
-		sopts.data =3D opts.data;
-		sopts.data_sz =3D opts.data_sz;
+		sopts.insns =3D opts->insns;
+		sopts.insns_sz =3D opts->insns_sz;
+		sopts.data =3D opts->data;
+		sopts.data_sz =3D opts->data_sz;
 		sopts.excl_prog_hash =3D prog_sha;
 		sopts.excl_prog_hash_sz =3D sizeof(prog_sha);
 		sopts.signature =3D sig_buf;
@@ -1250,6 +1246,7 @@ static int do_skeleton(int argc, char **argv)
 	char header_guard[MAX_OBJ_NAME_LEN + sizeof("__SKEL_H__")];
 	size_t map_cnt =3D 0, prog_cnt =3D 0, attach_map_cnt =3D 0, file_sz, mmap=
_sz;
 	DECLARE_LIBBPF_OPTS(bpf_object_open_opts, opts);
+	DECLARE_LIBBPF_OPTS(gen_loader_opts, gen_opts);
 	char obj_name[MAX_OBJ_NAME_LEN] =3D "", *obj_data;
 	struct bpf_object *obj =3D NULL;
 	const char *file;
@@ -1326,6 +1323,21 @@ static int do_skeleton(int argc, char **argv)
 		goto out_obj;
 	}
=20
+	if (use_loader) {
+		if (sign_progs)
+			gen_opts.gen_hash =3D true;
+
+		err =3D bpf_object__gen_loader(obj, &gen_opts);
+		if (err)
+			goto out;
+
+		err =3D bpf_object__load(obj);
+		if (err) {
+			p_err("failed to load object file");
+			goto out;
+		}
+	}
+
 	bpf_object__for_each_map(map, obj) {
 		if (!get_map_ident(map, ident, sizeof(ident))) {
 			p_err("ignoring unrecognized internal map '%s'...",
@@ -1339,6 +1351,8 @@ static int do_skeleton(int argc, char **argv)
 		map_cnt++;
 	}
 	bpf_object__for_each_program(prog, obj) {
+		if (use_loader && !bpf_program__autoload(prog))
+			continue;
 		prog_cnt++;
 	}
=20
@@ -1402,6 +1416,8 @@ static int do_skeleton(int argc, char **argv)
 	if (prog_cnt) {
 		printf("\tstruct {\n");
 		bpf_object__for_each_program(prog, obj) {
+			if (use_loader && !bpf_program__autoload(prog))
+				continue;
 			if (use_loader)
 				printf("\t\tstruct bpf_prog_desc %s;\n",
 				       bpf_program__name(prog));
@@ -1415,6 +1431,8 @@ static int do_skeleton(int argc, char **argv)
 	if (prog_cnt + attach_map_cnt) {
 		printf("\tstruct {\n");
 		bpf_object__for_each_program(prog, obj) {
+			if (use_loader && !bpf_program__autoload(prog))
+				continue;
 			if (use_loader)
 				printf("\t\tint %s_fd;\n",
 				       bpf_program__name(prog));
@@ -1451,7 +1469,7 @@ static int do_skeleton(int argc, char **argv)
 			goto out;
 	}
 	if (use_loader) {
-		err =3D gen_trace(obj, obj_name, header_guard);
+		err =3D gen_trace(obj, obj_name, header_guard, &gen_opts);
 		goto out;
 	}
=20
--=20
2.55.0.979.g7e5102b832-goog

