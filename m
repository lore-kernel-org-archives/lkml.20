Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163C8318146
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511187; cv=pass; b=AHh8gVxCUL7IPMiSoCUUVi+gMGhkPyFK0olf1Tm632AsaSLn9vnTtB2/DMxi3rRxddhoaRuy65DGgdMbV9Q42fXLnZzobW/FRX9rzj7DUKppGYX5tLEZpUI4BPW/WoGzNtAp4gd/FG+dMBqUYrXao1PJCUMjlvLyFdc3npGp0jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511187; c=relaxed/simple;
	bh=yqtnp6B6FTM3QTJaiUbEanQouvPTHeGKm4iP1qF+XcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jANu2+k5ovSCial+4D011SzjX5lSGAzLgoIDx8T/s0v53Ad5Y1mniFhGfyG4XHYGeAh9wOFOC6sAW4Z8RGjfVWUTjORUs9oog5Ngte9iFypRYIWJz4O7aTeejR45zu81XzAVpmX7xpGheWzqZQREDiWr5Rz2ut5c6KzIsPtkxA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bfl4ZipQ; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bfl4ZipQ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93cb1c0e851so278233585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791511185; cv=none;
        d=google.com; s=arc-20260327;
        b=pqweOIPnqpw+jjYumowpdkPiItzVI7QmYKfMcPbcXqIKl3Ac418w+KuplRDSYi/JgD
         DrVOHLo88BCzNxJ3g2AtJhp0otaSQ3SL7Rdn+7XW+9JCAbl5UnKwAP8IiqBNBkO1qi7m
         fhpNrTRKv6W8OqgNeTwmhFoihX2PEkJ8YjG3WYXip5KcEw+b1ufr2soQdMvmj/j/8vcp
         cvGj+D4zL3zvVfRq8N78cQ8UokzeAlu8fLOnEEA1lT8GbO/reNrgQ+0sPZBlkPIJmNFj
         7RWL/Gr4koC6S8rXBPq3nWRElMMfOwPefDtbAzRrvKGP+bcFWFc8mI8tjIHeL0j4EyIW
         7zSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HbEcrbrw+e0HaKnSxXudM+yTSGQcwHmdEo8ih7z1ToI=;
        fh=xcE8W9mYwRSLUHUxzBfoIuwRATnpG7NCcMnpaEZJbE4=;
        b=EJxxieOoyPNOZOI8Lk/mNC4yxkFVobCGRwUrxQcFpps9rvSv+cPpj92f3SVfyIThGR
         lhzBu7sFhCiJvZPhwvEu4M03cgekQTOmBdGbWHJFw7cF7iUano8GFjG+5oWWmQKuBf95
         BUbihdQrsNL6cCVD5sMjA5/t6IQJ9Md4Fu32WRuE4spacwnyRL/ip347B7yuAYASMhoF
         K2ckuW0hvdNcK2ug+yriBHI2yRQ5cpVAUrXIfDnUYN7NLM2OblaiehWGgbIawzh16qvc
         sUDRN3McJ6hR331O9x4603qfZ1sVx3wu0HwXZxbAR9PhJOLXiJgnSmTB4yI6k2vV2rGQ
         lvow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511185; x=1792115985; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbEcrbrw+e0HaKnSxXudM+yTSGQcwHmdEo8ih7z1ToI=;
        b=Bfl4ZipQQX5njrGUplZu54Wh0Ghaf0C4zwgzKQuKmrJPSy5jtkZOOIOjom8+Zr8xSl
         PZqzHYdsUFNqE370oULwPulWTvfuYra4iVc/u0OxKt5PI6giOMb+udXSxYEkNAXwjRLJ
         ZzU3y6jRLPMJZtied/ixlJocYm6tdyIBfuo6dnrKMJzaG543eLVF0FtWssEIYfODRcjA
         h6/rzbMc6iRBVEQlz+XMHbC5P330Pv+Edabl/ip2guiP0VQ4GqZP1w839PVmORA6bWkM
         n2zDySFgC6icDp3vqzGZ5G4v0dqShql7erdpkBWE289zoBcZ8LQmum5IVMkRQoVkEhF3
         TusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511185; x=1792115985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HbEcrbrw+e0HaKnSxXudM+yTSGQcwHmdEo8ih7z1ToI=;
        b=xjgGCc+SEawvf1GEO4AxJnY6BLXq3Nj/WcteKofkcVctiSolJXoHY/3ZCmywjHXNA9
         1eZLx1SkTzaqY/649LjaH6d5itxpotYNjMGnUR5m6QPeO3y0BqQy1iHII5Iwb7N7xJ+p
         IEX0eAB06vQX+39Wg87I8kij1R8ScH06cptUnxS5URLsPIiUjUeZb8mi4ic1bdNStQBP
         eibV82WIrcaeLG8JpZM4/UamILMwd92bIjwzaPuw407sEbV29E4A2i6BlSg3WIGXXWor
         iFkBD/LmHtLUlupmpuZymzxtDQxzW5uxYBhl+hiff6hN6ZYtqnagop11ntsAEVcVstcv
         8U8A==
X-Forwarded-Encrypted: i=1; AKwUvBw5cMKRB4beDfcAU9NGaIDBmwG/bqWOsyQJLM0eUssbiNEKC4DUCwxbnlqvr0CbUtG0IbcYsF6tnLwY0S4=@vger.kernel.org
X-Gm-Message-State: AFuF++nA9yfVbtxbK72j8iz+U5xTSmt2ubgo6scilyCVzNt6efa92W9A
	oGn2SEKFod7IBzCfFs9oMid+MOwUkSC4liikNfZBsgOZHacMXZLYR+OprFgPQOLiJZaIpvdP7Cw
	YpdPOhw8dHmWAlu/AahOeq0Y+fJqc9Lw=
X-Gm-Gg: AYBFou2NP7VicOKo7swy0gF1FOVkhR0iCd9YElsnMoCvPWyPJDp97bOS/WgzfuWCmgX
	pwcB92CVJwuyVJSGhq7F0fPndEHD1qNIWi+/odllpQeWNpzDtlrIg2za85s88lnjWfh+rLnABol
	27bUfzKFahGxLUb26gTBj16oX3KFBRzSixnubH47FNOG+tUPfiTZInCxrFB/WGJLCHNrhzoWrRj
	jcN0VV9ZHlRAkLL9gyIM5bo7/lzXbn2n9UPqOvdUR0JtggUfNKVVJJYEya0DwLxpmEHVTEqg7Z1
	HaEd+D7N9xWVSC6eKiTMyqtcLQ4ulyNZUEtH7YLjwwZEGmt/n5b/Ku4=
X-Received: by 2002:a05:620a:2796:b0:939:6c31:2318 with SMTP id
 af79cd13be357-93ebd25082amr66385785a.34.1791511184421; Thu, 08 Oct 2026
 18:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002074551.318789-2-physicalmtea@gmail.com>
 <20261008100352.706042b7@kernel.org> <20261008100424.4c65ed9c@kernel.org>
In-Reply-To: <20261008100424.4c65ed9c@kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Fri, 9 Oct 2026 09:59:08 +0800
X-Gm-Features: AclHuK-M9H-4p3UtOJsHP4i-PkRC8HxqoHrUrMNCxQPZMxSFCUBi2fgLcuQpjSc
Message-ID: <CAJwVaMJihVPQmQNXNojB3KSMCyZkK=1tBTZoxffLmkW9LoZHJw@mail.gmail.com>
Subject: Re: [PATCH 1/5] vsock: split socket lookup from locked RX processing
To: Jakub Kicinski <kuba@kernel.org>
Cc: stefanha@redhat.com, sgarzare@redhat.com, mst@redhat.com, 
	jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Thu, 8 Oct 2026 10:03:52 -0700 Jakub Kicinski wrote:
> > On Fri,  2 Oct 2026 07:45:47 +0000 physicalmtea@gmail.com wrote:
> > > Split virtio_transport_recv_pkt() so socket lookup is separate from the
> > > receive state machine that runs under the socket lock.
> >
> > Please add a cover letter to the series and repost correctly threaded.
>
> Ugh, I see the cover letter now, just thread things correctly when you
> repost, please.


Thanks for the note. I will thread v2 correctly.

I am still debugging a conflict with eBPF sockmap and rerunning the
performance tests. I will send v2 after that.
