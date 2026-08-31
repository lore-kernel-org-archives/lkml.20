Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F33A961A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218141; cv=none; b=nkOZkGE4ZKRfmKho5G1VGDXf+IUCQjz2EnLpQs2IwERFftYW9nogY0wtDGDu9NiqsonUNIfAjWjmNTgQOyugMcbgLze0LoW4QRdo1wPkk5TJRzMGbSRBKacqAhW0niqWxpjiI7o8GiUYOQmQXY0ZDZFX5Jy8gnn7vA4E+G6S9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218141; c=relaxed/simple;
	bh=nLjNT1G5JUYYPrhknY0eB9x0ZjckXKrDo9yhKokRjVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhHiJsMWUXmkQ9Hknju+FuS9KefZF3IeVtbFfLJAGJLTQPxvIXx/3QgXAhPP+34yQ/ayklXzhgT+2hTbZS8F7YO8Pv8cZLAd7FKlElZuuIetnLLGOLWT2mJePAAFVLtRorZe7PUt6TYyrZxe2x7UV9f+27NDEajuhPwnrfnHI4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDowiLX+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDowiLX+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495437bb891so3640355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218137; x=1788822937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Cbbg1ZOVRL0U5f2uy8yCobIVDqIxQsXjzjOSTe5SUM=;
        b=NDowiLX+9lFsVlgSpsbSBI75OdoGWkBcd3+W3sPqomHUJpEOngiZS3JDPCNK1zCk4D
         PcT9p7Nna0HxKYETKWidlLgKKejGVXkefLQCYsmapqoXMMXjOwnN/bL19XZlsyqt44Ao
         iAzD2ha+jTDygPTOv/mws4TcV37rJ4rQJo+0hg4NJn5xqvKQq9rqFtypGeCFvGNYL9yf
         wL4rQSduJCopY8p2S0Oet+5tRnKQoH5kWpK4ERvz2J53riqnNK6rp+mSgeWsn6KLmSh8
         4LbJUyeF8HWyWUKI6vTvLDaOC2J31Wmjjr7D0Bvn1WXm3mFpepcxRKG3saI/T19WDCC+
         VQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218137; x=1788822937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Cbbg1ZOVRL0U5f2uy8yCobIVDqIxQsXjzjOSTe5SUM=;
        b=tUgnoFJoKOMI9KX2L82p0kwZPRDKF1tZkEPinCwu4lpq9YshjRQKximGqPZuDLP9QJ
         EiZNCXhvVZF+YYGJwO851xOjnmXD24FlPuZ5xsraWXFvjBEA3F4SzggjNcy6NfQaNp7g
         5mqcsgFIgJyTdsg/MhEosnWRpQmVPO/Dz+MuBLCKxDvg2AiLDld7yvCVdDILMn9TGUdb
         wEQ1BYHlo7ezbPzyFFpIgZlgcjTgqtMkuocOFmv8+24hh+kUXRana45R/SrzeVBgsxLk
         VzAiH9YHkX7bGgUbMNiszm0mCOoVxGNGs5gD3L8/LbPrU+SLNDOGJldoPdPgmA0/yfw1
         /SGg==
X-Forwarded-Encrypted: i=1; AHgh+RprAXppb23EZDLH7Ko7htUitnuJSMulfAYPBg/3JWbpR7uUFoKcTlPEGEPfahMah8W3aDgMOxJVsqJ6vbE=@vger.kernel.org
X-Gm-Message-State: AFuF++m0jtRyPnE6f7xWNJfGXdciGClpG3DQ9WVMyLfdQJ+9rn7K9i22
	SEHR7GzCI0spCvHsapOMq+IqXqkD7l9NrJUBhfPimNc1iE77zSwa7Q1E
X-Gm-Gg: AR+sD13Ol87YMgzTTJytC1bRLWzq0vMsoyW3q4gMg7RdRd0bWkeSCQw872Sed6CyAx2
	gFNuWSSnh3iYtbbV92u9hqKgimqRVp6V+KjS7CdJY3FDYKvm97QhOOBgNiF1yS2N2745JhHNCrl
	CV5+hDCZZJt0b7mDDARn7ychmCtSSfpsSKBRoAfSqoauNPUzyp7a2b702sX3yPRDlnp7Pga4oDN
	7eFUhKnIT/KjDjJnwJRe5cwm1l+npRAsr9dVDaYaK0eSVOZGxtIDFOqrk6i+LsvZcyysCv9b3ZX
	4XejL1hSwSzggX7H4TfrsCG5shb+NCi8Y29w54oDQZya63Kfy6Yio5ahJYsIExRUUbxvbNr//1U
	hKnXM0spGbR870w1fO59IOF3U5cH8f1W/Wa03ZW19HvMX9RVTiblHOVufOfKeUyUyRoxwYndCb/
	PQx42DXYG/abTKCj8Nl1OS0xxg5+ZRUO59y3EZ2mLedGpR5DGkBV28Ualia+OUv844T1rc24faL
	IiRNTjmWJxpeeC6If0h7Eftw3y3n97c1hRNYo7xgqm12A85D3SHOwhP6NH7oR38iI/AMH0jrEtA
	FYzDMcNVkggEijpDIMSJNpwcHoSNl8VIq8Iz63aun2CzxXiD9OIwTk/GGtPb2jo=
X-Received: by 2002:a05:600c:6819:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cdd41ca5amr23361785e9.6.1788218137195;
        Mon, 31 Aug 2026 16:15:37 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e9cfsm957147f8f.22.2026.08.31.16.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:15:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 01:15:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org, Florian Westphal <fw@strlen.de>, 
	Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mukul Sikka <mukul.sikka@broadcom.com>, Keerthana K <keerthana.kalyanasundaram@broadcom.com>, 
	Stefano Brivio <sbrivio@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>, Bin Lan <lanbincn@139.com>, XiaoHua Wang <561399680@139.com>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y 6.6.y] netfilter: nft_set_pipapo: restore cloned
 mapping table memcg accounting
Message-ID: <apYKQbvpIWvY8Jqi@gmail.com>
References: <20260831194905.45045-1-kmehltretter@gmail.com>
 <apX9AZoNkpVrBMIE@chamomile>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apX9AZoNkpVrBMIE@chamomile>

On Tue, Sep 01, 2026 at 12:15:29AM +0100, Pablo Neira Ayuso wrote:
> > 
> > Fixes: a4983e89e3b1 ("netfilter: nft_set_pipapo: do not rely on ZERO_SIZE_PTR")
> > Fixes: 32bad10de347 ("netfilter: nft_set_pipapo: do not rely on ZERO_SIZE_PTR")
> 
> This two Fixes: tag do not make any sense to me.

The two Fixes tags are for the two stable branches:

- a4983e89e3b1 is the 6.1.y backport
- 32bad10de347 is the 6.6.y backport

Both backports changed this allocation from GFP_KERNEL_ACCOUNT back to
GFP_KERNEL, which introduced the regression. The accounting was correct
before these commits.

I used one Fixes tag for each target tree. I am not sure what the usual
preference is here: one common patch with both Fixes tags, or separate
patches for each tree. Which do you prefer?

Thanks,
Karl
