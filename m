Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6711FCF41
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393682; cv=none; b=V7RX449/XFEy7e1vT9GbKuCHz6dP5CHjBwrGXysbQtaMa3NkxqaijW5qox5axXMgxrvZMyvYgrr+QtO6a/woxICVqFQ4pLDWBjfOtI6MlrWpE7fWaxG5oTAIZiaAUeDRxwr02EE98VYA+BtQktipHCcZ5b9GJyV2pFx90w4BHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393682; c=relaxed/simple;
	bh=/ug1Z2+I/7/9KkF0qxyodAnWWFqdK3oh857MdPbdGF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/tB25Gm38Uwo1g28r4T6c2wYyTmEJHvtfuC7MqG6+bennLWva4++D56F02LQThRG01/sWi4YpLTvMhjnS4lW7G+UTbxMZt9SfEJGYFaInc81fJfDHVdi8PneZB+0E4gvg5MIGoRqRPVam8UWd7GD6Ua/BzghZDTOthu0E+0KAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExG1IEvw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExG1IEvw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso4554865e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788393679; x=1788998479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a+rMgzxIZCYE3X97ZXCU5Wap0gn6wnGpiJQ6Mt5cqyg=;
        b=ExG1IEvwz1/NfGx0A1DKm3xiibNAncJBxjV/szzEurRpLpl0MQeMmFhIevRU7snQL+
         qU3r/R+rxHv1oBa1YH2vYoCA+LnJPI8S1cqy83uxLkDeb9ui1gWeUOE776A3KxuvGO3a
         UWeq2CjgXISye9Ock6U0DBHbRjVlliBFWGgzXAt11MxhCu3jCIDdok2Qe4I6md31LqSi
         qPgAYhWZ+pbZ+G2k6macTL2PIxpYHx135ljzgerT00yspZK4r+PZ+2f8+1gRKz+CSKK+
         qGX/9tpkoSWCwCeRmMQl9YTKywJyBTRZ8ovm/klnQ7qEtW6Mh+LKN2UCBFEQUI8vKoSd
         hiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393679; x=1788998479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+rMgzxIZCYE3X97ZXCU5Wap0gn6wnGpiJQ6Mt5cqyg=;
        b=f0x+HpDE/h2Tvb2MnJziLm32oa/iO6N5ePYfGzmiullzfYV2RXVWAiRE5zKuItuspL
         EoAXZA3CPmOEzJtujXRw88/+7DKPpmQalBf2HonzRSApd0szEJspUN4ZODcb3+B8xKb0
         wMTb+9J+O5kZlV46n2Vu9RaZ+JbqQ6FZycH+ATF521+66ZU8VFqatkimwAxLfwHvHc13
         qvSOlk3NzO/FJJLNi7FEy8i9KijY44hTLJJBwsdxLdlQ1uLKYgjbcl3zAzeGutDNP/ra
         o6Uae29Z/1DTatDkbgCpuMTpI+CPz6Y2TyR4FhC/U5yjJJZCEj4RJZa8OZPSGhWf13sC
         A0WA==
X-Forwarded-Encrypted: i=1; AKwUvBx/9uA1TwedgcbMFNA33M+sxBiDKybxP2fK9i9TDXDLnrweqgrlSiFZz7ZW7McU6Eb5HSgeL7+wHzWXab8=@vger.kernel.org
X-Gm-Message-State: AFuF++nTnXMj6ZLS0Y71YshekxrQiorJRCREk5cxgRX7XxxUHfvChvFu
	g0FADzSQBuc9tPHrSMWPxoeaw9bs1+6+iK8YbYBMjRP1DSCufZae/Gig
X-Gm-Gg: AYBFou1jt90Dtl9umyubjwJOGacl4OWfzdrY6ykr5Y7/4TzaRfqdosBlKxLwLOfO2CT
	FeUP6ZDElFupkdkzkVzUYkZpcterRNic7fMWGB7/HsDTqbBGPpwF1F1niUbbvIXqqFUpWRf2sNL
	dV+uS0CJzfmtxuaF5FbzjyqDbl7Q+mLM7ROpEXz1GlFwDnkGuTulvuhmL0P/BBqIQgl+DHB8Yra
	JYhn45GY3CoJb0umUSiRuLTNohg0hNTTXjHp5CkbCAqIWxPl9mwQsnTtIn6bSW9z9cGCy644gM9
	Hc9vWyCP36wvM09w1f76du+6L5Lcr7T7gQwQSbmFN1OLg099gsE4W/DDf0dy2/mBxq4DlbgsHR8
	N0MvZb5x34JtH/Db6jK3Fj/GbeER5oow5ZQlkiREI8IGQl1jOxitM3al18yCGb8zMuBB3qzHz1e
	5HFy6Zhpgjz1/f+HdFpKY6+D03f4JEJ5TrxKqU1sizWDHv9Ks3syyJjliTkLo6rnznT9TMxhown
	xiR9HPAzwbLswtEkk1qx1xUXSSX77AOlKL51yb94tglXQdxGG4KC36gDZP7eKhWL9uKSAHR7Cfb
	uAoHqPHgVCkGPmTxTlROQ9cQXl7iFCYBSD7G3S3WMYrpRUo+JWZRQQRfgQ+dhWN50/TM4SjKSZS
	rQqe1
X-Received: by 2002:a05:600c:ac8:b0:49c:f13d:ffef with SMTP id 5b1f17b1804b1-49cf13e05ffmr2151795e9.19.1788393679115;
        Wed, 02 Sep 2026 17:01:19 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a1c2-c401-11b2-c123-0d12-6c0f.310.pool.telefonica.de. [2a02:3100:a1c2:c401:11b2:c123:d12:6c0f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm9115290f8f.36.2026.09.02.17.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 17:01:18 -0700 (PDT)
Date: Thu, 3 Sep 2026 02:01:16 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mukul Sikka <mukul.sikka@broadcom.com>, Keerthana K <keerthana.kalyanasundaram@broadcom.com>, 
	Stefano Brivio <sbrivio@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>, Bin Lan <lanbincn@139.com>, XiaoHua Wang <561399680@139.com>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y 6.6.y] netfilter: nft_set_pipapo: restore cloned
 mapping table memcg accounting
Message-ID: <api29LfuC8U_RRUw@gmail.com>
References: <20260831194905.45045-1-kmehltretter@gmail.com>
 <20260902-daily-reply-0014-pipapo-fixes-tag-ack@kernel.org>
 <apitu8BYUvG-WJt2@chamomile>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apitu8BYUvG-WJt2@chamomile>

On Thu, Sep 03, 2026 at 01:14:03AM +0100, Pablo Neira Ayuso wrote:
> On Wed, Sep 02, 2026 at 06:14:13PM -0400, Sasha Levin wrote:
> > 
> > Whatever Pablo prefers :)
> 
> I am fine either way. I just got confused with the double Fixes: tag
> that point to the -stable tree commit hash (if I understood correctly
> after Karl's explaination).

Thanks, I'll leave this submission as is.

If there's a similar fix in the future, I will probably split it to make it
more clear.

Karl
