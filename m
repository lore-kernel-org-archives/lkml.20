Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169846;
	b=amAUD3mT0YEYSFojS6Yg5WIdyjy5oS+fSJ++0HvlgreVENeUh4yofsUNvoloCxxUBoBw
	 +/bQnbWQNfU3OA8bEDv8e7m123FXT9jt1zWAQQyqWERy9vjAH/dP03BLu0LUyh5ZZCeQZ
	 pBXmGzbS0KrOYOoQ9cZOH1IEoqAGxU8UU3Qjnjf9Mx4QaUIXrXywQPU3hN8BuGo7JBMtx
	 REQv/SZSsKrN3e8z+n4nMjcm+LnlQ1tuOvYtME/j2pVarNX5jHR65NqljaRCnKbDRBtoT
	 pMqBWc8CHRssAzA1DBKZeovHlMLFBQF4ovwVeDJc6UN9iAG5CSU5zxkwbN91CXpGy4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UtP2jccq3jxPhce0osraBRs1VaHXV/BGnZSpsO6ZWcc=;
	b=m7me0wsu31RPHx8EB5GbD0wndzHs2zd5Dky6x6WmRuZZubplUZSuG65fp6YImirLbItH
	 q8qlvxvSM+oY9ZZXfWpuuTTC5zHWcTCPtmuTM8tkK/zjxi6idH4T8rs8v6R10Qd3MNj/k
	 7w797yuoG2YwzSb/wo4v+qn11rm74mAUcn1Lifv8eDXExUPz9VfE9JtNywp/9yyoUL/Q5
	 eHONCZk0KQ3nh+vLNY5dngIbQerqt3KXpU2jJk1UFDJ5fkuugKgcg8oS2T35XH6ZROlj3
	 my2JEC/LsvlVHIuKER+7oOoMeJt51L5/g3d4dIV1/j0Pe8yWk1euq/R6uhKiPOQ2H3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2upFkrh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F8A606A33F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F8A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2upFkrh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e09aa5264so140514f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169844; x=1794774644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtP2jccq3jxPhce0osraBRs1VaHXV/BGnZSpsO6ZWcc=;
        b=i2upFkrhHNkE8Vs5dXa3R+5ZUD/5gsyZBVyKk4L7vEdbhkzwKX2Pd6J2+bj0oGqpYG
         hNUVaq387w2Zxr0m0pEzkrIg+X+ywhgMjNSrudpu/D1pQkzhNEoWBdWiwtVOgPaOnvCU
         G2T1POyblgWvNXznbbyj1UPHWXD+WDSmy5opAd9/zQwH3Hj5DQbgJfgUNRUR5sS2YI7S
         FgxYBzpSYQGkevcHFCREauQrJMroU4OnMtUddYAolNr/whqhL3rXZUSWBSQiO90DX8Lj
         H10cBZmqdqpCxu0LvK913mZ0ybZHOvn2AytcHYldwgnkUpBmOviZNGjkX+vKPLMFplmW
         Rmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169844; x=1794774644;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtP2jccq3jxPhce0osraBRs1VaHXV/BGnZSpsO6ZWcc=;
        b=MWLvfOdYfdfdw3ZzVWwpXl1Qqj2thoZi8mCtc/eI3K7/WG3Ul5P+j4GFhyybiqJULZ
         6oQmj1VhyKk8cAr5+iFZb5T/OGevkxriRx7VK55L/8kQquu2BeeLQRwIirBMTfnXhRq+
         BvSMRwaP2cGGKv4V85ol4ipqpu/4qpQ/E5zt8rFeZCM3/637zl7dLh+Yl7ECNCeS4GfR
         byp+GZz28N/tHt2sU69apPiYJ3Or25QRcehMK5F4UM5d+sUoDnkgLrr32A6YfQmreA+F
         i4nUqFAAINDZNcPqubyhIt/hiG3ZOsZ6u1pYyJVJeyGhDlO8YzQFk/GlieDunn1a4fjP
         99DA==
X-Forwarded-Encrypted: i=1; AL+hErFJlp+PuoFmmG8zAsxXa1vsTc1fC771vYeefp5riCS3vwNe5IM7qTUaaVToX7KGPPqrxBd2hPMYg0QBK40=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZFft+Mo3jQU+1eWVwWdX7FFoLg85uZfHjTHCOM5JI3d3P/YYX
	+elc8TzRsh8uqSBcBvBEAIDmpwDg+FKU3DZd1peW4OY33MaFdXwTAJUY
X-Gm-Gg: AYBFou2wTl+zO+fdH8ibHPWHU5t1U31jkF4B8qxw+9dMp3PFa3FDUbQz8/fsmruSAIi
	SGt8OxY7dFV5G4N5Kt7Ud0ypI9lBCg8ODJo/lZlMwz0Z0SH5a5STmmp5M8N/ImAQ0vnpnb3UNR5
	0TdDwTsj09mHsCvpMkz5hscBYjn6fNPe0GmPGM9cwRKdqA9IjfSlxlp/qTQvuwSirt+9Ric+aMa
	QTZqYyxPXpFnA+enTUcy7HpWXNU6l2m/uTqq9anL+slLnAZpN4ivumZ2w3scYLrNJLd44FwXIU4
	j47CQ9VoGsmV0jD+UySPA/LIHLf3Ud/XCLupvOlYqTF8P5x18srBKB4FSJHDi02Fylh40sm9mrS
	yRE/hsQV2b6FgTZVHtFVts5syevGzDIDBppGur7yjjzwHuxjtqKIvszyUKQJqIhOC77To3ZTEUc
	hObza4Tb+CzzPmidXnnfgUgsPTTLzJlbdZhr5XLLjaD8LJ0Fe8yTiovbuDUGw3shyJz1qJS8jPa
	bWE/2v2M25YXadRyU1fV7/0xgVNDdLrS0r+wTsGvXuP9FNNYgqpVJqFJn07I7prLmGgqut21jlx
	GiXi3JDon7zkdSGD2Fmmg2ykQwUTbQmV4lAiLT0RMghPfOnzDpbO9zTzCpeDRakSEKUQjS5XXrZ
	JSXnZXg1PVPU=
X-Received: by 2002:a05:600c:46d1:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4b960d9c44dmr45446805e9.10.1794169844378;
        Sun, 08 Nov 2026 12:30:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm85799055e9.12.2026.11.08.12.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:30:44 -0800 (PST)
Date: Sun, 8 Nov 2026 20:30:42 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon
 <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 3/7] x86: make CX8 usage unconditional
Message-ID: <20261108203042.7e36f15b@pumpkin>
In-Reply-To: <20261105163440.2381661-4-arnd@kernel.org>
References: <20261105163440.2381661-1-arnd@kernel.org>
	<20261105163440.2381661-4-arnd@kernel.org>
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

On Thu,  5 Nov 2026 17:34:34 +0100
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> All supported CPUs now provide the cmpxchg8b instruction, so remove
> all compile-time and runtime checks for its presence and the fallback
> implementation, to assume it just works.

Is it worth doing a run-time check early on any (trying) to output
a message and fail to boot?

There are probably a few other things the kernel could rely on, but
probably ought to do a check 'just in case'.

One that springs to mind is whether 'find first set' leaves the dest
unchanged for zero. There is a comment that 'at least some 486 didn't'
but assuming it can make code smaller.
(Basically you can do a double-width operation by putting the result
from the low word in the destination before doing the high word.)
But it would be nice to have one test case during boot.

David
