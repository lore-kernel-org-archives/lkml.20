Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FBF4EFFC1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680257; cv=none; b=ht1Ew0IGNdhuWZbwwt7qhyHmdv3xMJE3p8qp3R3VMpmW5bLo6vfHpCU2+RMTP/NBPAOViCGvD6I5wFFF4PQF1uXCtDpRUHKZufIaZ1mk412cPPGBSnfZGOEZxycJHUmZ/PyvCBXjloc9iQ8hQomt8D2MulAXz4mRnjIijRTqlDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680257; c=relaxed/simple;
	bh=JQwsMoeEs+CNvmeMuWW13D3vM2WUci5TzpK0FCUtx8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tDVvjEr+88B6G5R6pgYdl0P7lpTrWkGI70wNz99nAJkf5Sg5huHkrG6yYjIbIH/vipqcVUR2UxAlbom+z1qg5mLLbkdwgcxX1MJk2mw+tIzVHeD/BV3O9RKe/uxsHMcpbCfgQqwlyvigV3eX6ETOE15tOOBxHX1slof6cNeW2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHaaweRB; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHaaweRB"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso94308a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789680252; x=1790285052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3yXwVGjA/NLuu/ViMF+woKwPwB53HNXmf8EmdCK+hI=;
        b=EHaaweRBE9eOZEozJ02TsHeYR7Jb5omQJ/nQqF6gWLgafq7JlfqgflLDuKocRynEAc
         OKaWkLedUm9gbIZrJ045xhFxeTbVLmg+f+m6hqRh0ovwJTGbNdczj0rVrfHekt/Y3BUN
         RbkXGf+f+G5hr5l4R3fRT3qnomrwcpLly4Ey3oi0Uxh7jupJw7GUBeJXHz3zlRqOv2uO
         49l2oQobtNPVeqQIt4vXulYosXjCHgqLCQ9mBx38nZx9NLyV+qU4sx44kmzjupQTQ66m
         CmkEdR8KZ+4630WtQ7ZBUyYSkr4wqDkOO6DVEe8t0SdvG5yrpNsB5UPyguTXoYqvtGdV
         3AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789680252; x=1790285052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3yXwVGjA/NLuu/ViMF+woKwPwB53HNXmf8EmdCK+hI=;
        b=VWxyV9tzT4WgIe1EF70q3rK6YRBg8h+A211HGNLLW0yPArEJ4alsQ8kNIWy9aMKadW
         s3g9RIZkECqPs3gIkdzCvOXu2Iu9zqpt2pRQ9501GUClSVDhgMspSYeI14xp/u9wKcA1
         plJFC94ZMKrVxHTso+JP9jLiiDwa4AKT3q7+EM32mXhYZOrt6diPNg3I7qnc26edn8Ov
         WP7zJnBmXBIPYKk9IIFOyKaNaGB4XU72KFfBiZZOwCpiIrv0Nfp3GN/R/2g3dncE4LnE
         NwMyzRt4kRuBmFTGwrS4aj1iMjH/jj4yu9NuN5EtXW1rx0SPfMjLt+6jx+/BbNL7zDxT
         vipg==
X-Forwarded-Encrypted: i=1; AKwUvBwQNdOlWLIfVf+YoTo8XgUuvq4+3mdupctf6svjxmlAC0ZFq9aaW5je8MaJTejaCj7waMQI51GvjMwLtvA=@vger.kernel.org
X-Gm-Message-State: AFuF++mI5zJEEi1mbCzrOYNi32wdgzrpfNipwlnGuiIQB6v6sRiBiQXZ
	e89mvQOmauR6AyU+i5rI+gr+08WAhx2CDl5afls0amwD7+IgvHd9FNxNud1U7w==
X-Gm-Gg: AYBFou17wzTkMg9EygGNLt6SIE25lwxo4ijLxuxFCLOEnq2+eK+cwmt6n+kNMvKYZl/
	QOECA3lFRtJRsjWz6ZMEaYqfDawMz+8RIzD1y+EuM/Pgw0d2kukF0mMxMMjrT935adc3WCwcQu0
	VBrrsgxZbKlnNORYrEtPeRCTDXLCYBrHR24OhdBa7njHMN2U2UAf7nM5qciq5t4jh3BL5/+VhtS
	zfsVq2rDah7nNh99MT1ntXNddMV6sHDtpFzuubTC36/lFPEpqjEIsXzQWNvBxVLRR3A+pOBlXl+
	quA9afN5Ybg0RgWOLOlkzfwz93Pgg0T6NqrdNO3ZzQknmlg0uz+rNeNpyYnjG92hzsBhHoNhit+
	07dJVx1bs6dBF8h8XWmtKXuUUrNeXORaQf3HTDCPVD43EOcwK6BhrO/hKsNHuM/O3tcCcpFXmgA
	jq4y7W6YkUN2ckMkUT4L4uezJBojbCLVx+cbTVKUUcF8JuHo/4CPDhBzF25ooczNwHB6pkAqU4X
	zhZXbMv+HiSv0fs8sLYHfBba3E5Ym1m/qrSqbHDJAj2Yx3G0zoAfc3A3i4=
X-Received: by 2002:a17:906:99c9:b0:c29:61b9:7b3b with SMTP id a640c23a62f3a-c2a15829440mr43455866b.49.1789680252094;
        Thu, 17 Sep 2026 14:24:12 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2b0899sm4203118a12.31.2026.09.17.14.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:24:10 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: mhiramat@kernel.org,
	rostedt@goodmis.org
Cc: mathieu.desnoyers@efficios.com,
	martin@kaiser.cx,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] fprobe: Terminate the fgraph_data list when the reservation is not filled
Date: Thu, 17 Sep 2026 22:24:07 +0100
Message-ID: <20260917212407.384468-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fprobe_fgraph_entry() reserves shadow stack space for every fprobe with
an exit handler, but only fills it for those whose entry handler returns
0. fgraph_reserve_data() does not clear the area, so fprobe_return()
parses the unused tail as headers left over from an earlier call, and an
exit handler can run twice or despite its entry handler asking to skip
it.

Write a zero word after the last entry to terminate the walk. A zeroed
slot does not decode to a NULL fprobe on the arches that encode the
header into one unsigned long, since arch_decode_fprobe_header_fp() ORs
in FPROBE_HEADER_MSB_PATTERN, so make read_fprobe_header() return NULL
for a zeroed slot.

Fixes: e0a384434ae1 ("tracing: fprobe: do not zero out unused fgraph_data")
Cc: stable@vger.kernel.org
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/fprobe.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 1e9b00997ff2..9f2d98181779 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -171,6 +171,11 @@ static inline bool write_fprobe_header(unsigned long *stack,
 static inline void read_fprobe_header(unsigned long *stack,
 					struct fprobe **fp, unsigned int *size_words)
 {
+	if (!*stack) {
+		*fp = NULL;
+		*size_words = 0;
+		return;
+	}
 	*fp = arch_decode_fprobe_header_fp(*stack);
 	*size_words = arch_decode_fprobe_header_size(*stack);
 }
@@ -203,6 +208,12 @@ static inline void read_fprobe_header(unsigned long *stack,
 {
 	struct __fprobe_header *fph = (struct __fprobe_header *)stack;
 
+	if (!*stack) {
+		*fp = NULL;
+		*size_words = 0;
+		return;
+	}
+
 	*fp = fph->fp;
 	*size_words = fph->size_words;
 }
@@ -635,6 +646,10 @@ static int fprobe_fgraph_entry(struct ftrace_graph_ent *trace, struct fgraph_ops
 		}
 	}
 
+	/* Terminate the list, fgraph_reserve_data() does not clear it. */
+	if (used && used < reserved_words)
+		fgraph_data[used] = 0;
+
 	/* If any exit_handler is set, data must be used. */
 	return used != 0;
 }
-- 
2.55.0

