Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751255;
	b=m4fxNuU0kOR8j8OdoH/rzW5MPAxl+DRNMlCdZoRghbRfj4DZr+NUTvhL5DajuJOe5n8X
	 Zdw3VWhLyTrF7yMoRMBW7Do4PfifjBBn3Mupq8LUeAjgxeMGQh1hS7AcemmrCP8CLYPEa
	 5saJlYgI2TgEqFoAopc4MTgNHamR+lxPuPqbUukGhBfnuUq+5Xm893NumSinTK43bv8IF
	 9qMaTjghriMLT1hqNv89Im0KRm3HN0ord25j1UqbMDT5LXfyJr61QMAEwRxVA44V6tTyM
	 PaI+cl4JuBASz6yHb9Jrq/2+91/nuEsg4cDcnJYwioswTQjoFDE6yviAKSfkVuOkQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:In-Reply-To:
	 Mime-Version:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=0C3vS80b0D+y+F8f8rSDZook9rRTV5pBeEVsPEFc3Yg=;
	b=AHlXhW4GyAQSMdbKpmNjeFUmw4Zb0lcJ3/tMuj4lN6bG56BQUT9vukXHrrjDMpuDECaR
	 cofiNo888u+NbtfLXKLkNtYlLSJTh6m8IXBQQPMrE9vJ6pwFCisDuRAueW+sO3nj45KwG
	 +UXnsvcVomrHH2ilJ5rNg8OG/qns5mynFuaIo6bTbQy01PtmHqZxlEWuSNlEVD2OlMv/T
	 L0030hUYOLGE7cp1yHJ0zO3myPKO4R0uo3eJ98I761OOJPOwf7f+MhsMvLYEem1xedFdv
	 i5MaTAoQk+1rZYQ2WZY834ds80j7l+0lJbV6iuihXgHdiLDqxAPB7OR6iVoZx5c1g3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gpsiXt+L;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5725F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gpsiXt+L
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so380321eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793751253; x=1794356053; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0C3vS80b0D+y+F8f8rSDZook9rRTV5pBeEVsPEFc3Yg=;
        b=gpsiXt+Lx1ZaXcGETB/DpG859ORQWw34HeZ4i/HbRZkr2HrHRYRnlQClCxPPrvdMBS
         GEflGEM2njFo3OKgBIVjNYlaCgIw144SlM7nIaotrEa0MWvxmqBS0BdWomjoHGW6iEeP
         DeFrOHsmBQIbnSwRrgOLE8Q2EwTb8Q53jI/z2AJw1IC3Oy8XIJMd2wDBXvvDOxuaO6hN
         bcKQqDRyLcWauKBNgtcURfJ3O4vAUZ+PsMzZXXFoC38sJkIdqiWyppoZ5/AuULZWjF7Y
         E6+t00iSLmoJbKR3NDF32G7Y8yMxrxl46JsGRRlo599aOF2HOj7p4J4j1ksFDMw0v5If
         Bblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751253; x=1794356053;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C3vS80b0D+y+F8f8rSDZook9rRTV5pBeEVsPEFc3Yg=;
        b=A0zyThByKKqMpztGqC2biSo1L1ddtqQ+3BKclJ4oD2rSovGOOfp5WeDLBj5BTxUrn6
         ydat0qyT0OsWyGCWopL2sapFOGeGV4wVQOdfd0JeiLaJPxp0CNd8qhaYaD2AzlmOnV52
         51XjQnXmTRNJTpH/Rj1MNvI6WU7Av7z2Dd0v4BDUj2SsaP/ycsNtqOrf2WGIlXsC0Opu
         F2n2ixShRbIdS4XsYsAk5zxlXbj2VcbvxCBq6AhqBIbA0+HRQPRViRvj++l98zg6E+cF
         7axDDSQSOooQPulTMxCYDiNEiOYc3Xk0iO5GWQbOF7FoXsBw9y2qV8n6cBnCG+ZfSyp6
         SYZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWpn/uu9kp/SdVSV5ElpWjzF3hTYkIjsv1wOKKgIz9EmI1xDJjMVlPkYhLqexM4i4wGk/Arkaz0v2UyyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FN1dAwMl9dg2wgEZyxHBdcf6JjufCZsCjrccEKwvRhT7oHe/h
	wN4peSV93itLFQqlDgkyVwmNudBTaPihqE/ay30zrJPxy2i6/KSpEY5joS7JwolfIrvE799IQ3n
	ltiIsJBXmtGcGRMh/qaYzjdWfGw==
X-Received: from dyclv23-n2.prod.google.com ([2002:a05:7301:6197:20b0:36c:a067:eca4])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr37881360eec.21.1793751252976;
 Tue, 03 Nov 2026 16:14:12 -0800 (PST)
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103235152.1904727-1-sdf@fomichev.me>
Message-ID: <18e4af42c8b279c4.3137322e32382e36372e3935.1c58a7.0000sendgmr@google.com>
Date: Wed, 04 Nov 2026 00:14:13 +0000
Subject: Re: [PATCH net-next v2 0/7] net: devmem: size TX net_iovs from the
 dmabuf layout
From: Mina Almasry <almasrymina@google.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	sdf@fomichev.me, almasrymina@google.com, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, razor@blackwall.org, daniel@iogearbox.net, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2026 at 3:51 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
>
> TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> 68KB, which makes BIG TCP ineffective for devmem TX.
>
> This series picks the TX net_iov size from the dmabuf sg table instead:
> the largest power of 2, up to 2MB, which aligns every DMA segment. With
> a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> no UAPI change since TX addresses are dmabuf offsets.
>
> TCP still bounds skbs by size_goal, so frags get larger, skbs don't.
> A single frag can now be as large as the skb, which matters for
> NETMEM_TX drivers with tso_max_size above 64KB:
> - mlx5: 32-bit length per data segment
> - gve: splits frags into 16KB descriptors
> - fbnic: keeps the default 64KB tso_max_size
> - bnxt: 16-bit BD length, devmem TX frags are capped at 32KB by a new
>   per-device limit

Reviewed-by: Mina Almasry <almasrymina@google.com>
