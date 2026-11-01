Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576683;
	b=rQXkHv59Xich+aJ3VurX8BX5CfiJh3vCDzuTNMx3wccYEq/p7ctyGQVHSKGYnzDuxxzT
	 Kj4sbVs3Mi5YRBgQQdkIB/JwoRs89gKaVejPNRKAehMPIfbE+Nze3JlrQtXL4f7f3qSGj
	 /nYvHbf7lvpSoDK1U3l5J24IAG7/x+FgrLG1ZbsizjFmLvIU+m/6ZSgGGkovI7EPZLKsX
	 eiuV5W0r3PbAqEzOJsloIXrzY+T90COTBDCHPKEoDMLTNx/6uIW5ikC8sXlac4phnUx5z
	 D+f91HkXAbvJeg3XvXWqZmueMO6EW/TzFc8hcynSGXWE53oW7wfHL2rY6UMORrvhX8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cmCKtuKWGdM8HNfbRfJhwyASQenO/GwuxXairf/0/u0=;
	b=TJd7qHc3VhOV3h2G0yxuiywg/k/fXhPLOgx/BVH6AS8CmeDl1YQWLvUuv8Gkf7ACqMO/
	 lSt5TGb3ZnZCfFl+g6hhReRVE82rf/gf8WlJAKCBTkARMqD0uBQRVJzQBdMPqVkhrlO28
	 mE+6jIlJhc6HfeC7EW4wgj4wa/pLlGXv7vIaMyjeYXPKN/ng/UJ1vGiUvFaUcUVuB9sgF
	 87qiUchV3RlMOB17KSijlbsVTmjoeM71PdX8VRsYXFOtqfJ8F0F4cLaTaKZYtpyheM5pi
	 T/Wg3DCbAng9Td9AnIhnwj9xH1J8KJMohS8ktf52kXjvJ/62n/SrWvh20mTG6Bm7wwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EInoisVf;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F72606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F72606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EInoisVf
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso24884905e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793576682; x=1794181482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmCKtuKWGdM8HNfbRfJhwyASQenO/GwuxXairf/0/u0=;
        b=EInoisVfS8QOSy4pIAtt5rCQ5V+jvEcqXQAGTVtQcnJDFoJhs87zb4rjsgSCJaR1VP
         1StuJCPt/GYzXCyAZlBH4EPaUAMnrJSR9UdprLHYTCyy9tP5qTumL9dCtv/zcrl1MXGz
         IauFjc7OQhgEH5bK/zDdQJnJljB6jRfCp1SGqBKovHGBvuUtu8/PFwJ0jeqIdvA/CxM4
         dq3kvtbwTKctdLaFUxwLDs/lAc8tucD2AoLsyP8p4fVQl2im4Q3Ux2wRTvEAPO0BS1pG
         uiNgrIVlxNGWE8x9DnPN9U95Uac+CLg6O39tY82UA8i6yBHhA9aFqEKSzDwdnzREW4cd
         sBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576682; x=1794181482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cmCKtuKWGdM8HNfbRfJhwyASQenO/GwuxXairf/0/u0=;
        b=M2kvg5GdcoSdlUgW+m/jSCo1WmahC1bAfxlVxh3QE/CQ4AfcGTzFMH/ekxkWCNNjub
         jy8km2um+q6aFg/IVrzc2bAewNxPHr2EDdI7rFR6cq7/YeF9NVK/x97HKJdBUZEkXIEn
         XJuilcAR57OG2mxDyBItnY32J3wpCS/Y8XDtS+cyXPGm3cc3UKlK+Lp3katgoEYjhYb7
         M+HZI5VnLzTU2AKDu7aMsoRC01kT6z1iHZ9zJrekDjM85uTgu8UyDXek+p/XZvhh7xxT
         IyFR47QnxMowRZl42cPWpy9CvU5YJMW7+4v1bS35SGdoG9VqMW1fMjKt5YvFcIA2mqqg
         53Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzviCggPJ+QEzJP0m7/yGfk0CAM0SlgTbxYOK5oAqEXzz9J5iuNzrFldQ9cVdPt7YsVReKnG7QZezyIF90=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aZtT52kn2DVcP+M/9WEKEO6BuasBIE3HTmT9F+GHZ1wnGg1Fv
	TBACybGh3W5Zr03rubIbgg4i6lXTOOR666wZPRIoDMzjZaVYBDAAN3nO
X-Gm-Gg: AYBFou1W2vxQ1zTwP4lN7lqwIs/PYGTksdVSvISr7sAWPcvDREukt1IEy//hSkaOdaQ
	CbjMo8lAU0+XW2qcRWmd5gEr1Y//ZzUnQ26+CZp/zhk5RecLTbVH9EEYsH7/PgqbSeKtFvKwVK8
	2YDKLhWKPLwrPQ+GatHdBtpcmJGaNU9bW0M4rD9kD/DHQrCBsB/uDz+lAjRRolxnByEXBUq5j/L
	hzIR+NRMLHSU8J+x9AIamSRMcKJjkuJc2IJAEWZeL0yhC9IHCVlIAPyttMfN60V/skuwCEwdAlN
	4j6s/V8fBtDUwOkhMH7CWJt26Tk3aDYKqysmjQBfaoHqx0In5CXb5ORB68htVCraLahzy5Ejew0
	L9uau2QpppbUR3psLFX8uz3hxomLgPobm5qWWOwBjAERMSf4CsoKAfYJXlCcrW+YLEPcunlDogq
	TWteOmMXOzG2xHYFooVYlTSiwlaSHENwRv3vadVW7p8cdRQ/hyPpRlTGLuADLeCSeRbP1Wm945v
	RF8AXspSE411Karqnz/ed9bSEXX8r3o8jDRea1TJ2C4e12yol/kB53eO+fk7KBTXIHdS1309yVs
	F00M/Qt/hniMytEDVbsyL0lrsgz7lPsB2F917DxJKrP41JeoQTSg1Gff1Pi6I6+MRJts2X7fUcJ
	cl/tFcGqV8Bugqnw1dmCY
X-Received: by 2002:a05:6000:25ee:b0:48e:84b:e83e with SMTP id ffacd0b85a97d-48e6e2bce33mr17685080f8f.1.1793576681677;
        Sun, 01 Nov 2026 15:44:41 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm16553351f8f.57.2026.11.01.15.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:44:41 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9c21c5f5-355e-4520-b48e-acd355c7fc6d@gmail.com>
Date: Sun, 1 Nov 2026 23:44:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Speed up KConfig - fix hashtable confusion
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/26 20:08, Linus Torvalds wrote:
> So the Kconfig 'expr_lookup()' function is criminally slow and takes
> over 10% of the time of "make oldconfig".

My own pet peeve is the occasional slowdowns in menuconfig search...
> 
> The reason is that it's called just a lot, but it *really* doesn't
> help that the scripting versions of the hashtable functions has not
> understood the subtler issues of the hashing code that it took from
> the kernel side, and in the process got things very very wrong.
> 
> The "hash_32()" function is a perfectly fine hashing function - there
> are better ones around, but it's fast and "good enough". But when you
> use it, you need to understand that it puts the significant bits in
> the *high* bits of the result.
> 
> The kernel uses a model where you give it the number of bits you want,
> and it will pick out those high bits, which makes it all work right.
> 
> But the simplified hashtable code for the host code didn't use those
> high bits of the key. It just did
> 
>     (key) % HASH_SIZE(table)
> 
> to pick the hash table entry, and that's basically pessimal. When
> hashing an address that typically has the low bits clear, the low bits
> of "hash_32()" will *also* be clear. So the hash table ended up being
> mostly empty! So even though the hash table was sized appropriately,
> it wasn't being very efficient. And while making the hash table larger
> mostly hides the problem, it's the wrong solution, because the cache
> footprint gets worse.
> 
> Teach "hash_head()" to use the high bits of the key. Because the users
> don't pass in the number of bits they want, this is pretty hacky:
> 
>     #define HASH_KEY(key,size) \
>         (unsigned int)((unsigned int)(key)/(0x100000000ull/(size)))
> 
> but at least this improves on things.

It would be a bigger change but IMO the host-side implementation should
not differ much from the kernel's -- like the rest of the data
structures in scripts/include/. In other words I'd prefer to revert some
of the "simplifications" that caused this and adjust the callers
accordingly.

Nathan or Nicolas, do you feel differently? This is also used by some
other tooling outside Kconfig. If not then I'll send out my version.

> 
> I also stopped the expr_lookup() key generation from using XOR of two
> pointers, which I suspect just ended up clearing most of the shared
> bits. I doubt that makes a difference, but XOR of thigns that may have
> shared bits really isn't great.
> 
> The cost of 'expr_lookup()' drops by a about factor of four on my
> machine, and it's no longer the hottest function in all of 'make
> oldconfig'.
> 
> No, "make oldconfig" still isn't the fastest thing around, but at
> least this removes on particularly stupid reason for it being slower
> than it needs to be.
> 
> Somebody needs to double-check this. I don't love my HASH_KEY() macro,
> but it should work for power-of-2 sizes. And as far as I can tell, all
> the hash tables are powers of two.
> 
> Comments?

Thanks for diagnosing this, Linus

- Julian Braha

