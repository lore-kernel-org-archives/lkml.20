Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF4449B0C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520671; cv=none; b=X1lCzc1r+MwwpP+sJVFB1OYDmZyW5RdKaIw1/k1hQyuJE0GKzXX+rIsFVQzcDX2/k9IrQZz5QsseCDnp8QiR77DLuzD0YO1io/JSwV2Pr5V1wDURWRAfyDJHeGd+my5qZeDResnvfvR/Nc86aUxZIPCBjF08QSFHExFFbPRXYRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520671; c=relaxed/simple;
	bh=zTBizNpKtLSPwFZHxtHy4hNNKWWCzaj01cIzBDvTbX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmVoulJjeSfT1wsR6GFe5nbHWRClitSl3bqesE5Q95gwXvg3Y5ojXzXhIyZT6/omFIigrGTrsNw6c+j2lk7sheQgQtILzjLyde9OaUGeJcbXvMCtZNRA6l02BaVf1e1o53WLrjI/yQivi0SVBJPnn7tTzmc3XvBdYOuMOYHV4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmlD2FUT; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmlD2FUT"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5302b692c8eso9878891cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520667; x=1789125467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfFWJk7PUW5CrjR05hNpDl61wr3Ggr/JyLicmdvD02M=;
        b=pmlD2FUT6C9OtuQeDRP82EDckNrrO7ndxIhp9tX8/4EyJhTj6UHvYzDZZri2KNMVIw
         gIstLQTB67yCTXsWrIS473nEU0D4zsytuZl6cIGvF1dQPIH19Ti6HnlWdWy50c/PFbAV
         n06OQXfITjQjeF6HQqQsAAIKqz6tC3143HQu4L5RcQWoiieKOsqecH49IvtWoTXPwJgt
         qxzcub3yrd/zX+VHq+R/pj7x1AHBThEPN6gE0+dDR3UsqUlhWPkUOUryUPWTTV7io1HO
         5A1zv+b27aGU766D/GsMzbAjRDcrcBayF60W0ZHIPhJxDP5rNpqWFx+XeqU3uhEi2IYr
         sV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520667; x=1789125467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfFWJk7PUW5CrjR05hNpDl61wr3Ggr/JyLicmdvD02M=;
        b=E/FIuomSzYBCFxlmofR2FWGinJD+E9C4EJH5rhk4MkpE1bRtFdYw7EeOphPCuAAH3m
         Evv07NW43+IHrkMWU7uBR5jgvtrtpWTZfPilCRZmDqfyCsCqapfq5kftVkXcR15HbhiZ
         I0mngwUKbvN0jxl9jK50YPqycDqHYAD3IL+Gq4FCKD7JMauZsJBGRLWOZDY5wEYRGKs4
         rFfbeWLcaKOT5+k/Y6QQv3ROkA+U/OMBtMbQNAN2sBqI4pmohNFaTvL8iLxavd51s0Q1
         JQGnzbspz8ljpONFbd5cQ/72U53wWi8JIPFLT0mlNd4y3hE6wo38AVTmLwhxxoZljPxc
         XZXA==
X-Forwarded-Encrypted: i=1; AKwUvBxtIE0jCbNL/YJSJxttHri+L19t4OzA9T/9lawTxlvZVE0ckFURkwQop118Sg9zqBkILc/8zgKlJA2R13c=@vger.kernel.org
X-Gm-Message-State: AFuF++nI8cUNHWxcKbdikEr5/SbM2gxetTplAkMnkwKOIGxFOO7BGM4r
	6mpxHA0IVbGD3ao307+1kkmtWuMd/yzFi8PpF9X+zwRZcMewqAw9tz9w
X-Gm-Gg: AYBFou0ocVdwLZiEZDDBmbYenmZIZt40injvxLen1V/6sc3F/S1TAN9FAxWrRIt34vg
	CkCMKp0hD6l3/erwZKJr8DldEbtHRfyrPeLNYa880PB2YoW6Pb7swEemgvMnw0lscEM5i/DUz7G
	TTyl4P6JVKIXW2zUfBumLVESbxTYv7PWpZaln2cT75msSW2I76joHxEV2u1VsNVY3xFNUMNmpa8
	N1dMdwrMQnOssf9e5giNpy7O0qoqiLIUJiH1uVtYrqNQzZBGc70HMIeJbeO8/eKdqJFp+C2TrY4
	wy/fw4+Dz+jz2xlDixEHugm77zsqlbTefJvMV8Uq/9wmuLyYbxXiULAyz5W1Gaj/L/T1RJIcamD
	6U7vYyuy7E5SIGfWGEWLyHs/ke0YQlASd/9o0ml89sgleJNjEvAWRqXGniDbFGXCkixqdKChO2+
	sKVWvqTkvu+7BDfjatm+tlzYhWtmAB9Q+LL2Hklt9yguc6CA3TXETk4mRV
X-Received: by 2002:a05:622a:c88:b0:530:42f6:82a7 with SMTP id d75a77b69052e-53054a16543mr56198681cf.47.1788520667203;
        Fri, 04 Sep 2026 04:17:47 -0700 (PDT)
Received: from Turin ([187.15.144.163])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a8fcsm18350171cf.1.2026.09.04.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:17:45 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	johan.almbladh@anyfinetworks.com,
	paulburton@kernel.org,
	tsbogend@alpha.franken.de
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 1/2] bpf, mips: Factor register moves into helpers
Date: Fri,  4 Sep 2026 07:17:30 -0400
Message-ID: <20260904111731.673341-2-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904111731.673341-1-main.kalliope@gmail.com>
References: <20260904111731.673341-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BPF_MOVSX carries its source width in insn->off. Both MIPS JITs
currently lower register MOV instructions directly in build_insn().
Keeping the forthcoming MOVSX width switch there would split the move
operation between dispatcher cases and backend emitters.

Factor ALU32 and ALU64 register moves into helpers for each backend and
route the existing MOV paths through them. The helpers own the complete
move operation, including MIPS32 register-pair handling and the ALU32
upper-half state. This keeps the following MOVSX width decoding inside
one per-backend, per-width-class move emitter rather than in dispatcher
case arms or generic primitives.

Keep the verifier-inserted zero-extension marker on its dedicated path.
No functional change is intended.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/mips/net/bpf_jit_comp32.c | 22 ++++++++++++++++++----
 arch/mips/net/bpf_jit_comp64.c | 18 +++++++++++++++---
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index 40a878b672f5..bfe73b023983 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -190,6 +190,22 @@ static void emit_zext_ver(struct jit_context *ctx, const u8 dst[])
 	}
 }
 
+/* Register move operation (32-bit) */
+static void emit_mov_r32(struct jit_context *ctx, const u8 dst[],
+			 const u8 src[])
+{
+	emit_mov_r(ctx, lo(dst), lo(src));
+	emit_zext_ver(ctx, dst);
+}
+
+/* Register move operation (64-bit) */
+static void emit_mov_r64(struct jit_context *ctx, const u8 dst[],
+			 const u8 src[])
+{
+	emit_mov_r(ctx, lo(dst), lo(src));
+	emit_mov_r(ctx, hi(dst), hi(src));
+}
+
 /* Load delay slot, if ISA mandates it */
 static void emit_load_delay(struct jit_context *ctx)
 {
@@ -1485,8 +1501,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_mov_i(ctx, hi(dst), 0);
 		} else {
-			emit_mov_r(ctx, lo(dst), lo(src));
-			emit_zext_ver(ctx, dst);
+			emit_mov_r32(ctx, dst, src);
 		}
 		break;
 	/* dst = -dst */
@@ -1555,8 +1570,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r(ctx, lo(dst), lo(src));
-		emit_mov_r(ctx, hi(dst), hi(src));
+		emit_mov_r64(ctx, dst, src);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index fa7e9aa37f49..45fee6f6b87e 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -120,6 +120,19 @@ static void emit_zext_ver(struct jit_context *ctx, u8 dst)
 		emit_zext(ctx, dst);
 }
 
+/* Register move operation (32-bit) */
+static void emit_mov_r32(struct jit_context *ctx, u8 dst, u8 src)
+{
+	emit_mov_r(ctx, dst, src);
+	emit_zext_ver(ctx, dst);
+}
+
+/* Register move operation (64-bit) */
+static void emit_mov_r64(struct jit_context *ctx, u8 dst, u8 src)
+{
+	emit_mov_r(ctx, dst, src);
+}
+
 /* dst = imm (64-bit) */
 static void emit_mov_i64(struct jit_context *ctx, u8 dst, u64 imm64)
 {
@@ -656,8 +669,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 			/* Special mov32 for zext */
 			emit_zext(ctx, dst);
 		} else {
-			emit_mov_r(ctx, dst, src);
-			emit_zext_ver(ctx, dst);
+			emit_mov_r32(ctx, dst, src);
 		}
 		break;
 	/* dst = -dst */
@@ -742,7 +754,7 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		emit_mov_r(ctx, dst, src);
+		emit_mov_r64(ctx, dst, src);
 		break;
 	/* dst = -dst (64-bit) */
 	case BPF_ALU64 | BPF_NEG:
