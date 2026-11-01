Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793492552;
	b=1UoMGzEHOx++d+7vqik8bCFiFxYFj4FkXsYrJPyqTWoyMwL/cdjLMrQGyAL5rvghXZ9+
	 9NAihDBBhrYkt6jm14TTdtvX0JpkPvYyTK1jhYqwsyJHZTsh+GmGaDTzcJp/J3xO04ZoH
	 bZ9NQEYzGiC9tWshhFJvnnSndNfH7qx5s+ueCAqdt0DL2ZXiUQGc0OHWdcnPPLJvefAXd
	 2dRW74YD2iMKwC39UBNtchZL8yxquAHiy8RBdZ0vy39U8aW5Kheea3LV3+6rjVzsETGrH
	 ncbz6yJSrpE9Icf9l665+/vEt90NYBnXSQBooX80ReOQkS8qvMvpdQ2GrGXe3H60iJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793492552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=tUuyZCWUKU1nnQACGYJbLMWN6gisrUFQKmz9Arovd+c=;
	b=QbixNODS8WYxgP1JIJPWrWQyOAzFABtXHf2lHRbc1xZF0+b5wzDS5jGjgfhD7BA2fooF
	 8hdAGeQs/TTlgFPKBbelnRb/wcDSlkRr2Ml6TqC67pkwe2Xpi2zbgdj3cV1qdmVpAjyIj
	 ASPwBsFGxh0vHvuCPG3EjwQSlDCuI06wugfxGXE2pGbFkdDtuqxGX76dMhRBszy8e4yp2
	 AQtawpho30ZGN5cVKOzbADxBbeYLdNZeH+7x03TbQBrmeUzFE6R48VCed4Ee0ziB4kCLl
	 /u2V1LwPCRylfqsor0BQVwgDo3yNhoNcZVAxF3CPEU7fIUsSfc/KIrtE7/wKzww8eTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="q/OWos6N";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A60D606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A60D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q/OWos6N
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1575319a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793492551; x=1794097351; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUuyZCWUKU1nnQACGYJbLMWN6gisrUFQKmz9Arovd+c=;
        b=q/OWos6Ntb8c40QoPfQQ5cEYrLUnZcaog+fK9zocfh8sTV/LVCkDR1fT2W4FkkhUIz
         17OZ5r5RiqoVz1xDp5pbUDVRsJYtJP6X6Fhh7LyyEJJs6qZF6TqzePV9efokmyDysc1r
         2OhrG4aKzGrIUWTWJkSNMWI8NyN0ObB+O/heImmcTkKcmzoGTxKAQq9023p/gqa0cADk
         /ut3N08mNky6oXSyFzvqm2VDxQxRLODK+U0i9JGZLtIe9mS5asSBBKexC6j5qWy9EZmb
         rAyF/4AlL+s+dI/36ODetnOGYYRDw4pAgKrRe5gNJD8ETNW4ThOYgq/Hs59fFGh77+Gj
         7aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793492551; x=1794097351;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUuyZCWUKU1nnQACGYJbLMWN6gisrUFQKmz9Arovd+c=;
        b=iT17zJvdEDL4JAgPq3COpjbJy/0/4gLdAVoYLffBgvbS+FnGC/x5pEZH8ZWtKh3SNm
         tLJnUZpuvdkXJIwRcUOwrLoA0Qv+wyShPMATLbkAbeBjN3PIVH2dTuWC/CiUIdU7Wgpj
         ekIdRszx4GzxPgEBxZxP0bnUZLsay6Z/2112GIS4yID+PMq1BlrpU5owi4eSJOJj4SYy
         24EvXKEj1z4zpCPhUAi8Mh3QRanTqClhGkk48RFFxTPgT6tlKTj+1fJDJOqVKb/rEJt9
         jWwWRU30Eqa2l/HSrZMwEr6+OOYKomYUV+lzOtsqWg60ZlfdkRkVqryz4MJKKIlxQSWV
         fLQg==
X-Forwarded-Encrypted: i=1; AKwUvBw/z4sD6da+kdBoXAz2RxPsnya3BKpRZ6qpY/Lx9vz1Qx7Wk9gbgqdNh4TXwMtXaQQMamLQyvZvQsPDhiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Y7hklDvSQ2/A7K9srtGNy0im4fHE/tlP60pj9eDSTKUfQhaL
	FQHno4VBuZyVYYwFHlkATokv/fjEAncMRUquny1fbR9fb1Y6vnrQZTCl
X-Gm-Gg: AYBFou28GDNC+tGr9N90XhrbyE+/juoDdyLBaSr5FRVb7G9LeXpqhD18xervy2bvght
	5AoexGhCv2tFAWXuqr8q/bc5StlgS/2jVYibzfP9hacBhec8PoGZj/I8MGEJ8lgIqLRTN+G/aU0
	AzF3fW1gVMunDtlfIyAaDrL0A6Bf2PZIoyKIe6zBZQPM2sPp/YKcirIQTSrTAUA1SgzA6ItWGn8
	TKMyrkNjg1/mkaoFB8G3UFvUt3xnuSlWR1t+qGfBD+wn/y6X4OHWhnhpkgYDp+eWF/LWBeVDT9P
	v+WEmbeyY5C1I4noUYyMCsVmwTE/IZL4jXEhWn/Vnz1cfkHI7ib7NPV1MD/aSCK31HnCcjkop8O
	LWkqclg+Tj+btddvEclPGsxWul/gUBfDQ1llqdGAv26VH57ga93dHCe6d/dF4pwIeSuoTakCu6v
	Hiujvb0NoDDHnXb8JI8JntAVgIsVStjH/XfROIHj+lPkVAmVO0zchrLQZFUIgswy5zEf0jBRGoA
	3Ct35pz0RcI6eN4j5sEE9gA7q4hShdydS4aLGe7VNaL14iOyHfmX2xBFnBaBiBbI5HTaS8gW9Tp
	P0XVMQKyoFJKRoqPg84SvF2pubQnyT6dgRwQpzuE9goi0JlYmot49LDs9zP7Ab5WZwZcxhAUBlH
	GamIX3E6/Z8TBhjktANJR8mR7GXaTr0TJGU0=
X-Received: by 2002:a17:90b:33c1:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3ae89751035mr5373953a91.32.1793492550787;
        Sat, 31 Oct 2026 17:22:30 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm8804863a91.7.2026.10.31.17.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 17:22:30 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 00:22:29 +0000
Message-Id: <DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com>
Cc: <daniel@iogearbox.net>, <yonghong.song@linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] libbpf: Match unsigned enum values when
 dumping data
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <andrii@kernel.org>,
 <bpf@vger.kernel.org>
In-Reply-To: <20261031233219.9362-1-dennylin0707@gmail.com>
References: <20261031233219.9362-1-dennylin0707@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 04:32 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
> @@ -2373,7 +2373,7 @@ static int btf_dump_enum_data(struct btf_dump *d,
> -			if (value != e->val)
> +			if (value != (is_signed ? (__s64)e->val : (__u32)e->val))

This is the third patch in two days about the sign of BTF enum values.
btf_enum->val is __s32 for unsigned enums too.
libbpf widens it to 64 bits in three places and ignores kflag in
all three:

  function                      val = 0x80000000, kflag = 0
  ----------------------------  ----------------------------------
  btf_dump_enum_data()          no match, prints 2147483648
  get_map_field_long()          map_extra = 0xffffffff80000000
  bpf_core_calc_enumval_relo()  *val = 0xffffffff80000000

__ulong(map_extra, 0x80000000) gets to the second one.
The arena cannot be mmap-ed at that address.

When the same mistake is made in N places the interface is the problem.
Lets add a helper next to btf_enum64_value(). bpftool can use it too.

The diff leaves bpf_core_calc_enumval_relo() alone.
Pls check what clang puts into ld_imm64 for such enumerator.

Pls send libbpf, bpftool and the selftest as one series.

Something like this

diff --git a/tools/lib/bpf/btf.h b/tools/lib/bpf/btf.h
index 57f1263..d6a770c 100644
--- a/tools/lib/bpf/btf.h
+++ b/tools/lib/bpf/btf.h
@@ -636,6 +636,12 @@ static inline struct btf_enum *btf_enum(const struct btf_type *t)
 	return (struct btf_enum *)(t + 1);
 }

+/* btf_enum->val is __s32 for unsigned enums too. kflag of the enum has the sign. */
+static inline __s64 btf_enum_value(const struct btf_type *t, const struct btf_enum *e)
+{
+	return btf_kflag(t) ? (__s64)e->val : (__u32)e->val;
+}
+
 struct btf_enum64;

 static inline struct btf_enum64 *btf_enum64(const struct btf_type *t)
diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index ea9a34d..37c9c4a 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2373,7 +2373,7 @@ static int btf_dump_enum_data(struct btf_dump *d,
 		const struct btf_enum *e;

 		for (i = 0, e = btf_enum(t); i < btf_vlen(t); i++, e++) {
-			if (value != e->val)
+			if (value != btf_enum_value(t, e))
 				continue;
 			btf_dump_type_values(d, "%s", btf_name_of(d, e->name_off));
 			return 0;
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 02e75b1..cecd6b5 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -2627,7 +2627,7 @@ static bool get_map_field_long(const char *map_name, const struct btf *btf,
 	if (btf_is_enum(t)) {
 		const struct btf_enum *e = btf_enum(t);

-		*res = e->val;
+		*res = btf_enum_value(t, e);
 	} else {
 		const struct btf_enum64 *e = btf_enum64(t);

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index dbef014..f3d165a 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -919,6 +919,9 @@ static void test_btf_dump_typedef_data(struct btf *btf, struct btf_dump *d,
 static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				    char *str)
 {
+	__u32 high = 0x80000000;
+	__s32 neg = -1;
+
 	/* enum where enum value does (and does not) exist */
 	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
 			     BPF_MAP_CREATE);
@@ -950,6 +953,22 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,

 	TEST_BTF_DUMP_DATA_OVER(btf, d, "enum", str, enum bpf_cmd,
 				sizeof(enum bpf_cmd) - 1, "", BPF_MAP_CREATE);
+
+	/* enumerators with bit 31 set in unsigned and in signed enum */
+	ASSERT_GT(btf__add_enum(btf, "test_enum_u32", 4), 0, "add unsigned enum");
+	ASSERT_OK(btf__add_enum_value(btf, "TEST_ENUM_HIGH", 0x80000000), "add TEST_ENUM_HIGH");
+	ASSERT_GT(btf__add_enum(btf, "test_enum_s32", 4), 0, "add signed enum");
+	ASSERT_OK(btf__add_enum_value(btf, "TEST_ENUM_NEG", -1), "add TEST_ENUM_NEG");
+
+	/* btf_dump__dump_type_data() doesn't resize 'd' for the new types */
+	d = btf_dump__new(btf, btf_dump_snprintf, str, NULL);
+	if (!ASSERT_OK_PTR(d, "btf_dump__new"))
+		return;
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_u32", NULL, 0, &high, 4, str,
+				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
+				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
+	btf_dump__free(d);
 }

 static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,

pw-bot: cr
