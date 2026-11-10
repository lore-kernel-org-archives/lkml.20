Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298305;
	b=uBG+OqLAh2UUh0myTwRc6T3bhKLdvl3LbN7vqUR8MLlB16uwSClzETWT3zYBDN+YRtHf
	 lghFMKL37eSuhKeumktxngVpbBiXlQlUn/XfjvJaWWPPF16VnlZEFObHjJAsnh9f2wwD/
	 1BBzqOGejGH4xD4ufeviRabvUwKTzxmPtr3XCkFpx9z22zVbtRLlUDHpwUXzsnaJbgfZD
	 N3U4adQa47huREdXpptzxQAGIrSVKxDbERvWEL7+Yrs7isqxoXRQRePo8jJyHU2EUzBRA
	 rAEdhoZUvSMG3tJYgfCwPycnGZpdLRwOgW8AjhQLcC2aHJp/Vzd0EGZfpC72e/uYqnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298305;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6XKHkEPKtsOptLLp6CkrLlzFIFu7B8MPqkMARI4hXEU=;
	b=g/ych7L8LxlRbqFUitIsOW3DJ5bWPL9AzW8gFbw5NZCjsoK7hbP9T+5XKTUQwJBK3sD3
	 quPBNoeCA861kr4tYLQ+4EHLXWVv6rnSGfAVma/0wISMfT0fg+zqSmciNN8lMwPBoXQqJ
	 K3rfjPKn76/d4PyopPBnPi5AY5ukiVT60eN16hp2cX7xo8Zl3256sX93ytGWIyGGPtczT
	 RANV4flH6GFmeCAuwl3nZUMY2fLXSmchvJUgRKLnX2MiWohOEXMcIn7S8pgjxLacaJaZJ
	 dslmC38FAslqEAhj4Gi6UB2P70hj9sQWfrJXy3/hGVmg8+xvL29DlCLxpzwxUADHOvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7+niy5y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7+niy5y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE7D1F00900
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298304;
	bh=6XKHkEPKtsOptLLp6CkrLlzFIFu7B8MPqkMARI4hXEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I7+niy5yn7ysiyT/VBjM6NXG4+i7P/4VGRUpvP5ZIEEt/GJGGf7yjJrwp7WtMuLuy
	 Pspa2YrRE2g2epU7k6G14u6yYGsRHSJVOgnTBrplChcr1TfM/1kbgAijVWTcThK2sj
	 sE+UQM2lxZfynVvdzO26XYD0IkDzeyrledCRQYrawZQr9XPDmWSJtCaFBTkhqBns2Z
	 snU+076DS+Cgnerf/XdfHBiJhZFEBURlSLSRWC/OuBxmH8v9ZyJJyTX056a3rZQ0c6
	 4v8bMtBY1fZfJZ+RWaAV9or9YFGyS2abcin+h/yN50Kv3X5IljlLJBYY6BH21OP5U7
	 t2cW68t4s0kWg==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f36c18b75so103629485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:11:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHUXu+E3B0FdWngHCd83MibAWJQkYhymWqBOeVvmZlUKS/o0JrKM9l/bqsYINVmklAAzj7FayAFCIA8pjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a0EpbuaGUkXe7f39VA1iT9Ch82juzV/uWDhpA4vyrTBfMRyJU
	iN/jkaN2rcscPYBcRLhZEfbNr0/3oWrdKZjJpUFs6PlTuV3fKOLeLvrnsoPvx9HaA8YWV59cDrp
	VrSDZgl3iqS21ooABUroyi0fvR1mqVxw=
X-Received: by 2002:a05:620a:1728:b0:940:f224:5a69 with SMTP id
 af79cd13be357-9479f348f5bmr314297685a.65.1794298303673; Tue, 10 Nov 2026
 00:11:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org> <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 10 Nov 2026 16:11:32 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xXTRsn=Wf3j6u7QyNs4zRc+1i6MG45vtao=5gdQv8Pig@mail.gmail.com>
X-Gm-Features: AclHuK_7DysJ1y5_bnFyuAOrVgsW65eT05aJKGB8T07cT1zr_AQPphy0esTgfR0
Message-ID: <CAGsJ_4xXTRsn=Wf3j6u7QyNs4zRc+1i6MG45vtao=5gdQv8Pig@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:32=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> MGLRU is currently the only MM component without a dedicated component
> maintainer. Fortunately, Kairui and Barry have been actively
> contributing to MGLRU and have volunteered to take on more responsibility
> by officially taking care of it.
>
> Given that Kairui is already an established MM component maintainer in
> a related MM component (SWAP), add him as an MGLRU maintainer right away.
>
> For Barry, the idea is to transition him towards a component maintainer
> role over the coming months, starting by moving him to the top of the
> reviewer list.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Thanks very much to David for all his work on this.

I also want to thank Andrew, SJ, Qi, Baoquan, Muchun,
Baolin, Lance, Ridong, and Kairui for their encouragement
and kind words.

Acked-by: Barry Song <baohua@kernel.org>

Thanks,
Barry
