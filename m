Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277106;
	b=Ik406NZX4Ikh/+KlOe6AIfEDOYc5JsMvdTs+oqCxK2Lc19POrnwnZXqCuZnzbYmsRfMo
	 HRB94J5q413YYGmaFUkaGNZ/hFoF3iWqHANPH3Yc/WMKZQ/1fwjKxBSk9XLpCPM/U/dGr
	 WVUDAUKBJNieKW6aKFmgNsfnJMYF0W2qw826eBMoVNwkOLhBJaAE2vUBzVZrbO+AEHrOT
	 zlgIg7zakNBwNT0UUvnn/u33SLz/7aAFH/+T0oQfrjR0y+pBBPD/TMVGrNVBryzA/BaQ5
	 Q+90uEHp/cKfxvnPQFLBqcnEaJbavZfCJHEL5/zI0m+48hnPKXKqiZJ48TfXfbNdDfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
	b=VSyWqF4YEaSSe4dxKhT4JvjIgwETBdEQXmD/AO23K00JoFH4hwxxiF2K+0aEDqFt0Z4/
	 8kwQUgtIn1XH0qYLVTXp/V7qHWXKuMCjXUFurcMJ7quXtyYVbjYnBlG9tQRLihI7G5k0u
	 vICi4JHyXPPE+urzJgALsiygFY/bx2Gqa3u8RKcE1o2pqF43sVX9o/NkFab+g8B+dS4Jv
	 uQGg7yX9v4DfGF2sRbYLfixWDQietNOjBoGUMIZPCyw6cJsRmJKdoPY5nwRwhYJ7RlAsO
	 cDYpbtQECdJxA/nXJBcbFe4fY3Fxm5EnpNLHq5rTwZ20PCGxQnqNzHnztJyQq48Q3qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeEUt7xp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A94606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeEUt7xp
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ec20398b05so896736e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277105; cv=none;
        d=google.com; s=arc-20260327;
        b=qjzTA61DOQL4RtRa8vzn4/fcnyNfj0gnMViIXIbCxdmJT2gBpgG6zMa+ADFeyvAEMM
         M/tMKsgo+pglaG/m+9oHpkVpSvVeqKna9fmcA4Nqa6VGQuNo5nXpKz+yJi2onUoOmzLS
         gvwxJjHQORaprAAIqAXtdj65QrCTBN0MwP+qQ+lVN7JO4Qa5KXJ+3AnT1GDf+BzxS0iG
         FJkPPZDIVTy8tiwGqWCiIT7Jqk8YJKzlOUxo9OKxTkNbJ2dNBNa3Fv6pNVVj5SxtzUU2
         XmU8/sUnc5+diSX6FTDdpyzq3YBROuJ9zBXuzgQO+434ItR89iR+LgVQuyCjyWMuwH07
         UvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        fh=M0hxITZULgd+v6DLbx59/uJpKBvDWToYfb+XrBMBUUk=;
        b=PBGsHaooz3L5Dntjv353Di2God4O5FHgpzyrzaIjljY1qvNtdGzRITo+q78MAzDlNq
         9SCASWuVsEp/vPGhtKqTpYFx7yVKuxzWTqi+3YXsfUTvyDEPbHGO/cY0+wd5sd8Mh7uT
         Lr5l0WyejIOUw25YFitoF+l6sM69KwfrpUk6v3rGDxF35qgJNYt8lJ7HvLVgBAixEQMM
         AzCxO1AbZ8pfeg53vUYEe1Iy07sA/lYcPU7KufXPQVjWfyYbitimoYHBrsv592MXU0lJ
         NqL4nIZ7LY+CBN05bxocweeNJjRNRNFfAFiigkaTMHLO9k2yZhbTVk8B+0zwbEGXLWZJ
         xaAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277105; x=1794881905; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        b=QeEUt7xpf7VR/rxl/W9pU84ueuL4wvvRMzAD1Zz2Q+mpdBFJs5e1AqIitt/AUdLT9j
         tus7ZsU93P8DSj/zAsD3VrumRs2wiiAPKuF35Q5o2BowVVenUmyJMWkaVTrNlDZuv7/K
         aIaiwxo5wo62AEGXUKLt9cMZ50KX8ZziQLBE8potmgjCPwnNmxVvtkPEcyTFReCnrUhZ
         DA7roTmlxOVFT9AXAXjJSYNm6st4nUySWx3OMzcqeTeLSwQ4/CXX65vjyQZ4EHj84yDs
         nGbMk6Oe+Mx4CXUsLMOgLq7r4aFHMO7TujBeyo3ZG7qaAx075tkmBGIYw0sTzn+LbegE
         Z3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277105; x=1794881905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        b=U8R/h4317jHSsuJli9Woo9kaQfI7Vjnvy5ypmyP8CNy5p2sCgb1QTgytl3kdt2xzKH
         DTGrQwiGD1pdsF/JLB7MaT7w0gHYj0G2EiZbXVTR6JDeldwO7akIpQAgqIDPdYhX7K+W
         6PEkDrjGlgQ3kD1T30MOKzQ+syzbjdGtgL8jfOtz7EKy7B25OeNfvgkt+ymlaaHZrJNA
         lhJOtCwosOgRwseJHV3m2DTppqyHc9zL2riWnxgqjQjtRe5u2D1C5i1qptC6ughZmhTE
         uB6smb+x70klL2ewaAECtAEHE2oU4ZMrOZJWHlO4FpLogpizTUt+12yi/ArY8qiQ57qI
         fAkA==
X-Forwarded-Encrypted: i=1; AL+hErFF71poAe2mYIFbDflWtc0TlY23C1RLa+g+p1jr2vh/6CV9WsTFyTPH4ulJgAh4BDg0tB35NkiD8yYNLZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GEv3M0AEpLiYvL0QEjk1gkiu9ifYgwR3ZPLkuWHAZzOFVH/Ny
	KkTM9B4cLarcfhdBJncRQu+CiFsN0rrFGYNF7/0yjK0WYtQq4P7Oz+KZJgt3f9us2363YMVYCx9
	fZzKVIbUJMB8c5CsIRmMQggX9uhrUYiA=
X-Gm-Gg: AYBFou2DvYCVbn8QtjUECVhAaNlzww3TrbLTII7wY1/KpdgqGsaa+MVmGTab33WEqSw
	mo/geUgg+g73U2jNuzejMszxW4Dz5zrqFwmbLFEzhy/RFHjvIUKBG3sVk4xQ3cXXX3aWFJ48r+U
	EXoeP4J+h9HqVMAiZt7VCzJD1tfYXFS5DPdLfoNY78Tow1O+WeZHMYUmEfnhmm6lGwAdOw+u/5L
	N7q5G0/BXg14/BpVpsQwa38E/FKgb/hBSXfpswZZOlyy0PvRY0TI2DIpoBdOPK7TtrAuc1pEz5D
	r2Ps+F1ZCdGbvljt6WKFByXv3OBYCnoKrSgifkHP+Y42l5TxUQDGzGLYJUeNnrYVdUpauYwDIS8
	zhSTMaP2DrbJDyFFZLlwl+hWGnPhepfR+Nsy4JzWl/K2aYJ810l2Mv365ycpS5bT53ijE/tq0Mg
	SVH6zv7VGVKkXwqjLs
X-Received: by 2002:a05:6122:469a:b0:5ea:f399:781d with SMTP id
 71dfb90a1353d-5ee0d1d05c8mr384452e0c.23.1794277105142; Mon, 09 Nov 2026
 18:18:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
In-Reply-To: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Mon, 9 Nov 2026 20:18:13 -0600
X-Gm-Features: AclHuK9uu4Zt4AmknOEeRBG3AMABDQ7pzydp1LGIC-VkddAQ1RAQ1A1MKWWaYa8
Message-ID: <CAKobHXA5QnH+1APCD6rL-yS4LvSO5y90wEjk6Sz_uYhmfv2wmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] wifi: ath11k: feed mac80211's airtime fairness
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, julius@bairaktaris.de
Content-Type: text/plain; charset="UTF-8"

Jeff,

Please drop this series. Julius Bairaktaris posted the same two
changes three weeks earlier, as patches 1 and 4 of "wifi: ath11k:
airtime queue limits, airtime fairness and a driver TXQ scheduler"
v5:

https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/

I missed it when I searched before sending; sorry for the noise. I've
tested his series on IPQ8074 and QCN9074 and replied to it with the
numbers.

Christopher
