Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814A38236E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492043; cv=none; b=OKOcm3OrST+X6HiEjBwPnMVcmOXmjft/klvHulc5K4EJhzsqy6MFidtWcCes1yzMBPnha24bjyJH3nJT4rf0bmU+eoqqfkaLwpXGE01FkQFTc46hWPUo/bbKsHdDCHV4GOxuul8sIgJu9S74XAsxYkTbKVnVY6vjOzSBDwYcjdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492043; c=relaxed/simple;
	bh=Rp2X+dx5hQ3lt91Pr5vYcPaasxyyoToGNSTmo5cX7rE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PW+XP5ObK7pC57keX4aecBD+6WyRofU+peVMZkgINQi9OJexAA65vm2w1FygQ2bak81sMuaLud4JZ1AZI/q09P6lg/FzCiJIZI6Ix629q8puu20Rs8aqh7E4InVf8QedowxTfqYwDKA6w/G7nE7vs0oyvZ4o34437TYaZSOQVxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVmgCx8I; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVmgCx8I"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b021dbso533339f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790492040; x=1791096840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=blA64iov7PIlD+oGU3ZepcahACLOoCoJ8JGCVHSsjCo=;
        b=GVmgCx8IWI7BJwAGDmQqubdboZkfj9rKj+kWI/YizjieVCyI5F5r/LcTUzaBK8LZuv
         +Jkv0NEwqONlns2PLh9jel/dshFd7vQ3RpakjyBu3MoUQRlVB+nr+sC+uMspPrjWWKkW
         uV5T6rwrrco27Ro2bnNZsHhwFawMMdF5Umg5uNAwvO3hGeLH4cex/Im5CqxwTXwYjgyc
         uiJgyeZeqfUo0oJe5XNNpUBWoKwR/48ydQHVoUNCCoZmg5hJ9dI74lBlIa74TNmtAe4W
         kkVzpoiX9s39fxRLBfFgor7wv7C7CNutbf3mEqzOWYX1GomXigv0TmSTPlCT64V4Q/DA
         iTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492040; x=1791096840;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blA64iov7PIlD+oGU3ZepcahACLOoCoJ8JGCVHSsjCo=;
        b=NozkZNYFTpOT2XWaGOXqQ15cc/Gj5N/wH0DxL/baBMdJ0u8WsrIlOIbcHVfd3bH4pD
         w1unFakwfyLviE5NywUJ2N2NJRByv5/9ktPeyXANZyg7L5RapYwQJp5KRIb2T5QjnYvr
         /EpRbaafkeziKUMgluZ1a7o1TrYNR2aDgJw4mPxNXDlqx8n7BEDoBOnq/RylSfI6yPjg
         ZkXMUKjy9o+5th9npvTT7OOAK5uZYPIE63EbLdb4SV+JOKrKD2lSfECGgNEjKEOtATbQ
         dbiZcRQCpo5DrSXVcW9PGim6VirBfYtonmZIdQnuT8X/wPO43rgo19gX3+QuG+SlL2xl
         zhcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYxxWZkMbAo6BJuyZo34FYyhv2UZdZuOkiIdOap9VtS901sUlNa0Flx/WuSdJ3TMB7rA9JBY0dtcyoFbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSia6LSrn1B67QZ/UudAcJibdRyp04xnJ5qLPSEHLHIZApApxH
	ucTtEeFCh/9ma9Asf4hEiC7nFYF5zeIRdqQgafZApdCTrTUGKt2iaYJN
X-Gm-Gg: AYBFou0za8ZKLaxBnlwpEOkil4QxGyDgMBbUEMZvhyFfOhwwh8IjI5r42AhoC4a8VtK
	6cAv1sex79YK7FxvViqVM2ZD44IwpxRKGfo0SWPc2Dm+h81wgT7ARPYOQQRHGwDQgDbDT096dCz
	7gSv9/dty76Q4aaTw+MUCKZ0RWbR3L6bX7Wk6efend2GX5REA2n2tkJMmGWJ1/JNfAZBxRrbk/s
	2REBoA0NaSCRVZpKLU7+WqkZphamdb53ONlry1/Cen3/H9YKRYM3ZmsA/wvQHBk9CZtz3BG+bY5
	W0rjhdaEdOvznG4XScbzTF7W+yXQDx0rNqSYPLIoDtzT7dPov8irqppAg/gQIEpt7kmkEDtRlrG
	HeT9SZJ9lb61SGpzLdP4NA76KLuqTK5w9AIZ377pmg3iaNOuFi2etP3okBcxnG1old+H5ALUybd
	4uFBuclLk9ryaaX7oM+t1C3/i4/EDP56yIZJX1DRZ5XFIrEZRyhbcUzW6fZmT6pu1CYnZwDTSs7
	fpVVUqJji6kFFGK6hz5s4MD1eq+27QpOkg0QN8OluE/YQ==
X-Received: by 2002:a05:6000:2504:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48871878daemr18432269f8f.57.1790492040099;
        Sat, 26 Sep 2026 23:54:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm26432209f8f.10.2026.09.26.23.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:53:59 -0700 (PDT)
Date: Sun, 27 Sep 2026 07:53:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>, Ido
 Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, John
 Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 1/6] ipv6: reject a negative optlen in
 do_ipv6_getsockopt()
Message-ID: <20260927075358.129e5f65@pumpkin>
In-Reply-To: <arbE6i8JZrOs-DO9@devvm7509.cco0.facebook.com>
References: <20260925-sockopt_expand_out_v2-v1-0-c3ef2e3bb5c0@debian.org>
	<20260925-sockopt_expand_out_v2-v1-1-c3ef2e3bb5c0@debian.org>
	<arbE6i8JZrOs-DO9@devvm7509.cco0.facebook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 12:02:22 -0700
Stanislav Fomichev <sdf.kernel@gmail.com> wrote:

> On 09/25, Breno Leitao wrote:
> > IPv4's do_ip_getsockopt() rejects a negative optlen right after reading
> > it. do_ipv6_getsockopt() never has, and nothing downstream treats it as
> > an error either: len is an int, but every consumer compares it unsigned,
> > so -1 behaves as a huge value and each site clamps to its own reply
> > size.
> > 
> > 	len = min_t(unsigned int, sizeof(int), len);
> > 
> > So getsockopt(fd, SOL_IPV6, IPV6_TCLASS, buf, &len) with len set to -1
> > answers 4 bytes and reports 4, rather than failing.
> > 
> > This is a bug ready to bite us in the near future, let's get this fixed.
> > 
> > I've found this because testing the rest of the patch was returning
> > inconsistency when optlen = -1.  
> 
> If I can do getsockopt with len=-1 today and get 4 bytes back, isn't
> that a uapi and we are gonna break someone?
> 

Treating negative values as 4 goes way back into the pre-historic annals,
And I agree that there could be code out there that fails to set a value
so passes 'dirty stack' and it always works because it never passed 0..3.

I suspect all the per-protocol code ought to be passed an unsigned 'len'
(and return back a possibly modified value for the wrapper code to give
to the user).
Then you have somewhere:
	/* Historic bug compatibility */
	ulen = len >= 0 ? len : 4;

David
