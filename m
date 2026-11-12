Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500284;
	b=r5Fg4iXk90zCoE6ApXV2Nc2iKioLoa83oveGg4w9wvpGqMNtrdy6hTDPdhUV1csdiRlc
	 C2GLz4C66nZ71ShxAXqY9rw5TJUtcVE5d5mFcI5BfWKorFj4IQXOpJVH+egJHHgYi6Knk
	 3hlHUoz2nT1Bv0HYs0URVikPswBbFKOJmzD50pBBlKfbUgrYSZdd0bkLjnKX/E9Ept7Yt
	 SMrHJBkXfxyabJTWWhs3lEJ2aV4WzxS2dB1+hL8mwHvbleZgrSai2vDtWraf8znebzEpP
	 xH+RVa6JvcgozYgGKB/CyTyEctarUbDd664lg+2WOYPC6zbKtQhiyjBJ5XX3KN4L8Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9m7K9K9LtL761eVrSTnykdQPje31prtt54RRFaowtjE=;
	b=g4bl36AAaBcqW3xdANedGvfM5E5QqALclhapeab8GZjn2n7IxDGJYgBQuuP2J8eq7/ZU
	 GQmNCGUGAbTHTj17HKxemSrrcKRwg3lIJt1wIS1YSy/0p1ws9EnZqPuNbRCYem/WSMa/u
	 5nTeaLIu216KedQMezxYhI6aTztcXLZLWFk5jsqtPS4Jsn5CiaxjxIXIwCXrSNbJAEAAV
	 8DqZjPzKN+Dj0848b9L26HzwThAZixwyPmutndsh3NqxlG9tD4wcQjw/6H5Y8p0BGqw2b
	 9JK6ASPmNp/m7hCYkP3Op/+yI1/33XHNOjD7QJ++8kh8bciatLhgiKxZE1YpNwHT+IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="cYH8El/v";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1372606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1372606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cYH8El/v
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b1535be329so2532502a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794500283; x=1795105083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9m7K9K9LtL761eVrSTnykdQPje31prtt54RRFaowtjE=;
        b=cYH8El/vM0c2A5+6y9XzQCoxGgTV1g3bbYkJ9Pkn+phPxvFcTI2NhnNpoyYTNv3oVt
         Oafs/qULEz0YrHyRE+G24rf0cbaM8eVEB7ZpadIH1HEkwBFIJ53Zxml9XcdCdEtL6BDj
         9tUl8zEdJJt+4BbFtAOlof5VNkXRVnObmUYZOL+gHNcrHqSCYrI0QQuKgJmqXLQWoG3L
         y2gOsBlZ+LKDmcUmZFJ12MSxZGBLkacWKDG/guXQKrOUD9TDIlc5nUeSsxdXqWpcVl6p
         9yoM/wk/07Mq2gOUuSBXj1QqLvu7yCsZJMJOzqL0vBwTdIgwF7FYTJpfhWFJGdehUkEt
         kdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500283; x=1795105083;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m7K9K9LtL761eVrSTnykdQPje31prtt54RRFaowtjE=;
        b=ebckUXpEQLVU1Rtvb0piR9IV7+F9kS6eh8x6+DYS0v/GwwEj66UhRg5LzSNPvFGkfc
         Yb1gK/7e5JXZHmKg7Ehp9nHsc2q+9KsGGrWyYieEZeG1KeL+xG5OHG8JGoflJssMP2uT
         cn0ZAA92E38kbVsKy9675UV0Dp1Qr2RgVxkdmTv/UN2PhK5VI/MeT1Exkds4Zadv95Es
         P8JrQW1l2WM+LEP2PtfTqRAQJEOa04ucyzVX7WcqBdIi+MgP+WNZocDqjpEO+yqe9mOr
         Azdu5708zk9SGUYRaVnGv3/AXavUSw8dXoLQ/V+p2HIPLrPYplAbAjKMA5Ll88FKbHP2
         Dbdg==
X-Forwarded-Encrypted: i=1; AL+hErH6Nht9rX7KxuCFgkqiKh1dJ67r+3qv7R8VQn60XwlsrFALkrAh64Bn70GhI7wVGWAOdkfTNM/r1CnZuQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WSc1xW1weElZVtIoAhSxs/hl9W6KlRM5emAwH7aWSuCViaedm
	1yqNDKPROcQ99hIBfn9tOXZuaQzRkGlLMsLCvhSHc1MLGgwRU/KuKTrwtzXlIi2WGgk=
X-Gm-Gg: AYBFou3lKX8yj2GEI+g8hdUiCN9Xunvo6ZTMUhQk46NDvlO+WlJuSqC1s8/dem57yr0
	xp+1ppJZQDVVHUEXrO+h/JDWU3NhqV8DuQO89K4uf4f4x1ZprXXU142Dxq2TqDejONdXiuok9Om
	z+VWXzn1A+tbE4eOQErbFeM6Dv58VygANGKhxZIUUmxh4f3a25imy83r3/JJz11GqZb7+z6LYqp
	xMp9E2aRAYsw6ZuTYS7LyJb4iV/4ko3bVPMppZAYWQi9z5rHTIinZaVdHyvewPy4bncTRCnIPfk
	56fjIYECLFTPm6Y0rBGQ3k8g0+Kp3oAGVHlD6h1TC9Pqk6M5148c7zPNReNa652m+T3sljazeeh
	VdfDoE0NzkE2VU4PZYyz/e5RTR951NXfmWP/2SemfL7Cn2AjsdGyXFmYgJemBQVAS60hsywoo09
	iRyPIeMXEOYYP+n5TNhzbpL37ihkHSJWfamy/eJyaYW4Mb+BglNAVUQC4zsiwXc9cpaQYw0jazF
	53Zw1w4bZgOJ8AcZ4BW7Hkq+Mff87P8XfEjB85o0cisDsYy+vhpqT+lT08+Mp4SZreFlXQ0LAbn
	UAXuWt3ua3oeVl5YwgqaWz0TNbh4BbUdzQCkMyMjqSteER/NdNt9IDr+9hoaulMbIedJfCb1XPk
	=
X-Received: by 2002:a17:90b:4a8a:b0:3b0:cc3e:68b5 with SMTP id 98e67ed59e1d1-3b182efabfemr6090892a91.21.1794500282480;
        Thu, 12 Nov 2026 08:18:02 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce460csm5132750a91.5.2026.11.12.08.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:18:02 -0800 (PST)
Date: Thu, 12 Nov 2026 08:17:58 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2 2/3] ipv6: return EMSGSIZE when first route in
 dump does not fit
Message-ID: <20261112081758.70426a67@phoenix.local>
In-Reply-To: <20261112153115.GA3255418@shredder>
References: <20261110172925.3293312-1-stephen@networkplumber.org>
	<20261110172925.3293312-3-stephen@networkplumber.org>
	<20261112153115.GA3255418@shredder>
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

On Thu, 12 Nov 2026 17:31:15 +0200
Ido Schimmel <idosch@nvidia.com> wrote:

> > 
> > Return -EMSGSIZE in this case, as IPv4 does. This depends on the
> > rtnl_dumpit() fix in the previous patch.
> > 
> > Fixes: beb1afac518d ("net: ipv6: Add support to dump multipath routes via RTA_MULTIPATH attribute")
> > Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>  
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> 
> FWIW, given that "It takes some non real world stuff to do this", I
> think these patches can be routed via net-next.

The exaggerated security argument is that malicious root in network namespace
can do this and hide/crash ip commands and/or routing daemons in other namespace.
Once again the analyzer is stretching pretty far to argue that.
But then again with the current "lets chain $.01 vulnerabilities" world maybe not.
