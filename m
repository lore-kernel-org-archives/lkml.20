Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855125;
	b=b9PYtDCHChw3aJocN/2ShLlCO+mGJhsAOk3pQ2LGx1bVc43EPTEaAfU+pQ4I95ARFq8E
	 0ZBJF+dG705fHVb6P6gkT6SEg+nYUZcNSUsIme+3MLii8Syi7v0UjeXBvQkR9pSxlbSrD
	 YpTl5DrT6arHsHHtP3C+LIZXex5HoFzl6mlceod9aqOv7B3Rjo4Ml7UKa8cW4T9ppfuJy
	 K4YBuulr3eMqsiZ+lj5UIYdbvEZfRcdWzkw0we74kkdXHdl+J9PcQd/igGZuAeYc5o+gE
	 NuB2vnHt9bJnU8uGEgiNvYk2OGxnu4N+ymMUNeKJLbTHI5fKWnxnFycDEVzfd7/DQBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mGyyLkfMtTuuKs4xriRESG+abVUcpds9iYOPA5vDlKw=;
	b=Hk1euSvTMr7BxIZ3MQcyTmca5cKt5ugTMCeyTx4hAi2remb3UCRbqX3ramgD1eirpKCg
	 +jxzRv9iSB/zDAS8tRgs9g1JXoLSR3Npn2hBjT2z3eIbCJUTrAhuxVrxrQ6gPl0N6FEFC
	 q1mtxpw56uumSJJAwSuOJufbFwG8xgSPo65W4bis34B+2zPMcP40hwuVRGL/aeNPe9Cch
	 QmIGEtavtM2oVjphOGD5HhtXEK7EJkgZGho8U5diFczGHjRK/rNif093tH6pAiWZHZU8e
	 dtAquHuupQ9YTlA2t7LwN6zUJcvqYSGRkJRBR9mIlgo2PDLssw7I0mN5EO+IuBODP0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CNrOJBFv;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D8C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CNrOJBFv
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so39447eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793855124; x=1794459924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGyyLkfMtTuuKs4xriRESG+abVUcpds9iYOPA5vDlKw=;
        b=CNrOJBFvIQS09wflU2f5Qg9k7gNS1rJM7wAEsKeL64gdDdK8c4vkEnHs4szatfpUsz
         wpHxgx9YA+y54KKAeOOcAoKZi3TGX56AgOlUDqvWpn7Cb5rfg1gBEFxoT/CQzib6GVZt
         9yzmfafam4JICM8VASuHGDl3lhZvAttVyYmQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855124; x=1794459924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGyyLkfMtTuuKs4xriRESG+abVUcpds9iYOPA5vDlKw=;
        b=pCJK+wS1n3stvWtsubu+bk/8BS3Vb4xC/I7LgByJvlexbOAWmYToDMzUXzwzpVGHS4
         /jBFcOn2Jw+pgEWcmHIscL+FFBxpEdnoEQ3gLrt+dgb5I9Ss0chs3UYIrqd1bIcfRcwt
         mBNBPvfSgFkQ4Sn2ELGBu3kFQ7BKs4DwnI0FUuLQetBO4oeGS1jNtBRCcol6imL2vWEA
         Ul/Lfl/a0kxGUj+fKW942u7Z6ANnz63LBiEYaw8Ttv8bUx6JorFr5yUlRo8Z/2/qe8UD
         VUdPgvzcYtoZrnS80nw4E7cWVXK/eAVBrjQT/So+QhcZFdH+ZDczaf5rQss3gutdBNQX
         Y1IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPcP1bkzCId8TunzUmujD1s31SLoFPyXYNgwqUbo5NnmZh63/cKGedlgk3x13GJA+1Pv21v6vCkZHVyY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FzzoT3L9U5LMstSsxydcsBTx3K69jUn0WeJnJq+EpTWMuBsLM
	fRkAMEmJ/A0TGtjkI9QxUWxP6AmjOqfhBkmPqQxLYbHn1laufmoz6b09pEyVwEoT/w==
X-Gm-Gg: AYBFou2bzo1wETWOou/AFq33RhVrTxKfbmn5KyLClXHxzVzp3LuLaEUoDNuhjy8h3bn
	p2l0OUQcqqSOe2zn8vzwElIxAE9aQuYu4A24WI9dUH5TgiqyUmFPRlJlc2p7d4B0T/SYyYAIKeR
	cXTVQSn9wuUsgEzYTnBycEA40/S7RYdK5BSqS91x5NZxqJVmAi7PF12+kYCLEeWOMJVBYI84y7U
	TOWCpAPRfifaktqoHRBW2NoR9T4TODsHw/LflnsPDvpSpFTNR7jKVLfApgtvnERMIDaZqDswLnd
	4K62bIa7+Voecf+Zwn4QQfBLJkz5U8REBky7L20eWrfioFUhxF7cSvjkVgagomYRly2NhEoFrWd
	EC+kogbc2D0sSfTHXVys+aqLi9WDj5My6dj3n5U0ntRkDAFT/3Mn2DwVXm4vu0jX/7tyfGxyzZ2
	VDeFo/d558D82dBTtZbhlKNwg303hNe2gr9l60VPcGrmrZESm+RvG3U8euPlAGJ3mVIgX2S+mWt
	nGdc3vgyRUOHvw387+G0jocPsZ/tqnYz7dg7XFkEjA5fkE/bBPkGm4EYze0Cr7jEoP/vpfk9Pnq
	mcBK9MVKHbXhygvKnvDo0hPN+e95JSYcknEIjUZSqlSD9c7l83IgmZ0gyU+qM54CX3ZGPA==
X-Received: by 2002:a05:693c:20c9:20b0:351:245b:d1e7 with SMTP id 5a478bee46e88-36a42061e10mr23766914eec.0.1793855123743;
        Wed, 04 Nov 2026 21:05:23 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:37bc:b763:7ec7:65b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dad72dc52sm5463602eec.0.2026.11.04.21.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:05:23 -0800 (PST)
Date: Thu, 5 Nov 2026 14:05:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Chris Wiseman <chriswiseman@google.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <auwOBaRtM9p_Wxfx@google.com>
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com>
 <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179384102494.19062.12740032892044628762.b4-reply@b4>

On (26/11/05 09:10), Xueyuan Chen wrote:
[..]
> > SGTM, but I'll let Sergey chime in!
> 
> Thanks, Nhat and Chris, for the discussion.
> 
> If Sergey has no objections, I'd be happy to send a follow-up series
> to make the shrinker configurable and add the unlocked pre-check as
> Nhat suggested.

Thanks.  Sounds like you and Chris will to have "Rock-Paper-Scissors"
to determine who sends a oatch ;)  Just joking, let's first figure
out how exactly we want that zsmalloc-shrinker thing to behave wrt
zswap expectations.
