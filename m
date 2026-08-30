Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE15286D60
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788113644; cv=pass; b=lDWlng0AKoHX7jfJdlEhU4KaIVRKzrZRPVX0ovffKTNFmpYvnQGudu1p8iVvDGLjNMc5MEe0CfttqjIg+ficop0zwYtTaZzIQC5U7MOkrRymX+kKCWC6tIBtYBJ78JYb5UBn7/WeMFUOO5vpFl+eCwkd5o4b8Lcto1kD+qF7AIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788113644; c=relaxed/simple;
	bh=HdzWhpqTNOBl+oorJBrdklXOW54bPXg89ysssBhka1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkLt42mb2AKthTMMx4/bCAlFKqs8Ed0JUvdtdSXzxCzYFRu3hZUKOnpLNEDbxFSzmcIX1TqAZdqKJb7TuuCDj1qlH6J0iVaei3Dr9LgITg89c1Y3McsYBdY08rFrNUfY8isnNxJphu3CHSaYkAyLOjPa+PsFEnLnAwv3oavVP/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNoQZ4OG; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNoQZ4OG"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-936e8bd9caaso223528585a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788113642; cv=none;
        d=google.com; s=arc-20260327;
        b=SxE36lYUegPhqiIuANkmWtxShk3YBV6NZqzCvsbOajAhzMDDE8hVOLMAsVPbNm8ep4
         N4ZoGOJOG0Gu1YYWdaNqDjCqxZrk6meUwp+NtzyoVw/0DRpu5SXwyVX9Zid5NySQIuhV
         cnHjWD4a4bHpyfCKCemkqAmEgwHZ2R5e5xgwI1N5BaTkm1uJ3NwxmRHzGwCL1iFLMcLY
         jSsxrG1fr+N8Yi6KsG46frtQB/zN/MZWF3xG+ZVlf9fB9TVBTlPYGrQUgeRwM5BXAxSK
         wyQznWwMprgaosDeBwz5TlLzPhvv5mYzN+P5KXkM/hn7JwXW1znavHmpgBC4ql5deniy
         PvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAmNPF/JjH9F41LuxYyTcqwhseN26JSfCU5penkd+pY=;
        fh=zDEPazsLHeip0CLdfzNH8FUOk3Qu2su6ABlpvw3hz/8=;
        b=dqEXFOof2UdWxbxUvQGJHQeVo67Z5KRG9TBhFlE4oLqQi5/iWlLi2YPdCY2yU5Le/q
         +5FtMaj+6yOeDanQ9jqwtGY/AA2VAZ1M8KjwBSuN2okduYY04hnHLhvdwI+3gLPuinH7
         twV5qtoGI3oK3kMBQl8vVztrLaer6RHfemPg6JbBzS7seIg590KOvK65+WE/YMAlCRv8
         UtpmwfAq5vnFghLxRHflkU5Px7tlSLECugAB2XUjkqXlpIwUgYok6wWUQYKQSHH/b0Sd
         iCxXbumTKzbzdwvZwjgL7EC+1J1Gqj1gzHHTlz4W9M6EFJc2BCbuV07OsFWwgx10vSoB
         eaCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788113642; x=1788718442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAmNPF/JjH9F41LuxYyTcqwhseN26JSfCU5penkd+pY=;
        b=SNoQZ4OGCuiWs3IOfSZkxlKT9kCQ23X5OT2yc81H2RBrxxiKqZmEjDvmVRdyChk/1T
         TSJNaW0NMqJNX+h/f4F3E9ay+HoQGrM77jkcflro/h2mWl5JK95bZCOLHKPcA4n8Jws/
         +4gCsgE0wEo/g4HPIR74c96rz/kO5OWlH9zS6YIlCcMHqPpXba+Yhw1A9CajsRoZRk+X
         KbzGVEBqFSJZw3yHw1HTvLTYBg/mpsQe4KIYUEcj3d5MLeZ6qVNbdNf02pON0r45XL4Z
         MCuvQfOH1zHwoqiS08xBPOppTyLx/wMTGLkvsKqbbSYg7hhtf79AJ24Ax06X5LdNDgl9
         R/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788113642; x=1788718442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAmNPF/JjH9F41LuxYyTcqwhseN26JSfCU5penkd+pY=;
        b=ZY7YnXEuXMtqC0VaD0V3LsnQ+swHMxuXX+Bra2EFHQsfyvlooY5W8nNyinLbkiKsLc
         Wri6koANOxQP6MVU3sGdvZarFSSYTxKwHelyjo+fQVMiiZ4elkH7eIjGi4Ci0597TKSb
         D3i3fFAjUm6N69RVZgynmzT2VNrJPjEE1vCoJt8jOs1FE3A+v2/F+RB2404jDLB85sLd
         m6yP7X7Qsr3CtK2pCaMnZZutBq87jz996T5sBzYFAJOw8oXVhBYYHUow20hA5Ys+aLE2
         JEi3zdY6aDHhX4sqCf+wjiiweBvlhM9iGPb3azc8rT7PYvYs+sVF0Kl3YWqKFeuDyWvm
         5j4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpK7Wtllc10vPoKdI+ChRTkkJ2pWSrb/w1AXeuEeARGLezDY9wizkiPKURkjvda6AN2cUnwVrGRdXlh6+U=@vger.kernel.org
X-Gm-Message-State: AFuF++mksyEr1OczqUmhc4Tcf+qfgqxNfD6djBfADTTc2/12nhOBDsgu
	664wIxGc2hBQ46hkRD1CZpNvHHMJGTbyNTDQeSWqUDIuOIt7c/77Nnf60YKGLhpR6zGoy0Aocyb
	yCrenyESZ++0j3Y2mK76wKIiDFs3+4RFTiBQ+99tz
X-Gm-Gg: AR+sD115QCqm83bnxLMx1zI3Tw42qF2vlyMwV6UxpHpAFUdKUuy8CMJ262n1M1QEm6D
	DBqR6gH0UhokYiSFGTy5rUNcnte/NcOw2dL7AVynNdE1DLQMEliLw8UwThpFMhlbML3win89UMp
	R9EHAOj2AoRXpl7zLpYNSPyWZCeXtdAIx88IrIYvyT0IkSw/kL1OXjW3KROgN60lnoQzDVAweoe
	/Ymlo2vixzTKCu1AeEEM25RgYBR756g2SB+JmcIN+cyaFnTGIMrbISzebchpUSzAx3WJ4Ru4YPd
	Lj0mGlBDTaoa1kr3ZhJoCRffoUvosFPU2wmw8uqMWcyKMTT4IA+mr4dYA7rpjZvteWBHJlBCqVX
	qTH0jUI9XxPmOhxvofjJhRVIJW2GTPWTVLMaRjMpkHfDAFRdaB4gUMDpun1s=
X-Received: by 2002:a05:620a:4553:b0:934:970a:beb2 with SMTP id
 af79cd13be357-93913904111mr2296320885a.26.1788113641282; Sun, 30 Aug 2026
 11:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830151617.3546585-1-den@valinux.co.jp>
In-Reply-To: <20260830151617.3546585-1-den@valinux.co.jp>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 30 Aug 2026 20:13:49 +0200
X-Gm-Features: AcwNN1V16jcKxWw-kvVgE7bYpkcZejTegRvsFb9cvbrFA76wK31yO_UJFO7y4ic
Message-ID: <CANn89iLWSa-4_Agcpmt61FEV=X7YY42nLzW9OLv8=aWycF01-w@mail.gmail.com>
Subject: Re: [PATCH net v3] net: ntb_netdev: Fix statistics races
To: Koichiro Den <den@valinux.co.jp>
Cc: Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, ntb@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:16=E2=80=AFPM Koichiro Den <den@valinux.co.jp> wr=
ote:
>
> ntb_netdev updates shared net_device stats from per-QP RX and TX
> callbacks. Once multiple queues are enabled, concurrent updates can be
> lost.
>
> Use per-CPU tstats for packet and byte counters and DEV_STATS_INC() for
> less frequent drop and error counters. Callbacks can run synchronously
> in the xmit path or asynchronously from a tasklet or the memcpy kthread.
> Pin TX updates against migration in the kthread path. Use the IRQ-safe
> u64_stats helpers because netpoll can invoke the synchronous path with
> IRQs disabled.
>
> Let the core manage tstats while keeping transport teardown after
> unregister_netdev(), outside RTNL. RCU lets unregister wait for TX
> completions already updating stats, while later completions only consume
> the skb and skip accounting and queue wake.
>
> Fixes: 24d9e73c7e00 ("net: ntb_netdev: Support ethtool channels for multi=
-queue")
> Cc: stable@vger.kernel.org
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v3:
>   - Use core-managed tstats and gate TX callback work under RCU (Jakub)
>   - Fix reverse xmas tree ordering overlooked in v2
>
> Changes in v2:
>   - Make packet and byte updates IRQ-safe in netpoll context (Simon, Sash=
iko)
>   - Use device-managed tstats and restore the original teardown order
>
> @Eric, thanks for reviewing v2. v3 moves tstats management back to the
> core and adds RCU protection following Jakub's suggestion, so I did not
> carry your R-b tag. Would appreciate another look when you have cycles.

SGTM, but at some point we probably want to make dev_isalive()
available instead of copy/pasting it.

Reviewed-by: Eric Dumazet <edumazet@google.com>
