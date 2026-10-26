Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793051106;
	b=IFrsFQ7hm+BvMFy7lY/gLiZ4Zr6QaxclFfKBQlGsUC8p0a4bXhWQEPHy+/1C/r4K6bAV
	 8GyFeSGsLY0YCpn149w4Ki+CTU9Sy9Q1QLUyaWcnNZV2lK8pv7H93rtUXanH+zG/2Uf36
	 CkhFO8yrcQnclDk1f99/6jaDixEJIrP8z2QHDe5OfI2U/Pzy+3Laa8BPxTTCwk2cgBfsq
	 m8iPPFfR6P9KghL7pZFsXECeIwx+T76wG7R49tnFGhNsNG98jNh5mxz2DvIX3kdFf3Yqp
	 o4J5yLM6XBJdr/zSxpspbEPQTBqsRfuigxCNh2AlLQJi8/xSQwwsrWtWRdBkjCWP0cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
	b=4gZVnEVVVdoS0rb48j73Ucl4F62sFpFAYypJ0Kk+A9+Bkz62dBjGF9laeoMGErOpsQzj
	 thJ8nRpR0MKObXM6VsEtczWfhjeBWCyXKhjdJ9iD3PWhu0floyiSuUkP6dVwv6wXsXwiO
	 sMSHQJ1coqsXh+RD4MMkWdQUVsG2PrM+Kx6ZVf+zUsEj/X+p9PcWQ9eyGF5L72TjYDwx8
	 DY0M6lJNJxTpcsKFnYfUNl63jtDonPKEcN+jLf/tbuALZEPNqsnK0RsVvtV6dVCYncuWR
	 zS85PmlBFzprsmxZap0l0S8OuDAgfefKbKa6YOG4RmTg342hepcv2IOx+58+YTcpdZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="cPl7BAV/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67026606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67026606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cPl7BAV/
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba328513b9so2730652e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793051104; cv=none;
        d=google.com; s=arc-20260327;
        b=UldS/sryt46fzF3bTwSRccfw8O+RS40xj5dmBqQSdRxG7MxXWELTL3UHrYIGnVBtZk
         mBHn53AAC/GQMO5gMnlzIHx4NkCwfezoL4epzNcCnkdpLzJCiTLuLOs0cB4yH9Ymq70o
         OuGyzNmm6uwOBLPNrzoKWzEsww6u4We0kjC8nQy4M+6jZeB4UL4j8VmKZWateHrI2MR7
         WPg6ts0yKPNk41obriiVEl+3k7z8zSesoXiiCx42OtmLHHuOZV3FVsLPhLODrbPy9Cum
         Ni53qfsNX5xP7eO3Q5zUjzoEqyKsjCzC67j2eg3KynV9JkoXT0En/KISjaH04J8FKrYL
         tsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
        fh=Cz7YPKMcrbJpy1itFOu7SspPRHVft5s2+NuVg89sU2Q=;
        b=L1jK+zMPzEuD4vSAIAwJiCRMK/QPrDIPqzjPptM0xsB0jkNU7iQ4QzsnpTCfpdLuq6
         CFS/8vHHazcEl8ZLcNnZ3GWcOhUEXABnHZ1YcgKR2ScM1i8F3P0PCUO9EjcrJJp8EbYV
         g+3lZwl7l8aqLb4B/5VxqvFpdW2rS9tV9Q2kICnVhJbhbttGvE2jR4ogugEEXmJxXb76
         I14MgjW9Mhks1gCbh3Tqz1CpwWs8clbVOFmUWsXaWihShksE1Kl6ZKvXWHkleNOSFwA0
         NmaG6+KY1Hv56nNca2+Logkn/M8vtDUjdgqGu/f38/6MaYSLuEjgqhAoIK7xKbHapTtb
         zjAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051104; x=1793655904; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
        b=cPl7BAV/EQ44x7OQoitBw7m+OVC9E66/NZNcin4y+oWs83ZmQ79/4A0oi/9sQineRh
         AH7anqMyhEmvtu7T727k452z3UK5baGS3lqH22b6juVITOEzoRCvZp+ba3+mP0K/1rbu
         dDS/WUnvUKHZHy88Bz5BClTQLVRz7LV1tnUgcAn7xhEXswOIZags0GlRm423a8txjywv
         XBZeYG3VFbgIzPz+YIZR4d931Ava+TYCURGkhkHHGxzYPUL6z/cA5sKAIAADzn7Xv2e6
         DkPM1Nt0UboWyviyxsNn2ZMLJ7EhuquMAXSsOWkPgsS4lMzHGAkELfk036iSlfluV4Ea
         Hv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051104; x=1793655904;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RcfvlemgCTZlIBY/k2jUOT8Q1Nv2+ZFBdkrs4l7Ures=;
        b=EPdUn13J4yDlEH+nGJZ0lGVWD3iG3jNzLICxVm0XUocNmfFGzJXLetxv8rPl4tjB7p
         NBJH5pZL3b6cpXGBbjPX/11qONMifTQOCkEYEp13lCtPsD20Gy+m/iUrwUWcPV4lmgj4
         Yb2LufWbCWgYfJohtB5GqmB7F6gsS6uMapkVP5w8tDpVs3ZOVpOfQ62wnKFeJVqFtJnT
         rgR6AXHnblqc49mUNSrzwrxG0d70K6A5MhFsIYEAIIrgeqXC8DoGsYtlGcWhDjtJlMlu
         oS/hL96dJJezYDsyuStimlGo+LvciQp0KFErwPCiJM1uk8KukgepNMeGUYeXt0PGgmcV
         XnRA==
X-Forwarded-Encrypted: i=1; AKwUvBwIbEVExxhow6+iWYUq04LAfBZkYnv0U+x/bkdECBdEm9W4UCGUMluPMgXSwvGZHoHXzwAqrm9JLZ+AmcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlCTO31CvIIa2/cSCA1P+18LZu86mEnvNCl0iyr3KMr24BarUc
	ggD2yD8rHYKHaBP2lW21I9ziOrVy6DENWGUqQk1dxep8HI47QklClHurBxJsL8+4k/PONP9gwsy
	m9VZYS/wc1CpbLIDEXvpYQbAMNm31QpA=
X-Gm-Gg: AYBFou2x12fZ6Cu2VPKK1XOU+M5y/pwCnrhuK9YvlgZrgtPWdGWTxJfNPETnoJLE6PJ
	I4jFKzh2/kpzaAApraka4ZchzCS2DKxFWSp9d+bFV2r6yz2sblYFQylNbqRUkuyI2dsInVqD7M2
	PRg1P4PwAg/qkZrcH/s5kOp3pjTz4GVR6yb8vk1rg+AgAZhj6mKRxXkJiVv2XibWHh07ykeIKAE
	DJF6KUEcSFDVgSwBGuO/O4jF9cso3J4e1j6tPB19B1CR2zrjsUHwGlO0J/0w0gm+MJCZSqZOx1X
	QwMLKQpBeYg6eBij7B4091K6gWeb9XiHfZFU52EiIJmyF1kjUTx8MuN9y/gNHjBYhBBJ8bM/WEQ
	zGQEG1vzMi4kgMcayKr2mBx5hpscBi4DnQFm5K0r2Jty5tmsA567jXG7GsNQyeESV3Baxkg7q/o
	RlLH+Y42Mv7tKnIoyC
X-Received: by 2002:a05:6512:39c7:b0:5bf:b14f:beb6 with SMTP id
 2adb3069b0e04-5bfb71ceab6mr2640493e87.55.1793051104260; Mon, 26 Oct 2026
 14:45:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230159.834954-1-mrwillporter@gmail.com> <at-dpPOGs2zD2fuL@khmer.arcnet>
In-Reply-To: <at-dpPOGs2zD2fuL@khmer.arcnet>
From: Will Porter <mrwillporter@gmail.com>
Date: Mon, 26 Oct 2026 16:44:50 -0500
X-Gm-Features: AclHuK9tUQE0tf_YAoVLwJma_OAqCZzGDMvFDjxOPoIp64S0vvpQ1r31I3IqvTw
Message-ID: <CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Andrews <neil@androos.io>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Mon, Oct 26, 2026 at 07:36:24PM +0100, Christian Ruppert wrote:
> I took a look at this question and it seems like we can share the majority
> of code in the EVO driver by complementing it with the following features:
> - variable width read/write
> - caching of write-only values
> - enum data type

Thanks for looking into this so closely, and for the fixes. I like
the idea of one driver, and I'd like to find out whether the iD line fits.

Your TLV in patch 4/4 is the same one I use for the iD14 matrix: same
unit 0x3C, s16 in 1/256 dB, -128 to +6 dB. That made me wonder whether
the iD14 matrix could use your MIXER type almost as it is. Its channel
number is input * 4 + output, so Main L/R and Cue L/R of each input
are adjacent, like your stereo pairs. Could we expose it as 28
controls with two values each, rather than my 56 single-value ones?
An input's level and pan in a mix set its L and R values together,
so a pair seems a natural fit. Does that look right to you?

> The only part which seems more problematic is probably FU12 which looks
> like it requires some custom logic and would still need actual code.

Agreed. I'd keep FU 12 as its own code.

A few questions about the rest:

1. Read before write. As I understand it, the put handlers in
   mixer_evo.c read the value first to see if it changed. On the iD14,
   GET stalls for mic boost, input polarity, optical mode and the iD
   key function, so a put that reads first would fail there. Talkback
   source always reads 0, so a read would hide real changes. Could
   these write-only controls skip GET in both get and put, with get
   returning the cached value? And could every put still send the
   value, even when it matches the cache, so that "alsactl restore"
   reaches a device that was reset?

2. The cache. My driver writes a known value at probe (off or none,
   and for optical mode its measured power-on mode, S/PDIF) and
   updates the cache only after a full-length write. If the probe
   write fails, an enum reads "Unknown" and a switch reads off. Would
   that approach work for you?

3. Control entries. The iD14 table uses 16 unit/selector pairs and
   explicit control names, such as "Main Out L Source Playback Enum".
   It also needs volumes in 1 dB steps (0..128, stored as s16
   1/256 dB), a boost switch that writes 0x0a00 for on, and enums
   that map items to device values, plus an "Other" item that only
   get reports, for values outside the list. Would it make sense to
   move the unit, selector and an optional full name into each control
   entry, and add the new value formats (1 dB volumes, boost, enum)
   as ctypes? Or would you structure it differently?

4. Checks. My helper returns -EIO on a short read or write, before
   it decodes a value or updates the cache. My matrix put also rejects
   values outside -128..+6 dB, and get clamps what it reads back.
   Could the shared code keep these checks?

I don't have a firm view yet on which way is better. If the iD14
fits the table without many special cases, one driver seems clearly
worth it. If it needs a lot of per-device branches, two smaller files
might be easier to read and review. What do you think, now that you
have seen what the iD14 needs?

If we do combine them, the order I imagined is: your four fixes first,
then the rename to Audient, then the generic changes, then the iD14
tables on top as v2 of my series.

In that case, would you prefer to do the rename and the generic part
yourself? The rename would also touch MAINTAINERS; how would you like
to handle review of the iD14 parts? I can write the iD14 parts and
test them on my MkI. I don't have an EVO 4, so would you be able to
test that side? And which base should I work against, sound for-next
once your fixes are in? I'm also not sure how a combined change
should reach Takashi: as one series, or as two with a stated
dependency.

Thanks,
Will
