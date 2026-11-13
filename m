Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598981;
	b=oeX04PT9O31j9FNIz8PJaiOBX1WiBhDBlXVozecjvF+1PgQtDTj9pkds6kjbgjv3iVAk
	 /bhNcjT77kAG8HBNEyvwEY7CPEnv1iCtUMXD9mq5u0QWcjtXV+2rECaNyfWhCDLf+ndIs
	 uiccJ0T8eDjpHHAB7FOpsIaDf6YwF6XBesGptcOUBvwlZxv66WyKB+kc+Lruz9hT90HV3
	 4gY5rG4I8pygwUSSilwmwRAJQx2AKgYrjFK+DPGAPsbnyqDGy6F0q3/jVO3LPKFezJeSW
	 FBC8g4EutsZ7L/nIn04lQUc+P4o/0z4gEnABZxtrIeMj3epMRJg4tW/lJuvR/EKnLLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aS0bY+dM0gSE5Gx7mamjopyRlkbtFcnJqnWWAEg/jG0=;
	b=4iJFnK5JWUdRtL3IQPwRnzSCsv4eFHUhUCG0GtM7I2FvqWa7Dqsexaw73jAqhtdSEAPA
	 8hBgv/Zq0Hs1w/TmxN8vuDMu2DKXxf9AcpugwUatp3GQU8sDi1+O5qO/jrfO1MrKkJkNr
	 aesetmP8ACWEX7SROt8qGYj7H8tpgxyaSQKWnfIOr0O29q/JTRBNDpnTyrUR1JcYP4jVh
	 rngyPhgD+6fPSOC623HujmU3/y13xHmR/QSJ58bC41MOZpQBZ7zSIOEcDPNdhrHZit5BV
	 v7vfoTSQ013ndcd1d9yKffJV+7LY9oMYXB7ZawdZXFRw7gecMAgcqYtwol4stA1nY7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VohYGtV/";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6C606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D6C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VohYGtV/
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa5103so591910f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794598980; x=1795203780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aS0bY+dM0gSE5Gx7mamjopyRlkbtFcnJqnWWAEg/jG0=;
        b=VohYGtV/kQT8hO1SOLapmQS+6pOM2fi1RTDvkL3ay3UCda+Qe8NjmgGZcIGnqOGhVZ
         XLbqd9HQPI+oEaiP6sbcRon33poR2e3gRuDKcvQLyu5lOrldbFuf/d9TJovAPQYzTtoP
         xZKY+ZF2BbdvmCstr2Nj7vjGvXwrvR3jX401WDYkBFaBCCSucddT1GJ9FERGWM38M7BK
         tP1pNi9mDL/UKD43JpVbsUyZI7b0SVbHR+OoDNwg9TVGetKlehoyMIgUhGRcvsglbQYL
         R3qSTChNQdUo3hR3l7fqcUqRc7+qlfC/N02vN8jEEZzIhlBKsg+/89LCg09jgQjuOyy0
         Qh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598980; x=1795203780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS0bY+dM0gSE5Gx7mamjopyRlkbtFcnJqnWWAEg/jG0=;
        b=yM++Ss6o7Bu/3TCHGBNJXDJCWb3PzUem71jnoTANo02lxbeZZ8lLPXYzDtBBzvwIVh
         JghU0IFYSY+l01RKv4YbiXFbp2hR8t7HJg8qAPIZnNFpwf5yAlrxLVqYO+6b5o04bTq9
         I5couK+AUzQeBxH0EYKUufXGH218U444jXStY4jLyAy41WGY73Ab5r6o8YjfIDaqC6mf
         1KIO7d89nzK99kNv+l5tcob/YdkBlrX5bUu4UyDteaEsuyREj6vuIq4Wf7LtD0G7NP7s
         HL7W9e+wuDLm804TheX91D7yHSsb/tfIeW74RyScE+G12+fXIfaTeX5AJ+fL1dXjLNRU
         rwoQ==
X-Forwarded-Encrypted: i=1; AL+hErGn9bKc2ljV7qkX7aWpUe+PdhpNCxG0rYKV00jG1DZuIU/mA7uAt4+h0xhFi2DqtB0wdY5OrDmOaQnN3lE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OTVv2wj6We3x4gw36OO0dwBU2AE330ii8w0T7wDoLdyRh+eQz
	XRtP5l3mkKouUdCfFfAt2KeSx6s9iVoydXa2NtvoFqrJPV52EO9p8A0Y
X-Gm-Gg: AYBFou3aOe5VmzHO+KWIycZN1BReQXyrOEazlYTQ6FBYheewJan8LagHfwuZ/jnXGRB
	pi+YX3H4OxVdsv5GBkisdg2Jf/cm7hXp/ZCV4E3cws+25cidjugPpFq4staUQZ161CuteOiTSt5
	s5gUwFtY5A1vO+XVn+hsnCXQXYQ5/tRTll8gju6sJdZ7VlmVoc/BY+Iq2/rWsaLtLJX1U1bX6ge
	gI8eu8kJ/506e41CvoaTwbkeYWp3GyjRmBHhXKM2iViSXmsBicmS0hvGc136m2gCsmfKQrgRXhp
	vuNngKtxqSXRwuZs+QdFzfiwbm2Du+3eghlAs/sK1pBD6dDWmn8MtfOlULOpI89x/HV9rtVMmBA
	z0JDzJlGZatNQ9OkBqQhO49oPqBb5XCCzHL9PYivi6IvM0ci2XBW8Go3nOrwDGGDw9IoTp2vgOu
	PZyhrL6LUPZs+OUf1ZgtXqoLAxbOuVzo3ffAWg8pXHAb9jAJGHannF5hieG1rEkt3iXXbvQeYD7
	N7/9Wmq/LXEYbyD7xFvS7l2fRibblP887/pzbkXXfnHJzkxfuANIgTsRq39EDIS/dOhSEpuSwQc
	1zjH/52sdM0Qe3uE0hIFb6U4NeZCtUyxvjnUbh+SZ/RZEMijBJ0WIipejCkEoS9Zdg==
X-Received: by 2002:a05:6000:26c9:b0:497:bd30:8df5 with SMTP id ffacd0b85a97d-49c6dbfff6amr8485738f8f.2.1794598979695;
        Fri, 13 Nov 2026 11:42:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm7013048f8f.56.2026.11.13.11.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:42:59 -0800 (PST)
Date: Fri, 13 Nov 2026 19:42:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Usama Arif <usama.arif@linux.dev>, Borislav Petkov <bp@alien8.de>,
 dave.hansen@linux.intel.com, dsterba@suse.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on
 ERMS CPUs without FSRM
Message-ID: <20261113194258.22d39d95@pumpkin>
In-Reply-To: <CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
References: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
	<20261113141137.1113517-1-usama.arif@linux.dev>
	<20261113160300.3f0d0a37@pumpkin>
	<CAHk-=wjmnpCmhyOta1EBR6D8_JFgLNz7Jb2s_PgbPq6cBiQ0wg@mail.gmail.com>
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

On Fri, 13 Nov 2026 09:34:26 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 13 Nov 2026 at 08:03, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > I was thinking more of something like:
> > (written in the email so untested)
> >
> > static always_inline void *memcpy(void *dst, const void *src, size_t len)  
> 
> The problem with this approach two-fold:
> 
>  - many memcpy() calls aren't actually memcpy() calls on a C level
> 
>  - many memcpy() that *are* calls on a C level should never be calls
> in the generated code
> 
> That first case is for things like structure copies etc. And it's
> common, and it's important, although for the kernel it's usually a
> non-issue because it's *typicay* a small constant-sized copy, which
> brings us to the second case...
> 
> The second case is hugely important. The compiler needs to turn small
> memcpy() calls into just loads and stores. Calling "memcpy()" for a
> known 64-byte copy is hugely inefficient.
> 
> We used to - long ago - do that "constant small sizes" thing by hand.
> It was a huge pain. We now rely on the compiler to do it.

Actually you could detect the 'small constant sizes' and call the real
memcpy for them.
The compiler would then (hopefully) inline them as a series of moves.

> End result: we must *not* hide 'memcpy()' from the compiler for
> performance reasons, and we cannot catch all cases anyway because the
> compiler generates implicit memcpy calls.

I had remembered about those, even if I didn't mention them.

> This is why I really wish we had the compiler just generate a
> different sequence for 'call memcpy'. One that used a different
> callign convention - preferably just the 'rep movs' one so that we
> could just rewrite the call with 'rep movsb' in place.

I knew you had wished that in the past.
It isn't as though it doesn't have other calls with (annoying)
non-standard calling conventions.
For one arch we optimise 'shift by count' with a jump table, and fall
foul of needing a scratch register - so have to spill to stack.

David

> 
> Without compiler support, we're kind of screwed.
> 
>               Linus
> 
>               Linus

