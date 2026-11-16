Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842281;
	b=GF9XtqqXTdgBA7SFikrQqTRTmIgX5b1wcLNAXug877Km2REzSpMnW2RXKpzKTCoc2ox8
	 04OSh9np2OYP+q/bTsMF/iyoIKUN0VS5dbSTRzzj4kAa6sfqw6ovXwLapThQ34qBrgwLh
	 YYpNEZvPLI7QDHlHD+ztFgkA18xtwGS/c6Ijg9dB6CERqTR+SEPg3wSAroERfpRWEMe+s
	 tmFOyJSkXy/TONpO6px/lch09m3gi705AJTA4oPnW6EUtUH/O0op8QDYg8NC8JM0qTjZ9
	 CHRnaFTJA0tZAXSAJNr2GsTNDQc8ksld94JCZqbgGIagnjaCZvZZB7tjrgTvruv+JYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842281;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kAiajgZh1K0aXxscyfggwMSX75ltYmb3PF4vZUEOkbM=;
	b=DMkqsOKKJmmxJpf9LDypEIjLvFH4si9wJv4O17vrf53AMS5kdgHNHogrn3wvyPdaRKH6
	 3DCwrlWOJQNn7FazVYrAiz0SF/JQ3HHFJ4Z/e556rBoOGqhkrvMFYgGJgT9IgUT0TNFrd
	 IqH6gpjcRy1n5r51gMBPtjf5uEnWroiKcihcwu1K8RvE8JbfJCnVQiUv7geYCBMRVxEVG
	 dgDYuxJeHz0d3i6t+9GVrJG3tvkdmtg0e34sBU6lmB/XsmZ2LPqjQl0LnI7Qf2kiAWs4A
	 w+9TpJYXjpPazOk/+jq8g96L6vCrxCPzqAUjvY1YqBtsmu4eA4cH0u1y7rD/syD/gQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQkysCmQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17342606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQkysCmQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9255E1F000C6;
	Mon, 16 Nov 2026 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842280;
	bh=kAiajgZh1K0aXxscyfggwMSX75ltYmb3PF4vZUEOkbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nQkysCmQ0C+mGKrrVYOwYyWGAqRDWcgOCJ03/p/Rkp23+S2ZiRcI25yyN4iqUzCDO
	 OcPGkLmivRxG7ffh7WDJdNdRRp8FKlNf87jTq9AcI1V1VXE9NLJRgrLhvocBc0QrKJ
	 CM230ihXniaqDG0JInhAuG9Z+9QfHEk9KJzhAGXMDUDgLZBB9Wqzl7Iyo5pKryXjlY
	 jfwBosQIctDZq6ZLcgIRyMAywXJf6sK9wiIgFA7Q67+e9jNqsEVZuxUsaOVHNx/Beg
	 Y2fiJuOtVbGKwUkv57RfXYtv9JicABV/O9T73XSuDjN79LWcBd2inRQhkAE/4oMsAJ
	 9gaN3WLfA++9w==
Date: Mon, 16 Nov 2026 15:17:55 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm, uio: huge PFN mappings for /dev/mem and UIO
Message-ID: <avseiYtoPp1UhAbb@gremlin>
References: <20261112125638.12209-1-farbere@amazon.com>
 <avsbLgh-zBGmE4KF@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avsbLgh-zBGmE4KF@gremlin>

On Mon, Nov 16, 2026 at 03:12:42PM +0000, Lorenzo Stoakes (ARM) wrote:
> Err, there unanswered questions on v1 of this review, so why have you
> sent a respin?...
>
> I also seem to remember David asking you to slow down on the respins
> earlier too.
>
> AI might make it easy to send stuff out but you're outsourcing work to
> maintainers here...

OK on this one I see that this got sent out before David's mail, disregard this
bit, but please regard the rest :)

--
Cheers, Lorenzo
