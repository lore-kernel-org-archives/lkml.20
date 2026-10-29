Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271086;
	b=o13WCOscEnJgc07n8Ce+W5w/Y90dsVuwM2fCa4hzYaks3WbRLBVHkoe13d7bxC9SVATU
	 UnZND1W63qWowq3DNJ5uBSCycUbVVxgb4xVnLudvXhAbl/7Sqqd9IUHgHq0+wv9tpZCnv
	 2mRvNic4KGzTFweOHXCQtjZqXuZJpTCnx3rNC8mNx++M/8xeeoXhkrHjXM85sKylp8kkf
	 /ktdsz3k7sPNuNZhxaLowU2PH/EBiImzjERrC7OPTO0zbyjoWKvK/3XTAEtr+B17Ak9ZD
	 SRlSwK/ZZEQo22jR+bKdTtxO1VOAGDPCqQD38QT5MX0sCA4qAiJabV8Sijxd3JZYiqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4VgG2WTdokqXpy4LeyMCzA5u1nfD+A7Lk8B1mzkpN/Y=;
	b=tyyowk7GIIVDs6FAEw/rHtYn6pKSr3seWiF4NOxHHALf0r/i0UwAwB3lVnfc9vzcIwfW
	 IcuOgKqAeOlCaTwuoAMH7/FUKwF0BTVYpupZPoXKU65kTJgydqhVxVfXzaD8Ao5Mad1mK
	 R2jJkYln42GPxF3OGg0MGP/6+nkgr99sZVAz9c1TI6gBXYx0bdbKDBXy+/wtsIEq18Gir
	 ZjXrgbiRdLMirR1PW5L6es6atNn4HvOwgm+TQIQlaSeg0qcOj1m8O48izLL0bTmAIO74q
	 PSJcmLAr9M7R5wbRW3C9INRa9bK6vYyEz+XzXdceE7eLEmdW1I9/9K9x884/Hb4uHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+b42myD;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12487606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12487606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V+b42myD
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so16585395e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271084; x=1793875884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4VgG2WTdokqXpy4LeyMCzA5u1nfD+A7Lk8B1mzkpN/Y=;
        b=V+b42myD74M+kaVGBtRKIol68JGBCU9w/Wz/+vQFHz/+VWO6e8tZ5pBk/Ce2rNv2wY
         mHIcHsWO3OjruRYmw2vWx9ZVKoRBXdh07C8BpsfpBbYP8iw95oWpX+RzSd1/avLqtsA/
         /dpMcGkzoxYr8/bKt/eNqRmC0nXo91NDQEYFZN4hPkXKIZZLuXNdLep310bZ6gSGimKh
         UEEykUmcm4PgnLKuHe697uV8mgBWxYXYho4bf/dFUUc+ClLZjTk4z7Djw3KxlYU4TN5+
         GlGs3xxe0ndFUbwZ9TkfrsRFkPewYbn7xzC+PPh6d6QCqcEk07l8NzCJ068ajnd8eSbP
         mwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271084; x=1793875884;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VgG2WTdokqXpy4LeyMCzA5u1nfD+A7Lk8B1mzkpN/Y=;
        b=TCdfASgplrQ60YXLIlWCTiN6HUQqbknPt04HgVrGniOsdeieKxL+M43SXZZ7CrhMOM
         FInPQW5sFg0UMJXaM4WSKyJG/fNxIGp3dIAYsSpcoKaX8AHEU/AxFq6GhKw1DPFl4NmY
         HC3p3rOzxjkvCM90HXSM3ELbxyMBWYJZojmnH0IN+vX1aWr2ug05cpy790rHKSQMfCU2
         XconioazzvwkRyDH2yckSKpzsmcDYM3wNQNqzp6lG/Mh/u07beqpGsoCA1zY9CParhN+
         km/k5Hba7yjnNtPc9rETabk798JZeN8VkfeFsmD6BYpwWOIgrhxbP/u53ekaa1YbhqrD
         USVw==
X-Forwarded-Encrypted: i=1; AKwUvBy61JFTjIymhKK2SdX2maTs++1PcTWoAO1SHq/eMMOfWWrofKVKjF+6O89CVlpJFiT7K43OdirX5nOtOvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDarc4jn3ZFjkBnoap2ST5H1Nw29WS/t6NI+yvd/fJ0N97sCb5
	acpttBs9itTnNts5h2JPlBtJYzqjxXyABbI9jFGLtMzWmPlpPxGnZ9Xb
X-Gm-Gg: AYBFou023Zqha2LslCauqaXTlejiMY5iWSIX0S3MIu1wUbicKMciTw1r/9AZ5W/7Zv8
	0nbBxqXPl1nKnPIdUH0NZbjqDe9oXwLCG9blk4VnOk1O9eoampSBzVcW0hu0U0bT4oUP+06gq0W
	plclhLn9Hr36yDPpI9tW2m6WpePkxz4Gu6Kx3k3/FFRdVrfpH6TOy/O974UN+xT3RzmEe7dlz7h
	/f9c8jvcUsqB3oCHU6viRZlO/XaivE+FmeNgRJwXnX2DoeRzzpaCAb6hrotrMk2TdA9hiyDxl/3
	07IkEFmIG8qrJxFdBXWSdtC/U0j39iAEj+fu0Aq1wLbmkO5wneCEVAzt7oAjR7yFcqwKdYfjVyS
	L8J3spgqW7DdSYKbw0HgPbvRwrc26K7mVKw2GrOanIqS4vjQM0h8V6aLlq1Jh9GOAOo3s2yhls9
	UmbCKVIjxM8/+AEup8EaEDqYx8NnI6FI9JGoJbmRh5Rjn0Co2DGgyf0s/FqxwkDUfqUtPzyQukp
	qc+V/pOCVxV9Vu66bY9W8vtS3Gm0oym1wwQDaXnZ7ljDf8gX++wEadV6YBu1BZrpZ1Og/Vyijob
	LijJOJKWjosoOyRv21lb1LRN9y3A3r/W6PBtGMltirZgeBo3si+laoEkxpiZJygzKg==
X-Received: by 2002:a05:600c:811b:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4a967e8d5afmr115475175e9.27.1793271084335;
        Thu, 29 Oct 2026 03:51:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm13964925e9.12.2026.10.29.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:51:24 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:51:21 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen
 <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, justin.ernst@hpe.com, kyle.meyer@hpe.com,
 dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, Matt Mullins
 <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <20261029105121.39a4c74f@pumpkin>
In-Reply-To: <auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
	<28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
	<20261028142625.GU2668564@noisy.programming.kicks-ass.net>
	<27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
	<auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 14:58:12 -0500
Steve Wahl <steve.wahl@hpe.com> wrote:

> On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:
...
> 
> For an example, I recently used this method to discover that at
> least one version of Intel's MPI library likes to read up
> /proc/kallsyms from each of the processes it starts, and somewhere
> north of 1000's of processors the atomic increment on opening
> kallsyms, implemented with a compare-exchange, becomes a hot lock
> and initialization that takes little time on a smaller number of
> processors, suddenly balloons to half an hour.

I'm guessing that was pre-ARMv8.1 ??
The LL/SC retry loops for atomics are completely broken for contended
operations.
The kernel needs to patch them to use the LSE (single instruction
atomics) for ARMv8.1 which guarantee that some progress is made.
A CAS loop can still get starved on a single CPU, but some CPU
do proceed.
You really don't want to use LL/LC on a system with hraair CPU.

One CPU (not arm) that implements LL/SC locks the cache line for a
few clocks after LL to give a reasonable chance of the associated SC
actually succeeding before the cache line is 'stolen' by another CPU
doing an LL.

David
