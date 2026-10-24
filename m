Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823015;
	b=o3oWfEup0LN8IBCk11b61mbkVhhkclsJqyiTczAyLIhI/DMB3CBkZjMXHEL2+ErvduQQ
	 jTtTHZS11fCHJqWRiC111QHYYUm74pRvHKtNeXOAsTUaZFMpxsW4CPJwyIpozio5OoEh+
	 HP7eCcd1jvmNmBTiUsphiAw+/PRG6LBmfzTd2MLjzeLVVM50Zzu9zJKbOQd49YZK3TqLs
	 rsLbDON+YqgKEkq2Ipm5MEbZpiTN4fXftW2snIUDVn9tV/M9uUWNnL/E/SdBlLJIH2Q8B
	 zHSLVWj/HgNgpplru6PMkVFUpikh7f7Qe9p5XBESpn5GMTitQS+TrCMWXhryh/kc0zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8F8HFsYfAHizugxAtruo/TQMfMkYFk3uqtVD3fXKtyA=;
	b=WfUpGcW3HeUdz5idph3lYQBe7CRHsNHL3oBv5BK8sdkImQuwNZqqA3Fp+DZoZ3h9eLJl
	 Kcupnv12n8fvuBYRlPqusr3e9GFJzH2MGH5YN71sgyT82B9GkFqSy2MENHpMTlk13DXFY
	 SMB9hCswgRublrG68cJJJR+TE3UiSaVDGhIijb9+in6NTL3YftBn5CSswJQzPMWjdE87v
	 Jtf+8n85iBg7A7DbTnqXKEL+34WNErIDvFe06JsPWvEy/ATTZYTM3xLaBIxSJlshhKGCy
	 l+3M7JpdiDQ7XaFpMV6AZ1XVAzrIIe72es1ypZO0tRccCFZDJczkNFtgg8aNqaxsOFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jK09oEFw;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jK09oEFw
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3db57938so939314e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823013; x=1793427813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8F8HFsYfAHizugxAtruo/TQMfMkYFk3uqtVD3fXKtyA=;
        b=jK09oEFwLGaCaAW5UOad/IBCAAJTRhsjViMJ55Kkx72oPWMJadURHpLlS8jXIlWy3p
         3u9j8RFClSGCR5+Kp6QGXy43JY1poEwYMOmDynAtR55Z//KP4oi2pbPmJUUoRxAe+e6S
         DvMCEheSKTAzVycfFkNhB5XqLDUvSQ1S19Fh1flsatGFejJvyro4u2R+TGmJgWspk5Dl
         HO8mwg47pmNO+yo3iUP/Zhm/3QuUTxrWMdwE7mbJdRIqD1MuPk39klBB5Qg+tHCOPypk
         zm7+Xj0tV59XI6/g9vJQK9xhN0dqKYh9UC4oTKbzO1kbm6d2VNXXD+2gaDkV4zpMLJRw
         JQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823013; x=1793427813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8F8HFsYfAHizugxAtruo/TQMfMkYFk3uqtVD3fXKtyA=;
        b=eVn2fBRBKlwDRWA3xGR6mSA6pK5j3rDHTBCV9gkf6tKhO4ks3CIvxl1KMMWEnGla49
         CIiNzJAIDYs2vApNANmMbyb9r5u6r9oMCOK6NVh+nAfsp3SskxVo7nazw+/jONdr2eV2
         uGBsrcFqfS0RIItZ3FOIoplw1NzKRaEmqd9yizt0QFJFnkk4pK9xdod2AoQyQwFVv+q7
         zQw/X9DJBFBo9vLzOk35fyfV4tbDISnTQTpl9bGnMeWHu+cNsjnraHXxaDIWO7cQWw+c
         ty98LdoRdkGQEGFaTSjYlQlml7iM97Uf14awhXu/eItzrfjkCI8nvB5gDO9ToEDpyupf
         jsSg==
X-Forwarded-Encrypted: i=1; AKwUvBxSb1JzH0XbAOpNm5Bjfl4drT4qtdEo2oSJZhOl3vPcn+65q47mHK5mXRt4g7kDqn3G/WemD1vTPxYxZVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAEhX8bxQ5vJNy2RLWuSf1cn8uJ9Sz0Jxg8fWtq92f0XiBY6/T
	fuhkx/uxWrJ+DgElwFd4d5POaz/gPhTLQfeX/FhdmYjryGATWtKbUODo
X-Gm-Gg: AYBFou1NKwkIR9zl0rq4ul+QTVeWnT6mU4VlNsipllUsX1ZkBRigDyOofOSETo//FeL
	Org+dVFeMpIEoLUkkl66hvU6oUudPfA8L9XhUgv/n86kwjjuc2PHOZJPvH6fhjWXrP2LESC5kxX
	b9wHIx7lGaYqKsYXEFSi6HzoDpfFEFT3PepZ55QIGrvYQNhBRp6d0SHLUMgnjcv3wfVdBbXh6UO
	oCEilSJBq5FSgjLyo5zmLSXGQl8pXQRiP4zAeM0iUmWbJcN+So/psW4QJ2pR3G2bhCuh+tSnh/2
	QWfuE1/y6l9hyp6txHzJGqHwXIk3jICQqUtr8Gla8JeMVGfyNJ0QFyAiOVO7IGEi2eSM80jGxZW
	IDG6RI2wxSUXTVNs7pihjMHYmwLu5IFlyfO745Gn40Uj93hKOPCYp7/YnQNSJkREXJQiFiFtZf3
	OLqjYJc0aqGnxqn2oR1sPIfBVQz3nhBrmTewCFdR+oyCpnZAcVIoWrmhnpur50xWcx7kXPyFaVy
	Sd9sXvd53DkKEsK2nAS5kmX8JCb5Aw17xcfqADTqAOH+ocaYPGLFMqaSJFdnkGhj1hQ0apLV+GB
	0e/pDCiF1W8BgwA4hfgNBZ89nvUe8HqHjrc=
X-Received: by 2002:a05:6512:10c9:b0:5bf:b22f:19b3 with SMTP id 2adb3069b0e04-5bfb71b7e83mr399244e87.27.1792823012464;
        Fri, 23 Oct 2026 23:23:32 -0700 (PDT)
Received: from localhost ([196.240.54.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a75e0bsm211262e87.41.2026.10.23.23.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:23:31 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] bpftool: fix line info in multi-function CFG dumps
Date: Sat, 24 Oct 2026 08:23:29 +0200
Message-ID: <20261024062329.264086-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CFG dumper computes BTF line-info offsets relative to each function, but bpf_prog_linfo__lfind() expects offsets from the start of the whole program. As a result, line annotations in later functions can resolve to source lines from the first function.

Pass the program instruction base to the graph dumper and use the global instruction offset for line-info lookup and display. Keep function-info matching relative to the function as before.

Add a selftest with a BPF-to-BPF call that checks the second function source line in visual output.

Link: https://github.com/libbpf/bpftool/issues/178
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 tools/bpf/bpftool/cfg.c                       | 19 +++++----
 tools/bpf/bpftool/xlated_dumper.c             | 10 +++--
 tools/bpf/bpftool/xlated_dumper.h             |  3 +-
 .../selftests/bpf/prog_tests/bpftool_cfg.c    | 41 +++++++++++++++++++
 .../testing/selftests/bpf/progs/bpftool_cfg.c | 16 ++++++++
 5 files changed, 75 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpftool_cfg.c

diff --git a/tools/bpf/bpftool/cfg.c b/tools/bpf/bpftool/cfg.c
index e3785f9a6..65ec45469 100644
--- a/tools/bpf/bpftool/cfg.c
+++ b/tools/bpf/bpftool/cfg.c
@@ -383,7 +383,7 @@ static void cfg_destroy(struct cfg *cfg)
 
 static void
 draw_bb_node(struct func_node *func, struct bb_node *bb, struct dump_data *dd,
-	     bool opcodes, bool linum)
+	     struct bpf_insn *prog_start, bool opcodes, bool linum)
 {
 	const char *shape;
 
@@ -400,11 +400,11 @@ draw_bb_node(struct func_node *func, struct bb_node *bb, struct dump_data *dd,
 	} else if (bb->idx == EXIT_BLOCK_INDEX) {
 		printf("EXIT");
 	} else {
-		unsigned int start_idx;
+		unsigned int start_idx = bb->head - func->start;
+
 		printf("{\\\n");
-		start_idx = bb->head - func->start;
 		dump_xlated_for_graph(dd, bb->head, bb->tail, start_idx,
-				      opcodes, linum);
+				      prog_start, opcodes, linum);
 		printf("}");
 	}
 
@@ -432,12 +432,12 @@ static void draw_bb_succ_edges(struct func_node *func, struct bb_node *bb)
 
 static void
 func_output_bb_def(struct func_node *func, struct dump_data *dd,
-		   bool opcodes, bool linum)
+		   struct bpf_insn *prog_start, bool opcodes, bool linum)
 {
 	struct bb_node *bb;
 
 	list_for_each_entry(bb, &func->bbs, l) {
-		draw_bb_node(func, bb, dd, opcodes, linum);
+		draw_bb_node(func, bb, dd, prog_start, opcodes, linum);
 	}
 }
 
@@ -458,7 +458,8 @@ static void func_output_edges(struct func_node *func)
 }
 
 static void
-cfg_dump(struct cfg *cfg, struct dump_data *dd, bool opcodes, bool linum)
+cfg_dump(struct cfg *cfg, struct dump_data *dd, struct bpf_insn *prog_start,
+	 bool opcodes, bool linum)
 {
 	struct func_node *func;
 
@@ -466,7 +467,7 @@ cfg_dump(struct cfg *cfg, struct dump_data *dd, bool opcodes, bool linum)
 	list_for_each_entry(func, &cfg->funcs, l) {
 		printf("subgraph \"cluster_%d\" {\n\tstyle=\"dashed\";\n\tcolor=\"black\";\n\tlabel=\"func_%d ()\";\n",
 		       func->idx, func->idx);
-		func_output_bb_def(func, dd, opcodes, linum);
+		func_output_bb_def(func, dd, prog_start, opcodes, linum);
 		func_output_edges(func);
 		printf("}\n");
 	}
@@ -483,7 +484,7 @@ void dump_xlated_cfg(struct dump_data *dd, void *buf, unsigned int len,
 	if (cfg_build(&cfg, insn, len))
 		return;
 
-	cfg_dump(&cfg, dd, opcodes, linum);
+	cfg_dump(&cfg, dd, insn, opcodes, linum);
 
 	cfg_destroy(&cfg);
 }
diff --git a/tools/bpf/bpftool/xlated_dumper.c b/tools/bpf/bpftool/xlated_dumper.c
index 5579173a6..847241bbe 100644
--- a/tools/bpf/bpftool/xlated_dumper.c
+++ b/tools/bpf/bpftool/xlated_dumper.c
@@ -353,7 +353,7 @@ void dump_xlated_plain(struct dump_data *dd, void *buf, unsigned int len,
 }
 
 void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
-			   unsigned int start_idx,
+			   unsigned int start_idx, struct bpf_insn *prog_start,
 			   bool opcodes, bool linum)
 {
 	const struct bpf_insn_cbs cbs = {
@@ -374,6 +374,7 @@ void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
 
 	for (; cur <= insn_end; cur++) {
 		unsigned int insn_off;
+		unsigned int linfo_offset;
 
 		if (double_insn) {
 			double_insn = false;
@@ -381,7 +382,8 @@ void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
 		}
 		double_insn = cur->code == (BPF_LD | BPF_IMM | BPF_DW);
 
-		insn_off = (unsigned int)(cur - insn_start + start_idx);
+		insn_off = (unsigned int)(cur - insn_start) + start_idx;
+		linfo_offset = (unsigned int)(cur - prog_start);
 		if (btf && record) {
 			if (record->insn_off == insn_off) {
 				btf_dumper_type_only(btf, record->type_id,
@@ -396,14 +398,14 @@ void dump_xlated_for_graph(struct dump_data *dd, void *buf_start, void *buf_end,
 		if (prog_linfo) {
 			const struct bpf_line_info *linfo;
 
-			linfo = bpf_prog_linfo__lfind(prog_linfo, insn_off, 0);
+			linfo = bpf_prog_linfo__lfind(prog_linfo, linfo_offset, 0);
 			if (linfo && linfo != last_linfo) {
 				btf_dump_linfo_dotlabel(btf, linfo, linum);
 				last_linfo = linfo;
 			}
 		}
 
-		printf("%u: ", insn_off);
+		printf("%u: ", linfo_offset);
 		print_bpf_insn(&cbs, cur, true);
 		printf("\\l\\\n");
 
diff --git a/tools/bpf/bpftool/xlated_dumper.h b/tools/bpf/bpftool/xlated_dumper.h
index db3ba0671..d2af7bd10 100644
--- a/tools/bpf/bpftool/xlated_dumper.h
+++ b/tools/bpf/bpftool/xlated_dumper.h
@@ -8,6 +8,7 @@
 #define MODULE_MAX_NAME	64
 
 struct bpf_prog_linfo;
+struct bpf_insn;
 
 struct kernel_sym {
 	unsigned long address;
@@ -36,7 +37,7 @@ void dump_xlated_json(struct dump_data *dd, void *buf, unsigned int len,
 void dump_xlated_plain(struct dump_data *dd, void *buf, unsigned int len,
 		       bool opcodes, bool linum);
 void dump_xlated_for_graph(struct dump_data *dd, void *buf, void *buf_end,
-			   unsigned int start_index,
+			   unsigned int start_idx, struct bpf_insn *prog_start,
 			   bool opcodes, bool linum);
 
 #endif
diff --git a/tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c b/tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c
new file mode 100644
index 000000000..7d5b80927
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/bpftool_cfg.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <bpftool_helpers.h>
+#include <test_progs.h>
+#include <linux/bpf.h>
+#include "bpftool_cfg.skel.h"
+
+#define MAX_BPFTOOL_OUTPUT_LEN (64 * 1024)
+
+void test_bpftool_cfg(void)
+{
+	struct bpftool_cfg *skel = NULL;
+	struct bpf_prog_info info = {};
+	__u32 info_len = sizeof(info);
+	char output[MAX_BPFTOOL_OUTPUT_LEN];
+	char cmd[MAX_BPFTOOL_CMD_LEN];
+	const char *expected = "return\\ bpf_ktime_get_ns()\\ ?\\ skb->len\\ :\\ 0;";
+	int err;
+
+	skel = bpftool_cfg__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "bpftool_cfg__open_and_load"))
+		return;
+
+	err = bpf_obj_get_info_by_fd(bpf_program__fd(skel->progs.bpftool_cfg),
+				     &info, &info_len);
+	if (!ASSERT_OK(err, "bpf_obj_get_info_by_fd"))
+		goto cleanup;
+
+	err = snprintf(cmd, sizeof(cmd), "prog dump xlated id %u visual linum",
+		       info.id);
+	if (!ASSERT_GT(err, 0, "format bpftool command"))
+		goto cleanup;
+
+	err = get_bpftool_command_output(cmd, output, sizeof(output));
+	if (ASSERT_OK(err, "dump program CFG")) {
+		ASSERT_HAS_SUBSTR(output, "cluster_1", "second function in CFG");
+		ASSERT_HAS_SUBSTR(output, expected, "second function line info");
+	}
+
+cleanup:
+	bpftool_cfg__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/bpftool_cfg.c b/tools/testing/selftests/bpf/progs/bpftool_cfg.c
new file mode 100644
index 000000000..db01f20c8
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/bpftool_cfg.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+static __noinline int helper(struct __sk_buff *skb)
+{
+	return bpf_ktime_get_ns() ? skb->len : 0;
+}
+
+SEC("socket")
+int bpftool_cfg(struct __sk_buff *skb)
+{
+	return helper(skb);
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.55.0

