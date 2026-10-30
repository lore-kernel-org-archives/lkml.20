Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353963;
	b=46+DDyBQbRAtB0X0lt5bh/tVIKL5izV1iaiES/UFab6pDnTk/JjJhAwIlb0eIjEUaiPC
	 5FtDiwOAEjdvSDdHV/Lg1kJGO3cLnthjqvOfHiSHQSaQeHKDLgUEAw7LEedVJPFGjhikZ
	 iiwj0797WRDdgY77nL2/eaHVEeGyNkg2jEJdQPNxJJLUQWUoH8ITvtsZyzl8Q7dnz+7kh
	 TnqmbYLX4OyneSRmDw1YLbARnMA1tiFcd+TY90ghlGrcRdjjqclt+Wa5XfQpVXzhOpJtt
	 pec7FkTxicdQImsZ1dPxym3dFfoXhSkeG3vr4iQ61cwcXxEW63Ez/qVmePuOuY2KRNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2B3bjvz5/cRFhwo9ukB7ZLLCsSJwpiNTa01piLcwoAs=;
	b=uuy4QM2Q8cLqOVX+jbIcnXG63QbhAvFza7NcAkkkIsSbuLL5rPs7MXn+5ukU45pBxz91
	 21lACeemRO4W3HgQl7g+sA+Z504nZrUCswLbV88BJ27DX82gNHPMzUSJ8mtnHTdmu63Y5
	 bfzHQLxR2lKchwt4EgFFuWHXM3gHgZLAvQb8MKe9j3/uOXqt5vdLXx7C1u55W/JW4H+Vn
	 0jQFHVButC34Nj+SY39xPXTblUEzdrYo/0CLw+Z1J862DFQ4biGubhVrZBcb3p9xzgMRp
	 Ifudo+ANUopKIiKy3Hd9nG24TEwjpRQ28iRVEmVHe9q0kQ5icyl2JzNX9EU8Y8XYHkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bsuXLYgo;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bsuXLYgo
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso74201666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793353961; x=1793958761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2B3bjvz5/cRFhwo9ukB7ZLLCsSJwpiNTa01piLcwoAs=;
        b=bsuXLYgolet9UtrpUXTjhF0NtZvh4wUfphWhBPdTzAHZ+voK+TzvSJt4jqtpIr4hDY
         BC576Tfm8MvgNixvYZj6Dqi4K3sFXUSX/7ZAfmkSmMMCDN7GxC4LIVVNW4r0Hl+mplFs
         W2by6S5cSgPj0g0wmpKfwfNf/zqgAEOXhiapRngSS2+Fa9wKQHztRhPeqLJ2d8kb2IO7
         Pq0H2NawTdGX7CmkA2qi3LE66II3XNjS223Mo2JwjVI062D0QJpvSdz+nUrtA+uP1o+G
         Q76CkUSavVprulwf+DpSyGG/1MWy2CHk3nt+Xc9tqJwtIHmBIFhTi8Seu1+BLrOUwvFD
         2wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353961; x=1793958761;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B3bjvz5/cRFhwo9ukB7ZLLCsSJwpiNTa01piLcwoAs=;
        b=xM+iVhUvXtxRWH8ID9qL2ZJdOxV0pNv0RraqIlCLQD1dbrZlTXB26DV0oK0uE1Fcri
         DI78SlFj3zk1zYGk+RhY2QwdkfmG9hsciq/8Jhu/QXh+D/E1qK30zaND8Rw+C38cwnUB
         br9NDaTA3p75b5Ew2EVYyP3kEmupGawdaV/z19gqq3Kjkbh4/PHD4ulXWfSE9aoz6tbp
         8wq0X4NaZ7mv39dl7nneHETEOxRQkEIrhWgunY5TG4o1q9xL8XIn3gFimTnNsY8emknM
         0ic8EemuyXOs2eukTRV+ZzJ+M8VfbRflHANlcK1xaNxrZ0gtl6e+y/Iq2GCF36ZkrRj3
         2z5w==
X-Forwarded-Encrypted: i=1; AKwUvBx17KIO9rrmAJ/CCuUCSj0V0FXq+5/pu9GWSnKJ2/Og7UDXUww/qW8JGLfACKjKX0aTrJI7Zryl5B5JI/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2KyP14CqA69pEI1OJ9ip9+sIT1+Vi1jCSbtkDVk+usg0rqJPQ
	9fKmdbDeh7tMhb9DyMSWiDGxfMi73cPhbHmQ/f+xk2+9ALSfg8QU/CiJ
X-Gm-Gg: AYBFou06RFBxVnkgiKDGFOgU/kAq5yLqup6MfTgQ1z0gdo1+vSnmkf+NJLQUNp3BYJH
	XIs6UW9hzH04na9l1UlOGj2uAmv3Ri6W40UkAbbYxMTPwIEgbi/eDh8xIMzz/Wq0G070IHK5Lly
	boN5JwTCX3ejodMpXpLwPDlck3TVk8K9BCnd28sXhawVzvICJilAUP37i6Oa8YpjEIyR0uxJcj9
	KjbmkNdYGJEhzN2jVsv9b0tKTph6ztidxw/cOllG5jwcEcFgtOQ+P9NZ9UxSMOW6uzqqkv8PtBr
	OfjXXxJ/IejrXN7of13OcTzIxZRIkDpV8zWz+ks33qN93PxuXgPq+N3W/qt9JYTsYGkDNvdHj7D
	gouzAglhxA9Gs/Fswd5lY1OlxmofO1F35oVh4zWD66RC+hO46cKAV+GRMv9eHr/K8Nf1lX65Qyu
	tzknto8kh4a9wgnGCas8zAeGBAfkban1sJFNia7TBXiyH6tGaIoLfChmqAf1iXjj6AvbRqjK2m6
	f/vtvBV8i8wOycLqOToRHU3cZQUE9hoWV+71dakmfM86gZ1v68j32lC3oHmUZyfo76f2A==
X-Received: by 2002:a17:907:d26:b0:c2d:c800:d797 with SMTP id a640c23a62f3a-c4ca79478f8mr163699766b.6.1793353960890;
        Fri, 30 Oct 2026 02:52:40 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b1d556sm432290a12.28.2026.10.30.02.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:52:40 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 30 Oct 2026 10:52:37 +0100
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"Liam R. Howlett (Google)" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>
Cc: "Liam R. Howlett (Google)" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, Michal Hocko <mhocko@suse.com>,
	Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
Message-ID: <auRo5WBj2OlKlWGW@pc636>
References: <20261028154218.1668182-1-liam@infradead.org>
 <20261028154218.1668182-5-liam@infradead.org>
 <auKshDXKQXt1kvjy@gondor.apana.org.au>
 <auMbCuecFeRmBFSK@pc636>
 <jfvq7vkx73vzp2ukq6nwnb3v3g2ezdcyppba4oa5lpzmz6ls6t@akc46gonndgy>
 <auQhkHG6XlgNTdRr@gondor.apana.org.au>
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
In-Reply-To: <auQhkHG6XlgNTdRr@gondor.apana.org.au>

> On Thu, Oct 29, 2026 at 10:53:56AM -0400, Liam R. Howlett (Google) wrote:
> >
> > Given where we are in the release, this fixes a real issue that can
> > happen so maybe we take this now and settle the general handling later?
> 
> There is no rush at all since the bug that you found has existed
> since 2025:
> 
> commit c6307674ed82c0c57d6e1e3408e84ac449ab8e94
> Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
> Date:   Tue Oct 7 14:20:35 2025 +0200
> 
>     mm: kvmalloc: add non-blocking support for vmalloc
> 
> Let's take the time to fix this properly.
> 
The problem with spin_lock_irqsave() is that vmalloc() path can take
time to alloc and map pages. I am not sure this is worth to switch to
irq-save locking primitive. So this is the "heaviest" allocator in the
kernel. Callers have to be careful how the call vmalloc().

IMO, this caller has to be fixed.

--
Uladzislau Rezki
