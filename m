Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856230;
	b=U4HpE1noFgz8+AfFCKgjPQVTbYUjNMYmQftVr2b6kCkxsRIouvd3gqRrqaDiq1M736Yu
	 IIgcIJZFahspaal8oIp5B14ORzy6A7rDa+9Gwg9fgNhpzKLIbskfkl22U6l4uV+zAe3hn
	 6mh2tZ1m7pRXoCIrv6aPH8Lbp0owauffKqDMbSw8YSsyrIp5SeUAvKc73fzxV3tvMnAXv
	 oloWZk3KNHwTZDNyj//vvFAK08EMVnPShpYI2M+8tp+nCCqqWphXXNOwtny/hD6KLDyKk
	 cfw/BuNmEmbZUzqYW8s8SfZ/DhJ+vkNiHrgTrV/UkPXa6wJX4EQAiqExdCUGKvEX0cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qsGE+zCIXfvkQmpr977qsb3iEFIBRg95jemFmU7wQ5Y=;
	b=sT3zNFtZgrezFrWs5ynht2cjiq4AsxfqK6/OBdeQgL6zkH4+EXWHFjk4IbG2U/z96ehh
	 EbmBftt5y23elRC/TozbqqdxP5bQvhPy/e8Ro68cef98OrOhdqVM2Y7OAbYD866F5EQfx
	 rmD1awLZUrdGh7tGffE4sDDzKJO6IPBsGPAUO5kJwFfcxHuHIjJoNKGfD/DGJ3qxSpj6C
	 Er8aulkXWmIddV4j4gYt1E6pqQgWmycpT7AbMorscVDWIfXnMzGQIAY7BzJTjVP5/i+yc
	 9PEEXAX0m+AA1HMmJTvUKpEw4XxfaAd1DjwjF9MVHhiEPKZPX7v2wsIyH0BrIQsIFHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="VinCb4/Q";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8F9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VinCb4/Q
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so2554175c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793856229; x=1794461029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsGE+zCIXfvkQmpr977qsb3iEFIBRg95jemFmU7wQ5Y=;
        b=VinCb4/QPrcWlxMsKYuv2I7L1qrY3NaM0MO/Tnjw877EK6hoHV6fxEIdwA93ZmNyEU
         /Ue2bfBbslRPDab4etIaMlV3EjSJKtk5ysTQWO9z31795bJUfFr/0PVp0Za4uqBXy1WV
         HP1raoart1016H9+d6KOMtrFoyx+AQZqpj8k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856229; x=1794461029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsGE+zCIXfvkQmpr977qsb3iEFIBRg95jemFmU7wQ5Y=;
        b=Q4GFDSj6W67IoPc5OiCwwpDBuztcZXBqR0i5Rgu349ankEMHLyAi2rvlaVJ06izwU4
         UT6ByFRLJvfZQPuG6t0WGFe6Rm/ytNazDESEXwSujPg6lC3RuHzC1L3C5kqbAmwNG8tE
         rje6wSi4ISyVizFz1xc6WyXyGtQI2dbE2kf7HO8e25EEZxCc5p4KxwjOdbsi7Blq8nwp
         XYEeTkkHNvVQPk8pqtvK7V36hvnpHAMHKdSBecGO6M2KplChbkuXmJM7Mu9zy4rJtws3
         C4Glfqj7gfa8bzToihQChu6CYHcGQwwt8H20X4ZfmWdzC7CWVbL5afK82DSAimksOPCh
         kkLw==
X-Forwarded-Encrypted: i=1; AKwUvBypOLmvv6JLQJk2YcQYyZjcpWM1EvNqlnbZB6c/pb7IPIZlDHhJoxlyVcmbrv8RRwZv+fNFK708ZIpDqMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jtZZXdTfe3mJCTjB0DdB4jS8ebeaKpZ8722KNEwkEk7GR75+/
	vMjSl7MG1f9iGI51jcp77qIBbqf9t9EV4QrKlMxigsZbG0xncvchHdOh0mSxhohdug==
X-Gm-Gg: AYBFou23p1TFwbNPQjeDiriOJAEeqfW1G7WlX+vO+RFenx4h5MndbNq0dSZUFqoLIv8
	1jIWjNM8eWDdMn+xUMzWFJ1X7NyxKc+Yq//aWpOkbrizp9PiX/K4b9ptzNd3jyHqa1qyDjLDtrD
	Hpdcxn32qmqy3WnVg3oWd19xzBuemESb5TJHgwS9PhLHyk7+NvvoJptyDxxZn0PlwXEoDzpArqO
	XxMhbBtXJT5SS6ZXFdluQXjZkadcVNGv7xNvipp9VsdyEltQtkq/e+OiBb6DiQUlyjHe+JlpnW6
	v+Xv7s7CNx6rhE7JLcwmy6XsdMPXIad3CooZY/3lJV4Ubr0H1wIQw3vE5idygVlXfy6i/gKXxx7
	onFYaIq668eiYZzgH1/KOmqJ6ueQcucITCX+qFk1RXUaTmkC8lQ1aReD3hHvNpndTwxSCv9f12W
	tI4hdw3DQPLfYT5cAa1qYabMFJYuvKUdITnGqHE1tkJjEAklrl2hkBA/iv3JYWCGyZ7JcmyjL7l
	VOTeLfZ3xQXFYNOC7+cK+Uam4V5mzmVef4fSiIDO+ZjaOrRkt64Xl+0u5qMZWEBPZur8gcpR5Uy
	AZF5Dyd9f8tpZlfXfHebUcrf0JxZlsWaHv4/SauosstVwuu1+WpvfxxJmVrP5kCq/R5I
X-Received: by 2002:a05:7022:fc03:b0:1b2:46ee:4cc1 with SMTP id a92af1059eb24-1b246ee5347mr4936175c88.43.1793856228364;
        Wed, 04 Nov 2026 21:23:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c463e9sm13218160c88.14.2026.11.04.21.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:23:47 -0800 (PST)
Date: Thu, 5 Nov 2026 14:23:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jenhao Chen <jenhaochen@google.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, liumartin@google.com, 
	benwei@google.com
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
Message-ID: <auwR7gnuLsF0lpmG@google.com>
References: <20261030121700.260975-1-jenhaochen@google.com>
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
In-Reply-To: <20261030121700.260975-1-jenhaochen@google.com>

On (26/10/30 12:17), Jenhao Chen wrote:
> In zs_malloc(), the fast path (if (likely(zspage))) allocates from an
> existing zspage via obj_malloc(), while the slow path allocates a new
> zspage via alloc_zspage().
> 
> Because obj_malloc() has three call sites across zs_malloc() and
> migrate_zspage(), Clang at -O2 leaves obj_malloc() out-of-line, adding a
> function call on every fast-path allocation. Conversely, because the
> 362-instruction slow-path alloc_zspage() is static with a single caller,
> single-caller inlining under CONFIG_AUTOFDO_CLANG (e.g. with
> CONFIG_ZSMALLOC=m) inlines alloc_zspage() into zs_malloc(), growing it
> from 254 to 691 instructions.
> 
> Mark obj_malloc() and obj_free() __always_inline and mark alloc_zspage()
> noinline to keep the fast path inline and the slow-path page allocation
> out-of-line.

I suppose there is performance benefit?

I guess I don't mind in principle, one thing to note is that this conflicts
with [1].

[1] https://lore.kernel.org/linux-kernel/20261105044752.1997895-1-senozhatsky@chromium.org
