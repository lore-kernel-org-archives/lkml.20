Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480996;
	b=CNXz2w2F9lz4Thgg3OCLoR+SuM2HJJ/ZwaJrSYHXwvx6YQ5eDxvlycybVfHNMpjmwV6n
	 OZcK7bOkgC2wVUMia1av+cbZoB0BX/Q3A9FZvxZJwUv9JJOGRc+awsoOgxG9Mo0kaUEAC
	 Ul1VyC8jXl30eHUReMy6OSE3vg64z//2LalHRFky8A+n+dOYuyABS86zCpUk/mqHsiWgN
	 Sp0NWxNTz7XJCVs652Dg9Mg7B3FMGEl5hVL4cr8sEKwsa97FIaxdonpCfs3FYfhdvYIDh
	 S1174Oj2PdZ9v1Kooo5EaXGnzve1Hld0rGw9CR+vd8Y7RmDpcjCU8bg4Bj3WG1Mhp8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jtGHs2eqhkMRzNqa6Gcv6/y7Ijx8kqUTG8HewUTMQTc=;
	b=NO9dF7lI36dkKXGgtIhr53xvbQdKGyRPw6Zp1/UWkt+g1GYZKWVQ8AmwZ6ZYdx7tlZ+q
	 xN2GkCCJQQM8LjfiG2YNgxJbdvW6Fs8KxwECDROmGSUcrRgQM5oiLPLM0QYVSIXHoQMHc
	 Njk8lAnDioGA3QQVJG5LgCSmk/YPJ6xsxAkGRJ2axE2WRvKHlToi5VpenGRpLSSCqAp42
	 WIrDNDyubbCTez11L9vZS77ObQ612g2iHZP7x7EFmV069U4yCfTyfxEYYV6Snrz4kqidy
	 I1MOAyTPFBdlF6JMjCRZgouI/rUtMO2xCG1jCwS2Ip4IoRHqJ9vJ0HSc0U6OghusjgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrkXU1T+;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC03606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrkXU1T+
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so17277225ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480995; x=1795085795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtGHs2eqhkMRzNqa6Gcv6/y7Ijx8kqUTG8HewUTMQTc=;
        b=jrkXU1T+YrLuTQfCjAmR7IxcQeKyuXOPWSQgLpSmcaKR/ycd/j7ErZn2Q9V/OePG6M
         mw0k1g0N/JiJZD07zxm3VaoVtoPwBASHFEOjObAcHSoTfmS19wLeCvIiY5wm92sCDER9
         HhJaCH72PUwGrZ1gfY1m5z4oNsgGE84915pxmwW7yazaKyktie7US8qdBONlXyw9b/Yv
         YLtaUp58Md8tfZlYy2Iai7WVKDpSYuiSx3MnUqAhxlStT/X+DO3LhesPnYDIpqgx4cB1
         wehn6EfRpgZKi5YdQEfNtPQ3qT90lTorr/O9gEOpvTvtwwuu6LzohbAUBu4tKnBByHLP
         uyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480995; x=1795085795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtGHs2eqhkMRzNqa6Gcv6/y7Ijx8kqUTG8HewUTMQTc=;
        b=XfA71LStcDGSf5VOKqt+TECxpBCx8h35jhVoaX4a6Re37D2pLcNnYj+mfLp8WGLrMU
         us78HL+ht5lYCaIxfWy8iINLDrt4bLr1mvxwGQ4X5hxfzWlt7MDrGhjgXsyNqZ5845Lt
         1Mr39hj48vda2/WFEYcbkGYtgiMS2B3GrY/86XqltyL14WH3ZSepBaGcDeWSXQ+w5VLL
         hXgtQznO1lw4GZ4gdRvCKhw/KlTl+aP36kTLYGndcOr501vHgyxvHUMW3cNA3ENRFV+n
         4QUWUBaf6IqUhD1Tji0/1ba+POlxl4cT/fySLNoO5eza4SEChmq8FQ9/bFG12Gux93aS
         mKOQ==
X-Forwarded-Encrypted: i=1; AL+hErGsLU7JtlUAEaF/mbkoY0NTM2qmOK9Y0AidDKFH7GRy/0I0I6DD/GqHgDLG9IgKciTH1hIvnDD6ZKsBo9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WFfhSL2ekuwWbVdU9m82lrxAk7PGgQDmUM20hkGi0hAlU3Yhj
	Ka38JiQdNhfnVoZR4iv6VRdVVQGAPwESogcvuiiyBWB67lrBuJX5UC7Q
X-Gm-Gg: AYBFou2brBTugoTHkSuQGyLm5igxazUObdP0TKb/EMxVjIo+MsUzhauCIFaWotq9kHK
	qEJnRep7qJ3RZWeKlpeBjMJ/4/UK0OWZR4nRoLEFagVOi6ChMN2+Ivar5Nkpzg3yyU2gHKCuasP
	3QYSv9+JSUzIQHdKaD6++VrkHojvl/CWeDY/FUcCJhU3a6Ciw1vvzPk4wlGatYj0mmyo/ExqOOz
	rZ3Yq10FlodY/z/1NaDp8kpp2oYuwbE0wcZ/c/xHjWSzpgSA3Sth4ei1OlaEdFD1s6unJ3CaSus
	nVQAmmxZNP2JV5WWpX8sXntLQWgJWkrO2zzoRcKgcDj+5i8x/cNNcG23YIt7DFQ7U0oH7JIMcY7
	7ipdvJs2KH+DdHQu3lZI0FMb7zcOb5qxgLqxoVT997ZlqiJQ+LfgQ7n65O97lgxxyTreXg+8vUV
	TAzuaegs+CTwGs6PTtrIbNlwAeB4QvK1+eAu/Fu5CNxXyGgHaITXQMpFuX+IDqNVjHD67W+9zPi
	9ew6gqRe4KZcw5Qn28Phvo5xwWip+u6eEZ6EiQKgCuGcVNGhUS/GUQEOq7JoDnseVMVASbFueXH
	vKFuF+y+ub2jtPyAkv7mu9qaimMH/PtNHHWv1gw6jt4weYM=
X-Received: by 2002:a17:90b:1d0b:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b182fb2981mr5114945a91.53.1794480994840;
        Thu, 12 Nov 2026 02:56:34 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm4228959a91.10.2026.11.12.02.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:56:34 -0800 (PST)
From: Shihuang Liu <shlomojune6@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
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
	Jakub Kicinski <kuba@kernel.org>,
	Quentin Monnet <qmo@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH] bpf: Reject offloaded maps as map-in-map inner maps
Date: Thu, 12 Nov 2026 18:56:20 +0800
Message-ID: <20261112105620.57520-1-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bpf_map_update_elem() on an ARRAY_OF_MAPS or HASH_OF_MAPS map accepts
the fd of an offloaded map.  A program that then looks up the inner map
gets a pointer computed with the software map layout: with an ARRAY
template the write lands in struct bpf_offloaded_map.dev_priv, with a
HASH template __htab_map_lookup_elem() reads bpf_htab fields past the
320-byte offloaded map allocation (KASAN slab-out-of-bounds).  An
offloaded map used as inner_map_fd is accepted as well, and the first
inner lookup jumps to an invalid address because bpf_map_offload_ops
has no map_lookup_elem.

The root cause is that bpf_map_meta_equal() compares map_type,
key_size, value_size, map_flags and the btf record only, and
bpf_map_fd_get_ptr() relies on the template's map_meta_equal() without
comparing ops.  Offloaded maps share map_type (ARRAY/HASH) with the
software maps, but use bpf_map_offload_ops and a different object
layout, while the verifier and the JIT keep using the template's ops
and layout.

Reject offloaded maps in bpf_map_meta_alloc() so they cannot be an
inner-map template, and require inner_map_meta->ops == inner_map->ops
in bpf_map_fd_get_ptr().

Fixes: a38845729ea398 ("bpf: offload: add map offload infrastructure")
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 kernel/bpf/map_in_map.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/map_in_map.c b/kernel/bpf/map_in_map.c
index 0fa3f2ac0f992f..5aa1f8249feb51 100644
--- a/kernel/bpf/map_in_map.c
+++ b/kernel/bpf/map_in_map.c
@@ -22,6 +22,8 @@ struct bpf_map *bpf_map_meta_alloc(int inner_map_ufd)
 		return ERR_PTR(-EINVAL);
 	if (inner_map->excl_prog_sha)
 		return ERR_PTR(-ENOTSUPP);
+	if (bpf_map_is_offloaded(inner_map))
+		return ERR_PTR(-EOPNOTSUPP);
 	if (!inner_map->ops->map_meta_equal)
 		return ERR_PTR(-ENOTSUPP);
 
@@ -110,7 +112,8 @@ void *bpf_map_fd_get_ptr(struct bpf_map *map,
 		return ERR_PTR(-ENOTSUPP);
 
 	inner_map_meta = map->inner_map_meta;
-	if (inner_map_meta->ops->map_meta_equal(inner_map_meta, inner_map)) {
+	if (inner_map_meta->ops == inner_map->ops &&
+	    inner_map_meta->ops->map_meta_equal(inner_map_meta, inner_map)) {
 		bpf_map_inc(inner_map);
 		/* Its users are those of the outer maps from now on */
 		WRITE_ONCE(inner_map->was_inner_map, true);
-- 
2.43.0

