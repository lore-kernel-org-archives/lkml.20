Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054FB430797
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492328; cv=none; b=r+keiObXx2JwtUuJoto9FIqh9mcoAsLUL4C8FgpC9gmn1UklBkw2SeOe00qc1jPINHgZtkzH9uXGxp9Wd5poGiHP1UbVo9bEm9rDZs9xquv2/4aF1FqnqUDP8r0R2G49ZIckGa4oiyuGnL56Tba2/kE5L/DrzSb35z2lP9AJUGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492328; c=relaxed/simple;
	bh=Ar50DIJIwcExT1ZRSJD/v5WeHuSpaiWekI1I0rTSM7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD7ZZirQpV3R+1/89Ov5BcpJDGdBgJc23emh+QVPBD5itVSiuJDEMCffe92tcwmwDdTZsY03ilr622TfGnNgxKLWsh/0DoYR7G/Bs6HIQI4D2Y/tIDY37kgKuLNOyqRdlKO0E/9sC/M2iGqwodgIU9fq+CJ0bpzOa1ORtwAuPoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rPpBF/tD; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rPpBF/tD"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530de452c33so43316531cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789492326; x=1790097126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uS2ss2dRiKmKR68mKWZI7ZnqjRyXAQoUa35bmbT36M4=;
        b=rPpBF/tDepfYNzodihDvHjo4xMXpo3zJLc+VkDFvxFCcRj9lDn1d5EQoo4fIOyjTO2
         ssccakFpJdH9rIVG1ZMAbsFGuVpLRum1F3B11VBeAope73LSOyziQNd3123Ko/Hhk1PL
         3ecxrh80TVL9fXYn2xnZWmqu7PFcBpNh/5Ws1flqHS9faWzfhWlEl8nHqGWAmzho5EyJ
         EAd+qJK7dv8+87VW4gCKSbuZLPET/lzEXbJLS641Ji//Z4/Hfcowv4/YS9/CadmrW1mt
         6cChpBo/FoO44uRCSNIFmhePkYINk9R4sWWv/AqU+say6lZ+xUP3n9tEyZ1y6BOJpF4J
         vspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492326; x=1790097126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS2ss2dRiKmKR68mKWZI7ZnqjRyXAQoUa35bmbT36M4=;
        b=UiAVDrjvToF5clgHE7aEmGTuvkMuiUAV/0fZvTHx5Tiq1PeAr0IYgovzQp3bm5MhmP
         xZqy6eHumcMRSLCVihe+sQ1xmABVPNQFdta96OtfZxN4rq72fgWbifBbPNdo75l+rVWC
         rH8IKOBi0fguIhY6RtVY+7ZrYesM5bC1pNHsi0Iqivr/n4yPsETSABWU2lgbHHH+WV4m
         cQ/V+icmJxEIxKmdof4taorqgIFb8CBvmbQoXHjRYGC5z0epafN7040aFf3jHA8RYGSG
         WN40y2irZSR9vVNYm4xnbf0hwEPFCy2gLhik+LnC91KQhP3o+5v0VZb19ZPYcF3M3fya
         ejBQ==
X-Forwarded-Encrypted: i=1; AKwUvByc1x34IFItmGllzPwfxwWpk92X0UCIw0T8qHoqnVxPgTBnt9Jgv62TaL+9KJDRVtRBIJ9yxFcC1dNd7K8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2dMGJPG5w7Naor+sPGm7WGLw3DwyDSAvhzMa+GVD2l6C59+m1
	hTHnfQvClcUya29bYU8emm1wU2CK6EU26SyB7dhQlAvAHDQFIcv0O7CJfnxO1b0EUl4=
X-Gm-Gg: AYBFou0CNx/DgTFfCVPssRmY9p9JjA+E+ZRJWtq53hEgWCQ9li7Wr3gRCWhfSxyRF1w
	hpEcmUVvzcTnPrgRpDit+/JKP5Tq/qp4Wda95Tn1jeJnjluU9Rl92qyWGjcU6J2bpFxz2lOJNlL
	Q8pwoAlp8HLNGmyMsL34f//vvAqbG53AFTwVZLNOHnJuTExG3+oVgyFeOn4HhFhz/HpjMeWB055
	vy8Ez30n6dPPabTsNMX7fJfj8XMPddXwzy0Fv0RgbSlPF9eJk1Thxc9B7OvrDXJxC92WaVU2het
	lNHqvSfDkHdThl40IiAlpBTsuFOrg2WWJ5bAouLp8kU7cH6KFFJeZ2fb5TaZwhx7plhYf3+jOhC
	IX8ZR8D4mInQmuQtRMciYkvJy8BPknxaTnjlw5utaPYUhNDUZUKuJMT3Wu27qvibsgmwW/rtwoO
	NaSXvV+qRPmq7ZsNRQdRMCCEavEn6Cj+H+jY8a/lSDRIkbDZuewI5Xb1oJcWbc5PVM+HM42gRDL
	ONCbfPMu3wVcTamQQq2+5yFk9CYMEZ034d6+Ms7VAFB1zqJEl+wjZY=
X-Received: by 2002:a05:622a:8c0a:b0:531:d7d:64ea with SMTP id d75a77b69052e-5310d7d657fmr98074341cf.26.1789492325495;
        Tue, 15 Sep 2026 10:12:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm136165741cf.16.2026.09.15.10.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:12:05 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:12:03 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, wangjiexun@tinylab.org, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aql65IhMobL5Al9B@gourry-fedora-PF4VCD3F>
References: <20260912110832.3203902-1-gourry@gourry.net>
 <aqloB0zm3RjJ47m1@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqloB0zm3RjJ47m1@gremlin>

On Tue, Sep 15, 2026 at 04:55:47PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Sat, Sep 12, 2026 at 07:08:32AM -0400, Gregory Price wrote:
> > MADV_PAGEOUT collects isolated folios on a local list before reclaiming
> > them after the PTE walk.  The reschedule path drops the PTE lock and then
> > restarts the mapping with pte_offset_map_lock().
> 
> Is this reschedule path even necessary? It's pretty bloody sketchy.
> 
> I thought the modern approach (TM) was to not do cond_resched() and friends so
> can we actually look at removing this?
> 

Sorry - meant to reply to this.

Honestly there's so much jammed into this function i can't give you a
straight answer. I can take a short detour to figure out if we can
rework this as a whole.

~Gregory
