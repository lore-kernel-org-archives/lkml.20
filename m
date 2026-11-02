Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650320;
	b=at1Dbg9ajK/DfHTiiu5Zffuw9yuNbVMII3el8/hu+EQND5xzVzeOn9wERMAWvhy/H394
	 cBHu9R49wu4okaTywrdJL9hfFhmIR/MU+8j1LAD+ug4ka+pz4LnxbMYKnLluTQqHi+NmO
	 Jj0z6Rstjf8nS4/waRWwH7bxQf/RqDrxwcbMMVRKcGh+UFpznsNkw59bKCTrkS+3UmWt5
	 8hG26feLmdTh29xO/9oF5ffxhD934q1oIJrXEzEMQAd+GBKEVa0nPEX4FUa15igdWRepn
	 9bH7b5zsGLuI+VVwJFsu4GBvBvF6bFywu3S7w/ShA/CNoQW7K24LGCR1ivJYQBc5xkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0RcgJVqgbNsSUdU++7Y0dOlItgAQ3e32UH6pOxcRyus=;
	b=h209GCOPYUmXgCU+iu5m8wkEQOIUFeW39Q32iKYigfdhd2rFSHcxxJPxcIQokr2kan7N
	 dhvJnRWjD+hkx7XsMW0lyuh+FImCtmuMC9CW6r8Ks4jPPQ8MOMyfTI/uxq28YT9KS91X+
	 UZfeqdi00ZQYDEGPO6ZXZxNvmwSxVO0PCUs1caD6r5ItjZfnLmm/Fw2aYaL5kqRnA/Kug
	 AyTskUWRCMLfnFjPrFHZFjQp8Hv5Jhgo+ZUrpNa2WDN70+VUTQZv2DjBCL2iCCzGAb6WI
	 lmvryYqVvNbbQE9kAJB+OH4leSOi1fl5RvQyPxMTnV+oUEnoAP+9P8nYjMa0nORlbYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="LGzSzA/l";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A10606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LGzSzA/l
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so4247534a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793650317; x=1794255117; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RcgJVqgbNsSUdU++7Y0dOlItgAQ3e32UH6pOxcRyus=;
        b=LGzSzA/ltY/UTa3g6U5xiCGDc2SyJ85XI4jozFt/fYyblTUoGH/F96p2dR1ze7UVmG
         62a6PzH3n+askuDw583xSdAXdto5CvH0rmY8cJL6ZGn9JXFg6ojRyP1GUuLs3nmVb36/
         49qcDPdX6CDvVrhAYxMe4EhQEU6eFeBGSuDAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650317; x=1794255117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0RcgJVqgbNsSUdU++7Y0dOlItgAQ3e32UH6pOxcRyus=;
        b=DgVeOcE7GL2C3jWVfp7SufuL5HUYI+kQCvm3VoyhRW1eHJ/PVC71s8UAGUP6sdz9Qi
         UpadhKlJKYhkrxFAk+ZggLV0hYuO2rLvHGeBtk4D0CLb8u+Nx4lw20pVKVqudvM0gQaD
         gNz0TdtSxx9w2mpOxK1iZ3iZbumEcqpb7L8DfcAP1AkXBDVxlannNRdCf5qsYF2cwM3/
         z2fEzlLf3+K8RAoYWqfHt+C/gdrHgaaNEsyjPveO0AsSBwD7S7bWZ6YyANPQs/lsu8lB
         YhApeoK9JZGNaK65EVgskjW645qOVbFs5gBI2wvehWp4llTE4XY3fkXw6y2h2iVeGm7d
         OLXg==
X-Forwarded-Encrypted: i=1; AKwUvBynuVE5zkaHiN+QtH2Rw38JrHKtuZNM14oMe+mD8KzZunpmhAnpbH6MQ+GK0FLGucagK37Dyqvuq3gW47I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lztumNbj/lIGuNiX9TL4RczTnkyXODOZzOuS/jLbnk1QyxHZx
	hGomQH2iu/5P0Z0eb2wT5bPMLXx4Y6u18kpCdXNrVfmc4U12SEji+Bxldv3G9ZY4FUwmH+LRhDN
	L/uvz+y+t4g==
X-Gm-Gg: AYBFou1z5TThWPNwbpo2h0O0hD2Lgx/9R8ppA8NH+zX6TI5vup+J6a15GQJ4sDriVsG
	C2XyzKKErKVvKGqkcbMcUJ63j6oFgGM2KWlv5PAdVFqG1f9EwLahQXvzinGN/OPzTLdQ4RI6qVq
	Tq9MEAUieHP+X30572rAfNUdlY5fGbHXtHiw3NOH7A8HGsdR7w4bd3uGrAK/YYnWLRZoHT4VHFM
	jiN41xrITs1zLZtwVRvafY1D9Jdat92nPFHexyQXaleno/EnAzDfH40aFqysC5i8EECrrWOvq9s
	gE1xkyA7nMY/MS1M9zXX9EMxfUp0NlLVFudkeOIsGJJEOzjBtkNbv8obH4Ria/a0IWqiHHzwZ/F
	Q7ZRKOCoo71bJ6Xg8cd6bNo0y2vanGhigYR0YQUuexc/yfmw7TnZwG1eIbQFRKs0gUxgqKiYwzY
	iRIH7YnFxCrYulSf3In1Y5ep8dAL4H7nCMK38E/u2ZCj+FcOjDpM/SmGAFHn6uDDHMOzLgXzOCu
	MSNZZvjqgPkZoVA5m5C7V3ioLTpz8lgfnlPOgPAVlQhqrvXIyRD983ftib+7Uzm5V/GkoxPTMr4
	SmsnA8mSNhgS7/H97jGXW/BEuc1eLE7qBP1tdv5x9YE8MFUmzLVCphrllNI9xzmIaKnxrws8zbZ
	BJg==
X-Received: by 2002:a17:907:9603:b0:c46:7fa4:922b with SMTP id a640c23a62f3a-c4ca7a9ebd0mr910167666b.33.1793650317378;
        Mon, 02 Nov 2026 12:11:57 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3b5a3sm20499866b.51.2026.11.02.12.11.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:11:56 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c468bd799ecso427429266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:11:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBymKJISB8c8RsKJgTAIpr6EMDgsvAVsX69KIjctqDAC4Z6eKfBg30qqKEBPR/20eUNEH6ZzHkfVi9vFnCA=@vger.kernel.org
X-Received: by 2002:a17:907:6092:b0:c46:7fa4:9224 with SMTP id
 a640c23a62f3a-c4ca7a42014mr847532666b.8.1793650316483; Mon, 02 Nov 2026
 12:11:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
 <86f2f603-c1a7-4715-ad43-ac9c90f6a837@citrix.com>
In-Reply-To: <86f2f603-c1a7-4715-ad43-ac9c90f6a837@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 12:11:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wibsAfLX4H0pcxDrh3JZoKgFfdkZfLfQbKYUqMyLtKKvw@mail.gmail.com>
X-Gm-Features: AclHuK-O_PpDvelbVnnFVPJ5B2qswxBRCgv27xvFqM-TqSK8PWwNWy-2a0ehb7U
Message-ID: <CAHk-=wibsAfLX4H0pcxDrh3JZoKgFfdkZfLfQbKYUqMyLtKKvw@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	jpoimboe@kernel.org, justinstitt@google.com, kernel-team@meta.com, 
	leitao@debian.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	luto@kernel.org, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, pawan.kumar.gupta@linux.intel.com, 
	peterz@infradead.org, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 12:06, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> This doesn't buy you anything, except a larger code footprint and more
> branch predictor pressure.

Very possible. At some point in history, computed branches were
cheaper than table lookups, but that may simply not be true any more.

               Linus
