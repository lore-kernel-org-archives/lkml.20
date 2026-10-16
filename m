Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006F386561
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168579; cv=none; b=i9cOQ4cNjllvzxbZbVoWSxK52B2Mep/L/aPa9ZJ9lXoLhIk/QfCVkWwHguWZNY9+rCmXjOhypcdsKz65dRyEGolb01XdViJ1cfiYKzgFBTvhnWiIlr6ZFzuxy5qF7ki7tWtarrCmCObrLKCUtfh5P7iXxMqHzn2prMJEpcvF/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168579; c=relaxed/simple;
	bh=StqHeobwjbZoCDJcYG0T9/0ZBnyql/5JqI+bM4v70Kg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jpOyspO1otpfElQ77sLRjADyzizpswHnnMYd+oRkYX26ojmevg/uHp3j3ygnxF7YJLYfAFGSzfbC1FSZPASZEUmVFJvFyjNUgVXG1SbZXkwa1qQwIn4Oow6mYgGikWRg8ovbjjacqkXpvU0DSoH/M3xIb/YKv0rDGY1//LeOx6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbGxzRbB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbGxzRbB"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so146259a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168578; x=1792773378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StqHeobwjbZoCDJcYG0T9/0ZBnyql/5JqI+bM4v70Kg=;
        b=kbGxzRbB01/HFxgSCslnEMSCvlZZRVvSOkt5CeSsr1Xg40Bp0XMcPWYIYNKca6dTB7
         NyFvH/1Q0b0Yd7hZu55+90O5Au6jCOjeH2zWz01ut8cpyZdKwlrpbpseu4nrzANjzGXD
         L+0YhifhKSJvwxeU5RMC0kGJUrKMX+WGEGiI10nK3mN8lmpoLzpdqObkbRhyCAsMu/0T
         Pju0oz7bbLswpCY1nCiW3QcpKHdpti5lSzivfNT3wJOhpdB8t2JjuPE6WZqDyI/+OWP2
         go1Hm8ATug0a43gvOxrTwJ0avIQNCky5t7Mzc3oBn0FFW80D6EKUXbDGZcnfM1vp/6Tj
         8JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168578; x=1792773378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StqHeobwjbZoCDJcYG0T9/0ZBnyql/5JqI+bM4v70Kg=;
        b=dsocB0T8I42Kei/eUGnXFpzrnTcMipTu/Hc3yrdOjrVNOIKh3NEIj134rzcHx1iG+k
         1QPQo5QYlGfVNi6hrCUo5L+GuGg7QVG3LXqhjiBW81An8uNpZi/M/WGpRiW8mnCK+fM9
         a7ERYsEygyakMZM1di8xySU4x4eK1bCg+ragAZmVcgWErE+dva9pGOCG2nvrkUDd+TNM
         ebYe9/URwtLT3QywX+5/YKTgHzSIh/GWNbGRVPF1Tb+6mf5G3vZfqT4Zzkx+SwReYVt2
         2niPasrQ4yDj0A6Azbe1yUaFcoOHfpYDtuBdDxJKWh6LSXweqSuoL4K7muo5UgavAjkt
         7xLg==
X-Forwarded-Encrypted: i=1; AKwUvBwqdIXocCz0QJ0k/4tH/nJJRaA539NiNlm5Y/0IfzUNW7cvGiWWjsqHUlT4tAOlIZQDTumKfCHLE2efgwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqBU/GPRQQcw0mGtAqPjr48tCx+B21IjiNSVSwUcZirRHE7278
	YcCLs1HXItJZX8DHPWI0RqhDylIl47706ni6gkGsZMTtYxUs8JD1GOxf
X-Gm-Gg: AYBFou2PbCSGBJby8a9Yy98931wYFHzI1xUO3ivBfo3ojdGYsWRVlRlSbvXRnqRKt69
	s/BBOtwCyaBAx+Ypg79asWympZ5uWmF3JSfgMMdYE/lH37rA/y0rPXJVztjKS/dAM1SncXPyfvz
	ywJ/Dm5FOwnq2PFkkzNiCxCvmFlOnzKTWovu5Z9NdjNxv4wFvz4n0AP0tSTB1pnf3yfqRFewpJD
	DLfKw2N+g3L/GftINrCC/zNOxoV/Cua7AgfFh2Wxod8Ph6ios6eKuPKCrJwcZzEyKs+k0ZmCFFJ
	fTQjXqo5Vg/NpgdVq90cs07IU7N6FxmXtmQeoatOIQwH6qy3rE75k3t1oVTSN9uufLF77PMNopf
	11n2CrRiUKiKdV4jmCK5bphO1bxu6tMiumjG+oTvLq4/tfp7kAEBTmKcJ1fcKAqtBKucO6rlvhh
	UUTG5JsrDc95EpFLk5NgPL99i/6Th8/crYTtp+XPPY4R1YbuBM3xrMPlebJHxicTVMzP5H1jWKq
	T8=
X-Received: by 2002:a17:90b:582f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3acef542fa9mr339539a91.58.1792168577746;
        Fri, 16 Oct 2026 09:36:17 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc492fa54sm4797470a91.13.2026.10.16.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:36:17 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bitops: Share the generic ffs()/fls() binary search via UNROLL()
Date: Sat, 17 Oct 2026 00:35:49 +0800
Message-Id: <20261016163549.636471-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <atJN_MOFxvqOM9h2@yury>
References: <20261016025634.2690862-1-shingekinocore@gmail.com> <atJN_MOFxvqOM9h2@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 12:17:00PM -0400, Yury Norov wrote:
> Alright, so the basic idea is to hide the exact implementation behind
> the macro magic. This is highly unfavorable unless it brings substantial
> improvement i.e. in code generation. In kernel we're drifting toward the
> exactly opposite direction: getting rid of those macro tricks folded one
> into another in favor of the plain human-readable code.

Thanks for having a look and for the pointers, understood, and sorry
about the length of the description. I'm dropping this one and will
follow Arnd's suggestion instead, replacing custom arch helpers with
the builtins where that simplifies the code.

Thanks,
Tzu-Ching
