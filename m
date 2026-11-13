Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601341;
	b=D+mwh5u0kdXbGCQCMrvqbnLapIIRx1IYu+Ju0a3OgBLEv+lK9Dct/6rAj1z5tK8/I5Gj
	 wf+0WKutMCmWTpLcOHKZPOGwbalkwD4bf5mHF/ty7MRDq/8qtAnotofNFOgZZtSi+Gw8j
	 CUWN/sqOD4S/CYFf+baKGTXW0mesqKnb0J2Ai1WSCAyaqldhtUp5vk/ILanL8jmQJW5E3
	 dImYmKgSGcVJ1T5/bP4A1xddpcIk/yitBMeE/wms2cAQYHlx2SGYTPL0RKpR6/T7aSQD2
	 qWgSEJtruHmDSS9Vr+6DWhLhZEx32/bwvXSoR9ppMihNJ5DkOOi7iMi1RlNzO3iTMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=s5HRLWT3GJ5V57HOZzLlKs66p4zza+KZ/ooym+DPD/8=;
	b=bXNr1UOFejMZv2JAua/YBrSPHqas55WAqOhA1OmLslKkBgc+n2JnMFY3MHk3mwxvrRkK
	 T+Nc+JtWPbFJgug6LagSSeelcLOgcOMtb/zMyspxxKZLFxVgPClp/nlh4obyaFkkKgem7
	 EGwdE2b/5AXLE2wI2YZrC6zRJQprJq0DXxuFBTB3vhnVmKP/VA+NVeO1q5fYoFV00mYGc
	 eLwFO+IDAyg1lH9dFdGof/3TxyKOYNIjGjr7fn1T6pURNeIKsYe03WKf0n3Sl+ngDKfis
	 HvZ6hmDPmMPscVe4znw72ZqwDdjYweVXJ5NbPKsYQR/v4TY+B0KUwnP7y2IRsjf5GsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL9QWYYa;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38C5606A89A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38C5606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL9QWYYa
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso691370eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601340; x=1795206140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5HRLWT3GJ5V57HOZzLlKs66p4zza+KZ/ooym+DPD/8=;
        b=wL9QWYYa8TzOJZVMNIyc+YX+4aWHXvMAiO159H51XCo86sRljVLG9cSgH+BOWJZiP2
         6G2le+g8OtX74/MisNw15WdAoAWTDcvYg7tM3VF708EJMOGrOBUYzsjGUNGzc4V9dZto
         EYO9AFg6efIX7i5dit17/pqUx+ghyCOxB1VwYfSjW3FRdQTE0aGgSh6aEwa7oNzFuSpG
         g5wtAjhoE09wyLWJq6rj9H5RFxaTDKm+KXN18OL25Y/hsccmK9amysRVN2Lj8o6Zv/Va
         jsOoobBDuEuXWpHTpjiPTYd4nIgte5zLNnQscwGjiU0QRaiRX4JhfCcH0qT1+lod5ULc
         4HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601340; x=1795206140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5HRLWT3GJ5V57HOZzLlKs66p4zza+KZ/ooym+DPD/8=;
        b=2pwl+vqh+20Z9RU2jAJdC/F1yibw7R6E/OBtpZvxG2hZJoC1Ev9ScxIUH6D+weEcHM
         PgGnj2Fji2buygNoiPjl83u9bKvbDfkUO5L2cDidM6euKIjL2PukN/nmXiom5mcsd25E
         Fh6rCuMOXNj8AJsnDuyB9jzn1zN2jnr+1oPWK2/Rk3eRVaQgQ96BSQTVvZkaei43WX3p
         uN9pv5Df8XQmpf2Auzgs6EsuekYbPuA6Jq4T7yKoySAkd9N5dO/BnSbs/n8bnm0CX3JX
         R+meW30aHnmSrX5DZxYer1s9zYb86wSb2ZcuvQy1AbDFWX+MqjLFnn5TUX1O/E2U75IP
         4DRw==
X-Forwarded-Encrypted: i=1; AL+hErHF9pduwd9lC6h/t8dKn7QfFz5zXmpypX+avw/OqJkjoqnmjEzmBhi47inJdmysxjpAAeNZknRI+ZRvOis=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d8rOLLBSP4caB2aMlZb6pY5AqPiP1isVnBI0cFDUz+J6Iyb3z
	4P6lS/dsggPANKR406H4domWphZdZzkkQR+Kk5F3ysdegGWx98FcnwXV
X-Gm-Gg: AYBFou23I+FDoDwh5Mc9v2pwWQJ7XXPiUu3ZVa8GI/mrq5GHQyUEfhqtmCSstgd9oeo
	tS3vxKOjUvgUnHl7D0W2XqR9wf+PiVbhwWzCeSJe54LEKUs2cnGp7sYG3l9sP8nCWuLOUb/nDNY
	uj3d1pcfM4o0YrMyZ1fHU4s8KQHQnWyXFWe0483HNaYZ5Glc94nq6KAAqJPahbaDHHeDsYfeKVU
	LHf938uOT2UMzop3ChrGr4hoUOPDXilhHUHnn6OezfShgX6k0Y1sepn4eULdVF52luR6sBOCf9J
	uN+TXfRMJVqQGNNbjIVWgjhVR3ToT4W3mT0w8+fGYzyBbWBU3dBeN9IJ4T5fluNkSjPrJje1PCa
	Bj8okz8NHmru+/B2fW1jXFhSgxkCuQn/ENtA9lo39OJ5zq+Ie6tOHmm7eKiXCK4oOxGzAVDjmgI
	PZANygcR4Q8DCiUot0eYKVLJSvd1zhVvByt2trnli0pGKtrRnpJl6ouMJo+wcmxOHQPFAgbbiHv
	2M15xp4VxCkxb7NvoxvIpZFBnq2/uqzuFWcOR5YXpS68qpey4blir7T5mlg6WwojM2w62MF4fxs
	Kmw42xJ/U6ZEMl+LL1zed18=
X-Received: by 2002:a05:701b:4594:20b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b50313a743mr3055299c88.39.1794601339464;
        Fri, 13 Nov 2026 12:22:19 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm15946929c88.3.2026.11.13.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:22:19 -0800 (PST)
Date: Fri, 13 Nov 2026 12:22:12 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 3/3] selftests: net: getsockopt_iter: cover tcp
Message-ID: <avdxbp3uCMtiO_KT@devvm16445.scu0.facebook.com>
References: <20261112-getsockopt_phase7-v1-0-1eb759dd0929@debian.org>
 <20261112-getsockopt_phase7-v1-3-1eb759dd0929@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-getsockopt_phase7-v1-3-1eb759dd0929@debian.org>

On 11/12, Breno Leitao wrote:
> Add a fixture for do_tcp_getsockopt(). The setup keeps both ends of a
> loopback connection, with TCP_SAVE_SYN set on the listener, so the
> accepted socket has a saved SYN to report.
> 
> TCP_INFO and TCP_CONGESTION cover clamping the reply down to what fits,
> TCP_ULP covers reporting zero and writing nothing, and TCP_SAVED_SYN
> covers the length-then-EINVAL path, which the second half of that test
> uses to read the SYN back.
> 
> TCP_ZEROCOPY_RECEIVE reads its struct from optval and writes it back.
> With nothing queued it maps nothing and succeeds, so the tests cover
> the 16-byte struct glibc still declares, a larger buffer cut down to
> the kernel's struct, and one whose extra tail is not zero.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
