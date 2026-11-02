Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637292;
	b=K4s/WPniVoUk6PeE4rWduJGHPfM7ZJAALyAprRLsie12v9IZk0eIjgXczZY0LlP9MkRB
	 KTgBnr10d3X4wSuYhllKWaxFZj6txAIYqHgjlS6BkrPI5/jP2v6peTU8bDPksblxvZDQp
	 CdaujT0kXuezMvunW4u6TzkUKXBuIgxl94nxVS1cH93hNw0oUxu4A+en3vobRMwiwYw+S
	 sLWX+ESUK5SZ/XBuDzAU/TNLBvGDjf0gxaN9M/cgJ7f/ThN7k5q2ZW9hZGo2krSmeJidQ
	 mdydIKNiuQ/DKnux3/nZmSf+2xtj9TmIYwuTRIit5mu4s620TP7la9w6tWBOiz3fe/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MoheuHlEpuNPoWzdB4Mk7XB0qKShtlyf3pRl0wAuuZ4=;
	b=NEtheML/foL3/kC1zwoUGMwsjDs9dJ9uJx4Vi/R9kER0ECz5YZVzDEnf/4miIdONCzFj
	 bLHovBqdjG+X92b1JUWSvG2Plw3MbH3GRKcUefAgiH6A7pMlh2GHRt96vBljD8VRvXKhl
	 VmS6JYxABI+2uyNQkJn58OI0ADVO3XKZKR97QpaC3/boaENz+Bd9ue3TIidF2t6lJqxg5
	 CngLkxXO+0HSuYsFRhZ2q8/LAPyI23PCCaWc3rrFG7f+982Mx2z29XGiSTP5ceFXOCUAO
	 XMMo9VyNEoKWyBBmCU+JhEm/X3rEoHgkplRA4DphJFX7o6IrfF2mDyJukaTpCLpqXAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEHMoZfP;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6B60A0FCE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D6B60A0FCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEHMoZfP
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so28961565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793637290; x=1794242090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MoheuHlEpuNPoWzdB4Mk7XB0qKShtlyf3pRl0wAuuZ4=;
        b=eEHMoZfPxt7t8LAl1efVvJZhCQumQ4eJSe9y9i4oiQZY3kQu9FQ0uVm24RoSiwebmH
         sHGBSZziNi/qKyn4jPgcjqgjN756cfG/XKqyFI6PiRU+cfgRHWyK6Y3WP9Yp5kf27ZWI
         nzELxJdCacN9o3PwU+T29HirNpAiT7bUj4rkVtnQ8rIdk+WZsHoH7Rh9LPpiV98VE7Xy
         MyvErbDH8gws4nScN/JoWhHs2PABx/uOUQ7cSZhSTVfMI7S4mTr6ySEYssrPHK6HSe3F
         2lST/3OOOcTcRqyqdJT+cHVIik7L6Tidsj95Ma3IM7LgB4iA45tGQ+/mUO14YY4ybVt9
         QHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637290; x=1794242090;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoheuHlEpuNPoWzdB4Mk7XB0qKShtlyf3pRl0wAuuZ4=;
        b=BVXupbHztxK6JXqzXfzV9ckBjDAzqMi4yA/l8y0X+kjdSahk5S3fmZa1gytPQT9qsE
         y6M1RnEoQnHv+U+9CyNV6jupm1sAKG8GEEw1krJMjEsexxekwnmBYosLRD8bFDMQPSmj
         iIlB9xmmMt/Fyypp2FOeucuWDoaiaoT64I3vzpFl1xJnLri+QefrocKO8dW0pqvo/Q8h
         alNtugEQnVI+1JXm8e0ltUcMxI7PWEYDEv8TN11Dcbe1qHCFI40m96HnieZq36kk7Zgu
         gavpgf0fQyTtnW/rK6aYWePaiICkS1UTIJjCtv00ayheIiBYrElhx49096PVO5Drasox
         OPOA==
X-Forwarded-Encrypted: i=1; AKwUvBzTNyNiEhJDAutKpHEUgvMUuG5CjC31T6tXQFDi5dFYRgi9iVKOhKegDqm++x79Mm1dqyWf9tFsEkdMul4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJqxvgzDReB6UMitcP3PpykemDQtqtLtYuqsB5opyVWizRfdIz
	kgANfJUHQ4+L33qbJSpRDG+9jW7o0xsm5yfwGGyf4AFS0U0JwauViMmA
X-Gm-Gg: AYBFou0ys5vGS8Krk5HPayrOrpkdjAzJY2D3p8V5FgCqnBn5bLJq/RgPLyPup4gD4Hp
	/6lpXrPngloLgk2xdgJC0SXhh6DiBKtpxiL1NRE6ZcgxUE6CLICaZPgorVt5XrC9Z/WJtZsZwlJ
	MbpdlmrbETYfSiiu6+CDRwE4kD8amxRvBYhM63fsSlM6q83Ir9DCTwwEVTVw5XgtNB5G8HxUmjc
	sLLoNiL1clVA6g3HjXkg3aCTbDy9cdTXai/7XIQO7tRpmdwkIzuotq5GkXCH+4mEf/lh/8/wrh4
	TbYzbihXPbG9YOMEWG02xhYYmZgw7JteNPlnqQP5aWrJiKNGp/B5VAMjEB2EYPz3yQO2mQzIHk8
	oEpPncStVwh0MUrmf+tiwnueW2I3OZzkTE40rDICzSUReTjkZskNiGiWCRjXbSxC5M7rewK01/g
	xYD8L+aBgmXmBMNJeexxwVy0L3/j7Km+79JTcn518V8TznqygtRU9wCQZAhFREp2JsuebR2yCJ3
	VqS4prK4N1zXKg4yx5BqEMxD4m4V6dG5MRBtURT3u+n79MHHU9L2+DFZo0nouWCoElltYeroWRD
	jldSouw5c0N0SGA5/xMhMtcIDasja3FAYi8pB82ASZ290KHrvZC6MGwYWTym08+6
X-Received: by 2002:a05:600c:46c8:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4ac16acfde1mr258820575e9.6.1793637290279;
        Mon, 02 Nov 2026 08:34:50 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm362296085e9.12.2026.11.02.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:34:50 -0800 (PST)
Date: Mon, 2 Nov 2026 16:34:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jan Engelhardt <ej@inai.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, Bradley Morgan
 <brads@mainlining.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <20261102163448.3956dde3@pumpkin>
In-Reply-To: <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
	<4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>
	<6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
	<qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr>
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

On Mon, 2 Nov 2026 13:21:04 +0100 (CET)
Jan Engelhardt <ej@inai.de> wrote:

> On Friday 2026-10-23 18:12, Paul E. McKenney wrote:
> >> >
> >> >Add emulation of two-byte cmpxchg()
> >> >
> >> >These commits add a cmpxchg_emu_u16() function that emulates two-byte
> >> >cmpxchg() in terms of four-byte cmpxchg() [...] 
> >> >namely sh, arc, csky, and xtensa.
> >> >
> >> >There is reason to believe that these systems will soon no longer be
> >> >supported by Linux.  
> >> 
> >> riscv64 also only has two exchange operations 
> >> (lr.w.aqrl/lr.d.aqrl/sc.w.rl/sc.d.rl). 
> >> (atomic_compare_exchange_strong with uint8/16_t, in userspace, gets 
> >> replaced by the compiler to a lot more instructions thanks to 
> >> implied -finline-atomics.)
> >> 
> >> Are you saying riscv64 is going to go unsupported too? ;-)  
> >
> >Given that the compiler can make it work in userspace, then the riscv64
> >architecture-specific code should be able to make it work in the Linux
> >kernel.  At which point there is absolutely no reason that Linux-kernel
> >support for riscv64 should be dropped.
> >
> >Or am I missing something here?  
> 
> I can get gcc-17.0.0-20261102 with no further command line options
> to turn `atomic_compare_exchange_strong`+uint16 into some object code
> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
> tried xtensa or the others.
> Thus, is the patch really needed?
> 

Won't that need a big jump in the minimum supported compiler version?
Probably less of a problem than x86 since I guess cross compiles are
a lot more common?

David
