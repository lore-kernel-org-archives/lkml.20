Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799181;
	b=HaXxmcPxZDjCf1/Wzt8w4QufxvN2PiKG4God20gu3GmVm2NLoLTvZ/zJ8/zTPTsWxhAk
	 gPrs9oTkD/maR2HwIzm4sKf6/f1F7bU0shj2Bxm7rXvgmkNT9wQTf4S8QFt4kk9z4/GDf
	 BPqvoK/LXP8/Hwl+s4jhiWDuTdU/0Q95CNqfZLDXfq2IhywqsLReHirWbU/4HulIpBBIL
	 zm+VHycmqgIXzKeVnPxgpfZKPJ9jwdiQNx8k//rcZlXUlg1uAfiMKTrnEO7UEO8f87SN0
	 Z6DbrKxrpFsHdG/JNh6i6tO7GtH8EZHQ2idibCt8qmcAgLIC4LGWElNKjZCjls62mQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BtUDms6tpi+nE+r7gyE10bk7/san5lmoIg9n8+3rKQU=;
	b=V7UP97Cg5LR8DMWK309QaRlypp26v1vQ3b10WKtbwXztTkipOVpJHIkubgeV/xvX7Rqv
	 wGh1QR4wVNAowFn28CEV4pkd1XLzbQz+SKaLXMIMM+rcjvS6UoHB/srKtjVlxnmUKe++Z
	 z/tdYVsGwWqrpUD15UrlnqTXT6UoaIKrrAGj116tFzW4/6FSgi3BijCW9imjNfa6z2t2t
	 oK8r7AOTxJGfUxv+erENzHOnaUab2f1DoGTtpNlyd4bIyZc/9LeH30/lAiSS+d0oZ4P2k
	 B9noDIaElQcamoAVrtFmXouEuuHFQ0Rkk3S1YU9XE3sit4SPJiUvcWO94rSWRABvNXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GcN/LV/H";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC67606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC67606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcN/LV/H
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so490909b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799181; x=1794403981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtUDms6tpi+nE+r7gyE10bk7/san5lmoIg9n8+3rKQU=;
        b=GcN/LV/HIH1Xmb868pqPOjrpb1ZToKd5e6dgYQ031twi3fONu777YkAzZj9Fat5e4t
         bGAIC5u3prxkI9e2MbELTA4EZBsMxdXI+bplwcrSn6J42i7/uFfAdmLRtq0AK8Jtnfuq
         1RZPvLJo96gV0jpEleSLW7x0yPsMaYOKXPnLfzek5P+eOlXXOLNGHqQ9fgyGMEJ80SN3
         lhr3nX3U1BhlPjA+e9wbpzemNeuDGkQpNmavbzSoAq9SaSI9T0QuK5bExkvhbTrXZ7K6
         S7HxwMCqdwHsymdE1Ea0o0O/JHP1A1xTs8G4hA3Q6+a7/RYk3BAik5XtZamN6K0DzOqY
         //JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799181; x=1794403981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtUDms6tpi+nE+r7gyE10bk7/san5lmoIg9n8+3rKQU=;
        b=KoEE3kW6359GOW6921pdbTcJDxGVcD8zR4HGf+zoxxhQqp2Bdmfwv9US9UwEYVQl51
         I0XPqvDXzVj0wqKApf9Rbw4CcTfab38zigffZua/y71g2/5EIDJqv8KjnR+kn0xkxjvR
         mYJLik0jm5myzBE3fWh6XxrmeciFI4c1Oq2mT0xuT3V4s+/S+h/5VUJAz9TpsDHXDaX/
         Ifu30pL/KguuiEVauo6cXlCPc1eUUdh228DPM2Ory8cVXiWzVb23poJnp+DWq16REfaR
         Xwse4dwR9Gg+kKr1xJaPcMrIrQmk7m1Y6H0jTb4tYI8xhqpcSvgAKOmaz63Hvq55OC7Y
         5b8g==
X-Forwarded-Encrypted: i=1; AKwUvBzbziopJ/l9eBUgBECCNDhPZaDboVlztOgeRtdtP/NpY0vzPIxaJAs8uGxh4HptXGckgCVhVL8cYV32M4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z++xkD171eFPSQ+5VcpW12lzh/XZ96RGtQ7cT5flatmBxs2Tfa0
	gKq0uiBJufzomhjUgqM35q/D7gg1yLckTAQllnQNGkkdsVTUA86ab/Qu
X-Gm-Gg: AYBFou0OAuBCjS2cgybnE0DuQFvNsjWEkgjW0FZN+/DbQx5xM7Xi3NHI3VmvxsWSb6B
	SenomciEiN1/1Bx3bZJIJJZ9YpQg5tsWLIKaB7f4rIDwm7qnsl5FQ4AIeWZhDFcGY2XPCIxH0RI
	PT/xtT9oKqrGALOR9zXKTyu5C/8chCXMenXiYhT5+FkH/RnqzD1jO/UMBMxRLoMeFutx52vNi+X
	Iet0EJewtZD/K/C9bH6H7wqqjDSq+mWcnMLDdQiwIqXWBIQ/fXwCsLhJtn0G0AwGcgzO2PJNHLR
	c63rOfyfWLqJ632MV/PTNhcAkN/SAStZ69E5qY6WeNBXxttUba0wm8MEWbhgRTMwMam0W/hYpA7
	tJleEffZxlum1N+Be/bGbTCfnhtc2GwVtmuRqO2c+FHJq6Cmv4eST2m5WsQfeVwiBpGNOp0hJwo
	uCncTORoYpWQVwzPDlfcyUQ5Fi4hStWNwNGvZMcNqPgTkwlDnKcKN4SW1QTceRT2yKgVONpfPMO
	nDMDCka9/thyd0opBrnD6DownsVuFx6hA21uy+2HFs5anluBr7y9moI4592XAl6qRviF9FziJgt
	uhjWsiJ1rpYy/fx+3G6rUlLiWSTVJii1077wMpCM01DgEBf66Q==
X-Received: by 2002:a05:6a00:a229:b0:8a0:76ea:36e1 with SMTP id d2e1a72fcca58-8a9ba229da4mr14126529b3a.7.1793799180837;
        Wed, 04 Nov 2026 05:33:00 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:33:00 -0800 (PST)
From: Longjun Luo <luolongjuna@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org,
	puranjay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longjun Luo <luolongjuna@gmail.com>
Subject: [RFC PATCH v2 08/11] objtool/klp: Include symbol identities in reference checksums
Date: Wed,  4 Nov 2026 21:31:54 +0800
Message-ID: <20261104133158.3187525-9-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104133158.3187525-1-luolongjuna@gmail.com>
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
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

Hashing only the target's suffix-stripped name can hide a reference change
between different objects with the same name.

Prepare DWARF identities for checksum calculation and hash the identity
path for named references. Keep the existing checksum section format and
use suffix-stripped ELF names when no DWARF identity is available.

The three tests rejected by policy in earlier patches remain rejected.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. Only local-to-global-flip, sympos and sympos-vmlinux fail,
reflecting the linkage and duplicate-identity policies.

Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/klp-checksum.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/tools/objtool/klp-checksum.c b/tools/objtool/klp-checksum.c
index 1a5f2fa89baa..44c0eb784e57 100644
--- a/tools/objtool/klp-checksum.c
+++ b/tools/objtool/klp-checksum.c
@@ -77,6 +77,12 @@ static bool is_const_reference(struct symbol *sym)
 static int checksum_object(struct objtool_file *file, struct symbol *sym,
 			   unsigned int depth);
 
+/* Use suffix-stripped ELF names for references without DWARF identities. */
+static const char *checksum_name(struct symbol *sym)
+{
+	return sym->identity.path ?: sym->identity.demangled_name;
+}
+
 static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 				struct instruction *insn)
 {
@@ -110,8 +116,8 @@ static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 			__checksum_update_insn(func, insn, buf, len);
 
 			if (call_dest) {
-				__checksum_update_insn(func, insn, call_dest->identity.demangled_name,
-						       strlen(call_dest->identity.demangled_name));
+				__checksum_update_insn(func, insn, checksum_name(call_dest),
+						       strlen(checksum_name(call_dest)));
 
 			} else if (jump_dest) {
 				struct symbol *dest_sym;
@@ -127,8 +133,8 @@ static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 				if (!dest_sym)
 					goto alts;
 
-				__checksum_update_insn(func, insn, dest_sym->identity.demangled_name,
-						       strlen(dest_sym->identity.demangled_name));
+				__checksum_update_insn(func, insn, checksum_name(dest_sym),
+						       strlen(checksum_name(dest_sym)));
 
 				offset = jump_dest->offset - dest_sym->offset;
 				__checksum_update_insn(func, insn, &offset, sizeof(offset));
@@ -170,8 +176,8 @@ static int checksum_update_insn(struct objtool_file *file, struct symbol *func,
 		__checksum_update_insn(func, insn, &sym->csum.checksum,
 				       sizeof(sym->csum.checksum));
 	} else {
-		__checksum_update_insn(func, insn, sym->identity.demangled_name,
-				       strlen(sym->identity.demangled_name));
+		__checksum_update_insn(func, insn, checksum_name(sym),
+				       strlen(checksum_name(sym)));
 	}
 	__checksum_update_insn(func, insn, &offset, sizeof(offset));
 
@@ -265,9 +271,9 @@ static int checksum_update_object(struct objtool_file *file, struct symbol *sym,
 						 &target->csum.checksum,
 						 sizeof(target->csum.checksum));
 		} else {
-			__checksum_update_object(sym, sym_offset, "reloc name",
-						 target->identity.demangled_name,
-						 strlen(target->identity.demangled_name));
+			__checksum_update_object(sym, sym_offset, "reloc identity",
+						 checksum_name(target),
+						 strlen(checksum_name(target)));
 		}
 		__checksum_update_object(sym, sym_offset, "reloc addend",
 					 &offset, sizeof(offset));
@@ -387,6 +393,7 @@ static const char * const klp_checksum_usage[] = {
 int cmd_klp_checksum(int argc, const char **argv)
 {
 	struct objtool_file *file;
+	struct symbol *sym;
 	int ret;
 
 	const struct option options[] = {
@@ -411,6 +418,12 @@ int cmd_klp_checksum(int argc, const char **argv)
 	if (ret)
 		goto out;
 
+	for_each_sym(file->elf, sym)
+		sym->dont_correlate = dont_correlate(sym);
+	ret = prepare_identities(file->elf);
+	if (ret)
+		goto out;
+
 	ret = calculate_checksums(file);
 	if (ret)
 		goto out;
-- 
2.55.0

