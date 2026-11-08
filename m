Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115563;
	b=J1uXTJ0c3fQR6y4+WY8SQzoOJhaOF2dAzTiyPZIFMnK/NdBFwZ5flTzk4DTRztc3HgKx
	 HAOhlmClVFxfwESv7MKCa8podb/TAa+mS6zMt53I7uz24ywqrbee2C39TDb7hMBWeRRaI
	 4XaZal7qITFxQZ8E0T/yOJI0mdTTj/zsKO5puzheO/08i8SrKkvJcwDYwVuRhTqUj+pUU
	 R0wclOeaP7rhlpKCBU5WLbGyJyDkpLCRRix8ELEveIuXRXZ8WgawyH07krxHauPDF6Lw/
	 9+wZdaIe3NJEasHLXvKPNiht1MzdWK3JaYixNeqFnJ6fNuFzdxQsAwZ1Xxkw7oGpiEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=yYYx8CYb0Oifw4OS22N4OnxYLzgiXng9euC639iE3pM=;
	b=gQTZhoEn+JRFnGYARrKl9L+e9Mlu07a+6FAyJPIVF6Fb84b9kdncmsyzu8dPh3MWsbvw
	 WsMz9nSwWJp4myx7Z+RG5msN+ltLb4uxdtGDfOgraR1QNzGsQXgbQe034BjOGJWz38Yn0
	 M10vTHfR5eL4jy9FvzZUfTHsWU70y/tBTNsALDtH3Fl1CTubWqeGuBqqqCZ+VVE8YHGE/
	 kDj1bqxVNr7W/eSiiwElWITjTuq5OCFYpWOPeD1+MxT3B/HIY7mQtI5AtxuPrBSQFMhtn
	 ECTJn00p74K92mKRyfIL8y0wjG9zV+f6Dw9hQiPgaa6tlGMeDn0SyhU6iLuxOnVvo1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=R2cpDYMv;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280D606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1280D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=R2cpDYMv
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so106944b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794115562; x=1794720362; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYYx8CYb0Oifw4OS22N4OnxYLzgiXng9euC639iE3pM=;
        b=R2cpDYMvaElTwaGHkw9bAivNBI0bDal4qZ/vbhEXMRB5BjiKWCKqCQOuzHwVrVqzuI
         9VWHroSS1H+Nyo39smpN4/UQIlVL72MMAelgVucT36FiracBCgbjNH0spI9pX2Eu/z1I
         MfMdzECwkDQjhzM8TycxgS7wJHBuxWOSANuPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115562; x=1794720362;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yYYx8CYb0Oifw4OS22N4OnxYLzgiXng9euC639iE3pM=;
        b=2mKCdiazhNXhiw/KsXQIAk89efQLgH2l/nbbo3LiUUHpFP0IG+6iPhmAV9MXCxP2qg
         8Q7cwd/ijUaj/Oyg/lrO7ghNaFFdDl5HJw8dBTnou7Vq4R++EoVfE8npmHlfILkN839R
         y+a9AGaQBeaEK+eulvXSj1hPfdBx6rLM8Emrr9cpJVeCd7WaIrCjGFabaqUfIQL1Iy33
         IiWuj8FFW4ykESlBIA20y4b77TpNLwgDh4zBdh2TV4ldNCG6C3q8JW80lWZAFe5zM8xS
         DFhQDVJZQw4ObezeZl8ZyK5y9xeTlJRDJ4svm4RzEcWtENfjsLT7m2Li9qRiIWJ7dwqW
         GPJw==
X-Forwarded-Encrypted: i=1; AL+hErG6xnJbrt0V0x/OL7p9g1cmT0CZfOWLeyjd35vuDO1QC5g8B0jusRmqOlu7l8UqWmzWbxmIwHekXyGCDNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JirClFPmzX23w2Ajt461z0y0TrhMHNnKA5UgyrxFGSmNEcik1
	nRTOIB7kIMuaKKtzyPnX4VZkQwj8qI4/pPZ8iNTQBStE6MznGQvmMIR4T/SCLnbE5eA=
X-Gm-Gg: AYBFou2IRnzHkcuwZ9PJ9l4s9UM3NzG16RmZGwDghTBJa2CzFE7vSOeKRWEV99Zqe5h
	BmLuA6w0hPhHep7ScqieU9Z//Z8ijjWRIxCD2UgFXcNe0YV04njeU27Pe2g3EfqY39S0NN7jWTt
	63iT0LKMULHPtQoqv/CMuttNffNfx0r8YL9CMgdYBQDyBSn9dynWlG+qQ7hOwskjKxO6bBUeAn5
	1y2HBoCsSb/L0xZcjK7CW5m97Bd3FlmyAPxA+8l8emokRCu0j4yIwgXeAE3zqNtU62iAmYz9YE0
	CSr0/5RHR44bd+T/csbCmMd7Xb1KLKOrOhGkh2c54MnQ98RG8wANDtOMb9u9AXYLpJsH1hZjaK7
	e+oGcYdxT5ZZzCZslyDtYYgmlmmRZcmlpiuLdqFDmOZ2qa0fDpW084rtolI8FIO+s/PAYWH2scw
	hKSknNGaf00kQld7s7u+hoGR9Vc1v/q63TlRbO80JnoZ+qYTPxhweohA9HYO3c3AFtCuc2DfPO/
	DW/luQvXpPNBF5UcYreMAFBLZHpC4sKWV5ObRhwUn1Ho7Ak4JuViM08lBo3+xgF5ViKysNKo7XV
	RanYrF9/UA/vZFEhaBgbTWqhoaMs9rFUmbgXKB8dRshx0R9Qk+2lFy9QnWQWpAB7D2NAoiz1wmJ
	SZGE2ILZToBM/B/XCbg8802CsImJYaq+8CoIIRZkRLaow387YMfl/kb8xg2l9SO1LIJWu/hyARU
	Zt0coVkiydDIqPPScVphFk9X54kNAGoFgsv+4wckCh/CkgJm2H1ON1
X-Received: by 2002:a05:6a00:3313:b0:890:a995:1f61 with SMTP id d2e1a72fcca58-8b66ef0603fmr598502b3a.15.1794115562390;
        Sat, 07 Nov 2026 21:26:02 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64a2e7b94sm269484b3a.57.2026.11.07.21.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:26:00 -0800 (PST)
Date: Sat, 7 Nov 2026 21:25:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jeff Moyer <jmoyer@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	stable@vger.kernel.org
Subject: [PATCH] x86/mm/pat: Don't leak reservations at the physical address
 limit
Message-ID: <avAH5XMCbIWvdD8R@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

memtype_reserve() and memtype_free() pass their physical addresses
through sanitize_phys(). Both take an exclusive end address, but
sanitize_phys() expects an inclusive one.

So this has the effect that for a range that ends exactly at the top of
the physical address space, the mask turns the end into 0.

As a result the ISA range check succeeds and memtype_free() returns 0
without removing the reservation. A new reservation that overlaps
existing entries takes on their memory type, so the stale entry goes on
choosing the cache mode for that range.

Let's fix this by doing some annoying off by one twiddling.

Fixes: aeef8b5089b7 ("x86/pat: Pass valid address to sanitize_phys()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/x86/mm/pat/memtype.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index cf94fb561310..007d833b4c00 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -613,7 +613,7 @@ int memtype_free(u64 start, u64 end)
 		return 0;
 
 	start = sanitize_phys(start);
-	end = sanitize_phys(end);
+	end = sanitize_phys(end - 1) + 1;
 
 	/* Low ISA region is always mapped WB. No need to track */
 	if (x86_platform.is_untracked_pat_range(start, end))

base-commit: 5cdc3746fa163fb4e8d05fa3cabf46bc6aa7df75
