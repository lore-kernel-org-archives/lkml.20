Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9294D4876
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888801; cv=none; b=YPos/D00drAwWhY41XyB/LHdJ9vAJq4eDcUb9JQwqqrQRAO+ynLO0sx7wIAbyTsyicoL8TZ0sL2DNF39MGSWME76hAGhgZyR/dT5zzfE3RzARRAnCU1ih7n9aMUXlZqEiWiCimnuZuQ98ckQ5hjb/JDWkHUWskIrGZhtAA9MC0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888801; c=relaxed/simple;
	bh=OeqZFh2AYWYR7ltZDBpLKceGFxH4LNQaJv7496x0jRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmGoz40i9MU9+rMPdwuLqztuP3vX1SC7lAa9/bBU9QYZLUIKNn4/g1gN3rEG88xQXWCZdx8K3GmNaHgkYSqd9snX39pN5qNIRLhJnVSTpLRrO5/WXx/Cwh68dJp6oZrx1m/JKq3OaDbd9pGhAKYxPChdi2Yz+bWqRyG9jiAtG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIrt/bvi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIrt/bvi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2690901f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888798; x=1792493598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=weAsaaLz8bOtBYNYCdIRoGplN8xEUwEYdEIJVgSddI8=;
        b=LIrt/bviJxfsvKM6143rYC+2KkjxJ8T9A+LufpnasZYVShIj/U+suM+7r8v8TFekwG
         P6ADJd8PK93PKdUBDHaYgBrBeqipIlR2aD/E7Hf6xc1X2b96aJE86EZr1OG9k+hcGf+M
         cMn+zq5/Or7okg66GhzkWsCvATRFrEivWxe+lD8TCTamnGf+OZZgoOznmtDbTgqCI4zc
         WUT72SPO30beijLx42R5yFax2OlTUQ/dRoVTZBPnixTKO/QGfzpbRkC8oGNWUvD7Dzr/
         2c42XKvaOZxUMZuAliL17/rGunUwJGeb9oiPXHhZwFcCG/wuVzmCnePRr85lnGD0QNSL
         G1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888798; x=1792493598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=weAsaaLz8bOtBYNYCdIRoGplN8xEUwEYdEIJVgSddI8=;
        b=RChkt21TUHRXpoQqQUX5krLunll7AxTypnFKZQ8LYQIobvnH6rEmdipIBXKKPKQ9QF
         zd6kcGy+eMDZdWW0vsrfC0yBhNpDG0AVrnJLMtazUV9ZOXEWBiOfm/npDBEw5OCAlZef
         9jqxPBa0XRckYVf8uC3Q6MIwjLWmHeMb/7qWHINzsSC3+L6IwvYD+G2JxpZOOXC+zSvH
         jgQjGK+B04xKMeHBoK/nUOfyZ1cTFRrfLrBKpXJIE1vktOfRR95dEnOEMP7pL7QmOP5p
         LzIVRNX0JyeyCKZkNgg9j07+XjOGS6ONdF34ilnlzhnqNYRI4SFykCcuxlljtZO7U9kO
         dC5A==
X-Forwarded-Encrypted: i=1; AKwUvBzC/9JIUKDNeYCCdgQUpt4b1nvYyH0/y8nefqVF038bMc++bkrTEtNzaBsMI+BcEDuYIu3P2lutkgsG9Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIllx+HWBiztCuPJwavaXdo7UdGEyJQYxUHIh2PsDp/T2Uxiqcl
	qKEiVovnrBCA6SPcBMGWfTEWMZh0n2XjJk8WyEMHPAK0+yi0pIM/k8XR
X-Gm-Gg: AYBFou0XYquyS9uUZBGpmvpWF+DNZmDRYOja5AVLupMIQ3Jrm/xK7Hd/4qSqjgMn5Yc
	plt1g4KFzHlii1xZKKvhhd/xF7C3k2XXXeYAQaxRt8Ta1njC1muup1fEh1Si2o7k/QLx6KspJSC
	9OLlS4nqiCznX+DB81CVo1GaeS51GtScZL9NELLfuTSepSka+OdubNogjLiaRpGVTk39NP4O6Lf
	YplaeaBvSyL3SvF0+cokTNISRBHQGjMubbD6whzL6Bn1ovgkzGt29qlzKaaFIDsy9MKKa6koTbh
	I80nzT+c3SdX5dmhM5fOZiF1rlNc4yhpCFEw5bro6SGZoscE1cCUqoAyi2mUNjw/Uiz/kiahcdf
	Xml11kKeNC4lZUE2lNO0GGA0q3wuvc7X6mLYH9biaxKBlziLMWaxQEBZxiGo2mp+x9GzAO3mzLI
	ZERvifLONeo3k1sgBZwCLvsB6C3suKczJs9++87iayDygGMqDnoiRr5VeTpBB/pdz9nTcBrhr1K
	0c3XUV0QrMjcAy6Q+sW7hfKQObsnnHESqtOrO4Nm9n7Wg==
X-Received: by 2002:a05:600c:138a:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a18e4c85fdmr257515105e9.34.1791888798168;
        Tue, 13 Oct 2026 03:53:18 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm507133205e9.6.2026.10.13.03.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:53:17 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] rtnetlink: comment the RCU and SRCU waits in unregister paths
Date: Tue, 13 Oct 2026 12:52:58 +0200
Message-ID: <20261013105301.9037-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAAVpQUAd4QzUDK1wZYpuHJbMSg+PwAGCcaTzayR40DTNkXdwQA@mail.gmail.com>
References: <20261008124423.11543-1-parri.andrea@gmail.com> <CAAVpQUAd4QzUDK1wZYpuHJbMSg+PwAGCcaTzayR40DTNkXdwQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 12, 2026 at 06:48:22PM -0700, Kuniyuki Iwashima wrote:
> > +       /* Wait for rtnl_get_link() callers under RCU that may still
> > +        * dereference tab.
> > +        */
> >         synchronize_net();
>
> More specifically, this only applies to callers before try_module_get().

Right, the later lookup in rtnetlink_rcv_msg() runs under RTNL.  I'll
name rtnetlink_rcv_msg() and try_module_get() in v2.


> > +       /* Wait for rtnl_link_ops_get() callers to call rtnl_link_ops_put(). */
> >         synchronize_srcu(&ops->srcu);
>
> I think we don't need comment for srcu as the relation is
> clear via the argument.

Agreed, I'll drop both srcu comments.


> > +       /* Wait for RCU walkers of rtnl_af_ops, including rtnl_af_lookup()
> > +        * readers that found ops but have not yet taken ops->srcu.
> > +        */
>
> this can be simply /* see rtnl_link_unregister() */ instead of duplicating
> comments.

The two waits cover different readers, though.  Besides
rtnl_af_lookup(), the synchronize_rcu() in rtnl_af_unregister() also
waits for the RCU walkers of rtnl_af_ops that invoke callbacks without
ops->srcu: rtnl_link_get_af_size(), rtnl_fill_link_af() and the
IFLA_STATS_AF_SPEC paths.  link_ops has no analogous RCU-only list
walkers, so a pointer there would miss them.  I'd prefer to keep a
local comment, reworded in v2 to mention those walkers.

Thanks,
  Andrea
