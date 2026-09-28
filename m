Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A83B777D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621502; cv=none; b=BVxQEgBqVM9faR6zLopGhem4sdvDt+v1WMB4oVOVanR4yoEELPDWDFD1nVm47DFpX4O+I1NMM35O2LO/wyMBg8zBw85D5Fk9tH0z5WwfyjUGT96+qsGwTgDsufdktDAUgK7QIWUNQ28hBHq3laOdZslN04Rx+YIjx7yaNJDA3GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621502; c=relaxed/simple;
	bh=EBmE3giO3xcXmLQHaSN3V5pizTDx2BGOStLLtNnjxWg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jqbsXSxf8M13wcITfhj8LA6kzlAxauZkQL0BFbR/Byr5QJL3lilDNIXt4M1JAU1sinSzmLttAcZm6eOdBza5jGyTsHRg3/NxrCALIMX+ghA14/H7r4JhckA2tGNehb8y/d4/mSDP7M+XaophY/ACCY+HmUzyvbfG7A5nhH+nsMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dr4lDOvn; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dr4lDOvn"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672c2880f58so3247025d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790621496; x=1791226296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3egM1frRs32ga506avUD6lSWm9sZ+yGf/5m9pLjd+BE=;
        b=dr4lDOvn8cWMDpqyfLr2uUJLpSDHRtYvkaqRkfA9qIySAiiXO7TKdfE2PGyDoRxJMb
         7k9y2wXy/hUeDqZkwDSDGj/NLr7J+szGfhgp+wMBpLbPrdCysGEONA9rTUlabh3ESGe4
         jdI5hv/ZJfef+ywd5xGRtxMx6HDkrAvA3+Imau8QCD9O9hfdr/CZbAApR5lr7VoiF5LW
         +Be25mEvE84oJL3yaGpXCuBsd2s7SimW65zqMxNcwCbWtDPphIBAdbKECRzHugNZRiAm
         qkv9y50xrcd3q8MCmVAP4n1ywYBvFhKMwGGRn+P+HBQEz2B1t8v3X/puBDZtiF3IkhNj
         uYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621496; x=1791226296;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3egM1frRs32ga506avUD6lSWm9sZ+yGf/5m9pLjd+BE=;
        b=BS0LkTu3efQoc+Y0ftqJVckyz2fZPYciBl14CUlikpHm2fTDK/8ypBZaSrX/6QydPJ
         GvSqy/VYlJueghA6iPNQfm+JR9WdSbAthlhn1ntWZsQ8533ZtdKZCnM20hDqjOM/AZth
         Zx7greFUhyG2ZX2XT5pgMGshb5JF56Wj9SXNT/pwdgIJ59GlHi3IifIULUfj01TxR9GF
         jDygtkETioIcuMPXeS2rqRwfJm8ISW+N1FFaanHoICx+1mEAA7XRvGGP4xbPxwlhLlUC
         CIWQPPYsWsMi4v6DZTLYv6vmuTmAztP+M825pvQE2U+C3AtUj8ygR9Tp6ikExjOlVFTi
         x6+g==
X-Forwarded-Encrypted: i=1; AKwUvBxparIopcSeVM9uZ09DBdlb+bzs/AL5f2KG4SZna7fW725pxJ/6yhwhn4PSKHdUPPvokG1sDwII1QMMhKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzqH2JOQfmmhKUZCXqVBkNuUhTluYhR9EoBALqk6jm8SDePPa0
	wjOkyEPbKa3WCn0EXJcRBIdMvh+rOQxlcpUzbAY9do4z3dSNX5AGyjUk
X-Gm-Gg: AYBFou2YSIKo0jcAMsdI+zwAQRyzW7Vj3G5RON8aOj9rH6Mr2B7yTby6WonTScN6G71
	ElSVg6dHOHQce2mmvtWet53hrXZu+JiJbUYbE7DTKSdDm0eR/R6Nearh22pjB1Imw4mzeb+X98c
	SAFGfYbfMoZKU6zunB772hZFp0MJ8LFm5t+OrnAIhYh5ZJjpceI4gkZjkYyqBEfAwb8dXBvXld5
	IGnlbvOgYHXyjF+dCmF/hhnX25KKZ2TtwN+gkhvsiN9qWe2IZLdS2yJTNF1auUhuJfhQDs8gYf4
	4LqJF+IQwxXcKnv+mpwMdd2SxoRYzBJ1UVboGPuW0Y+zbd5YHc3HfDXSp7iL7O4EY3Brux2RcZG
	v2t1mIZEQNExkcVpArM99v1NvllVLmjp4PwkNrSvF9Fdu3HbXRel8LvpWixv0zF7FO8R3yqfzZH
	psKA5OrJErCexgIuWeRFPTULDlgSU6LyQKyT0pPVGVT3gjwDr2E67/5ornV/BosUu6tebEhng5P
	27hWJHCvEMj/VqOLEg7H1JxDHez2S2FGiJJsG7POvsC1HPlrTuj
X-Received: by 2002:a05:690e:138a:b0:675:398e:b887 with SMTP id 956f58d0204a3-675398eba1amr2715071d50.5.1790621495747;
        Mon, 28 Sep 2026 11:51:35 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6755f26183fsm329917d50.18.2026.09.28.11.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:51:35 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:51:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jiale Yao <yaojiale02@163.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Message-ID: <willemdebruijn.kernel.2d99358fa8ef4@gmail.com>
In-Reply-To: <20260926162554.163197-3-yaojiale02@163.com>
References: <20260926162554.163197-1-yaojiale02@163.com>
 <20260926162554.163197-3-yaojiale02@163.com>
Subject: Re: [PATCH 2/3] tun: Drain eBPF RCU callbacks on module exit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jiale Yao wrote:
> Replacing or clearing a TUN eBPF program defers its destruction to
> tun_prog_free(). In the device teardown path, tun_free_netdev() can queue
> this callback as a private destructor. The rcu_barrier() in
> netdev_run_todo() runs before private destructors, so it cannot drain the
> new callback.
> 
> After the last file or persistent-device reference is released, tun can
> therefore unload before the callback runs. Drain outstanding callbacks at
> the end of module cleanup so they cannot execute from freed module text.
> 
> Fixes: 96f84061620c ("tun: add eBPF based queue selection method")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
