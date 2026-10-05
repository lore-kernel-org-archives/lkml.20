Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8CF448CF7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241649; cv=none; b=pxU3RnmkxzgK+dhztXoAwsoXJ3aP9/7YFQvxSZgiXCtzBGrSHmRzHxdTK2GhLVnxqgDXJhlBZarEGiHpH8QrCfsoiahRqe3yKjV09vHqyJezaBQ4+dcEW28WBH8PrKSHkYDF0N1yGRsSmtnfws32Kz2Fw7eAPx1TWmekIW3GKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241649; c=relaxed/simple;
	bh=ID5MUzGb83kk8Rb++yvu5cXcrO865oN/cACU7edZPeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqhyCkuSh0TvOUEYaL0FyNRRk+7oUbincaO0wY35AiSS4frxXyZnjqYobnVJ1hM+7WAE9xuXaS4bFZc167vQYDp9QRAH6jKgiAFr7AC3iQjEhXDQzPmXy7hhSB9FjK3pQTYAw+Zp2z2+Yw4AfEXp+/jfgN/lKYdQiRO1DmsN0ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDqag+fV; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDqag+fV"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a772de44c5so20049661fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791241630; x=1791846430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAH0M62CAJFlGPhxe8liaDm5bbJ/KfgviHm6E1Thxgc=;
        b=cDqag+fVOeH8ha12uS73EbLD2RkGD6CY4kvk4I7Gxxl2E0GLrQt+weS0aWQ69nbTG4
         S5bz8aAeqbDW681FNy7AR0HkSPMxsvpI38r+o0CanCnAnIf2vJINX4jUJ0aHyoSlsCyu
         q12J+kW2sKfQaERydmXbbrkhYWK6t1EauoUQzrMADk//GTGsQElbejJGxte7yzmLX/tj
         CJAydaD6xq2+stzEN7dBrPmZALyLGuz6bKHnTHkYZFQYRyzv1P6N0hdelTNz2iH88NFU
         9FO7YvdaQfDNdd6OkXP5q4J5mKFDyY4d6N7pfJtAucr/PwXassO8xpepa32e4fNEvCE3
         9U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241630; x=1791846430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAH0M62CAJFlGPhxe8liaDm5bbJ/KfgviHm6E1Thxgc=;
        b=2TVwmg6LJ32Ik8APs6xzhPT4oNxE54CSOYZUkzaIGc89NVMckxYCcbR4yBtZ0eeOvY
         /ELagJ/03Pf45qNUiIFpH0WdQreu+u3GEnBpSjtyI7irJMOIDNOE5Yqsdo3qdhUa+7Ui
         92Ql1dY29njQg0jvJFlaTnCHru59+R3S1RhblC1gca9nAlZo6QP0exMJhDtf3o8o2LdD
         MTBEgRcN1Juws6yubOVDeCKcz/ya73b42KHGIonldX8HJtqN5e9rWs06Jl6Tmm/VnDBz
         wMeAJLQdFDbgvb10BCFAzU8W9oNE0pEwkgewyrSgtZn0P9lSPPfxpCWjA0dXP4cljulG
         df6A==
X-Forwarded-Encrypted: i=1; AKwUvBzn3xjskO8iWjU/foHqslkcbfiU7ElJlTR4dfSiNym9zyharSCPcqIeZzwhCZF2WX1Qws5IoqoC5w67i7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYILRTrTQSg1JIbnO5uxUaWCjay4g+A6Q52blqEzzUOjkceTCtaU
	FJQavhlIA0ow5VZZg9e9opphDueFCRANxpxF1rE0NcrAa3D/R3lvi4jM9WgCdtS9
X-Gm-Gg: AYBFou0ZozdZV5AFpvc7U9GgaxtHcpPhB1yLQ3rrmpWz93iscAGRkgEWFjHEKqb7KjP
	NVwnhoMeZeRx/CHgOcj6RhhUzmGTw/5rIhchiGz/6nZSyP/9Ehw22/fTAnK5T85f0JcL+kkPpf6
	q/ENxz1DRzuGM8b9xfPg0T6EWg6VK1NL84X4lk3VLdZmsIZCi76NNnkXdbep4lo7t+/S32eArSY
	5xs8/htrl6c3wzweVgfOpC0u0ULg/HE6od9a2APqeXBw05ezlSYkHaQhL41jpNrrywBhvunluRn
	ufnq2eiI/398LTcm4rh2gF4p9o1rCUJSTmjnThaFym+boGhskuy8PFT9pwTLKx7DIwxE8RiBJ7H
	I71chw0U2IvTI3+lqurstquTR5RJjf/qc6BOhH3oBNymsNQjfZ+zzzUJOn7dhX9IwN2Jaja7Avv
	toaxnju/4eiQJ6U1hUz8xXov+cGB83zSCAAgKXJwIvHmjzpnP2TefGCHE2jN0/DgvRPDUBsqkTn
	7yhIFkyeLitm5yRpds6FbcOKdGTld9zOI4DBVS8+g==
X-Received: by 2002:a05:651c:a38c:10b0:3a6:5c75:b3ab with SMTP id 38308e7fff4ca-3a8877b9a42mr20947621fa.24.1791241630278;
        Mon, 05 Oct 2026 16:07:10 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a8990712bcsm43301671fa.2.2026.10.05.16.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:07:09 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Mazin Al Haddad <mazin@getstate.dev>,
	Matthias May <matthias.may@westermo.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] ip6_gre: use skb_vlan_inet_prepare() instead of pskb_inet_may_pull()
Date: Tue,  6 Oct 2026 02:07:03 +0300
Message-ID: <20261005230705.932167-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179121211133.434549.1381649683777834470@kernel.org>
References: <20261004145205.226974-1-littlesmilingcloud@gmail.com> <179121211133.434549.1381649683777834470@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026 at 02:55:11PM +0000, netdev-bot+sashiko@kernel.org wrote:

> - [High] The check/parse mismatch the commit says it fixes is still
>   reachable in ip6gre_tunnel_xmit() on ip6gre devices that have ...
> - [High] One of the parses this patch is meant to protect is the one
>   added by Fixes: b09ab9c92e50, i.e. payload_protocol = ...

Thanks for the review. I measured v4 against net on the cases it
points at - there is no regression. For a VLAN-tagged frame the outer
header stays the same where it was already wrong, and either starts to
inherit correctly or is now dropped where net let it through:

  tagged frame                         net        v4
  ip6gretap with key, ttl inherit      hlim 64    hlim 64  (unchanged)
  ip6erspan, ttl inherit               hlim 64    hlim 64  (unchanged)
  ip6gretap without key, forwarded     hlim 64    hlim 32  (now inherits)
  20B gretap / 10B erspan short frame  sent       dropped

High #1 (header_ops branch): that branch keeps pskb_inet_may_pull()
exactly as net has it, so the mismatch there is not introduced by this
patch. It is reachable only on an ip6gre device created without a
remote that is later given one with changelink. That belongs with the
rest of the ip6gre changelink/header_ops handling; v5 only narrows the
commit message so it no longer claims to cover that branch.

High #2 (the parse added by b09ab9c92e50): yes, ip6_tnl_xmit() walks
the tags again after gre_build_header() has pushed the GRE header, and
clearing mac_len does not help that walk -- the first two rows above
are unchanged from net for exactly that reason. That inheritance is a
separate fix that depends on this one, so it will come after. v5 fixes
the comment, which was meant to describe skb_vlan_inet_prepare()'s own
length check, not the ip6_tnl_xmit() parse.

The two Medium notes are pre-existing as well: the IPv4 paths
(gre_tap_xmit/erspan_xmit/ip_tunnel_rcv) and the erspan_build_header()
reads on short frames. Fixes for those are queued separately.

v5 changes only the commit message and two comments; the code is
identical to v4.

pw-bot: cr

---

Anton Danilov

