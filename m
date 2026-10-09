Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA054E77E2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555716; cv=pass; b=FTf0H5xgo24DyO1BgcLxt0aBuTPw4JApbercmgVrN1SUWleE9cL6aB8Bdmzr02V0UMWLE+ZXL+Ckac8WLMelDTYvoRIcpUUfY8za6mHRfre5fQCz7VPGppFuHkPlshCdTvqLx5cLOEQIm7cLEm+or3gSLSmhLpMmZuHatrIM0NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555716; c=relaxed/simple;
	bh=30eMmtxo9dZdwlJ3E6z4UwQCm88BiouFKOwsHyXsVEg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TRLgP4headiJnVFO7gGpUlYxwrLt30NrZ+ypZ061C4oYPE/MEf+YNEdH0JRV/74NnW6xiNdK0x3G572bHGKtH4apaqk1dfU/gsA4dFUH1lAdhqrAeooHMaERmOy6mK12HUysGXRgP62OuOAxNdynEk/X0CWMWiXASBLpDOBcpzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY+D3gQr; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY+D3gQr"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso5170143a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791555713; cv=none;
        d=google.com; s=arc-20260327;
        b=JDsoFSvadCkfDxk57dPWEyW1y1WBE0L62Kh1jef+CKK2qZ8k0XuOqG1Hp7B63O8UCx
         22t593F5Gn07y4pKlKcjs4TNXNRHO6+tLtrmA8T2QjWcYH+IKaJvstP46/yLcgmrwzaf
         Lse7Gv7rG6Bcab2qkdCTTNwaI6ASpycmqzW1U20Jwb19hZd1ldo7a16Te7c/9JvpBXDU
         MBMMptwMXhT3J6xYdPYJGFuwH+vCIdOH7csFzBElvK7TqtMyB9MhQGO/tRLlgPDwuLTr
         pkkoUKzbcfo6JiOpH3jRde1KttRQ+ZE/7zm31GxKAuUdAUppi3Dp+dXW8BcYa0LlKFgF
         /BqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=R5SiVnaUQQN34hVlYPHW4REpkY55paPFDk59rozrL+o=;
        fh=imkOmcD/YKc6Hu2zhteeUssXffNVd5ObwqYEvPztow8=;
        b=qeK7tli0c3gbm829iomz8OeIkdgE0Y7wtr4iqvAK7ZSGvl0lIpvxVOmNGUG2JeEENF
         ALKZ8W8BgAgKPgaNfIPB81W/2wCQqz6XYdDROb8Yv7EoknqkxrDfPh93k0KSy0rsPTrJ
         UtMbJN1j9+Xkc6PTvpuXOIippo7yvGx/HxWEYRcKQqzfSB6GCIKQT3X3TE3KSDw4lm9l
         X0F/Z+M8ByxlMZdkgS9Opy9qxP5ShxRqCDuGbYBJoHlKypB508raGOXr3dq0qLVc6rPg
         yFGc4F+yi4YLLuAIELjSsd9vsG/O51igGTR0kUN2Tsy9w0TP2JkpaVgiY6WTiX1AJ19u
         svrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791555713; x=1792160513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5SiVnaUQQN34hVlYPHW4REpkY55paPFDk59rozrL+o=;
        b=YY+D3gQrC+336SpGwPsxLOFGXQY/22sAb16i0oZXkhbu2hWoMaJiBtQcVQW31RA8oO
         A+tjU04kf6EDmmIfO9bxCQIF6jXwXfYfc4uBt6m98cmnIliyqA2ulBIBVad63AMKI/zY
         6iXZL0moiOvhI/Oo9cZuT0+kZeu+ixziAoeDxzBjT9wvN4Sbw3ka3cXneqvjiIoFPcEG
         Hr/xc0wGHGnofsAlfuhcaZ6t1NYEbTAWp5p+3FdIMEmrX2OPjkna7RI92sXX7PPbW6rU
         7NWR5ImfLBdI725E9B8TOVvyWQ62GSTlViBrgudFX4JcEoTXM1s5aedeoJZ91qzqXIWV
         VXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555713; x=1792160513;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R5SiVnaUQQN34hVlYPHW4REpkY55paPFDk59rozrL+o=;
        b=D1wS2jWQBlUSb8uE4a3HZGQSAJlVw92CXKt8atVMmYdVCAaiohYVv9mW/BS+CL0MPd
         cxlgW5CbTGUCzkXDFwce15WJfNj68/IIkzBdFR4WzrJ09vm6D+mVpcnOlAnRbscJ9PO8
         DC8N7XdgzBnzIetTwvJ7iXhAij/eQ8pEgORLRb0KzUrL4AI64DqJOGdKGHxhBOEH8XSw
         5fdxZGmp+d2dvlu6gypOX7Pln7ab+2PRBQU0rNS1jgP+CWN/AEh4CDe/tqehypnnTt2t
         f9ZkqsKGRm9abUT3dt9F0Pv2tF7uboJ+C7U9KzoyGXteUK68/24JmCdTW8Zl75zCfI1A
         MmWA==
X-Forwarded-Encrypted: i=1; AKwUvBz4/nTtciooE561gpuSR5wNn8WJbmXzIj8sI/kKDY5/98/uo2A9iyjUiKuxkHJEEx5tIZPw1J8ERmho6WI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqC4lJospTLQ03J9s8KCiQzmNfhujphgWVIZvoLnIcgVJ6AV7M
	awik5uHIYZ5J67aMxdeaQs0J4GbcbmGPdGWvvPtVWzD4xSBWT2Pc+kQLi4lP56knH0p0IkbioLK
	sSRY0H7PmeL1K/AWk73/URXTcRFzpVns=
X-Gm-Gg: AYBFou2iFVFSuczhXjJ7D4mYxRpjdNfGojKLVLWtipEef2uhQ0zjz4JjbBkfCHwhFqM
	cDOGj317HOWYOK2ciTyLsJ4SxD0pbuL6e7jKml28EoW6hmlCjlMZcbGtEyHh+8c8tVIzsKZt+Sd
	On1OFxhojUWzi3T9rf1ftHpb1/I3ntx3NuR1r/QyEfgPg0I+hxgxuWNYfTDfDf1sc9dfG/KNFzE
	haP27IeUAhuCzsnb5ReNe4jVHyP2zAieIXs7YPLbr2q/4JWYrlZPB/rS7xKZfQuNq/nsYfodILB
	0N3xtucVJA8BHMB9O+HZHlQyk+9HdYzIgYztlUyCbk5O90eqhKQpI6EH00tUhvPjlhKPWoGK
X-Received: by 2002:a05:6402:254e:b0:6aa:b39e:f794 with SMTP id
 4fb4d7f45d1cf-6b17c28fedemr1748598a12.42.1791555712392; Fri, 09 Oct 2026
 07:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Date: Fri, 9 Oct 2026 16:21:40 +0200
X-Gm-Features: AclHuK-62QwvTT56LJQI5jAhTvpHHwM53Qctdf4WmrpYFSOHVx_FT6G7Rry0i7g
Message-ID: <CAAFOosa2WLf--T17cujJu5CUsN12NNjgTitOvno2LY7jAr1gfw@mail.gmail.com>
Subject: [RFC] seqlz: a compressor for zram, between lz4 and zstd
To: Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>
Cc: linux-mm@kvack.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sergey, Minchan,

I wrote a compressor only for zram's pages, as a personal project of
mine. Before I send patches I'd like to know if you would consider a new
algorithm for zram at all. Much of the code was written with an AI
coding assistant, with me deciding the design and checking the results.

seqlz stores pages almost as small as zstd and swaps them in close to
lz4. On a Xiaomi Mi 9T with its own Linux 4.14, seqlz as a module,
20 000 pages from the phone's zram, the whole page fault per page:

          bytes/page   swap-in warm, A76 / A55   swap-out, A76 / A55
  lz4        1300          5.3 / 16.2 us        10.3 /  31.2 us
  lzo        1216          6.4 / 17.4           11.2 /  33.9
  zstd 3      898         16.9 / 47.5           34.7 / 133
  seqlz       935          6.0 / 17.9           12.4 /  38.8

So 28% fewer bytes than lz4 and 4% more than zstd. Swap-in is 11% to
13% slower than lz4 warm and 17% to 25% cold, swap-out 20% to 24%
slower. With 25 apps launched in turn, 1.5 GiB locked away and the same
disksize for all, seqlz had 3 cold launches in 3 runs, lz4 24 and zstd
6. With the disksize scaled so that each algorithm gets the same RAM,
lz4 had 54 cold launches in 3 runs and seqlz none.

It is LZ with Huffman coding, but with static tables that are part of
the format, so a page carries no tables. It needs less work memory per
CPU than lz4. The format is written down, and a second decoder written
from that description alone was fuzzed against the real one for over a
billion inputs without a difference.

The backend works on your series of 5th October, "zram: redesign zcomp
and rework backends", applied to mm-unstable at fb0fbeb37, and on
mainline without it (986c24e0fe44). Under KASAN and lockdep it swapped
12.7 million pages on the tree with your series, and 34.9 million on
mainline with UBSan too, preempt=full and lazy, no report and no page
that came back different. The zram selftests pass, and there are KUnit
tests.

What I don't know yet: the phone numbers are from 4.14 only, I have no
rooted phone with a current kernel. With 16 KiB pages seqlz needs more
work memory per CPU than lz4.

My questions:

1. Would you consider a new algorithm for zram, next to lz4, lzo-rle
   and zstd?
2. You wrote in March that zcomp will move to the acomp API [1], and
   your series of October reworks zcomp instead. Should seqlz come as a
   zram backend on top of that series, or as an acomp algorithm?
3. What would you want to see measured to decide?

The code, the format and all measurements are at
https://github.com/martinus/quetschn

Thanks,
Martin

[1] https://lore.kernel.org/r/aa9tz-EIh7kOF3RM@google.com
