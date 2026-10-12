Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FE7281532
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811533; cv=none; b=Aa561fhAfoicjwX9MknXWHf7/S5q+l47EDL1NlKogg4VvSwnJQKpX2AR/1zrU3zsnKnH/xFvfrJwD481rezRkyBe1sh/iR1++yr+SMI81ZHOyMGXXr5G0P/Bg/4PKFeGTS/ykuT1YAq+ppx11MEui2Bgx/3xOk1RjjycfnAzxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811533; c=relaxed/simple;
	bh=HrmalTditcZrNiZ8v+KCnPbL2RJYFiSY6wNR9nLzrkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bj4qb1b2z/mwMuTv+rVbAtWjir68tL3FAY21lw4VcYKKzGK9LD5JiVncx5pbCqso7xeCL29no09is4VeZzLVUdGEFolPHwivuwY6yIyldVlw9mnsJfV4oaYRz90Fl0La5o+50pEYSxU9Z4/2AylHFoRD/04GyZCqZ6k0R8K3WDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLFv9emJ; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLFv9emJ"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-154e9d2d979so1193187c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811531; x=1792416331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrmalTditcZrNiZ8v+KCnPbL2RJYFiSY6wNR9nLzrkA=;
        b=YLFv9emJB9g8hZdI20OIuKfAu1Y4EUn+7wquHT/JbbB00a+XvWY47ir1lU1dWxgmat
         SqTDmf0DVsf5s4Hv8cX71jqsWVsVuvFDrAVrt3T/PNx0GRcAvHKYQLU+NyomiPgBrqe3
         mgKwYD3831a69YK4xWZqGthg3OM8RoYYgevZI1sVe0tQsNG3zCfQ6+ZZgD195+gzS5Vx
         DsPQjwFuerKzFLx1wdiOyFlk1g1bC5PLFBJMZ3LaArz+60hxlRr/KExlrI/Yk6TrAAZB
         VFwPa4dFRjgKDEmrgAE5C4xhTpFqmAWBtW/XFNB+zK2hw5ngwtFCp+Jcgx3emJjKxN7G
         qp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811531; x=1792416331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrmalTditcZrNiZ8v+KCnPbL2RJYFiSY6wNR9nLzrkA=;
        b=F7BxqPeqsN19KhfXO9ws3KQyIvvs3JGuxebqFj1IDiUglyjGoSMUIOuDNp7+TnRCSb
         lWhNQW+88J/9GqXwUVA7FLaibS9ahFKrOFYX8Sysyo/aMiMRXiOJxzo3sFXzaNkwVesY
         Gxq7o1Ib1zS2owISf9pP9y+Gmyy2MN/WjR0BwwDNoYQ8sI+vQQ3H4sFwL37gG4HA8Mlu
         slXFshsZVowHasNB3PhDKae4Rbw6pJrt5J50GpuhnXjV5Xjtm6kuLLQN5d+XqoM3j8Rs
         /zujkhbuSt39nQIQxxbab2Ltx75WqncyvyUCy70nDpH85EPqp13Ko3egKeLcO0qoYReI
         /Bog==
X-Forwarded-Encrypted: i=1; AKwUvBwwaXNftBEtzQI8oXmJ9FmixZWI5YeCAlSYhU+RDO5+PEfhUimB3bgh4maGKfDR8PRyMkFF+yvDk6YlY/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWxZ3sbe5S797zKvzlgGzO+AU6kZg4FgAhOkRKSO5yFFGdcWRj
	nU2kaFgpnDyONcAeCebMJCfztruYEV/8E0x+eKVw+MNiQmyaiiGu6xZc
X-Gm-Gg: AYBFou3WipU+0FqRP/1wwg/uwgMv94J6p5y6NrRAvKmoxQxYglr2MksMnsSMJBshdtw
	GFFITJH8apdokx0VjqTNM6t87o0smE+LMB8pBvRvBhptKupNACzOXlN8H6GDLH9gyQK7tzpP059
	HVB8XbojfifwUL1PTab9/djh0nU0D+DIzVi4VJxXfn5sJxtp15bxBAlunneSLLYejEQxqJW5j4u
	YBP6m8T/qWff9XG2kBbWoiIQmz2wGcQswaIWl/WpK0Xx4a6r9kYqyJ0k93di2x8PIVoL50cnYcE
	OdGbvpdWnwZ6ng8+oQglzEbKfKhVWJjZtcXALcsgxnk6Jk9VfUVMXE1z9fHnlFcQgTaFjGmYG8A
	y6kRQBgSqBGEu7VXUw55CtCyZDvieDtHqqLENGNnKPdA2J4nVPNiOVMApFfvIajdMVmBN/cGayV
	tIR/iNCendR5CRUsXTu4bZ7ueqkvjxhjQRYLqQlcMCIIJssy2aR00OYmFyAgt6+PRs8gcj/QF66
	C+UQcBK6xWIdewSQDwgHfKNtkVroFrzLELtQhJl5OhlWmcByyAYA+m5NI4NBA1ccwUlV85G2qh+
	E9aFCFT4YXLQR/N7BHSbYgTDrLLUgVlZzHSXsAcT7dPQEf6fUqN8y7eWMOXOhOKAGXS1VDAvRXQ
	3Yr10PqWWdCJUQzQibBNAy1NiFYKW838iQ47kmgzYAPkTXOoOZwAcQg==
X-Received: by 2002:a05:7022:5f1b:b0:16e:a290:12bc with SMTP id a92af1059eb24-16ea2b0303emr6974568c88.12.1791811530714;
        Mon, 12 Oct 2026 06:25:30 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a620bdafsm39584553c88.23.2026.10.12.06.25.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 06:25:30 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] tcp: don't set window_clamp from SO_RCVBUF before the socket is connected
Date: Mon, 12 Oct 2026 18:55:23 +0530
Message-ID: <20261012132523.48360-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179180390054.434549.3187163637190599944@kernel.org>
References: <179180390054.434549.3187163637190599944@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 12, 2026, netdev-bot+sashiko@kernel.org wrote:
> [High] Does this check cover every case where SO_RCVBUF is applied
> before tcp_connect_init() runs?

You are right, it does not. The socket is already in TCP_SYN_SENT before
tcp_connect_init() runs, so SO_RCVBUF applied in that gap - via
TCP_FASTOPEN_CONNECT before the first write, or via bpf_setsockopt() in a
BPF_SOCK_OPS_TCP_CONNECT_CB program (as samples/bpf/tcp_clamp_kern.c and
friends do) - still writes window_clamp and still overrides the route
metric, and a state-based check cannot tell that SYN_SENT apart from a
post-init one. v3 will instead distinguish a user TCP_WINDOW_CLAMP from an
sk_rcvbuf-derived clamp, so tcp_connect_init() and tcp_openreq_init_rwin()
apply the route metric whenever the clamp was not set via
TCP_WINDOW_CLAMP; the selftest will cover the fastopen and sock_ops paths.

> [Medium] Is the part about the case without a route metric accurate?

No, you are correct. With no RTAX_WINDOW metric both the old and the
patched kernel end at tcp_full_space() - the old kernel through the
"window_clamp > tcp_full_space()" branch, the patched one through
"window_clamp == 0" - so the advertised window and wscale are identical
and derived from sk_rcvbuf, not from the defaults; the patch changes
nothing there. The real impact is only (1) routes with an RTAX_WINDOW
metric and (2) a TCP_WINDOW_CLAMP that a later SO_RCVBUF on an unconnected
socket or listener overwrites. v3's changelog will say exactly that and
drop the "any application" / "without a metric" claims.

pw-bot: cr

Thanks for the careful review.
Shashank
