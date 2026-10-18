Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6343DD85C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322655; cv=none; b=ScNlTKe/OahQ+Bunc00ZS9BVmhbz1gXqBDS7DVY8wRt0Fygzil9w/DwEWDt/97y1OjzZ0A2RyG2eqOn8Hhm8KeX0oQ8z99oE53SPXS/dGNzOnVMXY+nVh/rkCVwhmhvL5f95/BINhIruN4mh3U12CKto9I8FWcz0vvbgmbbXhc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322655; c=relaxed/simple;
	bh=+7p3xwRNtCx4HdpJlQfvshSN4t2hw/+vLxkAWi01ZAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhymd42XYnF6jgzO4LDGvVqsFv4t2j7rTKDU9Hs0E6PkmNPshaR2MVEsUbKwZNdIe2kzwnrkXWUqh+0RBLqr4bJnqQPoT0soqgCaWX+cPnxDBUPj7AE3YKfJdhMsde+/IP9OHD06G0V7pXQfCQTDx4zbkPKO4yvoJ20F8p+3vKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=r29YhBIJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="r29YhBIJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c413dea9ca6so184621566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792322653; x=1792927453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7p3xwRNtCx4HdpJlQfvshSN4t2hw/+vLxkAWi01ZAQ=;
        b=r29YhBIJ5kulnDAxXvlytJq9FSuRdUL6HubyancxWQ0cGFtgVvy2etvgtS//31Auki
         q3xZS1sRuXhpTzFVOxBlSHqv4QKlTd2+y6/HpS8VsFpwT1ZxzIED65bCn/cWpuT7oNun
         8IVwddZikt0gBee5RXFp+GWQLOVFnzKsSYPrOCKKbQNar8zYzAyV8LOJuXTs2TjMBUYD
         o2RPL2UrmNFFAywZIwmiZwmhChcCUPydD0ZAQFqScinekOOqdiChB+4XtKow+5FSvsag
         +opxWHhu8yYOX8uXnSN+FUKI+PMIDg3QlBxy6Q3r+IWQcifCJ4fZUwM+cQEmWcIygLZV
         Wy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322653; x=1792927453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7p3xwRNtCx4HdpJlQfvshSN4t2hw/+vLxkAWi01ZAQ=;
        b=WnFAyKMdvcLm6eySEeJh9tQaP1KU2MV7PByRe2afjDQ+dAd6ke6sKd4ctLezXZJT39
         yi0pm6+i7j+o5koDqTTfNjhZDdTr7xXjzGbcckfZYnkvLeDgA2gra4orM+AExvYY/E+2
         t6Whb8TNepTzdEiRy/EU6Pl9Yje1ypndKYnf2/TYtPDUk0ztN+lbbF7HKa4JZ2s+s9PQ
         9PK2UvIBrK294ctNs4o+Me4j5kZObJ4gWEy6jttceOQci29xuflF9oct139vGa31bWn5
         NKTxcWYJMOl1Lw7aMkpTQWcWIwS0W8Cfqy5tJpl9ZQ3KbT/iIXuMBxG5Yq6yZMduW4OS
         Ki0A==
X-Forwarded-Encrypted: i=1; AKwUvByjeEfXQ5x25fUatm6FsJtXAC7Qfu0cIMy2zq9xKvcht7sa1aRacH/akJvAhGlOhv+HYn/FoioOirAGQ7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfsiJoq0RYpIkHCyRxz9ShSsCrUmcz3iTJHFyMV36pUXkeh7pz
	toDXq05OZIGqS3qEm/2qjBRjU+JScMXFeb+DCNuQ58uV8wLAc+EwXVFJgUKmwtW37g==
X-Gm-Gg: AYBFou3mTBiMk/ZfGIssNHFj8aTEbJGhaPKoaNZCE/o0ChXFQ9vDBvKgaZlO+CXTJnf
	Vi/pzI5vW/s8Mezixp2ETEj+y3+J7ZOLMg1T7HPHxZNiwsg9IjxEZddiBXQXrsK6MWnmFwfZca7
	NOhkpFcG+Bc12CiMEZjNiSc18Go6VowKYPfKE5CUDNTGZIa0nzCbHVxDlx++g/puckUbq+fVV5n
	8JQwSxaY4e8ofLZLj74O7o6DkEOuWPb4p2mSiSGH7t+l0xlNw3fMGtNY2dMv84cD5IcrK6xyabS
	ItUo6qf8LL/nrfzLLY2l4kFiAcdjUCzjhILJ8PCjF6csBV1+Ru0+I3tI3L1EA/rT39jLeBGUp+Z
	7z3Ti1oM/G+LTrx0P8p2AOq79BkFk6VFP4+rHC7uSESPBpqABIfDFwPqythakDxgK6guO9hDA6C
	UD5jwtIvamp6Gx/m+YLLb0HUnRlO5cz+7am926ifLbaTANFiL96zLcQjyH12KYOmwKmsB2hNoOf
	pj4jLnylr2sd/oqN3Pz3pajNNzYu/DizoB++SXVkDZDVKfNzdTjCq/U8SUO7agKF8fNvm/p9fiZ
	gJ2ZRO+gKR966Xrw3z0TL+GvnFu4SllpJF3+tIsEWj1zv900x3fOu2WTz8zGBlBR6Q7YlP9a+Zn
	n/lVdDYJCHAkA3YDlnw1Z2FBXGAUevJw+NiOcOHYM+P0MnF+cemMaCNhP27qnjXNzUcYCsv0GgZ
	aqWLH9jUSE6g==
X-Received: by 2002:a17:907:c819:b0:c3e:d0ca:d2fd with SMTP id a640c23a62f3a-c419d8387c9mr321040266b.12.1792322652341;
        Sun, 18 Oct 2026 04:24:12 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c1282sm256561466b.63.2026.10.18.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:24:11 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sun, 18 Oct 2026 13:22:07 +0200
Message-ID: <20261018112207.15005-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179172627842.434549.17722584347227331391@kernel.org>
References: <20261010131842.2157365-1-julius@bairaktaris.de> <179172627842.434549.17722584347227331391@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Superseded by v2:
https://lore.kernel.org/netdev/20261011162957.1328474-1-julius@bairaktaris.de/

pw-bot: cr
