Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246036;
	b=BW2bozFVATX03JPd6ws58h5qApoMidmDbsayE/twaAr5hdF6e0RPz1VJ7hNbwowJEXhf
	 QVOED6A6kCYMBhB8D2UP7GuUHjfe0bo6Xo51MkLg5v7AkelC5H+yJNGT5M4sL3OJibCaG
	 wRvpAfgvLzXz9cKtHoaLASD81JV9NC2NDF58ft6Y8oZ1q5P/Ca3Qhxs25lgeCCqV2JcwF
	 zWYazkxwsQ0wYaSxK05Pa7pyOJ6fmpVDDNuXLPEmrF8xJFPSPwClYjEo7SI4t4RURj8Wn
	 WGirBQz5XAyYV0GSJyrd/gm0j+g7k3fQts14gV/4pGXNemOY5qF8NTaRZn6UhYUXgJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+ahcXpVCd20F2a+G4V5LP2pky9vopGhw75vYoQmoXKw=;
	b=V542kPkdBaKm6b/q5jndR62YYvIfF0SLLgfmM95ItRSm7nRI/rXlqf9mu4QoO2/ykH/P
	 r91XkwhTfYvwgz4LRB0GsjsEusv8fA8xkllxuVFkvRQOK9jTlp2CQWnIqTJqvrxDLJvlo
	 jsQn8I+0CP8Lf9i0UYpfS/O8YXthRem2jFpVcsWCQy7kcyAc1rl+/l1tXUy+Ba7SO3SgY
	 rdRIbuV80Px3+i8isjmRbkXIUBhciRMbTC1dLbK16ubUNmJ/x0fZO+wbQk/OhIqgUjXf6
	 +/Cj7KrmgM1VaOFyLYpFhw3/RI9SEeKYh8OAR8zE/Pw2VPcfeSEa0sjF+VDJVTf1W6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p4dmI1LJ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D13606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D13606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p4dmI1LJ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1017991eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794246034; x=1794850834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ahcXpVCd20F2a+G4V5LP2pky9vopGhw75vYoQmoXKw=;
        b=p4dmI1LJPNk5jQiwEZao3oY2TlPt01k3t0JJ7G8MddtvRCBswZ3PC4M0Gk+pAQoZHc
         dvyLa+pu5Fz/N73NCy1oc+mybufkzHSxUV7uHwKGKBqe7bkzjJCbHyUWib47n0Xr8+yo
         ow0QOtsBA/ZtIe2wAAH3OGN+UiIT5w2oapbGSW+V26MSB8tcYrZR1JgSnL82JF6jIz1c
         p+Ajt7iJhL0bxOvW/yt3fsc11Fi8oXMbXfVwIEZPul11kO9OwtX0Ov2Om0n1GRuY7bdJ
         4AjSD7ydPjCyqfkePqfa15c0apxPxRkOk8oG8e5V1ry20OqPvjbZSwH6K0y1DMjqj9Op
         uprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246034; x=1794850834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ahcXpVCd20F2a+G4V5LP2pky9vopGhw75vYoQmoXKw=;
        b=DrCFtuBKvtOKwp9SE0iq1VXuuhVvVCIycGo5dtcDU4KIIBDA29zdCB9AwZrvo/5VCW
         +xoBlVqLzt063CkoQEChFiudkvj0j2OeB/me2H0QWWfwOaU709fSULeWFe2Zf4A0Z+97
         AJrRaqxx4UQNJo1AyNOnEfpeEHNjiqbj1qH204qok8QuGEebY6dB2blFnAz8RAYddAOk
         UFD1RCGotUMH7Dg5rd/KtPSDhOIhQoVEM4BJh+k13Yo+U23F//wuluu7DjtDUq3oaPsr
         jeNH7cvz7+AVAvwsBrsh+ADwhFbjqnFElvgZ4+3cAPHd6b1qqSlfe8eYVo6OfyEDTYop
         crAA==
X-Forwarded-Encrypted: i=1; AL+hErHiJLtORxaTx4/kmF6Gr0gzpaeoPdEvt+vv0ocCYaRwD+k3U+pD6qjPFH8iEgOmEEbJsNyVJ+Gvy8gG3q0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mSzJ/F1xHY6powoPj2fTqwuVGL7BDsjEbZ8WuNTxJgoaGe/Mz
	No+zaaSsAugebG8CerxY4rli+Xwx5HT5QLzdnRA7dt5I7P4ZA5v/zXjzYrxAzoekBs8=
X-Gm-Gg: AYBFou2xUeI0h9krOla2wmN76RZG+28n58MwRJh5TrEEA3ykV5B5yNM32NZVydUgaO4
	LSRONFl/zIW6VVu3t20VK2z2mZ40hl5xT7nDH/YAnVXZFHR1Ja85pop6y+H/IogoBdjFLMdyV6U
	6z2MVG9NkmYhjuCkuBRAK9XgDBzt6xmuel0M0liVqGKYroSyiygQ8jz9CIH7sDUAuiUjVeG58Os
	N9Z9AhtJ9Ee1cNvmu0UBse/0aKul337lB3/JxQMWkPGxF+vTaDPKaaAOkKNZeYEAkmOEHnsJpKk
	ycwK0MKBh6lBTSIA8byVchSU2qj0QZe7mqFCw17QF/kiMfhpsvg94eIDFLbKEETjZywpUhTXaFu
	nhI7xrH7neVFPuD+0ZEvlkra1GXkqro1a6jkfzwWODGET/32IncWi7xnUiezpEee6BEssUeTsB4
	brY9b0nsmzo9qobqDWWlrSKM6yruAua+w/ICHMT4tzmq30ZEvnXUQPkxmETbSJANxrvmyHFvBOP
	gojkh+MAHxquwHWTV8rCWQYtIlt4xURb4t6OS7QqRWeZ7TEKIOP9Qh0S5aPzN+HD+vr8cYYqHBF
	Vaj6M9zYWQ60bHpSfx8/chuHQizGBzpv/TJkPBihTqW/x8t5dUiRd9GSy6Z+zyrEL8Fwn3hPR8B
	M47SVuqjoZyw=
X-Received: by 2002:a05:7300:87:b0:361:7ab9:479d with SMTP id 5a478bee46e88-3725e34086amr7318366eec.27.1794246034049;
        Mon, 09 Nov 2026 09:40:34 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d48bdsm23580324eec.28.2026.11.09.09.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:40:33 -0800 (PST)
Message-ID: <4d67e54e-8076-4c91-9c26-0b79d478f590@kernel.dk>
Date: Mon, 9 Nov 2026 10:40:32 -0700
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
Subject: Re: [PATCH 0/7] drbd: preparation for DRBD 9
To: Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars@linbit.com>, drbd-dev@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>
References: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
 <avIA1j2pX46pzOr0@linbit.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <avIA1j2pX46pzOr0@linbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 10:22 AM, Christoph Böhmwalder wrote:
> On Wed, Sep 23, 2026 at 04:06:01PM +0200, Christoph Böhmwalder wrote:
>> This series contains preparatory changes for bringing DRBD 9 upstream.
>> Each patch moves a piece of the in-tree DRBD 8.4 code to the form it
>> has in the out-of-tree DRBD 9 code. Doing these steps separately and
>> up front keeps them out of the much larger rework that follows, so
>> that rework shows only what DRBD 9 actually changes.
>>
>> The patches are a file rename, comment and internal cleanups, and two
>> higher configuration maximums. Defaults are unchanged, all existing
>> configurations remain valid, and apart from those limits only the
>> wording of some log messages is visible to userspace.
>>
>> Christoph Böhmwalder (7):
>>  drbd: rename drbd_worker.c to drbd_sender.c
>>  drbd: modernize the file header comments
>>  drbd: raise the socket buffer size limits to 128 MiB
>>  drbd: raise the maximum resync rate to 8 GiB/s
>>  drbd: replace the drbd_interval bitfields with a type and flags
>>  drbd: move the packet name table to drbd_strings.c
>>  drbd: rate limit log messages per object
>>
>> drivers/block/drbd/Makefile                   |   2 +-
>> drivers/block/drbd/drbd_actlog.c              |  16 +-
>> drivers/block/drbd/drbd_bitmap.c              |  18 +-
>> drivers/block/drbd/drbd_debugfs.c             |   4 +
>> drivers/block/drbd/drbd_debugfs.h             |   4 +
>> drivers/block/drbd/drbd_int.h                 |  59 +++-
>> drivers/block/drbd/drbd_interval.c            |   4 +
>> drivers/block/drbd/drbd_interval.h            |  55 +++-
>> drivers/block/drbd/drbd_main.c                | 106 ++------
>> drivers/block/drbd/drbd_nl.c                  |  15 +-
>> drivers/block/drbd/drbd_polymorph_printk.h    | 256 ++++++++++++------
>> drivers/block/drbd/drbd_proc.c                |  10 +-
>> drivers/block/drbd/drbd_protocol.h            |   4 +
>> drivers/block/drbd/drbd_receiver.c            |  61 +++--
>> drivers/block/drbd/drbd_req.c                 |  40 ++-
>> drivers/block/drbd/drbd_req.h                 |  12 +-
>> .../drbd/{drbd_worker.c => drbd_sender.c}     |  42 ++-
>> drivers/block/drbd/drbd_state.c               |  15 +-
>> drivers/block/drbd/drbd_strings.c             | 138 ++++++++--
>> drivers/block/drbd/drbd_strings.h             |  27 +-
>> drivers/block/drbd/drbd_vli.h                 |  12 +-
>> include/uapi/linux/drbd.h                     |  12 +-
>> include/uapi/linux/drbd_limits.h              |  12 +-
>> 23 files changed, 534 insertions(+), 390 deletions(-)
>> rename drivers/block/drbd/{drbd_worker.c => drbd_sender.c} (98%)
>>
>>
>> base-commit: 85bffad4d2fea373a72d68bed8012e8cbccb8ee7
>> -- 
>> 2.55.0
>>
> 
> Hi Jens,
> 
> this never got a reply, and neither did the subsequent v2 drbd rework series
> that's based on it [1].
> I think this should still apply to 7.5, would you mind queueing it up?
> 
> Thanks,
> Christoph
> 
> [1] https://lore.kernel.org/linux-block/20261006154607.3936501-1-christoph.boehmwalder@linbit.com/

Queued up now, v2 doesn't apply anymore fwiw.

-- 
Jens Axboe

