Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755197;
	b=tRJktpxpCwmZFgxg0c72jS18yEGYrGtzIS/uesk23hdoIui5xMY9uo8KPupyZjfwNHId
	 phZ8Wm+F4CA7sepx3wgKlI/xtmZDLxXmAKvYVLF1TTHH4xvDkafG8XPUGAqGGTKexueOn
	 LmZpvbpObahyQyfbQC7cyK6PsTS2hwVNL57E6tSp4i3LBFQz2nwYbflmORLKmB8ho8q9B
	 o4VPSBnQSuBb1659/rzPHHgV4//MGTPb2m9l0Bz9xasIkV0j3n5cAHLZA6xFk9ZsI6aZB
	 P3S16dOrWAIOjk6dHdVs9O9VPRGPEHY9Kk2SJSCfdctnnsOw5pZ9FpfSrS/tfHR6DrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y/hOIyUcvAfKlaaXm+bgaXHbjM9PJioyHvxOcCFmCQQ=;
	b=oTr2QXIzuszp0tHDFAfyYHkqxRzwbLs7JR2swWi5YAzDXzzL21UdcSH1XIuhGvB72OUq
	 NMvaW45x0XpwHs+KK7+b7iDXZuTPuVI1BPG5LKugUdI3M58TGdsTxx9U5DrU6J/o2gxbh
	 271PMhe/voEU607N1mXPNh6DmL00XkqYbq34xHhM4EElsxTmf4oLrnPWp1IFyYBmG1voO
	 dpTULRKIvuiIZNqpEAqCEa8fD4ZgCozYsVvN8tr3c02TlgRm70zatFkuIpC06BGLUwq/y
	 KyuL16C+5PhjvBcAbL8cBHRI/CyeQowcgEy8bh5OIsAySp+ipLJu3NvCQpn8VudYZlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2CxOg0u;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4A6606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4A6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2CxOg0u
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so7681545e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755195; x=1795359995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/hOIyUcvAfKlaaXm+bgaXHbjM9PJioyHvxOcCFmCQQ=;
        b=A2CxOg0u4nA5j2QwWMCX2xov6hIZN16xt8onwYD8iiyiAmefaUJoMWy7xFANfTWq3e
         b2Vw1nSe0DtU76RQo6cvDZJfosmWeIYVTT4tvIbqCA21YFldIqfypY4/lOVrBjY5f5Ws
         4fRK9yBDQMVa/LTBdWIjf4ivi1vmColGKsZo/1rnE83gpKiU/Hwvi2dCjToI04dcUG99
         5Cs/R7e51IBr6ubNPMl7niPd4VnEjeUzqhpbUDoyd1rAVesZRug/8vJFXr8RgwdKvQ8o
         L417AZpEqKuwBbhYDbV7yLkjyrKK8uoDyka2WiK/Joc7HZfWKIaZ0UcTG0SeY7b3XiFb
         kBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755195; x=1795359995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/hOIyUcvAfKlaaXm+bgaXHbjM9PJioyHvxOcCFmCQQ=;
        b=Fxk7AjE5/6V6ws8ItmGV/ocdG1Mh8fBi3j/CV36lUcbqj8KipcHJe/K1m+LU2Mjzwl
         wcr1eNF/KVTN6k2ZZb8v4ZDRPGVIEyn7nFlQH3SDDAbOBEL/l4ZmPfDSQTFQnB3fzOAc
         Ph4T8TKpHLjHsSyAovnyLE/dRPQTy5MZz8vnm93ezafx+mh1dpUG8OkqjzHkySfrO1MB
         mY2GMYtEa1UqFyDt9B6MqavJhXNlmKWB9zssiOkYxk638OvRK+Hxj6JzsiwXmejnRBA9
         x5FXWLG19xQzpFoF1ync633ThecbgEKtCaJAJL1DTzyWjlxGCruCtYTPpsRy+q7TXTIN
         Nvkw==
X-Forwarded-Encrypted: i=1; AL+hErEibo67l3QNOsJxgEY5hFL8KQLO/thsd7l01v7NRGVp5/7MSuQ46gLxsXIILW/gYABaomdfBRRN8IOmZQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3bwMqpcinzhGPPp01zQ5NYS2QG+PSHKoJtDH+uxL+z53LoamU
	hTyA9qoqGDDUnu/0g6qNnH3S9zUHasZDMghFoMCRKkilry0wlQbhB3pa
X-Gm-Gg: AYBFou3sENt4PzUgE5dk5Q/XlFm4sFaomknZsS2HH3lYoxoKvdJqvEonpePaLZtPJmE
	VCY+0mIROchFnTckl0EDMwHI/84AdUgWQUNGle8ecNSPjnq8d0QvWqZcQWPT/q5INJL0qXOs/7B
	aJIv1eHkoLdnQlOgwYMyK/JocriwOv5ULl8evJlvOHIcBXvZVzs1T4jOGeorPY/9qA8NSup/ldr
	lW6w6bfh/uTyKCTgXIwjCsKub0sA97cfGrFPnk8uI8lsjmNjoXnNdl9TxdOzWZGPRuoJzR4zHVo
	ICXyJEV7CRRyqgTQD2LkqeaFnGpCcNXTa8zcP3wfYPMiEpOVC/Dp54qWHAjjO4RrfBLxjXw89SR
	kcsK6RU9s7e4nNyQc9/mSBeBQobYZF2JnSlJczbQ50lJzFHZ4+mdHDq6edNHCFdQU1/O5uRXaHV
	OgiFb54aJ44jT24GPxpB3e5QzkwFxL4OulPT5fRKe/pzC9ETYE2nG8srtEK2MrrHlcgTbkee5lQ
	/dpak8vg56ytCrwS+dqtJbPNxkmQH5FyeKuzdG9hC3PtTxnMJ++Al15LbA3rcNpVqZEPTYGP9EH
	xxwUnMePETphXWlwxxujEKAuykmLp/mJdohQzCKUUIQxRtucb3MFNWI5+yj0enO3TQ==
X-Received: by 2002:a05:600c:3551:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb55abdc18mr178633625e9.33.1794755194903;
        Sun, 15 Nov 2026 07:06:34 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm17236146f8f.28.2026.11.15.07.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:06:33 -0800 (PST)
Date: Sun, 15 Nov 2026 15:06:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: andrii@kernel.org, bpf@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 alan.maguire@oracle.com, shuah@kernel.org, alexis.lothore@bootlin.com,
 luisflavieira@gmail.com, ameryhung@gmail.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/2] libbpf: Fix sign extension of unaligned
 enums in btf_dump_get_enum_value()
Message-ID: <20261115150631.3854c17c@pumpkin>
In-Reply-To: <20261115084923.53182-2-dennylin0707@gmail.com>
References: <20261115084923.53182-1-dennylin0707@gmail.com>
	<20261115084923.53182-2-dennylin0707@gmail.com>
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

On Sun, 15 Nov 2026 08:49:22 +0000
Hungyu Lin <dennylin0707@gmail.com> wrote:

> btf_dump_get_enum_value() reads unaligned enum values through
> btf_dump_get_bitfield_value() with a zero bit size. That makes
> right_shift_bits 64 in
> 
> 	*value = (num << left_shift_bits) >> right_shift_bits;
> 
> which is undefined behavior for a __u64 on both endians. The path also
> bypasses the signed loads used for aligned data, so a negative value of
> a signed enum can lose its enumerator name when the data is unaligned.
> 
> Fix this by copying unaligned enum data into an aligned buffer, as
> btf_dump_int_data() does, and reading it with the same loads as aligned
> data.
> 
> Fixes: 920d16af9b42 ("libbpf: BTF dumper support for typed data")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  tools/lib/bpf/btf_dump.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
> index bbe86928b3ec..a80762a70cd0 100644
> --- a/tools/lib/bpf/btf_dump.c
> +++ b/tools/lib/bpf/btf_dump.c
> @@ -2329,16 +2329,11 @@ static int btf_dump_get_enum_value(struct btf_dump *d,
>  				   __s64 *value)
>  {
>  	bool is_signed = btf_kflag(t);
> +	char buf[8] __attribute__((aligned(8)));
>  
> -	if (!ptr_is_aligned(d->btf, id, data)) {
> -		__u64 val;
> -		int err;
> -
> -		err = btf_dump_get_bitfield_value(d, t, data, 0, 0, &val);
> -		if (err)
> -			return err;
> -		*value = (__s64)val;
> -		return 0;
> +	if (t->size <= sizeof(buf) && !ptr_is_aligned(d->btf, id, data)) {

Do the alignment check first, you don't expect the size check to fail.

David

> +		memcpy(buf, data, t->size);
> +		data = buf;
>  	}
>  
>  	switch (t->size) {

