Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816137;
	b=vxnB99evCJd2L/9kcvQBrcjZjLtQYUInnqUBJ2ILrIFehBPYNquA60/+EJR+u88wx6r2
	 Vhq0WJ81GggMbYGjTS1PX5rVufuBlCMzTkbQT2A8lmV1uo66vfNQ/m3Alb2FHBjd1O64W
	 BNaT2IcAfmbCiHugNQ4j9eOD7U7XD91R5ZN2j7v3JZ8Rzg12c3Du+aEx0So7+cPj2b3fI
	 rcYOK6BF5oWUdiwZDnXCCFfOocZWUklUju3si6hu9q25DMVYMX7UUt8Lh55vYpBUVenze
	 Rq1NWwUwjE8N1mmZ9UhH29D0pmKonczmzNJ8xmFWm/XEGxmcBTusaomkz0fzwTKAg4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
	b=HoolNNclM9xGZ+uo9DoVlBMLu3hS9qWxPACGm+lEhIj8DP38adBRP9tFwWZlrqz9dUfU
	 Sl8gir+Ziykv5M2KPS06dU0LhYcIZqrsn6bSOPYBqRArS8b3Nu8+KxyhK00M3MYnJVz2i
	 Vb6I9Kg5hXTDCoTVvQJvjxCingPsF/VAR5f1/QdTWrJqQpx5zIh2iyIjGjY7jF+4nYKqi
	 wG6BoL7nX89llQCS0fOFNS7BmnZqXdZ1xiQoZqiVEKxSjq20mhT+mQjacV117Rnm8CXpj
	 71Rel71L2M8GNhZqCRAiyR/AjJRlEIKhf1gBUTOEXWvJPD/XJjhJOTlnQCJtK592b2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljwpme0L;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70DB606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70DB606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljwpme0L
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-375c861fe62so285150eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816136; x=1795420936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=ljwpme0LQVKXeV3vl8q5H9ZscOlG+KxJ5e9vY8+nkJB4ivdBNlbTM366T9nOWo9/42
         jUi+q32tUIp5/HrR9lLe/28SOQe2SO+p8LWgPaELukXX2MA5lX3iyqrlJ9oQACY4E0Zl
         3dAOy/Ylb2i8HGGfAhQ3dkbj3Rz/oXni8NHExqvw+kLXHzVsEhJRwuucg/v9Xg9fTszx
         isGemQmELXHtTCtVazPEaLTowh7pzAxR7HIT3WRkrTIst7c79EaRRPSzKyPAcD4KHW5m
         ZY9GaowWCwFz4bBQpcirowYM1TzwIPHeG7FjvkLKi8O7y3b8GUmtTYc0tsmuFTcdLd5a
         gt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816136; x=1795420936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=E22SY/VupXgq5WrgD9OMj9PXXRBNDEkiO1KNdrWgP2c9Ab1Y1im3y2sd5fH8b1DrW8
         xD4wDPl56Wf2hIr/grL8IYYCOl2Z7NDHd/lzbqLFySzuHbXp4hRQGxzvTBzYghPxsj7P
         vyJqlgT8uMd1ygv2m4FlCkaBWydceDpFEJ9TqRzH6h5lQvK0wF3PvMFVxW+bv6JWsym4
         xJQWN4fIDJuwrRdWWE3khwyUrPUILJBPU4T45Ntc3IUZc/n/G0/t5d57HbJVkBE7PtTD
         OoIuODre7Qm+990qb51NYUn2Ab+KMdl7G8GRyQKEhyVf4zC61ZVmiEtO59oSO6xGF7an
         eNaA==
X-Forwarded-Encrypted: i=1; AL+hErGEtYx+Znu1EFg+7MZ2A9xaMxjXOZafYie2OFqQu5N8DBCqVYOKAQXXa1IwZPsjmxKY/IsCwdHm6kgpQow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NwazeJHU3rqj2z3qoWTwWo6x8OrL8nsO7uvEqwlUPfgM5+njO
	f29OB5V/gXdQVKVGAGtr8Ou4mP4+qTGp7WJ6oBLZA9Aweh//G+0rtcfw
X-Gm-Gg: AYBFou34Ed/MxHCWEJ2vJ49ieSFzMZHeN0yuKCorJ1U5rLRUxVVT9ZPMlnK1f8sTyo5
	80kbOJYx/uHzejgn59YgwttR+CXsQqhW38qWnduPhfwTL9+JRuWkrBKTONyoVN2LkyL69pX/wsA
	7bECrtnj+m9ZymTnduIJjKoeFs6zKE630cAHDWBaaJNDqXseVVMQrJzz58bsZe3SoTQROqigr2z
	ALQqsX9aCedFh7xoNgFLhbJSVqr0mAsSR3GN43iMOLWfA8wAYdrKXvwtzwS7XjV4WgcKnCI/BRK
	/TqygNID22XAoensk1Hxtn4LUbHALuK7tGn3I8SUb0ajYi21NTN4Ysh8n8/yjWcC/rQThNVjUuQ
	t5mJaPsTe3b8STgOM4Kpjt4Fo8YuBSFE8WLZPsnaIjJZ7kUqSUjpWPoMSSShdzJEsrmk9rhUz9e
	Uc9nNS6gwD9wl5giVc6ihMZrIdpSi6N7qwMSLS4Y5Sk/WwaOGx2f3uYJibCYE1mKlOqJXTuJ449
	w47r/b5acCzmQm6WeKxGzjJNMPMEr0UUj7MHwDXwBaPr5fOBRbU8XRy7yAwQ8E3NzTcEdwFBXMT
	Yaw7M8qX2ZNQIumeU6t2qwhFwqRq3n77pqHhA137kLvZCTWF7Xskfd8jJk7Xrh80d6BwE1YBYhA
	5c0xJKCS7METte29IO9lbrEkjHDLQ7GP7xtN0Ow==
X-Received: by 2002:a05:693c:6383:20b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3798df3d361mr9286131eec.13.1794816135593;
        Mon, 16 Nov 2026 00:02:15 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm31128558eec.17.2026.11.16.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:02:15 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v3 2/2] selftests/bpf: Dump unaligned enums and a zeroed fs_context
Date: Mon, 16 Nov 2026 08:01:51 +0000
Message-ID: <20261116080151.44860-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116080151.44860-1-dennylin0707@gmail.com>
References: <20261116080151.44860-1-dennylin0707@gmail.com>
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

Dump the signed enum value from an unaligned address in the enum data
test. Also dump a zeroed struct fs_context without emit_zeroes in the
struct data test, which covers phase, an enum bitfield 3 bytes before
the end of the struct.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index b5c90f729339..d6fd9933ff25 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -945,7 +945,7 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				    char *str)
 {
 	__u32 high = 0x80000000;
-	__s32 neg = -1;
+	__s32 neg[2] = { -1, -1 };
 
 	/* enum where enum value does (and does not) exist */
 	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
@@ -994,6 +994,8 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
 	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
 				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, (void *)neg + 1, 4, str,
+				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump unaligned enum");
 	btf_dump__free(d);
 }
 
@@ -1182,6 +1184,12 @@ static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
 		type_sz = btf__resolve_size(btf, type_id);
 		str[0] = '\0';
 
+		/* 'phase' is an enum bitfield 3 bytes before the end */
+		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
+		ASSERT_EQ(ret, type_sz,
+			  "unexpected return value dumping zeroed fs_context");
+
+		str[0] = '\0';
 		opts.emit_zeroes = true;
 		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
 		ASSERT_EQ(ret, type_sz,
-- 
2.43.0

