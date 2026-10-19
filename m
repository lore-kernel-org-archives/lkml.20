Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427442;
	b=n7/mgvwvzryn0q19WArdAXfyMmPmsYwwR/MN8Vi+UvTvH0ZsCGwcWm/LZeVKggUkOu++
	 d0iwnlzN2pX6onif5ahNWak9Ox7mgkQRJYeHypCQxVZ61pdAjdZRjOr5s2K9kuw+KeOvg
	 xJZfZ6T1CrJIc4gMnYR4V+Ywb0RS0ib4EVyGuPTpxQ83jBpzUmOf74u322aciLK6zz6ar
	 PBem0FGTQZFbm4y1LtacScdnL+trplns3NlmUATqmG37IhH2Vzvhj6zO/Zy9U0T298lGb
	 /NEbja2plkb7XU9XgItXNLtYBBtA0okjgvoxBeirKs88hj2W1eFujxN8A1ZjtBLJ1wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1oUq59+j9dxvzrhFzYz9RKs+wIal5piSXczl/es8C48=;
	b=blD0qEfzpIzn6yvfkTcStAyQzBgOGxe1V4VUPON+Ay7XAmFw6TzQoloZ+lvH2QUPHPCB
	 tfP9OhIQqZakzyPZrTISp2c4Jom04w47De1Dm+M1LaNUH0zLMMmanNsWGprZ2Y3Gz3Fnc
	 v24bOyIhv81oo5yTSGw8j7jTrLt7ku+M+bBdD4Ltikt5aHNsK4QVn2QpMAmHbNG+i0l9F
	 cWNtoTT55c539wUZ9/c9rhMkrDQpaHMwEzO6k1AuBdOyhMhVAhUiQNZquJQyCYFdRbNv6
	 kUHKwwUpMNYfSpBshyr2kadMdIvSMvXrFK9jsK/hdsYspreB8+KCX+7f0AskQUKAfNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ViSkXeAV;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FE606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ViSkXeAV
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a71d0c4233so1030909fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792427441; x=1793032241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oUq59+j9dxvzrhFzYz9RKs+wIal5piSXczl/es8C48=;
        b=ViSkXeAVGTHXPtrWwXNkE0uXkwY+um/P55h64Qo/ErumAC6V0rOD5hDyZjZJzN7X8V
         1vfNGSi8/flgnogRtl+pmSeMV8YadeIwGfSsCzMlY2fk/JUXPdvQ6q09RbQMP/XPV8DO
         JrdaMEa5QXCkbZEXQcnJHufKnGK41jijpcGAv5MNQdsLsrTAT9QCdLsXa7nh/j1UrBz0
         g0P4dUsHQfWxVR8XhHH1dziqz9sG5DZN7TAJZriXW/cV8gmzNzsSeuoIK/+jzyEE91Q4
         xThrV5O6VHKS8KxTHwKxe63rh06+1m+Em70MxYtbU7J6uAsYCcQ+cDGDsDvdGDrIFFKx
         ninA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427441; x=1793032241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oUq59+j9dxvzrhFzYz9RKs+wIal5piSXczl/es8C48=;
        b=r/pABr8iM1q+pNS8UqKgkY3kMX4ZwLoYqnWNFWoo7ZMQdt+YpZ8xnGk564hSD+Uz5z
         Kq6FSk3jX/ifvnG6pA4hVeLb9zWiN1OEcGfGUJOfcyPm2e+zxukNO/4HsZs1aekxbl7M
         JVChDWnu1M6dM861zp9jkLolhdE24gHVIsGtmGhsVGRUUQrYNxX4zTkcw5/SJsSSb1SO
         ebJUMbomxhr4QrtEOwII60GtORfX3fST+nDa6RKphrTGPZRhWmJI88qZn2NN83beAUfE
         l/EEScMxun5oY3BEQ8cGYfdpfntjzNa8ke68xHwVYv0EwaXgzCwRxGnVGZoTfPjMB+DR
         etMg==
X-Forwarded-Encrypted: i=1; AKwUvBz1f00bWzVsHci96wM2NW7tJzdYKoAJIu7B7Javawqzmh7WiGg+/QCyobzgKJ8YEXOKZJWSfO0TG4t5r34=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5GGq5fgPiq+h4IkKmzGaIwC5gydlneIPPKZfkI+H27pRyiLSI
	1OMSuOOHbclMh27XWkRLWOHoRtN8Nb7BKRn+f7q0aUa6ib+So1O8tK1AVyBU+w==
X-Gm-Gg: AYBFou1oJqtu/7m07PNaE5vUZ/LMdbO+MmraLYqnmZZPPfuRBdS5UncN37YxvE6OiiU
	h9dyLwsmuqf4QayGrK+9TY24ZkfXCKFsbC4J9SK+Ai7Sl6kARHYLocnjy3beFegxeAU2wif1pEZ
	PpZkaQ2ek0ZBQXo1MjcNcYbBEStXmyg2JrylaXlq9drm+zM4rNiq/tnt34VftShMjgUUZj/GzjF
	c7FjPB6M3J1Rtpbptss7Lwbn3yq9B21lNCH6MJePwoNP+tvPkR6Fb2HSQ+rb5tMc2Vg/N0OP10Z
	BTaJdLfRJSU530mf69FO5UtlM8MG5Ny6esHDlFGqvPXeQhvNaJlqqXG5TwE5AfExVtAVWdCygdo
	V2C7CFdYr280cG9sdqz5f2/ztYFaFxcyPV1fyji/EIucTa5xkfg55hxqh5OH0niwC4YTAyO522v
	xQTNJ7NVFTZgbnCwTPLZrjCVyu1M2paKvkGkI2gzAvOXHOBw4P2EpgKieXnBEHj9ovgj2Lo6waz
	HOH7gJTfVRdHOXDkqPieNZY4nPmoHQ4pQBMzjO6hBpTtRj67ANXa5FDzrTk967cLXMZZjBUJSMl
	b/kd/9Rpl1yecXBt7K80hipltdYRjbaO
X-Received: by 2002:a05:6870:b3ca:b0:494:7c40:ed7c with SMTP id 586e51a60fabf-4a757a6ae5dmr6289171fac.29.1792427440574;
        Mon, 19 Oct 2026 09:30:40 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:18::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b5b4278sm8210010fac.6.2026.10.19.09.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:30:39 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm/percpu: clean up callers of pcpu_obj_full_size()
Date: Mon, 19 Oct 2026 09:30:38 -0700
Message-ID: <20261019163038.321273-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019162803.281810-1-joshua.hahnjy@gmail.com>
References: 
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

On Mon, 19 Oct 2026 09:28:02 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> The size of a pcpu allocation can be interpreted in two ways:
> 1. The size of the allocation attributable to a single CPU.
> 2. The total size of the allocation across all CPUs, including the
>    allocation overhead (for obj_cgroup membership).
> 
> In most accounting paths for percpu memory, we need the second
> definition (total size). Make this more obvious by coalescing the
> callers of pcpu_obj_full_size().
> 
> No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

This is a follow-up to Harry's fix [1] and is intended for the next
cycle. Sorry that I did not make this clear in the original patch!

[1] https://lore.kernel.org/linux-mm/20261013-fix-alloc-percpu-accounting-v1-1-03e788a1e41f@kernel.org/
