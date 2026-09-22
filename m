Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB32352F296
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067837; cv=none; b=AQB5DpppdoV7EKpplPljP3NjfU23N8VnC04ozy69g4XjeYjbLJzCGb4RiyZKOjRQ17Fl2SFsEaeUK5hddnz/CInqBaZncOk9i8kkWJgq+zCi+GvcKuBjDJdQoIGZeaCOVlolseyI6+4GYeuLyfQo8rBU7X7zNSoh402PoufEhl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067837; c=relaxed/simple;
	bh=VTfd+kx4IzMN4HwWKAFk70C0fOTr88FdJxqeHWCpGr0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xcn+BAOZwHAG28Fy4VB26xBo59wm4JArnUKQIfrJ6jWWYCaIs6XlEBeKmGBGR6oghAUWShga4/0r7AfA1xKd4fhpCnn99/tlvvHiXTQCLCdpGVt1PxjXB7rHXcMxL6kRPY1cFgjxp6/XmF9iO82nIeut+WiAt4hRhPlmWkQIhsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jm1bRRHs; arc=none smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jm1bRRHs"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso2142167f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067833; x=1790672633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBmqSfthoDkMfU3pfMgMsdFTjh/btwHVLwZmR3sypjM=;
        b=jm1bRRHsT98+lIiHTAmpF08989N4++WC+xUV1gRF28bGPVJ8MW6u7k9GqKizMK4utI
         OtRt339ZNJdyhBR6mwWhDpJFJpT2BOlbiXWxqjPvi4hkvOgf0h4Zowi/UyhoQt3/zRQc
         kvCVLazwg9/m4lcx71bK6aJJTxg8z9SYj4UJzXIoFycQMOwRytFZd1CWgAqCcFPkQedk
         hQaKq580USnnBWlba0Z989PefR+/SPPvxu8i5v6q8zDjAfwVsNgdtMmNbJZLW/EBXiws
         vvbDNUpVaLD5mGKuu6TdUw3If5PaQdDSmr9sgyLC9MpDXhCERPN98lRNk3Iao8s04AKH
         Tubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067833; x=1790672633;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBmqSfthoDkMfU3pfMgMsdFTjh/btwHVLwZmR3sypjM=;
        b=XeXwF2T6VHCYQuVme8QUFQQYo46LTSc7lstsma1tLVpp3d3Vy1joM0Ix2qXrt5vYFG
         YqIqW4BK0Iqne2gmQp68ZY13xN2nnrSNUnZuL87VyKcl/P6PDSimluIWpvfhThihALRj
         /mUC8Jz16GRTHBz1PmeeSKpk4HZYBjKQT9WaEP3lXMH/1VRbhELlQSSJY+0ozX0bkPYd
         Az1FJHk/bw3VBxMhUbCxGmcgikkcLIME2POzrjOJo7cAhGfFKfXIKS/L/xpvNUuL8qhE
         yfykTXNLP1lzDf386GbjWhsAPB2KTMjhhAgJkkQq9F/HnKm4zV5Gn7kB9/t4MdTgO0Hf
         ZPmA==
X-Forwarded-Encrypted: i=1; AKwUvBz48EZbF/hku50pU5qVwux+LS2T9o643UdqctO3xS7Nz3MoaauXxBDFJuwIjJgDHRlIjvacpTegtlcgIH8=@vger.kernel.org
X-Gm-Message-State: AFuF++kVBmd3O1qtgojCfcZJvlKe+w/2R9HEO3WWer3vfbVcI+1A5Od8
	bGiMo5cwOswJeS5xbtCTOlnEtoc2ESQlHQHXb5q7k8NajnLMfNq72e8W
X-Gm-Gg: AYBFou2PbuxKlglU94Zdnaefb8Jc6erQrhFzRj19My/Bx0iwFcmQZ1rYUgAEmYfwG2s
	iasJNF7WYCgmQZtcGGv1CKAJk6M1uAUMINpI+oP8+Ixy4nwUQHZBskFVqZH1mIsQquKeXBGyS91
	MfEh8J2rLLYZ53n5931LBJHFgg6VJrWMLhlCjOjtvwWTMz85TEbGHefnwfYIDzNo72ImumrVK1V
	KSPVxyvversHLaz5DbUw+o0WAgMFg1ZAtYjG9mRt0eKtvLCRc314wRzFB1y9g8biRPkSmeN+/eJ
	x3Qk0pk4aM85y96XLY5ngh6qcvZt4c8S7tbPA0kKW6QaKS2UKkMzpFRLgBt/TttkvwvP9TG5+lm
	G21A9bMSlEcEEZo0SmqyTKhu055jpRfr8VbHYNl3hjsHxoVBjvBRcO9sJCve+Kj3Uz/IIpmn8gY
	M7MJ4fyqsuvuB++cQOMtTMgMuWL9B/OFrmOPsz12qUhQgpzZgrSbCliZCRNvMgXTELPSOISsUhJ
	C7cOs31juCu/SFwM3ZKEZzh072+4NYRSkk=
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr200390075e9.10.1790067832375;
        Tue, 22 Sep 2026 02:03:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf0074sm34525095e9.3.2026.09.22.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:03:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:03:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Kees Cook <kees@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 3/3] kallsyms: Match compressed tokens on the fly
 during binary search
Message-ID: <20260922100351.04555f43@pumpkin>
In-Reply-To: <20260922-ksyms-tune-v2-3-a333ee31eac7@gmail.com>
References: <20260922-ksyms-tune-v2-0-a333ee31eac7@gmail.com>
	<20260922-ksyms-tune-v2-3-a333ee31eac7@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 01:19:21 -0600
Jim Cromie <jim.cromie@gmail.com> wrote:

> kallsyms_lookup_names() runs a binary search across kallsyms_names[],
> a packed array of ~130k encoded kernel symbols.  For each of the ~17
> comparisons in the search, it currently decompresses the candidate
> symbol into a temporary buffer on the stack before calling strcmp().
> 
> Comparing raw tokens directly in compressed space is impossible.  The
> BPE token table assigns values by frequency, not alphabetical order
> (e.g. token 0x05 might expand to "zebra" while 0x42 expands to "apple"),
> so comparing raw token values scrambles lexicographical order.
> 
> However, full string expansion is equally wasteful: roughly 16 of the
> 17 binary search steps fail within the first two characters.
> 
> Introduce kallsyms_strcmp_symbol() to compare ASCII queries against
> compressed tokens on the fly.  It walks kallsyms_token_index and
> kallsyms_token_table incrementally, matching characters directly and
> bailing out on the first character mismatch without expanding subsequent
> tokens.
> 
> This optimization:
> 
> 0. Avoids decompressing non-matching tokens, short-circuiting ~94% of
>    binary search character expansions without adding any tables in
>    .rodata.
> 
> 1. Drops the 512-byte namebuf buffer from the kernel stack in
>    kallsyms_lookup_names().
> 
> 2. Leaves sequential address ordering and kallsyms_expand_symbol()
>    streaming invariants intact for /proc/kallsyms and table walks.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
...
> +/*
> + * Compare an uncompressed ASCII string against a compressed symbol table entry.
> + * Returns negative if name < sym, positive if name > sym, 0 if equal.
> + * Exits immediately on the first mismatched character without decompressing
> + * the rest of the symbol name.
> + */
> +static int kallsyms_strcmp_symbol(unsigned int off, const char *name)
> +{
> +	int skipped_first = 0;
> +	const char *tptr;
> +	unsigned int len;
> +	const u8 *data = get_symbol_data(off, &len);
> +
> +	while (len) {
> +		tptr = &kallsyms_token_table[kallsyms_token_index[*data]];
> +		data++;
> +		len--;
> +
> +		while (*tptr) {
> +			if (skipped_first) {
> +				int diff = (unsigned char)*name - (unsigned char)*tptr;
> +
> +				if (diff != 0)
> +					return diff;
> +				name++;
> +			} else {
> +				skipped_first = 1;
> +			}
> +			tptr++;
> +		}
> +	}
> +
> +	return (unsigned char)*name - '\0';
> +}

Since len can't be zero you can move the test to the bottom and remove the
skipped_first test completely. Something like:

	tptr = &kallsyms_token_table[kallsyms_token_index[*data++]] + 1;
	for (;;) {
		do {
			int diff = (unsigned char)*name++ - (unsigned char)*tptr++;
			if (diff)
				return diff;
		} while (*tptr);
		if (!--len)
			break;
		tptr = &kallsyms_token_table[kallsyms_token_index[*data++]];
	}
	return (unsigned char)*name;

Also 'char' is now 'unsigned char' in all kernel builds you don't
need the casts.
But I'd make the types explicitly 'unsigned char' just in case.

David 
		

>  
>  /*
>   * Find the offset on the compressed stream given an index in the
...
