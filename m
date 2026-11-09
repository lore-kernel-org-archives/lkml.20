Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253724;
	b=v8ynQyN44A9d4QjzePaP5naZagDyGPQZVemHmr5hvkLktmpT4u03yJ8KXAsE4GayfSmH
	 2YfACky4Na8iEAjj7T8ZW3XDA1nuMb9WOiq1ne86uDSPVBdtEeAbW1hGq5bE0ZU0Lkvu0
	 /DsfF3+pvsVqFdshrpv5CCNQnY2oeEu4xc3WIu96UxRSrUUjO5xAbCzf91M1576G+ZyCJ
	 g/AZP0ZfzWDXZaNf6It2UvZYf3k+NoWNWDab/penQsRcYSeoQuFxheeVZ3NQnkWJVq6U4
	 hz+ArW3AcrCIzQldoLPo6XHXBfwWQ7GmfwsuBXao2L2PEGCJ4J5nfkoWoIdlnnwO2wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nsd1wsdgN72wtuhrUgUrRyzu9u6yO/lsXF2Q80nLfXw=;
	b=2ZmPdGN/qvx0UtnBd6hgKiS4NtKukXe14g0PLh42kU9Jhj11MNGCfWpZAUDrhPSkDR/2
	 ja/ACyxu2JGVIpzti3na/QTRkCf3LdS45sEG9UlUfg30BGxoupNPKwfK3PDx1TT3R2MsX
	 arEFWiZxDAT/jyd2sIlTPtQNqgU+2iSQqRMWmn73qAxbh4X24qWT62IuDHzwBmAeClNgd
	 H5eiB5kCybK27+DwNbhGklMl4zf9I4Q+3iUKrc8kzof2Ek5qkIV4mAtUEGTT7x5trgX2c
	 rNa1Mgnoq6YMRrwR41fDy8lPY0hERVvchep5qQpUI4Oty2NmNIS+XrCbnaMrpyyEacA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M79DS3EP;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2601606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2601606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M79DS3EP
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so813841a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253723; x=1794858523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nsd1wsdgN72wtuhrUgUrRyzu9u6yO/lsXF2Q80nLfXw=;
        b=M79DS3EPhu8zO1y0u8bWB7t6kVs93Od8ZqWma9sw+rDAVyY8UOBX2OWh6GM9/1l5zf
         Cr34JbEemPlCgZDZ8iC2EiVjttCBLwGB1MTUoaqT2ZuMJSi9Q4NEgOjCwHAFJ4f0cmoX
         a3+T7hEb6XPbENMRxlUt9RjHai3D7hkyPaTHjRxlcmut4iP3Y6Ghd+ivv0AQ6OnT5OfZ
         kWeEjhcQTx1deyW8zq5Kfui2T0gzyAI9qbtPmq0KYtZa0lxtKL0BECbInT98jI8KZT+t
         TO2MSaapupstNPXKzzCuLyowOWrEnJPx7aOfquBCbIYoJTmqIUr5pG1qPUWKdTltuNxS
         sFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253723; x=1794858523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nsd1wsdgN72wtuhrUgUrRyzu9u6yO/lsXF2Q80nLfXw=;
        b=DekMXz3uuBPv60Rlr+2sEjrfIIhUOL+QIBc57eyFuZ0OF3OxoDwe29rA15NArt2jTV
         lO/0nzY2mU4zPC6ekFy7TVjOnIgHviyBQXHRM1KAdjQJ+BzH4k6WHl6rAvyxr7zL20E4
         qrbJwnBsp3mT0DovX2tpQBW5anureRJeDAx7Es+hBww+9ndEAB1XQf2ZyizsqrI6TE5p
         Othr/hBiwR3iNw5nKmTTPn6nipPuqAkpUWIdn+KmtOtAJ0ka1cA/o5a93UR5h0xwgmM4
         bJwHJPlB4OBdYKZE5OywjFVvhPNOguhUpk0YNMKgWPheOTaefLT/kBhRJ+8w+hDwxJth
         u1vA==
X-Forwarded-Encrypted: i=1; AL+hErHu18fjTE+XSWJb/1smkh+TKx2pJAvcomOi1L08+Tp+nmTw/v/cZ73uY/Gb51WWHlWNNf/1Yaz1ijgNxGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hPeyEFj1vzDZxwpYxxS8Zre0rpX7Qwb2CtjSurkHL8iA+ziDM
	pFQ9zMd5eDspSAvoK8Sp8BmXYaBDfw6xllPsvl5PhxgRWXh6xVRwzlB9
X-Gm-Gg: AYBFou24TIUFJd3v8WlMWxck5xtrK43hWa8+UIWdet4hEqFmKgvXlORBDDqDaqL9DN2
	E4TBxHNgy/2MOj1OjfXZpySyG9GrfiZBw8MES+FdD1QccZ7OyQCdwE8cGAt7B28w55n0PrZOUQE
	UFjspzlVKv3FpM2dyvgi/4KmqlA0K38fwq9XChvajSdZtGmGLzkWA/f8nl54yGa40EENWM07qQk
	MIOxMeFsLkdbplActRl+r2mcWxw6aejHfvfQ1K68OwpPVIx9ITDgCjkooH2G6Bz2VvhzbsYjXRx
	cZ5OP0/AF2gNIgkh9zo/s5gEUqGDOxGYA8Wy1urjTsjF8O4q/8zC4SD+9yIj/Ou1/78PeYwc502
	L1npSqA+AqZAIOS1NcOatoq6Pdz7qasiWphH1lWY0MuBrjBaWKwS6hFRKbJw9QN+Fc6CPrZPKmC
	+KCd8qYulaibQFCpX/ssL1SXUKAKyzGoU4Bt9vYlamJlqYAjUpw/qJ9OpbMQE1bH0ZprNGRxos/
	mux7g6ODJAZx1JYlfT16aJ9Q8Jg5+VvRxU+Spas8uSSAiFSks2mhccUWBOVhfGkZtaFp6UrSGnB
	66hfw2VIixqS9y2J5xXQHbFokau5kvLtGKkmCvXv7tlag9DcZNqLvxro++tK5WWhYUeoJZy/YIV
	LxsTE/U6LhP6xoNfK7lUpO6M2arn6
X-Received: by 2002:a17:90b:3e44:b0:3ab:9c73:147 with SMTP id 98e67ed59e1d1-3b166cdeaf2mr592810a91.14.1794253722936;
        Mon, 09 Nov 2026 11:48:42 -0800 (PST)
Received: from bloom.localdomain ([2604:3d09:178e:e100::5567])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167928684sm718358a91.10.2026.11.09.11.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:42 -0800 (PST)
From: Ivy Lopez <skunkolee@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	fvdl@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/cma: simplify cma_declare_contiguous_multi()
Date: Mon,  9 Nov 2026 13:48:41 -0600
Message-ID: <20261109194841.18662-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106-cma-multi-v1-1-054eae6e2c1c@kernel.org>
References: <20261106-cma-multi-v1-1-054eae6e2c1c@kernel.org>
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

On Fri, Nov 6, 2026, Mike Rapoport (Microsoft) wrote:
> mm/cma: simplify cma_declare_contiguous_multi()

Thanks, this supersedes my v2 series. Andrew, please drop it if it is
queued.

ivy
