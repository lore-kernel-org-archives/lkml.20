Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591363;
	b=qpYoaxytiEaDiJ8nPe+fGD9x9OSIrGDrWqiGFoHPydrHNr/ihtNrD/zy5DKKW891K6NM
	 uRgrIb6Z/UpE9Fi8PrFLPw1kNfmEWl98tlSgdguKeV74iNm37f7C/oSDuSQB/QIQ9uvsI
	 dX0iG2Z4gjYRjofHFEgbhbD0P9AXmSXcwfPob8/Us+PyWW2sMFWh2U62e5sRzeYc/aZEh
	 TWo3ZqPVq+DVA9AVI36LiqS065k4Qk9fMXjxNzWGFQeyA9sKTWN/lxilS/g4hpoYn4npM
	 AjzI8FBlElBftjl5BWmBIJAHrqWNDE6C0I+4hVARZeGnPK6EzjueBBbwQ0n7q5xG5Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i+sA7ukfPfjD0qmbK6dckJqDn7Cek/Mg6lo2porw7DA=;
	b=oLxHkbPSbjmIjiKY2bZyuKiVzRGfmHbCqaVube1gEoHLqGFd2YVtzkHeqQrOrIMUrh/z
	 oiL9w2gFTe0syv5HtkKeQM7OPEfFyYkB3E9nmf/Lrk77Qa6mpNola8RD/fjeGm1HAzWDh
	 lG74rfWUsnmV7LJIbUCmpPQVJdNN7IxqvdhqugWzndmVJG7Dz+avk3wOnNaYlD1AxBs4A
	 TZbQ1kIycAwCtvpdVVe5J38CWbwb6YPJcx7aaPGnjPgqSPkpZPyTNfrnpIWppny2eMF17
	 q8/GkZp1NOKXvIXa4VIfeec9i+KP4MfJHQtnJ9QwMpwGSSixiUb3b/YSH9QhKDo5I+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h6p0hCnq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0C606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B0C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h6p0hCnq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so6521945e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792591361; x=1793196161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+sA7ukfPfjD0qmbK6dckJqDn7Cek/Mg6lo2porw7DA=;
        b=h6p0hCnqdn51jmybMmwZkhu34yX8gHJIAp1vbiZPzdHJjGvyPlMOpJAlrtx8cezUF4
         ldNehgGB1QK0gn4uMVrAetTcxTAwVCd5nNHyCF3+9m+sSeCj8XjycGn/Z3BwC94UqGEZ
         +93WiXmGtoJb7DrRltHDtLZWTmsHdPlEFDuhkwbcCNzkOxoeqt1zoLm/ph5M+4bZMmn1
         muukZh9lglyyhyc7EQc03bhTjBiAxief+o6CZA8MlE7ccKMWcgB/JKqL2ZQqdKWVoRZM
         vov7BypJQOw1+7lfnHScMAB41IquXrjYXEAwptP8Ynkuu7W0C6F4JnLRuxJUgbGNEq0t
         yDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591361; x=1793196161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+sA7ukfPfjD0qmbK6dckJqDn7Cek/Mg6lo2porw7DA=;
        b=lZVBwI3IPeT7tVM/9Bd/VfoM5BJ94xO/ksAgh2+klitGxIQSwyIxN74S2NtYoOy9Na
         9UZAH7F8guu1+HK/L05EWs6EJRQFBpKZ3LCNyzUsEckVPH7jfovBbpYYfKYiucn3oWIL
         1R3QHaYyy4zvRJ8FL5yXhc0iT7JoQpWgqeOj6X1eTjzSd4YsueFCcIkfMgC55asdhI7q
         xKopcQGDBpNKdl18JPrHoBIs4cv6/9Eb2KwvumFtlek1P8hMtp4uYMc0urOdwO6i9Dau
         pfhN+hCjs5/GETRYPx6Opm7fptqSLtucXEVYhMZAoW1g/5UY0EkWixrPoBbWjSrO/2dM
         I15w==
X-Forwarded-Encrypted: i=1; AKwUvBwLwT4/aZS+iU976TjW3c97UCR/r8lbJg/To//kFVqzemVKXpRxGCwOa8fLXin0AbdFr25dl52krQKv+9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHzzZGbcYp/zYdk+x6zO1h++69s6emOl9VniF37irlJ2vP0hk4
	p0Qbapc03+pI0rDA0eJrBqP2IdYUFfWnleb+Uup6B/iCPmdCcA7hkiRQHBKVaQgt
X-Gm-Gg: AYBFou3aWSius6a7rLCpG2aRUq9Y8Ampzs+/fYHIzMMXSqpLvR9URxkk7iaCVjzWgJZ
	3/p3WjP8hh+xbreNYYwtf8eRWSdfeXF3/WghA4yZSwG9FmVHuObce97U0nD0If7SL5SFF/9AHu+
	YuB5Z4/ZBwDoent4o/JqfG4HL/++nbY3qseNIvBdhkulZyD1C8PGPlNdGftD/B3qnBwsFJE6rx3
	4SCSF1QyWlcvU9ArBg2Eb8k0lsdJFYSDzdAmyOSfZIGuaC4A5umjsTMh7VojEZ1q+CIZFzimmTP
	cKK/8wRr1DFlLSEXweCL4h+y8/qMHq356boBprjaimNfRYlaxpUj9zGC6rJsy+vwuonGnkKHrmx
	QqockWNqSpYMWR0/L3Kx2uVfEhxVUMMMPjWVDEGXBoiJXH19V5CsePN+Agu7N6HJveWfch9lvyd
	q8U5kN2CiIPS+iHTalsKsdJ8Ai2QK4TnVDAmDO7hZ9ecd8dOHbw3piJ+T59bhDHjL/nOP3SuEW1
	ru83m5U5PwYVsIz6VB03HP7Yo7JsHnqzRE64p41ZqUZMFGEdy1rrWstPi0NBScnS6m/9IJ8L4U1
	oYI6ttD2GdzhOMlmCvur69dCe8WjkxkknjoZvXn8oOO8ZeuLAW/7PmVpmMBd
X-Received: by 2002:a05:600c:3507:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a1fd8cd9e8mr46111525e9.1.1792591360723;
        Wed, 21 Oct 2026 07:02:40 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([150.251.170.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc10de99sm50954045e9.1.2026.10.21.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:02:40 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:02:37 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com, hannes@cmpxchg.org, david@kernel.org,
	mhocko@kernel.org, ljs@kernel.org, dave@stgolabs.net,
	roman.gushchin@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
Message-ID: <atjF_eRnuzH1IZ2_@C422HJQPQG-Fractile>
References: <20261019185002.3428594-1-gourry@gourry.net>
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
In-Reply-To: <20261019185002.3428594-1-gourry@gourry.net>

On Mon, Oct 19, 2026 at 02:50:02PM -0400, Gregory Price (Meta) wrote:
> user_proactive_reclaim() limits per-node reclaim to
> gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
> allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
> folio, so writing to /sys/devices/system/node/nodeN/reclaim never
> reclaims a node's movable memory. A movable-only node, such as dax/kmem
> or hotplugged memory onlined movable, reclaims nothing and fails with
> -EAGAIN.
> 
> To reproduce, fill a movable-only node with clean page cache and write
> 200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
> cache stays. The same write to a ZONE_NORMAL node frees 200MB.
> 
> Scan every zone, as memory.reclaim does.
> 
> Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Makes sense.

Acked-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
