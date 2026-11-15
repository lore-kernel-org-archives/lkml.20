Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753458;
	b=l5xffNOSkbdlYR5foA/bqcXz8oEnjdu7J5nelAA9STmt++Ne1JJLwM8BUcsKVaxc5AhP
	 1eivf4ssCFE5cXZqgWQ98Vf1Nnhagf9GnMODib2SVygP/OZe0abnOxJTVmFHk8NP0h9/3
	 mGo8ugiGq8xul2gJWXlXRPv8zUn15cRzLM6LKt+ZLHJHDqaQEIuzukPjnJKTGnjSTCw15
	 Bo8TvOREQglxXp9xa9Fp8CZQfsgyCwdPVQ6SHTKsiO7bzwUzbUSOe4DtjMXon8Ylo3ZUE
	 T+L2gD9UrhXzdSbX6BMgxqhkDzrkNtFw5NQ7USvNlGS77EmQK03Es+PU97+Obq5kvYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TZFY0nWk89RIttQycWfHfmi3Uv3kaULeHN2GeypqrKs=;
	b=oJMdWGoAOPTXppPJFfxx6Cnhy6LfPWWxRRBx6CRGpLEo7UqMrHHd6ta4f1x5hiPQl7qv
	 FXF7VvgchSBHRCo/6aW9+U16QSm+0GvtYKgd+VnK5vgVtKRf8atXJ+8pfqunX6tfF5GJI
	 PMdMI0vyYx0NFwTgbVimqbrwKEwLKlP5sGCcvO3E5laMJ+IfI8GP1Xqt3MfiwXV3gFbIu
	 hedSFwKFYl6RHYfe98Zn1uMXe6unYSg+yydxW0u/gp2JFoICfSDYTpG74AJmwLmWQfUkp
	 ua0RkCMGEfsgXciP57POnJYk105fhH8ccrbQpEKb6++o+c+JHuDnhxPw4Lx+j1tmVkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dbIl5CZB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D0606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6D0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dbIl5CZB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2899376f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753456; x=1795358256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZFY0nWk89RIttQycWfHfmi3Uv3kaULeHN2GeypqrKs=;
        b=dbIl5CZBTlZARi63kuoDghFVe2FXcO1LMdDeRqXWoj4s6usVbGU/Ee5bTMidXDwiro
         On9rPGsq6pRmeXQNPyVgPLs02pMGlubT/7jSYEKOabny1JNKW9BeiyCJEguOmM4JXSP2
         8kg3aLkDQShWXXWajzbIf4VYzaLKi1l4tkrmioKCWgUXfACFxqwrqKI3DsoqGnBPuSax
         eqm+rxN2elipMluqrHYhz69lN9MSNixobHK76TNGzZdOGQDt+67D5b1ovOQMaos9wQ9k
         vDxSvC68KdJWakHd78r9QqzG9g70S/CF3Y+ADs8XF/rczpISsEKNn3q15ntorz9eb/eq
         flAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753456; x=1795358256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZFY0nWk89RIttQycWfHfmi3Uv3kaULeHN2GeypqrKs=;
        b=SSh8CZRP/wy09EGYPW1MIWXAov12fLsJUz1toVExwisfsbZNVFy8oS0m4Gl9TOI7rh
         xl00QnL62/+0wZV6yYjscJEKQFBMjF4JY2wCtdc1vFX2C2Kkmpq4MexZb1Ys4UhFr+nf
         YXEiWBxorfPCENn69wOZjus4n9jHAoe9ZKkGyfcPnkmi+09tLFTEAWa4d9D7u+NgseQZ
         6Qd23+Gy/nB40Fhuw+eMzhtuu85hPD6OAegWW/xl2EcDj08WsIi/5kc7Y4jhRFevvWcR
         MipEAovLm8VpfjEDBF4SZXQPZHD/YckhqJ23fGWrd+w3m/HRhZPXxuAf3hiY2mVYF7iI
         s1OA==
X-Forwarded-Encrypted: i=1; AL+hErH5IN/AbyKUBBmwYfmeJ7ezXW/ShsH7uUZgY6pcFZUtu4CvWcX7862RXK/1GVRf15HusWbzmI1CnM7+NxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dci8ruwMyvaaSFGQdwK1CCzOGK9YdG9KxeM5GQM60e/bhbO7I
	DrOl30b4XexYUzctotEpG3GfR8Lu3KbPhbNkrIoTuFdACk+5Qnh+FIDv
X-Gm-Gg: AYBFou35foKJ4dTPtd4VqgNlxnlqJaNKh2I+64iWpCAchg/NFKcFAqIvBlC61qxkD47
	qO9/Tumcnt9N48lG/pKqQoukxN/aSqdjsVEjI6Jv97HWRknFXZ9tCkd8yJqufyCKqsnPFJXHrOu
	7L72x0EsdEe3Md5nSQTToRsNfDZkR8Pe8To+MnUKMi7Wo2e8YNHLe6M++R32tQ3xvdQ/1SoU80H
	nqJrAFcCRD+16uCucR31we0s6p2hDPGu6Vnn8x7zp01t1Cq7p8+RvLqx6QBfFTl7tCUDONpO/db
	O67Okl2/23Q9bX+3NLJnyADWoWUV40E/D+FiZLEbAOaOCDehsk81t1LBdd3IXEc30FTQdZpfjZR
	F0zd37NThsUR/XqB99G4XGjcuqUH87DDYk1YgLCNlJQQ0SDudvQvEsTMDQ7k+pM0uBQG2wu12SG
	r+qwFrl5Sm6CIs6oYc6Db2V6O3F98WltszXJm/q7JFgZFiQh0JMvVWBmR93e9Bp6gWOfMJZcvNV
	yvCA4YjqkFUA09B7i5JjlQxbeDolZtQhWOPU5itjyKoExvtwlJRBJ1c4pGG1tESdCIFsb0McYHX
	NYr7M3lYMr7JmVZUKiSPYEW55pR8hFpITauolIKXQeUIt9k+mJIuE/etyO2U4Mt60g==
X-Received: by 2002:a05:6000:2990:20b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-49c7353c8aamr12310750f8f.52.1794753455945;
        Sun, 15 Nov 2026 06:37:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm16954821f8f.56.2026.11.15.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:35 -0800 (PST)
Date: Sun, 15 Nov 2026 14:37:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Cc: "Hungyu Lin" <dennylin0707@gmail.com>, <andrii@kernel.org>,
 <bpf@vger.kernel.org>, <eddyz87@gmail.com>, <ihor.solodrai@linux.dev>,
 <daniel@iogearbox.net>, <memxor@gmail.com>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <alan.maguire@oracle.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] libbpf: Fix sign extension of unaligned enums
 in btf_dump_get_enum_value()
Message-ID: <20261115143734.4addeb28@pumpkin>
In-Reply-To: <DMUPC8KHIGGC.1GSNJVGA8XC98@gmail.com>
References: <20261113223449.97604-1-dennylin0707@gmail.com>
	<DMUPC8KHIGGC.1GSNJVGA8XC98@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 05:58:41 +0000
"Alexei Starovoitov" <alexei.starovoitov@gmail.com> wrote:

> On Fri, Nov 13, 2026 at 02:34 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
> > btf_dump_get_enum_value() reads unaligned enum values through
> > btf_dump_get_bitfield_value() with a zero bit size. That path
> > zero-extends the value instead of using the signed loads that are used  
> 
> Not quite. bit_sz == 0 makes right_shift_bits == 64 in
>   *value = (num << left_shift_bits) >> right_shift_bits;
> That's undefined behavior for __u64 on both endians.
> Pls say it in the commit log.

Isn't a size of 0 just wrong?
The code is likely also wrong for a size of 64 - which is valid.
I also remember there being a helper somewhere to sign extend
a 'narrow' integer.

David

> 
> > +	if (t->size <= sizeof(buf) && !ptr_is_aligned(d->btf, id, data)) {
> > +		if (data + t->size > d->typed_dump->data_end)
> > +			return -E2BIG;  
> 
> This breaks the dump of struct fs_context when emit_zeroes is not set.
> 'phase' is an enum bitfield of 8 bits, 3 bytes before the end of the
> struct. btf_dump_type_data_check_zero() ignores bit_sz of an enum:
> 
>   btf_dump_struct_data()
>     btf_dump_dump_type_data(data = end - 3, bit_sz = 8)
>       btf_dump_type_data_check_overflow()    1 byte, ok
>       btf_dump_type_data_check_zero()
>         btf_dump_get_enum_value()            t->size == 4, unaligned
>           end - 3 + 4 > data_end             -E2BIG
> 
> Today it reads 1 byte past data_end and the dump succeeds.
> The over-read is an old bug of enum bitfields. It needs its own fix.
> The fs_context test in test_btf_dump_struct_data() sets emit_zeroes,
> so it doesn't notice.
> 
> Drop the check. btf_dump_int_data() copies without it.
> The check against data_end belongs in one place for all types.
> 
> The first case below fails on bpf-next today.
> The second case fails with this patch.
> I didn't build it and didn't run it:
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> index b5c90f7..d6fd993 100644
> --- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> +++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> @@ -945,7 +945,7 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
>  				    char *str)
>  {
>  	__u32 high = 0x80000000;
> -	__s32 neg = -1;
> +	__s32 neg[2] = { -1, -1 };
> 
>  	/* enum where enum value does (and does not) exist */
>  	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
> @@ -994,6 +994,8 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
>  				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
>  	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
>  				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
> +	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, (void *)neg + 1, 4, str,
> +				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump unaligned enum");
>  	btf_dump__free(d);
>  }
> 
> @@ -1182,6 +1184,12 @@ static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
>  		type_sz = btf__resolve_size(btf, type_id);
>  		str[0] = '\0';
> 
> +		/* 'phase' is an enum bitfield 3 bytes before the end */
> +		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
> +		ASSERT_EQ(ret, type_sz,
> +			  "unexpected return value dumping zeroed fs_context");
> +
> +		str[0] = '\0';
>  		opts.emit_zeroes = true;
>  		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
>  		ASSERT_EQ(ret, type_sz,
> 
> pw-bot: cr
> 

