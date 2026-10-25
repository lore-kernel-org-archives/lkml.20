Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792889845;
	b=nFX2+7FdCAka8nlD7r6Fm+Sk5u8RSkOYC4+Bu9DjeD5aibyTGeMQNsvTn+5mlQKAU/G7
	 aoq9Zs01WquKsvOIr7IeVZrlHYCJwDN/BtS3gHsn4zpCyUUgumzdKENUfucd47dCFsIJZ
	 RylodXHLwMpWrvEa9/U8itVUPsP4BeFRxxg53jpm7n9eWm5o7es7SXLJq4+yVhXe0UC7I
	 8IZPJb3nlrRzf+6IZkamHDUu/jTtIphtCqm1CluONxAR317uLKiN6XskZ7Uq14dTvkNPF
	 jWa0UTbSIa2H3PqVrBD16yjbuvE0bECWpXJwVCzVaQn68ypOQK9IPPuLAwN91NIxW5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792889845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=pDZtqYShA9M719qMGZwkbAW0j/mSC/jo/m1vw8SlLFI=;
	b=KPTpgLr5XmL/ldIVYojCJhWS5i2xhx7FGG/Kr8AKt/8rN5Xk8X5kYKncn7q4TKFxo3l5
	 lXj3mHO0AgPB2tNrScImsUBqXLPogwu+2etTcu8amSzK61wIFNVgbQaCUZnxdVuvj8d+R
	 dg5mM11RVJD1OYbzDKfbSPD3TFTn6X07qAVl34aE9FCrPWDFtpsu+h5Xf3YP4srZkKpTk
	 xhZ6g8qNRQ4/7XeOzTOyrC7KOHxSHEuCnpDjsKed8v5R/EJ0qjYLViqge3fNRDuCpVrtf
	 7TXExbNoORsdqTFetjdneWYxpzWphXzBnl0e+WxkZuSQcQ4H/upLELEgQaPfrPJpM9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qKsNu/69";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA5F606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA5F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qKsNu/69
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1451127a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792889844; x=1793494644; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDZtqYShA9M719qMGZwkbAW0j/mSC/jo/m1vw8SlLFI=;
        b=qKsNu/6948Hunxjb+ZiPcCoy8vD07ngMxyBeqYhcVGd0kSBlIWIr0A+QkJfC/3XKff
         Nim4mZCvYuRrO1ToKilZoYqvzekm0+zxxszmXCjZzJs+AF54HB9pMmXfNL8GnPdCm+d5
         H5WCH7qEkEXTfH7I8wo6m4eDd4DLloyaaZB/QSV7nZuBZHkxhjmxApW+Dg26xP/s+umN
         NxdWtARZ4S7KlqqoPMTrXgxGhNXqPaR+4JQsVdIzZsmLeZEIPFvGPnquJ9W9hfJNH/ue
         TjPS7NFLMMBVkQ0cLgFP+0KfjGyaYdC+JWWvp4Kf6c/uuZUiOB6OogkvX8bwgxlUs2Fl
         WGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792889844; x=1793494644;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDZtqYShA9M719qMGZwkbAW0j/mSC/jo/m1vw8SlLFI=;
        b=pKT65TMF//noHLQ7QF93VnmiLlv0IuySQulQJJ6W1iKxm0hZFWwme9w+i8/vfcwBHb
         RRhZILgKUG5KM/UwL5Cne0/6FRM1MKaQioMbsbw5ZZolQfsPWb6Bl1qFxEkLOM2r5Hk7
         JT6yKytBmxlxrGltsOWxhUG8zebBfqqvqD3iCMW1fhvyLR4RKF+9c9nJfNKAiWt7kRZQ
         tPNZ8p9nEiWLgNJFpFT1fyOLcMS6vKaADrBkSwaU4n5A0+Fph5/OxVAW7DOh7TIpHY4l
         OQFCrfiY4qFpOnF27jbnCtR8tc/xmewq7Uh8El2VggVpAvPfn3zPO7twSjPgWgnm95yf
         Dc/w==
X-Forwarded-Encrypted: i=1; AKwUvBwyp8qOn3xcfBvyndHIm1R4rUCaAbF0/u0z7if/5TWZhFEaQDOrGB7BdnAJfzipEzQWpA1eX6EEX2ugBkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+vwvuuXi7QfbH5i1YmfMOImEhyrqPC/4O9GWISAu5RVZbz7e9
	jUGyTKCwA4F7v5+KofATtOd5ze6q4MhjSC9BD1YKloCAI68J1Sln6xr5
X-Gm-Gg: AYBFou3DrucrPBIe0Ir94A3C85xYmjUHbKLZ24h3hvgbqXmHCB63BIKxOs1Bglp5PI1
	F5iM9MT934y9OUgMv7X58cBhi1utX2zp3IRl1r6rGyuPAWKnwfCV1O4F1tngN2QiSJ2w9Q+QIHm
	qoYlDoI5y+UzrNF/8VO1en//8ICanw4XVM8ZfP5WrSAJxEtMXtUbZWdcdy0VLSJUxDbgo7OhQKx
	8lN2jmTeZvufaUMqNwB72Xy61Dkjs5XsvOKJEegSzrnhi+bXyEJ4MVxkrPTO7TAd4GZYus13yLb
	ymjG5VWjjKgdu2fkOfZ3kVlATEIy/2ATnWtBzSpDcRv8Qb+r9+Xve9tzRLNKkaKqs36hp8W9UUB
	QoXCo4PBNlRa14wCspXXhbgg8vr7JEO7HvwBOSEurOSuFkf3PhQPmw7c738oAFCpM3X4wOL4jLP
	49kNwMDnm/cqeaRU3cAJYrDItigGQMvV+ZXZaP7WXCoIpmdA7N4Gulx/dw+6bBVmSvWirK2pyVO
	limLYQUG1Day367/TeCjsTlTz4GcPrdWGpzEzyZLkQ0Lccq3McNiA30+aQ5x7/s3v73IG73tgQF
	oA+7l0hyIVQNDxNaq3qQmfb5jiUqcx+tQEUP7+AojDSb/mFKnJE+Jsr5p47ptw==
X-Received: by 2002:a17:90a:dfcb:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3adeae7763bmr2959846a91.42.1792889844176;
        Sat, 24 Oct 2026 17:57:24 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm3951459a91.17.2026.10.24.17.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 17:57:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 00:57:22 +0000
Message-Id: <DMDIENB8G58I.3IFV81HSBAA8H@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "Daniel Rosenberg" <drosen@google.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 1/3] bpf: Fix bpf_xdp_copy_buf() when the buffer
 overlaps the packet
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ayushman Rout" <ayushmanrout27@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261024092659.76422-2-ayushmanrout27@gmail.com>
References: <20261024092659.76422-1-ayushmanrout27@gmail.com> <20261024092659.76422-2-ayushmanrout27@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
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

On Sat, Oct 24, 2026 at 02:26 AM Ayushman Rout <ayushmanrout27@gmail.com> wrote:
> +	for (pass = 0; pass < 2; pass++) {

[...]

> +				bool self = orig >= ptr_buf && orig < ptr_buf + ptr_len;
> +				bool turn = pass == flush;
> +
> +				if (self == turn) {

This is too clever for what it fixes.
Every load, store and bpf_xdp_output() that crosses into a frag now
walks the frags twice, to look for a buf that is on the stack, in a map
or in the perf buffer.

memmove() in bpf_xdp_load_bytes() and bpf_xdp_store_bytes() was a one
liner. This is not.
bpf_dynptr_copy() is there to move bytes within a packet, and it's the
only realistic way to get here with a slice: when one range fits into
a segment and the other one doesn't, it passes the slice of the first
as a buffer to __bpf_dynptr_read() or __bpf_dynptr_write().
With patch 2 the chunk loop copes with any overlap. Use it for every
copy within one packet and leave bpf_xdp_copy_buf() alone.
bpf_dynptr_read() and bpf_dynptr_write() with a slice as a buffer and
a range that crosses into a frag stay as they are. I don't think anyone
needs that.
The read and write tests of patch 3 become bpf_dynptr_copy() tests
where only one of the ranges crosses into frag0.
Something like this instead of patches 1 and 2 (compile tested only):

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 648abe1..b74c036 100644
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


pw-bot: cr
