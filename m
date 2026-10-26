Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032201;
	b=T6hYNlpi9pKdoz28ZMaq33EGUu6ma23CfD95Wb+nkkk+HEGggFoDUi+bHMw0WBDIh7/S
	 hEZ5eOiKIYGNqu5eBuZkGnPzNG0NMBftG85NeRwb8IpCWvG8hhdHIyKnOMvGys3dNiJ+k
	 vD7kVufAQoqbyR37Yo+ZMG+VMvPFmrU6qJHeQ+ORX5JNqnqsjry+p9nAYxMUBQFf83S34
	 AfriYRASqU/cBPOzxXLdYeVgSPyXzj5wSOtxkKdDV95U6Sgv5SoNVZ/Tm9SBCxb9dohN8
	 2V0VBrYfLr68bwj16Nw2VK1Xkn7fUNupMSHIpJ1mqcvRHz5v+MmCBHuHepIsGjcHn6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jjilxrpwleM7JjznJ3SOmEz03/yuCCXHu5R1S91kJ5I=;
	b=JouTzg+amzMD+IsV+IHusNL+F6oLNXAWZIYJFlZT6H9fUqck5C1HUmx2m3QNmNbKySJR
	 GETeooR5iMTTIZPhOFe5nPEYchFfM/Hv/dTJZt2YrUYiDyQ2/dG0z55Adui0UY6gjyPor
	 CqrNycSS/p+3UOBE9gyJTkJuEncHyNys6RJ0owRGNrROiYgCqeV0ApPVI+aBK042Q8uf0
	 oRFKgSw7RIRAITUr28VuoaAx9yIaR3dcI7BxHFZbuovPy8oUM0M44WMlZ2Ry0bheIdewD
	 UlZXvmQD1oZOqHUwXTdRxUH893Ita35np/hAJW4kLn52J7q+910UPZdrsd9cUma5TPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MkplGEdg;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBCA60A6F43
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBCA60A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MkplGEdg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso3841133c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793032201; x=1793637001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjilxrpwleM7JjznJ3SOmEz03/yuCCXHu5R1S91kJ5I=;
        b=MkplGEdgwv61Zw8JhaNpM5yqOMQ8yrSLA258S+L/taf1GNFtMPZn1LO5xfzNxX2vHQ
         X6byKfV1WyVJTBy4kDP35Rn4sOSjwFOo7sx+4WGIuYgOZP0xcqgBxTvjW30gdSsPC2Ry
         gXUxNfNZv6wA84y2fYIZoRqmTjsCiTIi+t0GB5ZrmVkbDIhn0ZxyctJOpiq7rFOmLdW2
         8PN0rHwTJXzwpv1s6r617NdtDSEqIRMMaKHcZMCpriOSljWCYEAkiUFMSUE5D4lwOvGc
         +N8FNgdbv9yhn4MHBanaQ8wK0QU9r1955YxxHHGY4yuyHg8vj8ND1tGEhr8puZ0d8MJb
         1JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032201; x=1793637001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjilxrpwleM7JjznJ3SOmEz03/yuCCXHu5R1S91kJ5I=;
        b=xxaKdiKQoZE89QizjDB58dF85b3mMIOwZN3lu5Cb+TgIxtH7wpTf433h0D9jyLafeD
         jxkAtx/4zsDSE3xx4xaW2QrIe89gDlpGmO3QGPCu31uDfvf+QAWxuQlWOR/knbhWh5CL
         QWrOjCTmFw3n0zw5B715l9iaijTJD32rULJk4H+hkBX28JbnSBi8haYJOO/sPFXVJb+a
         CSBFwWwV/gUniro96wu0BvODV65isDS+zVaY0P+ItjHtA4mkUib+YWtFD4RSBjcacMuP
         C1PduMIef6kJXvp8ZGoZJP6VYkfwQ+ENNG5KxRjxJJ0u8mDJ45FhA4Z6bl4D/wIDYJUA
         K/Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxYGMXoT1cmbxJXecfXj5tknOX14nM1fTSpv/LmmrhmqoAZKPVsttFRkBG3HPflPEDUbaGql2pnaYZw/Ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXokqbeb7J5M1BZ7yUC1jYUPhTKtPzkN5yTfOkNNkOChFPNzGf
	QUl4/lbjru0TjCTUjqIlJCcN55TEFPlNVI9ebqpeGzcoqnOsjL2xlJla
X-Gm-Gg: AYBFou3Jd/RfhM/ELFh2PZf1tBE2QKbM4xMirBxvcz1jZEX7JbteTlKXrXRqg/Myh4C
	uH8tIm8ZdPKLfpIymjTK6hQs5yFK79DZEFJsMA5LUuITtoDNEZhLu+hqc+vwcD4iSMrOWdatlTI
	xqRMQbnbXqDSlr6hrqwNEAp+Rv/sNhj1Gub0Dbm3LALm7EFRTmjgJxEDQVKhxnEVaZsnTuXitcK
	SoEGkn7fcQVQpg+PO0GZ1lPvu7Iest8TIIMmnoNhgf1UQgVuR2dE9thrzk5TQrhQOQhN/V/5V4D
	4nL42YZSHfR2KqyOGrPCpFVHCY/ZlnZyuNnXjJdeNeqwqg50jPYyUH4lkqI+qT3Xd7BfgphgyQ1
	UwPJY667pDe7B9gFuYWk4pUT4w2a3kJKLxj1pQtezPbY1S/trCw6O4+F0pSuUrLQ8OafA1HdU9U
	WfJI47M77B2+d9aqzxChZfvqLu2eG2URbgppO9lLqS1AUhEcHkTMbWpP8eWwliLvi2FK6ZOkFm0
	LfWXfv2LFubGzFpD4Js5a01nusy+yfuXB2bOM/MH1bPr0srSRL4LEPVEu4jkJI1mIkiEDB0CcUs
	jnns2LXsaVwGOi1eIQlWLp3HKsuEWv1NHpqGrdeeahUPKGwBsG7DAFJq8raJKUQN4dCDbFoll5s
	=
X-Received: by 2002:a05:7022:ea44:b0:1a0:9d29:c32a with SMTP id a92af1059eb24-1a09d29c4c2mr4635325c88.9.1793032200306;
        Mon, 26 Oct 2026 09:30:00 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:f859:3f74:c064:3281])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm36119014eec.19.2026.10.26.09.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:59 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	Ayushman Rout <ayushmanrout27@gmail.com>,
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
	Mykyta Yatsenko <yatsenko@meta.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf v2 1/2] bpf: Fix bpf_dynptr_copy() for overlapping ranges in one packet
Date: Mon, 26 Oct 2026 21:58:08 +0530
Message-ID: <20261026162810.12862-2-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026162810.12862-1-ayushmanrout27@gmail.com>
References: <20261026162810.12862-1-ayushmanrout27@gmail.com>
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

When both dynptrs point into the same packet and the ranges overlap,
bpf_dynptr_copy() can copy wrong data in two ways.

If one range fits into a segment and the other one does not, the slice
of the first range is used as the buffer for __bpf_dynptr_read() or
__bpf_dynptr_write(). The range that crosses into a frag is copied piece
by piece, and an earlier piece can overwrite bytes that a later piece
has yet to read.

If neither range fits into a segment, the chunks are copied from the
start to the end through a 256 byte stack buffer. When the destination
is above the source, a chunk written to the destination overwrites
source bytes that later chunks have yet to read. For a copy of 1200
bytes with the destination 100 bytes above the source, the first chunk
writes source bytes 100..355 and the second chunk then reads bytes
256..355 after they were overwritten.

Do not use a slice as the buffer when both dynptrs share the same data,
and copy the chunks from the end to the start when the destination is
above the source, like memmove() does.

The selftests added later in this series pass with this change.

Fixes: daec295a7094 ("bpf/helpers: Introduce bpf_dynptr_copy kfunc")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
---
 kernel/bpf/helpers.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 648abe1ba63a..b74c03669b5f 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3291,8 +3291,10 @@ __bpf_kfunc int bpf_dynptr_copy(const struct bpf_dynptr *dst_ptr, u64 dst_off,
 {
 	const struct bpf_dynptr_kern *dst = (struct bpf_dynptr_kern *)dst_ptr;
 	const struct bpf_dynptr_kern *src = (struct bpf_dynptr_kern *)src_ptr;
+	bool same = src->data == dst->data;
 	void *src_slice, *dst_slice;
 	char buf[256];
+	bool rev;
 	u64 off;
 
 	src_slice = bpf_dynptr_slice(src_ptr, src_off, NULL, size);
@@ -3303,25 +3305,31 @@ __bpf_kfunc int bpf_dynptr_copy(const struct bpf_dynptr *dst_ptr, u64 dst_off,
 		return 0;
 	}
 
-	if (src_slice)
+	/* The other range is copied piece by piece. A slice of the same packet
+	 * may overlap with it, so it cannot be the buffer for that.
+	 */
+	if (src_slice && !same)
 		return __bpf_dynptr_write(dst, dst_off, src_slice, size, 0);
 
-	if (dst_slice)
+	if (dst_slice && !same)
 		return __bpf_dynptr_read(dst_slice, size, src, src_off, 0);
 
 	if (bpf_dynptr_check_off_len(dst, dst_off, size) ||
 	    bpf_dynptr_check_off_len(src, src_off, size))
 		return -E2BIG;
 
+	/* like memmove(): from the end if the destination is above the source */
+	rev = same && dst->offset + dst_off > src->offset + src_off;
 	off = 0;
 	while (off < size) {
 		u64 chunk_sz = min_t(u64, sizeof(buf), size - off);
+		u64 pos = rev ? size - off - chunk_sz : off;
 		int err;
 
-		err = __bpf_dynptr_read(buf, chunk_sz, src, src_off + off, 0);
+		err = __bpf_dynptr_read(buf, chunk_sz, src, src_off + pos, 0);
 		if (err)
 			return err;
-		err = __bpf_dynptr_write(dst, dst_off + off, buf, chunk_sz, 0);
+		err = __bpf_dynptr_write(dst, dst_off + pos, buf, chunk_sz, 0);
 		if (err)
 			return err;
 
-- 
2.54.0

