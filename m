Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635923;
	b=ss+Wf3knMdkjWcVnOK8CKHSb5qXychkoHN3fVV5ajCdoXm/1Oqy93zbnckHb5sssDgZc
	 Yv3j8wnmOGLXoEfmOyZ/N3lhDKcAKeInv/iDAXdQ0XNTbFyy/1xBDXWyajaKNcIKR6lGy
	 kqtdVqFAKkSEjTLWJZmVxB5NbwQ4ZIV4obfe8ch6gvE6vp9nmlqJtYSs+ep1EBVKJJfvN
	 Xt8FN4ScrIP+Jt6r/gEebFizGZZylJXHCdAly8wONa7gKBDMYSOpv2UrUxbteTNwj2iI2
	 Yi+oU/IuPy4Qk0yDe3Gf/Nqjjyl3UiV3V/fKQ9Lgie5b1DA/7dDzVAQRNpQ58VybTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Ym/b1fWsEbJtm9qFvOFht1VdLbQA2jNfhiJxfk6+BKU=;
	b=1cROjcDbrWT4W6bAQ06RvWCKhksbunLWVhBxvopbrF/5uZ6nPAGjS7rIbH7Wy4Wvlyi9
	 LlfnUYur2MoM5GfdPcVwkCrfJfQ1NxA0yoxoagmBlO0Cpw0SbGbWiz/n5EeQdVwDKIPcf
	 AtlKJTSqeFgOR0ujJyABOTXnH6JwKewOsJ7fAWONQ5BzeEnIELYujYUp8ENJdXHMaQ/7B
	 PeckfSFdANt6WW4F8TFFd6P4SQ6uw/UzHp14VJraFghVNiEj17CDMHlFC2TbVyR7qTiTF
	 C9X2+0tVfGEUhwuETIASaPiLCRUu7ZRYrqndPofrnpDdVMxHvQRdMtIn0tcmy4QJP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAMSHfJS;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2652B606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2652B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAMSHfJS
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed408b0d9dso6789445ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794635922; x=1795240722; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ym/b1fWsEbJtm9qFvOFht1VdLbQA2jNfhiJxfk6+BKU=;
        b=iAMSHfJSyZ9aJiv8I2N2EwOA0IagQKe+xY0cWdblJ1VkkBcu1DaDiYHnj/WX701mMs
         bNg53GAa1AuloyF0zl7ct869w7xQdvk4H2hAQJAX8sdPVO1IWF+XuuVyxqjn9BMMFntx
         gj0bbZcPyT5WfAJOh8l9Smumxzu0oj26xD5Z4or/VyPb73ZPq/JOBF0ps+/CFuHFaXE+
         YsYltkrh2t6jR7x2zLZBWD4DJWlFXzJg1mRNLniAMiDjZYjGDvhEd7HdQr/JWcltj1w8
         qUrGFD48E6ynEJDqHdi0+st27DrGP33AGQcwTVEeSDOXP3DUVcg8S+t4HAkboFW8jFMv
         qYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794635922; x=1795240722;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ym/b1fWsEbJtm9qFvOFht1VdLbQA2jNfhiJxfk6+BKU=;
        b=dVhic032AJQoMPMSTMA4TRAu8CCji99PE4I9llEHDx5JQke7qKN3sFDAr1ZRebWOKZ
         2aidxCvZu2KPFMcgKuWFFQY5uBKieaN9rwRWUjMYYVi+1uN/rzzvfBvt58/Ibjq+ejR0
         gBnM+grup33CaJiDkHcR7CExb/lj85H2f5l/ZexZaMU1Nd9gXAPE2BhAb228mctCOs+u
         I9IP6lzcoSmd5UXS1SjeGH7Ffjpql7qifaZdLW592F+k2Jmf9C7TX2XCqpVDlvkP4I8t
         nLAlM5ly2YS/bTWRHK6sYcS0uLcPabBDY8M3mJfpBQK4PuUrYdEgzht9h7Pajvue4T9d
         +f2g==
X-Forwarded-Encrypted: i=1; AL+hErHD6hYsAmpSbucbi+G5dV9v5AlqucD11suNmUCR4ZlOCLdNftuRm6Lbx/pBv6nwLNSYEnBYYjXwfAn/+CA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dbP9HNV/vGPg/ELEnkBY0SkC7YXS5s7aVJSBnu5qGTodnC2H7
	dekMK59cZ+xV7mCZi2iUnbJS/CdsqRr4PRecRicPAaD91vCUhdquZqdJ
X-Gm-Gg: AYBFou26KyM+zH1d5C0etJUjvOdczNIoMRmIg5CmTO78Kh9lH9teNTv9SvH1xGIs165
	6Rl4sZEOER50+l8ZlBjgAStV+eLFoK6Q+vfM45zKW9Dif1KZO/XBRyfvF3wF784LgiDMOaBwkg4
	6ncm1n1w3fBsW28uBnBoLWcSElOSzVfOrd0/v0Sntust4xj7QE09wZoi60XKeBqGbVgCFeeHe1g
	yRnpEA9wUf/wN8wlHihvaJmfzZbVnfoRn2pbNAKydZYvi4hGt7RIdiVjB3+FKCr124hLeNYrr5v
	FPVFkAgrX7EWvzNWX1OaHYnsjR4eNkeE6TMB6RQ/FIlAkWVHJ2UYMMa+6NMt7fVV1BA3dZ/85EL
	hHWb52SND03/Eqc+ntdKqPfMqyypFWFaPL/SsOupzC293eKTxS/EdECaeHx2y/P+uooI5F6XsaF
	ueTcXO6YVuCqHR+Rsg8witzF0dQof/M1F0HWhdZuf5dpck8Gu5+4pmjOOAY4Timri6H4HeGZjew
	XAUT5QsGj+RlqKOiB2hkQMUma+/N4zeRSQDkWUJo/nrZMOlhmkoIRSykGfzKipUEvpGLbnlID33
	U+gYddXWFgj+7KkTQ86oSRQltGf3vJTGbM7ZudJaisY/bg8feybXukflB7Ido1NLE1OCb+PL04O
	UaarRj+zh/GmIVRl1X0e7KIJaqG7TCYMngA==
X-Received: by 2002:a17:903:184:b0:2eb:201c:91a8 with SMTP id d9443c01a7336-2ee0de4fa67mr48849665ad.29.1794635922261;
        Fri, 13 Nov 2026 21:58:42 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862744sm17702925ad.44.2026.11.13.21.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 21:58:41 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 05:58:41 +0000
Message-Id: <DMUPC8KHIGGC.1GSNJVGA8XC98@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <andrii@kernel.org>,
 <bpf@vger.kernel.org>
Cc: <eddyz87@gmail.com>, <ihor.solodrai@linux.dev>, <daniel@iogearbox.net>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <alan.maguire@oracle.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] libbpf: Fix sign extension of unaligned enums
 in btf_dump_get_enum_value()
In-Reply-To: <20261113223449.97604-1-dennylin0707@gmail.com>
References: <20261113223449.97604-1-dennylin0707@gmail.com>
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

On Fri, Nov 13, 2026 at 02:34 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
> btf_dump_get_enum_value() reads unaligned enum values through
> btf_dump_get_bitfield_value() with a zero bit size. That path
> zero-extends the value instead of using the signed loads that are used

Not quite. bit_sz == 0 makes right_shift_bits == 64 in
  *value = (num << left_shift_bits) >> right_shift_bits;
That's undefined behavior for __u64 on both endians.
Pls say it in the commit log.

> +	if (t->size <= sizeof(buf) && !ptr_is_aligned(d->btf, id, data)) {
> +		if (data + t->size > d->typed_dump->data_end)
> +			return -E2BIG;

This breaks the dump of struct fs_context when emit_zeroes is not set.
'phase' is an enum bitfield of 8 bits, 3 bytes before the end of the
struct. btf_dump_type_data_check_zero() ignores bit_sz of an enum:

  btf_dump_struct_data()
    btf_dump_dump_type_data(data = end - 3, bit_sz = 8)
      btf_dump_type_data_check_overflow()    1 byte, ok
      btf_dump_type_data_check_zero()
        btf_dump_get_enum_value()            t->size == 4, unaligned
          end - 3 + 4 > data_end             -E2BIG

Today it reads 1 byte past data_end and the dump succeeds.
The over-read is an old bug of enum bitfields. It needs its own fix.
The fs_context test in test_btf_dump_struct_data() sets emit_zeroes,
so it doesn't notice.

Drop the check. btf_dump_int_data() copies without it.
The check against data_end belongs in one place for all types.

The first case below fails on bpf-next today.
The second case fails with this patch.
I didn't build it and didn't run it:

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index b5c90f7..d6fd993 100644
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

pw-bot: cr
