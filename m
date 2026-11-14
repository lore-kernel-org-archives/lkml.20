Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621513;
	b=IRU45jhzCE0MkfAytIp7OLveRETWEGvziCFypTUWhtnmX8EXunQNfVwqMH3ynPLnhq5R
	 6P1MPTY2TdrbSr0dN5ltC9+CEmieomPnSAjTXGCf6UAss6e8UW4ZUlY0UG+AX1VpMeTuC
	 gchRIRc8gpj+mMGtaQhc6xOcd/upC/YARLvhvZeolhdTmHgleQYKDuu1eVxxWW/ZnfeBr
	 E5140Z0kZcPrjRefiQjWMW2hsrIxdOaTaAusF8HoaKqF1sUVtT7qcgnF+Xhz/oRK/HvMe
	 ihm3dURjW0Gr0ff3/YPh3++8e6jBxnVTXo3Je356tQHUIGtqCSxSsiK00gZ1mlRv6iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aL0LHF9pCJJuk3YgqGM4iDuDCVWIQy3ZFbQQg1gZzzg=;
	b=nIE2QQtJ+vE2USB8QeXUIDKLp5ZLRz7Ekolu42DOE4QfUjmdrPVCAqnhPYrgdE/rbxOb
	 Ccwoi4m8wM4aiMZd5xg5aYuUIUocVlt1ALfw4O1QbUEdhfc5UFDHjmppVQCpYKn8D2Mry
	 3QOXdy26RVIbp1y7Q841+zqbuLE2JTyisrijI7CIfgGNf7HAklqApolT4S0miYok4JXLR
	 ZA3J7A6BuUBz06B9kwj8JbyJ13afk0r1msVajpZRRF2LuAtKGYGOk3JdNC0AkBKfA58sl
	 xPKyOV66rqDeSgPted89pidrKHgI0SR5JTJS6rjNmHvfIvwWbrmcf2HpKOBV0LWp96A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LXlUxH1R;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FA3606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FA3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LXlUxH1R
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5080ef9b31so330811166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794621510; x=1795226310; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL0LHF9pCJJuk3YgqGM4iDuDCVWIQy3ZFbQQg1gZzzg=;
        b=LXlUxH1Rh6K4qlinmuEfrvRHc4tIMvhLHEqplfZu7iFjGmWKlS5Idc1cHRtAUMJ9JI
         I1SCjG5P19LQfH9XDGaGVy1kHXJ4cxMXZTvScOTgDF9Fs8GeorYt7vXmXa9YRYBrOWJg
         XQAZodWeb+Q+5Wikz7azb+9c6D684Jcb7TW80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621510; x=1795226310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aL0LHF9pCJJuk3YgqGM4iDuDCVWIQy3ZFbQQg1gZzzg=;
        b=pCfrTSZnnA25Mplg6xQSxOxoAIl1th1Ktyxf7C+7VESnbdSuDebFUVSbYAYQGCTFu2
         PwXRIKP8C6MRwcFKfsg4CpP6szj4Moi05Vxe3mX6Slo1qAwDCaelAAMGf+94Pcn9d4Rw
         H5A8v+1Wa8It8UoztG0Cx7Qy2pOJEmirYkH3Q8UE4dh4XSTZuaAbTvWOzXqvXlennBbi
         3Ct9gf6mJwjHr5zrZsQjpJJzj4yzq4kPfgArEEbANYsEfSe72AKZu/rjZLk78EFk/uIx
         ebCIwCGlD7c+djre0Z62rwRHJR6YIcpEsGIiGIAg+ZGQwyJxMoecMtRlEBuF30LXYn7v
         Ii1g==
X-Forwarded-Encrypted: i=1; AL+hErHt77MTf4x0QpKpERDXN2GCS3S76ird7iuKpJZLq4vmbqWmBcgtcJQcuf3RDYxn/F1F2QnEUoZp/BPCp7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k55fMbe8wDNfyU9Mmt7qUUkHCyvvALD0lEASvRnNN0osXI45t
	IYsUuCbU+aowk9TLEquoKxFNs5LY7G1V7nrXVwOCNv/67KcJ9LYija4jq2tuQlwaUkpGNblBquU
	GmQ2juWaOtQ==
X-Gm-Gg: AYBFou3DPRtm0sRys5cb1uI8LbPBgbsdrR8LuJDQmzVOAZQCZu4CLyA3qQH7zfbA9c9
	Uyf63AYFr7KGKcEtEaK9JxuQFGOYAaDOC58I4ROcT8F8hByJdFE+6MfjKYuhq3dQYDh+tzz6J90
	R0+x3og8x65WEiLIzdYn8rHi8xctRjM61PCeMjaMbkzjlFmr4qxRzFuE7GVq04I7vGIqyr5iWQx
	W99gMb1x8Sjka+EQyC/wXyVe+yN7Q1HXTI62B0A7Edmtzmz2XFL2OE/hmZKMXHuGc3Lfsrp7Lmw
	1zDUfsaArk7L2iUYX4bpT5ZZGEH5Kru/xh77zpzxShLXDoS+VXREn9x3XM8z5mDfp8G2N4UbfSK
	ivCUhGFEpNLIiyKfuvFw/70iIsO3WSlle/fMbRmKxB0JxlXJrrVi3MPe7O91Rm+ZHUDnYz+5jw6
	BG7DHwr2XfC+wF1YRFlQk94KKUoQKsYt5eHimY4ZeSSpLG9t9TMvK9Avjt2aBTWxzRVkXqyDc6R
	6H277xV7Z2W1dRgh7XGwf5y29kfVaqw6Q8JM4ah6mVfVaw452yuv9Pkr+NrdIgczDXUWPr+CcLU
	BQNjmk57Bv93Hbz0y3/KOodETlkJn5xRW0hIVbEq2No9U2sPGCe/t/t5FOkFKav7XfHm5iYZx/K
	+KF4=
X-Received: by 2002:a17:906:dc8c:b0:c44:3006:5c3 with SMTP id a640c23a62f3a-c5096348260mr372076966b.28.1794621509873;
        Fri, 13 Nov 2026 17:58:29 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5ac2asm163639466b.55.2026.11.13.17.58.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:58:29 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso2896701a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:58:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHPwj1avQAZPQz50bWukgyuCmgdekym4OovDAk1r346VTzJsy3cfwzhSzFvr4qCjjpxBsFr9mrzC5afD0Y=@vger.kernel.org
X-Received: by 2002:a17:907:7faa:b0:c2e:350b:7220 with SMTP id
 a640c23a62f3a-c50962ee306mr382948166b.9.1794621508960; Fri, 13 Nov 2026
 17:58:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113200720.2752960-1-linux@roeck-us.net>
In-Reply-To: <20261113200720.2752960-1-linux@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Nov 2026 17:58:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi7hJNG_tTrrs8RC2YOko89VdC3enAM02Q=X387uOqEyQ@mail.gmail.com>
X-Gm-Features: AclHuK_DNyPj3C43DT5p2t3qunEiw1JrghHTzZ2xWOYLj4cHJlEoticaV3NVHr4
Message-ID: <CAHk-=wi7hJNG_tTrrs8RC2YOko89VdC3enAM02Q=X387uOqEyQ@mail.gmail.com>
Subject: Re: [GIT PULL] watchdog fixes for v7.4-rc3
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 12:07, Guenter Roeck <linux@roeck-us.net> wrote:
>
> * gunyah_wdt: Re-enable the watchdog on resume
[ deleted]

This is simply the shortlog just repeated. It's not even edited apart
from some trivial sed-script. That's not a summary, and it's not
informative.

Can people *please* just write summaries? See

   https://lore.kernel.org/all/CAHk-=wjsj5evNKrhY-LRARUGYXnNAPqK09GHAEJ9sNLoKn4dyw@mail.gmail.com/
    https://lore.kernel.org/all/CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com/

and hundreds of other email requests like that.

I've pulled this, but these merge messages are *useless*.

              Linus
