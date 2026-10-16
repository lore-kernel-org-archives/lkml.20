Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C5B483BC0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146900; cv=none; b=cDBno6vUMYXCxP9mdllekZ7UBe7HL88pEcP9YVLTBCpbwR/SeOmdVRV9jD7768XLHrk38iubs6/zVQaR79U8k5tyP8D5r1uULKp49SeNLfMnWpe71wXuivpieE+smwj3c1k6aAG/FB/sKUG9L0y6GmlnMsxr2sq8aNDhVyzw6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146900; c=relaxed/simple;
	bh=1UJk2cXtDpU5Tf17byKlHtWDaHy883nGoAa8Twsmlx4=;
	h=From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=VCdaOMTPia3W2dsNh0OEnmGJQ9pskBRbvEFfHG7FLvsQRamLqhf0jHZTn7GoEzrMOcfKkAveiqVlMQlwqyLW/jhyppbgv7PBgoarmqzOmKHGusyWBhWTIm191Gyr1aGA4+3+R7VxQH8zVfy5cCK51BuZuydLHgeP9Zj0xMgp6ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwX0Ni48; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwX0Ni48"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso15620655ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146895; x=1792751695; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UJk2cXtDpU5Tf17byKlHtWDaHy883nGoAa8Twsmlx4=;
        b=TwX0Ni48b5DuUjTokLpCRs8Cqtgr1KW7laZ+TaLItWx9rRgQiqSISolemOia6B48RW
         fiwFUGfyMTvTOQh6Ymjkpsu2UrdxPd9JE6seL2l3LN9Gw/ZxreyqaTri9kWuBYrqvLLA
         Rhcza6iXQGI55KfY/XD7Oy8NohUi8v8nW3aHy86ULrBcxFthcfztUpbyDRTH3Kg4jiQl
         PYrjvh3G3wtfNNzT4JAUN/f832CpgNEpanESjXgoGKSyIkHDIY5nW4YQmzUGEIIbUQBP
         fTfpgkjY37DDoKIxAlpnogWbg5vXn6OpHRldYZmB1tXhSUWco1N4ctEaR8zJdJpjxhHx
         8cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146895; x=1792751695;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UJk2cXtDpU5Tf17byKlHtWDaHy883nGoAa8Twsmlx4=;
        b=yxXK9NNa9RK+5x4aweGHNS5rmiTPR7EIHGGNwsKBqv48CctST2FSyOFZ4Hqy/wFe0W
         9hhG9N1ZR/hR7v3cNd86fQa1TzgZN8ZQF+avhGNHGU+gFK9qXhaG4yspnPKji2vkUTNu
         vABVO7j+Opoi1z7IMHYy/AUdQ4RTqKfHyXaa3v/RKevXnmkI7iy8HOeFWh2X0dHyXPXy
         xKT/euuV19Ae2dqZhUXzBq1h1fi8DpVPQ3tdGJGMH6f7P9u0rAnOerqS+y5I9PmN2BsE
         fl2t3olvaFwdzi4zxXQOzrxzxQ9j7WsNq9G5ycGF1KOM5BtDfAVg/70wXLXMeTQx2WjD
         p1yw==
X-Forwarded-Encrypted: i=1; AKwUvBzY0p29JNo1y+kmaTqaymnPNbxiZJ7A4GsvhxmHD6bOHEoTUk8LYuvjWCbl1Lnk7uOruE3ol2GN0tzDU40=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXkO68v+I3I5/Y9JSkue8HJlJDzfH5GyCXDBo/dNVNy7nL2dau
	3NjKWnzFeiZbaiknHQzb8gpTChTWqtGEqCMh9+xoj6wpPrSfsKPpwR0i
X-Gm-Gg: AYBFou1BF5jrDPRfEG9dPlGqJh/efpUaQ5SUipZjT3aNPYpwgyzFWxtQVYjfDPbKBob
	TMEtxDrbsL2mG6/nkc5NfTMg9HIJIglbhjC2alh2r0m9661DvcguU/7eQesyetBNxFRj2FMcJJI
	MuGzR68aBFKClYbsKJzGel/idBsSgSsbo4to1tR4exOQRb5oJG7FC5W5FXj3BR+fGRr0mY8XqZi
	wsAV2fJ04wbrfiEDxCk34H25EUgjaOkUzAAsEFhjuQlAA/iAlwuGoMZTYmOqABfhHUq0+BC6/oh
	2s6AyHhqZd+Ax8DVFguHyocnDjPGxMe7G46DYMS4avLO6SqEQVOevVk3qYodFt0CLa68APPTev4
	eqNrKSDI6LgL5TtMslkcGyY3Q53B+5ThzkUVinLFiU6sYV9/qJX6xXWdXdNY0yL62AFZcfCDVX0
	/+5C7bfPIxD9xrTydHkK+4HEesIo3GzKDRbATjsOm7O7jjWFfzm/b8h9sEsQSxMJnFtdR6zVp0o
	+IcT9en5+PcoJlQIbxTjZBwbNlbdF0x
X-Received: by 2002:a17:902:f601:b0:2e9:5772:9ab2 with SMTP id d9443c01a7336-2e95772a81fmr57548795ad.41.1792146895099;
        Fri, 16 Oct 2026 03:34:55 -0700 (PDT)
Received: from [172.20.10.4] ([183.137.20.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e87891bsm8239915ad.48.2026.10.16.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:54 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/damon/stat: avoid 32-bit overflow in idle percentiles
In-Reply-To: <20261016002130.113813-1-sj@kernel.org>
References: <179207592479.3.11595453180868898703@gmail.com>
 <20261016002130.113813-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Fri, 16 Oct 2026 17:22:58 +0800
Message-ID: <179214257862.2.17756454862637555633@gmail.com>

Hi SJ,

On Thu, Oct 15, 2026 at 05:21:29PM -0700, SJ Park wrote:
> This patch is sent as a followup of your previous bug report, right?
> Unless it is very urgent, please make sure the previous discussion is
> completed before making a followup action like sending this patch. As a
> rule of thumb for DAMON, I'd suggest waiting for ~10 hours after the last
> comment on the thread.

The patch was already prepared and additional tests were underway when
your reply to the bug report arrived, so I went ahead and sent it.
I'll leave more time for discussion before sending follow-up patches.

> What is 38?

38 individual VM runs, forming 19 before/after pairs. The 20 same-image
runs formed 10 control pairs.

> Do you have a plan to run more tests to be able to tell that?

I've run longer VM tests, but even same-kernel runs vary substantially,
so the overall patch effect remains unclear. In a fixed-input 32-bit
userspace test with 10 regions over 256 MiB, the median increase was
227 ns/call (+42%). The old code updated 15 entries, versus 101 with the
fix. I haven't separated the extra updates from arithmetic cost.
Maybe we could record region counts and sizes alongside VM timings to
check whether both versions are doing comparable work.

> Any reason to use div64_ul() instead of div_u64()?

total_sz is unsigned long. div_u64() would truncate its divisor on 64-bit
systems if it exceeds U32_MAX. div64_ul() preserves that width and maps
to div_u64() on 32-bit.

Thanks,
Aveline Noir
