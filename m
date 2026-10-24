Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834108;
	b=TuoSIbGeM/5VGzQJaqvDYTSVZCzddtfc+3WELgwCbjY9VQYLY7aRh+2ng2rkBf+SmgEr
	 rYkYo1S+Eup+NbPQw0AeasqjJbh93cGoMaRHHZLQ9RTJdZdZt4kkBNnvrcOC6X8dUvPc6
	 jmW7wcwTGjxLahxBOfyccYu/oq8iE+JTlYfZ4aqCREUj6s9ztseMmHRo7WAREOX2tJPW5
	 p3AW1NyhWl23l0HSPjuc5AdopKHydSgYNbbg5p6ipvkBUQjv2VlPUZ01lCwEgnTHl5rkb
	 mlTY7oEqJsZJTm37Xmja0uL7hkOXoY9dEwA/IG0qC9lUguD6FN6PJLKx8he6cWdf3eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BlUUlyu0tLkS0StKgW3SUYx8agTboJGWzFSZtZkcXsU=;
	b=MPOMF5/A0zTuWAte1xc4NA4HcEVnI/r0awSJUtb0oh7s3b67VLJaD6EfG1JcQ5CggZ00
	 tjmXAt8qznSNU7aj2BrMYpP83BD/PuEwE05Hb5wbXIVDWJ7jws/YUlD0gCn2JcHtTFPR6
	 lIv18/yQGamXbQqm/PAVlspQ9pRkyHHbUD230PgKzU6bE+BkckHKmEl4O/OprD/SfO374
	 vWdOkGzJ3XrMaIfHwbTh0Be5fJfX20NYWIueE/u8DTMgf9iql+Tw+EbK6wftrurooimt0
	 DErXQ8zi8vU6ugUvZcVxX8ipVH5LxIqM9qJMDoKoJ0MH6ZETaZAISC4pPj9yaBvpEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b9nh1GtH;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D9B606AC08
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D9B606AC08
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b9nh1GtH
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35b2c599f43so135791eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792834107; x=1793438907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlUUlyu0tLkS0StKgW3SUYx8agTboJGWzFSZtZkcXsU=;
        b=b9nh1GtH2+skTNF5DZP9gibDmo1B8XDJqOyw8/vQ6Hd74v9sFQ35s9Tesqt2FOb1pP
         Qo+VkuBPh1UAfxNNdXvzZGy5dqQMvfL8wWV0KkiOjlsFAuZ0jB6LU7PN3kr0OA5okfZ1
         dCa8a0oNrk/TJERvUoac8eX8GqwJLdaZZWx8w6Oy6xH8AeLiCbXskMox7qS6zJHcGA/U
         Lba7qXFG+eJRjcwzpwWBJ3wKgSpWdlLk6fRDtV/K8AOowXnUzZknZB8RmFwwORREa4Eu
         pmaYVLGyAojs5xhQUTZoEUiULZRwwY9pWKlF4nr5LKVBGz3/bIONFndeO7oDFWw+ILxa
         2Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834107; x=1793438907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BlUUlyu0tLkS0StKgW3SUYx8agTboJGWzFSZtZkcXsU=;
        b=pxGICdPRSJcTN90DQjpPu9/Qql4Cmwm4JUNfaz8LSMxixZdky5VG1rk3zq1b5SABhK
         R13JgEPO8k2pG2JuhartRt1Bi/OeRrJ9P559WO6qAQWU0Cz33wy7nHnYvl+gE0DJ9vxF
         +yr/t2Mqf3p1dOd/m27BZxtAVyiqZzRP2vo18+y4FugLwMLpqm2sCwZJbPX8HQ80XPPk
         7OmufDZZHaXOtnbVZFP3dS+L+u2Hr7jt9kKZ6fNogtu30PCWYyRmiWnyToJJ8aJ14OIe
         m81clWNHbBIrzWBwnou7Ld4FkzQBE9qzEgF2MxEpprcK0XPAtrRCPRQwLmNVs40vlsAG
         V/yw==
X-Forwarded-Encrypted: i=1; AKwUvByU634GGhWAc3E89EnUt5EwUxgUI7itq2MDRMOvlFtpn1Xe7rsv9vR8oP7AIuHo3gufewfRolLICv/+R94=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc5GX/Mwh9Wu1m7JpuShJqrCbwGZZD5TxqgTChaiTcgryPWyLl
	jlBjs9mtJgC1k4RNEEh+WavA3A95ODI2x3lkq/6moJWrVgmfW19+K2o5
X-Gm-Gg: AYBFou2elf1W+en+RykApRAO2uResXcPTb/hw+IyB7FvJRwUNXVzDi2qRJTIqv6usCj
	sHzpIolFrTSSueNzKbhcW7RYOK18xPI0TNqrvObjMZnT8/VrpxngjFy/ECzf5HG+6rzRdY2rxif
	R8e/vTiKwL5aTwLKOu8/V0ryqmRIuW/TPOQDMM4M+yIgOh94eomlGniost4EgxFTyl+fZscw1ey
	jSLcQzGaMJQwYIe8Wfj7eTotde9+KA1nfh5J1T1qOSfKF1bHieldIrZfbM6S1GLTj6aHoowcOnC
	k5/5BKptLrnpMD/O1Nb/D0vE7uYYdfM30f2u6G6vEJs2T3D3L75pb+d5tWpE/P+9wwlME/ufsfo
	2fQVjtCWk6PbiOa5JNW9X95HPoIZUlEUoOrM/nOwGRZjTnBM7aLDgCFn0AVMU6+/diZWkKoixRk
	urzvHDVQ2C8kX/Cmidslwe012LpIDA1IY9pylGFnNDNivY0Mb1eIWUVOQnIQMaNSo5s+t3dYrxh
	pEQo75FoqedJdyuBUz9niD/jLSMon6Q4Cyh6afqmLVs7/ISju0z0bdtV69Bv3qfAM+mNpXnX56A
	/sZBq3MXUA43T6I7qvqpGx96als8gatcJiIToExBmphnPXzbIvSMJFywYsso/1W6JTqw0NcqKA=
	=
X-Received: by 2002:a05:7300:d086:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-369e842df55mr2190770eec.9.1792834107430;
        Sat, 24 Oct 2026 02:28:27 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:e1f8:b9bb:b037:3cab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm5236604eec.18.2026.10.24.02.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:28:26 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	Ayushman Rout <ayushmanrout27@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf 3/3] selftests/bpf: Test overlapping dynptr copies on xdp frags
Date: Sat, 24 Oct 2026 14:56:58 +0530
Message-ID: <20261024092659.76422-4-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024092659.76422-1-ayushmanrout27@gmail.com>
References: <20261024092659.76422-1-ayushmanrout27@gmail.com>
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

Add four dynptr tests. Three use an xdp packet with frags, and in each
the range goes from the linear part into frag0:

- test_dynptr_copy_xdp_overlap: bpf_dynptr_copy() of 1200 bytes with
  the destination 100 bytes above the source.
- test_dynptr_read_xdp_overlap: bpf_dynptr_read() into a slice of the
  same packet.
- test_dynptr_write_xdp_overlap: bpf_dynptr_write() from a slice of the
  same packet.

The fourth, test_dynptr_skb_load_overlap, reads a range that spans the
head and the frags of an skb. It passes with and without the fixes and
checks that skbs are not affected.

The new tests set err when the data is wrong. The existing
test_dynptr_copy_xdp does not, so it can pass on corrupted data.

Without the fixes to bpf_xdp_copy_buf() and bpf_dynptr_copy(), the three
xdp tests fail. With them, all four tests pass.

Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
Assisted-by: LLM
---
 .../testing/selftests/bpf/prog_tests/dynptr.c |   4 +
 .../selftests/bpf/progs/dynptr_success.c      | 128 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/dynptr.c b/tools/testing/selftests/bpf/prog_tests/dynptr.c
index 4396560365e8..08382ed076a2 100644
--- a/tools/testing/selftests/bpf/prog_tests/dynptr.c
+++ b/tools/testing/selftests/bpf/prog_tests/dynptr.c
@@ -22,6 +22,10 @@ static struct {
 	{"test_dynptr_data", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_copy", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_copy_xdp", SETUP_XDP_PROG},
+	{"test_dynptr_copy_xdp_overlap", SETUP_XDP_PROG},
+	{"test_dynptr_read_xdp_overlap", SETUP_XDP_PROG},
+	{"test_dynptr_write_xdp_overlap", SETUP_XDP_PROG},
+	{"test_dynptr_skb_load_overlap", SETUP_SKB_PROG_NONLINEAR},
 	{"test_dynptr_memset_zero", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_memset_notzero", SETUP_SYSCALL_SLEEP},
 	{"test_dynptr_memset_zero_offset", SETUP_SYSCALL_SLEEP},
diff --git a/tools/testing/selftests/bpf/progs/dynptr_success.c b/tools/testing/selftests/bpf/progs/dynptr_success.c
index b668ebd61fc7..b6c3abb66e4b 100644
--- a/tools/testing/selftests/bpf/progs/dynptr_success.c
+++ b/tools/testing/selftests/bpf/progs/dynptr_success.c
@@ -759,6 +759,134 @@ int test_dynptr_copy_xdp(struct xdp_md *xdp)
 	return XDP_DROP;
 }
 
+static __always_inline int fill_xdp(struct bpf_dynptr *ptr, __u32 start, __u32 n)
+{
+	__u8 b;
+	int i;
+
+	bpf_for(i, 0, n) {
+		b = (start + i) % 251;
+		if (bpf_dynptr_write(ptr, start + i, &b, 1, 0))
+			return 1;
+	}
+	return 0;
+}
+
+static __always_inline int check_xdp(struct bpf_dynptr *ptr, __u32 at, __u32 n, __u32 from)
+{
+	__u8 b;
+	int i;
+
+	bpf_for(i, 0, n) {
+		if (bpf_dynptr_read(&b, 1, ptr, at + i, 0))
+			return 1;
+		if (b != (__u8)((from + i) % 251))
+			return 1;
+	}
+	return 0;
+}
+
+SEC("?xdp")
+int test_dynptr_copy_xdp_overlap(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 off = data_end - data - 1000;
+	struct bpf_dynptr ptr;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, off, 1300)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_copy(&ptr, off + 100, &ptr, off, 1200);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, off + 100, 1200, off))
+		err = 2;
+	return XDP_DROP;
+}
+
+SEC("?xdp")
+int test_dynptr_read_xdp_overlap(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 lin = data_end - data;
+	struct bpf_dynptr ptr;
+	char *dst;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, lin - 10, 84)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	dst = bpf_dynptr_slice_rdwr(&ptr, lin + 10, NULL, 64);
+	if (!dst) {
+		err = 2;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_read(dst, 64, &ptr, lin - 10, 0);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, lin + 10, 64, lin - 10))
+		err = 3;
+	return XDP_DROP;
+}
+
+SEC("?xdp")
+int test_dynptr_write_xdp_overlap(struct xdp_md *xdp)
+{
+	void *data_end = (void *)(long)xdp->data_end;
+	void *data = (void *)(long)xdp->data;
+	__u32 lin = data_end - data;
+	struct bpf_dynptr ptr;
+	char *src;
+
+	bpf_dynptr_from_xdp(xdp, 0, &ptr);
+	if (fill_xdp(&ptr, lin - 64, 118)) {
+		err = 1;
+		return XDP_DROP;
+	}
+	src = bpf_dynptr_slice_rdwr(&ptr, lin - 64, NULL, 64);
+	if (!src) {
+		err = 2;
+		return XDP_DROP;
+	}
+	err = bpf_dynptr_write(&ptr, lin - 10, src, 64, 0);
+	if (err)
+		return XDP_DROP;
+	if (check_xdp(&ptr, lin - 10, 64, lin - 64))
+		err = 3;
+	return XDP_DROP;
+}
+
+SEC("?tc")
+int test_dynptr_skb_load_overlap(struct __sk_buff *skb)
+{
+	struct bpf_dynptr ptr;
+	char ref[24];
+	char *dst;
+
+	bpf_dynptr_from_skb(skb, 0, &ptr);
+	if (bpf_dynptr_read(ref, 24, &ptr, 20, 0)) {
+		err = 1;
+		return 0;
+	}
+	dst = bpf_dynptr_slice_rdwr(&ptr, 10, NULL, 24);
+	if (!dst) {
+		err = 2;
+		return 0;
+	}
+	if (bpf_dynptr_read(dst, 24, &ptr, 20, 0)) {
+		err = 3;
+		return 0;
+	}
+	if (bpf_memcmp(dst, ref, 24))
+		err = 4;
+	return 0;
+}
+
 char memset_zero_data[] = "data to be zeroed";
 
 SEC("?tp/syscalls/sys_enter_nanosleep")
-- 
2.54.0

