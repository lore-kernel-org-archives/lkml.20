Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283830;
	b=R9tN8HgD7+Rc5pREzT8ovmxKkjFhwjj1cZqFcPPoUHCPiaDtSPAYbzvpPpovFeA7sfVB
	 bDVAlNpEUZwjV8zrpt5tTo98NoeN7asSrSWxJzHAc1qjIaOd+pJnd+9+20O8UX1XLWhKb
	 3R3OoznpANVcVQ1mRNQf/jmvUYq2klpMQEu53LXtG69z2hZ1vDRihtVpR2jza9nhXb/wo
	 8RgOFrao7T7mlbqP8dVjp78/hl8c/qc3euugGN8E8rW2kQ/2Z9BkOhkt+dkOO1wOvEbb+
	 POsVnbINZuDYQJftkcYr4BwR3KTW1BDAh95QajCv2RH9onmegnUMFxAt20YnkPYTmdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=JJb2/HmhBTTuuyxE/cFYx3WSBj9uBlfuHJGXiko2698=;
	b=nkQdS2YaDr74oF9/vaXZEGAXGaHdDNzOWrx5U3ZedwsMJ2gy9Cou2D/hYcAQJ8FyzZ+6
	 p8oPIH007ku9fcqftjX0HjfQD5h3+nDYU9lG9jz+2I7pn9aOqItrSioySAIRnYIxWVCsD
	 Fn9lwNZ0nqOHsZhr5NwaUy+kIcwz3qnAs8waFU2pjSpBFUvJitlSyeIh6ka1TyCJvtgs5
	 Wi/xHadIccbUFWwzCvDQLEw25K8LEiV99++7MoH0f/0uK7lVhNmr7VrShiAHsom+QHOiM
	 UUt5xHbWaTG6DWsA8HhiC9HSaOv9IVeSmxjQXdPHgH7IWcaSQGAU09VdKkx7VmJxMAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StriOHIQ;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StriOHIQ
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso685749e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283829; x=1793888629; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JJb2/HmhBTTuuyxE/cFYx3WSBj9uBlfuHJGXiko2698=;
        b=StriOHIQf+80IcpztMZC6WmRaOUquypoVvVFjMRA1RyioA2j4XuUDoIvuGqT89k+St
         jaOT8/F/vK+Wev/CAC69+r2h32P46yi/2FlPYf0TlgE4SPmX0ZwedXcBzHUTg/BT5oIv
         UDvY8X4wUnf0/snq8OSZKV6gz67h00wD35i3ovSD97StybS+b17hNiGCxwmTsxRcsZmu
         t4R1TDAwjkuvA5/SIoobEWGQinQljVbiD7W2UX5TECeZOXXPxuV+hAvFe8Kptu7Jodny
         p7ZLhxewM0YLawK+0pPI8sso1nOmqf5xYS9wRUqtcrjeNgnzq1b4d22E1rRzT6fSetKg
         czLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283829; x=1793888629;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJb2/HmhBTTuuyxE/cFYx3WSBj9uBlfuHJGXiko2698=;
        b=Jw5Wf2NdF9RvX8bjjP43ElFNif/sLhfEBI/1AAgkBs/CPX9EDPO/06+VTSgjtklJZW
         qch6Vt0mGbLVRVwZiDmXay2wUMbSZLUW9yZW2P4PlB4/1+OLCevczN1NqTo9P8NR2RiY
         UHr3mriRNr5P+CSqpGwDugXdnDQzKj5P+hAcph7hMFNFUmwKLnfb3DZSftj8vsi3tdZR
         2G8naOnbnPcYgDWXZEn0ZhbeXqgTzT0OkQrNzhjYc7ch9I8//jDkygQdjMROE4dU5d/A
         9/b0wr5LNFEuq6I54TBBQPiQGVPc390X/cWId3mah1ed0Q7iniAK2Yn2BNxwjH2+CnWb
         FQ+Q==
X-Forwarded-Encrypted: i=1; AKwUvBysT3CxoyaSKlm3U87sjE2qyKvuxJ6jeHKJnwG76J9mzXpZ257VfCCwDUlI4Paq60jrGF8JO8uPoIql6MY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLOYBIaDefcRjV0EKlqvc4Hta2MD+oiLv1nXzfoeNcaLPd15YU
	5Dm7RArLRix4DvqrFpHK7ChHn3sk9G94+fvikN6tTBkN4h972wkpWy2qwh/sUvLdAbSYoA==
X-Gm-Gg: AYBFou12ukEnSGmXgLSVnmqp6qke4cbQLlnGy+6fbcxncC1qoAd0lbLab+UhVrpMwBC
	kKpQAd7MXAolubYC1sYFbXnNVxdYj8NnPBNhzjiC9H7URlIXW9DCgS7jD0A7zdxUkQ+VhL36f75
	/njvh2Y0XWr+/hihf0WmJZQ8QZL4+m284VnAodSm0WdxwqLivmnZi4g5Tv8NHCgYAHHYrdo8cMo
	WY9XguRy9FTu9VUGoz0UGJKQUTO2FZHbwrwcDbzdf9NpmyYk3v1OoIpyUy02b2/p3TwBSJbujsp
	YgLX3u3LS10bdm9LAztJOhm5Yjk8dFu8+EzPkAUPvbRwIO32G7AFpSpVomFp9kaNe94nLjdUn9/
	NQevPCxW1oKOjMyb20Dij/WcjM2Sqxf6lHEwWlGIEUTrtLa8R7qKUlIJWzsN3vJVERYelCJhxtB
	mQ0c7YBmeg6GmddwZQRPm99k2tuiz0jZ01nB6hKw0hjCigZzG3mFa+Ji7q18YV2PVQzzJ2qBRbA
	ooFJqWjcAv25zm4qZGx0HUJ532keniYHzt8CoVvh7JDUCkP7O69E1El4GVncrk9xhxSj76g5yPf
	3EaVM1ro+tTOpD+g0lneOcMKf3kp9F5TdWzXv5rYd0e0lmrTCHdQOhf86uFdVKtPIgqeOTUvCg2
	I8chSda9wBLvp
X-Received: by 2002:a05:6122:e46a:b0:5ea:bf30:851d with SMTP id 71dfb90a1353d-5ec587ac1ecmr879502e0c.16.1793283828654;
        Thu, 29 Oct 2026 07:23:48 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f92e3e3sm5524139e0c.9.2026.10.29.07.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:23:48 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 syzbot+91e1fc35f51774c479b2@syzkaller.appspotmail.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] hugetlbfs: emit hugetlbfs_free_inode from ->destroy_inode()
Date: Thu, 29 Oct 2026 11:23:37 -0300
Message-ID: <179328381770.67441.15785036410268577790@gmail.com>
In-Reply-To: <acfd9678-fa48-4610-ba90-278cab92ee9c@kernel.org>
References: <179324176522.32673.7602596908234555806@gmail.com>
 <acfd9678-fa48-4610-ba90-278cab92ee9c@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 10/29/26 11:45, David Hildenbrand wrote:
> Should we rename the tracepoint then?

Fair point, "free_inode" no longer matches where it fires.

I'd keep this patch as is, though, since it is tagged for stable:
the event name is visible to users in tracefs
(events/hugetlbfs/hugetlbfs_free_inode), and renaming it in stable
kernels would break existing tracing setups there just to fix the
use-after-free.

I can send a follow-up on top of it for mm-unstable that renames the
event to hugetlbfs_destroy_inode, which also matches the
hugetlbfs_evict_inode name next to it. Would that work for you, or
would you prefer the rename folded into a v2?

Thanks,
Joas
