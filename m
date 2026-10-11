Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388453C65F4
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791696382; cv=pass; b=VkZU8j3r2QDuWuq+WKXjjRq8P+VVyukGkU0ejQ4XfWdofvMcjr1jx3Slk7N2hHuCoexZpUE4vMtX31tCEhGaQzbDI2UkdC1g2Lhp32pRFpxOToxHmii3K184Kq2BtxRu1uHU84CoUdFpuYt06HWi+OY2TSFFX4LRkYMv/+GavwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791696382; c=relaxed/simple;
	bh=77rZFfgjYBTlmfFxdEKXYN3j8YeaENiscAJklGZpDd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gutvwWHnF5xNlDTnZKFCs8q9B1wRNzvvzVBk9inZFvkB0YOEPooYx2TAlWKH3ho6qIZWO2n4iulvDv4W4q8QXsMY5TxduToeO74hPfiA/IURYoR0S03hMIpP83EZX71F6+g/38hricfIBbKHuf4qINxDzImApLC7P+yC5R3OI4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQsggebR; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQsggebR"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533778ab0bdso12001281cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791696379; cv=none;
        d=google.com; s=arc-20260327;
        b=E0iQBgDhWroegxxJi+DLXEruP60K3sTpnatwL86GhrF5AS2QPHjISrbs99XDwYy8q7
         QetNTo8uuUwKbnNN2r1ACs7JZuxdxSTtYXBaJ6BosSXX9pN3Iz2J0qeqLbYgjpBoloso
         BKhRFV/Jufj29A/gAV1Mg2UKc2boRXLAw4pui1Db9wTMOf4f58W9+TJtceOZyU4VPWuA
         8ggL/+1Dm0n257O6q9e+h9l4HzxHcWDj0ZVSvATyx0lxdAGPtLaAzoymJopn9j8E+j2p
         ZHvCy+eJSPdEAPmsXt0BDEhEWwdYpqVHDkCBYWwuG+qU7YHsi9LBWks7cRiGDr4egfLB
         syTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1i76vSVcCtW46mgdzvE51Z6MfQ6riiMaLLzExFhy9SI=;
        fh=lqcFqVd5+AQKOUouVzq1k+SkzEYjOhvlP3Tm5C9Hc/A=;
        b=m0bhVdIZWxb1Nl6le/Cwm1jauzL6YNytsspsU0pAuCmwvZAWI0Z7RMMZzK4hEYUJBP
         iyeqqILYpeEPBoBfr1BM+aDVwLRSEIUGM+BE8yti0BuU8A3rZSw+P2JvwxFrFmIEtCzJ
         ntuzIAIxq0kZBDZf/OITv1LSQ/CsUjTARb64N70Vq2gSNR+Wxk6o0A3+yfKwx8POm+gC
         hx3hIDT+emufZ+PYRz5rJpUBIx/Kn5qS0dSO2NC5IVyz6LtARNl47TTWi14iYucV42m4
         K9/DzCXXEJxvDU0Hys61GyecWAKX7eUCLgTGKMo9T5xyHJUOmvGjjPmln3v00Xi/rx3O
         bNBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791696379; x=1792301179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1i76vSVcCtW46mgdzvE51Z6MfQ6riiMaLLzExFhy9SI=;
        b=MQsggebRpqTvK/77e7pxNlG2SnjQPv6a1RDvxjdT12CIz0G805TMlDiLp1bYvmXziQ
         7/LJz3W9vYfWlg48v6o32owSqc1mcqTbJbXDmHC/v2fGopfuQDi6Yenzgza2tY+8d+xV
         VuaHiBeJki50JmPymrSMbzI7MOYUA+Vmfl2SlnUqhJgx6LrxUX9eWeP5HLf8DwFcnQbz
         g9mMKTg9XxFt4vtJjX5PqMfIA1vhrqR/QceCx37SzUXyLpgq6dr2b1qhDF6yHcUT3Fdy
         vjGXijuZ+UoChOOWjslxARtQVFz3vax9XE0qpsG34CsBh/0kfLg6QG2EH0tzgg518Lr1
         Ux2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791696379; x=1792301179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1i76vSVcCtW46mgdzvE51Z6MfQ6riiMaLLzExFhy9SI=;
        b=bI0PI/8dKQ9JS+ze8ZMUWdMU3Gd2w8OZy8qLJ/9Hg9KWaX6MJYL4THA+2H0oIpJB/g
         kIlUS1G4pK7lunZtfVYyUIgA93dVdTGFjiGyk8Lv5KDddEcWzIMLophLnP9ha35JignZ
         HEUbJCf3m/8kGy8hU6Us4oFHYx33Lxhlo1Nqnj7mUGa2BqBW7ATnSZYCo6xgGl38reqm
         uhdPo13Zaztw3GUhqxl4DNjGRWzAk+G7NwQPY2Jc3fCnQLHDKHUKMkHJsyoOTTIohGJr
         bKe7cCfHgFW1QxRoCazWLEbYBD7JxkAnUTkBgu9xh0Ds1kQd3nSqU5nSIkldyswYpjce
         SYyg==
X-Forwarded-Encrypted: i=1; AKwUvByM3tCYCVZkGfTC/IuLUktuu1ANBl1eqfhuD5Kq9KbMS1+Q60scbLBWzWSgkgDYjZXXsv7izjBB8Co+QPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAHHeouC9/xnk2Eb96QaVl44HceUTOV7AubFuVNxCRPxOAwHGo
	Ay3bwzuVpGCZt3ZPwkR3kAEmDLJc8h8ax8ntKK4NWllwgkhu8vzkIcDeNpMaLJg6ZaOxxW/lD5s
	o1BwqG7f0CcgkvAKWQ6XDbobqA5HmM54=
X-Gm-Gg: AYBFou0jZ3gBMVUsRAlX5Y9KNr6vXhkjXJS68VOuI6wuaQ9d2zeZFs5Q4VanA8oDrAr
	UyqwPoDK9uTKQpwT59R1qIXWaVV7GDKQ9noQj9JuQYdFCKtRhdCuIa26vi8LWReyNHJzDaW2FQt
	xVStUg/+dgtZfnL/YZ2VLWjNdbrfIQ5WCuS0JV4WHJ3J/nuaYEoDWn3fEibtQxm6gZ999SPLk4r
	A2G4eZN1NYIx0CktXYsHwie6SG3/S4uRxRN+YmrARwgCFiW8cdWFZyoBpGWH/eV7wnytMIpxkMZ
	N02IZ2tSs/i+vpmzijhs2wnp5qeFllBrULPe7QVJ/cotv9HX+uleVDkbm2wV9IqJvq3iOU/Njk/
	kgw8YvYyVJp3yKj+iZuLFdd5hKC4VFDcGOKF0Lp6TbAaYnDS3bIjbMjFqaT8yith46l8eTlnON+
	Ib4Up3/QKjmipa8z88dhVgJFRKS43rjqovX5VAz6Zc0Yg6SvVtH0FSGimcKQFlYSnNeQ5UhfToF
	ZBj5X1wFmLumbgbJB0HjjS0yHuV8WI=
X-Received: by 2002:a05:622a:4815:b0:535:7692:786 with SMTP id
 d75a77b69052e-5359fae3fe1mr113804581cf.20.1791696379015; Sat, 10 Oct 2026
 22:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011052006.60585-1-jain.sm@gmail.com> <179169628642.2527009.18099159731266030842@kernel.org>
In-Reply-To: <179169628642.2527009.18099159731266030842@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Sun, 11 Oct 2026 10:56:07 +0530
X-Gm-Features: AclHuK_e2G4wGlYi2pZCqS6Wc_bIdvLjmkNcLTMqIuPeyyB_aBbCowg7WmVNY5c
Message-ID: <CA+FWx==a6tGvhtPfz92PJa4CxgR4tGNBGHQMq9jEhX5P-4sB2g@mail.gmail.com>
Subject: Re: [PATCH net] tcp: keep the route window metric when SO_RCVBUF is
 set before connect
To: netdev-bot+sinfo@kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was found by manual code inspection assisted by an LLM
(Claude Code, Claude Opus), while reviewing the networking changes that
set window_clamp on unconnected sockets, and then confirmed with a
reproducer before posting. The patch carries an "Assisted-by: LLM" tag
for that reason.

Reproducer: mainline a5ebb76233b7 built for x86_64 and booted in qemu,
two network namespaces joined by a veth pair, with
"ip route replace 10.0.0.0/24 dev <veth> window 4096" on both sides. A
small program sets SO_RCVBUF before connect()/listen() and reads
TCP_WINDOW_CLAMP and tcp_info, and the SYN/SYN-ACK is captured with
tcpdump.

Without SO_RCVBUF the route's window metric is applied
(TCP_WINDOW_CLAMP=3D4096, rcv_wscale=3D0, SYN "win 2920, wscale 0"). With
SO_RCVBUF set before connect, mainline reports TCP_WINDOW_CLAMP ~1 MB
and rcv_wscale=3D5, i.e. the route metric is ignored. Reverting
b025461303d8 ("tcp: update window_clamp when SO_RCVBUF is set") or
applying this patch restores TCP_WINDOW_CLAMP=3D4096 and the scaled-down
SYN window; with no route metric configured, mainline, the revert and
the patch behave identically in all four combinations.

Thanks,
Shashank

On Sun, Oct 11, 2026 at 10:54=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
