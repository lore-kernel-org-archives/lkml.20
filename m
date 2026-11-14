Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664104;
	b=ZHbO1zs4n7MDdonqlKOZHwPdaB5pEaHh/FmJxN/9tisBjRPlu1CHDnZww77AH5lU12Uc
	 tXe/CWW18RBWJ7z6/xkk1VCxR2JnAqei6Yg7ApWHNA56mzdtReudmTgEBc5bEz2UeZEH8
	 gOHZ0ICkVEgmMkGNntV+mpPpW+4B3t0MxHZjHmtqxRloLp7ilqPWyAr5s1aHXUHSEC4q8
	 hX2csatlvcDvktGecwbg063h484hFIQgrCAvKpPyYNBnwaXaq+wvZrNMCaECJTn+4JTYu
	 ldBbt9fU7a3YLOBjgF/WVkVg4LO0QJ+hD6HfLHfDj0wtSNzXpukQC1KQjbqgE2T9sSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sTtJShm6kz41I4Yj0S715Z77CNoUEBmcRU05Q30aoJ0=;
	b=qaU5k6AeBQ+z/5I3fFYQTz8mDDR0EC7nnBlyqkksBQGKuFgd2QFQWBTtWTiNE48MMEMi
	 +df22gUZObGraLmKv5LJQ2rCRN+BVLIyjdR5qG93HPJmFTxrmfFKE6TYZodeJuXWUYm7d
	 BnhL5nsUdCQV0iqZoUCV5OPM3gZHY+0OMlgI5JtAlfVT556XHxEPyNebX//f2bNbX9xzY
	 XUgw3x0itwWKrlaSTlU57PQMX1qj4VxuNakhnEqTuEa4KObtXYZ7FP93doTArjXLfsFb+
	 az2Qq/T0d5YCFdfMLZFv3kWHtaOFdPoJAdmzxDOtyX7Nv5hnWo63FGb9nd0lzQEBPow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etPTyJVP;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB534606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB534606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etPTyJVP
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c445c95d553so317876766b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664102; x=1795268902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sTtJShm6kz41I4Yj0S715Z77CNoUEBmcRU05Q30aoJ0=;
        b=etPTyJVPFLrjxK9f/QMKnsF23AfDr/jXmoolk1SORo17Sq8JiJJprSAhxb3TefyC3F
         NZO80RATPYVbFYH0bsTolGFRPqfHJq2iVn+Gu6oSt4bpptYPrSVEtw6QiM2Gv82DZy+y
         eoikJhY1vdoIt3hxrjXffHZQtIeEmoTqelQHf/ken+3RtpQ51Pb3gA1dqcQikhsc3UuU
         QfhHRts+3OnfzcNNHQi3E1Yp/DsDvMEbi0xYalx9SplH7i/S4BooPmnyPQoRwuL5G7XR
         l73cTHmLjBW2ISqqWIIVoC5YioIvxz9HAvH6KQZAewL+FisBYEKC5uhexEy/dzZ+r4+R
         q3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664102; x=1795268902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTtJShm6kz41I4Yj0S715Z77CNoUEBmcRU05Q30aoJ0=;
        b=K3X86ZVWESj/guNENrfA4KcPV9EsHwPwxQlmEuANEwbl2CWU3XsqImxfFBmwxfjp/g
         ylQR3Q19P6+hOpR8iUTPxCLvF+hOm41Ttet9pqB3URwvO1vHPXsRCY7OiLfArIgRvM3b
         X4/DrEa/XIUJElXVrYYiAk/wtW4vqBQRIu1VmwawTyEy9dk/+NvQngk1Nnwxs2v+r7Br
         B83HtvytHm1DCYeEOSdxPPYan1v/H2dsAsVwWMreTzLyK2oo0U9v8jfr05tUuQoFt0gQ
         oCZwvAFxmGR6cMwilTGj86qMZGf6XTUYm6MjFLskKynkant2zAtUEgIWODNp6cf4EbqI
         8Wcw==
X-Forwarded-Encrypted: i=1; AL+hErGWl53AzGzofKss0pTMmkMowLKmX5HqBIEgC5M8C7N5w0wNszugqQnFhDeOeDv/IT3uZ4yzkQTCe0Fva3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vqc2YomHhQvyja3H2KZKNuVCJOkqinUaBYwc2d927YyGPdMxI
	xGa+drtEs8H3P6oBDqm0/I+JKHgV9LWdvHaL7JbWFdWH3S7e4na5Chpf
X-Gm-Gg: AYBFou3XJPf1xC8q6A1hihpZB71r9gr11/sClsZ45KRFvG2nOchY/gObzG+048e9v3S
	vpFUnOF5gKvCxFyg+PnOdX0KbNKCTb1kPCMqYtFWbisrI2xC2u/L/31GB30HLuk9q3COJYxE0u5
	duD7RMB89hK/J4t98f7gxLE409ZSKz3YgR8rab3PQ63DAHceQAJbqu29SgKigiOg+mw+hTBigCi
	E+eKU+Zmw3B3546VXuTYw7BaNvZX4MhV4WATVnUZiRv3Dm2CRZHx7J9cFHhPcpmV2xZbv4+lA05
	wAZEVKpt5k9YUqe1Ewghdudqg1quMit/IoMlMege9enM5pu1qxtxv/f5AdFiDeErSm25EOd6wsH
	tblnyjBLNzWQKfnoHpGAWaKv2OLF5UT0NWAiAi3A57JsZaQ4+067jfrI0IhiwTctIQmhl/BL5P8
	1J/cO2FkxUIqbr+2nnDGYEnsydp42JN89cMFE6EX2e/B/Z2W8dGRHs8iF28ThbVu9/a8bxwLWzQ
	b6uuy3YBnfiQxIz2GcuPcd67//XiJe6yT0d/gE0oDUSqX0zQmIHN1RQJYo8rXC2jdjWXA==
X-Received: by 2002:a17:907:3e06:b0:c50:5186:a429 with SMTP id a640c23a62f3a-c50963c2b24mr502945666b.37.1794664102098;
        Sat, 14 Nov 2026 05:48:22 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50957c6c1fsm219264066b.0.2026.11.14.05.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:48:21 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sat, 14 Nov 2026 14:48:18 +0100
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Uladzislau Rezki <urezki@gmail.com>,
	"Liam R. Howlett (Google)" <liam@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Michal Hocko <mhocko@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] mm: kvmalloc: Bail if called with soft or hard IRQs
 disabled
Message-ID: <avhmosPSEJOFCvK_@milan>
References: <CAHk-=wiE0KG+jkhmJWifXuAVivtB63WCWtdEpGAex7-T0SHd2g@mail.gmail.com>
 <aurAxRpCwzeyXeVj@gondor.apana.org.au>
 <CAHk-=wgPvbYRcKpQ8WTH-EYZRgMG0KSH+cZxY5-Hyf+X7JjWsw@mail.gmail.com>
 <aurJZ81qnbiHH_P1@gondor.apana.org.au>
 <ausS3LQNkdc6lBy3@milan>
 <auxDm_YO4oACA_d2@gondor.apana.org.au>
 <CAHk-=whXvVO6a5AreZu3LPBj_wjpzUanwhvu8WqWP2q7g5S7Vw@mail.gmail.com>
 <auy-7TvVzJ-VCrG4@milan>
 <avcKfEvln8_2a7fJ@gondor.apana.org.au>
 <CAHk-=wg9baZ9EDhZr7ONxjuO65+vvWFo5E2hgxt+3rYo1vnhyA@mail.gmail.com>
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
In-Reply-To: <CAHk-=wg9baZ9EDhZr7ONxjuO65+vvWFo5E2hgxt+3rYo1vnhyA@mail.gmail.com>

On Fri, Nov 13, 2026 at 09:47:13AM -0800, Linus Torvalds wrote:
> On Fri, 13 Nov 2026 at 05:03, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > OK let's try this patch:
> 
> I don't think this is wrong, but I do wonder if we should at least
> have *some* way to detect these cases and report them.
> 
> Also, it turns out that in __get_vm_area_node(), we have
> 
>         BUG_ON(in_nmi() || in_hardirq());
> 
> so this call sequence already has a *limited* test for this all. It's
> just that it explicitly allows softirqs, probably because it used that
> bogus BUG_ON() pattern, so it wasn't a debug aid, it was a "the
> machine is dead"
> 
> I wish people would stop using BUG_ON() and friends. They are *only*
> valid for things where "something bad happened, I can't recover".
> 
> That __get_vm_area_node() is not such a case. That function has a
> perfectly well-defined "what to do in case of errors". It already does
> it for lots of other cases: just return NULL.
> 
> So using BUG_ON() is wrong, wrong, WRONG. Commit 04aa71da5f35
> ("mm/vmalloc: do not trigger BUG() on BH disabled context") was simply
> not the correct thing to do.
> 
> The correct thing to do was to replace the buggy sh*t-for-brains
> BUG_ON() with the right sequence:
> 
> -       BUG_ON(in_interrupt());
> +       if (WARN_ON_ONCE(in_interrupt())
> +               return NULL;
> 
I agree with this. The vmalloc() used to BUG_ON() if in_interrupt().
The easiest is to restore the old context restriction and replace
BUG_ON() with WARN_ON_ONCE() followed by returning NULL.

That would not stop machine but would show invalid callers.
If there are no objections i can send a patch.

--
Uladzislau Rezki
