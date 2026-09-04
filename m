Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372FA46D0B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519481; cv=none; b=JjZntyX3cZvzYzNRXpLIpQYFzQKOBrekz1EXHb5GECpdoxznbcsRnGqhyiv/W8XiOfQCH7pup1U/1RwBV6b80wJuCVOP55qA89E3G4RGpsYEp1fuD5drHcE7kw1DABRhfFheVQsw4B/4BDReFXcx5D7za3WFoc68YKeYV1tS2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519481; c=relaxed/simple;
	bh=1+oyirIC/p4rEsI0bgGWNd1dWOerQsHgGhQ9QynJmYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2s+l8Z/B10ao+PcDreIwtL0lhfsMFyKZaXhx8SDhPUaaiAYJn0nUwJnWNN3f32GE0SNT9m3uaDmJFbSCL+C/BdogaGtnrl7nGIRXa4mTx74NoaJ24vUg25EhNHZuiFOCL/8Qr3GU/7+DlxA+R+zTYjFK7yIZpxUkDYFrGe0snc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwgPz4fq; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwgPz4fq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso826584a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519479; x=1789124279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFdByt8yz5YNwoEGXt4FrpqsQt50qHUpKvAHd82Y4lc=;
        b=OwgPz4fqwFV5Zhm/Wvxmpgu6q66EuI8dUqCGfOOsc6Mw4wfYwq576l9fNGlOwVTaBr
         fJZOymp40rYBn6U37oelrOBmxw8mSArzjm/fCdIgSY+0fhG8l/FjFR/vd/j2o921liDK
         uLt0lFCejPKZxUmyLsFUb8vDhZjkgqLN82dM9pTvbCM3Vq6VBSEkNedORo13NqTVzhqS
         dmtczTWxVkIGFrWSHYYOKJ8n82YRRP0U7XWD6FcEn7Sn78oShxGk/DeZXWd2t55dBc/m
         WO6rtcJ/iQ+5oYA0AnnISQv5RNds3X1N+40FjIL9ChuyQwghndVVoTZsWoXQC+Nkyhc/
         DeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519479; x=1789124279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFdByt8yz5YNwoEGXt4FrpqsQt50qHUpKvAHd82Y4lc=;
        b=DdWslwRTGszo+Pk9WwT5HkoE2dal7UJ7csNZ2GvuV73nFbCxkuI13NEFB+qfpX4T1X
         TmTg508B6VqMZgglD+3Yph8P7IBDStc9fl2yyUuv+/lNnkWl/OIKavF8qHLP4f1kYvLM
         ZjXtn0LL2FjanrO6jZNwNEdRooTzG+Llyi02vsaK+iCKEE+5u1Yg1FK5A/X22X0W+6bo
         +i7bOxbVsU3I1zn3E1hOlyYgy33duW7udB9fKE5oKizUDz0E/Ls17/H50Rcw5JqEQ5Du
         c2fup+zjs2XITdmy8xVXQftpRZju1YwXTeWKdWaDn3E9cLYliG0eGeF8zsDskQ8DPGiW
         +Z2w==
X-Gm-Message-State: AFuF++nPnuwyFF8BrGL8F2AgSHsEmewWj41AL5BFAUCsOz81L6JfWz0U
	SY81KXKh7StrMeqTxlclV0DsMt9CpuPluwM6eb04xhn0e31PE2Ftqlic
X-Gm-Gg: AYBFou0JWhiLYC7xe61O8SxAbRmUqIy7DfaOHcfPVHAC87ESPhXR5B9IAnP1xaMFGM7
	9pTfXliuanDxsWtt5ZZhGe4kNMfBwuUf7KTNyUrk8clfNVnA5gNcmasnY/qiwNlfxqGmwsSXjQZ
	opHGwewCEc+JT1RZEV8NmegpOeQ0gHU6n4wwHbHN2885ZIfm6MIq5E6MTnrHoBk+E9UZYSPRyP3
	VkL3LRlTE5/SRKzqhstO4b+S62L4IOapNlVtnkvnlsD6elXlPmMOo6FakLrYOATEFjPQZ3FTswe
	X0XDI4GvqUhT8vxK8v7p5RogN31HB6dHdMS8XbxysZclG/2E3PtL+MpPpRIewkoNA5wHtjzgDqp
	aQN70FZg5WE4cjrGIfmmY1uPHm8B06dDS1tz8wR2C1/3yl7c9IwFr+ztslADGNmiMi3dr6KJQsM
	1M4DVQwzhxsKRJrijrPIJ8b/ahEMgrYvnJ+3n80e8xDxnmEtsEHhDPN/iAopRayWkqE8AOCiHgl
	aqV9q9NZdMUQl3dPAOqb4Ep+4Y=
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr7984015a91.23.1788519479286;
        Fri, 04 Sep 2026 03:57:59 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 2/7] bpf: fix typos in comments
Date: Fri,  4 Sep 2026 16:27:32 +0530
Message-ID: <20260904105743.39799-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105743.39799-1-hemanth.selam@gmail.com>
References: <20260904105743.39799-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/filter.h       | 4 ++--
 kernel/bpf/reuseport_array.c | 2 +-
 kernel/bpf/stream.c          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index 4a9bc6a848f2..0a067c2e923d 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -147,7 +147,7 @@ struct ctl_table_header;
 #define BPF_ALU32_IMM(OP, DST, IMM)				\
 	BPF_ALU32_IMM_OFF(OP, DST, IMM, 0)
 
-/* Endianess conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
+/* Endianness conversion, cpu_to_{l,b}e(), {l,b}e_to_cpu() */
 
 #define BPF_ENDIAN(TYPE, DST, LEN)				\
 	((struct bpf_insn) {					\
@@ -1029,7 +1029,7 @@ static inline u8 *bpf_skb_cb(const struct sk_buff *skb)
 	 *
 	 * In some socket filter cases, the cb unfortunately needs to be
 	 * saved/restored so that protocol specific skb->cb[] data won't
-	 * be lost. In any case, due to unpriviledged eBPF programs
+	 * be lost. In any case, due to unprivileged eBPF programs
 	 * attached to sockets, we need to clear the bpf_skb_cb() area
 	 * to not leak previous contents to user space.
 	 */
diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
index 49b8e5a0c6b4..4de08abfd94e 100644
--- a/kernel/bpf/reuseport_array.c
+++ b/kernel/bpf/reuseport_array.c
@@ -207,7 +207,7 @@ reuseport_array_update_check(const struct reuseport_array *array,
 		return -ENOTSUPP;
 
 	/*
-	 * sk must be hashed (i.e. listening in the TCP case or binded
+	 * sk must be hashed (i.e. listening in the TCP case or bound
 	 * in the UDP case) and
 	 * it must also be a SO_REUSEPORT sk (i.e. reuse cannot be NULL).
 	 *
diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
index be9ce98e9469..54f5be1289d2 100644
--- a/kernel/bpf/stream.c
+++ b/kernel/bpf/stream.c
@@ -24,7 +24,7 @@ static struct bpf_stream_elem *bpf_stream_elem_alloc(int len)
 	/*
 	 * Length denotes the amount of data to be written as part of stream element,
 	 * thus includes '\0' byte. We're capped by how much bpf_bprintf_buffers can
-	 * accomodate, therefore deny allocations that won't fit into them.
+	 * accommodate, therefore deny allocations that won't fit into them.
 	 */
 	if (len < 0 || len > max_len)
 		return NULL;
-- 
2.48.1

