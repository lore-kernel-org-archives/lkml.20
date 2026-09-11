Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5C489FC1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142204; cv=none; b=dOkunJOn6VnGXWoYi1KXjb3tMK2ejtLPAIoHownTJrMABCHjCi0nzERwXr6V40ar9GQliHGqs5CgcYpNq65IGl+iO7bNNTheG4aP2e4E6CdhNggBWkSYHylz3ywGo8SP4AyGncJPovLYHa5HS58LN+eFMwlAKB6sE+9QkDZmTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142204; c=relaxed/simple;
	bh=z7V/g1g0y9+9R0BptqO0kSLqVcR+bETnnnZCPJ7Ec7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uawSclIfkQsQnlSwPfxH/3zftojVbDyKkOWXTFK5FpL7HEOjiJ4HpqbLt1lr2DWUZk/gNwe4DBdFUDv+nizo1pqELOb5Hx9dllBePD+aT9SFQuhbW7U0qJG26C7iutUsxL+NF6oeL6JeHrEgxYMSH6zs6wmTK5hImQbCmk+3n6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnSLvA8g; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnSLvA8g"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so565943a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789142202; x=1789747002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xdPDE+ElPkzxctjwVXaTUQqhszvTbAvyW6hsARO8f1Q=;
        b=OnSLvA8gceT1AsuvnrJZKK6/1KyAt5PdsA6M0wrmaHMdC9vHTXCDYjO8bl0+fkNwEB
         M0p9InB+UWCB8CCqMByS13bOokXX5CN0NdcwTKSB/fLDiy5T/WGu9yZSeJQzy59m66AN
         Gulgx6XqyFcCoaynfO7ZTU2az6TYJ8C+fXGTbF4vtqt5wuK6y0H1L6AsL87ULiwGMEP/
         QWk/jierG+Sz7KDJ/lvVUXMUuByx/p81RN1XLbuLe94NvfS222G6BYV4/HeyB0g6caRy
         z6ngg9eDKwF/+KetMtnF3uo8IeCm1px6YT5Uq35Y7e21vpkRMQ5t5ObGdP+cRXHtiofI
         wanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142202; x=1789747002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdPDE+ElPkzxctjwVXaTUQqhszvTbAvyW6hsARO8f1Q=;
        b=LBepG81/YiuCZEPsWc4UPBvzgfi36t7POT61umUcXwzr1WXi31Ai7E85jyJq+5rpNP
         9swIrY0VQRtvBR/CZrEMNT59n6KBf+ZqAHCKdLEwp4cCymZ2XCIHqwgW/Ul1IIAOrEV2
         Mmm1QAT0DcIvStW1JaUY+sKWDxILf8XHa+GAFxpEXf9o/mb21knw/j/ENMJFlBR+SwkU
         pyh8kMAK3Aa6o/twQoCcoqIt60N4OkcKSMRel4ORqNz8XAHcfrsXAxKLBivkaGTWqjt3
         C4wi5WWbPtu2vljUDxGQvImUuTME6dpa4IYAE5eevFl96wzrHV9SAYLLly2wIUnkN/n0
         Ch3w==
X-Forwarded-Encrypted: i=1; AKwUvBwjdWKkPvaWRb87zOoX8SURczk9dN1pmlKC9hhnoMfqruwTW6jhWJrQ9eOkytyh+zIZ4jD+bWUPOZKGVj4=@vger.kernel.org
X-Gm-Message-State: AFuF++mspQP7dQYmHMtist70KZ71T4VqZ6El/x3XOKZC9svzdTyroPpQ
	oE/ZCnsyVr1RlygJa5iNkJXB/WPa/7e/M0/e7sm/sdu2t9YepfebumuF
X-Gm-Gg: AYBFou2QHtbjZ/fmCO3y2I9REJiVjdSL6cW9YBTT8aYRHx8xNZcRKO4+gdlCw5brtzG
	gKNaLNkt+a3CUdY0dWDt2ZFDeRlYdpRmrlrh9P14S5oSZRIjjbd69Qn38V4EQhZDiLCrmUbCt+r
	O2EU+IJ08UIPKNinDkwFje+3oiWurahLonX9q3kLz3ACcv5BIsbNdMQFiyPiEFV/zsm/MsDCh7X
	+jHewG1cbJr1YCQyzd/iyvBvg+Bu19B+3bK1WRxByticqdEf6BGEDXNEdI1Zs2PQVs+Ni2GJeya
	fS4KJmcV2FS5x+8e/Fnb8agGNf6gV7xfJlwgLttXhXGGMquIj+v9x4+Br82TY+7zZ+H6Sm//xkw
	kA8S+WnXhvMHc47J/qYwKc9aAq5GRPJY3B78js1mcxaOcZl8hitaLwVDq+cxQh/wQMmQB/Wztcf
	NOtMqEKYYV5GB8TGYPLAab/h6S5rKxVE+u9Ty4qnJwuU48C/aQtd7PuNS5c/mhPYLL
X-Received: by 2002:a17:90b:2d03:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39d9bc3f8c8mr7928696a91.6.1789142202047;
        Fri, 11 Sep 2026 08:56:42 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da6016718sm3225865a91.15.2026.09.11.08.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:56:41 -0700 (PDT)
Date: Fri, 11 Sep 2026 08:56:35 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next 2/2] ipv4: igmp: convert ip_mc_msfget() to
 sockopt_t
Message-ID: <aqQkqzkIuHTNS-gW@devvm7509.cco0.facebook.com>
References: <20260910-getsockopt_phase6-v1-0-e681e102d5b8@debian.org>
 <20260910-getsockopt_phase6-v1-2-e681e102d5b8@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-getsockopt_phase6-v1-2-e681e102d5b8@debian.org>

On 09/10, Breno Leitao wrote:
> IP_MSFILTER reads its reply through ip_mc_msfget(), reached from
> do_ip_getsockopt() and from nowhere else. Convert it, and build the
> sockopt_t at the call site for as long as the caller still carries a
> sockptr_t pair.
> 
> This is a special case, where optlen might only point
> to the header, and the real structure size is inside the header.
> 
> This is nasty, but, in order to avoid breaking userspace, we need to
> preserve the same mechanism, by:
> 
> 1) Only applying it for userspace address, otherwise it is too risky
> 2) Assume there is room to support the new size (in userspace)
> 
> The source list also moves from copy_to_sockptr_offset() to a sequential
> copy_to_iter(). IP_MSFILTER_SIZE(0) and offsetof(struct ip_msfilter,
> imsf_slist_flex) are both 16, so the bytes land where they did.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
