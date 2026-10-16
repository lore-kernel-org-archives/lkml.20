Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB33D9048
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136557; cv=pass; b=RnAuA/ULkDk95UG+3zyEpVsisMdnG5PQ4sdtPSyXDoKC9CQlYRyXXh/NWm6T0Mm25EfogAyLBY/tertczdK3bQC/TztceXYpPa3v2o3kZeCy7eI7aIACC3G+ESYiZrhypzJ8oteEIU8kEasAYGgHoTttIHj8oKqDzaw5PQo3ObI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136557; c=relaxed/simple;
	bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWf7rNWXHjfs1/EJ1kUgDAe3BqiznOdzmQEZU42tyCJhh9e+FmTKArJaP3Q9mmPuL+ZEeiV58PFmxNQ+lbzw19v+fkICQAk1OKprAT1BO4Fno5YReX8+nH2m82jAH8MjKogK1y8bHrCQDEwc43t6sIe/e49IyTZkHg+02CDkXEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QBzDCDG3; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QBzDCDG3"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15354aa70e8so2271262c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136555; cv=none;
        d=google.com; s=arc-20260327;
        b=qhMBUI5M9WJ/p4PJZnslbr2Wzv0qV46bVEq0mBglKGo6qZrFq5NU0q/nZ6qptTFbUz
         KdHTPiX0Jas0IpX3tcaI2/TMWI1cXanpfDVD5fsuLXYUl7z8jKEXe6sC5aso7xII52es
         aQpmbx1i7ENNivS3tpS6tg01G/Ogc0Dl67GGcu8OcznuKqFb2dPCOVOyLcBFTrR7mzfh
         BvJziJQ2/H9ne9mRBKcCV26o1l31YF/rakx6290nAbaYHZYv2VnYI5roJgcPNc4e8JXn
         N89dH06Fb8gNZbpPxKthKThoq0+P9lDAnbmRW9yzoBulhTatjOlNKRnP1hbSJ35Mx4BJ
         xvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
        fh=BzuhiNBbIujiRF5ZAyvr36+psQel+Bw9c7zGptDmkYw=;
        b=jvXa9Z2yvXBJ0rIaPwVZPLP7SvHLDHsVpbaV5g6+e3Qsj1FC1PPJoqNDi2pbvNsAIB
         9jEglKZ2iSrqTw70BUi7AkYHuiygKPYJpyXdZhzay/gE+XDqrQKP31ui2oBs5QvBKdK5
         jNxxtpzdAx/MWdpRaWH4XJ2atjIdoG5KmmVsU3ygRkB3nHtc3CuvwajXJ9t5ULyfqDv0
         naR7vYY5RswQx79z71LpANnxZ8+jDJbfmDED9KXtGOPMBSYC6Wf2nZpjDvCxYjwvEUiR
         izptn3TZjSBL3IhhvaLINiPu9PkGbqsFkqESiXQXcL50qo66s47JcKybeFnQYMfdGC1E
         RfWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792136555; x=1792741355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
        b=QBzDCDG3El9nnvMxpifvH7SBsJiKvYtDrWLShE+su9ih/U+GvGYJ+S6yM+rptayoy9
         C6VzxcQWUCXQldIxfKhu8Xz557igSOD0OJ2A1ZI5yC7/EM1Q2QqeArj+lPCxPER25QOd
         Ux7gvSCopIgoY5BGcUZnFu0KOcOtY+rbSbiJ+SSnq6Vqk5yDY48zrTlExQOkczy+MHze
         IL8VKzhG1nC0UcakoQdsX9PqXVQk+NnNiQ0wrggR3dYTh1RVnt/5mGW+GuO7saQOloED
         /56lrDh+jz78wWtH29orfm3Kziwd7axNYuD8hGZtUk05nrrArxzTTYEcwyyZ8DAmWVW9
         PDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136555; x=1792741355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX0h5Bm2UY47Tt2z8myprdx9WcuYmLn5gM77krDjH6A=;
        b=PwuYUL1/U4HxwIQVUxmsh/86B9279Q7keeU+1Jd02BBGh752ldTN7V6s1E6XOaiTAK
         lUAt4PNbZl7tGfXjPC5AxCIDdSUTkNye6oSBH4gEd61M0Q/Obel+CMF5uaY7DqFwyCfy
         vjQTHOca/PlSdUMQnlkapMAN3854n+zCcKenhF7689P2qAk2Gj1QkHU4XBAnvbx7Wj/N
         ywLH+n4VBxvUuIq5Q2cR9gDApmfaZWe4N6tIUbniFst7gWkPlkngqoCOC5z4A2WGA2VG
         qM/niS948n/qIuV//+c+vb42dVZdDJ+IwNOJdI41z61+4mIDOFAJfA9rEyBvc9oH2nfa
         iA0g==
X-Forwarded-Encrypted: i=1; AKwUvBxTUu+yxGZZLHd8g3LtnXXi876DLOxlokkBhu3hWiA/Ac0jOQZ/ZdkM4F0yNiVT+JUOmvLgkGSfT/4amsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/9amqCGKbNFyfaqK43wKNDsqiR3xpSLH0dvymNS2QFyMT4V/Z
	sQw1yEy880nLcx3qzrwQf/CotyTxKClWdHfUp8OXtUYe7yyzrX9R/f6+lJAzbkc+riB+i/mzFMg
	TUdPmQkUrxopR7aGp6KxC22KwM0RcNeczPBjZj1To
X-Gm-Gg: AYBFou2eAIWb8FUzQF73vv6HQeteRn0PBGT1996leeKE8h23TFFZJZgrB7eUa++dGY3
	QY99B/1Ne9aY/kAtWRduHEhN0sg4LsFKK7HNN1WnHgaa99F1VAFQPAZUeKV3REIf7i9/7NMVpOt
	HasyFfNFOrQYbAAQ4Iw/7lQ6yAhCKnZd+lX/RluXhw4U7Nvz9+ZC9u7yVDaGa1qNuEuW7nITczx
	4hvsu2sUD28WicYbk/YuGwnlabWxOtM/iKNYndPQ1IZN0Ul83s88h2lIfnHO75FOdgIWc2cUgdm
	UNAQOiyvgBwb2X24iRTvOGeYykPqHC+wr8V2TAgTKcwK0+cbY2ESua0dZJqDlvdqX+/IsU+SHaQ
	fz5/9/cFJLaE1odTUctf6o3KXftD+YazbzfFZqGd710UDscMVm/j0h33rs2SDZw+X6RM=
X-Received: by 2002:a05:7022:3f0c:b0:151:2e62:fe8d with SMTP id
 a92af1059eb24-16a5dcf817bmr31361642c88.9.1792136554133; Fri, 16 Oct 2026
 00:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-2-tavip@google.com>
In-Reply-To: <20261015073736.2944215-2-tavip@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 16 Oct 2026 00:42:22 -0700
X-Gm-Features: AclHuK_wCNAhqJf4c__nZlElCjEEiY8MOOLk1kNiLFXSjiYnruSv8DQvpSl-nBM
Message-ID: <CAAVpQUAnURtwVgKmRYXTZBjEyb58mxXkeJoMkh7Mc6+ESb1Sfg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
To: Octavian Purdila <tavip@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@google.com=
> wrote:
>
> When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
>
> However, sk->sk_forward_alloc is a signed int that can transiently
> become negative when tcp_collapse() re-packs partially read or high
> payload-to-truesize SKBs in the receive queue and charges newly
> allocated SKBs via sk_mem_charge() before freeing the original SKB.
>
> If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
> passes that negative copy length to skb_copy_to_page_nocache() ->
> copy_from_iter_full() -> check_copy_size(), where it is converted to an
> unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
> and returning -EFAULT instead of waiting for memory or returning
> -EAGAIN.
>
> Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
> treat negative sk_forward_alloc as 0 available bytes.
>
> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pr=
essure")
> Assisted-by: LLM
> Signed-off-by: Octavian Purdila <tavip@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Basically sk->sk_forward_alloc should not be negative, and
I was able to avoid that by refactoring tcp_collapse(), but it was
a bit invasive for stable and late in rc8, so I'll post it in the next cycl=
e.

$ git diff --stat HEAD~4
 net/ipv4/tcp_input.c | 158 ...
 1 file changed, 109 insertions(+), 49 deletions(-)
