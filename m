Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2533A6B6C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943116; cv=none; b=t4A/rpKpIclxGmWWNj4XxuURZ7TjK2cWNhbAqehHdS8Z8PuCLgC9gZcxYN+vO0PJ0vfVYM+Pz9zvK6mBeYmyozbySPyiwx34dP5kxhN6fgJoqIWNqx/arapksDeoysPmpmPI0NbskiDVXhTuHMfBv7VpJptoL27WqObT/gmmtSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943116; c=relaxed/simple;
	bh=Eg9uaJLU7HEMsIz04jc6kIW4At7P5dqbdT71Xo9LScE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E9ZbJye5AHeFm7EmYGM9P4ypQbXpHe4eISdstCAnbutPBLQUCaTXpmpYO0/mBh+O5O+x6F3rp2FnXtHe6q8IW2UH4cn34c524OOLM3UhCeGFGIycBgxEOIgCmkWMKI5YuwFbG14IHQSuLy1moOmjL9swH73NSfM24MV7F9DK97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcU5SVdi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcU5SVdi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so3831275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788943113; x=1789547913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhIKk2TEmYzBuTS8CzFFK4ZoaLgPdXfCnSl12U5DxsY=;
        b=gcU5SVdiQxG0LCgbtbquefaAfKrxN5yOSfebtYlxTGOFu08dpcpRkSy5G2B9ApEerW
         7cb+Iuag2D18plEb6vJIPrpEjYnYqkeDSqtfHvdWq2+gn8IntSGUn3yx82SalFdMsgQ9
         xkgVlsiNDniGtqvB0pM3lCP+4OTopTcs/zWXLS4u7lunJnb3n4tOiLBYc4C1gRvIyyCT
         NZhJYh4mmm+C2uni3AOGCldJUyp6LWOaS9n6BYp1X/3eS0H+i5WfoMvqrkR348fOs605
         oeMzCPzdWJS22r75B3tHpPVHskTSMRRcoYu0c4r+tKxSMD6RxJpmOPxezh9Hs9eE+dx6
         wxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788943113; x=1789547913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhIKk2TEmYzBuTS8CzFFK4ZoaLgPdXfCnSl12U5DxsY=;
        b=XNjrYZiCJlSutizgWBO6m0HCfvjaKBN6dUycwfEz7VFlpgxLB4y5zxellAT+HJnei7
         KF6tQwS37kJzxqbWHiSvY5EzCMOX9RkVVKkaC4xdZPWZA7gJ6LDu+fOGYPmUGF8V5MOc
         3eEJAWruGEzIvGCAEjXx1PxZqpoXj0uJWEdnTf3Wl3CsDfoQV+dHdcDwPCaoLo28d2cd
         VnSYD0KzPhLQT73msskSGynZ8CAHm9N9EIJKeKz4ZvS0fPObNm1BpyxtpqaoohxjhB4Y
         DQJf3u68h+H8NVjkVNhQ/E0KH2AZeOZI8UNCjfjLY7VaAKNrqHu6Z2ZFGBsncmNpQO/e
         KiUw==
X-Forwarded-Encrypted: i=1; AKwUvByIgQ9Xls2E2JGAZVDskDv59phodQgZTmxI6CffR7iw2Kn4/YzIVFWCfhLpo3MPKhpY1/E90IVldyYfU/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kqqgMVOJUv32t66wwQoWH4d31okHAcChQpwjianaXBuwBF1tMx
	eA5xMjYuYz+WJzSZFZaBkcdRinzSCwvxPo1dXcTEgyfsRROtM0ieK+BD
X-Gm-Gg: AYBFou3Ot9C6W5KcavVygZXnGtzdOF3XeEx474BD2vTlfjVkHfvcmRoCQuFATBn6njQ
	RiXdQ69FRQsNHEw575eRPG/WcipmA514K9oGgec8zWmJTwh6uEh60u6OZ7Hk7tm7RmdN4JAEWIX
	NXqSTjxgSE7Tu6608JigShH7TCFArhYOBbral76z5oAoELAuQkKWoalv9IVScnqfj5wJCfYlncx
	/si6qM2guXco6/KPiNyhGT4IMq/B32MdxAxMd+fwVhkj7AVrvNR33DOx8zJZ0hGt6qXpvnB8Wre
	db3gXRQ+SmcPDKcAUNH8VVOEEHT0uPijnBs3BBuFiNjV2upJPzuovMvJnT/eaLuHUdSmuaJsexB
	qXraDe271r0Wyt5TVbWW3OBQQ7IogEGYHR9tuke0UfVn4x4ta1hPEu/NMYOfaBpam2xYPIxbMX4
	1oMdHCgxvLsezcJy9KIiCv3sxWgeHAzVqmDFSBB/8fW1jWTxjUbW48lUCcq8W14mCswLlpzefdl
	M3HieEUcYPBzz6aVS2zsjiUuKxCieQDXV4c
X-Received: by 2002:a05:600c:3146:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49d1f32335amr77527365e9.8.1788943112674;
        Wed, 09 Sep 2026 01:38:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d08144037sm370597035e9.7.2026.09.09.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:38:32 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:38:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira
 <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260909093831.095b89cb@pumpkin>
In-Reply-To: <e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
	<20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
	<E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
	<d1b9ff734b918889eaf8885d64141bc3@igalia.com>
	<20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
	<e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Sep 2026 16:16:51 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2026-09-08 12:32, Borislav Petkov wrote:
> > On Tue, Sep 08, 2026 at 03:04:53PM -0300, Mauricio Faria de Oliveira wrote:  
> >> Boris, perhaps the approach here could be changed to add an actual
> >> memcmp()-like inline implementation (e.g., as provided in a previous
> >> revision, without return value differences), or continue with the
> >> memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?  
> > 
> > Nah, new functionality is not needed. We can add it later when it is really needed.
> >   
> 
> I personally think it would be a good reason to explicitly rename it memeq(),
> after all it indicates what it actually *does*.
> 
> 	bool memeq(const void *m1, const void *m2, size_t n);
> 
> Note, however, that the sense of the return value is opposite -- true means
> equal, so !memcmp(...) needs to be replaced with memeq(...) and vice versa.
> 
> The other issue is when gcc/clang wants to call memcmp() out of line. Although
> a theoretical concern, there really isn't any reason not to DTRT there since
> there is only one instance in the code, ever.
> 
> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
> 
> int memcmp(const void *s1, const void *s2, size_t len)
> {
> 	int rv;
> 
> 	asm volatile("xor %0,%0 ; "
> 		     "test %3, %3 ; "	/* Handle len == 0 correctly */

That comment doesn't really say what the instruction is for.
The XOR sets Z and clears C (I just checked) so it isn't needed
in order to get the correct flags.

> 		     "repe cmpsb ; "}g
> 		     "setz %b0 ; "
> 		     "sbb $0, %0"

That pair is just wrong.
Only one of C or Z can be set, so I think this is ok:
			"seta %b0 ; "	/* C == 0 && Z == 0 */
			"sbb $0, %0"

> 		: "=&r" (rv), "+D" (s1), "+S" (s2), "+c" (len)
> 		: : "cc", "memory");
> 
> 	return rv;
> }
> 
> On 64 bits it compiles to:
> 
> 0000000000000000 <memcmp>:
>    0:   48 89 d1                mov    %rdx,%rcx
>    3:   31 d2                   xor    %edx,%edx
>    5:   31 c0                   xor    %eax,%eax
>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
>    9:   0f 97 c2                seta   %dl
>    c:   0f 92 c0                setb   %al
>    f:   29 d0                   sub    %edx,%eax

That isn't the object code from the source ...

David
