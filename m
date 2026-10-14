Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38924E0216
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987114; cv=none; b=BkoB9ElUN++gH5lmyLJlB6pt0vMirTYWRAS+lR5LnfZQ2Z/aZL5QATzPFnbBur5BrVZmJ8qiLEhYTtevje6OMSfodId++d5KAjXnGbgObrzCAkkQ4/Pq2A1H/hIAwvTD4vNX/GE/OpVqknM3A2zsh1uz9ah1BI8BvIta/FqHDcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987114; c=relaxed/simple;
	bh=7jzAi5BeAdIkl4iAKTAGSm/TF0jcqPfEo0j91lbmFbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqJIKRC4iU11/pKnbIHzDwT+0SLQ7tr9zMUWf4VJsIAMmHbunmK339izUdk6GzP0R0pAWAc20J3tE7X+/w3+/Rm3TKoDS9Kq3vH5pTr5jvGP74q8yqqW32itcGO+TgVyj8V0t4thLGV44gdNHEXnN6zp5OiSal8vCu4AurMr6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=DO13oonX; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="DO13oonX"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53505bc6524so11690011cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791987109; x=1792591909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x2RGY30pvB7iMJWThep4HkKVXtai7MDyDWpebau2fPg=;
        b=DO13oonX+1CrHYNmZtjM3EtGCM8K97VNrfHrc4jTQkU8jBO/VDnSlCCheYj964xOhS
         uCvtc0LKGq+A80vLGX/9XptZzNpb4miukyAKctio3qg2Lo/FPfnys7RlCgHxWBeFpmnA
         y/uy31Nli7LKkgfNm7V+b1b4XdxZRNN2eOYJGU0xq5S4ubO6MUY5CUaaIWYAJgx3FEgw
         dkEZzhNl2v7Gj/kEGcHPLc0CKCTTqkrX4RoJgcVLTJM5YDBDcd2eKLO+0waK1QEKppFe
         Nn3j/C9pofPrRfgjtd90LSClFJ+/wR4zvhKEKXTJXwfIF5GBfYDRbwBpx0H8/VfB0EAW
         ocEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987109; x=1792591909;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2RGY30pvB7iMJWThep4HkKVXtai7MDyDWpebau2fPg=;
        b=v1I6C04eIyNWL+sY8wOu9TwM9S6sCnTt3dhuD764hb8on+QAt0hj/V7E+OK57J/qF6
         OrYPw5ZsqoG5wBjrwir+z9XVvrgHR5V14OXvDX7MIrvWqGiDfDU86S1bAxQ5uwnkO3Ot
         CtuhSJNY4yeVwbVm7V1N66Xa+KdCxgtD0bTWuu/5SDtBfQnU/AZEfg+TzL0lpHb8SxEp
         V9r2j9dob3e9o6cPio5H2Yr4Bu68+zsBSv/Z3uDDe4sBEzkCD8Mk2jGe9+Bm/zmFJiD+
         BjEn6Kshv65/a8568O14viylUZ6Qs+nIdR/qkGg5lr8IE+reoHqxcltxnwv5Efs/c2MK
         Lckg==
X-Forwarded-Encrypted: i=1; AKwUvBy5yxYImXsXLVTXjNpGzrRSslVASPJbV41v9VNhXwdc3A5rUtkLp/AHyOpCHBE8S7QuciVbIHVqeEc47RU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzXmw0co+LcfS5/PBDMNeCDw12mAjCKHf3D60iTWF2ptJhxJYj
	GkmLqlDDu+FlYJzn4g0pwSNB3+xLbu6prOUGdWzVckxd18tf3z09bK3dBQbWqEM57oI=
X-Gm-Gg: AYBFou1hhX+4fa/QquGWbxbsthvIJW7CzsE2YcabW8Ni84v0ynknZMDv6TYfsnbZMDA
	WXuJSZ/Zn+VbaQuXTa3m8UlTx+V4YB11D2dFiE3zp4jvs5KLaSrJPNglRrDvClzeTZGzflhKz5M
	f2C0zFZBuYARtpkpyFkrNe7nFULQyiAxXhOnFKzTTPZrvY3vfOnVwiz1U4N7ZOYQJNzPPoPAV2j
	ud4GOfRIyZuZ0OwEto4ABumiS5R5Zp71qYuPNw0soUhm5Ne/zP4K/FcXMiSMWhck4yN82i5H+mD
	GXr7PAp9KdgB9YyXX3et9FMGL62Fo+qVBEZCziupqSGbrJVx/ZBF7k7gQt827eEkiByp/8diLtq
	GfMyWQ1XZ/Bhxgq7TlvSKIfzfjgaX5+pi5KIHbQo9P2S1aVsanN61YczzhmJOVfO9COPpzMPeu5
	M7DcPA08EX7Hm5o6azGK6momHaP3NjLoLUHgdAFth5znqZMjl5jw5+oiYHMeiON5InmjKGKZpRD
	iMESFjKphZurcY=
X-Received: by 2002:a05:622a:2283:b0:533:8dbc:1fb5 with SMTP id d75a77b69052e-5359d6a1cd7mr244555751cf.4.1791987107502;
        Wed, 14 Oct 2026 07:11:47 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ba3d63c70sm34481076d6.43.2026.10.14.07.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:11:46 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: skbuff: make skb_copy_and_csum_bits() report
 unreadable frags
Date: Wed, 14 Oct 2026 14:04:45 +0000
Message-ID: <179198668564919.2.10323410751655182155@toxicpanda.com>
In-Reply-To: <20261014135154.05de968e@pumpkin>
References: <20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com>
 <20261014135154.05de968e@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, Oct 14, 2026 at 01:51:54PM +0100, David Laight wrote:
> Can't you use that fact that the csum function should only return
> either 0 or ~0 and use the other value to indicate an error.
>
> ISTR this coming up before with the 'copy_to/from_user_and_csum' code.

skb_copy_and_csum_bits() returns an unfolded __wsum starting from 0, so
0 is a valid result today.  It would work if it started from ~0 the way
csum_and_copy_from_user() does, since that doesn't change the folded
result and the sum can never come out as 0.

But this is one of those "you have to know the behavior of the function
to use it properly." Explicit errors are always better, it removes
ambiguity and creates cleaner and less error prone code. I'm happy to
change it to start with ~0 as well to add the extra protection, but
explicit errors are always best. Thanks,

Josef
