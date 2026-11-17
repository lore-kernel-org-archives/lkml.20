Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931794;
	b=w27ZybKprZu2qnDGcUWr9624KTviWNQdP224vnL4MErsJykWrZz6TRwjOdgT+/nD3cXZ
	 EEiIjgq/qf45OHuNt4aNq0cz0cwwEc6Bm9jEP8tDElhG8Sqxaf52AKnnEN90gMB66waY4
	 IZzNJj0IlZ9cundXtuKbKy3ow9aEx0yeYpHs0qq33ZmBm06HBTJKILBrOUUCzVEGmbneo
	 YDulbfS9DVhRUDRK4I/1u8YyFPteZtdHSDa0Dr/UgByk8rTFQ2FfYYqbmNXLwbaZpOeEf
	 I5NMfszRYvk+YYzt5V2flZcoAqA4PedBMqQxMGNqJM996h5Rzw3PE84Y1C1Sbbso8Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JB2dNhYg4YXLTwJaNiAZq3d5g36BXulx7lVZDawKnfo=;
	b=3VBr87HyWDGpg6Gn9LiCBiIGxv8xb8VvhrLsWbwVtmWMLrlFFPFeL/KJZQRt8t3pQ23e
	 MhN1gDAsuSE0iwgIFjYXt5nCjZwTNBofoBWs4lo/xjYfD30dV//8OBrkUHFqXROk+QKXk
	 TxPYYj5cTQHidkwgvgr5Iv6thbewb2IBYTkofIb1Nk8NhrOz3hAf+ONDXow0Zi+59mpsH
	 Zw2/f4NKJx2Jb+lJJ59I4quMQ0H4DHMUaSIPyaqPAl7jCp+4QIApuJ/hZO8EnrUoLI9cF
	 lldksA/Iu/R8vUcooj7KuwJi2D4RI8Bj0gp869xlAaW6CCkum5Pr1uxiS2+FGTVd1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0T3bCjjH;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE07606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE07606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0T3bCjjH
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2efe8f50697so3447495ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794931794; x=1795536594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB2dNhYg4YXLTwJaNiAZq3d5g36BXulx7lVZDawKnfo=;
        b=0T3bCjjHf/iTE8Gsh4RoOPBCtelkusLC77/NkhqnT3RkHCR9S75Il7inLONgYMJXVV
         5OSZIiNj7tyc8AgxDqRtgJEHylLEt4HlhXJAWNzGaVlWknDeyAlu0VZ8XwRTIP/UKu7g
         3yPFDt6fHDmc+M/5w32K8NqJiTy9l0WFHpjnWC4UKkIPSlgAhRw8Shy9TAiENZQIGXut
         EI4nFeBWPnbTYEz0oSeSITKGGPx5iQaGjH1abBRD43rhqKYekoURhUOT1CPyX2BlaUqP
         HKB2q8832zPzBffiz19k0eJFjlPLACtOsgGBApNr+ZjRHMOBqUWcUBu5iUyMlQdIXyM/
         YjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931794; x=1795536594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB2dNhYg4YXLTwJaNiAZq3d5g36BXulx7lVZDawKnfo=;
        b=U8qV3bkdPb+HTmWkwz1MhbVku9ymusqAKuGTXZGFO6TR5z1R/y1MRTfJKMNQNZcale
         Hx4LB5Y9dvAVWYyZvFm4ri8bHfY0/6LwT9P/h/GWNft7P/igrE+tEdQAPTsIJhOzbYB5
         SmUkEFDD+O3wmkbdgPYksXN1Z+HoBKEWO7Q+bHajrAJueLGYdX1KZlxQtO73m++i12bT
         vfxOmgS8XgfEC1daOneBMBHWRiz1sYKjadfLqwHRu7qWGYmO3+JD7qElQbQzfcn7qZBM
         Sj1kyVDffHAVHeDSbPhpWcCHs3VcShIGyQ+kFEUH+gL+xwBV3ryQImtndwiewg1mtIng
         2aTQ==
X-Forwarded-Encrypted: i=1; AL+hErGYstB2UGnZ6AuEM62MEeXmmFR9bvJluUmNc35Hw0xoEbTgBWgLnm81h8O/c54Bdt4UxvDm4cRIYBWKvK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4e5a9S/Xa0zcSzt/iVwTdA4JkhG8oiyRp6POrzoPpsw+wt+Tq
	Vczam8ypJA3OesNuds3Pigro3x5zMFPCV2PZS2p8r5uRc8MzavOhxJ+1
X-Gm-Gg: AZFdTZc1a80SxuXd5Y+S8QIU9u3N9EWTve/oH7AsCE1rM6WKgOnduwFpOdXyNS173aR
	eDAHdKBXS00evJrWK2xoso1TSr9efyYi+w57sATaoJeRQ3iXhuUmqyp6tz3+fLIdgtTSAlf4StS
	5hYKhlCGo5L94nRHcdhp+WueKdMtnk1XPiApbozB9V3gMLsFarSlhmm/XanB/9cygAgb2DImORX
	EetKDqvix+TEm6L1rdUc8n+9Ja6myZQ9lxwspkURGaPXMvSmzOn9wXJWTu+CA7505QqCeLz+O1E
	Wk9JEdUeJTGO3LGqkBH59U4xlYvrkKhFBZOy6/YVB676WA9krQ6WEy/uAOHVMaN4pF8n+d3C8mK
	xEZ/fMXpDgU+2lxDVCtO8Sm0ATKRV2idmBKwvA6V6dmiH25l/u4/U72P2CCiDaYvEK74AdIXECL
	TOIsjpGJ3ncSnqwZUmZKJTtFQcjK5DHpjFf56rA/cK+19qQGFHZZZNWf60DES1YCoozOqIE6PJK
	TrdL6RkOqYC3T9j3yb8uTZLugTTPY3+297FvFtDqDFlx2YkuQwxf/il1YPK3LHc43fBXilgq+ci
	AphS+63Yku7hNB6uDw==
X-Received: by 2002:a17:903:32c7:b0:2ef:dc42:10b1 with SMTP id d9443c01a7336-2efdc421364mr28930395ad.49.1794931793688;
        Tue, 17 Nov 2026 08:09:53 -0800 (PST)
Received: from naki-PC.localdomain ([2001:df0:a640:2::19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162c2sm127965ad.12.2026.11.17.08.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:09:52 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH 00/16] mm: add in-memory compression of reclaimed pages
Date: Wed, 18 Nov 2026 00:07:39 +0800
Message-ID: <20261117160739.475062-1-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avrliOfBi326au6B@kernel.org>
References: <avrliOfBi326au6B@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 16, 2026 at 01:14:16PM +0200, Mike Rapoport wrote:
> This seems to big of a change and the wall of text in your "results"
> section does not explain clearly why would we want to bother reading this.

Fair enough. Looking at it again, most of what the series does is
already covered, or about to be, by zswap and Nhat's virtual swap
work, so it doesn't justify a new subsystem of this size.

What still looks interesting to me is a couple of backend mechanisms,
e.g. packing several compressed objects into one swap slot on
writeback. I'll evaluate those on top of zswap/virtual swap and come
back with something much smaller.

Thanks,
nakixii
